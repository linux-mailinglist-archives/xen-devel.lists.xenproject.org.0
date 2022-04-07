Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDDC4F71D2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 04:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300222.511940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUc-0004yu-EM; Thu, 07 Apr 2022 02:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300222.511940; Thu, 07 Apr 2022 02:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncHUc-0004wl-9w; Thu, 07 Apr 2022 02:03:26 +0000
Received: by outflank-mailman (input) for mailman id 300222;
 Thu, 07 Apr 2022 02:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqs0=UR=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncHUa-0004h6-LP
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 02:03:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7750b31-b616-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 04:03:23 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR0401MB2437.eurprd04.prod.outlook.com (2603:10a6:4:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 02:03:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 02:03:21 +0000
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
X-Inumbo-ID: e7750b31-b616-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6plFObetNrjreWD34uCptHnpj0UXRvGezdXtIDWu4dxQzKYBZwVmffBwIeyYiuQYjHmxzDGHUL3QTPRap2ruMRhx+z0Dp6ON4ProEuUOk53Q1x0deCwvXxwx93/G06tK82l73MxwWKzBsCGG+9FLzcsx6fxhfrDqoBErUdwmTMTvlA3oM9iGod2tAHpdKVWdaM5xCnetjaQXkGIKmrR9B6y95VzS0lsmIt52/6W8SfZPBSw111Cm7UcuujONMocvnZ6kUdiuq2wHUkryezjaDJObu9wmoC4wFYISjisP8MQbyRFPX40OhXmESdtbHeBb3LCXsDzyNsPK+OpRfiTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ea60UXWNEu2YSN7ELCxvrnBQ+J1Dknsgns4VJXC44o=;
 b=Af9yRWriE0Rt2QtgeEnK+P6RThOJ6ZDZjfgz/yomrKK0cZbUTF6k8zWO3r2pss5Zizw4NVtcoebfHRW/HP7gLP48J+UKzo2EHcjJ/TFmWPVgCxYqu8rNKPRk2U5mYzj9ntxe1HSj9CtTmJYNqtB2KZaIK/XyaJhiiE//NbrL+LS7v1SRh3ZmEVXZRUzK9trDKx+Qr5KMtjSsU3leR74u6eZhVS7Qg/0bZhOMSekwAIK/uul8VzGjqiGxIDgkiVMZaItUR5xkXgZMCqSv/7iU7ppcX78rQ+daWpf8BkIZze/otg3+5xnsKEw/4aCmtye2ubqdOCiOPFWFqaoj7+17nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ea60UXWNEu2YSN7ELCxvrnBQ+J1Dknsgns4VJXC44o=;
 b=VmUYT0ZAgiKxSur+gN1NgAxhymXWygmzD/Qp6qR3aBsTb7z1aBejDiukf6bapZZOnKbrut5HIJmYxukWHpOmKnCQ7zSuIuR8S10UyQBHdm7+pSKjiodcLvoSvSXQ0BPoYsIF5YDK4vMb3jHUnNVanD8B23c2GTxtfDFkbZsK8OY=
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
Subject: [PATCH V3 1/2] xen/arm: Add i.MX lpuart driver
Date: Thu,  7 Apr 2022 10:44:17 +0800
Message-Id: <20220407024418.9827-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30f5c77b-3faa-43a1-ab4e-08da183aca8b
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2437:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB24373EF807E92FD89C8BE2C8C9E69@DB6PR0401MB2437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BUjq0qHVC9HK+bF0ruC1k9sG7JBJgVvd01szyRhKyxPU8vOkaZrbHL9BUZ57DUb3ZoLh50defivF+kOC62e4s16m4L2ZLrmeqbHGUKfmXZZ1GphDoPjNQFzxP6uwaeJUHl3fhGs8CQr2I8jldosbQCcxVwO4OnZkaUi4Yey194sO3lsmfy+9ksO60gTr4KE7qomUMsPnU0+IIuDoDqRla0wYecB77WpV5MzL2o1WvAzj4LgKlchCU8i2x015VX6Samb96/2xNcbb3Re2bABOcenpJr21nP8lXTXaQngbw84JbM226V3godpd31ghIoTAre7rDpC6Ucd+joVEDBoBW3sdpoPkmB9ddXXOXTDVRPHEmLHWK5c9rhv5Rn4lbaNvtSrYlUC2NSceNdBq2CB8UKUL0GlNCPDeWfxCXs3Ls67ik6IeVor/J7Ed0ix18RDEJidMtTb51hrni6XJ4J7zBYYXycfF9y9CtW2NIO9isQmUwU2LLcMC7eCDAR4cfKB08Y5s9UUPncnfGzJm9BsV2XhhYkQmlDhBtMsi5kS4UduCDHa+ysBC3XEQZdzHl2PBPtQJU9IEdQN+7ZdYu9TKRVnIkQp0Xdk7MzNxBwJdyd6tKliCpvj9uIxZZHxEjstw6kt66SgULk9m7dePA3Q5NNEJm7QsDW7dUu/LTfQVBs7xB9BVqdqTUgxe1FD8SSusALMseEm1HeJ1BeP0W74NWNE3x5sw7wxWzBKxecqaSasbHeeBBW4wMbf49WRm9My6ujViN4oBq0+SeKiszpylDwbfwNU+tsFtkVuXb3g5NdFYcrrANwySVn8YExy+QVYD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(26005)(186003)(52116002)(6506007)(8676002)(4326008)(7416002)(6486002)(2616005)(54906003)(1076003)(66476007)(316002)(508600001)(966005)(5660300002)(66556008)(66946007)(8936002)(83380400001)(38350700002)(38100700002)(6512007)(2906002)(86362001)(30864003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bHseDMZpnyuK/SB4p9AJOunS5sfMMRiwcPzSl9Lp8UQirOlOVD+49PVTVX3D?=
 =?us-ascii?Q?kE7H2a7y+kVKCVD4STK4fI1Q4fphgju7IuXwZJ2NL8SrjFFz33IChuH8tpkR?=
 =?us-ascii?Q?m1Foj8zXsyws16wdN8oy+chv4nOJAbQZz/7IQhQclLzW6gn/T8OjEAaeOplR?=
 =?us-ascii?Q?wWLaAtNweroXeCP9uaP2oC/BnWIpnrIvluJaRGf5cZEU2RnrFli8ZDFjGkWr?=
 =?us-ascii?Q?rRVFLzgnHqzE6dOfCZ/NCVypFWJ5T0f/4OiRcFvxYg0zFIUrtxjfe0rc6w+D?=
 =?us-ascii?Q?4Gp8yDcrlNjthz1lz5qoD6wRSZ0xugQhqfQtQ7kYkTNaMpQTRzAOAgCQoeBJ?=
 =?us-ascii?Q?vIj8d/hBYK+ojWIo3v3WR83ryNEVcOV6SvjtFSGvoWqjEMExNoPSwQFSgrXx?=
 =?us-ascii?Q?BqErYljDQL2pPvkztwoEiDBlhsWwWCjk996WXNmoUa93T5bm+DQhrXPY/jSU?=
 =?us-ascii?Q?6N8Nl/JatBTpvw10E+3SMjYlwPTs98dv+ORlOnPI9Hjkz8Z+Yav8r/2XvIkc?=
 =?us-ascii?Q?IEL3hQ6CsHukoKhm5Q5uCzNRofD+YwMfIhFfEiRRnYU2e2BtQeCuUnm1MxYI?=
 =?us-ascii?Q?vBOZd1qChs2+kHf2u0Kc02geupELAu9RT/ggF3TQU9IElRbh5HpF5HaDnH5+?=
 =?us-ascii?Q?KdFK1pvdQecZBqsk/yvMy/uMp8qeJRPawLURXTrcuDOhMLOlhU/pQLgZxGSR?=
 =?us-ascii?Q?guevrGNfBhZ4m8OHJbcwNN5uQNVFxgeCUpyYfU1BYAGQ71EPptNJwtE+QgeN?=
 =?us-ascii?Q?pX7fXg2mWeSJaqSlde4P6ValTxKsbWdhPbpTJW7gi+6tVVEVYOd28GTtrPXg?=
 =?us-ascii?Q?98n20Ifx1r6YfJsEfX6EWqxzYOuv85QMhSKO4yQrkP9D3FKwmHXECYM7tR4k?=
 =?us-ascii?Q?Wf26A2LPet2Yx6/HAJVU5UlPo8iIV4toE9KfjTWLM7JAkxgOKhHPG9HBpjzO?=
 =?us-ascii?Q?pmv3BFcK2FNUJBE8dGzvlVWJTNejyDvA7lo0NdsqziDsfjU+hHbXG5YCSkqn?=
 =?us-ascii?Q?loRd80NucxnSM/1CphvSe0vxQQY0T3CuryB6pupc34vQJYEiJwMMJJGEHMkt?=
 =?us-ascii?Q?6ibPFw1fs0qMV3L/rOQ54dFsQQ//l5qD9NrHwoxy1PxpvixQIrMox1uu7hY3?=
 =?us-ascii?Q?N62V5wMZZJPvC+i1XSkvJYM4Uc/0yfm6NOCIsMTmts53/774BgXKDJdc6hmL?=
 =?us-ascii?Q?/jlB1uvEBa6Z9g0nCJoDVzekN4XJsQDJRdnZyiCO5aM5CBJJ50aeJOj94Fkm?=
 =?us-ascii?Q?1OSwqcGRW2j0IJAHGHpBapox8VgckxABhkQ20oznVsBrkC4qyCNYvfKn6xm6?=
 =?us-ascii?Q?78jzOrpsxxisWGZJ8KoMYCA7SJYHjpeNr7xZEKQ/8EPmYm4EDD1AqW61/MRu?=
 =?us-ascii?Q?JlF83cuL6Kv8qfXY1hiIPdfnFRxyIwGa4Yxw8Yz40ilbYs+UNF9gnY5GGsOh?=
 =?us-ascii?Q?/TOMdC0bVGG/hXh9GSlTXhYgAbLqw+xyIJQ3DY3lRSr22zlA7KSCidQ/aNYq?=
 =?us-ascii?Q?1cgQvcIhOycK8WJqLBkOXAPYhCyWsihVoBWjhPDCXbSElnSF/dpn1/z+EXxV?=
 =?us-ascii?Q?DMYyLxetuRPlhsN24rQazM7RyrE4VSdFkmyi6DNhpTEUqatN68PxOgbaVuRv?=
 =?us-ascii?Q?jYXgFAbhAPYLc3xSrOIX4LfOI8rVhBpw/83DX6+Px2qxahoLN7PFB6y72uOJ?=
 =?us-ascii?Q?JjKr05bDj6ze6pG8949putZkFHwLR4rRu5AYUwKPQ/qwSK9Cl+bqcnC3vUbD?=
 =?us-ascii?Q?d88dv+uhtw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f5c77b-3faa-43a1-ab4e-08da183aca8b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 02:03:21.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9abojc9AyKulFTVJIi3pAWXcDgvuTINEg6WTI7XnwrXhTOun2yaSzlnHYQSLCuFpxAd9wiIS0FrxeNTsFRq4mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2437

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
 xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
 create mode 100644 xen/drivers/char/imx-lpuart.c

diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
new file mode 100644
index 0000000000..111640edb4
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
+#define UARTSTAT_TDRE     BIT(23)
+#define UARTSTAT_TC       BIT(22)
+#define UARTSTAT_RDRF     BIT(21)
+#define UARTSTAT_OR       BIT(19)
+
+#define UARTBAUD_OSR_SHIFT (24)
+#define UARTBAUD_OSR_MASK (0x1f)
+#define UARTBAUD_SBR_MASK (0x1fff)
+#define UARTBAUD_BOTHEDGE (0x00020000)
+#define UARTBAUD_TDMAE    (0x00800000)
+#define UARTBAUD_RDMAE    (0x00200000)
+
+#define UARTCTRL_TIE      BIT(23)
+#define UARTCTRL_TCIE     BIT(22)
+#define UARTCTRL_RIE      BIT(21)
+#define UARTCTRL_ILIE     BIT(20)
+#define UARTCTRL_TE       BIT(19)
+#define UARTCTRL_RE       BIT(18)
+#define UARTCTRL_M        BIT(4)
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
index 0000000000..df44f91e5d
--- /dev/null
+++ b/xen/drivers/char/imx-lpuart.c
@@ -0,0 +1,276 @@
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


