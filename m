Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B365B10E31
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056227.1424424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004X9-7V; Thu, 24 Jul 2025 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056227.1424424; Thu, 24 Jul 2025 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004TR-2t; Thu, 24 Jul 2025 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 1056227;
 Thu, 24 Jul 2025 14:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexNw-0003AJ-4F
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:28 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8393a6a1-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM9PR03MB6756.eurprd03.prod.outlook.com (2603:10a6:20b:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:57:24 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:24 +0000
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
X-Inumbo-ID: 8393a6a1-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNngDmMTmXdeiqush+LF9s4c/LXA6kBHAi1W0QkYVLZhIuJOCs8yQyfBJClSz+C0IHiIdgGtlB2JrTesM+68D6AO0N4ZYbpj8uXbcRQPa6CiBUQOnJBoXy9H0wi/3B2bM71NN52/A0OH8R4pYT5nb2Y/ybkOwrGQO/DG/t8fRajC34caP6KcBpBsmXfp/d6xW5B6uX3NpCe3wS33VM3iAv0eplroXskdaNtRU9X7BT1Qd/t5rahOXI5whvX5FuLljNLx2BeUMyQ1JO9TKfnau9sIa6lfQi2DKpX/TlimwB2E/yw6xe1kACMpA5JdqyvYC14jK+N74wxs1SGCS6/vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3bLy5uu0UYlckr92hqRhcJbncFKtI0cZhnWMHbFfWo=;
 b=AenZkZD/kLp9nYw/fuprRaC8VRE6lM1AYT7EjGMtHwJe9ZKtxWn89p+H8nunW5EGaCnXixO3R7ZKGpnlUYJALKYZJvfI2zBJgdzNj4D9FX3e0olWhCm9JIbQAdpSIV5nozVaPdXjfSGjIjjAxB6ZcLHFa2d7IBkPFDpaOhflYOF9ThsJ9NtC7gfxS8G/5+hw1vRsnq7iYHT5wL/GYt3HwZpINpshEdTtCEBDlWLzhbWGa9ukdzXbIGpHh0Ce7qeo0oda/hmEQdpy8zfOUJPrKCM+2rXfn8aEgdMJOS7eQDFzPL0cku20S5NbMD95Kvt2sgsaSZr3PNuXKlC+9lA7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3bLy5uu0UYlckr92hqRhcJbncFKtI0cZhnWMHbFfWo=;
 b=nBQes/JVNf+3qznGbXPYJQZ5HLlRWa0j9a5ij1RFwV94YaCtaHxIZb0q0GwRpidQ4j0P2UQoE3dBuh7faKrcS1ZOs49uJPDKJVp5sRdVztONJ7cuduBV95aDoAloUJNq2saNhlHpgl1D2OPPdCwEEdYFRHZoS8PMmlZD3rmyJTaZ761Xrlkk5fdK4ljcVy3wgeKNJlmn8f9dY5bOoQxQHIXJmDZda07X5xBiZ2wX35RJDnp68ZFz7L82zLj0dPoktpEESl3V9lg0T9BPNKfaWZ1bk0g0il7d/NWV9OOFV7QF9Wbov3fId3BBhDr8l3R0KbA9aGddfUWg3sxLmyxzhQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 01/10] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Index: AQHb/KtDaEMC78eM1kywOJDq3vCnLw==
Date: Thu, 24 Jul 2025 14:57:24 +0000
Message-ID:
 <7b53e684d540372f625327f72176a9ff1988e748.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM9PR03MB6756:EE_
x-ms-office365-filtering-correlation-id: a2a98bb8-102b-4880-a7a9-08ddcac26669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3L/VVLP2zMxgOWsN9hrZO5DjmasmtH5HsNrrrRvKud4t+9k0G66uCqstmQ?=
 =?iso-8859-1?Q?WLI4tCGJoX5F5U0keNgvID7vmdpZpG2HRC7ciAfUQwbwnQeMqA6KIvMLaS?=
 =?iso-8859-1?Q?dTI8NsH1qe2r+IHcbRU3Q/QWvau/8GaahLnbfMVy+LbBVm/KVfJDCBYtFS?=
 =?iso-8859-1?Q?8dkxajWekpRmqp7KvwKpgbWlWoGocLhVhRp+M3yKItCrKxzuTtKHyVizLn?=
 =?iso-8859-1?Q?15rrESRp4W8HQlJ/6xER0p5Zhcb/5rewHDLVIaPmrEXw6A3+Y3jkDKMv5B?=
 =?iso-8859-1?Q?whtbLFlLGKCePLAtCYLMxJy6PgMQNg7mWsquaVjXIPWEYYV1VWKXAJmk/f?=
 =?iso-8859-1?Q?Fs+cXBhIsoXyKLJ021QAfJ5HYfwcszsFgGobkQC4KHwendreNPBNv6RkPk?=
 =?iso-8859-1?Q?24Q2hkgPWdU0zi2TtHxQezC926cIAICqw4OMgfWhHZEJIixyyT1ZBogrCk?=
 =?iso-8859-1?Q?a8Vm0/4cNW2V5+YLcTDfTn7PuS1EgfdbYfV+eHgCRr3pos/Cug7qOqio3M?=
 =?iso-8859-1?Q?w2OeffCMr/L2zfApDB4AkI42FRl2Jf//187mwyGjtzceUV5DoceYU7736n?=
 =?iso-8859-1?Q?rzkfOf8m5yOqeWyOtG6G5+mTRLzmeRQKwuyXGGPTWR4EWKiPPUBBU/cRKl?=
 =?iso-8859-1?Q?HxiZNbKpuncstLnYI36j1Q86rK7QlreaEfCHeeAE1aJs7fs4KvmzaZDaUv?=
 =?iso-8859-1?Q?ASkaERSKk8/K9gEHFUud7jx3DwKGzvxN6qb3naVYQpu6WC+aL94TaCR87y?=
 =?iso-8859-1?Q?WXt1G/+blz1dGJ6gt8MjQfA4hph9edD5PWYkM3uU01lEc0mxIQqgwGN+pb?=
 =?iso-8859-1?Q?ok/BtC2PJtYvbtzI0BTEyTgDNDmX1AMk9kVnmV6VWq+oRmP/dOEjmNII/f?=
 =?iso-8859-1?Q?FR4DFpXp1sl810lZCk7cWSG9qJHjHI4EhEoTcRhSUCHPy1/11AZeIo0azV?=
 =?iso-8859-1?Q?q2HzSzu5fdd78ZxaZTDX04pl+ARadOCArngNdTblWTdEMN2TbIhrP3DHaM?=
 =?iso-8859-1?Q?iGgAG+YSXlwChdCoOmUZ7MvYgQCumeb7iO0VvlHK21VIVlLbxyZwaduM4I?=
 =?iso-8859-1?Q?6lSXaDTSdEDwJkPACZxcwxy5brxLWzwWSJ18XJ3woxIaAikbhyPYkPIirx?=
 =?iso-8859-1?Q?mI584V7u4liPzALIgqc5vsbDHRVl0tX55bD80/FnZ54blaV7wszk2cVkPI?=
 =?iso-8859-1?Q?MX/x7JCL0fYTB3QM3SacblJBgcg4oNAg/twttfFryHq8JXPRm86BqgqBgk?=
 =?iso-8859-1?Q?G4PV0JM9Xa+Z2i/QERN/oa0dpr8P4DOnMreTzSW1bMvwy0h9fYnG2whyZ/?=
 =?iso-8859-1?Q?PftzM6s2cf++L6FJZjdah32b04n/eUEGVWSjxuJeqZ41cptlbUWeSucixo?=
 =?iso-8859-1?Q?uvaJYPDENeEyj4M0liq9HfWdIm/4GxN8wHKn2x3UKi1ESWcqHpz72ydekz?=
 =?iso-8859-1?Q?ipGRaawbUxWoa8l2NLYRoz3TBhXB1vcUB+kCbT25aX6ZSg6KsJe2xUnuod?=
 =?iso-8859-1?Q?i2wqQmhZiRUFjQ43In0K9CZZJg1qy7UIKO4l5LnT/xUw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5Qhz4CJdlVK65yZ6XDxMARxeLtAETA+9zPIi7mVZsT0xLueV9xcDPvqV3C?=
 =?iso-8859-1?Q?nXk9pxtl5AhB3g/ySi1FL/j2bkJYE6YiqcoDvFbulBmpCmrdySjZWI5uCW?=
 =?iso-8859-1?Q?R3nEzAAg5F9EAHfPzx6ftQDiYI+8W0CGCjo1QnZBRaHdN9T0Px2C8LoE7m?=
 =?iso-8859-1?Q?vN4IlnjsSOYUZjPWknXFSXSYnb6eAejbmoDRNJ5uDlztv30hO9nDrKByEX?=
 =?iso-8859-1?Q?5DUy30tWWmCVpUtmeRTSRcQ/8mRDI6Oda/Hkr8aW4eBHOWxRn8yS1/5kmm?=
 =?iso-8859-1?Q?Eo0p90tXENQWHRIw9pbAZKqWsTvOSEAGJEsiuz7I2TgWlg4jZnaibT3P2Z?=
 =?iso-8859-1?Q?GgiGBNtpfaGEHkzdxzURLu283X1neCSJzUyTpvxI0T8g+bfgqXpuVH8dq8?=
 =?iso-8859-1?Q?yFoKle6PO7teN5has+r7BFLK5yWjKW9uLQja+MHFPx5qY2daY49do+4V7O?=
 =?iso-8859-1?Q?+FXI6SfM6E5P1c7mgS+xOV56I3uJpyrWsL2WSMkOVEKMW7FaXNKIqCF/hz?=
 =?iso-8859-1?Q?wjcrdvLN0nEpk0E7cNxS+1WY7aFyBlILZ2h7SnrvviqhvRpjG0exNGVMfE?=
 =?iso-8859-1?Q?wfVQ+JnOq8V1k44OFTOu/MzBVZ1CKvzNtBK8XvbyM0ool/Hwt4I8gXiq6P?=
 =?iso-8859-1?Q?C8hw0aBPUqAEDcNT+bG6p4FZoM0Nzt4YzjIPzb9MygNu6pe6RnnKH/jx2i?=
 =?iso-8859-1?Q?gC2M4CgRlV5wah+mQwUhpo1yuJ/ta7on8B10X3eJWumcsm1ILdTupbd0Kw?=
 =?iso-8859-1?Q?s5Yvilmpa2CRBxUhRRH4ANrIMorH5eJiQBH6OXSuO60y5G1WgYGWhI5GtH?=
 =?iso-8859-1?Q?bYv47uGZ/wtTNxcYvWXKZJ4GdXYqjIe7oLzmRqOEJjYK+I1ahG8v+WVim7?=
 =?iso-8859-1?Q?hblJPzGyUN4u/1T0aRPVOr4AdeRe9tSOs7RDy8FT0bSBdwmfgRN44Lacfa?=
 =?iso-8859-1?Q?NRl6OMkg9CZwWM6VQbZggIoIKv17XKG3/oif8At45qd5oDKP66V/k5j+Mt?=
 =?iso-8859-1?Q?M5s980JBUy03aAsGgZetP4R9hlvYUtimn4NEnKjkR461cJx+37usfwQFv6?=
 =?iso-8859-1?Q?tTgE2s3ioX0GhsDxC/v8GUkC5hFaUHsXF/GJ+pbczI4CJQZbfOhFdZkg9v?=
 =?iso-8859-1?Q?Y2qyOUUDqIUDylhoqRUZGYjndVPISonHy9SJ10NXf58gOmJ75wIYtkUkMQ?=
 =?iso-8859-1?Q?9gl+fMymd3UaPzaftbWLJzMta5wqar+9sWJ18g0AutG4kE1kd9EGv5NC77?=
 =?iso-8859-1?Q?w19MhtxLjcR+iEWmBvPIKt5wBBFqmGasIvNcdEZeS83/gW6hpyl0J0D2S1?=
 =?iso-8859-1?Q?ta0OS+5eu3GySOwkqdbRUijSY2EzLr3wR11gKcl2DXf3NdbY0iGCfDFXlN?=
 =?iso-8859-1?Q?7hC/+dachNIzefsfm1xVPb3CuqUZHFnctOst+WSjn/WBcX26wKxSXv6emu?=
 =?iso-8859-1?Q?swT3W42H6/owTQY6XrqU4V/u+aF7HZRzOqGPRG93zmLQcZcDaEMcGwUzXG?=
 =?iso-8859-1?Q?eYREwZTmfMTEiUp9mSswaSyE9KpqA8Z3E4m4MoheVYd+b97EsH9LZJeSoC?=
 =?iso-8859-1?Q?LnBBGpfHvaXtin9VKYfEt1+VIwEoQiQ0yHnEQgvVpjLuDKRueZjl3TVVL+?=
 =?iso-8859-1?Q?nwhGGoIBAoFY+QyzM4dNi1OcX79umyEybvIfaD37R4UTJSaoD/aTO35I3Q?=
 =?iso-8859-1?Q?SwSlTgFgIiMyjMFNIXU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a98bb8-102b-4880-a7a9-08ddcac26669
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:24.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4t5WZ8iW1OpZXvHqM3EezHMOQ8G/C6M8yUJtXm8B6uP27fV/mImQdZrR9h6pC2oxViKZuZLgbPjGmjIV/ZLVrjl/7dCDk2whiPFFX28Xq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6756

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/gic-v3.c          | 99 ++++++++++++++++++++++------------
 xen/arch/arm/include/asm/irq.h |  1 +
 2 files changed, 67 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..8fd78aba44 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,62 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    panic("Invalid offset 0x%x for IRQ#%d", offset, irqd->irq);
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
-
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +508,9 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32 =
offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
-
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +597,26 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
     spin_lock(&gicv3.lock);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,15 +635,12 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     spin_lock(&gicv3.lock);
=20
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
+    writeb_relaxed(priority, addr);
=20
     spin_unlock(&gicv3.lock);
 }
@@ -1273,6 +1305,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1317,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

