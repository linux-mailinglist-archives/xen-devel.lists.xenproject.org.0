Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB95062ED
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 05:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307707.522963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0N-0001S4-Ha; Tue, 19 Apr 2022 03:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307707.522963; Tue, 19 Apr 2022 03:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngf0N-0001OT-Ci; Tue, 19 Apr 2022 03:58:19 +0000
Received: by outflank-mailman (input) for mailman id 307707;
 Tue, 19 Apr 2022 03:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qar=U5=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ngf0L-00018p-El
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 03:58:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe07::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0da61bf-bf94-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 05:58:16 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2280.eurprd04.prod.outlook.com (2603:10a6:4:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 03:58:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 03:58:14 +0000
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
X-Inumbo-ID: f0da61bf-bf94-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFiHHvj9ejnuAhU7kyrWgpG2Gc6YMHm3y+EQKikp6L4eI5guNyyxiRhNAoMH6stxuYbRWny5AJDVnzht21iHnN3OEXSh1kIvA1DyCD+Li6eI1hSWw6iypeWT/D0eLthiKbxdoLWUVE05bwKKRIAYQ6CsRfBw86ELycT9i2yUVn9o3DewdoSDm8uhuEHjoQb+/St1N1meCCMa1rB6oefGUmeGgr4OzUQVUMDVfIMLFM0uUuurF7DG0GMATmexDSCvq6M+RRU9gkmd1lefhY3AL89sBz9Mbnoyqouco5mJ7i+/JIgacJhEYLiCG5cyD8AQJLpYq3v2X4FzPDDbaYDWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB7FHGMy0DRrx8MRkr42iYpWGBdzJjb/gHU7cgqfC0o=;
 b=DXbNpagu9QV+CSPQnyOSxAecxX9LMYjGzaC/17rP3yHy8V1Zh5bMTZjrVTY64yBTbrGmGdopJ8kynHvBslFZt1Cv8GmLK+DBf1DKpvoNnf76POjseCAWSDxXLD9mEC7q86R/uPpixMHBLMpIay7R7YXC34+0auc1Y1tkHnfVa4Rw/Hkt+cOnRKLut9UjXSa3GY5yKRxIzDOiP9UXIG5iwNwShz06fOrlmNkcIr9Xz2AsYWJRorkbya+hZ8e6/d8bvVNsn6Fc2tAi6ACQnQjidJT3Ge0Pq1Ndpe1EB0MDOeyX/X5LK2CmPZlW7h5GQDyx3gdl0ogBN4JgGQ7mB2QWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB7FHGMy0DRrx8MRkr42iYpWGBdzJjb/gHU7cgqfC0o=;
 b=hZO6dYzW3iZzimY6k4+v/WCutuijtdt5BW8dfN1Chctp6J8kIgqt1YombYOuB/cI5y2JLAU+gPtkFCssoteqhPHwerJYRSPW43KXkh6eizX+Gx+a2BIIMyhBEuTu9ys6RiH++fCtk3c3fDs/9EShePsYMveBrvRA1hPTXsLswpI=
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
	Peng Fan <peng.fan@nxp.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH V6 1/2] xen/arm: Add i.MX lpuart driver
Date: Tue, 19 Apr 2022 12:39:26 +0800
Message-Id: <20220419043927.23542-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 98db2f6a-6d8e-4a67-7e16-08da21b8d3bd
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2280:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2280E19DD1148EF81FE45A61C9F29@DB6PR0401MB2280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ty4ggYOJ6M+CGyC6f8D9HXVZ6g6Z3FSWIa38b5atzcIUQhYxaNtUGtw6/SmhHFPhc8g3lHcVmWTC1GS36estMcenfIbiRvDTsfSJR9WcFMHs7h/H6fvP4i21aSiZK1FmbcCgIY3hDPi2WRFBSl5TsSD8Mg6LWrS7oGY6z2QhGFLSnwJFy7sVkMcHGjRMx0d6vs+XTL8eWpcTRCUCN3QmESUp1DRSJmTAHv8TjU90EUiK9fcSxphV2Nnhi0mhyIfwiRGs1HiLGwiVDjxbV3MJyzuIzFevObttzNduzbH/cxFO7/ly3CBOHkabnT3c+2IvCC6Q4HjtvSlD85dh7dRz8ZE8ebAGv2GfAy1zxWLxb8Yu2FAg0tQSYIveIU+mMcIbtf8y8uQSKIIuOe/ciPObyHcXIpJF6x7sk/vu4L0kUz193KQAEvhDOS1Fkz5Udz0mD+ooWw6XVEdL0u9oAeGWe0UrQE3UFC9OEtciuS7LjR30HzitS+FoNHx+RDaQ9dHCFxDzfvRda+AqBUwgJAYJeEvcRbRjeNslpvfY7jlvGlq4GsyxiKf9JMil3vZMTmYdaqhPReztof1XYt+dOKC9qqf4lRiCBSiXlV6LsOHXSdm45luIP0egI4LsIJYP9RZ2Xk7GEXhrHiAo9K8gxwmF5wPuPFSfa3pkwHexEbviao0XgabLl2t+XYiHOJ1DNKukYagVfcEwL3ANz3ueDwhe2ZmI3HVIOjnJjQufIR+U+Tmnqhu74rmA+l+0SJaPOVSvnZaWPGKIHeN6ET0kMuNqluTx0z1LgO+JikdU+Z9S5QIcM/Icq5F0wzgj2CDOP2k8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(30864003)(316002)(38100700002)(38350700002)(66556008)(4326008)(8676002)(54906003)(1076003)(2616005)(86362001)(6486002)(966005)(6512007)(508600001)(186003)(26005)(8936002)(5660300002)(7416002)(6506007)(52116002)(6666004)(83380400001)(2906002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X4fT9t3aA05AbZB55klRlED/0zH0jx4xd8gEnoPUCATQdiz4LkwV3M0fr9g1?=
 =?us-ascii?Q?nCLmpsO1ejIKv0Z/DeG5wqDPjEFGyGpzyBBxmSDtLSmYO0sObyHlWShbHVnX?=
 =?us-ascii?Q?SrlsJbORVeIaTuJ+Q5JwLpepi89ii+cMsIReydgdY0vXVFdLt8ZuW5hTw6o4?=
 =?us-ascii?Q?gGoe9vZQwsrjsH24faVxorpk4dmxTZUYfMm/s0myCy4vziBFbSKDxPG7NN4V?=
 =?us-ascii?Q?yz3XM3pQiS7D+RoycQ5HaSoNYVGUfGM9fF7O9qs47BNsgQI1q6+fOVfyXo1W?=
 =?us-ascii?Q?A0ltZaGwbzQplo/8KsyKUmXkkTAFvowD7hWb59itxvYOVcFupsdIjWGPOTCw?=
 =?us-ascii?Q?uJ8vGuuugRFvvAqv02fQlCjAf26txko4WiFT6JX/Ktf7XDjumHpOOLhq9ub7?=
 =?us-ascii?Q?kh3ldux332QOqWEKFngjtC6izkjh5a8Cdq22SDOLRbbtyGEWP/g9rIQY/oPU?=
 =?us-ascii?Q?VzyJ/XHghXOeqae4FJjWHrWkE1fV+r2AZGpbdlvFJskkv0vM9zEfxWNnYqCK?=
 =?us-ascii?Q?T6q9MqYjyWyVbPDUU6o9AguJg+RQEhkpuyQeMef3JsxMPf1xqGGWDBQjoFWm?=
 =?us-ascii?Q?FXA/XfmoOSr9wEQt3A3HrVu4ueZvTETHkQybsclrMWH2QGBj8kNg3o7XaVAW?=
 =?us-ascii?Q?9FSg9h87fnO2ZOHXq/AXLxN7fAmLRIUYftTaQH8cJa4/VZiwKSBzYsxpALBC?=
 =?us-ascii?Q?c8WqSRvjI8wVelv2OC5u4dHMSbx+Y3Qba+VRREvl1tLskugZQ+y39gZbDVqE?=
 =?us-ascii?Q?tQP/+QtJulnNDQTnEI2N+Z8pEXN0gfIS+wt9vSfiXOJ3qroDJMDum+go44rM?=
 =?us-ascii?Q?QBPUImtquepId3v0Hz4BBU7h+peowVYV9H6hGl1/Pltcjb7+Lo+l5K06vL3N?=
 =?us-ascii?Q?RIoZj/qAiPHughg9lhrsMRZ72COrJR01xaoDdcje6LSNGARkBfq5he1FMjsF?=
 =?us-ascii?Q?KdEixNRQMe1gkLFBeKUH2zWlDZHg3aYqZfmFIWZQ5f1GwXW+vkT/jsuve2pN?=
 =?us-ascii?Q?9SL0nBB08TtDG4UZh0gbwZ+oUmFjcKwqCovTEpLluNSqLwOd/hgfY+CNICz7?=
 =?us-ascii?Q?xBGqaISCZQLqHa4548APf2ZO8qMpd9bUPItzncuGjtybY5mDS+GYHg2jfpFJ?=
 =?us-ascii?Q?VOV9n+6YLzd0o3f5SXKfVHF9w/afw4c6G9p7YR/9cqOsYYTsVL497XqFVVfs?=
 =?us-ascii?Q?dWwwikEKB6Yd8+voF+TncUrIdjNRcYSKIupMu91OjbNOGlahZyWJZqwI205Z?=
 =?us-ascii?Q?7mTxjflQKjnwJ6aFSsrKcFDJNVFxWUhUDahJVil7rwm/4DMJHhiO/GXIBeWE?=
 =?us-ascii?Q?wIzLfUMbPSQV8XRZXesm0DTbX+hGBurwKzsx3aIOSaAFYDiuXN3e6riE8sPT?=
 =?us-ascii?Q?WXv2JGcqEJROaaK/OoNWrTNscccNLCXWfvcTXu0h+cdiLsFX0Ha1WQnyAKyU?=
 =?us-ascii?Q?luXJRBcgjOWO35KzKLF99+AJ7rgaBJYGxt9Xpv7ZhMTOP3C45OPXOdMdRXqd?=
 =?us-ascii?Q?IqKRidwkO3PLQr0FFvldYHOjcbsMp/Y6yDEPHb2l0oQmSMHeQCNq3jD0Fw4A?=
 =?us-ascii?Q?ImVzGAdKWBJXQY73exF8LgOsgMf+W4mr+EsgbDUGEzrspgeeeNFGxU1xUaSI?=
 =?us-ascii?Q?JBiWU2GJXsrGWzdVxvGoWFk/PhRpVMHidOkbtv7um++uoPPlUDSMCExfxYXu?=
 =?us-ascii?Q?IZgSFLqTNTuY3cw/17PmuAdkeKL02LLrYxpNwacidbGcP/0eLX4Um3u95n6U?=
 =?us-ascii?Q?croumJrutQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98db2f6a-6d8e-4a67-7e16-08da21b8d3bd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 03:58:13.9580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1d6qE92Wpybxzwe2D+UmCTzsZFHBiplIP9ZAnjYhaGKtK2rCMBOOC7SWgVUXWwFh/eJ32JXxwk4I+jtE5p+Yag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2280

From: Peng Fan <peng.fan@nxp.com>

The i.MX LPUART Documentation:
https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
Chatper 13.6 Low Power Universal Asynchronous Receiver/
Transmitter (LPUART)

Tested-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
 xen/drivers/char/Kconfig              |   7 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-lpuart.c         | 275 ++++++++++++++++++++++++++
 4 files changed, 347 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
 create mode 100644 xen/drivers/char/imx-lpuart.c

diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
new file mode 100644
index 0000000000..fe859045dc
--- /dev/null
+++ b/xen/arch/arm/include/asm/imx-lpuart.h
@@ -0,0 +1,64 @@
+/*
+ * xen/arch/arm/include/asm/imx-lpuart.h
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
+#ifndef __ASM_ARM_IMX_LPUART_H__
+#define __ASM_ARM_IMX_LPUART_H__
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
+#define UARTSTAT_TDRE     BIT(23, UL)
+#define UARTSTAT_TC       BIT(22, UL)
+#define UARTSTAT_RDRF     BIT(21, UL)
+#define UARTSTAT_OR       BIT(19, UL)
+
+#define UARTBAUD_OSR_SHIFT    (24)
+#define UARTBAUD_OSR_MASK     (0x1f)
+#define UARTBAUD_SBR_MASK     (0x1fff)
+#define UARTBAUD_BOTHEDGE     (0x00020000)
+#define UARTBAUD_TDMAE        (0x00800000)
+#define UARTBAUD_RDMAE        (0x00200000)
+
+#define UARTCTRL_TIE      BIT(23, UL)
+#define UARTCTRL_TCIE     BIT(22, UL)
+#define UARTCTRL_RIE      BIT(21, UL)
+#define UARTCTRL_ILIE     BIT(20, UL)
+#define UARTCTRL_TE       BIT(19, UL)
+#define UARTCTRL_RE       BIT(18, UL)
+#define UARTCTRL_M        BIT(4, UL)
+
+#define UARTWATER_RXCNT_OFF     24
+
+#endif /* __ASM_ARM_IMX_LPUART_H__ */
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
index 2ff5b288e2..e5f7b1d8eb 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -13,6 +13,13 @@ config HAS_CADENCE_UART
 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
 	  based board, say Y.
 
+config HAS_IMX_LPUART
+	bool "i.MX LPUART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
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
index 0000000000..2709136081
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
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/serial.h>
+#include <asm/device.h>
+#include <asm/imx-lpuart.h>
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
+    old_ctrl = imx_lpuart_read(uart, UARTCTRL);
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
+    /* Wait until empty */
+    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
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
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
+    .dt_match = imx_lpuart_dt_compat,
+    .init = imx_lpuart_init,
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
2.35.1


