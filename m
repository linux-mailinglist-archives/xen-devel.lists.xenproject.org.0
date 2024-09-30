Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4198A111
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807251.1218581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsK-0000Jz-RT; Mon, 30 Sep 2024 11:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807251.1218581; Mon, 30 Sep 2024 11:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsK-0000Ef-L6; Mon, 30 Sep 2024 11:47:36 +0000
Received: by outflank-mailman (input) for mailman id 807251;
 Mon, 30 Sep 2024 11:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsJ-0000Cy-K2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c884e92c-7f21-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:47:34 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:31 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:31 +0000
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
X-Inumbo-ID: c884e92c-7f21-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTHmlJ0xH7JYPpijBCcdmyhmquTVzK4+bZPUX1/VVgemreMreueL0OZKJIM2j5KGfTllIynX6/1PF8eqnq/Sz6g849WrQjdYANl57Iw4CafOopvW22MTcGzMZRcmia+p3LO06M4QW9nJUegLGlpquG3fIb8lrGgbb+A56mZCULTH2UjejEM3VVVjmny0vfKH8PNVtGt13Z/8LnJYu9iMMtPpOGBHupAMvNqG5jSVcs1Lp0KX63ivWE5cb21bIzS/XXdL/OQdxI4tJ0w1ZXjDvRwSr7Ke6Zd5d/pW/KX77ZCMx45lY1fndpLFNw7FgXy3SfeSfkvvg35r7UDzh3dd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yD9dpyaC7j6AhB7GDz/Y8ULhUmp9nJk5P6ogCO53y4=;
 b=iHDD6eoSEwWxEsrpgcWebl1e7GV2/njwJBsWRRuthwBRCV31oQNk1E35s8Tw8Y6S04iYZtBUexf24KiiUr8TSx3Ytn3ldQpoRlKiZS5OE2v9/eWQauMiRw9RCPR49qn8ogFVLhiCMJW0ewKKsSGvOhT6sykE3yrJtZGkr0es68DT6FuuPhkd6Bz4qSrV+xRqFrAcduHsSQ/5gbciB1kqL8Bp72EQAUwicB4Aats//q+xXdJzOCFr0myaLJsqjtqFy9V3FjuvN+j//XbHGkimSTQJHVAGv+5se9UyNz9vPEWFIbFDz3qu8tIsdGIX90fQGXozLrDHoXrFPknV34e3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yD9dpyaC7j6AhB7GDz/Y8ULhUmp9nJk5P6ogCO53y4=;
 b=d1z8crshe/JiNw/1Eb3Ad7tyfqu4LQCLhHVeyIxpn7tf6OlcEa4YUHgVVhOCNh9t1qllWTYhOMpea2nlHEcn9ZhfYYsLltHWwKFlMRnkpI0JcV4jbGPPgvVI2L7M5JPuQqCjrzgYgyK+Ot4U1cxT/TUPzLqm+k+vGJ2/HBuqCIbZQaQf0EkbXfZs4ndtp8NmpuWPKNXvUCGxROSd2CT+kuqOT1VIrp4bz4cGoexscJWY8GVDSl/K3mdSizEP1VNFsmioh1/F9IinjGvuFEkf69Yf8k663rlVBo7ZsGQ1OYS2BS4eEyI96hXJrRVyiiY8ZFKL7BCkauC17c/jvtSH4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	s32@nxp.com
Subject: [PATCH v2 1/8] xen/arm: Add NXP LINFlexD UART Driver
Date: Mon, 30 Sep 2024 14:47:07 +0300
Message-ID: <20240930114715.642978-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbdb444-a6bd-408d-2995-08dce145aac2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cTdFMNG7v8sv2c5+XcT7KvTqQzUkkb/d6xnOWcCEiXbB3Gj1OCLaZyj0yWjx?=
 =?us-ascii?Q?FXcSl3DEBRhkAdqjPuxM0ldSPO29fYhNKyesQ5ljZugHjnloYi2mQnjQww1/?=
 =?us-ascii?Q?DnVMrc3XbWj5y8CHMVLhePeYQIzMomgXPfQNe9O8ZWjIVO5MrHzcug99eCnA?=
 =?us-ascii?Q?/guEqPfnoX6tCQNnxmSO9MtUL1jkvGYZH3bJNCthSl72aGU2Q6Jv7qoSYWKC?=
 =?us-ascii?Q?JHgTf465SdnmGTUJTuwIL5nO7ThkKjrJRLKvLZKRZQ99p22jOsRiqq1PFQJZ?=
 =?us-ascii?Q?XCv2wqs8SUiugaNmB49ocrAf99IBv86Y/PKZRvGcRfzO2FBu0byRucFX8hCC?=
 =?us-ascii?Q?H00NXJtlDbuIAu7Xy1CGWVKIkOyYMQFMPDl+RbagTLWtukCUQCQT2sLNavtd?=
 =?us-ascii?Q?SAodygBkZfo/+pcBr+L2AUrBKmaDbx0LT2uLs/AED4TsENzzR64QqPRLixYQ?=
 =?us-ascii?Q?44CgfVTaGBbz4MuQ4JxBouI2vr7PPSivLnkcP6hn+QVMgA6dzmO0M9F8PZJy?=
 =?us-ascii?Q?O2ah858ClvLrMmVI+WEoN2yMIy33XxE3zhHAW8us35bjp0L1znPuVbf/3uoQ?=
 =?us-ascii?Q?U7q6DxRGxDReZ/M8EMrTHhVYFU7Zdoiagr+45OSYS1pzvJG0XyhsS8HORu+X?=
 =?us-ascii?Q?c2UOC2XRq4w6LKnyMwm4MDmZ903vjkMzKWByvNYnb+h9LGx3aEyGvV7R9G0U?=
 =?us-ascii?Q?3uFQ0seYQVQQEEaWhgr9sN3pe/4rbNRqhhlWwvDHbzjD1p/GFHG8CObK2f7H?=
 =?us-ascii?Q?1DdwM3gqtuWw3a5/WwamStQT422/3BgWfFRw21opiVf9bjJt21VTPO9V9hte?=
 =?us-ascii?Q?rM3otLlsKjixvuSRuXl3oeB70u5XA3wUH+mqLnjm6lewklyBloSt8r9bgrrc?=
 =?us-ascii?Q?BmSVaB/3ds6m3T/crK3BUmqHp9sAzxnesAJw7tWnzYCNcCk6ve63FIa3BhTf?=
 =?us-ascii?Q?WKhM/1BtereMDma2l+6NC/0CysB5Md8ZL/MTt4OjHEqCEPdP9c2pObvGK36x?=
 =?us-ascii?Q?v0BRft9HmnAIYJCi2AOfIttYmt5YX7CJ+jterxcNrk7si4KFFoIil8oxnevq?=
 =?us-ascii?Q?XR62QJplVS7A0LK59i3rK1PHb0XEonSqK5qVjDVfD4eBFRvxmeHbBHyHC83U?=
 =?us-ascii?Q?hE1EvSbCPaSOo2J6rgQk2eyFYb4RYDEdbpSOixpSWF3WcesxiFQSnmzQo1nZ?=
 =?us-ascii?Q?AnOLCTF0GhiW2ACjj0XqbvjMV688etR7S46FUGhN4pw4bhPFaSvVKV9YnjAS?=
 =?us-ascii?Q?JBxbrv0wcV28qHGTLCT7BLJuH7RDm4gwJ+gEaGrzhpyV7AA55E0mYEqLMp8G?=
 =?us-ascii?Q?3bG2JcfTF1g/xVOf2fCMyaFwAe/43qtZlN4xAPQB4utklg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8/MiaKwAOlIR0IrGVmN53mXH6IQsOvgjiE1TZVuKdTLvKmXEOJfux39hRe7?=
 =?us-ascii?Q?aeuEjoT1k/kHVx4Y+jigtkfPQq66WoiyyrYWuWqdvzmVP3hl4BtdrcpFnePa?=
 =?us-ascii?Q?lvZEetJTnO55BlU2YNsESZyHje6TEUsVzdLuivX1dtYHI5p/MUMYo6ZBJDdG?=
 =?us-ascii?Q?X115odtjImJ+BWD3orc27YRbFjGFh960YQKxg9XijYJXdWz5EKHAG35oW1Lh?=
 =?us-ascii?Q?HbdkN3xm713syt+oN/Igt3FRr30VOM0Vgarwm1WeUQVpj7UBP5mV2SsY6iDp?=
 =?us-ascii?Q?dhp47iNs3MlLXOcaZmTh3/2xJZswOoSXfsOs2CwQBLhG2Um82NLVJqCoIJP4?=
 =?us-ascii?Q?l5hO1Wos//uEaPOLTmx2MVxQgJDMyLGsiH8zTrbEz5rj0PKPAHnSLeXbKd7G?=
 =?us-ascii?Q?VDtUOTynHt0KkUO5+d0mBq7t1wgt9gTfx7a04HmNUuWHcUo3cleAUbpFT5Jr?=
 =?us-ascii?Q?sN5OnHCsFhCAA3w781bmnLyVGbUeQGddchzvH6ico769+kwqeObIuj2xFoOF?=
 =?us-ascii?Q?ONrEXnasKnJUJMhAjg/+v2lomb/W4FP/W4r1a8L5csAQcIhkL0VN8B+C4YxP?=
 =?us-ascii?Q?ai+nZwhlwovkoQtREbTn1sfZ34kKEVPpCax0n+6g16U+oO385C4tIG/lpLjo?=
 =?us-ascii?Q?CLW4KK4wkRnAKsUwWrWfWcG/jsDOD6e20jTmYuoLIs5/+evJpWhP5j5ayAde?=
 =?us-ascii?Q?+zNB7XmM35qLO+LTQQVjO0gRXWwDqIkH/sRJh9eAjrjvXlRNEumQGFBE9XOZ?=
 =?us-ascii?Q?h/P9Jj3SOZpWLo7jE65dPnr0NZyKflzaNSR7HR8mv/kk9StWpEEHz+GugyTy?=
 =?us-ascii?Q?DxMxYuzYHlcDVYmK5HEKlTombmvRsIOWfFuywvg09dC10ENef39BY5zEJ7Gb?=
 =?us-ascii?Q?9bHBX+Ss6LIz3XoBqYUcVjZ2e1tGNRD0qLjWVUdmnLldaTzJQgC9+73rKSmo?=
 =?us-ascii?Q?83AA0jIYU/nDJuWhnJ3O4uGf+XZjJjIGwmwt012kKAEBGoj3iePcQfdtoZli?=
 =?us-ascii?Q?ITk1WEMESJcKkbkHdcxrDkFbkDX3v1FBVB7m4O+cK8lsbtC2kX0gxNHMZuY1?=
 =?us-ascii?Q?YXz7sup6kliMnTA+TN/sCzgmEzbFFdzPRi4K7ZhLO0XSWlPndHZaP1ZHzcr8?=
 =?us-ascii?Q?uZ/mWDV5R/jR6Fb2Y7nB/eFF9npCTQ88v2FhW7n9xGDAH5MbEN+VMNU6/f8L?=
 =?us-ascii?Q?hnqmEmaf9UNFNKyxo/4Wk8pLLJKtlBDcYVuVbO+yrXb+GKKEptojsdL+xEx0?=
 =?us-ascii?Q?Q6o0cTqRLcPpPGsLjUAgoRPIfCbZId6JcA1QxOtPUOSeWlnkq/S21HlQiBRr?=
 =?us-ascii?Q?1cXNj3n5BNjB8IG9lSgz53EfO6fLFhvbXJeAFHvw2KcCwnNSNg8bk+fdxKTF?=
 =?us-ascii?Q?XNwzOG4/UUOyUJnMnm4UViX7W82OIgxqnngoYowEUy4mV+DSQ85YPjqhU2HE?=
 =?us-ascii?Q?6e2thU0jzWC3oIyWxRERCSWX9rlMGyFs5LexsxRyLOPB2KtFW0XaONWLRU79?=
 =?us-ascii?Q?X7d3cUtBF22oFLPj35YMQW0Yn9Dz5yeO6fVAb+4GK7zKYc06f1kBsfsZrjz8?=
 =?us-ascii?Q?Cm8uStkPWy/4cPQfqqcIlXNi4xTX9COvi2eJ6SOBkgjhTBvJcf6itPanFfte?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbdb444-a6bd-408d-2995-08dce145aac2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:31.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +o8a38Wt2OsuSH+0pm6GYrSmix7UykbZn3u3wELuEf2b9/9TGIYaCeQ8eGRaji7DGg9FgA0Bu9r8vEEvvWh3vjDz/yuux6uGq7BCwKWy2ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

The LINFlexD UART is an UART controller available on NXP S32
processors family targeting automotive (for example: S32G2, S32G3,
S32R).

S32G3 Reference Manual:
https://www.nxp.com/webapp/Download?colCode=RMS32G3.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
---
 xen/arch/arm/include/asm/linflex-uart.h |  63 ++++
 xen/drivers/char/Kconfig                |   8 +
 xen/drivers/char/Makefile               |   1 +
 xen/drivers/char/linflex-uart.c         | 381 ++++++++++++++++++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
 create mode 100644 xen/drivers/char/linflex-uart.c

diff --git a/xen/arch/arm/include/asm/linflex-uart.h b/xen/arch/arm/include/asm/linflex-uart.h
new file mode 100644
index 0000000000..95dcbcb476
--- /dev/null
+++ b/xen/arch/arm/include/asm/linflex-uart.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/include/asm/linflex-uart.h
+ *
+ * Common constant definition between early printk and the UART driver
+ * for NXP LINFlexD UART.
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2018, 2021, 2024 NXP
+ */
+
+#ifndef __ASM_ARM_LINFLEX_UART_H
+#define __ASM_ARM_LINFLEX_UART_H
+
+/* 32-bit register offsets */
+#define LINCR1          (0x0)
+#define LINIER          (0x4)
+#define LINSR           (0x8)
+#define UARTCR          (0x10)
+#define UARTSR          (0x14)
+#define LINFBRR         (0x24)
+#define LINIBRR         (0x28)
+#define BDRL            (0x38)
+#define BDRM            (0x3C)
+#define UARTPTO         (0x50)
+
+#define LINCR1_INIT         BIT(0, U)
+#define LINCR1_MME          BIT(4, U)
+#define LINCR1_BF           BIT(7, U)
+
+#define LINSR_LINS          GENMASK(15, 12)
+#define LINSR_LINS_INIT     BIT(12, U)
+
+#define LINIER_DRIE         BIT(2, U)
+#define LINIER_DTIE         BIT(1, U)
+
+#define UARTCR_UART         BIT(0, U)
+#define UARTCR_WL0          BIT(1, U)
+#define UARTCR_PC0          BIT(3, U)
+#define UARTCR_TXEN         BIT(4, U)
+#define UARTCR_RXEN         BIT(5, U)
+#define UARTCR_PC1          BIT(6, U)
+#define UARTCR_TFBM         BIT(8, U)
+#define UARTCR_RFBM         BIT(9, U)
+#define UARTCR_RDFLRFC      GENMASK(12, 10)
+#define UARTCR_TDFLTFC      GENMASK(15, 13)
+#define UARTCR_ROSE         BIT(23, U)
+#define UARTCR_OSR_SHIFT    (24)
+#define UARTCR_OSR          GENMASK(27, UARTCR_OSR_SHIFT)
+
+#define UARTSR_DTFTFF       BIT(1, U)
+#define UARTSR_DRFRFE       BIT(2, U)
+
+#endif /* __ASM_ARM_LINFLEX_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 3f836ab301..e175d07c02 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -13,6 +13,14 @@ config HAS_CADENCE_UART
 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
 	  based board, say Y.
 
+config HAS_LINFLEX
+	bool "NXP LINFlexD UART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the NXP LINFlexD UART. If you have an NXP S32G or S32R
+	  based board, say Y.
+
 config HAS_IMX_LPUART
 	bool "i.MX LPUART driver"
 	default y
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index e7e374775d..d3b987da1d 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
+obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
diff --git a/xen/drivers/char/linflex-uart.c b/xen/drivers/char/linflex-uart.c
new file mode 100644
index 0000000000..2fa195cbf6
--- /dev/null
+++ b/xen/drivers/char/linflex-uart.c
@@ -0,0 +1,381 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/drivers/char/linflex-uart.c
+ *
+ * Driver for NXP LINFlexD UART.
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2018, 2021-2022, 2024 NXP
+ */
+
+#include <xen/config.h>
+#include <xen/console.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/serial.h>
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/linflex-uart.h>
+
+#define LINFLEX_CLK_FREQ        (125000000)
+#define LINFLEX_MAX_BAUDRATE    (2000000)
+#define LINFLEX_BAUDRATE        (115200)
+#define LINFLEX_LDIV_MULTIPLIER (16)
+
+static struct linflex_uart {
+    uint32_t baud, clock_hz;
+    uint32_t irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} linflex_com;
+
+static uint32_t linflex_uart_readl(const struct linflex_uart *uart,
+                                   uint32_t off)
+{
+    return readl(uart->regs + off);
+}
+
+static void linflex_uart_writel(const struct linflex_uart *uart, uint32_t off,
+                                uint32_t val)
+{
+    writel(val, uart->regs + off);
+}
+
+static void linflex_uart_writeb(const struct linflex_uart *uart, uint32_t off,
+                                uint8_t val)
+{
+    writeb(val, uart->regs + off);
+}
+
+static uint32_t linflex_uart_get_osr(uint32_t uartcr)
+{
+    return (uartcr & UARTCR_OSR) >> UARTCR_OSR_SHIFT;
+}
+
+static bool linflex_uart_tx_fifo_mode(const struct linflex_uart *uart)
+{
+    return !!(linflex_uart_readl(uart, UARTCR) & UARTCR_TFBM);
+}
+
+static bool linflex_uart_rx_fifo_mode(const struct linflex_uart *uart)
+{
+    return !!(linflex_uart_readl(uart, UARTCR) & UARTCR_RFBM);
+}
+
+static uint32_t linflex_uart_ldiv_multiplier(const struct linflex_uart *uart)
+{
+    uint32_t uartcr, mul = LINFLEX_LDIV_MULTIPLIER;
+
+    uartcr = linflex_uart_readl(uart, UARTCR);
+    if ( uartcr & UARTCR_ROSE )
+        mul = linflex_uart_get_osr(uartcr);
+
+    return mul;
+}
+
+static void linflex_uart_flush(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+
+    if ( linflex_uart_tx_fifo_mode(uart) )
+        while ( linflex_uart_readl(uart, UARTCR) & UARTCR_TDFLTFC )
+            cpu_relax();
+
+    if ( linflex_uart_rx_fifo_mode(uart) )
+        while ( linflex_uart_readl(uart, UARTCR) & UARTCR_RDFLRFC )
+            cpu_relax();
+}
+
+static void __init linflex_uart_init_preirq(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t ibr, fbr, divisr, dividr, ctrl;
+
+    /* Disable RX/TX before init mode */
+    ctrl = linflex_uart_readl(uart, UARTCR);
+    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
+    linflex_uart_writel(uart, UARTCR, ctrl);
+
+    /*
+     * Smoothen the transition from early_printk by waiting
+     * for all pending characters to transmit
+     */
+    linflex_uart_flush(port);
+
+    /* Init mode */
+    ctrl = LINCR1_INIT;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    /* Waiting for init mode entry */
+    while ( (linflex_uart_readl(uart, LINSR) & LINSR_LINS) != LINSR_LINS_INIT )
+        cpu_relax();
+
+    /* Set Master Mode */
+    ctrl |= LINCR1_MME;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    if ( uart->baud > LINFLEX_MAX_BAUDRATE )
+        uart->baud = LINFLEX_MAX_BAUDRATE;
+
+    /* Provide data bits, parity, stop bit, etc */
+    divisr = uart->clock_hz;
+    dividr = uart->baud * linflex_uart_ldiv_multiplier(uart);
+
+    ibr = divisr / dividr;
+    fbr = ((divisr % dividr) * 16 / dividr) & 0xF;
+
+    linflex_uart_writel(uart, LINIBRR, ibr);
+    linflex_uart_writel(uart, LINFBRR, fbr);
+
+    /* Set preset timeout register value */
+    linflex_uart_writel(uart, UARTPTO, 0xF);
+
+    /* Setting UARTCR[UART] bit is required for writing other bits in UARTCR */
+    linflex_uart_writel(uart, UARTCR, UARTCR_UART);
+
+    /* 8 bit data, no parity, UART mode, Buffer mode */
+    linflex_uart_writel(uart, UARTCR, UARTCR_PC1 | UARTCR_PC0 | UARTCR_WL0 |
+                        UARTCR_UART);
+
+    /* end init mode */
+    ctrl = linflex_uart_readl(uart, LINCR1);
+    ctrl &= ~LINCR1_INIT;
+    linflex_uart_writel(uart, LINCR1, ctrl);
+
+    /* Enable RX/TX after exiting init mode */
+    ctrl = linflex_uart_readl(uart, UARTCR);
+    ctrl |= UARTCR_RXEN | UARTCR_TXEN;
+    linflex_uart_writel(uart, UARTCR, ctrl);
+}
+
+static void linflex_uart_interrupt(int irq, void *data)
+{
+    struct serial_port *port = data;
+    const struct linflex_uart *uart = port->uart;
+    uint32_t sts;
+
+    sts = linflex_uart_readl(uart, UARTSR);
+
+    if ( sts & UARTSR_DRFRFE )
+        serial_rx_interrupt(port);
+
+    if ( sts & UARTSR_DTFTFF )
+        serial_tx_interrupt(port);
+}
+
+static void __init linflex_uart_init_postirq(struct serial_port *port)
+{
+    struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    uart->irqaction.handler = linflex_uart_interrupt;
+    uart->irqaction.name = "linflex_uart";
+    uart->irqaction.dev_id = port;
+
+    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
+    {
+        printk("linflex-uart: Failed to allocate IRQ %d\n", uart->irq);
+        return;
+    }
+
+    /* Enable interrupts */
+    temp = linflex_uart_readl(uart, LINIER);
+    temp |= (LINIER_DRIE | LINIER_DTIE);
+    linflex_uart_writel(uart, LINIER, temp);
+    printk("linflex-uart: IRQ %d enabled\n", uart->irq);
+}
+
+static int linflex_uart_tx_ready(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+
+    if ( linflex_uart_tx_fifo_mode(uart) )
+        return (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 ? 1 : 0;
+
+    /*
+     * Buffer Mode => TX is waited to be ready after sending a char,
+     * so we can assume it is always ready before.
+     */
+    return 1;
+}
+
+static void linflex_uart_putc(struct serial_port *port, char c)
+{
+    const struct linflex_uart *uart = port->uart;
+    uint32_t uartsr;
+
+    if ( c == '\n' )
+        linflex_uart_putc(port, '\r');
+
+    linflex_uart_writeb(uart, BDRL, c);
+
+    /* Buffer Mode */
+    if ( !linflex_uart_tx_fifo_mode(uart) )
+    {
+        while ( (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 )
+                cpu_relax();
+
+        uartsr = linflex_uart_readl(uart, UARTSR) | (UARTSR_DTFTFF);
+        linflex_uart_writel(uart, UARTSR, uartsr);
+    }
+}
+
+static int linflex_uart_getc(struct serial_port *port, char *pc)
+{
+    const struct linflex_uart *uart = port->uart;
+    uint32_t ch, uartsr, rx_fifo_mode;
+
+    rx_fifo_mode = linflex_uart_rx_fifo_mode(uart);
+
+    if ( rx_fifo_mode )
+        while ( linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE )
+            cpu_relax();
+    else
+        while ( !(linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE) )
+            cpu_relax();
+
+    ch = linflex_uart_readl(uart, BDRM);
+    *pc = ch & 0xff;
+
+    if ( !rx_fifo_mode ) {
+        uartsr = linflex_uart_readl(uart, UARTSR) | UARTSR_DRFRFE;
+        linflex_uart_writel(uart, UARTSR, uartsr);
+    }
+
+    return 1;
+}
+
+static int __init linflex_uart_irq(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+
+    return ((uart->irq > 0) ? uart->irq : -1);
+}
+
+static const struct vuart_info *linflex_vuart_info(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+
+    return &uart->vuart;
+}
+
+static void linflex_uart_start_tx(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    temp = linflex_uart_readl(uart, LINIER);
+    linflex_uart_writel(uart, LINIER, temp | LINIER_DTIE);
+}
+
+static void linflex_uart_stop_tx(struct serial_port *port)
+{
+    const struct linflex_uart *uart = port->uart;
+    uint32_t temp;
+
+    temp = linflex_uart_readl(uart, LINIER);
+    temp &= ~(LINIER_DTIE);
+    linflex_uart_writel(uart, LINIER, temp);
+}
+
+static struct uart_driver __read_mostly linflex_uart_driver = {
+    .init_preirq = linflex_uart_init_preirq,
+    .init_postirq = linflex_uart_init_postirq,
+    .tx_ready = linflex_uart_tx_ready,
+    .putc = linflex_uart_putc,
+    .flush = linflex_uart_flush,
+    .getc = linflex_uart_getc,
+    .irq = linflex_uart_irq,
+    .start_tx = linflex_uart_start_tx,
+    .stop_tx = linflex_uart_stop_tx,
+    .vuart_info = linflex_vuart_info,
+};
+
+static int __init linflex_uart_init(struct dt_device_node *dev, const void *data)
+{
+    const char *config = data;
+    struct linflex_uart *uart;
+    paddr_t addr, size;
+    uint32_t baud = 0;
+    int res;
+
+    if ( strcmp(config, "") )
+    {
+        baud = simple_strtoul(config, &config, 10);
+        if ( strcmp(config, "") )
+            printk("linflex-uart: Only baud rate is configurable, discarding other options: %s\n",
+                   config);
+    }
+    else
+    {
+        /* Configuration not provided, use a default one */
+        baud = LINFLEX_BAUDRATE;
+        printk("linflex-uart: Baud rate not provided, using %d as default\n",
+               baud);
+    }
+
+    uart = &linflex_com;
+
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("linflex-uart: Unable to retrieve the base address of the UART\n");
+        return res;
+    }
+
+    res = platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("linflex-uart: Unable to retrieve the IRQ\n");
+        return -EINVAL;
+    }
+    uart->irq = res;
+
+    uart->regs = ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("linflex-uart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    uart->baud = baud;
+    uart->clock_hz = LINFLEX_CLK_FREQ;
+
+    uart->vuart.base_addr = addr;
+    uart->vuart.size = size;
+    uart->vuart.data_off = BDRL;
+    uart->vuart.status_off = UARTSR;
+    uart->vuart.status = UARTSR_DTFTFF;
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &linflex_uart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+static const struct dt_device_match linflex_uart_dt_compat[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("nxp,s32g2-linflexuart"),
+    DT_MATCH_COMPATIBLE("nxp,s32g3-linflexuart"),
+    DT_MATCH_COMPATIBLE("fsl,s32v234-linflexuart"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(linflex_uart, "NXP LINFlexD UART", DEVICE_SERIAL)
+    .dt_match = linflex_uart_dt_compat,
+    .init = linflex_uart_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.45.2


