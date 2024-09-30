Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3298A10B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807255.1218626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsQ-0001WD-7W; Mon, 30 Sep 2024 11:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807255.1218626; Mon, 30 Sep 2024 11:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsQ-0001TB-3J; Mon, 30 Sep 2024 11:47:42 +0000
Received: by outflank-mailman (input) for mailman id 807255;
 Mon, 30 Sep 2024 11:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsO-0001MH-Lx
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cacf8c2f-7f21-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:47:38 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:36 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:36 +0000
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
X-Inumbo-ID: cacf8c2f-7f21-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1sBmOKJkp9yq3cPjJmOCtZURxJLsGYbYnWja8fNdCOfyFLKD1w/ixTiX/Io00GOZjcu6mKl5DQPUTQFhJQ4bKVlnN4nW5MQ+2rH6FwQURsBFZ0yhrTWZ43j5GIy3Dh7010Egg9zW+u84PjcCVreJluvgzZYbkZQ3VWf6Za2pASKHMM3RMASkcRYUvJBOhVp5M57EXneFFwU9PwEptkDUor/HikKM1NlsC9JQyEBMoqdEleRtF68pXbuPKh1Wa7zRh7mG/ti35p5h8nl6ZvEEOrx6nZcs05EHjV4qFk3cVsr60LAVNRUUZBnfjdHWaqt+W3i9Xwn1Ku9BO/4LhWG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX/sA+HbyjLIrbQJLtP2qYPtkhD5N253XrdmtBbQxPg=;
 b=IZ0PvksUZp7j1xOmGJymXfK7eRJggyh+PRJQQfNiYt2XWahJFDJIY5wQXEiO3xDGODekTwhJU2bmCpLWXHb9auU3tYgtamNCK/6L3t2wY4MO0wr0kY4vTWuMu4ZNZtNM3gshkOR6yG63U/5qenIrQfu8tWAYabwQ/RjAs+HC+yP7ijcauSvX7rdSVtPmY2iobAJDykEVzbFsLNcQ9Bd3r+otdVekfhvmezESdRW6OWlR4dLWFrTa8cYc/UAS4iCjZ4aGKbt8aefuk93bhdvI2xmrD0t7vvPUoGlDdiwPoGOFkpi+N/+D8g2GmYOkwMvft2QMyCny6lWbtUSEH3F6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX/sA+HbyjLIrbQJLtP2qYPtkhD5N253XrdmtBbQxPg=;
 b=fbiZ7E3QakNJBW45SoL+lrEI7Hl/dYZw3FdSQZ+5FPO1FNfydWIfZL4PHtGTJMj1Hn0vc/w4BjnTtJ7PwhFzVVkz4cd1BgzC7McFOWo7JupJiD+T72UqmHDajn3VxnCrQFtKBOOpnueXsOMJbzGqV1oO5OBwi0pyZ7spPaCu5n7KayhcT0G2FXgcUlQWMgxRqGMU9CxeAfSE747vkAmjng3GZ/9ccfaE/RQwINWMXUo3mi6mM0CWTjx0aZGDtYKkLbklQcG4aipo8dwdsQJrK2kz0vT8Q9Rbq36fh6LT0WrIz8zIOGZqhQWZ0CHz4kgzUKTVyOIowEvexL7MPpp1cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	s32@nxp.com
Subject: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
Date: Mon, 30 Sep 2024 14:47:11 +0300
Message-ID: <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 98730b9b-71fb-4a3c-42ef-08dce145ad66
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E3g0GugfsiPtud6qW82PHGgoVx35DcM01XVdp3WErxzJtAtkz60Hn99+oE1n?=
 =?us-ascii?Q?wTv6xpj53ezyj1JNTtHGvfULr9dH9+V673XDrBmlZGELpD8piRJgZIp5aUUH?=
 =?us-ascii?Q?0+nLJF5Hdf0RyFQwDm9/XaNm+IJaTEKXPflVP2M3fzdq2hKQkBS8th0IQyQ1?=
 =?us-ascii?Q?7BhN7bIuMXNchvJ2bhWYpAap8+0SwSF/3qqXqOIsQvVNQFuczH8igrK2oufW?=
 =?us-ascii?Q?A0hao5u495WVqrnS7rQLmkc7R2Zi0QY3GK/E9HqIamkQKIjZJv2km1CWGnbD?=
 =?us-ascii?Q?e401v/VhU+5Vqol96IokQTJAsa/nPzM7aSE+gVjAMhBjfAmPn1ec9PQg6zt1?=
 =?us-ascii?Q?hBQmT/rjFyLAZTFzwcOG3OBWvx969fD5PExcdxFGzAbav4HaT+w8gzgvoAyN?=
 =?us-ascii?Q?Vz6hiqVcLEVk+liYd6UxFvf+0XmAxQkz/QvNuyBH1e9iR5mpg9bV0wEHyti9?=
 =?us-ascii?Q?wD+2TYxwNgc/7GZATT/sY3oVlmkKjdis0Xm7L8qEd14dQ3yzg/nLDg1jjSyI?=
 =?us-ascii?Q?sjg2Hkn1E3tqThsv3PDX4Q6jGqI5r5s9zxfF9j5a1jQNtX63fDJT8SLk1pzr?=
 =?us-ascii?Q?ORCQ05MrnxqI9zjaSSxRn7ZCbowS5OxwPIknhE9RKm3I9w59iVW9J9l56XEg?=
 =?us-ascii?Q?nEcArfsWUgmgUgxEAurLfwrZw6NGBpHBiKR1DL1MxlWQR2neN3gNKSzXhK5r?=
 =?us-ascii?Q?IU95FcBKC2a8zQSL8/XCVUJC+B5NBT5B+Tv1BT85SBYu0hi2rlpVsLA82kaL?=
 =?us-ascii?Q?UF2cgbLsHHpIUQKOXxdxjhjNPWGdxQ+F2kayAQMRuoavfdKNjwfxh6ES3wZ3?=
 =?us-ascii?Q?r690mlhdblIs6rEXCoJowX6Gd0W27r+/PQVnAzLSUmRUvJvSMylxMT6VJUuq?=
 =?us-ascii?Q?gYX3p600OdKdPZeVFvt/MQZBsOevm+i8Ahz+bFLMES9xhv1iYDyoyj+/ecTC?=
 =?us-ascii?Q?pi6fI2XM2I57fHt80kinwypLN3jOSLCX7KgcebJv1qyKckPRFuR1DT6u4RZu?=
 =?us-ascii?Q?tvGo/LhHJq1Fzq0PUNRtbfaQ4cdzp9+Ay7+990qFPjwP8Fzv2UwiLMXjT/Zt?=
 =?us-ascii?Q?E/YJzc/oa9vTEfrE3GxxHbJhbqSFcc/lPCIObsL/CubHiiqJ7zA0J562It/b?=
 =?us-ascii?Q?Lzrqn/Z3HcPlUJYygcA1PmzSu3qGXWY29zYD3xeaz4ODaJYDyYEvXAz2Pe/M?=
 =?us-ascii?Q?ioBUnrGa9Tf2Ql5wxizAhuO7hMM+hdd+YKeJKHgJzWBWAxERUyOQL7ABf66+?=
 =?us-ascii?Q?fHiIulHTMZtCyrPZmqmosrhob6WlEagL824eKnyfEw2+9ocZOEB3QL4qnUwG?=
 =?us-ascii?Q?NIvfWhLNximVOw/POLcXUkTCbOXhM2mxnFtiWY+iFlKE1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MNdGevpOQHc65sCY8SzNnD8emq0+WCCb2by23UXm688n3+AglKXpA7GYa5/V?=
 =?us-ascii?Q?rI+/H5x22WuE0M1TpMr2E+92W3FUINucSG7D5IbA6m9lnSDohv6IXu7WLJ6V?=
 =?us-ascii?Q?beFAqfl47yLiknoMMJQjVRrOrI9ZQQGVv8J/twv0Ys3Vmn5Vz8o0ilJM6KVK?=
 =?us-ascii?Q?m5WBngnKW8h+ISegBEmMXTImqWLsdYST0k7Kt+ONG+eEJTZUV1AUmzKPlCMz?=
 =?us-ascii?Q?coKoPAUcam9Ho1areHlagkDf93QIbD+XEqpPFsplE3YIzZNqLxgVtjNBjgZz?=
 =?us-ascii?Q?NDRiB4dgMLSreDPeQgsgHmOIOfCQs5dcFtyCeDnWO2LSqMDSnoQinYcoFcAC?=
 =?us-ascii?Q?qdRAHMnZnipfnSuutiw3iFYU5N6bx13JJGaa1rV7zFwpPZlDCKJ6OhrCjPaV?=
 =?us-ascii?Q?AXbvSuCUEKe0huN0TrWVNi8RQMI2arNSlnrcZWjHTXpK5mPgnhl1/MqyoGkH?=
 =?us-ascii?Q?aYvjHgon1Is1Ji2nNz3vKZWyMrZrzSLSs+4p5uqJimRjpz9s05Dl+QaV3Ia/?=
 =?us-ascii?Q?vktDMqlIoo7mdn5LHf26dYjtyKmzGohF9BhrJEWzphRJBpXFPOFhzWVTCSpD?=
 =?us-ascii?Q?/lO1G2HHWSrV4EzXklMZFz/NlybLYj0mUIgdzvs9v6ujq+iyUXz/dOWVembK?=
 =?us-ascii?Q?pFTP1dEufpnnLzQtVaoN592hvqpMmvxS6qvD8yBkTRnVTGl8RlGEni79jjpH?=
 =?us-ascii?Q?NnysZnybJaTdNPZ/3OHlsQ0JOUGRPiDxqyrqZp7Epnt1b3xSD4mSF1GcS4lf?=
 =?us-ascii?Q?c+bWpWlrQtr3SOLqds3QuW8MVwhjhi9HuEoZPQF1+GmOSl24/Xxuz1+qOEy/?=
 =?us-ascii?Q?WS785XJWwmBJ19Qku7LVWcUNr1UqpjdByVdNWev8SIqFzaj6IaeXjb0SjdnT?=
 =?us-ascii?Q?mGOSObyciL+tp3JhirL1HSAT3DlWwlUobRkS2G32MhtyXfIXz/woc8ZlRayr?=
 =?us-ascii?Q?EkBQbb4SqCPUG/uxMfft5HMGD32LE5cmsVRhPfBuDVokwp+uKNiyEhm/zJYz?=
 =?us-ascii?Q?8fXbbKHiwIeplS2tzSe1RrN1Ka7tE/MLs4ysBt4GPdF5nT/C6VQ5UG2eCjB/?=
 =?us-ascii?Q?C3jHARhdErOdY+GF+0Yybh564ruduUK6e9mXm5xNJVEtO4FSNNYIA9pFrw12?=
 =?us-ascii?Q?tHvdB5rkMQHLutGaT3mWU1mS9n8ypSmZbEQ6Splk10ym+mklT276tPrwToSu?=
 =?us-ascii?Q?3NqPBHyz9xCPEtFHe/UwSeecfAuSh76SUmRZ7Gx6gQTwMeNPe3kgTisZ71+k?=
 =?us-ascii?Q?4HznPlwVl6XrfTlgHa43ApAPIxr5J/hgLrhV3BkOwe02EscerHUpZf7GeNCX?=
 =?us-ascii?Q?kDXGVEY5hM0XC18wKydZ0l9P3TNinv3SmU8MSDcd2Ys1HpsWjt67Xntb6b9m?=
 =?us-ascii?Q?+sBzMgqJZqB7tExW6hYel6lQ51Umz8H9j6Gjwbtd43CDnvujGK8F3YhQfKQO?=
 =?us-ascii?Q?l1HG42iuQ5t1xHIl9bH/tpt+H45gW9xcmic9s32Ic04mrvBw2awwNzPEgVeL?=
 =?us-ascii?Q?X75Ehn7xdyHjPhDBDL98UymqdwtmYPMfCfCjf27+XfY7tm4OP4GzCczFzz5C?=
 =?us-ascii?Q?75FVBf9C+m1IyFTeSEGH1xjmlWPyxWusWZpp/Posda4VM4OE30lw+rA3p5vk?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98730b9b-71fb-4a3c-42ef-08dce145ad66
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:35.9870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMz2Ga6/eY4McP1BLH+ShRxpd8HidvSLgTzqTk/EXe6zH729eU6J7qMajvcvbvjSAqmweP5OrveJgUwwYohUcWmEALTN48o72z7FGuQJ2vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).

S32CC platforms use the NXP LINFlexD UART driver for
console by default, and rely on Dom0 having access to
SCMI services for system-level resources from firmware
at EL3.

Platform-related quirks will be addressed in following
commits.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/platforms/Kconfig  | 11 +++++++++++
 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/s32cc.c  | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 xen/arch/arm/platforms/s32cc.c

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 76f7e76b1b..9837cba475 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -37,6 +37,14 @@ config MPSOC
 	help
 	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
+config S32CC
+	bool "NXP S32CC platforms support"
+	depends on ARM_64
+	select HAS_LINFLEX
+	select SCMI_SMC
+	help
+	Enable all the required drivers for NXP S32CC platforms
+
 config NO_PLAT
 	bool "No Platforms"
 	help
@@ -56,3 +64,6 @@ config MPSOC_PLATFORM
 	bool
 	default (ALL64_PLAT || MPSOC)
 
+config S32CC_PLATFORM
+	bool
+	default (ALL64_PLAT || S32CC)
diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
index bec6e55d1f..2c304b964d 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
 obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
 obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
 obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
+obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
new file mode 100644
index 0000000000..f99a2d56f6
--- /dev/null
+++ b/xen/arch/arm/platforms/s32cc.c
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/platforms/s32cc.c
+ *
+ * NXP S32CC Platform-specific settings
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2021-2024 NXP
+ */
+
+#include <asm/platform.h>
+
+static const char * const s32cc_dt_compat[] __initconst =
+{
+    "nxp,s32g2",
+    "nxp,s32g3",
+    "nxp,s32r45",
+    NULL
+};
+
+PLATFORM_START(s32cc, "NXP S32CC")
+    .compatible = s32cc_dt_compat,
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
2.45.2


