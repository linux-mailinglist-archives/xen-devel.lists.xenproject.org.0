Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1924500687
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 09:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304489.519148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netWC-0006qj-IP; Thu, 14 Apr 2022 07:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304489.519148; Thu, 14 Apr 2022 07:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1netWC-0006o5-DK; Thu, 14 Apr 2022 07:03:52 +0000
Received: by outflank-mailman (input) for mailman id 304489;
 Thu, 14 Apr 2022 07:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iUY=UY=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1netWB-0006VS-37
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 07:03:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08ea643f-bbc1-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 09:03:50 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:03:48 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 07:03:48 +0000
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
X-Inumbo-ID: 08ea643f-bbc1-11ec-8fbd-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbrH7OaqsrFG0o/X7Al8N2xz5pcLLub5KXjMINnyq25AdIcxDUqp1Ag0rbjYu5hMAQlF9SEmHcVMfzWBg+PJixuQKvxC8lrWW8SA8xWlXSdFa4mJUniROm75XJ58WRD8DTpue5XvSgPA7TrW/KFB1QQv45pxen9pSLHy5ps510oKHWle1YZ1FvVrdFsGHpgp2zRgLFFBJK4rfVZOv/N+cdc6pQlSKiM78ewTdOWqdkUzYVQS42dCd4VtTj8PZMhODHTWwb6V16srcSXo1pThjp4paU3xl3dA/RtVOJmsDNH3SkZB7g75CouQdEIbq9b176XMApUdA5vs8xca2D3Vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QqFMtw5JqTtw6Jd6dkBHTwFJGE0lWl5lR8Rfrbsrcs=;
 b=SLueyst1PJO0rqagpWhOIakYeQGgHtwFM63E2pPwiiIWF5GWVLNkwOKNpK8QChosg5CvkcS+Y3/OZvHk+ohF6PJJ9GuTstumVs5n7tRSt+uLEvemr28Z8sSPWbxmAiBv3ystC1L5O/IItKTHHHlXJdj+ZqLzOMibgI4hOllCsdbnfmK9TaGX2gYz7OBAgJZ+KI1heRdwu2bKeI2S7+jfYuIdpdROEFLuvoQxWNqjqGMyPj6IOQcWmwdqBP4iVaKT+E1aGcWu42sXjy8aQCGYt4B+T+Gyo68EtV51zenVBr0ReM7PjWnlxjKoP0SVcjFyK5ZjtCjEYDdFMJNITjp/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QqFMtw5JqTtw6Jd6dkBHTwFJGE0lWl5lR8Rfrbsrcs=;
 b=SmY7+QstiGAtEs++2QreX2LsXwmUbC9Qt50o37YZEGVR+pGcQuP8y5ZzcONuCuIlkAg8Cj+gCEUS2iZPwxBpDLn2B5ZS7KPyU1+BceEWt55faSZDOnRYf9VR5TVlw49g9Q52cPgLo4y0CSbRmbim+RpPA8/d1w+b6RbzcdLKxyk=
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
Subject: [PATCH V5 2/2] xen/arm: Add i.MX lpuart early printk support
Date: Thu, 14 Apr 2022 15:44:52 +0800
Message-Id: <20220414074452.14419-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe9acfc4-2831-41cd-9379-08da1de4ec4f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5994644DE0B20E6A38336BE4C9EF9@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTEv4/ag4FjNZqNHaYM/h3aI1AAFj4uij1+cAhFSYFFxd9Hy7vPQLXPDNEAfzxjALtnJ4wy7G2EkT0pTW2Zf2tysIIsrI4HMVuvKalkrUEqjW+ic5hEWJ333hbJq35p3Q8mIHaKuAsXEGoxJ5FufinKiEHOqWD2RtV5wi987B6KuAtRfCDcdcJp5hFCsDttn6Fswpwh4ZkkFMUp5erTZ5y5T5Ug0oZL+qr331cYW+ArvUduYwD1gKQwAJA3wxxbjBeh9WQLXesCOHIQikVDDjNmYHKpqizC1/8A8tMpOiDOU3UaVkv09fccsIen84uaAYEc86OkPON6clvWSGacpUzXgd1KuesDylZWiq2DJFFEo8dUFO9Hl68CeozvJcltvHMlyoUZws50/XDI+W3pd/Bqz2CmDIqbwQbB36O1MZAy43e/izJfxorLWX5cMc94NgG1UnO/UJiinhcs0UJRnvjkJj4pyQMpC/kV0NUaeQUpVZUHUsyNbjO38TTJvrAVnlQW+pyTUK+etSVo5FP3oMB97kh+QoHPV9TkRy6tGA+TAmHRSKGXkVmhJBXMQ3HIkP72yN5F9OYFgOoGxS1R6x7wZYppcuMRBfYZ3lCERl7s/89KlXraTuL4HOeA/TzhHguAE2OlWW3o/WUf5/LqwBeVcK7SQZTR9LOf6GeCyVGJPLYKvCN3q1WXkzjv/KLQ8mIrw8+tWRFzLE8xGc32NwylpdKB3KHnTJh9ERounHnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(4326008)(8676002)(6666004)(6486002)(8936002)(7416002)(2906002)(186003)(5660300002)(2616005)(1076003)(86362001)(508600001)(26005)(6512007)(316002)(6506007)(52116002)(38350700002)(38100700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?buxSw9NqhwoSCcETGcCJbTi1Uy8SO+XW7qrXovuzrmCPtwYvT15zOYf7oFrV?=
 =?us-ascii?Q?tA6WczSrUbf56HmSkGfUNQNPBo5iuVqs/Krym2rmqsnsmOSbqStEBqAMspKg?=
 =?us-ascii?Q?sVokzsIqSeCuOfL0QoVOYeEzovWg48RYrDMowYZ6Cau0VU0S2krYy4AjGcmt?=
 =?us-ascii?Q?RueJXLTjqDyPqUUHjbuyiI+iwU0pMe5kZG0HA4T7/9werVj74ptqtWvSqAMp?=
 =?us-ascii?Q?UXzEI+vPFmqshiS+JvpLH2WASjJLfkC33hUjNixui8AfVzknLadah5772uml?=
 =?us-ascii?Q?gLWwWE4ZRG5BkNKfBBQTOIbg6D7mnR9/Ngs+2/xeAnWcYzZxDhpGURWupItS?=
 =?us-ascii?Q?k/whi+535wQLKFfJvGYiU3vaQpCnn4C6cHYSXy6Fvyf/0o9YTK88UO5BnVSz?=
 =?us-ascii?Q?WvvpI2pEvgwMTSpnf6DtopPfQ9uIxV5ljRYg66j9bOjmCYUA8Rg88wmYlRA6?=
 =?us-ascii?Q?Scvk1OOckn4voIR9+pctblq91RBKHttfLbiO8DYdQaWN9SbWWNyAzeGCpDMt?=
 =?us-ascii?Q?RJ0EeXb++YHziYprGp2en1Md62zJrCSjgQ18MEUdbKc8SWGW+in+UR3q8Yem?=
 =?us-ascii?Q?Qi278cDfU1UDIo0/ptuCvZDLuOOACLqsg7WAZyLcF6YIchLRBNqHCDZd6FvE?=
 =?us-ascii?Q?Hv9mFoYzErj6Fffu/zRmLBj3xnl9SRYmqFt/a54cRpVDeRZ5fKiH+7PEZ/rm?=
 =?us-ascii?Q?DLO+7zqUvA+6Iu0o/0rj/Hi8Cgxa89Vf9aNugs5qzAzZ3hawEXfXV8qglgrf?=
 =?us-ascii?Q?bA6IgRedP2YEGsMXlvjQwf+mFEFQcg4Td7I2a4mUNpfSDBuUJC1NrvYb3qzk?=
 =?us-ascii?Q?HN9m+CRcxtOzElDn/NatZG6VjmjijyL+hbhsAG1oVeKQJ2FBLHSuYbvpsG59?=
 =?us-ascii?Q?39S70tCb5JYVUmhXTsTpScy5JMr2dUmLn4oz6dYnGLI8j2dBWRyQIs7EeEih?=
 =?us-ascii?Q?dSYWR/sAgTL042yUCQrB9fNg3A+B0Okc6GcBNqnhatBwrX/nl+z1ldWfo7cs?=
 =?us-ascii?Q?3oYOShUfxP2byGEIZDXw4X7Abiyb7YNA5wL7uSqMbSAcrrnalbLE/0Q7HMr7?=
 =?us-ascii?Q?VAUyMHv20l9u6W1xDx7iWt8f1Jy06XsqyWv+qXRA0YBm1NGV+PCzpV2+S06S?=
 =?us-ascii?Q?7MBDNPJLstr7uUMghJCTa3gIdYjt9zB8Chp3rjSeE5PAWN0Tc+rShbS/mwjf?=
 =?us-ascii?Q?HrJ/2v88QO62tEyI8Gkr12CGXehJ+bH4ELJ7aAyaF/d11FmN72gpOopvPro/?=
 =?us-ascii?Q?luW1xLhRIf+IAYynTU3WyIXMTL1wZ8KJrMjd1KvxqyGwOQzUyx0WkcgK+6Ke?=
 =?us-ascii?Q?/LzwZOUmZV205NO7iJCjPZuGvRFbYFmMh5wkaLaY+FDGIdocrmMHlv0/NyIL?=
 =?us-ascii?Q?oosqHsvmAzGNGpZG5R1slnSkf7HJw1DtJ1j1O4eabkjPMGhUpwqPq9Bm2TwC?=
 =?us-ascii?Q?qaul/avZQtizRnzLriG/RH65uZ246g6YXp7Btp9nyRCVoxevtUs3t0zaVZo3?=
 =?us-ascii?Q?GvYO90jBtCUJt2BSPMRvdplr4XTr5kdyGbrZNTFx1jLZhkQ48Hd2aiBj0fPj?=
 =?us-ascii?Q?GmosBW9v3IvURGqXuOPy8q1mPDQWvJ92T19oHik15WmQlr3FKFMHnH05BQ06?=
 =?us-ascii?Q?jdd5nJsquBD+XFS5+8tM+lYUuYnhrZukxEjXT+MVuJ40CR7U7Lun57lTD0t4?=
 =?us-ascii?Q?QW9zRtPBwaEPoRKlH9iZ4Ifvibzt9woyFxkoKzecBYkP83PeKby3rkFX9YMk?=
 =?us-ascii?Q?gvhDiXlTYA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9acfc4-2831-41cd-9379-08da1de4ec4f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:03:48.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HcuT775ZzjvfOZNtDFKAnpvQrJ4AFPhWh+ghdyX9K6jkS/M8MoJg+VNd1gtSJBxb/mSoTNOhDiUBucD7tkDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

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


