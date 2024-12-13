Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BB9F0D90
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 14:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856700.1269259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xL-0003DA-Bt; Fri, 13 Dec 2024 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856700.1269259; Fri, 13 Dec 2024 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5xL-00039p-7y; Fri, 13 Dec 2024 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 856700;
 Fri, 13 Dec 2024 13:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYUc=TG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tM5xJ-0002en-Lf
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 13:43:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2614::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ad5464-b958-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 14:43:45 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9747.eurprd03.prod.outlook.com
 (2603:10a6:20b:61c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 13 Dec
 2024 13:43:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 13:43:40 +0000
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
X-Inumbo-ID: 45ad5464-b958-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q14Iy0RKutKgdkIQa65J1BRKTRprmzCchaXKGpLy+jWmK6ms7p1ZMtsGf9HXIUUKz06OJrAFpfI6M4G+WTJW7CtBs7UFdbnUQBMN4pOxAAyhel0I+xoXGPr3/oP9jRId0FLC7f9HMs9ZeTCQtFC64qENDGtyX2kFU7M7BH2FIyiypfuU96vADeloyYtNh489T+SXWFpga/kjcWvCElrRvXL0nwtRLPMbXpFLUNejnO6rqKUQF+2ANx1zcWiwROfj//mGGFGRusDG/mZj9+xcjuv1fP8u7GH8S29POcsas73Tvfo7qNiVDQLQ6QN5yNiTP/yesph0hRD6UKX9XXEQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slzVGFgFXwONJ/Cto3DTVKvONW79x4yZWlB6rJXTyPU=;
 b=Zk/lBJEI253W+ru2bjgZo77fogewxuQ6qHxUYRsRghtMwyvMmTB7WoYJk8PhHhgQIHde84bKeMbPGuhs/Wm7TeTvX/oisYoUsEw3WOdArw9ahgkomz8JhAA9EBOmYBDfHRknSIPC4fg7K2JF21v5yJw0eoUWZrFmjeITjr4vIS/g5EjFYnE5Y39nReEm50A8v6qH3k54t/ghCU7iMGhs7pED+1ZoVxk0112/RbO11AWs5tRc+Q5frjdMOb8qb109mGP1UZTkQxTti6c5xB9V8KZ9Xqly5sKLpdzrU+ckB/MF6C3GrZ5atrYxq1rH3Q550wWo9KplpoYBZh+HV50M8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slzVGFgFXwONJ/Cto3DTVKvONW79x4yZWlB6rJXTyPU=;
 b=rOV7PGTg3NTc9ZHonOjN2pKWD7IRcdn/ow9gdcwycoX032IfYenI1AhJrPyYUDyc+88HBu9tsjGQwpZEakLWoSJMaPiRE+vEoiB0npL2dEOYfFD6J4tu/HWgnDZymDi9lNqnTQqjD9N0zoCywgMYEigjKp/ygkA/8tGxlDHDbXYIeAM4qOSTzQrbm6PMAyl0r7KCs6zci4hdLv2A+8xGhhYG1OxCxHH1jnE4Sh7Ws1dTffbQQrNbgSEVGM6kdcHfOxtsKB7eYJ+8+fY01Z4FikOE70cYmgDob4KqAjZIdAkA9voHh+LO/aVLPfGcwy0ry9JAxmJSWpMpKvJYsWmZaA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Topic: [PATCH 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Index: AQHbTWUELiJDWTQqiU2CiE+YljSlcQ==
Date: Fri, 13 Dec 2024 13:43:40 +0000
Message-ID:
 <bfa54a4a5dc8c3f985e8c6eed2fbbe266aa71385.1734096752.git.mykyta_poturai@epam.com>
References: <cover.1734096752.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1734096752.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9747:EE_
x-ms-office365-filtering-correlation-id: 929085ee-6142-4c3a-b681-08dd1b7c2711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9nTwOLQ/Qemia5IgOUAjKNJs6zxl5VhLNEA8bBzCVww/4PAcAnoSrVc6H9?=
 =?iso-8859-1?Q?A8a8tGOOdh133FYucRh4qUMnzOj68ABZBh3BNRuhfYmHtd6l6prE8TjQZI?=
 =?iso-8859-1?Q?PvWuVx2+kOmJ+8kEQVY1fhzI8/oroIyIzEF9LbCi5vZDbOJqfxWwvddQuV?=
 =?iso-8859-1?Q?qCXs0myBecmMq7FTx//isapjsrVm1Y6jFFWJfHC+y0xZFaxOlFboerdF1l?=
 =?iso-8859-1?Q?EuEcFbvu2T70auW3MfLUNiORrLQV+gOByJHMLwUryacoWqqifsM256uyLh?=
 =?iso-8859-1?Q?kjedxpEaYeuOVaACM96gtrBcV27CKPxHiWHWO5dahrMwqibEz5ajMAToSQ?=
 =?iso-8859-1?Q?84u2pj9dW4bsu2WbkIihvrOklMC0QZFPQFphtTqrPn7JGfVwV7LkdwtnBt?=
 =?iso-8859-1?Q?gFHSaEtdXxv00MsIqDwWZEj+DHoyR+Ij29+CnCfJ+FKzmlTsxSHPQef/G3?=
 =?iso-8859-1?Q?N02sEQQF4OlarnqSN9GcITqn11e0dVzxdayPcQVbsa7B/6qb7XiHD47KEr?=
 =?iso-8859-1?Q?j+tIRp6jOMWW3gjWSTn8j03W4wGCZzI2Cclddfo8nzCbKxqyHyLbovRMkX?=
 =?iso-8859-1?Q?58yWwiogy8SG8KABvrio9orKFIaJjsrHCYWBRrRTjNIkmtWim1eQgdfmf2?=
 =?iso-8859-1?Q?8q8LRavBK2LbnqhZwkEmS25rkgwd/og169IbBVdnW9kfWvjxahapn8Bqd8?=
 =?iso-8859-1?Q?F6vCOBfKCJPDetmde+IWCF7ONXFscFVHOJh6TNb0BPTH9fBmTkAPWkjJLV?=
 =?iso-8859-1?Q?W3nErMGnZWOOk2PKPQC7HtCqJBhCofRaO6csmucARI8CeSxY5hzvgLaUhY?=
 =?iso-8859-1?Q?CpwUSR7D/vT1SOfZFmkIreLHL7Nbw6Jws+OsxSGsN+N4iSUic6ZrUUNpss?=
 =?iso-8859-1?Q?ZSpOFSD0VrXDSIQhIOAkcPr7PgLLhsYqGKDlBfAmW59czLQt2Wr6sJdivy?=
 =?iso-8859-1?Q?C7toFYJ3cprh7DtBr4Ln9uiZrikMP8MZMkVS93RB/uwrwnWxVZdn0IYWne?=
 =?iso-8859-1?Q?35+a3jZN1YsfM6IBNPQqeGAneQZ8Gzi6LkFy3KM/1CIlED9LnfBjI62KoE?=
 =?iso-8859-1?Q?gsvo4hvUaUOw58MC64x/SlK0PNQEl4TRtRLI2FrTF3Md6pPl216KIOFtRN?=
 =?iso-8859-1?Q?i6gUsdRiyceGZTuo6UKycdii8NC8TaLUBh+t/Fj8P3OcZxAdsCb56FwThr?=
 =?iso-8859-1?Q?9mUBz8rk9/pP3i3+H4EnL0fEdoZOb/HQb1bT/iy86INetcimD5O3D9peby?=
 =?iso-8859-1?Q?Y+Nm6MF9PcYJme0xRahdR2eTBaL/+SZuY9RueTd9h8tgTRvLVEHQhT/zMf?=
 =?iso-8859-1?Q?Q0E/1p1JalefIA/MoNFWCQBZ5U4YNB6otITwZz+qHXQULtMiH837kA28aY?=
 =?iso-8859-1?Q?7QuFstIVuG1QeDih5lDUoAtMU3uKpEDKoNNEkAYjVYbL76dpESBMPB5CLt?=
 =?iso-8859-1?Q?W0VZB7IZ9Hw4P7PuuDflJW2fyinFEdquTk/qIg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XXLUfYhPzD5V/jrrM6NBmeQB1vYBhgf2TS6k4R6Gxe4ai3w2hcHz4+pHax?=
 =?iso-8859-1?Q?A1j3OX6AGnc5O/CnQrtYOEjb87FUjOs9/Gm7kL+CZ+2bROZfsgqn6JKFq0?=
 =?iso-8859-1?Q?yqEAr9F8rK1dyKNqKetpaBVZARi8Xq5r02NkDZEjyb6QAUttuCGvXnRyjl?=
 =?iso-8859-1?Q?Nx7ryXxaO8yJ2NvAf7Kv6iHuX6jhVEiUL8qXDlXtqcF9WiF5Bt15nITpII?=
 =?iso-8859-1?Q?pL1dX0Kbr1tr9fxitzTl7yBja27Ycdf4Nchfq0RM7UK67OeFfceL0sgG68?=
 =?iso-8859-1?Q?MghZ8EPekvSN+ULBsbCp1trWYM3RxpGfBWU2wE5kDWl6bergwnLu443ruq?=
 =?iso-8859-1?Q?TfyHvcLVnSjob95/yjIqk3OZ7/1pGAJaGPG0ksS2/ts55TZPdROBV5+APw?=
 =?iso-8859-1?Q?LbBENVo4/Mjfjhzgukg/bkizNOU880V35uGkyB6zxz5xKWvNo8Duyi1aEq?=
 =?iso-8859-1?Q?YvWWeOcjC9nN2teHybZ8o+O0S3AdqPyWPu+pdBbqETePUoQrGkn6tUaZ23?=
 =?iso-8859-1?Q?jcaQGWoCFRhYWOhhjLCCGAfKU6fgiAZ3KUslBCGcrx1qzOsKGH4hCKkFD6?=
 =?iso-8859-1?Q?/TnLVTAVO6wwnbowq/q/JPSSU4ZDNNwYM4V23dzeLGedVOXKYbj9y0qrqC?=
 =?iso-8859-1?Q?12kaEWnPaKzG5SnNNkIvEOSlFvfUkm2BAn0hiVElzk5V+hnA6h0NKlt6HF?=
 =?iso-8859-1?Q?2e0lkh8+KOkG4RWHtbN3tCSIJ1CTWrL1r/Vw9ZR/FvePRn6MYzlPUdvghg?=
 =?iso-8859-1?Q?DwkBlVI82imFKXzmKiZ9YEqwI8G5RpW/8dsQ+GReKswF/gAIAie0yfcHx3?=
 =?iso-8859-1?Q?OcN0HOy+X9MN7EcAUXTW+8gDjieCdpy/hqsbw8aFJgL5+hCdDJuHBKrwbB?=
 =?iso-8859-1?Q?jsSi0en/zRbwYx1lW1ZSUfM/NdoJWYkUDzQ2jM8f7TPhEptHjXWoP4E93Y?=
 =?iso-8859-1?Q?EpoCpmqn92QxO08vf+Hg9GZgPFvi6Zl8HUq1NHwswWSTN67WLnQMkIGVgx?=
 =?iso-8859-1?Q?QPE1JLQ/xLN6t9wF9zSJiyFLbHjjEo4JWYa0+bhrJUeRTfNqgJ1JIH82/K?=
 =?iso-8859-1?Q?1H2j+6c88moGcfrY1mvbmsMhGnRK53yQeJlhjPhMv4pCtm5jSrgOaXMYib?=
 =?iso-8859-1?Q?jLVLW0vCSMS7TEZ5svoL+p6Z0LBwTySbmThZQj6aoRCEPvOhvtQmfy7ZDl?=
 =?iso-8859-1?Q?miwbicBs5rfonOyKNftgm5XYKnwSAKlQkvT2sjCEToEevp+obtBjtWybgy?=
 =?iso-8859-1?Q?ZNN+ygdW/1fAoH0wnuPC0hn9l0XR1AhQxAq2G4jJSVYdTNTop1gBDogE75?=
 =?iso-8859-1?Q?JlBAAIRJdVBMLqIZIheOMB+xUJWGemp7rFnwvOD8S3kgzV/QWwXvncVLby?=
 =?iso-8859-1?Q?Q7tPniZZQfM2xaNJ9ZFnvetIGzuAtgXZGmiQn6bQL0WXWfJEarAsPh0e32?=
 =?iso-8859-1?Q?GJFENN+Mwy9nTBa3FwZrFMFFL3jowbH9jDf/yy/su6JOipy5wUs1Mbganq?=
 =?iso-8859-1?Q?O05g/D0o1nG+eTQCSUBknDCdK30dxxRmaBaW/wJi0zmL9Rcocl3tMmw7n+?=
 =?iso-8859-1?Q?jV7KhI5Gd8tOOBQeVTaYHrQtek9qgvO1+qzhLX2VRD/Qn0vd6UFvNCm5Xh?=
 =?iso-8859-1?Q?PPPW5zrQu8UnGpLI1qCKiFf5F2hPabn1PqPzVR+Ne6mZ7Hu2CQe/y/uQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929085ee-6142-4c3a-b681-08dd1b7c2711
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 13:43:40.1576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K74TK6xKp2ZkRF9dVuiLgoS4pDdyM5FAmTDBzAgsQt5URQXSmjRUKVpPQG5B++mMm8yY/SFCogeNVCncxahs1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9747

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add Rcar Gen4 platform choice to Kconfig to select all required
drivers automatically.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/platforms/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g
index 02322c259c..8785c168bd 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -29,6 +29,15 @@ config RCAR3
 	help
 	Enable all the required drivers for Renesas RCar3
=20
+config RCAR4
+	bool "Renesas RCar4 support"
+	depends on ARM_64
+	select HAS_SCIF
+	select HAS_ITS
+	select IPMMU_VMSA
+	help
+	Enable all the required drivers for Renesas RCar4
+
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
 	depends on ARM_64
@@ -55,4 +64,3 @@ config ALL32_PLAT
 config MPSOC_PLATFORM
 	bool
 	default (ALL64_PLAT || MPSOC)
-
--=20
2.34.1

