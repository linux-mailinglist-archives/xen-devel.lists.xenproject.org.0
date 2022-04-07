Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D984F71D0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 04:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300223.511951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUf-0005Hb-RD; Thu, 07 Apr 2022 02:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300223.511951; Thu, 07 Apr 2022 02:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUf-0005E3-No; Thu, 07 Apr 2022 02:03:29 +0000
Received: by outflank-mailman (input) for mailman id 300223;
 Thu, 07 Apr 2022 02:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqs0=UR=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncHUe-0004h6-IB
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 02:03:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9fe1fce-b616-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 04:03:27 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2437.eurprd04.prod.outlook.com (2603:10a6:4:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 02:03:25 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 02:03:25 +0000
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
X-Inumbo-ID: e9fe1fce-b616-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlZa2PGZC81sksg1MbgpAPy+UpeX3hzwnIhf9LyKqcA57O3fCbAxThO8EcWNA8uS2yYuCQcp3xlYfnJwlLuvoKJGTQXs+hnYN5K7VTK/J3zmLljBQRkHWi6aK56Pkbcab5mICpr1xhV0dCV6fyBqeywplFeSm6bXA+F5v1BCRVkmOa8qt2CNiFQpk3P0AxBomNviu52BYBg7O09d5+lIGBbxRpybqZEEyNIgaeQn7hapaY64A796H4t/GXzIZdDuuOnYDvs+c6c61RmPxowE6Q88T1/NpFRMfCsWTezaEKwgYrg+G84ThurXcaLJnyg/bJz4JVhy/C661L3K0djjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJJ17xML25oDlOV39Kw3EgsKV4hvJLgWZl9kJev+dnA=;
 b=MaZOOUBtXOC9Ku52fBFRIoxBKordXEbkvVuGN3vg3X9vrcwpbz0gq1NXS+AJx9N9Buk/uWLJrjC/kROFENpdSlhsXsjBQZNjd4304L66mb4vf/yC+twYKPBKuZjdnzIm3lg64yfz/BQ/l9NesR2dj1JR7u0ib6MjiqP1sBjT+T4rTHbFY2P4pxJ7OteEwNyu689I7H4s8+jzTMvEIDAbyAM8YtK+KY/Q4J1omREURb/LmuDnK2144xSjxnbUONoG3ct1TrM3iV9LFxeqy+hqvppte/QkPi71C41EgAIxr2lTUhKX/W/lll/+7jgNwTaSufbj5P1FAnSZ1hrjGxh4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJJ17xML25oDlOV39Kw3EgsKV4hvJLgWZl9kJev+dnA=;
 b=FUFtR1e/1p0hbJU9yTPtJ+a1MpfDsqdXojH3U/3ONsELEhNSV4QGse6KWpn3WQB6MOcyZrnqji3sEwsLny6lXReLQNgngx3XpTf1MWqQz1Is75qbR+xsE7RIR7iI8dU/Im4+DMGzNyYbGVwKwzQFwoJLsvFu/i4FAYRnOUYv5aY=
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
Subject: [PATCH V3 2/2] xen/arm: Add i.MX lpuart early printk support
Date: Thu,  7 Apr 2022 10:44:18 +0800
Message-Id: <20220407024418.9827-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407024418.9827-1-peng.fan@oss.nxp.com>
References: <20220407024418.9827-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7f86c0-201a-485a-ea94-08da183accf1
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2437:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2437F108BA83D2A8F614C0E7C9E69@DB6PR0401MB2437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tBrkc08VPPUiqJVLIds3FbxVlY5oz2EVGR206B8fSQ9rtmJEVgM6z8pdMAGDC69Iq+54KR4OD+XrbJS9tKFGo+crpYwgL0niY7A2yBtnB3dvOVvNdU5LYWhz6LcyNcVSkY3LnVFxraMamWM6k0SAMt/ydEG+LUsVLCHWTpFVehNnE4ZmapMdcyIQbSH1y4AR9x8lDCERH2E92bhgkEaOex8Ns7j3E+jn0FC+jTnSOesZlwZmHkQ0G27Dw/B8/ijew47jbzHf1lYuQ45hvgbHu3iq70SQjqVNrZwYR3I43LvHRsh53LZ/ftLrkdPKq6TahCC1USmDya5T8YMZC/uQleKJ7v+W0y5QYIiZLzqR9/feUH40slZIesPUZsGlV3RZVYqc0M6Z9BfsatJ6BYjnDj+PfAhQEkchlZuf4UMQ0zIqofCYgSBqcfD7K3EcaocQhNSHSSiUAEH4918HkbQjvEyPEtxaHBDeednXTAoRkBGnojJ3YeASe7JxN6kvMHVNuboTHa4fWJFSEZYn4LiIW0Kn8HMfmkwb6tpPqjq2Scm5o/Xn7Y3owmnDRSo74PFKM9A7Ad7k9bQsjgIs3QyjmQtBFKcPAfecsBH4zjz+1TUqh8JAMUfegQrAX/v7PitHuYkrPgjTzgVyGHuLhb/Q5tB2htUHTar0i+Iqn7y3U8excbk26FslwF0BHkqPWzR9g0pts4BiKbxph6a5SDZ62vPvQC1faZEHITtaGBEAb9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(26005)(186003)(52116002)(6506007)(8676002)(4326008)(7416002)(6486002)(2616005)(1076003)(66476007)(316002)(508600001)(5660300002)(66556008)(66946007)(8936002)(83380400001)(38350700002)(38100700002)(6512007)(2906002)(86362001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxwPyq/tUVGHJBwluEmLmcqMBi4GOFp/4ZejQ6SpBWyOrIv5YlT/3pwZyqT6?=
 =?us-ascii?Q?Bs1lwuoVb3KikyuHUafKPhcXQrIMESxtKGMxEzaulLwnwUiDHz773qQd/vhD?=
 =?us-ascii?Q?MTSkVsycbrq0txd0IuHiKIOebg3/CL6Xkw2iT8Y9gcodqKrv0lhwx6R8IWMD?=
 =?us-ascii?Q?YTRj8GUfE8CBMXPd7RJKUi94sAMKj1dwM+ug2NqxjAIyIMyPOuCR870VsQih?=
 =?us-ascii?Q?J2t6lEOXm2AqihMvjaICvVVwGGZxbdY9SCp9nWFHSu0GdaggbwVCTVM6uKqD?=
 =?us-ascii?Q?d9iFjO5o09MXMckRIXGxntV8nmCLuLMect/BWqq2SopmuXMlorhjfytY8eVV?=
 =?us-ascii?Q?w0FDH9PO4y9RshLvklpUQmIEH4cftYWLAZR+m+NlbAW7PcOWlmaddah1Kgka?=
 =?us-ascii?Q?vyMws39cwWLzvoAuPHOC9hRGAjKvE7c+NoaJfrLHSTA/4jkCLk+ILW5PJBbG?=
 =?us-ascii?Q?oInIPlpL6E8GIqITbVAbvT/Elh0OW0vHULjJUhHzJovchQOv1JwdOr0i9mI4?=
 =?us-ascii?Q?YbhHX5pLJwA1bk97r6fFnQdVNYR6Vo3CpiARh7h1ssfEop3HDgoboWOZaAp1?=
 =?us-ascii?Q?IoXC+m75qC55khO9vYuNKPAKhwIMu6u0a9pkNuEUMHc44EU6nCmmXiZwmNzO?=
 =?us-ascii?Q?CNnQaG/D30YDvnxwT82mkbV4DHfoerQHtP9PiSqv35Brs83n9uSxpe/G4itq?=
 =?us-ascii?Q?r00jUcdIC+D882cxM6HLFYuZD4JgQfnlY97MTNeTALaFSGcjJnV9HuFfP2Py?=
 =?us-ascii?Q?wOwxMwEDfW6NTNYvbZR3OM/WnBMXB6MXVvDyisO3ZFyNlPrnVB7KI7BdDgOa?=
 =?us-ascii?Q?x4Xf6M0Aw6UYqTXG7rS8fRVjBegAvxqzm/Cwps4ZXzYx0LCF+3aoFEc8bQ34?=
 =?us-ascii?Q?OJHdhTZ8nXBv3hdEiA3pkM/4CDAb8zqEd9AQ6u3NMe4uCzmC4c89o1ehZYXh?=
 =?us-ascii?Q?2Bh7gAJWb5EnVq2XSXGX8V4Kcv796BiH7l39iy7YB5z6ZxODlVKOrW4ESi9n?=
 =?us-ascii?Q?rKdcvbV3RFdndZPirFcWO8DNgyUUdrfOocdJYAPDhOxI4tZwzMYmIydD+xeN?=
 =?us-ascii?Q?sMHE9WK4sxzQYt2/mE4oiSFdut5FyTNbnMdhYORaaDuNaHCm+3HJLkmMs5B/?=
 =?us-ascii?Q?vYYW+xB4F592cWrZ+phFh8XXQgRSUaSmo31SMsa9upPyK019w+cBZCavW2VV?=
 =?us-ascii?Q?3ZXFoq3+Olf2Akgfi+nPG1m2Iyxh9onnqaOA7m7Xda+eb/aOuhab0eJTNXN8?=
 =?us-ascii?Q?2EC7qKwiVA2Ds2v/e0Va5zFQ6cwZHPSv20Ru5u0HbecWpeYoyxHXN4pYHeHU?=
 =?us-ascii?Q?uom2PiTrusLnvot2Wim575q2h0g4fX4ELXP5UL+HWNA2sCXAnyzSipd/DIqJ?=
 =?us-ascii?Q?8NW8lD/1pasprj8xn4UgI5R3LnOeVRQa6zXN0TujVt+pQpTIpZeKr3TkAUYw?=
 =?us-ascii?Q?zngUU5CWafPfbIGGFuQlGty+ehTZzI1X5mb63IvxcdSRUt3iGdFZDP5AP7dB?=
 =?us-ascii?Q?SNvz7iLms0ULTo93pwJA0gEIpHYC7pCk8XNF0FaAijI6RQJ6OEh3dWTKKMUO?=
 =?us-ascii?Q?k9jl13D28ME5v6tdYhU+94G8gkBXbThpdVuO483o2DTI/5BqglSOEuieJDyd?=
 =?us-ascii?Q?sQlKsL8RCjYGi6nHashR4lLE9mN0y7kW6iN49918/O8Q1eV3iz3wrd/RIx4B?=
 =?us-ascii?Q?wL27a+hzUEiiPSrDtpIJ6f72Y1Qy39HOLU9G+hHftXjBZqYWARBOxWG7SNvc?=
 =?us-ascii?Q?J880FVZMcg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7f86c0-201a-485a-ea94-08da183accf1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 02:03:25.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ze0YecGmJvAsxYCztH2MyQjG7qxpZsN5bVHIvZE379xt4pK8qjlInJwnJejJyD1nt/l47j6KZWHNRKxRcvowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2437

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/Kconfig.debug              | 14 +++++++
 xen/arch/arm/arm64/debug-imx-lpuart.inc | 52 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/imx-lpuart.h   | 22 +++++------
 3 files changed, 77 insertions(+), 11 deletions(-)
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
index 0000000000..f68252da86
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
@@ -0,0 +1,52 @@
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
diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
index 111640edb4..26e2cf0249 100644
--- a/xen/arch/arm/include/asm/imx-lpuart.h
+++ b/xen/arch/arm/include/asm/imx-lpuart.h
@@ -30,10 +30,10 @@
 #define UARTFIFO          (0x28)
 #define UARTWATER         (0x2c)
 
-#define UARTSTAT_TDRE     BIT(23)
-#define UARTSTAT_TC       BIT(22)
-#define UARTSTAT_RDRF     BIT(21)
-#define UARTSTAT_OR       BIT(19)
+#define UARTSTAT_TDRE     BIT(23, UL)
+#define UARTSTAT_TC       BIT(22, UL)
+#define UARTSTAT_RDRF     BIT(21, UL)
+#define UARTSTAT_OR       BIT(19, UL)
 
 #define UARTBAUD_OSR_SHIFT (24)
 #define UARTBAUD_OSR_MASK (0x1f)
@@ -42,13 +42,13 @@
 #define UARTBAUD_TDMAE    (0x00800000)
 #define UARTBAUD_RDMAE    (0x00200000)
 
-#define UARTCTRL_TIE      BIT(23)
-#define UARTCTRL_TCIE     BIT(22)
-#define UARTCTRL_RIE      BIT(21)
-#define UARTCTRL_ILIE     BIT(20)
-#define UARTCTRL_TE       BIT(19)
-#define UARTCTRL_RE       BIT(18)
-#define UARTCTRL_M        BIT(4)
+#define UARTCTRL_TIE      BIT(23, UL)
+#define UARTCTRL_TCIE     BIT(22, UL)
+#define UARTCTRL_RIE      BIT(21, UL)
+#define UARTCTRL_ILIE     BIT(20, UL)
+#define UARTCTRL_TE       BIT(19, UL)
+#define UARTCTRL_RE       BIT(18, UL)
+#define UARTCTRL_M        BIT(4, UL)
 
 #define UARTWATER_RXCNT_OFF     24
 
-- 
2.35.1


