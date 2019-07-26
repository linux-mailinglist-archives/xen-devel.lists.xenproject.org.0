Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A7675C2E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 02:54:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqoS0-0006bG-L1; Fri, 26 Jul 2019 00:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqoRy-0006bA-T7
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 00:51:10 +0000
X-Inumbo-ID: 712258b2-af3f-11e9-bb93-b76052d09557
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 712258b2-af3f-11e9-bb93-b76052d09557;
 Fri, 26 Jul 2019 00:51:05 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 00:50:51 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 00:50:19 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 00:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWG/UAQk+LUL11mkeuuTwGj53V1ClwfyC2lijYFNJ/WCvUaChXzQW/X3QxFLok+BYJBI98npe8Ju1vsPus/MFjlj/4oLA2QAowi+gyE4ryDLoGkh0Xxns8dmK6iLcIyoU7r4UZzaA0tBVStgxPKnbUMXpRxN/yFZrxGTv8ab/fqR700SOBocayYcrq9K83+KiHracskYRlOHR+J/fWIbdFqeFsB2dxhygXsdXd/jIvunZcK85dyZQmNJXQHTsArIkybU0N2KtZLSdyLH/Op37XPDyO5838zpZiqEfVj58oDt9yDYMFRacUui0FU0kFsNC++t/T7GaxKhQisgxyVNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hLjTF9L+hMdfsMoHAm9NVRCflLTHKRGwPgAtkuiwwk=;
 b=QjVtB5vrl5jpvS0FdZiDZ4nSVjKZSuIJ7kQBBFKRJXzmj5O9W3PzOsFX6UMPQ/t+bMSTGK3HpLuo/gqA3zwZ/NChyWfxDAfrMsVdqXgU2JUbbMcnOoOOGA1eJUaLui7niiZoGmmmUCRWHisxm8Kxc/9O/5PXYlYmNN6G7x9srs6wJ5UTHQqdFNDZGJMlU3IP5ACk6ruNEgYRYLV+WIA7+ds7xDBzwWMsOa5SaO+iiM0N0m9Sh9GCV9Cp+Wv8ZXxFMSxnspU5pvOumOyZXTMkPwzRUc8zDQ3oQf1nZ5U5zaov9eGJuLuosT9aRtI0KSaXHGBvr5qA2VooXqefJxMBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB0985.namprd18.prod.outlook.com (10.168.119.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 00:50:18 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::e9ac:eb60:5b04:1a0a]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::e9ac:eb60:5b04:1a0a%9]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 00:50:18 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Failing to build test-cpu-policy.c with GCC9
Thread-Index: AQHVQ0wYS55fVj31VUuPy4mON27BUA==
Date: Fri, 26 Jul 2019 00:50:17 +0000
Message-ID: <20ec48febe15d329547b0dc4fe1e411e0043c4df.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 591c8e79-acae-496d-502a-08d711633ac4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB0985; 
x-ms-traffictypediagnostic: DM5PR18MB0985:
x-microsoft-antispam-prvs: <DM5PR18MB0985658BF792839E7F4D23F4C5C00@DM5PR18MB0985.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(199004)(189003)(64756008)(2906002)(4326008)(25786009)(6486002)(6436002)(2501003)(478600001)(6306002)(91956017)(5640700003)(6512007)(2351001)(76116006)(5660300002)(66476007)(14454004)(6506007)(53366004)(66616009)(53376002)(66066001)(53936002)(86362001)(66446008)(66556008)(66946007)(81166006)(7736002)(966005)(8936002)(36756003)(118296001)(8676002)(71200400001)(71190400001)(68736007)(99286004)(486006)(99936001)(26005)(2616005)(476003)(3846002)(256004)(81156014)(6916009)(6116002)(186003)(316002)(305945005)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB0985;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wcFRB4c/UBVqq8eenb+vnLu6L/A4XeLYiKgDkspvaHqekBRQvedEX5ZDbkHm7uy+r/QMSd5dmPv4N+Ua5hrU2miXzbNhRAxGF6t+XaeZKhzrJEZr8A7FPtE8CDKdk8uDmt0oasCZGKgK7f4Q+zUzcz0Z11IE0FtaM9f+liu9+efpBUQE/5iy5si3iXD20K/zn3RFcTX/SiDas0fFAGOjWoOtSa/grTPSRjyC97bmdHP+zDKcuvqiZ3TWrzgcilVUt3Asmq4BAc/+ot9AizUp3VPwaWH1HPKxBB7SAaF3fUcUeZggQ6ETRD/pGodJRp+bzbVLM1XXJYpNi3sE0S40HJ/APcdLMfOfhx8oThyx6I1xSvRbLV+bawNMhqfW3zOfgx5J2fMKdy5qhg8h+6rWtT5SHWK8N0MqnA5NstoTOKM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 591c8e79-acae-496d-502a-08d711633ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 00:50:18.0732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB0985
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Failing to build test-cpu-policy.c with GCC9
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============1149847909923795615=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1149847909923795615==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-21/JirqKRMmignEIADqR"

--=-21/JirqKRMmignEIADqR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, Andy,

openSUSE Tumbleweed has: gcc version 9.1.1 20190703

And this fails to build test-cpu-policy.c, like this:

test-cpu-policy.c: In function =E2=80=98main=E2=80=99:
test-cpu-policy.c:64:18: error: =E2=80=98%.12s=E2=80=99 directive argument =
is not a nul-terminated string [-Werror=3Dformat-overflow=3D]
   64 |             fail("  Test '%.12s', expected vendor %u, got %u\n",
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test-cpu-policy.c:20:12: note: in definition of macro =E2=80=98fail=E2=80=
=99
   20 |     printf(fmt, ##__VA_ARGS__);                 \
      |            ^~~
test-cpu-policy.c:64:27: note: format string is defined here
   64 |             fail("  Test '%.12s', expected vendor %u, got %u\n",
      |                           ^~~~~
test-cpu-policy.c:44:7: note: referenced argument declared here
   44 |     } tests[] =3D {
      | =20

Even just doing something like below, seems to fix it for me, but there
probably are better ways...

Regards

---
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-pol=
icy/test-cpu-policy.c
index ca3b8dd45f..e0c2c56154 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -35,7 +35,7 @@ static void test_vendor_identification(void)
 {
     static const struct test {
         union {
-            char ident[12];
+            char ident[13];
             struct {
                 uint32_t b, d, c;
             };
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-21/JirqKRMmignEIADqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl06TkgACgkQFkJ4iaW4
c+7kXxAAigA6eKxzD1tly5GgfIBg4LPuykFDmy3DxBY1tmHl+fIocXWCOopP9eZb
uT6Jj/RqG11bBJa1gntlSa/QpuaR+bUZw3ErLd7BZsDEtCj02EOKKLhybIfvHPSo
0VNTS09h7aMNDU01weda7FA7QddY2qD5qK6763pZtIo23iPNoHmWT9sGvq/htrrS
3LJ25MdL9CdjpRqHP5z7hh0gW7Hjwzt0+BaRc3AKDHNgU72xwkx4uIJEgHjFIn67
sP9O6y1tjojdl0vb+PfrWTdduENiid2xmoBjsPP4aCmiJYTq0MILXNXzps54CEtH
c1o31+yQ2tJbH3pwc4dvM2a7vWBn8NRPOrXMkVMHUYAxEas7DgbWBNNQjc+vplOu
Pu+5LTz0m3k8zUpauGfq1RLZq92uY7DMOT9ir6drYG8A881AQ6BYcnfSCLpKGBRK
cTxk7JEL6xiTtMakAqXy2yYngzSi+3djrAESoCqdabPTjKjgyDP8jFaqEAJ1L5d3
RhGBOgeFL30Tv7M5IqbTZaEcmVFUBodSo0Rj81N9eXE8J1+MJMXn0Z27OKjVsQy8
ryGTDR+E9jZG2HPX9qnD4utqivH6tlPN/ChlgFv5kTlGXa0V45WEw4kwZqrBs6OE
1iEHa41apLgonPM3wk3YnT7LflA9I/l6uyO8GnM7hPuSzuq9bqg=
=CjMx
-----END PGP SIGNATURE-----

--=-21/JirqKRMmignEIADqR--


--===============1149847909923795615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1149847909923795615==--

