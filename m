Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D96B52B76
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119650.1464955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcY1-0005Xl-U5; Thu, 11 Sep 2025 08:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119650.1464955; Thu, 11 Sep 2025 08:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcY1-0005V3-Q2; Thu, 11 Sep 2025 08:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1119650;
 Thu, 11 Sep 2025 08:20:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcY0-0004XB-Ba
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:20:52 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a252c1c-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:20:50 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9468.eurprd03.prod.outlook.com (2603:10a6:20b:59b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:20:36 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:20:36 +0000
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
X-Inumbo-ID: 3a252c1c-8ee8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWyz+fX86tCBqHxGgUoKHYP1Yo9wtegixdHuH/8vaO/CNSSNuVaV7ZW56vN2vZiI69CnDhcwr8bn+oHjVhMY8psqyVnAgIe9hpWbK6jGtMAQ2W+YI1QgU3JWG4IBNDumFcN3ZKHtAxKun6RItWlkMRuvfAgv5V20dhR4lFdFaRgDLlh2OgcUffZS3LvWuftJtOc2iP6eUeulV+c/VYDskv6CTELDrZ+8HLLdUd7/2uqxHJNgKw05UAZQ8ENA/CPa9aPvb9SssJTai34DUDfahsC8AnB17uALlnIwnsw3M1boeFNSDH195l10S7irlOyR+22SpJhFavEHfV4GADDjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu7j+LGzSzBRWnn1uFmUlqpqkrqCdH2fH2rGjkvXHqo=;
 b=iJ0wHIiGw1Y+GYdJy325kEZdDUqKVY02B8TUbIZPYTfTQ4/pb3HQv7p5JEzzRpO+7BK4IuuGsfkJ4G+AXlRGx4h4wqILkTXLMhuoLzjPWUpCLYx9pV06knvMr4rvnzXjghfVrh87ThKnCH4VqrtJgc/C51EZKQ/4k11mYYebAur5N519TwyUoLUX7Jfu/OHmn/thvbmqC+T+byVDks4rMpo0hjfVpyQc3XtOee+sPEbEIkSBcaxlsB+lNyZDJYPnSqGubBpVYvOQ0Ub240gVBzBXWBodpj1uzVoqYNmgKzbdHM5CRufsuDHNNriipyaOhOaVU7Tk74xmZYdO09earg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu7j+LGzSzBRWnn1uFmUlqpqkrqCdH2fH2rGjkvXHqo=;
 b=R4NvuVdjoW0FvVEJAY9RNl1C7RY9Ue/k1Uv7F6+kiwcPk8rRgRKD90zFxxuQLIIrw3Oy4vmozzgGvuV31P51n3x6TaMDhX24+Y+oDlEFTreoeLWs0WaL1OqnCu6XXDw0rS0fr/lEGIg4/1hIoDpkVXI1hJwiBE2ol9/2zrtUnzvtcleHnusRh+T7O9ZyYnHKa28lMYV/sKFIahwTQUQj0qGf4sR0+R5Gev4fE1rJJyDRURxZcEkOLSrsCEjlSULx6UEKLsnosjOgU/7lO81ekZb79asfsXpMY2To8gzWuMZsz0RzttJrz0jNEYxaGxiBdgn1gw1cr7t1VwjNUTN6Yg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 4/4] xen/arm64: constify is_32/64bit_domain() macro for
 CONFIG_ARM64_AARCH32=n
Thread-Topic: [PATCH v3 4/4] xen/arm64: constify is_32/64bit_domain() macro
 for CONFIG_ARM64_AARCH32=n
Thread-Index: AQHcIvTz7sirpn6LKUO7dGx//UyGtQ==
Date: Thu, 11 Sep 2025 08:20:36 +0000
Message-ID: <20250911082034.1326377-5-grygorii_strashko@epam.com>
References: <20250911082034.1326377-1-grygorii_strashko@epam.com>
In-Reply-To: <20250911082034.1326377-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9468:EE_
x-ms-office365-filtering-correlation-id: 0d5a3600-0925-4a87-b9f9-08ddf10c15e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8Qt+0KOR2nCzREJ26z7kLM0ZEEc0jmX3OJfkFiCEKJit1A8iMbvWP+Xv7f?=
 =?iso-8859-1?Q?HuoDjOiHqzlmAY86/hKAaeniZGBGhfHAzjdg8PlXrPkgWNE0RigdaNeh19?=
 =?iso-8859-1?Q?wzJU4nDG4K8HsVQcYlzXiuLUbG5ZdbPMmrWIaBnrxLylbKcpccv1R1bhwx?=
 =?iso-8859-1?Q?ZvclqSXxvQWSpO/cB+ZFl2jFb79k/OtB7bZPYELT/vKTp1Oxi6xKXYd0rT?=
 =?iso-8859-1?Q?2ffg79PVPOrXEjvSCsX02Eqk2pAdp2XxWHZc71LtyuFTSe7XiNseC7wPZW?=
 =?iso-8859-1?Q?U5okIXHSOx/xFVkhQ4o1CBv2u3gHECoSDfnykzWnFLfxEg8M0dSAW5H61Z?=
 =?iso-8859-1?Q?5RZq6diCTChMSYtIx/euhBqj7g6JpuBJ322j927L5F41Q/nMahTOz9lrlp?=
 =?iso-8859-1?Q?LHs60ZzQbbAonphmdVHv6Fd+gcZuKmqa5JI1hMGn/bEhnfgDm1GWtldbYQ?=
 =?iso-8859-1?Q?Q4rRwFkfrMakcOG36JQcjpWfpdGU6aToLxkMAjp/dOUiXl6WI1LnxjuY52?=
 =?iso-8859-1?Q?MYj1HxW7EZVrDYzu5qhSMhPXHWAPT0kYC/2M42vkNcEUZOQhwZLNk3c1WN?=
 =?iso-8859-1?Q?pdVxTmqFstH+jUz2OC8rDdQxDPq9jMJgen1VJhfFtIPrx2o/Ir6RLM8vxH?=
 =?iso-8859-1?Q?+GmCyQR44mV2PHUPcP3AJQXcajiXeH+1oHuOzAV+W3oBeNzaDnWvMmFNiM?=
 =?iso-8859-1?Q?AqOKCNUz9bNZuNfjbOmSMkeNuA3TAgWM/b3SGhANj2BfMcfxlB1X6YMA6V?=
 =?iso-8859-1?Q?AwXNH5FPJM2wLcEUfA3YB8TYx5XcTS0hykl9Wd0qBH3tDFaumsKTOVMwD5?=
 =?iso-8859-1?Q?a8Hv1dxasV1p8b+N8MfWQagNnJ3+7okJfRE8CSmDyV29VtAYPRbeZH6mnv?=
 =?iso-8859-1?Q?7eeOrKomlFH8yGlxqQthGl0yaHhy1nGS4aPaool9We+/3M1uGXOKNsP2zT?=
 =?iso-8859-1?Q?Kxf6yYLVMQUzp6BM1wuUAggx3ngvEGPSfUs4NOLAndM5Gs7PY0m4LFI83Y?=
 =?iso-8859-1?Q?Ss/WxFCPX/xQY7z/YLZ766X32SIo1rg/2ysW7NgXqqmJpGpKNeKRWnuczL?=
 =?iso-8859-1?Q?+zxGjHDVbdxZylp0wSLFVAyecbybSyuTMvzMMIfmuhrnGhzUO5hsBrLvQO?=
 =?iso-8859-1?Q?Y4RIVjyc7+z/WlO50pMhzcbUM3H97a2A5JeDUJI2hKStc6Byt06WKlNZb/?=
 =?iso-8859-1?Q?xzV/y1RoCmR0rwNhaGFj2v28ZyDIcyXaxG+5tBRtMZ4ZCr56I60S2tGRGW?=
 =?iso-8859-1?Q?BrMqFvQY044rrg5DCJOniBZik5QW24L+TXICj9V34w/qMEIkTvM+G2ph8K?=
 =?iso-8859-1?Q?GboTrvq0BtV2YAp88DIboXS1eHP/t7drru19wmc9Udnv5zO5VgZv98VtRZ?=
 =?iso-8859-1?Q?caphGO8K1Wo+YnuW39PQt03UfUVLxvO/nhULjJb2ph5dEneJA4w6QrW5QM?=
 =?iso-8859-1?Q?vtQoDkIHJdRE+7jz4eNAI+gEScficP2yxF6j17EC6FyX4a2Y70cMjufWaB?=
 =?iso-8859-1?Q?n6lQq1xOVI4DZjnCqD6wHcWKqh9LB6vlL+rHNB0KBL7A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nBOzBqko4mmhhRNKr0g3hmP+jzTnY4S2rqQUsgoDmGOL6hoqacr2L/sa4C?=
 =?iso-8859-1?Q?l1CGTTtG3xkFQlwXB3gwDNGcaDEUL+kYT7/6T3CDH8p74R83pnDNxf1O4d?=
 =?iso-8859-1?Q?wLNqHtApdAfZ3k6ouneNnliDUT/O58/OmOozIK2pioPDSZUm1swsCHw6ZQ?=
 =?iso-8859-1?Q?mGTzx+HFp8y6V2n49vPfv4ATbIPRgW/kP8wc5vN4NWMDUUJM0gRPsVo6eP?=
 =?iso-8859-1?Q?rb5szy5jmZT6iWywOZUiXi6TuK8QtT/LzFH6JW4jYIPJuQmDarCowHH0kG?=
 =?iso-8859-1?Q?dl5mEt4YIZsCdsA4ufxDU9LqfkBAsHbXXBV8y+elaN046kdhAAy2wSvncf?=
 =?iso-8859-1?Q?ehQ9G1wLO4ftUviqsmcnCoABSDirR4sC3HvG2GFI/Bsx9FvMIxf6ub2Pmj?=
 =?iso-8859-1?Q?39F3LTLExOQk/Yl85n8K8U6UDFuMrp0T/+x74OrF9kXqcAc90dCEbiAPqt?=
 =?iso-8859-1?Q?PjdMbZg7rbosaPTj8Qlkb9fyE+JIdiBdXlZ2ouXcR3/MjZfKwl1zf0m0jG?=
 =?iso-8859-1?Q?0NKIp3a9r6YDP2itxWi4MloWvLo7s68TwIcRsPuMrp3cRzuDPTiO+c0ulg?=
 =?iso-8859-1?Q?Uq4VdCmcSRAk0A7JDIrVjvMWGaEHrYxdlr5nI2NgUbsflIm5UONQOpzN2a?=
 =?iso-8859-1?Q?K70JBe+PapqDq2oUg0Jk5wgP57WJMRXe/4MzKE2ZJOqUV6nAAPrHe/lY/S?=
 =?iso-8859-1?Q?WRSVjbKrTVX+AOqQoshDyU03J8eACYwV1uZaW/lMxBukv5LwrLF2IdSvd6?=
 =?iso-8859-1?Q?r7Dwmgz4ByC3KQf/2w6uaG4hqosroivSfLKLwGlvcbFjSnMgkLodjSNKuF?=
 =?iso-8859-1?Q?iv31rVE/zB5YXoFeQvYISAU1dOG0D/wZ/9xw2xpXAL/TtRGT3lZ5vPmCNh?=
 =?iso-8859-1?Q?mGD/hq845gIIq6kXBjOtdO1bHIGox3gKGeonZx2/4LKq1OrQUS4DOUHHDc?=
 =?iso-8859-1?Q?nQVaCmYcrQJn17ZtUWq4TqCddj2nZpCxT6Y00oHbrRZiZXhhumJMFinKMW?=
 =?iso-8859-1?Q?PX51pK8aU+Uat/fWTAsElSWnMRW7TflWnhTDsV0GoDtAqMDPBkQXf6DJb0?=
 =?iso-8859-1?Q?TJK0JZQlVxL3my6WLWNdNvIYWQqHRlahb8Xs5mBXZfh6kz5Qv6VqJQpVv/?=
 =?iso-8859-1?Q?UC0tx5VlXzKswK8V8DERasB0kc7TbqdoWJH6PXzYuU4+tDK1vktq//corr?=
 =?iso-8859-1?Q?D4HIhGr3aOJRWNcTe933NUhRfvEpFktlqim/215YheDEScX1ipTSEt/5o4?=
 =?iso-8859-1?Q?MedN3QRhVVEpdC9TegRQAOIE5b09ZKrXJRr0Eb2RSuD0unLj3eZiYDjBPZ?=
 =?iso-8859-1?Q?RGtEpnOwUop+DlY7IBmo2gpxouIIjwklg9ctruZgWZIeOQC5l1L6leIxLj?=
 =?iso-8859-1?Q?7Y0kWcy9x6cZz5K3slN6vVk8F3WTqugIgXpsuagCiZNmJAsIUb8baY95rl?=
 =?iso-8859-1?Q?gjVw28SN0UrDQKJgQTAW5otFMnN+1+Pqwh1SEh/XpQmVkSXtqwzCsPqx6w?=
 =?iso-8859-1?Q?suR4ncsHqGSUEX8OEj3FJvS2LG7jEgZjtfyIxeVgWf3hQ7KzyZwlXARWlG?=
 =?iso-8859-1?Q?2abZ4s2Zv9sz3sNaOkPS3EYOJl0hevohPTbu4JtYQcgCII4EilSmA94id3?=
 =?iso-8859-1?Q?Fu66qiGd6YN6jRbUH4e86SXqdwWLlfu9sLpx86lJ4R7woRqyZlosH+1A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5a3600-0925-4a87-b9f9-08ddf10c15e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:20:36.5388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9ZdM6UPRzsJmHwdaYMg94XJW8BmWhcmmXTgejfOKLoPbJCQWnBhRK7s8eqXBNVGaEn7Yy8bEa0zJpEG0ElYunbONgi1jmnAZMs1WnFgew0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9468

From: Grygorii Strashko <grygorii_strashko@epam.com>

Constify is_32/64bit_domain() macro for the case CONFIG_ARM64_AARCH32=3Dn a=
nd
so allow compiler to opt out Aarch32 specific code.

Before (CONFIG_ARM64_AARCH32=3Dy):
   text	   data	    bss	    dec	    hex	filename
 861672	 322412	 274976	1459060	 164374	xen-syms-before

After (CONFIG_ARM64_AARCH32=3Dn):
   text	   data	    bss	    dec	    hex	filename
 857856	 322412	 274976	1455244	 16348c	xen-syms-after

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
v3:
- no changes, add tag

v2:
- use IS_ENABLED(CONFIG_ARM64_AARCH32) instead of ifdefs

 xen/arch/arm/include/asm/arm64/domain.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index 99c6c97a8057..139d3ce0dd53 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -12,14 +12,16 @@ struct kernel_info;
  *
  * @d: pointer to the domain structure
  */
-#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
+#define is_32bit_domain(d)                                                =
     \
+        (IS_ENABLED(CONFIG_ARM64_AARCH32) && (d)->arch.type =3D=3D DOMAIN_=
32BIT)
=20
 /*
  * Returns true if guest execution state is AArch64
  *
  * @d: pointer to the domain structure
  */
-#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+#define is_64bit_domain(d)                                                =
     \
+        (!IS_ENABLED(CONFIG_ARM64_AARCH32) || (d)->arch.type =3D=3D DOMAIN=
_64BIT)
=20
 /*
  * Arm64 declares AArch32 (32bit) Execution State support in the
--=20
2.34.1

