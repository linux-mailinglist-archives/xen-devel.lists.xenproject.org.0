Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B124C625A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 06:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280086.477956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKc-00055E-Tc; Mon, 28 Feb 2022 05:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280086.477956; Mon, 28 Feb 2022 05:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKc-0004y9-Ph; Mon, 28 Feb 2022 05:12:22 +0000
Received: by outflank-mailman (input) for mailman id 280086;
 Mon, 28 Feb 2022 00:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLaL=TL=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOTso-0007Sm-HQ
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 00:27:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe02::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30b02d9f-982d-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 01:27:21 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6460.eurprd04.prod.outlook.com (2603:10a6:10:10f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 00:27:18 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 00:27:18 +0000
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
X-Inumbo-ID: 30b02d9f-982d-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjhichTcyAAIgI9ku7T2z284g06GO1wQHMR1atsu2pLjb+pDsaiU+pDnVFpBzOBmelMr1Np476YrFqcoFJ2wZOiWPpyNXXzQ9U1hHT9ee9iaDwa0BMRnrsbIp70M5oZKai3eJbfxSexByydtR1J23kfR9yYWv4ESUDYxptESrrJmvJNK6hb+ldXnIkV4yqivbPUjZj8xZNYN0GzOKhmcpnOpLey0aQtd09SludG0lLVmkeVCPJeSDPzBrzYrtLy7ox6bCUsolMMJY2KwJVap8jdlTaRYXWrh5ryBvn7H6WHXbGhftmFfHwmZf5PktPBsTN4U51UHWGFLy8dQswdkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wXOdp/qRyy28MQahFckXGWnjzLCGIX/DgJitz/KjhM=;
 b=Mny9SoOjoLQyHueLvltwCcOQapOrHDjvMGJMNP2KYt3Oep3jSpoqiw9VDbKYzGj1zXHa2wo+TTsAjHwm93rdwRg4F37RqBdIlGuWbN6W22MU3ih3UAyE6yz9zp6FaRfx/HNem9XH18JrOCcV2f1qnKDx6+xNKYUTkr/lj2baCAfPk4SwGEKxGbQl1KrNaoRMbG5Gc+B74RepTluNDwQ2sjOZglPbUmc2uefWyZLYhdiIDNqaqC94MRMPeOJ+TtXjM52KD8NTZMRsykdlMYD6j8pCNhSIObpcotCkJdoua9AwsuesNeAwx2aUh/zFT+RGbEwg5yCRbiKIBoJdN+bgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wXOdp/qRyy28MQahFckXGWnjzLCGIX/DgJitz/KjhM=;
 b=Kdzt/NhcxG6s67r19Frai88pZThyA/FKeyyEnxzI/nhGlG7pDCUDea5egIYbUjomloOvH5oZzxEmKh5OlXhPHwMXHRXQSnITM1/2lWQ5eRcdcd96IIobBViwctefItanMNcu1NLOmRgomKmvdhDjLpo3ihkMv8P0pqPHSgilAxY=
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
Subject: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
Date: Mon, 28 Feb 2022 09:07:09 +0800
Message-Id: <20220228010711.11566-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20220228010711.11566-1-peng.fan@oss.nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b1b741b-5009-4730-1971-08d9fa511357
X-MS-TrafficTypeDiagnostic: DB8PR04MB6460:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB646033EFC17BC649EE7F4D92C9019@DB8PR04MB6460.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wgCsUBnEjJNfumzMcRGt4qg0+OZHROm9nnA2of5KB9Omjdx7keMJ2i4xo85TOVYhvOuq3/Tw3u69A/cbujCGpfjDH4g3TM/NjJuw3n4RKhY9ycCf/Bla04u97SjrzDbn17G4ZFLfG/ADylzIjaFokJfXuZzHQTRK6tAokVdrpadv4tG8xeEinAZlv+JJLKcYco81OcnGti20y+kKxF62IM569OgwoMzrhrp0YdQEaBMq0phLP7hzy8Pkh6QKTRU3PXyAlm2hzHxN6OQEJ9d/9J+fTIi36KdKfoELuk9m+jr5V3rUKKnmdEdSq8aIGSljYOsZrxNiBDYUXOzphvlq9/ti/XtyRXaR4XxUfwBXTo86PkzNaVXeEKiJw4dDETWrQ8gp5VXoIAiNx7vh8D11dLc8UJJDjhaKYuiyanAD6nHiWAEwlJ43AXei/OzQYrNY/9/l1jAEsLigFfDRM2jBl/Xmku+B5jjM8pgA/gEZljb9qTKs6Jbj7qVMAXie/nUZylKmBHV9KsH4A46hPuErcqTnmJvcey3vOZtF9J4MNojcVNv7Kln8hm1S5/Q3/jlB1QYuyY33rNzIKz9cq9lAbtplX3Enm1FfvU95e6+m3XdivhzxyQWlVZbBIEhiuIJIkEeHWxmvNQrEwFogbikHm73vcniVUkBwgZvLpOqRsfdFIIxYFlwvZcLONzzkIyUBpfRmGCyKob7nYBU6sk05DQZyrUw0Ko3vWVD2fSuXdUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6512007)(6506007)(6666004)(316002)(4326008)(8676002)(52116002)(2906002)(2616005)(1076003)(86362001)(26005)(186003)(5660300002)(6486002)(38350700002)(38100700002)(30864003)(8936002)(7416002)(508600001)(83380400001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pTgVCFJ2DKBJDpJW+PMHoAvV3YXiGVvsqmyrrEg2UtPWmo5DVZ7sZnEBbSWE?=
 =?us-ascii?Q?ch2qQkYPlCTtLHeFBUNWtnzTib09YgtPtnRuemW1JWPLCicwCtiTa3y4EcOr?=
 =?us-ascii?Q?ISn8LbBuznD//bKdokXXWCZ+UYSUkiFzXZP5tlgmPvTH5/brnBWTzFrToiwf?=
 =?us-ascii?Q?8hZapammfFJPTWgXFSggF0vP/oL+fp+70SRrQ5Qb3OgsG1GrAQj1wyMhZw9B?=
 =?us-ascii?Q?ZjkSpO67uD93hj9i3V0iJW775AVDt0rlehzrK+LAPTGEILYrNTFUEq1WlQ7m?=
 =?us-ascii?Q?ngXboadw0qE3gHNG09fPwnG34TXO4P5WLpiAuqvJ4OlF024rBWbG6c47rtZe?=
 =?us-ascii?Q?HRO7czrWlLzgheP/EA+wOQCwB7QQAjI/ADjjO5rf2+Ayp+UMsClh9SiZSTvR?=
 =?us-ascii?Q?1R5PJ86m7kJSb51yW4gIQxePMKncv2X4HQUR+PE+fuNcM4wRTxVwXgcC4bYc?=
 =?us-ascii?Q?Z3pOiz/ehnguQRmVP15GPPjKm6LMhy4qVvOCNPt/fljxyqHo12UATdle7EVj?=
 =?us-ascii?Q?4H2sGFU8C/t+sZaXsdbk289EEekllJcKN5N/pMpUw9GK9xypqYGdHXSZKKyN?=
 =?us-ascii?Q?bRGcMyNw4CH4GMB5t20e9C+bi23isko+zmf5yKMPO24IC997G1XA5+VgQZYC?=
 =?us-ascii?Q?wX1VZBxcEPr8u4MF4x8hukcQQFfMYAfnlk4IYhs0GC9FIm0pVPzvW8o78lBs?=
 =?us-ascii?Q?JWGB5JW0ujfU5Hi51YnUGq+mIJgsStoC7+9ICQ/QU+1yN+EmD7YZpCllt7cH?=
 =?us-ascii?Q?h+X7oYEzluZOwtvWn8lR7TL09b23aMw4ELJC+kxspfEkXXWR3Hj4GcZX444C?=
 =?us-ascii?Q?Ns5cF7cnMZlMIpMOjIoNeQGTbyVEfiHh+ZbyNUCXbfmKbtREmGx+uO2NYDLA?=
 =?us-ascii?Q?bSjRdG78mFc7gk6jPy5RgM1oOyebbndzWcQD4c7bkemMWaGqQXN229yebPbW?=
 =?us-ascii?Q?5/So0EOG/DmWF6jpta6f2debVrtYpusrtvRw6zAbnu0ZrYcGbimoVnOUQz+4?=
 =?us-ascii?Q?6XI0pK46leSleW1SumjddJIYFaLFPwe80Q0lkdMWJSIqxoWr3PRU14GnJhM2?=
 =?us-ascii?Q?s4NpDksow0EdIQNBXxaS6o8a8VdLxsIifLAgbcFStZUCjl9+1lX2BHwQLZXD?=
 =?us-ascii?Q?mCOb6AkmgKNrMwZAY0QV/GNqKLvdBvO72GrbaRpYzvthuWqBNgKd6yZh9nRi?=
 =?us-ascii?Q?nxQ5EDGLzja2jd7Qj9/3KfwylmSWdi7cW0ZsOPQ2U4b234GmRlG3Ny3YA6A7?=
 =?us-ascii?Q?jbDRPCrzUZCUudhTOq0HO4iILVcXS+GuljbybTgPNRPUOIUDIelXk6z6Dzyl?=
 =?us-ascii?Q?6kreToiBvPVt/RyYWk60PRm6NLXBIH03ykk41QHNlzdnK9vw1WHAIxR+yNA+?=
 =?us-ascii?Q?duqCtdJlRs/WGbRbq3+z3W2R150dDJNglSzZBFNpqhCRkmKgWkg0kqlnfQB3?=
 =?us-ascii?Q?NB0P2wehmglVyFZjV2ZFl+58U0HeJvCoBnfPCA4FitnpBqx2e7h2XMb7RO4a?=
 =?us-ascii?Q?p8+zEpVIlOzdbHDbpgSs7/zuqxH7uANJVYzGJHN6icKbbBvtN0g7BN3/NGSw?=
 =?us-ascii?Q?TdNkCcD6qMXSnxQNskJzZn45CUILc493VjtuwOwP9I9+42XAehagVOHFbcLY?=
 =?us-ascii?Q?U1tX7xhP8zYOb//Wk/pT06E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1b741b-5009-4730-1971-08d9fa511357
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:27:17.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ApXLbcKGoXA+hr2XrwmFaMUF9R07QQ2O/Rg644RIiJx8YnaPEHF+bBKY7zNgCsrlaOu4pa3IuOQLrp/3K4vQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6460

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/drivers/char/Kconfig      |   8 +
 xen/drivers/char/Makefile     |   1 +
 xen/drivers/char/imx-lpuart.c | 303 ++++++++++++++++++++++++++++++++++
 xen/include/xen/imx-lpuart.h  |  64 +++++++
 4 files changed, 376 insertions(+)
 create mode 100644 xen/drivers/char/imx-lpuart.c
 create mode 100644 xen/include/xen/imx-lpuart.h

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 2ff5b288e2..0efdb2128f 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -13,6 +13,14 @@ config HAS_CADENCE_UART
 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
 	  based board, say Y.
 
+config HAS_IMX_LPUART
+	bool "i.MX LPUART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
+	  say Y.
+
 config HAS_MVEBU
 	bool "Marvell MVEBU UART driver"
 	default y
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index 7c646d771c..14e67cf072 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
 obj-$(CONFIG_HAS_OMAP) += omap-uart.o
 obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
+obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
new file mode 100644
index 0000000000..2a30e3f21a
--- /dev/null
+++ b/xen/drivers/char/imx-lpuart.c
@@ -0,0 +1,303 @@
+/*
+ * xen/drivers/char/imx-lpuart.c
+ *
+ * Driver for i.MX LPUART.
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
+#include <xen/console.h>
+#include <xen/serial.h>
+#include <xen/imx-lpuart.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <asm/device.h>
+#include <asm/io.h>
+
+#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
+#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
+
+static struct imx_lpuart {
+    unsigned int baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
+    unsigned int irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} imx8_com = {0};
+
+static void imx_lpuart_interrupt(int irq, void *data,
+                                  struct cpu_user_regs *regs)
+{
+    struct serial_port *port = data;
+    struct imx_lpuart *uart = port->uart;
+    unsigned int sts, rxcnt;
+
+    sts = imx_lpuart_read(uart, UARTSTAT);
+    rxcnt = imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
+
+    if ((sts & UARTSTAT_RDRF) || (rxcnt > 0)) {
+	    serial_rx_interrupt(port, regs);
+    }
+
+    if ((sts & UARTSTAT_TDRE) &&
+        !(imx_lpuart_read(uart, UARTBAUD) & UARTBAUD_TDMAE))
+	    serial_tx_interrupt(port, regs);
+
+    imx_lpuart_write(uart, UARTSTAT, sts);
+}
+
+static void __init imx_lpuart_init_preirq(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    u32 sbr, osr;
+    u32 ctrl, old_ctrl, bd;
+    u32 baud;
+
+    ctrl = old_ctrl = imx_lpuart_read(uart, UARTCTRL);
+    ctrl = (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
+    bd = imx_lpuart_read(uart, UARTBAUD);
+    baud = uart->baud;
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC))
+	    barrier();
+
+    /* Disable trasmit and receive */
+    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTRL_RE));
+
+    osr = (bd >> UARTBAUD_OSR_SHIFT) & UARTBAUD_OSR_MASK;
+    sbr = uart->clock_hz / (baud * (osr + 1));
+
+    bd &= ~ UARTBAUD_SBR_MASK;
+    bd |= sbr & UARTBAUD_SBR_MASK;
+    bd |= UARTBAUD_BOTHEDGE;
+    bd &= ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
+
+    imx_lpuart_write(uart, UARTMODIR, 0);
+    imx_lpuart_write(uart, UARTBAUD, bd);
+    imx_lpuart_write(uart, UARTCTRL, ctrl);
+}
+
+static void __init imx_lpuart_init_postirq(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    unsigned int temp;
+
+    uart->irqaction.handler = imx_lpuart_interrupt;
+    uart->irqaction.name = "imx_lpuart";
+    uart->irqaction.dev_id = port;
+
+    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
+                uart->irq);
+        return;
+    }
+
+    /* Enable interrupte */
+    temp = imx_lpuart_read(uart, UARTCTRL);
+    temp |= (UARTCTRL_RIE | UARTCTRL_TIE);
+    temp |= UARTCTRL_ILIE;
+    imx_lpuart_write(uart, UARTCTRL, temp);
+}
+
+static void imx_lpuart_suspend(struct serial_port *port)
+{
+    BUG();
+}
+
+static void imx_lpuart_resume(struct serial_port *port)
+{
+    BUG();
+}
+
+static int imx_lpuart_tx_ready(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    return (imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) ? 1 : 0;
+}
+
+static void imx_lpuart_putc(struct serial_port *port, char c)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE))
+        barrier();
+
+    imx_lpuart_write(uart, UARTDATA, c);
+}
+
+static int imx_lpuart_getc(struct serial_port *port, char *pc)
+{
+    struct imx_lpuart *uart = port->uart;
+    int ch;
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF))
+        barrier();
+
+    ch = imx_lpuart_read(uart, UARTDATA);
+    *pc = ch & 0xff;
+
+    if (imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR)
+        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
+
+    return 1;
+}
+
+static int __init imx_lpuart_irq(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    return ((uart->irq >0) ? uart->irq : -1);
+}
+
+static const struct vuart_info *imx_lpuart_vuart_info(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    return &uart->vuart;
+}
+
+static void imx_lpuart_start_tx(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    unsigned int temp;
+
+    temp = imx_lpuart_read(uart, UARTSTAT);
+    /* Wait until empty */
+    while (!(temp & UARTSTAT_TDRE))
+	    barrier();
+
+    temp = imx_lpuart_read(uart, UARTCTRL);
+    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
+
+    return;
+}
+
+static void imx_lpuart_stop_tx(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    unsigned int temp;
+
+    temp = imx_lpuart_read(uart, UARTCTRL);
+    temp &= ~(UARTCTRL_TIE | UARTCTRL_TCIE);
+    imx_lpuart_write(uart, UARTCTRL, temp);
+
+    return;
+}
+
+static struct uart_driver __read_mostly imx_lpuart_driver = {
+    .init_preirq = imx_lpuart_init_preirq,
+    .init_postirq = imx_lpuart_init_postirq,
+    .endboot = NULL,
+    .suspend = imx_lpuart_suspend,
+    .resume = imx_lpuart_resume,
+    .tx_ready = imx_lpuart_tx_ready,
+    .putc = imx_lpuart_putc,
+    .getc = imx_lpuart_getc,
+    .irq = imx_lpuart_irq,
+    .start_tx = imx_lpuart_start_tx,
+    .stop_tx = imx_lpuart_stop_tx,
+    .vuart_info = imx_lpuart_vuart_info,
+};
+
+static int __init imx_lpuart_init(struct dt_device_node *dev,
+                                     const void *data)
+{
+    const char *config = data;
+    struct imx_lpuart *uart;
+    u32 clkspec;
+    int res;
+    u64 addr, size;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart = &imx8_com;
+
+    res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
+    if ( !res )
+    {
+	res = dt_property_read_u32(dev, "assigned-clock-rates", &clkspec);
+	if ( !res )
+	{
+		printk("imx-uart: Unable to retrieve the clock frequency\n");
+		return -EINVAL;
+	}
+    }
+
+    uart->clock_hz = clkspec;
+    uart->baud = 115200;
+    uart->data_bits = 8;
+    uart->parity = 0;
+    uart->stop_bits = 1;
+
+    res = dt_device_get_address(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("imx8-lpuart: Unable to retrieve the base"
+               " address of the UART\n");
+        return res;
+    }
+
+    res = platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
+        return -EINVAL;
+    }
+    uart->irq = res;
+
+    uart->regs = ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("imx8-lpuart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    uart->vuart.base_addr = addr;
+    uart->vuart.size = size;
+    uart->vuart.data_off = UARTDATA;
+    /* tmp from uboot */
+    uart->vuart.status_off = UARTSTAT;
+    uart->vuart.status = UARTSTAT_TDRE;
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
+    {},
+};
+
+DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
+    .dt_match = imx_lpuart_dt_compat,
+    .init = imx_lpuart_init,
+DT_DEVICE_END
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/imx-lpuart.h b/xen/include/xen/imx-lpuart.h
new file mode 100644
index 0000000000..945ab1c4fa
--- /dev/null
+++ b/xen/include/xen/imx-lpuart.h
@@ -0,0 +1,64 @@
+/*
+ * xen/include/asm-arm/imx-lpuart.h
+ *
+ * Common constant definition between early printk and the LPUART driver
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
+#ifndef __ASM_ARM_IMX_LPUART_H
+#define __ASM_ARM_IMX_LPUART_H
+
+/* 32-bit register definition */
+#define UARTBAUD          (0x10)
+#define UARTSTAT          (0x14)
+#define UARTCTRL          (0x18)
+#define UARTDATA          (0x1C)
+#define UARTMATCH         (0x20)
+#define UARTMODIR         (0x24)
+#define UARTFIFO          (0x28)
+#define UARTWATER         (0x2c)
+
+#define UARTSTAT_TDRE     (1 << 23)
+#define UARTSTAT_TC       (1 << 22)
+#define UARTSTAT_RDRF     (1 << 21)
+#define UARTSTAT_OR       (1 << 19)
+
+#define UARTBAUD_OSR_SHIFT (24)
+#define UARTBAUD_OSR_MASK (0x1f)
+#define UARTBAUD_SBR_MASK (0x1fff)
+#define UARTBAUD_BOTHEDGE (0x00020000)
+#define UARTBAUD_TDMAE    (0x00800000)
+#define UARTBAUD_RDMAE    (0x00200000)
+
+#define UARTCTRL_TIE      (1 << 23)
+#define UARTCTRL_TCIE     (1 << 22)
+#define UARTCTRL_RIE      (1 << 21)
+#define UARTCTRL_ILIE     (1 << 20)
+#define UARTCTRL_TE       (1 << 19)
+#define UARTCTRL_RE       (1 << 18)
+#define UARTCTRL_M        (1 << 4)
+
+#define UARTWATER_RXCNT_OFF     24
+
+#endif /* __ASM_ARM_IMX_LPUART_H */
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
2.30.0


