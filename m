Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44F4EFEC2
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 07:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297730.507234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtO-0005F5-QS; Sat, 02 Apr 2022 05:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297730.507234; Sat, 02 Apr 2022 05:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naVtO-0005Bt-MK; Sat, 02 Apr 2022 05:01:42 +0000
Received: by outflank-mailman (input) for mailman id 297730;
 Sat, 02 Apr 2022 05:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWb+=UM=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1naVtM-00057y-KR
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 05:01:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f92749f9-b241-11ec-8fbc-03012f2f19d4;
 Sat, 02 Apr 2022 07:01:37 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8216.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:01:34 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.019; Sat, 2 Apr 2022
 05:01:34 +0000
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
X-Inumbo-ID: f92749f9-b241-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCsJp3Q4//LivpClXOhZox1fILM/2EBV5GSI1hn95wsGHb+xAZJO2geRkrc+yrfYKlOMArqtxStM/+M0uabhomOS3YBREcAaENRiYl95Mm0PQKcD8nFCcf3QqQ8MeAfOL6f/24Ol0N/ryqEEqqTUYAvelEnjKh0WSabovb9w8ja2YkmJE3y1AHRd68Hk97ky1FzZL/tmYlGdUJHRxYOWMAb7XyuTDOQ+nAqlOE0yejI3sPTD1AWrsSfDbTkJiFbVKRMDSIj/bBtzEN9ovofhlz7HCduKRXoABif+lLM0MHFoq7MqpYKc4GlLJaLWl20Ux9cmScTCTWKcqAqkkg9MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l44XwJrGDUd0FHxAB5NlNEEDFe2NDZEr2lOA2fO6lwo=;
 b=hHnPeWpFEeTEFcPjjR9sKRZcQw8usgwe0JhEA6esd9BLwIExJE46PG6PzWD+flRRjefP3i1dV13/08X3uEyWXUqF+w+jc3Edq4Xlt0ut0EJI2IbESrjBDcS5Tx0yi9K1z0rk3L4EHPJbt2nLYkE4FxR13PxLvGBObWlMPb0aA/Q5wVcfYYbtyw5xqlbLLo7pCeFyme4Af5Spd050MmncKFDNzmT+yBdIVyUmDmisDuhc0QCwPJWY4qcJhQeojyD1g/tQxrDA3JlnpIgVGin9SxG+pbVdx1veFc39stG3dtm1xcwI5ti9LstwSYGt2KE9Xqhq6XpaPfsmOwZ/HrVRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l44XwJrGDUd0FHxAB5NlNEEDFe2NDZEr2lOA2fO6lwo=;
 b=V7WEMDBrkud/kwQoEE8dWOfhhKa8lkWCbYtYofkyDqRRJftPxZlov1nFnvl3aLygn2a+iPuIudnkjwK62SXhm6sV7ZgK+q4ymrwXx5CXmeNSHKd0lgrx9hcBvKl8DpN82b47a9ybiUMrijpwzjEiud0PpXzxUvxbOHvr+vBlenM=
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
Subject: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Date: Sat,  2 Apr 2022 13:42:22 +0800
Message-Id: <20220402054223.10304-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cbeb6163-8925-4f41-636e-08da1465dbf7
X-MS-TrafficTypeDiagnostic: AS8PR04MB8216:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB82163A9C8EA6EA507A21B3CCC9E39@AS8PR04MB8216.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LnEto3lkIuJOZoBoahJYDrWV6s4T+GaWvrLawb6qU0fFtHwdvF67zY2o1wgg+x49AgQghq610GOw4GSkhQLMj6XeBz4fP7KagWq+jOqRsHebIzKLKH3kZP1TH2buPAjosX+J+6MmXYX7H1/BqcX+IPqlnTbIFeRuW7Js2fvkm381NX/KjWVMTZVSACXhmi6jWcObcpBqrFux3kshAzxNMyiWZ7mY+NcgFYq4CLUuUD7aq5ZaWkPEczKSvNVodinjS2nqFSQzybEJRFXfsO6ri7OtVI3rDuQt/bT5uBVfWKB2aNMr/QFhWo1mI3PygKMsWx2ombjxNq4zYLmarPi/v9UXjcZgXyS+8g0nlSIKHXeEaYkVpHVgun332h9XibcbTKJLSnxDffz11+oEzOu1on5rv3eF16feyotABJYbiUPHCduBW6R/VNY/6qfEhNTvB9C6x/Zf//ZxezS+Rkn9PIE9zTI+TVrfRf0aonF3ileTk9JUBBZKmwcmcbFu7zT9G91n5IMpSZlIBLjWrwJ3RJW7GK20VtXH+wgPmpPDPvTPE4/r36LGFGnsG2Wa08ceDL0+TJoNOAAJiEdyEFer53QoORd6zLxrEhTGBT08r/WDlQB1UvAijPANR8Dsr4JTLBuL3/oJioXheAZBE5JX8vRaayB0kWpdSv7yoepDyMIokxjmYIhmDDO6h7rB2KxGnqbPQVVU4GiBaq5lr4+32sDuYpDSE/7DFmpWTkcHWONWQSe0Fy1Wjd6EOSxm3uDAUBOLnGhLaBOUUE9CnoYripj3xK/v5PV2UYLM8x6ekYvwVgnwtnsnfva0503StXft
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(4326008)(6486002)(508600001)(30864003)(966005)(38100700002)(38350700002)(66946007)(8676002)(66476007)(6666004)(66556008)(8936002)(5660300002)(86362001)(316002)(2616005)(1076003)(6512007)(6506007)(186003)(52116002)(26005)(2906002)(83380400001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BDPFtElNHI0ZjbzWTilvJ16VFu8QbyAfaS89SlG2FsD827LWCiONzDCnbTB3?=
 =?us-ascii?Q?6AgnHS7XHehIExY3ldQIMagx2JYntAeV1whFVK/ujni92rGxbpiZxQvyBhau?=
 =?us-ascii?Q?MAtrYAgBwtg8948j7aryfFUUzjhn+hDHS/mwLNf8Ku8Y6i8KTMNjqV15YZ+z?=
 =?us-ascii?Q?gMeadtdgkOPT/epo9X146jMXkkyEdR4kzHN4VAzUO4XWyKaQA9JbxXp62s+0?=
 =?us-ascii?Q?s7sT3Ss/DE2M6eCxMcd7ZqgZK4dami2C53/lfOboI7bYsTc/WXH/nettWTg4?=
 =?us-ascii?Q?lWlJS+O6NFsY2aYklL5kJkwn2jrSvk3jm2DUpZaSxW6452fqbJhmPZJvv1HA?=
 =?us-ascii?Q?bi5RUHF7M37kQMRwNNLETXGtoI+zzXuTC0sPk75xP51IjV8mLbzNKnhhgAdG?=
 =?us-ascii?Q?PJlWqbqWz0IsgZnG69uG9F0XGqalWvmEr/9BAN/jGuqIUHlhqGg9uVI7RGfH?=
 =?us-ascii?Q?pLfbFxeVpxy+Nsngvkk/jO2B6Okwg/3P7rF8vfIt20zFv9z+hkOncGzh86oH?=
 =?us-ascii?Q?pwKNdHQG9OEgigW0ZUgrCUuHTFsfuwG7Y7ItbeWewHZenrXrlnbf4V8QiNWc?=
 =?us-ascii?Q?vYLcGiPHCiTanIYATWa1HXfU2mVZHvy5xmQuoIYF3HgkNv+/wmYQ0oAzRw/W?=
 =?us-ascii?Q?kJxqvz2GDoaTdTvQmhM8DLf3sgsm/WJPf68psnROhszAr622xtJnWx7OWXyI?=
 =?us-ascii?Q?eyLi6dEL91NGoX3q/V5uUnKBFfznuZ5w2NizeMxCzrBIXnXspa9eOH4OzOcw?=
 =?us-ascii?Q?/c+8Aga5bgB1Qv3pgVYVNRU3H3LzqKjMOVRFPYjEUvQW6L8yTrsdVXJ03l3/?=
 =?us-ascii?Q?0ayEY5MO9mTFKLg1gd5BCilfLKOrCedMyTCnuQDlneGQbjrW4pStEoaSoVT/?=
 =?us-ascii?Q?N9tT9Oev/cAnEgi9nCK/9+s68C7hKCK39YdLeeIksSVWu4ZnQ1T1qOotA4TK?=
 =?us-ascii?Q?EPef/8tDiWHUuu2T4G0rx8x7S/PQqrxw0GQLoRPttedp1kUUAs3AAGR363pu?=
 =?us-ascii?Q?NNQH/fB6lbpIcttIxtVaF2o52Zomv6KYaGpa/nUdgMbpTw5xJbA070uVWLhD?=
 =?us-ascii?Q?NNCQlBAIHJpL6rRQg9nptVOfXXySWZ6LJpI83JxtBbGjkKvpul0DVDg21VXj?=
 =?us-ascii?Q?2mDedDZSy5JJ4bqVKeHTuY4QdvODGdHvnf946IaSk9bZPSqu0eOvieJvd+rR?=
 =?us-ascii?Q?r+vpHjzCoOgPqQky7aLb97mDg5UHOLGQUQYPPkGmrVaDbkWU0DiWMSwDsqgU?=
 =?us-ascii?Q?5jbbRlQmOiriKATZnxQlX6HHy7OOUs+fgWx+UJ/5EUwfnKT74Z5PTFt/Eh5K?=
 =?us-ascii?Q?EyujLV/zOBjfl+8lWhi3c8e2JY3bFLCXbvJr74JBVZhZ3udcyyLrffkKYCvz?=
 =?us-ascii?Q?WOPAQvd+ffM2qMPDLmTMOQ1X/RnF/a0uD5MluNC9jJEiQs8UP9Tprif6FW4n?=
 =?us-ascii?Q?UKv4uD9Ahl9OEA/QuH99gPuGaSMcXmDo3CfFNbaEbI+/Jj7F06PAbWAlJB0E?=
 =?us-ascii?Q?3b+LXRcH1+aFinkBTdUFpLPkU01pAvlqvYJwbVib5gFn9kJsP2sGNVot8TBH?=
 =?us-ascii?Q?/3cx/ioEO7aGcyjzEG7wQ72affQokt6FpZ+07Cbln9IbZjWVjD6xa+P8o2S9?=
 =?us-ascii?Q?I+l2V1WYMkVcJghq1eXC2jfEexD2LREZvMJYEaTlFfflzu3Wfb3+ViXIXNSO?=
 =?us-ascii?Q?MeJeljTnAzhITUtEsOchVzjfH3SY+DrSUKQ1fLdXZm/5300d40zHxMJf7pEo?=
 =?us-ascii?Q?5zszAuCDxw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb6163-8925-4f41-636e-08da1465dbf7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:01:34.4459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHS/CIdc5jolo6kDa7OL4/RfEewYCtjiizsfDiaspmpVoS93vPDH43kMWc+ZUQLk9jDJM4OzEOdCsl3xh6CArw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8216

From: Peng Fan <peng.fan@nxp.com>

The i.MX LPUART Documentation:
https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
Chatper 13.6 Low Power Universal Asynchronous Receiver/
Transmitter (LPUART)

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/drivers/char/Kconfig      |   8 +
 xen/drivers/char/Makefile     |   1 +
 xen/drivers/char/imx-lpuart.c | 275 ++++++++++++++++++++++++++++++++++
 xen/include/xen/imx-lpuart.h  |  64 ++++++++
 4 files changed, 348 insertions(+)
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
index 0000000000..49330fd2f8
--- /dev/null
+++ b/xen/drivers/char/imx-lpuart.c
@@ -0,0 +1,275 @@
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
+#include <xen/errno.h>
+#include <xen/imx-lpuart.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/serial.h>
+#include <asm/device.h>
+#include <asm/io.h>
+
+#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
+#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
+
+static struct imx_lpuart {
+    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
+    uint32_t irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} imx8_com;
+
+static void imx_lpuart_interrupt(int irq, void *data,
+                                 struct cpu_user_regs *regs)
+{
+    struct serial_port *port = data;
+    struct imx_lpuart *uart = port->uart;
+    uint32_t sts, rxcnt;
+
+    sts = imx_lpuart_read(uart, UARTSTAT);
+    rxcnt = imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
+
+    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
+	    serial_rx_interrupt(port, regs);
+
+    if ( sts & UARTSTAT_TDRE )
+	    serial_tx_interrupt(port, regs);
+
+    imx_lpuart_write(uart, UARTSTAT, sts);
+}
+
+static void __init imx_lpuart_init_preirq(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    uint32_t ctrl, old_ctrl, bd;
+
+    ctrl = old_ctrl = imx_lpuart_read(uart, UARTCTRL);
+    ctrl = (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
+    bd = imx_lpuart_read(uart, UARTBAUD);
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
+	    cpu_relax();
+
+    /* Disable transmit and receive */
+    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTRL_RE));
+
+    /* Reuse firmware baudrate settings, only disable DMA here */
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
+    uint32_t temp;
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
+    /* Enable interrupts */
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
+    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;
+}
+
+static void imx_lpuart_putc(struct serial_port *port, char c)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
+        cpu_relax();
+
+    imx_lpuart_write(uart, UARTDATA, c);
+}
+
+static int imx_lpuart_getc(struct serial_port *port, char *pc)
+{
+    struct imx_lpuart *uart = port->uart;
+    int ch;
+
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
+	    return 0;
+
+    ch = imx_lpuart_read(uart, UARTDATA);
+    *pc = ch & 0xff;
+
+    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
+        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
+
+    return 1;
+}
+
+static int __init imx_lpuart_irq(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+
+    return ((uart->irq > 0) ? uart->irq : -1);
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
+    uint32_t temp;
+
+    temp = imx_lpuart_read(uart, UARTSTAT);
+    /* Wait until empty */
+    while ( !(temp & UARTSTAT_TDRE) )
+	    cpu_relax();
+
+    temp = imx_lpuart_read(uart, UARTCTRL);
+    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
+}
+
+static void imx_lpuart_stop_tx(struct serial_port *port)
+{
+    struct imx_lpuart *uart = port->uart;
+    uint32_t temp;
+
+    temp = imx_lpuart_read(uart, UARTCTRL);
+    temp &= ~(UARTCTRL_TIE | UARTCTRL_TCIE);
+    imx_lpuart_write(uart, UARTCTRL, temp);
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
+                                  const void *data)
+{
+    const char *config = data;
+    struct imx_lpuart *uart;
+    int res;
+    u64 addr, size;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart = &imx8_com;
+
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
2.35.1


