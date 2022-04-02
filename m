Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F84EFEC0
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 07:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297731.507245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtQ-0005Ux-2k; Sat, 02 Apr 2022 05:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297731.507245; Sat, 02 Apr 2022 05:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtP-0005Rw-Up; Sat, 02 Apr 2022 05:01:43 +0000
Received: by outflank-mailman (input) for mailman id 297731;
 Sat, 02 Apr 2022 05:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWb+=UM=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1naVtO-0004va-JL
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 05:01:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb887925-b241-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 07:01:41 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8216.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:01:39 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.019; Sat, 2 Apr 2022
 05:01:38 +0000
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
X-Inumbo-ID: fb887925-b241-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nj3CUGduk5ot0jE105KOjp0052O9Vy1PW3f9ccCgC85HpKdiUGRqlWdnrEuHOpNrJmpGvuIQLJg3ygsvAtM7mgdYMndlakxoeSreISAO6pjs7kHupJuE17Dac1gC5TsWuYA9KHZhkhwH9U0WBjVxvn0cEmjrP4uKLRfDeFpGo0Niaon7AxJf6uUgIDqwuhy1ZzGzSBkcYDLx5ugo26ZkTY4Guka+e0AUZmz+oPsplgDAa8szSGtdTKaJgN9mAyaKHoNn1SuN98zeVqagypyjVaud64xtZTNYcwD86DjBGqjAhCLWglPNIdBZU9OrokQmMnwRIwuOxgMBtNbO4jWdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ7vGsGi/qcdiA499rbx/Gu1hC5xkAzFrd0s81KB96w=;
 b=jGKOwYEPZBHwZ18LRt1qMU3H/8MT6WMaoeAqSqaFWMhhMG2EZ7xP9CT0+oOVwBF5qqC8bZ+zvl18KjSLqTHsCyRd1XhTujXXF+LknzuBG6EcsQId7zz0SBV24umlQX3lToBIRveu71lY+wY9WTZ5DN2xtb5IK/nuV6OD3cNo9M8baStCG0qO2O6TZOI/ffXXgSASr+s/Y03q41TkpOb+WqGz0h+I6iwmo/nCN9zhbuO3kz1I0xBlYqRB8J/OhbDnrdUb27hmGvp+Jcnd1tpqqkVKwNzRjFPhQQZ9s/9gAXHYQFAhD3yC/QkwwoV01Kd1y53rqVSq8pfBIlZ5aYVm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ7vGsGi/qcdiA499rbx/Gu1hC5xkAzFrd0s81KB96w=;
 b=Vr6SEz296WNMC6BirVhoYFQfRkprpqxBQ+Y3u4TkWGQcHQMG8/8hSgnxODDTPglb/OECMFBF2M6w1vIJ4zxofuAnrLjC0CirVftYiIlC7wSyBH9wepmQNckq3ikWRIoVbh1elR+stlVyQbeL8B7qNf8NtMHQpLYroP8iFWCadFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	wl@xen.org,
	xen-devel@lists.xenproject.org,
	van.freenix@gmail.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/2] xen/arm: Add i.MX lpuart early printk support
Date: Sat,  2 Apr 2022 13:42:23 +0800
Message-Id: <20220402054223.10304-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402054223.10304-1-peng.fan@oss.nxp.com>
References: <20220402054223.10304-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87476c74-8e9f-4a85-cb55-08da1465de3f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8216:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8216E3C62BB0CB2653E8956EC9E39@AS8PR04MB8216.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BAf+AJp8kSVdVR9JUnWaJcJdOb043PDlkYNGYBfzgkDkKXpIow2JiB3yinctFoI1HthXMTVgGLKi+5W7gLgcjdj6IljtW+FS3Xn7F4q4PabkRBdDbpfrRNoKuEhwPO/bbOfT/KOoyh5WPgt/EPgGJMEDdL1Z7eo+Ut4O0wLfD8VxLY1R/VCCqKItazyD6wucHCijsp28ZH7ufxifVq7pyhRIIN3+5buXlcCazsIvzlyFE//Oi/DjH6qtgPMbgAsLfI9VX4Os1oKUVnRqizS84XC6aKWfpgGidQp+deSzce9uz+L+PcUnNOyUTev2QP0H7ot1RDbrKYJnNR0JRMmEq9IJ5xeIvDrCujoYhBsdERo+X1fKFly8JTDUvcuyi9OSOwktgIMIyusI+FH6tNGnLvi9GqaBMQ9G/U/Nw97NB0j5FZB1/lIqrUq6GUTRlt7LQBZLk7Nsb0w8NEJfYabqOVyXYh+qC4SLllI6fObZ119pgCdXTmO2jnltHMF8V6jehX9HX4oR4PuUFIv+Mqb9H5eh/u/gjT0qIv0tM03caWaJJ5pMTmPmr2hMgHUEHZli/wL1l8tKZsQ3sFaWQ3P630SqkvYuOuybGHe+hkXWIeD1LcmvKBMhHXKVYcG+CFEZ/nNjgi0PMVjydNwcx1SdbAicA5ES8+IgMbQJv/M3+/HHMuq/m09UfhN7gSMpv03WDVBohvycBw82Bl3upzdWfv+W5QnNv1BE5Ft6x1VE2EE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(4326008)(6486002)(508600001)(38100700002)(38350700002)(66946007)(8676002)(66476007)(6666004)(66556008)(8936002)(5660300002)(86362001)(316002)(2616005)(1076003)(6512007)(6506007)(186003)(52116002)(26005)(2906002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W9OykXa89z5gsBIQ+K+4LzOtzAvr/4ejlUTceOf/CzG6YGX6KUJk74QR687y?=
 =?us-ascii?Q?Faj8f+eBYufnztGndvukGmKRFhOVLDr+g3cofFFCUCzKerxmbmlnxb4/5VmW?=
 =?us-ascii?Q?Ma9DjEyzTWG8betT592e0kE0oiJwzDn1pZm/U4ya31Hh0wJ8M007LPMSnr0R?=
 =?us-ascii?Q?d3GxX6eLfZUAmk/WFpyDdLrOC7qaqJYzSRofiqvib6jWpSvfr52IT2g5tz3P?=
 =?us-ascii?Q?U86hIFS5A238G9Y1eXHszR9yHk/KK+/nzJgwn36jJcX6WNMfgwVZaAzThB9H?=
 =?us-ascii?Q?peaV/bBbUR0nftzcR4vbgjjZZ9KnV4ybe5R/A/60/kXqB7W6L8O+Pr6D5Xyv?=
 =?us-ascii?Q?UIkAt+i9bRoip+EsRlB4Kksc52xx57Xx6OcTy5/7BWdj93zd0cnZhQGDMijY?=
 =?us-ascii?Q?Q2abTMan95xUhxl1xJKP8hgUznD6APyitM888Zbe/y6+TrsbRyurhUWl4bZo?=
 =?us-ascii?Q?xqwcdE48SsRZ7+CC36B0PEoY1crT+uW5ahBMwoCGE8/ZNFUT5FXv/Z6ot59L?=
 =?us-ascii?Q?JMLcA0SKzITiebJ3A7eweDAoDbfFlfGCCh/FO8zYapfesd+r+6fQO5GxitP+?=
 =?us-ascii?Q?sAnVwrfw7IH7hbY+qXk/p+JPmwX3w6Tu4OMh17ZBEdIb5bSIidmVzYngH4Hb?=
 =?us-ascii?Q?zJNyXXOdxDQZW8rRxNqpzwPiwiS6roBpt4oUzFS8goaJPn4qcyV//FRxqrUK?=
 =?us-ascii?Q?1ysHDwXbu/XwiJydMoX8vmRyGw6ciEx/mRds96AgmJmvLVW37RW8EZaqeqEP?=
 =?us-ascii?Q?lXalPEYVjvXV4W4qX8xpJQQfgxq2Di2keytDnpKlBVeSJfLHfDRxl0GiaEla?=
 =?us-ascii?Q?99l+snA1rA+JiRFAOMjHhHbym3BZaLhjOeCqu7dF2XTpvdLKIBtrs77k9+u+?=
 =?us-ascii?Q?n/78019yyy+ziKqRYIe9lYfHg3TK12MBRnp48GsnaidFJM6rDR/+6BzdgVPI?=
 =?us-ascii?Q?fx9KOklNHKPp9Ye9GHgSOki2uVgOREg2qU2QmVr9SgQ5d2KVhY0QgROn3VKw?=
 =?us-ascii?Q?BMJEYLGZ+HUn2NR214nyn8ETYYFBCe352n6JzipZsaq3fa7wJO+Gyp35EaSP?=
 =?us-ascii?Q?pbi71dGfcCNdicSnfaDHVkIToOhET6Qf3Sehh7YMbe4oBzaCUVtHzJXQedA7?=
 =?us-ascii?Q?M3xN14jKpNH0M363D3pSeZjPsLuPm7rd978rCm4Zg7T9cUw9hbO2jRyxkhp7?=
 =?us-ascii?Q?xKd64RiIike5+2FrYby6l2JjPthWX9gvFt8gGI9UjuqUzpuyQARWA2bD8yAa?=
 =?us-ascii?Q?ujqqJiMsAjVN2n430aRaUDqTmlnRaNPqW5Ket+98Oma6JEz6QP1haq7Vacz1?=
 =?us-ascii?Q?IeDAKjh7ag+v6h9ewJ2H37+T3ooEAZDjFZEC1J5c10o9ci6IkLCuX27fD6Qc?=
 =?us-ascii?Q?pt04bsKSqjhmRiVB0x3Z755U+Q7dYOVDr9e0SrbUvur7CUmNAZiU5j8nVCND?=
 =?us-ascii?Q?7wAD5X770ft/aIUPcUGDs5HfEQjajHRfGmIgKKKERytJPLi5BW1B2ZWx4dre?=
 =?us-ascii?Q?dIOyBDXxd2x7L+YO/Lk2nIfm072MmhpdU2nvMz7NOqo3wokcdspB0A0r5inU?=
 =?us-ascii?Q?wK4RBMvLV2e08YBZJHx6BELXCWrP6THKYso75gwya/ugf405bsxrLWXtNruX?=
 =?us-ascii?Q?GtOyU2vWW2JtJHSZ+3+wjBkgAiBqzyfAl4iaq9EmEyA3v04HdtVsw0iqDB1D?=
 =?us-ascii?Q?kiReMZ7q/ayMldTrpjGL9i7V+g9ijz/piKfPwROmZqtTLq8EUksQUFykDYT7?=
 =?us-ascii?Q?YCdQdzErmg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87476c74-8e9f-4a85-cb55-08da1465de3f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:01:38.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzvpz8bPE0Cdn2PPG/lSGdmXll18WJBgX+lDINEYV+xZudQYvjhUtpwndRddNHSQXcobZonx/k2XEYbUDw8EPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8216

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/Kconfig.debug              | 14 +++++++
 xen/arch/arm/arm64/debug-imx-lpuart.inc | 52 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 35ccd13273..842d768280 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -58,6 +58,16 @@ choice
 			This option is preferred over the platform specific
 			options; the platform specific options are deprecated
 			and will soon be removed.
+	config EARLY_UART_CHOICE_IMX_LPUART
+		select EARLY_UART_IMX_LPUART
+		depends on ARM_64
+		bool "Early printk via i.MX LPUART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a i.MX LPUART. You can use this option to
+			provide the parameters for the i.MX LPUART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
@@ -186,6 +196,9 @@ config EARLY_UART_CADENCE
 config EARLY_UART_EXYNOS4210
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_IMX_LPUART
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_MESON
 	select EARLY_PRINTK
 	bool
@@ -283,6 +296,7 @@ config EARLY_PRINTK_INC
 	default "debug-8250.inc" if EARLY_UART_8250
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
+	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
diff --git a/xen/arch/arm/arm64/debug-imx-lpuart.inc b/xen/arch/arm/arm64/debug-imx-lpuart.inc
new file mode 100644
index 0000000000..f7ac78a781
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
@@ -0,0 +1,52 @@
+/*
+ * xen/arch/arm/arm64/debug-imx8qm.inc
+ *
+ * i.MX8QM specific debug code
+ *
+ * Peng Fan <peng.fan@nxp.com>
+ * Copyright (C) 2016 Freescale Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/imx-lpuart.h>
+
+.macro early_uart_init wb wc wd
+/* Already initialized in bootloader */
+.endm
+
+/*
+ * Wait LPUART to be ready to transmit
+ * rb: register which contains the UART base address
+ * rc: scratch register
+ */
+.macro early_uart_ready xb, c
+1:
+        ldr   w\c, [\xb, #UARTSTAT]   /* <- Flag register */
+        tst   w\c, #UARTSTAT_TDRE     /* Check FIFO EMPTY bit */
+        beq   1b                      /* Wait for the UART to be ready */
+.endm
+
+/*
+ * LPUART transmit character
+ * rb: register which contains the UART base address
+ * rt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb, wt
+        str   \wt, [\xb, #UARTDATA]  /* -> Data Register */
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.35.1


