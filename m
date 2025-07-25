Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FEB121F0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 18:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058240.1425898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufLDM-0003WD-VI; Fri, 25 Jul 2025 16:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058240.1425898; Fri, 25 Jul 2025 16:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufLDM-0003Tr-Rv; Fri, 25 Jul 2025 16:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1058240;
 Fri, 25 Jul 2025 16:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysIX=2G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ufLDL-0003Tf-KA
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 16:24:07 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8733d23-6973-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 18:24:06 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB8925.eurprd03.prod.outlook.com (2603:10a6:20b:5c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 16:24:01 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 16:24:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c8733d23-6973-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpXfsOJPxhG2mYOKQRzs7U7aNCjA+2hMYUf3j8vjRRqnalkgIxnw6XMO/eSeNxAb2uOw5kwHmGsu2wFCNRq8DlSKZDB7IzXoLHo2GI8hqRWdDzrHaCpluhA7WxgNlEy+J83J9uy97lCWGqY67odvYYjt3XJ0jn1sqASeTL7grMWEV1Mdn+ormtJHKbo/GEQwESwlFKQOA9mKUV6cxBReuAXGi5hRlEUBtl3sRNX/NYdKUXCBBk3XSq15o3mQX2WEU6VOit48oSqyswhIMZ5+jb7Ospqy7HCw0L+6/CNyw84VVXhFfVz9oSQNMb4V/8tVU21FfZO16ru2gkysdJtFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0wWO/3eal272rd1l1L+lkU0odZCJ9x76AMZps52NUg=;
 b=js0um0V4HtlqeGt6Re7NSrI6JVsem1ekvHY+yPSKOlx94tuSUYq6vocZHYrPcwJLp5ZbL8cfeAhOQvJrp98iaTVVfh0n2GeLupyzIPhrDcPYzEpHQKdiOJvnwEJggzMlEU9pTrWf9xW/UsWcukTVYV7sLAodZecVqTvmV3SxETNr+NbAUIKsqX9Ndue1ElUTe3BgEOwFAcxh8k10zH+bd3OEwhhkeNngo3Luf309CB6miJg7e7QrHNQcOHwGyuxWRrFSe/PSWPgDETNpjPjK+zj7dfFxI4ixHifNTeOJp5sxhm9Um+xY0d5pwiFX5CaYrZ1uTrEUP/rTLM8f9eIVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0wWO/3eal272rd1l1L+lkU0odZCJ9x76AMZps52NUg=;
 b=ltZCwZ19bw3ffVSa8Oq87hVd2ps6YgcpQgWVVXvbKRqRC9M0pqSilQK7uEscStxTZ10PpMQhnqulcSC3aCZG7ifuYDgPK1UfiEb1TtaPxvRREGSxG1Prl44jnzSGJDV/1I9Rd/HvrO/pqvtR2SZwVCRXHDERNdQku7D07yjPwUvEhgMuuFoSqmydItmyYrqkjJyjJ2xAAhsWzuxaiiKVBYsQ7xN74nmnLoj0PexMoD7Q2U+txBpESgXg70zvMWzZ9B6xSvX4GW84e4s0ImfUTWtGeJCq0wbuZl0vVraCh3toywMKB9Dx99NGNdUWmiteIqDVKyZETO1TKqoZfZrX2A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb/YCHt9uHUQWtj0esBUS8Oj/ZKQ==
Date: Fri, 25 Jul 2025 16:24:00 +0000
Message-ID:
 <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB8925:EE_
x-ms-office365-filtering-correlation-id: 94b1e6c7-7741-4d8c-2480-08ddcb97a9f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Pu9HGhbTQBsk4p004NTM0cCrL/s6dAndahu745K/uZ/0zQ3N8or6BElRZv?=
 =?iso-8859-1?Q?k4rhxv30y98t0LbCbyod4CVSzT/UYrDLqGGS1E2KXap8vRDj/PymQq01uz?=
 =?iso-8859-1?Q?Np03K7K/PqKrvPNRyN6EGk1jXqePvVntAmLrcZFgbpf6D3YmqnGvMdUHQg?=
 =?iso-8859-1?Q?LNCCTXloj60I6WOwW1c0e/dA8dWzJaVyBVPs0SO2J+CQx8RUfsDBpjTYei?=
 =?iso-8859-1?Q?qdFj/r/87VW57kLk0wCloi2rbCvpm1Ge6TCMa/JHhctTu7E+niHVQPjpUc?=
 =?iso-8859-1?Q?ssIbw5VihvPBuEYZzUDYsT9mCvM7Zd+AuBsK+YmMv/CuiJS+DC8B+sChvp?=
 =?iso-8859-1?Q?wOFbhKuzggWJjHLbs4MB5jxR8+kMZNQp/OVguTQnz5kke/GYUbWZqEfdIN?=
 =?iso-8859-1?Q?atgj+I9IBWMfzzRzqj43Hj0mprUHfMPweYPPCiH/SY+uaiGtCnwTxQqvBN?=
 =?iso-8859-1?Q?52/RCfJeDh1+ArHpxb/QMGWiqzTILkQkFtV7Wtx+ENpRKxMbXWu1wqH7YT?=
 =?iso-8859-1?Q?TE6EUS1rVeIzCC7+0a3KeU53YifVV2TazGA53hU5rnNYDojhTiaqq2BRTh?=
 =?iso-8859-1?Q?Eum9cPiKpQnVSAfcyiwvpQ9/gF+Fmdz/AvcNfc6ABBZmGtWNsnEZAzYx3t?=
 =?iso-8859-1?Q?qfJ1cnS+RBzVuV4H58vX8ZbyBGINlSIkZ38QIxyRb8uc8Sm0uKW8AWeLdF?=
 =?iso-8859-1?Q?EPEVWk+is+rFYdX6PhOOEwCYyRr31hv64Qy/P3ivkY+MEymiJHWbluVhXU?=
 =?iso-8859-1?Q?DllR3vekAKYgKPfKUy+sa/OA5TmqS6qZJUHfTUoeW6IWEMUQyfSHbfryBL?=
 =?iso-8859-1?Q?GJYM0l9WS2qrYq5qpKPotEwDC3TBeJjgp95CTD3V1xDsQl7bOVi3hdObdS?=
 =?iso-8859-1?Q?e003L8KF+C/4C/WxugKijaMFAkQ59t8PrkhU6uV3nlC1Vco/7qYS633LaL?=
 =?iso-8859-1?Q?IKDuZZ3hhsg803Wo4GRGDEmxC1LuWVlVFz8veLdcPi/PbA5qodmhJv4dJJ?=
 =?iso-8859-1?Q?w7pzL8/MCizsRDFhe1/WlNyFViRDwDqHJwFR9OaDMk7A7fj3wmLuGAvrpI?=
 =?iso-8859-1?Q?EU2tpx9NojgvBQdj0iRzfe5BpXhSCzFtWJLg+yUL1p2Z4HNe1XpmZSCC8J?=
 =?iso-8859-1?Q?FAx01wYKUaIxjfx8T9Fk7xufZpWyOlSK+CJnhy9yGyve1fXEn2J1Xr0gXF?=
 =?iso-8859-1?Q?77r0ZSn/qFRkgPIKbbPV1+Lgd788QZNQCJfrLLMhs3Jgpv/ZY6jblq4Rgn?=
 =?iso-8859-1?Q?CXjwlr4f7AxCu+bbAvav9vpcnoGm8jIuHunQuJWLcUA14gXaGO8G/sIc2u?=
 =?iso-8859-1?Q?rhmi133SUZUExZF0Jg08RpKIAwTCS2F4+yr487pOCYYAqN/vGNfxEJe1rS?=
 =?iso-8859-1?Q?WT06d0KgChp2ZRqoiqWnXRD5bQuDMKB4lKRZdxAubic33CMkjbSLfEdo/4?=
 =?iso-8859-1?Q?Dyz503x/50388sx1Btz2M6cIz9OCJBQkQ8XmgnLkRb1tenjXkwVbIg0pDn?=
 =?iso-8859-1?Q?w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rAgmywkEu7hZIlDQfJiIBLstx4CQ0VJQSpY1JGnoKsXjDBqnsjscDlUZ86?=
 =?iso-8859-1?Q?Rz/4yayztzXt69T6yObDN7TyY5qa3VcXuQfhPJMEINFJy4BP//s8VdWs5N?=
 =?iso-8859-1?Q?GpuuLMMM5BrVA9af5YynrJrg4Jaezm4nvAK4766T1W1J7Dt8oXTh5kBvhQ?=
 =?iso-8859-1?Q?PNqNd3YSqZRHJR6lSwmiOKQP6dRE+Eom/sijWSuNXornAmgSsBvG4NR4DS?=
 =?iso-8859-1?Q?EEQf5+nHqZMq6deVt91e2q+DWxoJViL5uLUkAvGmu2fKmAtbCWwQTfjjvm?=
 =?iso-8859-1?Q?O9IJZUkG2X8XJKFm3xpZnsydsZJcw9jrvSKa8sBWfKWO/QoFfC7+Q8WKP2?=
 =?iso-8859-1?Q?hIQRZD0hSuypYvrHALh3uGlcmG/7K0MTGr+NeWFDgY94PFdFpmVqkg5vDt?=
 =?iso-8859-1?Q?LyBkvJsWKKq34VbF3ml3Y87YOcresMNZEJkNvkeGyLkxLWJ8zpBiMHrkPA?=
 =?iso-8859-1?Q?F7hxvPxdbKwbjHqgB0ln5mGVMeHSn0kBHD6W2FSJRbewxJvj6ZhS9HPmXa?=
 =?iso-8859-1?Q?7yfrdJQEdOORD+XS8XkOYBDpa2jAcNi6OsSNBMkPlUytNlGW7L2UJuEiDd?=
 =?iso-8859-1?Q?yYLiOWU0U6MIZH782iOIm8QPlV6US1NzjxgpfbtMaX7WLLTMsxufU1sFpC?=
 =?iso-8859-1?Q?YbjL53Q75SEa6c4hry+euPsvmgnpUOQrq0gobOITXZRkzztU6461HwQ4zZ?=
 =?iso-8859-1?Q?3dwNpaOZ7PLy5168CN4AFOm1oqjK8BB65iJhXwIjlW8aTepWwYO34+LvyB?=
 =?iso-8859-1?Q?jjhe4aOkNKza8NdORTTDGal1W31NKzVy7iWefvM7dQyl2OZs+vxeSm270A?=
 =?iso-8859-1?Q?AYej4Nodu9Kv96Fsux1G3SZXDTDzzWH5CuR78HS1KtGBqF5E5RHVWLwmIw?=
 =?iso-8859-1?Q?umY27VPnUqXZuUCx3LoK3GzlGBHrxtfM45nz1vkZMSHrty5iQJe73OnUOt?=
 =?iso-8859-1?Q?q9Rv+9PJSE1d5n+3l0zFKTVSrm6MVAleym1X2UXMEls4cy9WpQrqPr38ng?=
 =?iso-8859-1?Q?tlT3xV0/3anacc9yRxk9DUTUzsac2f7COonVEWEfL+gAgH5juuMIOlfOr1?=
 =?iso-8859-1?Q?h1ysETORRh+Bdh0GUmtx04aE0a/Ctd/8ZjAcZ1O4DSpRf9BA7Ke51IphRF?=
 =?iso-8859-1?Q?G9zfOQ2hDU9tmvsj9zbl3I+39ysoiY/dd6v21W4iDFIcRIZB86HDRJR5+S?=
 =?iso-8859-1?Q?8Kj3PQKKG/G+0tsIBE52fLjCTSLY6gRbhaojilOdoASP26FAjAH75OHBrs?=
 =?iso-8859-1?Q?HnhaRHhpkWIWG4/aOzngMk9g9G9sZye+fLL3UD67POzsL/eTNFNuzbwPTq?=
 =?iso-8859-1?Q?WKC03XFi13BwdI16GEUtRELVTstofFn4LSfM2HdEwLdwTeQ/dXDFN6m7dc?=
 =?iso-8859-1?Q?AXyyMqV3JsXQp+v+tOvspc+H3QY0kezCXuziLlx+lMu9Dug/GWVjtty7nX?=
 =?iso-8859-1?Q?JNoP0Fl2U03o56rMySPcQOtkL8u9OcYvqHvG8KRhZEhJX84iTGOUYOxKjV?=
 =?iso-8859-1?Q?+WUZaH2WDSGMPrhZ9qtGPeVxaIN+ynd05HP5QM+84LU4Zo2X0IczlIDUdK?=
 =?iso-8859-1?Q?D2gL1wTTpLzt3hpmJIoD87kOBxCKxlz2VoUpKpbf7zQehPaR+4EBOOnbrW?=
 =?iso-8859-1?Q?+9NRefatxyuLl+oI8Y4t6gbw62fGKkFuoBm8GIvmoi5KA0yKOfbrgJWg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b1e6c7-7741-4d8c-2480-08ddcb97a9f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 16:24:00.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHsLYybe37D7yOh9sCNDSaro7NrsLoGAjiVtmY8zMlhJTcRDilrzZLOfm00+adYnzmUcO3TPysdFt9qEJcV9M28gUVB25LZvULzTIkl1Cks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8925

MISRA C Rule 5.5 states that: "Identifiers shall
be distinct from macro names".

Update ECLAIR configuration to deviate clashes:
specify the macros that should be ignored.
Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
v1: https://patchew.org/Xen/7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.175268=
9112.git.dmytro._5Fprokopchuk1@epam.com/

Changes in v2:
- changed Eclair configs (option '-reports' replaced with '-ignored_macros'=
)
- updated deviations.rst
- updated rules.rst
- updated commit message

Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/1948281147

MC3A2.R5.5 violations:
ARM - 0
X86 - 328
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 16 ++++++++++++
 docs/misra/deviations.rst                     | 25 +++++++++++++++++++
 docs/misra/rules.rst                          | 19 ++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..13e1511a7c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -117,6 +117,22 @@ it defines would (in the common case) be already defin=
ed. Peer reviewed by the c
 -config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(decl(kind(function)=
)||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^x=
en/common/libelf/libelf-private\\.h$)))"}
 -doc_end
=20
+-doc_begin=3D"Clashes between bitops functions and macros names are delibe=
rate.
+These macros are needed for input validation and error handling."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(__test_and_set_bit||__test_an=
d_clear_bit||__test_and_change_bit||test_bit||set_bit||clear_bit||change_bi=
t||test_and_set_bit||test_and_clear_bit||test_and_change_bit)"
+-doc_end
+
+-doc_begin=3D"Clashes between 'pirq_cleanup_check' function and macro name=
s are deliberate.
+The purpose is to ensure that the specific cleanup action
+('pirq_cleanup_check') is performed conditionally when the parameter 'even=
t channel number' equals zero, otherwise it does nothing."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(pirq_cleanup_check)"
+-doc_end
+
+-doc_begin=3D"Clashes between grant table functions and macros names are d=
eliberate.
+These macros address differences in argument count during compile-time, ef=
fectively discarding unused parameters to avoid warnings or errors related =
to unused arguments."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..c6a0c084bf 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R5.5
+     - Clashes between bitops functions and macros names are deliberate an=
d are
+       needed for input validation and error handling, ensures that the si=
ze of
+       the object being pointed to by 'addr' meets the minimum requirement=
s for
+       the bit operation, preventing unsafe operations on improperly sized=
 data
+       types that could lead to undefined behavior or memory corruption.
+       The macros encapsulate this conditional logic into a single, reusab=
le form;
+       which simplifies the code, avoids redundant function call.
+     - Specified macros should be ignored.
+
+   * - R5.5
+     - Clashes between 'pirq_cleanup_check' function and macro names are d=
eliberate.
+       The purpose is to ensure that the specific cleanup action ('pirq_cl=
eanup_check')
+       is performed conditionally when the parameter 'event channel number=
' equals
+       zero, otherwise it does nothing.
+       This approach simplifies the code, avoids redundant function call.
+     - Specified macro should be ignored.
+
+   * - R5.5
+     - Clashes between grant table functions and macros names are delibera=
te.
+       These macros address differences in argument count during compile-t=
ime,
+       effectively discarding unused parameters to avoid warnings or error=
s
+       related to unused arguments.
+     - Specified macro should be ignored.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..3f288364b1 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -196,6 +196,25 @@ maintainers if you want to suggest a change.
            #define f(x, y) f(x, y)
            void f(int x, int y);
=20
+       Clashes between bitops functions and macros names are allowed
+       when they are used for input validation and error handling.
+       Example::
+
+           static inline void set_bit(int nr, volatile void *addr)
+           {
+               asm volatile ( "lock btsl %1,%0"
+                              : "+m" (ADDR) : "Ir" (nr) : "memory");
+           }
+           #define set_bit(nr, addr) ({                            \
+               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+               set_bit(nr, addr);                                  \
+           })
+
+       Clashes between 'pirq_cleanup_check' function and macro names
+       are allowed.
+
+       Clashes between grant table functions and macros names are allowed.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

