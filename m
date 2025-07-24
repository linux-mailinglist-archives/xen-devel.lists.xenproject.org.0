Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78005B11443
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 00:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056648.1424678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf4ox-0006bZ-C3; Thu, 24 Jul 2025 22:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056648.1424678; Thu, 24 Jul 2025 22:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf4ox-0006Zu-8H; Thu, 24 Jul 2025 22:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1056648;
 Thu, 24 Jul 2025 22:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJOC=2F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uf4ow-0006Zo-8W
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 22:53:50 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f4383c5-68e1-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 00:53:48 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB7450.eurprd03.prod.outlook.com (2603:10a6:10:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 22:53:45 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 22:53:45 +0000
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
X-Inumbo-ID: 0f4383c5-68e1-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bah7hJ+SAA3Kso/j8HGYhPzeq9c8qiUqTle2BIwNWa/zKdvPC6GmaJphEjKhQ3zA8J0oxEgECZl3g43MQCrbkxQATDT/O+bXJ+P0vtGeYLuX1GOZCYgHwOSZpVM97D0GDDMVcqUdW/FKi3OveP5vLKDQJjITDy0tDD/0494n5LOQDWuLqU5ifa8QbYT8mEXHiYkI6H76VWIJmnC6O0E22NO7ys1jmsxlV58DFijvh0rSjbTIbWQ0cvvU+x9GpiVoupKkJwe5viRr6DcVjntg8TISeWd28zVSBBfRB/p9k8y9AoOCoW2Tf5zNScvp4ql89+3qbC23/GVPIMX4luK8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JktNGlsRdbZuYOiRYkCgihM12W2DpS5FTTNVT/9bP5E=;
 b=S+oty9bL+fSrgcJQALXQNZ7xqh9TvkFbZ/rfWENEgvZ7qKxsNsj8POHJcU/t9JeUMSVAko9qUAc9NywufGIfFLdz388OlSNCe8udZNKyx3cvAmJa+m4wHgtX5Vb6hYQ9FSmJr8k9ZXJA/ZpapPydd1M5WP9j4AVNOdYe48dl0kdo8+ZpGFhT3htIdoz9XDjKjRN0sH2PSiHGV8btjx+0Jb75irQZWtjxX63dIR+lvMIH0LnT4f+1tb4ExES2L/L5puvCgrarJ/qSQ1rQFZsozfPE6eg9m1Q8yNvqVAPWbn3Yrd9iVqwF9B94g/bKoaj12gfgNrx1E8jMwxso+mcC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JktNGlsRdbZuYOiRYkCgihM12W2DpS5FTTNVT/9bP5E=;
 b=L2+szs+nXWYTUrfdPdirJlIa1GYi1qG4trDY8cHmhksAikGcHcp7NG7RTpB771usgl7ra/AvL5QC2D9VdFgh1ewdGrMLpGbjVUXpwqrhEDwlugARUSR3dXdLEyM4izj6/Qf7agIBS5vpPbzyMWjY1XdwxaVjIruqPvVj7bdW53biLblngS7QeGjXpfdwHfYNbaUtexPICValF5vUH/jxN6SRZzy8Y77sRl1EI4RmxpLrG2KqveDhVxSRmz8cqXZbHqC0qKOvcE/4k2ofNpHN5Zx1S9f+d21yWFd0dpOiTZRDIm/fkSfwQywlNtAIU+okOzGoiCNCBmaZiWaHSaGeQA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen: add missing noreturn attribute
Thread-Topic: [PATCH] xen: add missing noreturn attribute
Thread-Index: AQHb/O3P1WRCmQlwAU2FDpmGMEvRXg==
Date: Thu, 24 Jul 2025 22:53:45 +0000
Message-ID:
 <7b2884c6f89a0af671daa26798154b5ac0042a80.1753397522.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB7450:EE_
x-ms-office365-filtering-correlation-id: b90e9d1f-d648-4466-74f5-08ddcb04f1c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uJ+I5jjEl/VpEToJXPy2VysqrVCCICzUewRFfq7RnkMQloiGFXN/znoZ2V?=
 =?iso-8859-1?Q?gT1Qu8Fb3nCaNM8/P49v7zhzfS8ViY42Zf9cmO7WhcVlI+umNad7auRSyy?=
 =?iso-8859-1?Q?ftcLvjDmFQ6GMvwaEbc+Ni9CwaDGRfzVqQs9MY857NZi8PCudCXfKhVUiu?=
 =?iso-8859-1?Q?soEpsbK5Rdw5VNwO5t7pT7xJ518sD8Vd8A2Nk4yz8Mr3Xnz9FUlRzXB/Ms?=
 =?iso-8859-1?Q?NjrW1iWfsTInpP18JoeZJFXMsnt5yP5QJ1OgDYiKV/Vsc6Me/lsi6B+Cwc?=
 =?iso-8859-1?Q?i+p946/5CfTJm4GTa6nQnG43yOSIPaCu16oREO1kPN5EFVADjdClI9Ak4N?=
 =?iso-8859-1?Q?NxsIX3dZa1TSrEOEwAAXx9nDQiVxd7rrpKfYR0R2IF2aXQLOsObq4jyFuf?=
 =?iso-8859-1?Q?ACS8X8TYESV9Ph7wqLr4bG+ZzekuEdp4KtggTonlvaA53SFHGFXNlJTqs+?=
 =?iso-8859-1?Q?J+GHFHQSNxXD0vzCRa3t0h9V95e6lWg0zeHFAyV9AepM1HR/5qbYyGGbn+?=
 =?iso-8859-1?Q?nwHUBjzA2D77cgJU56i0HHw2jTUqUZFjvLvmun/CAXO6F715jTrLX2dub/?=
 =?iso-8859-1?Q?eoLSBcRLFfxPaWqIflo1aZIxLk78qQq3VXMlJ+YlVrb5YBFpO58j/GQphj?=
 =?iso-8859-1?Q?iCCUA5NxaWG7CI92WT8Zn1o5ZVROtYvfWJxqd4tWAsg4Mizmr+pRWXGE1l?=
 =?iso-8859-1?Q?qmMytAyaq54+r1P/hD5dLTxTE/ZaYOvrQ4SqGkL64kIzGCS4YmcnVWDOga?=
 =?iso-8859-1?Q?mqjeTzppptbhQgz85Rihyu0lfATUg5gpQmatkrZFvkmPay5aa+w9fRb6Tq?=
 =?iso-8859-1?Q?GVX25FL1ZZzc+q9a+am3kXnvacNaxEJMgMYkdWoTnsZjYk35JV3yrUXdL9?=
 =?iso-8859-1?Q?6Xepg1QOyP+cCD0L6i5gDTsh3mXwu+y7TO52ctOyclU+Zkv4xd8Ll5ICya?=
 =?iso-8859-1?Q?n2SZPHRM0/HDXRS0hKP4BT45XitXeC5Vlyx/LYY3AHx81qS4rZDkMdnSt1?=
 =?iso-8859-1?Q?ndjHyRD2+OgXJqA+F9NFRN1lrKTvAvxQdJ3Klw2zRCW4nHnJCorOUHOjId?=
 =?iso-8859-1?Q?3ABlXVJASYZhTyvJb7tMorHWv3GCV4LJYEHOXqyYw/+CIHRU0S34/q5Oa1?=
 =?iso-8859-1?Q?FzwJ90XSPoIAcaRFdSjcm/xSfakctMs8fqdVhrS7Z99RhNEEe3Z1kapK5v?=
 =?iso-8859-1?Q?wulCIkVssVZs3GOXri5SateF3Y47g/SfpQGaWoM+9kxoSUctLUUIEmeb8Y?=
 =?iso-8859-1?Q?W9ddAJUU/T6NEMwG7k1adprAF0zXbT3sGbJwUafhgKV+QWet9xll5jx7MV?=
 =?iso-8859-1?Q?dhRGj1KEb751tGlYgY+2X6BuI4Rf17ncjjAmz4hBHcOw4NF5tbkN0tali0?=
 =?iso-8859-1?Q?cEHA6vaTgahzKV058D31zdU/xa9l07YkTik8fv0oJXb7+xaOW30UYkfQG4?=
 =?iso-8859-1?Q?0gL7sdXMAV9GyCIqtfGcWc0GYKAsxewL7/uQcDo6wWyHIS6Cq7eUBHGXiv?=
 =?iso-8859-1?Q?l8OZ6swcgAxQW6TPGpVOCSjhCfdYc2Z6XBylnUgCX3Ow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?diA6494lWIpADUrF33xoDYQW7q2NRQsISW/JAjTJxdSNdvQFNQNkb2XHT8?=
 =?iso-8859-1?Q?Sb2g0AUGTDlrOqdLghuSL3Qw/jA3hRmEVbIDTjpUCc9sj3kC2XKUcKzlUZ?=
 =?iso-8859-1?Q?/R7F/GbN0mYRgJwFPFpW7KvtRupC/poEiJaJNpBYKrM7g+L53FrjU++ZDi?=
 =?iso-8859-1?Q?xnE1bnzH6/1RNVPwZ9aIdiOkKWrRNZqOIQIz7d/puRdVhxNYxwCzAtdIMF?=
 =?iso-8859-1?Q?Y2yhAzwdFYZ3GQUkYaSC9mUqn12Gx9AZBirqM7Zq6tTCgA2Z93zlUFISgA?=
 =?iso-8859-1?Q?IU8D98tRhwDsBSAZtqmu0a2rc29U7/0r/qvIUoXQYw53qPXVUbYfDNwUbQ?=
 =?iso-8859-1?Q?GyienxAfjdzPKPepF1lSTryiRioRxiHC3a4Q1FZoud3a9KoQNSjSQx3M5w?=
 =?iso-8859-1?Q?mEIVUZscb3g6H/BU6lHalR8UvOob6WuqFT4/cAyDW3DLlnYUKIO3LREA3P?=
 =?iso-8859-1?Q?EydM6f5kx8QA00tJK8tRqtEc+6gnRhg/+O/1gwrTHDF1cTEIR/y7N9JZUc?=
 =?iso-8859-1?Q?wVMl6AAiuqmvnKpGgWoiCQ7YHxrfzhOr6FrGPMEhrUl/aJr3iZOkKMpCDb?=
 =?iso-8859-1?Q?ParHRvks4+GgSbfAlF0kQlU8liUiLD0HsYMIZE+HUdNlW/OS0Dua9jJzrc?=
 =?iso-8859-1?Q?BR4iak33LqA3cPPN9PnWxXbn8kAckddJovH1sJ5iHBVDk87wcaJCAvvYhH?=
 =?iso-8859-1?Q?d81Tc9A0qn6z48Yx+KjI+QR8kvSHSr7XZHpKovHlZ1hEcS65FP/kqWiHn1?=
 =?iso-8859-1?Q?gAIdbLoIyyef9bPqJBOSCPgnEZtJ9vWlGogkra5qu9Vem/HGPnreHVj5ZQ?=
 =?iso-8859-1?Q?lFwuLInEZchNU4yVMhAxp8ccgRWRF5bgU9cP8+2RjNz9cyrpo/2R8mBV6k?=
 =?iso-8859-1?Q?Q+z/0uZiRFvfqKlMoWFhmwfOV3l2/DUiTFaxsVzw4tW+OG/L5z84o7uKTa?=
 =?iso-8859-1?Q?uTGTWNhXifA4VwyIRy9UHDS0IHVFD9LzKZLzXLhNihTPROXBwr6fLAzAVp?=
 =?iso-8859-1?Q?TsYRbvqj0gE4MMqzbR+1NJVJrh/7Hx9uL7dVyM8zrUpgZAc1650A4hy4ML?=
 =?iso-8859-1?Q?PRG6DjvR20aKHCRCE2hIDLzzyFFuBIQT5WfsZWMS/cFe+fHlIQSRv1G1Tu?=
 =?iso-8859-1?Q?AqYfMJCGbN/Smq9YtcIV5K+DJdQeYJ5jSBeYgacUpA9V/pNY3kHLlbwuMp?=
 =?iso-8859-1?Q?aKGK7XoCSJQfTi3f+SKlL6wW/apQZZUF2MPxDqkxajBfTeFvvywb1xTEXm?=
 =?iso-8859-1?Q?Rkp6btMweCKJM1fwl77/eX20BSxvB2sZaYYDXbCUJL70yUauNzQOwyErgJ?=
 =?iso-8859-1?Q?gc2YTgfao9/2/MB7kTLZtrdfiUBxio63+EvgsYaYZVrtB3MeBUV7Scejrl?=
 =?iso-8859-1?Q?cL13jKdcy7xZ/UCOCvxdhS7uiC+ZRYazvTJWPwNqFjVac0aLXaLlyTbMOJ?=
 =?iso-8859-1?Q?sYW3amfvhIiqvyGpmMADVdtgLn0+INYaMLuc/aK1y4Kk4RPICHwH/G2Odj?=
 =?iso-8859-1?Q?clquWgoFH84wwqnKjsv5vAFwb2iGzcs3+/AhpleokTFe+541gkpf7rbAej?=
 =?iso-8859-1?Q?3slGTYnbrFBZLhSTY2u6MvIUOHHJpIZxtRGu/FntVS/HRCIZrZFXmFhEUs?=
 =?iso-8859-1?Q?u5nf4jCG6B0IBEP8cFMAfk5hLctOquvke5nGwAf1GvSl8QPOXU/m1Jfg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90e9d1f-d648-4466-74f5-08ddcb04f1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 22:53:45.2675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BYklXaL+KpJZSHmW6X3Yr0qZaaB4VDFlUr+WceZJFt0+IfZrJgxEArf5iq238DBsd76T3wE6ELbiZ8xhgkXSYKhWGK4nUEF5fCXSdMDKTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7450

These functions never return to their caller,
causing a violation of MISRA C Rule 2.1:
"A project shall not contain unreachable code".
Add the `noreturn' attribute to fix this.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/domain.c  | 2 +-
 xen/arch/arm/setup.c   | 2 +-
 xen/arch/arm/smpboot.c | 2 +-
 xen/common/efi/boot.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..310c578909 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -298,7 +298,7 @@ static void schedule_tail(struct vcpu *prev)
 extern void noreturn return_to_new_vcpu32(void);
 extern void noreturn return_to_new_vcpu64(void);
=20
-static void continue_new_vcpu(struct vcpu *prev)
+static void noreturn continue_new_vcpu(struct vcpu *prev)
 {
     current->arch.actlr =3D READ_SYSREG(ACTLR_EL1);
     processor_vcpu_initialise(current);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 27bd3f5a6e..bb35afe56c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -306,7 +306,7 @@ void __init init_pdx(void)
 size_t __read_mostly dcache_line_bytes;
=20
 /* C entry point for boot CPU */
-void asmlinkage __init start_xen(unsigned long fdt_paddr)
+void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
 {
     size_t fdt_size;
     const char *cmdline;
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 73de7503e9..7f3cfa812e 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -315,7 +315,7 @@ smp_prepare_cpus(void)
 }
=20
 /* Boot the current CPU */
-void asmlinkage start_secondary(void)
+void asmlinkage noreturn start_secondary(void)
 {
     unsigned int cpuid =3D init_data.cpuid;
=20
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index df29444220..4b60bd719e 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -285,7 +285,7 @@ static bool __init match_guid(const EFI_GUID *guid1, co=
nst EFI_GUID *guid2)
 }
=20
 /* generic routine for printing error messages */
-static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
+static void __init noreturn PrintErrMesg(const CHAR16 *mesg, EFI_STATUS Er=
rCode)
 {
     StdOut =3D StdErr;
     PrintErr(mesg);
--=20
2.43.0

