Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C944C625C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 06:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280090.477970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKd-0005Hr-KA; Mon, 28 Feb 2022 05:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280090.477970; Mon, 28 Feb 2022 05:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOYKd-0005AI-CR; Mon, 28 Feb 2022 05:12:23 +0000
Received: by outflank-mailman (input) for mailman id 280090;
 Mon, 28 Feb 2022 00:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLaL=TL=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOTsu-0007Sm-8e
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 00:27:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ac9e04-982d-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 01:27:27 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6460.eurprd04.prod.outlook.com (2603:10a6:10:10f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 00:27:25 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 00:27:25 +0000
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
X-Inumbo-ID: 34ac9e04-982d-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCH+/SIbWCm2C9FOwOeomig7vCKzcsAQ6VIhYK2b9zhhrFO3/Bb1PICUl0arGYD/TeLUcW++7gGcVwBiA3Jy/aNnAiCGXHkmhM7qaSY60G6ZwYXTCLaeT3WFGCbJGusBbXm2Wvr8ar6n0ALDWEDatuOnFC6d9qxL+5lVuIk7dZ0xAkliarjaf1RTV5Qi7p+hAJpFa+uhVL433ugjGBYeaMETnWxrKH5RDB/ds9Fh8rf3cVPg0SU0Xjrb8uNRDEnmFhfQBRJEDG6kAE8Jo52aJKSLraQixJALC8KOfuftazcBudH+oQuRzGOZAwimYuP+cQhbt6Mk4OPAZ9Jy+YyPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsCR7rC+1KKOTplUp+q9rcVTXAyb/TEnoFHsWncVriA=;
 b=BgNBqjQlhlmHN9e1DrRznU27RVV0fCMo501/Ww+YjhsahoPpHDTSS/vMpXJk4szKQM0ovjZKBMq2PhBo3gSLwKkswJ8996QhIgX8I17vFD8S3ZlWtytvAz/6HS/4GhcZ7wGKjEZGmHMVtCbY+N8YG0FtSuOLxG3KJBjA/7wVPgH9zb0V+getUq2k90ZrQ/tLOJKNUWcQkrTCXv2/RYpsxEFeF5i2kXSjcZdx1FrUc4cgFYAYDl3CdjdBrPsgBw0Om3/WjFB0BOiBZjGqAedVXx7bLDvEx+70nEeGgMrd5j1jRnhtIQeQb0T3y5T/wXv98n7ALd6BV5Z1uqbg7KFMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsCR7rC+1KKOTplUp+q9rcVTXAyb/TEnoFHsWncVriA=;
 b=d0ENjTqy7lns4aX44kXF+NkZN4Y/zJAiPzv8VGvm7ifS5c5si2zm51gjZpq1nyCgqL/OPt2G7BAxcKvZa3z6m2UeQ579OsGsB+lJJ/YkNNC/mTtXpqWCNwRUd4Hd5nyJRCd+Pu6mhbXqNFRZPmX/zLPWJGH2Aq9hkF4YTSWbsu8=
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
Subject: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
Date: Mon, 28 Feb 2022 09:07:11 +0800
Message-Id: <20220228010711.11566-4-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9757529-61b1-49b3-2fae-08d9fa5117f6
X-MS-TrafficTypeDiagnostic: DB8PR04MB6460:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6460A7AA1938DBCB3C38FEB3C9019@DB8PR04MB6460.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1BJfX+UagmLtDP/RCLcKh+2jO8OfGZU1VG709rjFFd/LEvyG3t5bq6GA3cRRTu+Xv2H3BOdNzBtNN3A/f9LO/Bbkqkfr9aWb+PbC5Itbl9L8hUJDwK5iwp9leHwC5bndsJd3/HYJTHgFl6lGyb0A2HgDujl48AjtZuywbD/V5KWdrzx/D5x1fp9IFJdxAV6sIoMa1zIJeQB3aeQiyy2GU89SFV3ju263ag7TW88nJUuLhLZ5vPwFgUJspe7b8aqChgdSGR7vCK0hXSPZuDLkJyKNMw5n7B4eMZ6GeRDkL1L+lRoK50mdsOyczPqm5arByWpyOqRfe+7T0kk6m6D0rL7UH0aAvGQvBfCYczpCn7veGb1VArZ3UoyOc4BsGC6+k6m0JpbuW/Qyo0uctmU9E2oS/gXUYlesgaq3J8gtKq5FoEeYYsiNw4CC7Qi2boCUE68yuHn8MjBBcXEIxMcSZKOQJEcgMjFBBHgpiNvnP1S1XxmwLWHvNPNuj0l8QaHbVvOgnQ3KENzxLauMz0DMAiWvhzc5YUPN4wFGXAwQwiaJSX5ddxB+qPZBAWrpI3mKqb724l8yzU6IT0B3+67uDZa/kl6H3hJvtVuy5ry85Nhbix9g4kVkTHqUOUyH2OtWJSBZonQx4iLvSkR2aFNPGxbLphHMuX1j5mEk2bju0MrcQYeOnOK1kNQoy4/FSjQZFGzmsVHrf5mcYXpi7uJ0YVjaQMws4zGSeyfw6ujv2sU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(6512007)(6506007)(6666004)(316002)(4326008)(8676002)(52116002)(2906002)(2616005)(1076003)(86362001)(26005)(186003)(5660300002)(6486002)(38350700002)(38100700002)(8936002)(7416002)(508600001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F6pBc2KQYLUxP4OI/Flimarlv14niNUbJG2LAdw+BszRLawgaigdHmcFWADK?=
 =?us-ascii?Q?G+UmCGI3pMH4hfI53lsN15jKvVGf9HeEJLF0jBklGnlMLr8juyESjeOvC1rY?=
 =?us-ascii?Q?I57mEBS8OVuHeBw6etVlz9ivXPOZfkzKKPuOBiIRNWGAruzSl0NbdBBmTgwK?=
 =?us-ascii?Q?x5hoOR7Y+ExHuMWWL3Ws70hGWozsINjWzxs9Vghc1qqVGqTyv0Lv4YdfsrzT?=
 =?us-ascii?Q?rrofu0Tu1YZSgVgKG+CiZCb8z+/zLPRHwQi0NSHQGJw3squfxaBIJWdQPxSA?=
 =?us-ascii?Q?r8aHietJHmqbxdBfNNcZjQ5cvOF7/J6XCjNrINTvtHwH1kAxpzJeNAYm2J1q?=
 =?us-ascii?Q?N78/z/vcxH7gGJvXz2FJy3liODTDLoml21+Z/l6RcGAb/YRb3Np8e287EMxu?=
 =?us-ascii?Q?Iqdh3xsEteDf4IREFMkSW+63ZTH4Ue4k1hQiGEjwyKcRnVO8r/0ywTyyEmLt?=
 =?us-ascii?Q?Iw4lz+geuqHfD4Vz209T7K0gNeybMKkhVALlCx7J24t4CPYpJGln8Y8fmY0b?=
 =?us-ascii?Q?Yj8N8+9RVf4F5WZ4yUjQp5NPDnNonqGy+cDZPdGXsRXD6Pw32wGB23NKnCbw?=
 =?us-ascii?Q?nYM/ND/MoYBuNfIZHOHg0shOdHlYSQcBtb3/p1es4xletNiXburmt2seS9G9?=
 =?us-ascii?Q?Wd/1uuk+4lqZLoJJH+mpnzgt/Otutyi+rwOC0uEXF3lAUgxHjXk/lQ0eqsTo?=
 =?us-ascii?Q?Fz+6CDKJrXfhxWdtafk+2vC6J5Bek7Vg8lo/hdatpKdosloh2DrcvMmvUx7u?=
 =?us-ascii?Q?INt0rdbPtucyGXoQe3iHBFIxftx0Im10qlaSlgGnx5dgt64rZZmJULNDCVz5?=
 =?us-ascii?Q?7evrbn3IWhGyEirxPAF83uiW6dtbDJ7/qiTl7ozL2amcOUVBUaFaDCkGPCcs?=
 =?us-ascii?Q?BUwtrLyGOcLy+zIJFD+Chss+SnZfObr3wiXUtViM36f7Z5pEtFi/aegXP1om?=
 =?us-ascii?Q?R+WHHFYgBQ7qVufUgn0pGaADfdZfumvL2QnQ1DFmywIgEo+sPmHHqnjOwudR?=
 =?us-ascii?Q?kA7JaFvVKyHH4a5m6BaQyO8Knv9NeXAb/qWf5x76uqQbhC2GBPVXytZaBfw3?=
 =?us-ascii?Q?3ZZS7Ibj7DqAR/cLWLY0X0vKx2Ae0iuzKuZkzPYTq1zyDkJQBENLq5D+sQNq?=
 =?us-ascii?Q?8/NUDD6wzZh/KTuvon9Tp/l32OInONqD6BR8qhHrPOqnUSv88y1rKKSEIs7i?=
 =?us-ascii?Q?tW3lJeqOKzwAoRJMgMBBAdDraHozggiAHbpYFSxClkepyZ3ZEvaFT3kGQnWJ?=
 =?us-ascii?Q?3+nWJ3KQ4f+cDCMe5vZ9dqKh3rz4XJSOGX9VrFZg1DgUqn1kPvtAnC3CWwtm?=
 =?us-ascii?Q?V2gMjcT2lppNpAjZggnfa5iD8fEKLMnROyRQJzvt0R55obIGgB+ULHR7stY/?=
 =?us-ascii?Q?8Qm6a7Q54oh3ku/cqAmDGDpZtmKiKVaEd9NjUiC/RPvxqgn7vr3gbRGv36zE?=
 =?us-ascii?Q?Cv0/OUvxONXzb5C7FJw/W/G62utHQrDgYlq/h7Ee7zposKXci7ceR69RNz9G?=
 =?us-ascii?Q?8ug+ei9M+xOsuqJW4fg227ImYPOU2+fSzMVHuAepbq7lRSYViqTsuKb3CBbx?=
 =?us-ascii?Q?28yYG3YmLEyMhV0f/GZBPPqVsI3xn1Wuq0kyanf9io6vkGSCF03W/YwuFlQW?=
 =?us-ascii?Q?VSIW4KduX+/ytcZDGP1JRB8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9757529-61b1-49b3-2fae-08d9fa5117f6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:27:25.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk/OkScjFGK3h+yhfESsntwx6yW3qKpMRqT54zyJt38rF6Lk4vHSQnYD7U43n3qj3R081hZhC5kxHD4KuPLhIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6460

From: Peng Fan <peng.fan@nxp.com>

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 xen/arch/arm/Kconfig.debug      |  3 +++
 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/imx8qm.c | 44 +++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 9ecb446b3a..43ccd8fe62 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -143,6 +143,9 @@ choice
 	config EARLY_PRINTK_HIKEY960
 		bool "Early printk with pl011 with Hikey 960"
 		select EARLY_UART_PL011
+	config EARLY_PRINTK_IMX8QM
+		bool "Early printk with i.MX LPUART with i.MX8QM"
+		select EARLY_UART_IMX_LPUART
 	config EARLY_PRINTK_JUNO
 		bool "Early printk with pl011 on Juno platform"
 		select EARLY_UART_PL011
diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
index 8632f4115f..bec6e55d1f 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
 obj-$(CONFIG_ALL64_PLAT) += thunderx.o
 obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
 obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
+obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
new file mode 100644
index 0000000000..289c18e5f9
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -0,0 +1,44 @@
+/*
+ * xen/arch/arm/platforms/imx8qm.c
+ *
+ * i.MX 8QM setup
+ *
+ * Copyright 2022 NXP
+ *
+ * Peng Fan <peng.fan@nxp.com>
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
+#include <xen/delay.h>
+#include <xen/mm.h>
+#include <xen/vmap.h>
+#include <asm/io.h>
+#include <asm/platform.h>
+
+static const char * const imx8qm_dt_compat[] __initconst =
+{
+    "fsl,imx8qm",
+    NULL
+};
+
+PLATFORM_START(imx8qm, "i.MX 8")
+    .compatible = imx8qm_dt_compat,
+PLATFORM_END
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


