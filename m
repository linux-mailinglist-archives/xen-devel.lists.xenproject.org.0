Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A860C50DC3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 08:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159512.1487834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4y6-0004kx-Hb; Wed, 12 Nov 2025 07:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159512.1487834; Wed, 12 Nov 2025 07:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4y6-0004hq-DM; Wed, 12 Nov 2025 07:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1159512;
 Wed, 12 Nov 2025 07:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ume=5U=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vJ4y4-0004h8-VX
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 07:08:37 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6128ab85-bf96-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 08:08:29 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI1PR03MB6384.eurprd03.prod.outlook.com (2603:10a6:800:193::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 07:08:01 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 07:08:00 +0000
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
X-Inumbo-ID: 6128ab85-bf96-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qk/Ruc78cTvuVkIikNnQW3xfJJscFKLnuHhKWZqhscrRbKCLE5BXeyiSZFxwTiPzFcxkV0NScE+aks74uzxFqqwtYovLVIf3Qef6R5mnpzP2JpMRRYXD2YpDYpqyFK894vHxT2O0ocsHM4YJDBdo97Y8VxUT8dkNq56oo+/NXBRBhGZY81n0ErB2knLgbyVlroIcJ2+Qy04qNDzU8N3tVrIdtPXT7ZjNa5ZGMqxmeeNYkafTM/6i8EeYDI8Cswv2TcnNgE/zp8b3trrTOyF2WqI0SN/yu6RSDKO6mTB9+o7kdlTpyeL5U7d0Osum8XupiiRW61R555turKz2ZZEiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xETYGnJkNgVlooehPx8NuhdN7rntm8FPEct7pYgXeMc=;
 b=qU0fYmir8W0OpqGZBIHDQVKfXUzhbnWgK/SJYFtRMyndVR8A0nwYTwa4fXeNoBRpG5BVBOkR8yOyhYLxhKCOQY0YbM3r/e0jISj099m294Qlefz/26dY6zR7wDY3KwnX4pUsrEONGxFya1PIQQoQlzdH4eg1DYwNnR4/EcW+y6+U7MFeW25lcA/M57eZstRrF9dq0fl8ce+TSeeLGB2QAn5sQhVhCUU7FENAdMfqEU7To15367RyvlGlaSAjh8YPPV7mdPpYMAR/4F8XZPwleF8bBfjOs3HB5/OALgWARx9AJMMbJ1zdfmIAMgq53GnVsrjY8cNDQekJ4izDCUA6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xETYGnJkNgVlooehPx8NuhdN7rntm8FPEct7pYgXeMc=;
 b=Mk+dFv3He38ymCHuqt60jS2kzdAjcCy2gewRlsI1X0TP0XElIS1l5QNCTrE9q0VD0q67G53dX/5Y+tmYFGIfPqnQRuCTaYytX7cvtclkCUZAA9OuD6DLWu/hVQPG66Ao+J4qtNwitiYgJa06Xy5qI1zqQuKoONhaLJPu5mlbTPnXfClw3Zl4EM1HmN8y2+98MCce79V+IcDT1/ryY6JJYGZrRJNrwsxJSP1UbEC5KlSasEJMehCy9F1AUMh3lWivaZp29V1boi8BIsqUK2M06WCXHIvNAnR0Q7HjYwF4B7QhVwDqNHyisgl85Q/S6HkSJh4c7gCPs9yGHA0b3z3C/Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
Thread-Topic: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Index: AQHcU6MU9r1SyxgepkCxXro0WqQYWg==
Date: Wed, 12 Nov 2025 07:08:00 +0000
Message-ID:
 <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|VI1PR03MB6384:EE_
x-ms-office365-filtering-correlation-id: 3ba82cc7-f070-420e-9507-08de21ba3750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tU7caCM0iHCIyvN4nRiumwAn0FuGA+VCgV/PrPpNddv/DsW7QiMCrSjuhA?=
 =?iso-8859-1?Q?lAWt32hnbYW+zdG3MRTj69ZVAM4XNnPiFUFl5traeewL83xr2nwPJ/++kG?=
 =?iso-8859-1?Q?GGlrbgtex+TSsMjcItvgTl1cELWur0QkrNrFPmuudJ6Ql1ZWvhNMsCiRNH?=
 =?iso-8859-1?Q?aocJah62WJDY9xthzPgO9w1WE8gXpbXNBGquWEwNMaIQZEZWgeQvjY7VfL?=
 =?iso-8859-1?Q?V3vPHai2dw86CHxqen/mjH1HwmvQr841phxSk6dIZZXUbtuJbQyAkRWIMX?=
 =?iso-8859-1?Q?Vwi+W8+tiESHJftceV3+MDEZkbBvJ4UojuQB+rN1WgXQt3bniRlwgm50Cf?=
 =?iso-8859-1?Q?Oy1tw9RC7TaYKvibvYb6rlxNxOmdRQuWFO9txdWRL+47CfH8daSuuJaZHm?=
 =?iso-8859-1?Q?lC7XsIx1lL0apmuD8zN8Bs+qfMgDyAAbNd69LhhkQmq6aZBt6uAOBFVCcs?=
 =?iso-8859-1?Q?DXSXGLRbgcWEOonE1tF2Yf3YJ7GS4+mmm5UqTFrz5is9dMmaQOZ+dkSjQf?=
 =?iso-8859-1?Q?JovsXP5xlZZyjUAAWqH2h+H9gulVRjwH/7m/e6Ip3voZdJM87CpIwm0jnG?=
 =?iso-8859-1?Q?14HMSO8cTBNY6gqVFTKzk5Tu+cTtY1sOtKdqj7qWcwEUTKN9eRlxahXZG/?=
 =?iso-8859-1?Q?MUXSpaN2oJTJTJy9285sXusy7O/929N8ov0bGuUyf71/AZzHeRhN0jBP1Q?=
 =?iso-8859-1?Q?RhRGHTW4QaNyVd+/51WcmqhGsclx1/2n556pg0KPC0ssk+AAA7mtLErH+0?=
 =?iso-8859-1?Q?IfLkrCgzExPPdMaSag60sdCsK2M0b+sYMbpFeHMTTVsGxVyQGOmsceV2iW?=
 =?iso-8859-1?Q?LmIW/YHv69OVHuI8Df0faO5db2t7ImvdCgcf+dDMpTeX1fJnWVm+lGx/B5?=
 =?iso-8859-1?Q?ziQbFYWXUi3wdhx+6xocR7wnaEez2eMeyOdYosXHpoG5x4WzYK5GUEW4RM?=
 =?iso-8859-1?Q?UagE2kgkFxzplU0QMZ8G9MRGF1bhbbgDX1A0pIOCTAoFlYs5XFVScK+e9v?=
 =?iso-8859-1?Q?O/530ledlVZgaxnXzmRQhrcWUfPyG1anpdqQqku+iscR8psaOSMdwv1ERo?=
 =?iso-8859-1?Q?WB0nN8HBYPxCrCOuOnhV/Mey34husYl03eZ1bcs6U68qEsGd6c3J9aPiRR?=
 =?iso-8859-1?Q?ViD3qDgvHZ13TPKyrmi5NpZAvv+cTmDMNApnUlF7F5Z9WXCdRJoTdqAE4u?=
 =?iso-8859-1?Q?jAWJBFbxQna/lRpZ3ztTs4gASHUNhXc0RLR53bR/SkJQNN/ZCM9UAVE1vT?=
 =?iso-8859-1?Q?9LvzrlJdX3gyOEgyBUGrIkaVAFWJM1iG95y+bcwQ1gqGu72EnXP2E2Gr/M?=
 =?iso-8859-1?Q?bCdO1aeJvTCKTRPkqOPj2vHev+AJgKKdjE30wO9xeFl6VxMBRHY04P4Nfy?=
 =?iso-8859-1?Q?1QMKCsW00qmAqk54kQ6vwJqRt1EqswXFHQRfuVEjG0myDkrOqUuEZNmzCy?=
 =?iso-8859-1?Q?ze2WonOTcu7aI5FgeQcS9+65kmD+S7PAurWrD75zQ2LgCAnmpjR3Di9oq1?=
 =?iso-8859-1?Q?4PaHNjFmTB4Q4hkhhZ/T60wbKz+PvRr3OPRI7VPLIlyhPOOw+0+k6e9Smo?=
 =?iso-8859-1?Q?WMIAakPEj8cNQgRIIz+sXTg0yQvs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/9VQrmxLmsKKfAGf7jX/ffYDdhm0RFXFNEJBOOKl+07MTr3tpggoMquLv+?=
 =?iso-8859-1?Q?4xeM2NrOsjPbM7X4UJ75n9iAAKT0fxaNloGBP+o06bMis2+mIrVGnbZQFr?=
 =?iso-8859-1?Q?tsS9Tg2jWz9f4KjdFBPqst567TCarmXchLteOloEljEBwWXT+kD7HZkag7?=
 =?iso-8859-1?Q?tZc4VlbZhcfm/F3D9+wTbX5LHm0UxtqxlwRkR78GkLERsEPrK5JsGWJSdb?=
 =?iso-8859-1?Q?nzpX6UGOqA87+ciTrUfblThg2TZOU018fbzdM0Mpu4ALK9ALyiDTq2e8Hn?=
 =?iso-8859-1?Q?y+cGf1q06l0eBqQEzs60CBrTDnnAnj/h1TLmYluELIjTC8NAi/dxcx1fUh?=
 =?iso-8859-1?Q?sFeeYk0V9QSO6jZy6C7jbapmr7mPfeWNOZym7eCzq8vxMsrKL54ZW3y0CW?=
 =?iso-8859-1?Q?NEbWz30I5+Lwmj7DQwdTp7VnHVNXEGZhuOITEOiakCVzeWtlec7yRXvdFX?=
 =?iso-8859-1?Q?tZSguxO+Oqxuvga7gGplgGjqULj/Ent3A2v76BQcou3zatolG9fkadV9I7?=
 =?iso-8859-1?Q?7psx2qK+wE63Qp4RA+C2+lGT/C8u625mqI/AGC6vqGsS5ZMEhjcCYRGBPx?=
 =?iso-8859-1?Q?O0qlYatEv7Fqz6oZLWAwMqQ5Xh8acLBzcIcNsDuNF3nUjUKsFPVKs/QJ1b?=
 =?iso-8859-1?Q?2qPjIUlvthCzQ9M/5DiW0KIvRWQaDhtiGTPNYhvsOMzrBYNIHuM97yn7t4?=
 =?iso-8859-1?Q?xlZTzsVLCUXhvdRWe5fvg04eqPj5MVlvzc8yvBWlnldw+UBToe/rTDO7A6?=
 =?iso-8859-1?Q?tO2AmSNOobfnMka88mGxT4v/U+lnRuaOzf6dELx7ELJnb14HDFV9G3Odsx?=
 =?iso-8859-1?Q?+YOOwGveo+d5xKgBzYzn/p6mWbMc1WV4UqZIrwf53CSgBGzWbqYR7cqetq?=
 =?iso-8859-1?Q?mXsbmUjsKb5kcOHt7TT1IgIulAEuLpULOlUh1kKF2itSPoVzXnP4ZfBz8I?=
 =?iso-8859-1?Q?tNkKEWFNAsubkKjEgXxP5+eDQJQHlLdqKf+WIrwqOfbcmeKhr3+AHxHuN4?=
 =?iso-8859-1?Q?4pRUg0DNRR2Nw+bHlNxT3gQpK5H/JuRYCMf23xnpKv4QBnaBEmKdKslG1a?=
 =?iso-8859-1?Q?9fvC1ObOr0qdrR8cV7FchZwVeN9RxwU8cVY8iHC8edjB+zbBwqyzlIcuJI?=
 =?iso-8859-1?Q?UInHkV+6DW/ZZSFQIu/RVoXXAOAaoIoG7vk1QmZINoh6pG3XUH6uF02RxT?=
 =?iso-8859-1?Q?zmbHoYta33v/WMIOEkMyDLIBalHtr7G3XVKyNh8Vm4pfoVKUV4/8n9py/7?=
 =?iso-8859-1?Q?1nCBs7EhVZNelq4Hknz4D817k82NC8aX1GQYde2I4qzq02P6L6KHD8MJsz?=
 =?iso-8859-1?Q?/HyRcQCp5xMsXe4+qWRr3N+PpJhsc4vC9vbIzekWY+PJA3PIxZkWlZ1XHD?=
 =?iso-8859-1?Q?hVJP2dave3/SN706Qr2OBN0ebC7c2s496tC2ot0acQt9wTbkcvnoerilOi?=
 =?iso-8859-1?Q?evYxlKx1UkqO1AqCr428Lbs4AcNjOjbBFSbfCLlxaYSGIOUpct/hxuXeGL?=
 =?iso-8859-1?Q?dRIJ919+WjULDAFYCel5g7JQrw6aN/SWSRn5xgZSf813WhxzSz0z0WqeUU?=
 =?iso-8859-1?Q?bwC8hUKVTW6Qnu3oERNdUPIIzfBqC55IQ9fg9NziC2srqbgi7ZEYbcE1dN?=
 =?iso-8859-1?Q?Eb5P0Sg5v6NFm32CjtIOct2m3HYrHHCkDyLKcXDjMEuGu0bxcR68adfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba82cc7-f070-420e-9507-08de21ba3750
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 07:08:00.8227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H776GSKta3829b1gJtji3FAv2qa/u9Qe0NI43X9jydmql5l+uMqtASqoQ+Jrcem5Iqdc4TZAX7EHAUmzyzP+L2awRcNslnvKb36ZF9kh2S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6384

Remove the redundant local 'DTB_MAGIC' definition and replace its usage
with the canonical 'FDT_MAGIC' from 'libfdt'.

Fixes: 66edeb2e3972 (arm: copy DTB appended to zImage)
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/kernel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 48f4b56d0c..7544fd50a2 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -40,8 +40,6 @@ struct minimal_dtb_header {
     /* There are other fields but we don't use them yet. */
 };
=20
-#define DTB_MAGIC 0xd00dfeedU
-
 static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
@@ -383,7 +381,7 @@ static int __init kernel_zimage32_probe(struct kernel_i=
nfo *info,
     if ( addr + end - start + sizeof(dtb_hdr) <=3D size )
     {
         copy_from_paddr(&dtb_hdr, addr + end - start, sizeof(dtb_hdr));
-        if (be32_to_cpu(dtb_hdr.magic) =3D=3D DTB_MAGIC) {
+        if (be32_to_cpu(dtb_hdr.magic) =3D=3D FDT_MAGIC) {
             end +=3D be32_to_cpu(dtb_hdr.total_size);
=20
             if ( end > addr + size )
--=20
2.43.0

