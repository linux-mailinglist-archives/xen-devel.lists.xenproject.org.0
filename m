Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C0C4F96A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 15:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301578.514766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofI-0007UZ-La; Fri, 08 Apr 2022 13:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301578.514766; Fri, 08 Apr 2022 13:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofI-0007SM-I0; Fri, 08 Apr 2022 13:28:40 +0000
Received: by outflank-mailman (input) for mailman id 301578;
 Fri, 08 Apr 2022 13:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SA5n=US=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncofH-0007Q5-QF
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 13:28:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb634302-b73f-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 15:28:36 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 13:28:35 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 13:28:35 +0000
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
X-Inumbo-ID: cb634302-b73f-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgV6tA+oAktRtC0SX5nswa3Ede+qtHd29x2XLTuzyg9SqXkrhVkQ89L9IzMCK2k7m3RzPulMQn3oLiPDQDSagYt6aTo2UMue3ettaM4QMpBfn+rLNn7rn0BK93vp77xyKCbd6H68BgiBT032AGC9vuUzXOrA/qI8kfhp5S+ezMrOyYC1+ZE2rb2WxsAtWQk2wHnhw2rRf8k6wdm0IGAfMgaISp5jxLk1vxd5TiMMtmaejy/IGm9R80VIv7MDJ0HNGAfM77WTGUutcQ6oOI10UoD7TBiRUkudRZ0pX80Y1ct7zJZ22XVsK+12qpHMfGDvcQQYHKi9G04sHFq5gQ7Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWdVjcMnWozl05+E5IE0z2YpFwdCyGDLKaNm3kllK3o=;
 b=b0oeQrA8HWaYJsezh5fv6z6tLGxZBNsqFciYSXa6BJwtpBB0CdElBOBrvlbptQNA8PbR+1CNtaC7lVEGtuZuAdwbao4Ud6DWBZfmKhHQ5Uu8Ko4x771cTsAgMx6WNvdP4ELBA5zwPXlbYzbioT/Nl0Z3C9xQaufBRyElH0Oz4pcIik95uFRl3hzdnFomoxQwXGVa9Nr0moTo3Crg9EsD8xi/7NbUoIZNpaopuonz3eCHflXhiCcrs+dRK6mL3ST6ZPYN73eSET4Mp/qhCnmIJ4eglHtrem9rliLBNxV9jy1a0h6lZI/VdZJZz/sd673jrB0zYcz2M7bSBBSvkQybqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWdVjcMnWozl05+E5IE0z2YpFwdCyGDLKaNm3kllK3o=;
 b=XEsmLXPo1OfGZ51nWzjqAEvRlsoTMjRSwB/+gTrLJodkxtVMLb7Pj/PjtYT5m+M9ZwPIKib/qYjke5WWgyA/PmKNmvqL/J7FROgUeOztCCYUVjBGfQKw6UlB3d4b6mdmpSKQGW5Ny5s8vRKq9riuW0I/yqTsQ/fVMSy4TPdE56I=
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
Subject: [PATCH V4 2/2] xen/arm: Add i.MX lpuart early printk support
Date: Fri,  8 Apr 2022 22:09:32 +0800
Message-Id: <20220408140932.17968-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408140932.17968-1-peng.fan@oss.nxp.com>
References: <20220408140932.17968-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 276d5a56-f2ed-4806-745e-08da1963ae6f
X-MS-TrafficTypeDiagnostic: AM7PR04MB6949:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB69493D503F7FAAFD6DFED29FC9E99@AM7PR04MB6949.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CuRccfkGa8G7dSKUcJIB8EaN0pQaI0Mf1TOie2vdOu2OGU4sUl7A5YQIxs9heLjNOlYVQmLM1YQ1GifWJiD4ZHTZM5pW8COZOIhBy9lkT9uVEk93plHmktGhYDa0J1I8icItQBWClus3BeKNNEcuAX0I0z/1sGOaHD3E0gI00COiCV7WVF1Osr6CXjd1CQVsFvynzGB4qWb26HY4lbkNFcKMNACiQjqePEa0yKjkTixXRApGtd3f2Q4GP7NDkoDAkDlhbG3lLcJOlxxgp7fbIehSAiw0Ak8/tVvYajlxr/HanXGtNCbqc13Parkxox7RnTFUMo/9H5INDQqbcfbTh8I47vLnG6fFI3uMXkMacIuDIFcXhNa1gfZ3dHoJD3WK1w7QascMO7MgZnOlA9XB2ABT1EyPgsxBge1gipzBY9r/y25BfGn3xQ5HNXr1I7iI+DE0R7SNkbwyS0uA2bO8/q8fvxXdwecbTSe3B9e0N8Se4pecTrDG2rl+YcLEGqY5ab2nxst71LjFSwn2NMecGwO2AAgKSSAdxV2PIwC6j1ZPjG+U6AwYbiIwVFnuw0BPICrVgpbC7i6C8Xk5NZ2o/M+vDHvs4ppv+Qrw7h3oxzvxXw1q+rp3X+BlmLd0KVdK602Q6Py7wGuQOv0KOtdtWcy/rmwtOe9zIqE9hPA/LhHPa8dRCZremis2v2/08Oqnr3lF0Vlpdn4U+EW2spa5F+qP1GUnJTgg/i+DgNRB4ps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6512007)(8676002)(52116002)(6666004)(6506007)(4326008)(508600001)(2906002)(5660300002)(86362001)(7416002)(38100700002)(2616005)(186003)(26005)(38350700002)(1076003)(66556008)(316002)(66946007)(66476007)(8936002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9mQntZZUvJi9RKLkVNwEtI+rvB+CcydTnBNwFneojYNHNejyhA7oRIhVQwQB?=
 =?us-ascii?Q?Tv9Ze81jbiG979pLZZ0WQWzXS1H3rFBpLggiX9Lzx3IqEVHrwQMX2yLZCAB6?=
 =?us-ascii?Q?euxHDfOwF2UjY+yVdh2KV68WQ+Hxgm99Ij2YsFuuP+h2A7UnHhSQKPBfgy/x?=
 =?us-ascii?Q?P6+5eFZIupJzmZS3puqbF0YzgeLjt3SfRd0AsmzczNB0oHXVBuoFPzGXOlje?=
 =?us-ascii?Q?0mwLxVIjrs0LDvqD9zJ8pIqkqWXyO1oCqeMNSxI1k37b8H4BByx1isaeLSbX?=
 =?us-ascii?Q?8+V8PIvX8s2qYMyO/1mK1Hj59vOWhAeA9+22k2AwXvZPpFjFncy5vwgNgn/x?=
 =?us-ascii?Q?6ckNVLWfEWKsmofqB6XZGOhPN2eYI7mJZvTIRtzu0grCmYfy7KM9f3rEJ990?=
 =?us-ascii?Q?/yozS4f2rJe+0r+l3nmGxMkY/JOPgpg+ZMjRJHyr1GC2kTpHep7htKl1hKRt?=
 =?us-ascii?Q?z0zH+hGl8NrEg50YkdVvyWPAaWL0WSSs7gFZSTBWXHKbQm7oqWJkxckC3K7l?=
 =?us-ascii?Q?CvzSbgH8GUxKZMFeffcDT2yklus6DqmUM61KH7d5Ng/SqAlCnEjwCmlY6mMP?=
 =?us-ascii?Q?FTe6a2VtsNLHMcasmgRQOi1iat2U1AQNPaqTBdbRSnK/PudWAhbQFrKdoxZU?=
 =?us-ascii?Q?lqYWyIQIThN+t7Cd9JPP/gIj0O8wdWYSEgUcYqqA736Wo1SX/wPZ/g3XJXI3?=
 =?us-ascii?Q?Rz2rKfBW/zzI6RosML+oLR+625xHwotDgGKuaPTBvW/dBX3wuBHE4uNixl2s?=
 =?us-ascii?Q?ExFlXN4F4Tlb1m0kOpp2BORIPKON92qlxAezF15CaGiDPmCoO9e+DRm5DlXI?=
 =?us-ascii?Q?VOuE+t1Ew+E4eoSL/AuHvcifxhq3Q1eqZxU+w7hKOgVNgt2BppjJ2R3uX6mb?=
 =?us-ascii?Q?ghipcUawyLMod1BwGZimoeEDp+SriRdqr2bVkcwwSR7rf1QhdT3B5kDTURrY?=
 =?us-ascii?Q?MatvnLIintftgfzc+G2V65Nn8SCpK5KnaWiRTWnAw00wR4qdvSFaVFo8d73g?=
 =?us-ascii?Q?JviVOzO7DSVVB2GC4tntgGvXpWGl2IIR1kPLwnPS3BTpQ76jAuPXyrr7hscd?=
 =?us-ascii?Q?XWLwFfvoUqzOiKI65ehxc24kVmoPehZWzos+DD857a+VnZ98GajXSTJuIiys?=
 =?us-ascii?Q?lzriCZTu5EDOnVp1Zi5JWUKH3SjWmEzFpDLhxEMdzlUEa99BLr6KTJD+Q4eS?=
 =?us-ascii?Q?ph7c0Lz9LhK3WVsjaU64XIfsEk35pTSLDBRqCwkIOPhwRmtABnxWwfX808ux?=
 =?us-ascii?Q?WpbiCzmunLlFwpiq0Ugr2IWkB9lV7qUF9ytWOsIS9WOg+qJ848/d4r3HKPDa?=
 =?us-ascii?Q?vyZOeYr/Jkkgme7UYyyMDHNuRSUfD8qMWkuFLzLX9sYk0xK/VkuO9e2/cBvR?=
 =?us-ascii?Q?cTaoH3DtsWMqPSPNzYmqa2neI/2Mb0F+sjD3wC3E+4Lvl11EkjMPY220uFTJ?=
 =?us-ascii?Q?wPA03MYaZbM0ZxKBS5kVZN0Ndf3RTfJo7Aw7ShrWpbk4aC6akMHDMaxd77/K?=
 =?us-ascii?Q?XD9jBL0efF6tiTdOAulIOKeXeSTH7V4qZsbaUe028rGMB1zDoZRrH3zP1DRS?=
 =?us-ascii?Q?aquwCcUcdhYny2Cgare7HsXPIW80fvX1r2LEmmxhXMaXnuKNUQRCZaxGnVSn?=
 =?us-ascii?Q?Hqp5xeT6BL5PBAXz01QhbzU/9xZIjWZoczMpPhQxDNSiQJiIe1mwkXbwDgWI?=
 =?us-ascii?Q?5WK88yO7HR5e3KnBWbzLiG5HC1ebZZ7s/hkFJoeLQKBIUkETwYTUQMCgdZ7C?=
 =?us-ascii?Q?/HylQmV+Aw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276d5a56-f2ed-4806-745e-08da1963ae6f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 13:28:35.0342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9SRG9vMeGFDDYZHVSn9mS1/pKGA7C91mgHlxoHea8w5V0zFaDEL3TiSWgFUVZyId1IUa1i5SGofEGyjazWaUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

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
-- 
2.35.1


