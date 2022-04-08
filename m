Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D131D4F96A7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 15:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301577.514755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofE-0007BC-9e; Fri, 08 Apr 2022 13:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301577.514755; Fri, 08 Apr 2022 13:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncofE-00078O-50; Fri, 08 Apr 2022 13:28:36 +0000
Received: by outflank-mailman (input) for mailman id 301577;
 Fri, 08 Apr 2022 13:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SA5n=US=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncofC-0006sY-3o
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 13:28:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c932c11c-b73f-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 15:28:33 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 13:28:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 13:28:30 +0000
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
X-Inumbo-ID: c932c11c-b73f-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy8UeqeAC9/uYnq6glHa9R/ma7FmPgWYEkKJMaV7RSYepY4JGK+to+tdQ3wuE1amks+EXKGpqeogRFdpY8bacgGss8iYHbusQemL9YMlPuFQraM3u1xcYVUR7s2b7VZjKlfivngyi4lMm2nr433TK5qwK5A8rOhnMBxS76JeXviLtY+O1Eprevfi7cu5FhGm9cb7fxR6GHrI1raDCEenakesOViJE9Wg5Wm0zmtuxXEMWtoTaQXukk9Wt3BYE0apkqgSywyGsIKLtc8Npiiy/6gzq/sRxUqVPktW2sx3XTnj+RAA8QxiqfJP2JBOi5x+OPStJPZdB1g18DXSuGftog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOybCCL3522NRlFfet5yBrEZKjVeEkrG0sQQ70PYMaA=;
 b=OIwPHEoQI3a1NbGHCE3JUm2h63y3OEJxp6xeZqDBFtP4wlnvrMOMFX+MlUrFiY92OkzgJIAfUT/Knh7aY2/gTPdiwBquV+yrAXjybqiX2O8LSCQ8ub67eODud98RO7r/BOiQ0UB30cenY7fBwEgqntjVc0+NkJRQko3zR8YbuBBYF+tpCgLfkdEyGdqcPQlwNUYiHts6cvyB1VGNCmJDQm8x4kYALZTBRqzSMuXMaJoM2ZDltjheYMAFU7W+A/2tjpFYZCepZILTx4BWuxAAgu5pwmDUjHIjl4ymBw6+4h1DlUw+P0E10acmuflB34qk7urUASRKDZCr4cBAy6cutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOybCCL3522NRlFfet5yBrEZKjVeEkrG0sQQ70PYMaA=;
 b=ejbS5znFhYIBvtFO5nfXMvLSRLzk/PedoRYbNCmGlgD2PyucbuAvqQnQrt5ndYQb/d4f3jU3k9Z7MoV6gkAorylKKxvsQgXe4+1tipsy0CTp+QUZ1VBTmTxbmupuJSSp3+OtsQQxwl3H9546x5hbGpE2PMXY1GzykC8OnSG4QEk=
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
Subject: [PATCH V4 1/2] xen/arm: Add i.MX lpuart driver
Date: Fri,  8 Apr 2022 22:09:31 +0800
Message-Id: <20220408140932.17968-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb64134a-cf59-4f5e-06f8-08da1963ac08
X-MS-TrafficTypeDiagnostic: AM7PR04MB6949:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6949BD7F9C19B657804FC003C9E99@AM7PR04MB6949.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Dif43dAkCA4rmSGoQqNx53uUV5a+8aor/2AG50Kw5ubrEWf7iSHewTDAzHvJ4kMPqPOhNy4PpUAp0wdRp8CNzXuMOI6ck/dMZkaZ/wT8xZzztPyAQ8yHuWUjzLrfehzNRZQ7gY/5lAyqwmEeATk+9XVwEKnW5huuJ/ZqSA81EzPXjsONd118pfigrOuCNm2WuJx/9fR9ay7wyzxjY8C9n5tatsM41+U/3QFmnNKJ9oFtqfthbvwlyT/kEMzn4sXUOQibumybbIjL3NkN7IoBfqGGcIIGIj9JNZ0HHo2xx9ONSRHJOGcMqUYbIbuTpsEG7artgKw44RaEMW8fIzGjcR3Jl9mBm6kovv3PgAtsVEgZxKeqDpQd4C5JtNWCJxSKRcFMFjfeq+BJ/psnbin0lV1aOMkIBcTdTwviiM+VH7mKMQMER+it7SzwyFCIhLbtVUKCC9oi+7vTWKE7ECAeOQsB05+CXqYhlvioO7SslIle0lbVs6M5QjO2rpZgg+pBaNVR4Uidra8qthIQqBjy+UCI0h3lu5sv2gsTLrhSgnHESndECVisvHVKl/l4h4y1SmsSEs20PCNvniEmrNFN/vUVQuT84VRe3MUL+3oPNN4gV4fC53e9/YhNGPk1u/VUu2wzU36xF4ra5YRu3BLRz2xoup9KcpwAU+5aITg63GKjY4PxpDoDqH3qXwBeim0lcjvHdoaYIrJ7lUv22woVpD7KC+bcXJVogSaDm7CPWOnw086efyn7zVMDj+TtP3dVFmB2WIhhJX93gDHC845Y7uCbRmpaP1dOZDrCpDv5eIm76vqf0LPQiSOYnev4HxK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6512007)(8676002)(52116002)(6506007)(4326008)(508600001)(2906002)(83380400001)(966005)(54906003)(5660300002)(86362001)(7416002)(38100700002)(2616005)(186003)(26005)(38350700002)(1076003)(66556008)(316002)(66946007)(66476007)(8936002)(30864003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?88Uf+WOMJacQ+jAEg4oDJayvhPlJeTUZGphFu1dnQvs7aXM0m+rqpVJxqOvN?=
 =?us-ascii?Q?ODB5KooEMBO7mUO+FHP/Tyxtw2HDiaVWAMAGSHssccI0uKcIpMSkx6Zafkq3?=
 =?us-ascii?Q?mhpQdI3fyi2N3pFc4GtYZnQ5D8sKVj6pmyDsvMphJXIRlnG6ueAg+hTzfqbG?=
 =?us-ascii?Q?+dlzPjj8YraPT/aHBSlvKpSUXnYGn74Vegp9bFvcFH/aVOEjOwOmUPu0QJ4c?=
 =?us-ascii?Q?7t49FFMpQgROy4oYxZze99+0tcfm7Gxg+pzSyef4JQ/4O2213Kx5ZL4A/9zn?=
 =?us-ascii?Q?xYmiFGdPUI4SQGHeis9vILTR4H4FJP90p0B6puRBGZW1OlPByJEE7yDqR3Ws?=
 =?us-ascii?Q?LEJV0tu//EAkuHZ6nlrhRi7PFdKzxEOpflaFI8e62Mrk98KuGDDJ4S1wGpTL?=
 =?us-ascii?Q?mE/sRoxBE5ZPDlHSvvoujiXcvanQxwbQKR2nt+KdMbixW/SXMjO9qkTkZmkz?=
 =?us-ascii?Q?yfTykisgu7OKGdwGxdPUrAARFe9Dw0ILaGamIGAWrpcu/RI4eNX+50Lt3h1F?=
 =?us-ascii?Q?iHRrDtw4F6Mfj3qOqhJt08/rFKczIPv7SFfGI/TbP5wcRjRzG6evd6zyXnre?=
 =?us-ascii?Q?FE5hgUp0cPvfpVybLp3y63kLxmtNlvHZp1J3OXoV3JNfGF4VbxbUA7JBRQIW?=
 =?us-ascii?Q?pOQnkmUOAkt+ZYJbnA4yh6plu/isSzuH4YASysIdGAVPM1ojPKa3tde4+eAA?=
 =?us-ascii?Q?4a4MQb8HDpdItW4cD5k1mDbnohBh2NwN1aXn6jQCHEAtfhn3kdUkxIAH9Fea?=
 =?us-ascii?Q?cqvm5xMQVoSYcUa1TO+v0+9qqeVXWkXrghk9ub4t73b3kIyoYEjemwCPygmQ?=
 =?us-ascii?Q?m09DIXP0dBzSB/jh7fB/pykEd/zT54YB6QmX7GcHn308O6TNL8ZnbRrBCg6A?=
 =?us-ascii?Q?PUKWGKHLhv6j7H4ckvy18/DlFr+CXscHDKdVBfvY8qW07jGz//QHHFWHBJ31?=
 =?us-ascii?Q?Xp0eDdoPiZZ3GdHMwP6AGcI5vTnNVndEp92BJcvyC24/i0ZFDrMxn4iJ+eok?=
 =?us-ascii?Q?0ZsW6X/VGijdnVeScAs2iyXMnoZ29gsZkyctdwe8A6e4VbZsDWTG8fKXRIQ4?=
 =?us-ascii?Q?YD9FWc2IjxwD+XtKjSiJ5rPDhFeEDUVpYh7bB+XqUhLp1noEqP6/tQxNuRkr?=
 =?us-ascii?Q?EK6fFyiObhiVPBKrt98qFOi1FEiPc8iIXTxXnpixJMI9mwudRa2CIlxBBG8m?=
 =?us-ascii?Q?qI6ubJ6noGZX5prrIOyQk1nue3Fn3wgmCYgwuMcMNhCGehI9U/mN1YbZsA7U?=
 =?us-ascii?Q?JSMQRRcVNdcW/IHQrzteqCbdHyhaJ2rGaCZJ8feGrrtmeRtxJuOmqfcNOBqi?=
 =?us-ascii?Q?1UJ6OKqu5rxnrZLyXqeg0R9NR33uqycA7XpRN/0fW4mKtDzD+rosWrzxkwQa?=
 =?us-ascii?Q?NgSc+xtM7xvu9TuSfytx8hhSMTH5rlHTybauzZVg5kzULy3pfG/3zTC8c9UA?=
 =?us-ascii?Q?CESDeLI7+cJmuZJEwcjOmi+uZIwGya+yRUmUsZtmYAnkpgiT7FpsM7skc5Sv?=
 =?us-ascii?Q?aW4g4e4fc8UO/A00ibPwCRNHxx2plIobOEAAPrybR2FZc0ZNGV4XR+2LY4Xs?=
 =?us-ascii?Q?zqt8J88zbN4GOBl5c0uOyotwTE7DBzlyTKQeLpDMj5bi4NbcrK9fY1PPcF/L?=
 =?us-ascii?Q?F5Ek0efprKeErleWKCoPtI+g32Bk+82ImiPB96DsRrnGjspSwl69U06RziX1?=
 =?us-ascii?Q?Zd2zA3zHUcTRmfnvAuLiAT5QN0ApkRVZAAChecg5WCZ4VdjlWGXUE2GoxHe0?=
 =?us-ascii?Q?aDvRXQTpEQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb64134a-cf59-4f5e-06f8-08da1963ac08
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 13:28:30.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fkqgfz2OF5Q5Wl84rqL47bR1xdJaFlbX8CVdo/HShVrv7yxQ1AUlHnhaLPtk8E1x0sSaVTlnt+lBKWOFmnzF5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

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
index 0000000000..26e2cf0249
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
+#define UARTBAUD_OSR_SHIFT (24)
+#define UARTBAUD_OSR_MASK (0x1f)
+#define UARTBAUD_SBR_MASK (0x1fff)
+#define UARTBAUD_BOTHEDGE (0x00020000)
+#define UARTBAUD_TDMAE    (0x00800000)
+#define UARTBAUD_RDMAE    (0x00200000)
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


