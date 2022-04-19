Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D65062EF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 05:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307708.522975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0S-0001lD-UD; Tue, 19 Apr 2022 03:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307708.522975; Tue, 19 Apr 2022 03:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0S-0001iP-Q9; Tue, 19 Apr 2022 03:58:24 +0000
Received: by outflank-mailman (input) for mailman id 307708;
 Tue, 19 Apr 2022 03:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qar=U5=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ngf0R-0001gE-Bl
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 03:58:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe07::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32f76e3-bf94-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 05:58:20 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2280.eurprd04.prod.outlook.com (2603:10a6:4:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 03:58:17 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 03:58:17 +0000
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
X-Inumbo-ID: f32f76e3-bf94-11ec-8fbe-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NokNkjQgXjeU0q4+ieTn2/tYXsOVscHqhLIkkc8DnMTivIhHd/GdlT4Ik5jUS+A/sSRnKM8iXhXWn44ihoaxD8MZc8VJqs1mrCceWF2EUMA7W5/rcV2TzZ0Uf6IXZ2yKbHi3BjPvGWvfWOV78dCJij8PQk/IM7qp/STV0CEQg+K+KJ1T3NcApCZNayuVfv3AHK5PiS2h3hzvcTOYJCBmY7gO1gznSVeecQQa04/y71fNulC03V0KBMNHVF+Z8HcEn+UTmElWeLDs5kkjJR4LxVQ3W8QNP4h1CmdcDrG6J4ojDVNH2epp4KQJq2URXzA9QQ9BKXqs4RIYIbOmJ7EmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QqFMtw5JqTtw6Jd6dkBHTwFJGE0lWl5lR8Rfrbsrcs=;
 b=aDD18Rg8nFeSZ3UyhM/y+RA7ttSFruXJYwXWxnZtWpIJSBkJAi+cq+Y8HL3a84kBN3Qm7yF+zAACbg8QGpNPJFvHvzujuOwyxNH00MHFIkBhwTpOjkmR2icFwZqhETg9eEQ648ZPizkIsRzFTCjwHBrla6kNkQ2L8VOOkbmnZAvnVET1lDSl7YCiaOuwFMWZjD8Oab/M3hYH7OnH4kMfkPOR5kx8o2H8Zfhdjsc379Axv/OZ8W9LjK41/7O/rI+2DZw3bTuNzdiMnJ9X5Xem0I6v7Ft4aoEMkf7gIMFJ9hjJLykKBadewG0NsZJklBofgENoNWU/VU3TOrt6aqsXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QqFMtw5JqTtw6Jd6dkBHTwFJGE0lWl5lR8Rfrbsrcs=;
 b=UhhbzYelBYXvXpWMcKkr93zuRqaygNKCYL3hW/Pe5RbhoUPMeG2lfXbdfWS5qz5fewe7nqj7TvMwAXKXtlFM/kZM8bRdN2hoR/OSB0jn+3nGrlU4oQqtOeWtmqdPRcLLfhUgedEC4rbV8DKXHQxp+jaqdnrr9JyoBu+vJPQ8RXk=
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
	michal.orzel@arm.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 2/2] xen/arm: Add i.MX lpuart early printk support
Date: Tue, 19 Apr 2022 12:39:27 +0800
Message-Id: <20220419043927.23542-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419043927.23542-1-peng.fan@oss.nxp.com>
References: <20220419043927.23542-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a50d6403-c86f-4e33-dccc-08da21b8d624
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2280:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB228060EC1A3123872E467DADC9F29@DB6PR0401MB2280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EmWWVXJfKTOfceRLFZ2s2G7Y1P2LFh/hAvODm5fiNH3gggDVWySMJMNTBbiyP+8XC19AzwG8uFmGieN7svG02Y7/t/r+Af1ffPaAYyewlTjBRYkEUCM/p14Rm5GxK9ttJAYlLogcgq/fH22hPGHibZQ5X46vpd+2z6SKBnClNfeAf+BJRhgzho12f8ilVfBYjanVRRiFJhPHooSn1ZRb/xtANv3OQutcHhi7WuHsT0S6A3daMdANFqDoAwB3zagclFYlK4d42jHXjPNdRxmML7cKN7PEwFZx4hOp9VgLBLDpjBosU/u9QtftPhczAUh9L1Lh0FOrgCyKuq2xQA6cig8pE9Rd7hoxuvXTNuCTYFwgtk8Qq40qSY1FX6uuXANqtb8B+k4BI0DFWSHkQ3GCBumY697mFPMlf/MfSVEpISVGDnmlMU+c16GlHdZS2qzv5uqYu2R7+XBAkHtKxM/AZig/VAEPw7TAhZq8hpbvBmMVDldmlUs9F8ILTljFYp5KERaB3hbCntMyZ+HjEuCmrFJcwXN3SDAijYXwBkyccOMcLfd9VDBC3SSyFzSFRk85f+eCR7M0vCVMlJor2eet0GxwZsmrA/LWBGGiD5VIjC/2lXuyQeTkCjcBV2EreXCzADWOl3g1O6jL6TqsEcyfC5nYxd4D6N6y5NNgXezKKHZS918q9gmVolLD4RvEgDG12s3BSKkI2u2lnOqywaEC3r08sEnA55MsxR7J9KlSJ2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(316002)(38100700002)(38350700002)(66556008)(4326008)(8676002)(1076003)(2616005)(86362001)(6486002)(6512007)(508600001)(186003)(26005)(8936002)(5660300002)(7416002)(6506007)(52116002)(6666004)(2906002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFfs4C0rjaAXJdhbVcZIfKu/WwtfYAFfaQzgGIHYQHKQKgtuaPhe7VAvcl/4?=
 =?us-ascii?Q?9GF2S0QjC2XVZavfdyBGldZ2dr3Sr845Pow8PrE0uxIeZh8Wvs+24yqpRFoN?=
 =?us-ascii?Q?L5ckKdMEjW57mhQFVo0nvDzaCVViR2tcTLpps9U4nkHwoevgCrs7eYnrcsCA?=
 =?us-ascii?Q?NUrjTrEdw2HFe6ptkmMsqqTbcpn37zfKsmKnBZAQbC8Ze1o12tLVBUhxElNH?=
 =?us-ascii?Q?W8qdRYxJb2kHmYTJDllTJQWTAWKrFqdor1tIPTKdPcDI8bVz1Y+YdmnRJEeb?=
 =?us-ascii?Q?4UfSMOuYMn+wJmLRB/EceZdRHT3SjzkoFSHfSWWVcmvZiJHI/65wJIAYpGpY?=
 =?us-ascii?Q?rwTEVsYWwx+t4e6qysLJd9aYgrfPMv8FqtK7chDECy8ifmAMMHqzrpNrijrI?=
 =?us-ascii?Q?7zyKdsfUtQduhBInw2WlmQcPdIraERxNZelV0/G7bo4uTSUFMwJ3YlSoxpev?=
 =?us-ascii?Q?VU8BlLdqRr/STHZ8W23HtriAmwydT2+Z1xFBmhJAXA92JZ5z1zhNVIXu6WG4?=
 =?us-ascii?Q?CdEyeTb3wdq21Lnzv532KJvjPhdTCO2zJR8At+PLNoHcxceb3Nqg17D3TRqe?=
 =?us-ascii?Q?ct6C1/gx+UZLtswfLF9ZQNd4go1TDnzZkg24Pz7/HKBgNzWG6TSg7qF3e+mb?=
 =?us-ascii?Q?Mo4AnccZR+Au7os20uksUMwRx+F/1FxkkBQwYBDEu+HY2A21ocToN1LcHtP/?=
 =?us-ascii?Q?xS+/FaScFlb4AZZ6/xqKKn4GVBwhIyMDDorqsxQlc2Jxd/f230C5H+F+3o9S?=
 =?us-ascii?Q?BjoBreWZ5E94R2ryXWIpZHDdFUaP0H8p7jbURRc9VLcXET7eSvBzKa02jUUR?=
 =?us-ascii?Q?XfdcRmKQTuY/tnSayRZjgxy4AlmJPNam86V2agq6siZfCmezT0YMmlIqADNl?=
 =?us-ascii?Q?KIp75m18YiYelC24i3JUSDLPbuGkpFig2inMqu7W78A2oC+Ul/+69WtPq9Ew?=
 =?us-ascii?Q?dq3YuyExr2CtLSG7nJLbbJN8BUODofHXmTp4HZLATQyxo7dHVb2q9FWrqycm?=
 =?us-ascii?Q?D5Ib3MWp8IhFTqjcz7FMdAIJuE8YCTPLYdtx182AX1qbEFjNZAibbwzrEyrz?=
 =?us-ascii?Q?ADXmcfIBaS3g+yNfcXXH15vVz85OMCnEHO5586sti1jpS45sidG3a8qztMu4?=
 =?us-ascii?Q?756gDwJ6Lr41S81jyGA0/wpJgM+qjQRDhEz8KCRVlkx09UXCg4NE4DfIpG0c?=
 =?us-ascii?Q?A6CYlzS34wGgZvwQAPNUOvj5PXhg5C0d/opX7Gh5v/SIOvyXCOwzlLEixPem?=
 =?us-ascii?Q?n4TW7CYfHZ3H6CninpvjB3k3AUlKgCRFPqNjm9DXIoxC7pbSOOONn0ueJ3Jf?=
 =?us-ascii?Q?dgixTw30MHeSH2rcEAdIC5i21zJ2e8wF/xQ6dXNIWvgO/ZrEdZ1BCLKTKZvE?=
 =?us-ascii?Q?1MlAiwcL35YFVTcX8y+NtnNpwRGa1aDBazXuyeFI8IKzBnumwvjGXio/py0a?=
 =?us-ascii?Q?KJStVk2OCT//K1weDse5p6ksixbC0RQOaDicp3MkR8YBuV4kTQebNPbJF+Gv?=
 =?us-ascii?Q?L79owxCZyBlYKXEEcoY1Qb/sXLHrEds6M0ifxEa7L6+F6VFrcYnEyWGZfoaS?=
 =?us-ascii?Q?9+GO2KFs4ybdytFcCXsRSXvRhp/YQQSeBqlM6/lSU9gu+Mtu7eG67dt6nybw?=
 =?us-ascii?Q?zHkuC9ULAGhvmjKrJwtenpEtEmjvX/Q8tl869wkgv2p7ktOvBcKBy/EgDyVR?=
 =?us-ascii?Q?/VkOC71Bgao3ChqhoGdwxKej5mwIhUz8Vkf5rGjw5NQLepT7uMkgurYN0m4X?=
 =?us-ascii?Q?v4UaH3rpLA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50d6403-c86f-4e33-dccc-08da21b8d624
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 03:58:17.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSsgpO+r5e5W6DLtFyj8O7aU3k+CA1EPn858AOoVbKu5rl+at+oQXjJgPgmXa9bQJl2KjasrIpIXNt8AavM6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2280

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/Kconfig.debug              | 14 ++++++++
 xen/arch/arm/arm64/debug-imx-lpuart.inc | 48 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
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
index 0000000000..b169332932
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
@@ -0,0 +1,48 @@
+/*
+ * xen/arch/arm/arm64/debug-imx-lpuart.inc
+ *
+ * i.MX8QM specific debug code
+ *
+ * Peng Fan <peng.fan@nxp.com>
+ * Copyright 2022 NXP
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
+#include <asm/imx-lpuart.h>
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


