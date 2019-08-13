Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A54A8C307
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 23:05:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxdwG-0006nJ-P0; Tue, 13 Aug 2019 21:02:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mu8E=WJ=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hxdwF-0006n7-Cp
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 21:02:39 +0000
X-Inumbo-ID: ad0d99a4-be0d-11e9-9dcb-df702742206e
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.123]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad0d99a4-be0d-11e9-9dcb-df702742206e;
 Tue, 13 Aug 2019 21:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceBl+OG/HYqZqhr2Ejme+efc0SGtbnFFd0rdcFPYZ/SLZvaotGj+q+kl6/gHUdR0yhvHVE1qtY93KTNcnyi3oz/KjeW3OK/37NYENhcTVkbBE2MAjAkJtSiPkNZXRT0rYHuPlHEh5r2KlnDgL37AXuNsotHJiyflpQPrOOVeK3aEPx/Y9Xcfb0FLXxcM5VlXhYLmrEJuJtsXnUi+54s48GsiIdhIG18j0J6FJpuDSyI5CzMqIEXxDy/qYHXPrScbp8JbCbm6yEWrSQQznEfZeC2Q9GKGaxtwa9qIKok7DVP3+E2o8ceejnd7ZmW+xfDyGAocGDrxI6H/U+yNXCeQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QP9a269pUKw96NgmF0pNGLuxWwMPtdgeK1Qzt/Ka4w=;
 b=Ma4XwBvxkXpigd79nveA5WK5sgs1EeZdw+L8y+W2Qre3rasui59BNsYB142oavDa4Dhm3sPkR1+zn9Toalcd210mo58GxASMbOzL7Z/7dCEwCmzr/QbbTfup6WlcYqKbWay2IsZFdBRRYdmKDUmOXrEEvePaqfujdmaS1/gfqpAt8iZpDx1rgCEOrB4nN91c4x0u8S2yKldgtYjQgwSTNp0/ZwpziXAwUskT0UkdiTJjimOOBMjrWBD3LXLErASyVitU4nd7Nk58EzMrcFjv4JxBQp9Q0ke0PGoWuQIshYKK3+NUNrg0Y5CJoJOrEd9ywQQ4nIAkNyYnIh0bolsCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QP9a269pUKw96NgmF0pNGLuxWwMPtdgeK1Qzt/Ka4w=;
 b=iyJ9t7K+1sXSzLy4n/MpbPYZlrBaRRuE966a1k9SkPp9VXQaSpbHmSZMhq47VIh2Emq+ub9BKyhn60R5cPzRfplqHtKj1IhGMFSrmZ+8INyffvAmsKswk6vr/W1q3VreBxGghnjFM4q2pkpM0iuSrP80vZGKqGDmg5f7izoDTlk=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB4000.eurprd06.prod.outlook.com (20.176.5.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 21:02:34 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42%6]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 21:02:34 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] failing to set value to 0 in Grub2ConfigFile
Thread-Index: AQHVUhpuA7gOz+/Ark2RBY58DX7TkA==
Date: Tue, 13 Aug 2019 21:02:34 +0000
Message-ID: <alpine.LFD.2.21.1908132143580.3016@austen3.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b97cfeab-1b44-44ec-b8d2-08d720319072
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR06MB4000; 
x-ms-traffictypediagnostic: VI1PR06MB4000:
x-microsoft-antispam-prvs: <VI1PR06MB4000CA2F5C25C254268B681A87D20@VI1PR06MB4000.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(189003)(199004)(558084003)(6116002)(8936002)(786003)(2351001)(5640700003)(64756008)(86362001)(66616009)(66556008)(58126008)(66946007)(66476007)(478600001)(66446008)(6916009)(316002)(14454004)(71190400001)(46003)(71200400001)(99286004)(25786009)(36756003)(8676002)(53346004)(53936002)(486006)(6506007)(386003)(476003)(2501003)(81166006)(7736002)(81156014)(256004)(52116002)(2906002)(6436002)(99936001)(305945005)(9686003)(5660300002)(6486002)(6512007)(102836004)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4000;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /s/eNbme8vUhuyN1I44s8WroI1EpSqes4ppzXKZOMs/3pHWmrKNL1+hB74B2/Scd9mESP+Se7CXXERZQA5OUw6HN2UhPFLqclWpoznqrLWya5w2KJgEnZl8S7rjV8QSSEfEOFQpdFZEYqBfG/l6Z/TyC+wT6tvZ/c/8IUt3KgH/WExp2/O8DIeMXydRGFkwnlSkcgOu56JaSPeidHP/H6QD3NJypAR2TP7mStRFpwOhyfI20Cg50NusQp0UkevTUqlCL/c6I98P5qrd4ac5zpcvonaun5EbA298g574uuHBSgqngMM1etlckd+HU67VG+tKhXMoPZlIX7SfDuP2f+Ie1d3f7dKZI7IrKrIl6UX1TT9Ea1qkWzc8Y3xec7DjjiEoJw7RkLaTdXq/BJ293HfiWgAvJIiWTAHKbV+l+Fp8=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_alpineLFD22119081321435803016austen3home_"
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: b97cfeab-1b44-44ec-b8d2-08d720319072
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 21:02:34.7187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIod/guzR3wzcfM+gl+gfMZVEjsG4WPrYxqlr7wiEHRYdVOXAxeTuqYGWzXnf2d/YBoI3YLqsqRFuyWtfinyqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4000
Subject: [Xen-devel] [PATCH] failing to set value to 0 in Grub2ConfigFile
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_alpineLFD22119081321435803016austen3home_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44ED0D4AD32ABE479A4AF31F6D326BE8@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

I have been looking at the pygrub code to see if it is possible to cope=20
with grub files with BLSCFG and spotted this minor issue in GrubConf.py=20
where the code intends to replace ${saved_entry} and ${next_entry} with 0=20
but doesn't succeed.

Signed-off-by: Michael Young <m.a.young@durham.ac.uk>


--_002_alpineLFD22119081321435803016austen3home_
Content-Type: text/plain;
	name="0001-failing-to-set-value-to-0-in-Grub2ConfigFile.patch"
Content-Description: 0001-failing-to-set-value-to-0-in-Grub2ConfigFile.patch
Content-Disposition: attachment;
	filename="0001-failing-to-set-value-to-0-in-Grub2ConfigFile.patch";
	size=1382; creation-date="Tue, 13 Aug 2019 21:02:34 GMT";
	modification-date="Tue, 13 Aug 2019 21:02:34 GMT"
Content-ID: <alpine.LFD.2.21.1908132202300.3016@austen3.home>
Content-Transfer-Encoding: base64

RnJvbSBhMDhlZmY5YjFiODgxZGM2MWY5NDI3MTUzNzA2ZTJkNWIzYmQwZTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51
az4NCkRhdGU6IFR1ZSwgMTMgQXVnIDIwMTkgMjE6MTU6MDIgKzAxMDANClN1YmplY3Q6IFtQQVRD
SF0gZmFpbGluZyB0byBzZXQgdmFsdWUgdG8gMCBpbiBHcnViMkNvbmZpZ0ZpbGUNCg0KSW4gR3J1
YjJDb25maWdGaWxlIHRoZSBjb2RlIHRvIGhhbmRsZSAke3NhdmVkX2VudHJ5fSBhbmQgJHtuZXh0
X2VudHJ5fQ0Kc2V0cyBhcmcgPSAiMCIgYnV0IHRoaXMgbm93IGRvZXMgbm90aGluZyBmb2xsb3dp
bmcNCiJ0b29scy9weWdydWI6IE1ha2UgcHlncnViIHVuZGVyc3RhbmQgZGVmYXVsdCBlbnRyeSBp
biBzdHJpbmcgZm9ybWF0Ig0KZDFiOTNlYTI2MTViZDc4OWVlMjg5MDFmMWYxYzA1ZmZiMzE5Y2I2
MQ0Kd2hpY2ggcmVwbGFjZWQgYXJnLnN0cmlwKCkgd2l0aCBhcmdfc3RyaXAgaW4gdGhlIGZvbGxv
d2luZyBsaW5lLg0KVGhpcyBwYXRjaCByZXN0b3JlcyB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLg0K
LS0tDQogdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weSB8IDIgKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3Rvb2xzL3B5
Z3J1Yi9zcmMvR3J1YkNvbmYucHkgYi90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5DQppbmRl
eCA1OTQxMzliYWM3Li43M2YxYmJlZDJmIDEwMDY0NA0KLS0tIGEvdG9vbHMvcHlncnViL3NyYy9H
cnViQ29uZi5weQ0KKysrIGIvdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weQ0KQEAgLTQ0MCw3
ICs0NDAsNyBAQCBjbGFzcyBHcnViMkNvbmZpZ0ZpbGUoX0dydWJDb25maWdGaWxlKToNCiAgICAg
ICAgICAgICAgICAgICAgIGFyZ19zdHJpcCA9IGFyZy5zdHJpcCgpDQogICAgICAgICAgICAgICAg
ICAgICBpZiBhcmdfc3RyaXAgPT0gIiR7c2F2ZWRfZW50cnl9IiBvciBhcmdfc3RyaXAgPT0gIiR7
bmV4dF9lbnRyeX0iOg0KICAgICAgICAgICAgICAgICAgICAgICAgIGxvZ2dpbmcud2FybmluZygi
Z3J1YjIncyBzYXZlZF9lbnRyeS9uZXh0X2VudHJ5IG5vdCBzdXBwb3J0ZWQiKQ0KLSAgICAgICAg
ICAgICAgICAgICAgICAgIGFyZyA9ICIwIg0KKyAgICAgICAgICAgICAgICAgICAgICAgIGFyZ19z
dHJpcCA9ICIwIg0KICAgICAgICAgICAgICAgICAgICAgc2V0YXR0cihzZWxmLCBzZWxmLmNvbW1h
bmRzW2NvbV0sIGFyZ19zdHJpcCkNCiAgICAgICAgICAgICAgICAgZWxzZToNCiAgICAgICAgICAg
ICAgICAgICAgIGxvZ2dpbmcuaW5mbygiSWdub3JlZCBkaXJlY3RpdmUgJXMiICUoY29tLCkpDQot
LSANCjIuMjEuMA0KDQo=

--_002_alpineLFD22119081321435803016austen3home_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_alpineLFD22119081321435803016austen3home_--

