Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F94500689
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 09:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304488.519137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netWA-0006YN-73; Thu, 14 Apr 2022 07:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304488.519137; Thu, 14 Apr 2022 07:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netWA-0006WD-3g; Thu, 14 Apr 2022 07:03:50 +0000
Received: by outflank-mailman (input) for mailman id 304488;
 Thu, 14 Apr 2022 07:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iUY=UY=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1netW8-0006VS-8f
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 07:03:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b19387-bbc1-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 09:03:46 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:03:44 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 07:03:44 +0000
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
X-Inumbo-ID: 06b19387-bbc1-11ec-8fbd-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfSk5RxEJd3SkmXddp4DyhmPCAelp4i9khrA68yhrw/qOf/xCFpe4O1bNKcM/lAI17V+9136G8K3lWOcAIIlUlK6AiRqGs3G1ejoxa9YkB22KFRmWy5HUHN70+YEgUnYhVgFvnqZ2hg/gkdwTi6moTTOJpHMQgCqGLG7duyqFMqtTX2IlfI4xXGvZX3gL+l1UbRvQplLeTtqpfQsrfgjab22JOYcGzaduyjRV6fiaqbkS2DiqDSGfMGDUmlsbKxj7KcHLySGSAmza6jBHEVugQb/2vkn5L5uAtKdAaZbLwgGvGJr+bYEDFB3LwitnexwA3klLNtQ0/hq7tLMXfPTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ASfelA1sgwddq6HCVN8ZQ6DUvJaEq/At9EOCkA2Mlo=;
 b=mKLfnVr1XV24JM3IIeiorG0QL4SXvSrdVSrNNfyDKXx1GH+lyMJINaA6rONkAuqD52pOBu7XyuadzIt4EQuV2A/z6/fE4pCoGE8ZAtYZshVttY8QreLQ/088l4HDhlDM7KwGf2Jz/SZ+nOrbafY19f0szjhrLtoLkbHx6p7jnM6eNOoArGmWe90kJM2dUMsDeWj8VgIGON6PSVL1x7CDoek+hy3rHE0RgEEbiRpT/D2LIMNaClQjvwW5MWDun644Oo4aZPy5l8RfdL69zm0hpUs9++P5TyEMxXXJ+O2WNGpZTxKcYhsL5Gs8Wju9gDn9jmKJlxVFCs61+jxoTRjdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ASfelA1sgwddq6HCVN8ZQ6DUvJaEq/At9EOCkA2Mlo=;
 b=eAs9PFVlma4gspzZ4CiCxDD/i0Tf4j3cWpmU0VXcdBRe/L16CKfS2wlLHvjsII7wUSRNmGaXVbMCyeLS5B5FaiRSIbuetZRJ2g+ROPuWaz8IvbcFyvDRtWQK46YJB3+6PCKcPr5ipwpOAnFRpAgRqzomJZyEPtAqeaUsCk0p13M=
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
Subject: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
Date: Thu, 14 Apr 2022 15:44:51 +0800
Message-Id: <20220414074452.14419-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414074452.14419-1-peng.fan@oss.nxp.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbcb948-a8ae-468a-f340-08da1de4e9d5
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5994148EC5F81AF17ECFB4EDC9EF9@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2RBThJ6qUDBu39h1toBHLcFPcI1R1pQCYns3HPjOH5Iet792zIrhq7LdehqceIn92Sh8tmDpO+aMI22K2W0TRpwICXDlck63J0SUK91mwWcA1IYztZ+m3uQdbmA/GLhL40jgZ7Iu1f3y84Ds6+G1+sra8vC9IUOFFM1xAiqn3kkpfIB5BB4tcEPpa0iscunpiKitLbTkTNtqkiedZjhq07Xx4CoZ+IQnUumMsu3dpe12BnAtaYubS7Eilw4pUQkav5XA/gqyuucQyDyPsPVmg5Vky8lY48h9+P3bZsqoNKLBQ1068GssIVo4OEhxV15BIMmdi/nTrCYS6vCHNu74PD30XEOitaHUTSDOE7LN2Yl6fYZHOVak5PgEcWxY0kZ9I0y+0sf592pvnedGrRk+8wcga5NssKCijH15xHMOfqEVC0N6IcmHBx7+AbkR2iqGBTQ8YlGKVMQI32sS0JFzlbtJT0IAjiTP8U1fGKPF+M/LoW13m/mIUVsBw3r3ebjJxelkLSwG38V5fakLdt9naFfRH5THojlxjiJ44CMOYR1jPmbdMSx2YxvU9zCWzmEoj30wkGF7pxeQegCOOXBWnwRR+EOwD/THk5iLi/MjCGCRlZ285usFZAXekvQ2jR5lnS99azEtdrS4yIfTC6iF6g2vVu3ExDNWLLYBsmqdcY7/knL1PQ/6neu6OMXwkq47MQyrlOKoM46D9hYWTOD5W9aSGpM9+9RF2gmZzrUZd9xGCKWgqAnpE213rDeUWsULXTelY7wvGET1r700Rn5RBFprUEMy31ACYo08xynE/f4zWKDlvnwHOm1A7Mc9UKTb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(4326008)(8676002)(83380400001)(54906003)(6666004)(6486002)(966005)(8936002)(7416002)(30864003)(2906002)(186003)(5660300002)(2616005)(1076003)(86362001)(508600001)(26005)(6512007)(316002)(6506007)(52116002)(38350700002)(38100700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?USRQa78oUqJNAl1CpTTUfkrTGHzoENgnTMkpROMpsIbOe/B1i9UnUNpttbRO?=
 =?us-ascii?Q?pzb0r8Wv4wX84buxD+n8PeaiAV6r380Y+6nEtwx+pmimTQ/CLCkJetMwbIeH?=
 =?us-ascii?Q?Dc5DOPYS/9jv0ctICt9HXNRglRo0W75ricldbfpaqPeiloGJa19vBIwwXffK?=
 =?us-ascii?Q?idjQc2ZWT1TjVS5B8SfkvcVnBwuazwo7u4mEa7kvmHGQdcKOs14HH5itx2Vc?=
 =?us-ascii?Q?+F7y0o8o/zTTD/v4lC8EcDedATaJOBJ2G6pc2MkyCBHzXYtv6ibNn0mBLZSC?=
 =?us-ascii?Q?lqcURZedBsBGQeWFHK0uCMKKt/QQyncbhAy0q9IRRFo+zOwPZaZt+A8mwjIV?=
 =?us-ascii?Q?L9mF20jz+CeHDSUzv5ymwAptfPO5LFafWsYqOg4w30EeLjPzzV3k2MOKHg9T?=
 =?us-ascii?Q?pSuT40+hViggC5PUKNw/EIqvXBCRJyIWVCLi/UgH9scMuqPN/b2OHMQjD3Kc?=
 =?us-ascii?Q?fd4tZAZC+G3rtwOCbirAAqF3DxiZr3vKoKZo7eQaXuX83IxoEii1qdbU9RH4?=
 =?us-ascii?Q?2PLquCh793dT3AerYQZNhj2Id1WmdpvV1O7P5hTrPfIeBYBU3SxIjPzHjTWl?=
 =?us-ascii?Q?Mq3D/ynoS6zFpUTrQgeJO+vK457dxrmnGs1GPLZgXdvnOMqE2e9VAQOWttAR?=
 =?us-ascii?Q?K3gd4xu4hgxiem3GYQOcV/oSKXBpja+UoLWuBekyPU+VwPEV41UKfkCdVbKh?=
 =?us-ascii?Q?igPZVrvKGRuRP2/hY+Ooc+UlZRZ9EkItrO4un0tv7l2Uyc9QIzZYTFHlpZ9c?=
 =?us-ascii?Q?g/0qwEywzgVnZ4FlovrTiqcGHOWsnLrwAXoYfal6zRPMINqA3eKT4kbX5mnJ?=
 =?us-ascii?Q?G86slc4565CHMZ3kRnwiLrqWeY8iw3f9WUzJLnyhHiJ9UV2l+l/5xENgqPme?=
 =?us-ascii?Q?I8pGZeDNFYmmwj0jheoHdJS5ObSf7YB0DOLN9jNxAZqD//+lysnrOrSpgmqi?=
 =?us-ascii?Q?d/3i0cV6z/byUAwEMv7WYL3xB+beoDZN6ofcEUr3KxkrWJaBPcHm1/QKI0sj?=
 =?us-ascii?Q?e0yVMp8vYIS7QIeK3A6g8takp72VO1P6B85DDjhEfILMetdKjfQkaLM7r38Y?=
 =?us-ascii?Q?oL3kl8vkKDS3mZgUUw4nHwkW6IE28zSAjZchincOn5dgnUNAPA8pfKQloOX5?=
 =?us-ascii?Q?KdjuPntQoGNnyaU4BjXZN6cE8N3lawR+ABbZWypt3rOmBiSQnamnWrP6IcYY?=
 =?us-ascii?Q?ATVy21TVUTbcasRS0IBDp4LXw6bigsfC7r6HJs52O5IRG+bIvZetvqA950ps?=
 =?us-ascii?Q?0vLaormpdupLmnceC1qmvmjaTE87FO0ZkBft27gFNdO4FmHNFDJ9NI4eNuZX?=
 =?us-ascii?Q?k94ycf+oIe1PoUojOLsOunWP31mu34Y+KGWtMzV2mtHFij6nXPZz7SGWfHIN?=
 =?us-ascii?Q?Rmph4rfjxi+bpSyQvHQrw8WTIwpgCs2wtwdl6RfIy9r7MZ9RdqqkU8hqkZF1?=
 =?us-ascii?Q?ILG+v+rIEaOOdRmKlFnarYz39E4rH0XyvcOQpi35lOOEWuMZ2EdllC6ZK/Sk?=
 =?us-ascii?Q?9Cf5JKlwy8V5tCNJ9E710qGv8J4BFMbs6PUzHgqX/RNAVpXHvXRKTgLrEtok?=
 =?us-ascii?Q?vqIYUUi6qsGt2UvY0PwQkI6JNNXc2CBiwXlrtADhvX+ePj1lU55QgT2FOeju?=
 =?us-ascii?Q?fe1CSNoOdp3SN0TkChW6q42hrIwueyEnJSGPRCHZafb9B1ZqWDqkeYLn6Hy9?=
 =?us-ascii?Q?r1Dvb0qMQgUUEbeMAowKm9a+5I4aYwz2wTSk3brNbXnahPmkG95z1iJiHk9z?=
 =?us-ascii?Q?DSkXLu/WdQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbcb948-a8ae-468a-f340-08da1de4e9d5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:03:44.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR/zJf7ZSwh02LH+W1+4r0jTkeK4vLbmFv5AWWd1QafioAS05PrBtrnzuQqLbYURj6EQlx3njx9cenmW1XpAog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

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


