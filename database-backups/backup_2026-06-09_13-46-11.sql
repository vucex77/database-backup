--
-- PostgreSQL database dump
--

\restrict 9PQx1PTEImjFcenOjlrgI5b5reOJaiHq8kI90glrUiFzsHp1FXRDKoREg5C6gJE

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Kullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kullanicilar" (
    "Id" integer NOT NULL,
    "KullaniciAdi" text NOT NULL,
    "Sifre" text NOT NULL,
    "Rol" text DEFAULT 'DepoPersoneli'::text NOT NULL,
    "SonGiris" timestamp with time zone,
    "AktifOturum" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Kullanicilar" OWNER TO postgres;

--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kullanicilar_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Kullanicilar_Id_seq" OWNER TO postgres;

--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kullanicilar_Id_seq" OWNED BY public."Kullanicilar"."Id";


--
-- Name: StokHareketleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StokHareketleri" (
    "Id" integer NOT NULL,
    "Tarih" text NOT NULL,
    "KullaniciAdi" text NOT NULL,
    "UrunId" integer NOT NULL,
    "UrunAdi" text NOT NULL,
    "EskiStok" integer NOT NULL,
    "YeniStok" integer NOT NULL,
    "Fark" integer NOT NULL
);


ALTER TABLE public."StokHareketleri" OWNER TO postgres;

--
-- Name: StokHareketleri_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StokHareketleri_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StokHareketleri_Id_seq" OWNER TO postgres;

--
-- Name: StokHareketleri_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StokHareketleri_Id_seq" OWNED BY public."StokHareketleri"."Id";


--
-- Name: Urunler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Urunler" (
    "Id" integer NOT NULL,
    "UrunCinsi" text,
    "Material" text,
    "Grade" text,
    "Thickness" text,
    "Width" text,
    "Length" text,
    "Stok" integer DEFAULT 0 NOT NULL,
    "Customer" text,
    "Certificate" text,
    "Batch" text,
    "Heat" text,
    "Parent" text,
    "EklenmeTarihi" text,
    "LowStockLimit" integer DEFAULT '-1'::integer NOT NULL,
    "SertifikaPdf" bytea,
    "SertifikaDosyaAdi" text
);


ALTER TABLE public."Urunler" OWNER TO postgres;

--
-- Name: Urunler_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Urunler_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Urunler_Id_seq" OWNER TO postgres;

--
-- Name: Urunler_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Urunler_Id_seq" OWNED BY public."Urunler"."Id";


--
-- Name: Kullanicilar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Kullanicilar_Id_seq"'::regclass);


--
-- Name: StokHareketleri Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StokHareketleri" ALTER COLUMN "Id" SET DEFAULT nextval('public."StokHareketleri_Id_seq"'::regclass);


--
-- Name: Urunler Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urunler" ALTER COLUMN "Id" SET DEFAULT nextval('public."Urunler_Id_seq"'::regclass);


--
-- Data for Name: Kullanicilar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kullanicilar" ("Id", "KullaniciAdi", "Sifre", "Rol", "SonGiris", "AktifOturum") FROM stdin;
4	goksu	1234	Muhendis	\N	f
1	emir	1234	DepoPersoneli	2026-06-09 12:58:27.955676+00	f
3	anil	1234	Muhendis	2026-06-09 13:01:38.310239+00	f
2	barkan	1234	DepoPersoneli	2026-06-09 13:04:00.187014+00	f
31	erim	1111	Muhendis	2026-06-09 13:11:57.485065+00	f
5	admin	admin	Admin	2026-06-09 13:08:08.538269+00	f
\.


--
-- Data for Name: StokHareketleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."StokHareketleri" ("Id", "Tarih", "KullaniciAdi", "UrunId", "UrunAdi", "EskiStok", "YeniStok", "Fark") FROM stdin;
1	2026-06-09 14:47:50	admin	1	123	0	123	123
2	2026-06-09 14:56:46	admin	2	54545	0	1000	1000
3	2026-06-09 15:19:36	barkan	3	boru	0	1500	1500
4	2026-06-09 15:29:30	emir	4	demir	0	1000	1000
\.


--
-- Data for Name: Urunler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Urunler" ("Id", "UrunCinsi", "Material", "Grade", "Thickness", "Width", "Length", "Stok", "Customer", "Certificate", "Batch", "Heat", "Parent", "EklenmeTarihi", "LowStockLimit", "SertifikaPdf", "SertifikaDosyaAdi") FROM stdin;
2	54545	54545	454	54	8	48	1000	resan	123	5454	45	545	09.06.2026 14:56	-1	\N	\N
3	boru	boru	220	35	50	45	1500	barki	22334	113344	200	23	09.06.2026 15:19	50	\\x255044462d312e330a25938c8b9e205265706f72744c61622047656e6572617465642050444620646f63756d656e7420687474703a2f2f7777772e7265706f72746c61622e636f6d0a312030206f626a0a3c3c0a2f4631203220302052202f4632203320302052202f46332034203020520a3e3e0a656e646f626a0a322030206f626a0a3c3c0a2f42617365466f6e74202f48656c766574696361202f456e636f64696e67202f57696e416e7369456e636f64696e67202f4e616d65202f4631202f53756274797065202f5479706531202f54797065202f466f6e740a3e3e0a656e646f626a0a332030206f626a0a3c3c0a2f42617365466f6e74202f54696d65732d526f6d616e202f456e636f64696e67202f57696e416e7369456e636f64696e67202f4e616d65202f4632202f53756274797065202f5479706531202f54797065202f466f6e740a3e3e0a656e646f626a0a342030206f626a0a3c3c0a2f42617365466f6e74202f5a61706644696e6762617473202f4e616d65202f4633202f53756274797065202f5479706531202f54797065202f466f6e740a3e3e0a656e646f626a0a352030206f626a0a3c3c0a2f436f6e74656e7473203920302052202f4d65646961426f78205b20302030203539352e32373536203834312e38383938205d202f506172656e74203820302052202f5265736f7572636573203c3c0a2f466f6e74203120302052202f50726f63536574205b202f504446202f54657874202f496d61676542202f496d61676543202f496d61676549205d0a3e3e202f526f746174652030202f5472616e73203c3c0a0a3e3e200a20202f54797065202f506167650a3e3e0a656e646f626a0a362030206f626a0a3c3c0a2f506167654d6f6465202f5573654e6f6e65202f5061676573203820302052202f54797065202f436174616c6f670a3e3e0a656e646f626a0a372030206f626a0a3c3c0a2f417574686f722028616e6f6e796d6f757329202f4372656174696f6e446174652028443a32303235313132313038353634392b30302730302729202f43726561746f7220285265706f72744c616220504446204c696272617279202d207777772e7265706f72746c61622e636f6d29202f4b6579776f726473202829202f4d6f64446174652028443a32303235313132313038353634392b30302730302729202f50726f647563657220285265706f72744c616220504446204c696272617279202d207777772e7265706f72746c61622e636f6d29200a20202f5375626a6563742028756e73706563696669656429202f5469746c652028756e7469746c656429202f54726170706564202f46616c73650a3e3e0a656e646f626a0a382030206f626a0a3c3c0a2f436f756e742031202f4b696473205b203520302052205d202f54797065202f50616765730a3e3e0a656e646f626a0a392030206f626a0a3c3c0a2f46696c746572205b202f415343494938354465636f6465202f466c6174654465636f6465205d202f4c656e677468203133340a3e3e0a73747265616d0a476170516830453d462c30555c4833545c704e59545e514b6b3f74633e49502c3b572355315e3233696850454d5f3f435d363b44396a2b4d2652557029463d6c6531625f605b234e43684d544c2a2d264b6335362a2436604f68714441745b5f4631446130664373363d63385b634f3e26426f624430625e676f533970212d54263459517e3e656e6473747265616d0a656e646f626a0a787265660a302031300a303030303030303030302036353533352066200a30303030303030303733203030303030206e200a30303030303030313234203030303030206e200a30303030303030323331203030303030206e200a30303030303030333430203030303030206e200a30303030303030343233203030303030206e200a30303030303030363236203030303030206e200a30303030303030363934203030303030206e200a30303030303030393930203030303030206e200a30303030303031303439203030303030206e200a747261696c65720a3c3c0a2f4944200a5b3c66653566343038633737626438353664383936643837663366353937616231393e3c66653566343038633737626438353664383936643837663366353937616231393e5d0a25205265706f72744c61622067656e6572617465642050444620646f63756d656e74202d2d206469676573742028687474703a2f2f7777772e7265706f72746c61622e636f6d290a0a2f496e666f2037203020520a2f526f6f742036203020520a2f53697a652031300a3e3e0a7374617274787265660a313237330a2525454f460a	test.pdf
4	demir	demir	7879879	897987	79789787	797878	1000	resan	123456789	145255	78787	45897	09.06.2026 15:29	-1	\N	\N
\.


--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kullanicilar_Id_seq"', 46, true);


--
-- Name: StokHareketleri_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StokHareketleri_Id_seq"', 4, true);


--
-- Name: Urunler_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Urunler_Id_seq"', 4, true);


--
-- Name: Kullanicilar Kullanicilar_KullaniciAdi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar"
    ADD CONSTRAINT "Kullanicilar_KullaniciAdi_key" UNIQUE ("KullaniciAdi");


--
-- Name: Kullanicilar Kullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar"
    ADD CONSTRAINT "Kullanicilar_pkey" PRIMARY KEY ("Id");


--
-- Name: StokHareketleri StokHareketleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StokHareketleri"
    ADD CONSTRAINT "StokHareketleri_pkey" PRIMARY KEY ("Id");


--
-- Name: Urunler Urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urunler"
    ADD CONSTRAINT "Urunler_pkey" PRIMARY KEY ("Id");


--
-- PostgreSQL database dump complete
--

\unrestrict 9PQx1PTEImjFcenOjlrgI5b5reOJaiHq8kI90glrUiFzsHp1FXRDKoREg5C6gJE

