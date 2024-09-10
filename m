Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21B9739F5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795662.1205103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x3-0006NH-IT; Tue, 10 Sep 2024 14:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795662.1205103; Tue, 10 Sep 2024 14:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x3-0006JK-Bu; Tue, 10 Sep 2024 14:34:41 +0000
Received: by outflank-mailman (input) for mailman id 795662;
 Tue, 10 Sep 2024 14:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1x1-0005Zc-Gk
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:39 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf36beb3-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:39 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:35 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:35 +0000
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
X-Inumbo-ID: cf36beb3-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO251wMBeWLkzcCRggdyuujYWrkjy0amFW7uq+k8tXPfI6SPFggrNG44qzUm2IDGx7zzikYTsImhAGLNh4oXp3aYyE5M3WI4cAx/5zMpKLTTY8vn3oaLbjL4KeVRmRyhCnvgIyUaglxEI+hLp34wNsA77EqLCdJIkV6FGU5CWUfSS5HHGdDgROryGqARfOi+AygrKAZQSrBJankeAklA+mMUfdeCs3hXAkhtDJA/Cico5xq2l1Gbbu8/GA/wG/0sAoR6CTPBHabT74Oc1Ebkweq0xOnkedi3s4uEI0x9HjsBWla9m9YDZZ1YmrPzXLEeEthmB4CVKSuODlNxPqtE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGTvpIjC5yVY9HJ0bwIdbvg/tBZ9aB2AiZcW53g9RhM=;
 b=G7C2YwW8GVbgBViWAml7FN6eoAjE2YKA06J9L4ft6UM4wKhwxC9NucW2la70HMx+TyQKyJ5RJHguA3Y1rfNbigh2dtT8pPyZQGp5bbbHkClsHufc2ocFeMBrVdtuNrg4l1D3YN7XegmnIcHcAdi5QK9+4reDkuCzDbZiQ27ZLL5kTEtbTIa7mXb9zrfeTtuNVXAyG6zc4pmO6K0PXA5rVFVqCx/MNfdCzwLNFEkk/eYTRrz8oCTuMa0KAeuToVMzTFxWcbeYaENw5c+1WMWOM++t1xtw8uRFub1zhKRQZ1LBbrCj4sK9RMgvdb0TSHH8YkFYXun/DhE5Y+y2dzSYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGTvpIjC5yVY9HJ0bwIdbvg/tBZ9aB2AiZcW53g9RhM=;
 b=xqFZSQyClJ4rTfQdMq5THM8XfFMPci3sbab5QBShXERhlpeGOgsmfsVE9FSfv0fM86uT/MLYUceDOm4wtdIYkT7KwnGKSKVIHscepGEO8okoIVAlE9Qo3vQe/198jc/aYnzlmOAEliDO7PswxYKUuIOROZPG/rNGW4MgD3t7HYVQGSqnDllnTgLTXSH0smWa82puz2f8yN5RfKAQJ6tTcmIVd3WhIRmrppKg83/fZyUmGtu76VOZyV1EKUeNqpl5c1oUVHlfjyr6Eg7jKIQ+6DyKfKI1ywP9SzFRjAYH+xEuZPYUb5hkGx1HuLCSl+jEKVa3r/osSJYasAGrBsw29w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
Date: Tue, 10 Sep 2024 17:34:09 +0300
Message-ID: <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 34872067-0a8e-466f-f85e-08dcd1a5b162
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zPW07mpv7OdAZl+MGO4t8NUe9G1tqg4C79gIbAWxm3XAoyt/6dgBViX7y0tB?=
 =?us-ascii?Q?4PKhMwmbxc5fd2eXJlsKQubnJMzLMtcyTQf/hvWHDv7KEsZLHyGdP2LDisQF?=
 =?us-ascii?Q?kEYFSJdesV2YEYjCF4XbVtR6q6eR5b8eoQh1DfN6yloKjexbF/+Wd53qbvOE?=
 =?us-ascii?Q?gjmDdK07d61zzAKQdM8U7NZUIo7YMclgLZGDI//MhYqq9Cgn5vilvlyyJ4Cw?=
 =?us-ascii?Q?cS8inOnirhgcNQaO8cu4EPFOIIdirKhMy9viP3PhT5Nfzz6jVqeLQBWRLk23?=
 =?us-ascii?Q?ASld8FcUDgf0DvBNhF6KvERAXkfEmdza5mUGN8F8+ZT6/CAQKczDwzmTKSKd?=
 =?us-ascii?Q?3DZED7s2in2oGJQ08KHntfG5e83+RZ7gDT9XuBIK33zAsGDC4tjvgNQZGTsZ?=
 =?us-ascii?Q?A4+JGBT4OpsDNdizOWzVyMHMVLwbbMgtu8mclCFPh0Ja7OcKqBdsXLE56C/Y?=
 =?us-ascii?Q?lgFBifq50MMTLxSwy3GYdiA1Iw5LzCidblXDUY6e44C/6H0k4OLguqvnwYiH?=
 =?us-ascii?Q?FOdPzLTtxHitlr+RRSVOEqojNLvFzmhI3jUT+cCSY3rm5+i/w3SGf69LSF2N?=
 =?us-ascii?Q?TG6nMLCK4QWKAFW2is2qG6+JNVA7BZEiUvYFVb/4GaiP4pTWGlDxU2KZhz14?=
 =?us-ascii?Q?K2kIrhS11Ojv3qATh9CvjVvCgFDxGjL5EhEvG4ZqzPllUrgWhVYj9/uDcpGB?=
 =?us-ascii?Q?YKYkVLV8y8D4n+kpIXX/mKXW4sEmqwcmbAo6j7eK9ISfwSzy1SfPY1mTpmyj?=
 =?us-ascii?Q?mnM29fRWyZTco/G8/OfgKszKt/XIxvSasKybASXztdYOoow1YmQaY2a9yABD?=
 =?us-ascii?Q?6+VsC9ZviRVCv2ld712pZ9Z90PcgkRZX/d5eSuXwbDY2l505CUN8TzBxusiZ?=
 =?us-ascii?Q?tBy4pcrJYMzEBy6B6ktNrXwzmp8Tfj6KZSU4L6V/ZC/qSL0rmf4QbhYu49bU?=
 =?us-ascii?Q?4U2wLeDSsivvThZhMDXWW84UEFz2eeB6yU4HErDw1oJS61TCCcb0oQoaXXlL?=
 =?us-ascii?Q?R6kp2bSlxqw4nCJ8RdJ/YdyvRZEKWstJSd6pNOFMTrc3/snHDSk0VyqKEokM?=
 =?us-ascii?Q?dtwlPM/kbTqWCeGrocBZ0/qFGaqBJS0ImdjKeaqSOFAIsIq+LDNXVVmsyVu4?=
 =?us-ascii?Q?CcmbRYP6L3zMNnObUvY0z78k/wRLI+iDdInaByxI/x0SzsVIGTrd7iVcdI9r?=
 =?us-ascii?Q?0mkMy8SRbAZLw/Xba4LUOomvVfHByltNNhREk+OArkVn8fVpXTUgvauIAM7D?=
 =?us-ascii?Q?Ed362XObTb1rrPVyPTtNprSKt3IEYZr2WWIxGO89eCM5Sdy3Hhv1s/SMzbbd?=
 =?us-ascii?Q?Y8uCSidQyu+uPP4TqkKYCkqMkqkMg8+TmngOP9AvRhzCOLTznekeZd7Cn/vt?=
 =?us-ascii?Q?lBogq02RVKYoPMpjrjvFqz2foI4pEJE6XDGSZ18wD4FFll2QWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bqjY0pLmqXZgYIvvCmTnzfvPv1KzKj73V6eRwl/5DQucWYiSH70pkXVYnbl2?=
 =?us-ascii?Q?JBb+eZ8D0ibCsb8kL3ExCEb1AAhwkKBMUZe/sSvWPRFs8CBrpvnQbSQD4Rtf?=
 =?us-ascii?Q?6AjgQrd6fYh88Cd1zRb412AjvilS8qSU/b6IMBj5qgx8xPh18hJJRRkWRJt8?=
 =?us-ascii?Q?Pa1ZPd5ha1jNHLsZdeYvQw0Myc4Cr85oTA0hx6FARH7+JoP99QnPTdusIKhP?=
 =?us-ascii?Q?Hs+J05rOL+XIYNK0/vuhxa2y2MTttxYeZ2eeZQ69jNQK+rlh+dqbyaWGCOBa?=
 =?us-ascii?Q?I9wyFFao4mQvpdgAue6TBnh/bO9nKKwZVZ9Qw2+V0KzNSCnZg4g6ZIu2LyaI?=
 =?us-ascii?Q?i06y8g96QY5yS7QZ8jedGsnltDDQlC3huQhejVWdz8C9iHu6C5N+vpuw+q1H?=
 =?us-ascii?Q?e9QBND4gLu49gqCRAJcnoDag+miscxnx9Gai+uVEw+ciuEjzRfg8lrPzhVdX?=
 =?us-ascii?Q?FsH+PmkIaJ0sJHGFuOfl/a66CDDViZRDtvtCXMsEWT4euspuSz8t/Imui/o3?=
 =?us-ascii?Q?S6owqXSvcERFBfloHtK3ITIHSyoTTRaUDnMZAnYWYbGBV0FdDzMsPOlGMvTy?=
 =?us-ascii?Q?59MCg+Zv0/JEjRpP7WXDEGoC67IBQr/+GvIv1WuOm6LUgFRbCdGe4W00zoLO?=
 =?us-ascii?Q?cj5UtBpROdvHLMPoEMQ4ub24LxWbiIhvT4lcFzM9lL9L9owEQPFsiGbH032+?=
 =?us-ascii?Q?K/VVNELqdMwCkmt4tIImrbulqbjN0gQIJ9FyhMUwoIGqxAMiYsFs/kctQN2C?=
 =?us-ascii?Q?eJl6fCghMJfC5crZFEoNulMGNHORWWB688WiNpcavfMoI2bTuPPPBUOO3aoA?=
 =?us-ascii?Q?32Kg7bTyDsddwS2UABBNaK8QyfVqW0miLQtGWrYrMrSp+CAyCGfGe0+Y16um?=
 =?us-ascii?Q?Ll8fU/ZRCnHeg42AXKzVc1wh2mPf8Nd5jqyQdcvT55PVmk281h6Q/J0ihRnc?=
 =?us-ascii?Q?kj3kT6gDoR3mA98+wei5u7Gox491YA68VoIGlRrJfu7E0joABnunIUcR71Wh?=
 =?us-ascii?Q?NSS0a0Gtd+Gy2bN+pLS0FiA+QM3wtQgMrliIqRjttBjnRpFxcn194yqU88gJ?=
 =?us-ascii?Q?9Zm2hEWSKP3Khpj1OsRzLJzTU0vMifBSB3JJr7uOK+TGzaFJ1qUsm12VLDiR?=
 =?us-ascii?Q?AE3AGQYARzPFdhZqRmFyns83BEL82g1tUwJdHB+ysWwTwj9KArNivGA8BOIL?=
 =?us-ascii?Q?BbvBTTu/KiVMYG09dekNdO5ABUcjSFlFueHAIzq01zzNDPjLj3IV8iAmQufL?=
 =?us-ascii?Q?F8VAJdHKpNAX9gCzX4tB9IxVdGc/rhRT2U6uqXilJLAyx0qCi2Jg5q1kL75K?=
 =?us-ascii?Q?Cl/WCpG2uJab/BbByWpR1Gtt+evgzijU4O5UwIGhHWtUIpziHLInasmayyup?=
 =?us-ascii?Q?/lReoRBegumslID9Stwc3inJJx0p7V25Ie7bVuOz34S7Roi90EjE6lgIbL2a?=
 =?us-ascii?Q?appvluJGwJtDUh6/bHvizA9Bf/lAJiuRCLe6vGMzwyMES5OJNIZOfGoKvNl6?=
 =?us-ascii?Q?JBlTZu6UwyQSdagzf/zZuzOG0rzcQvPBpkeoHwOMboMy3ziKGGEwafth9AWL?=
 =?us-ascii?Q?uK6Y681WRKoU2Rr/s317DtDEKA4NPCGf2c7NwW9LFZd89gP3ih3ydvbgJZ+T?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34872067-0a8e-466f-f85e-08dcd1a5b162
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:35.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1eM/BrgorFxHumoMcqPv51BOsNjbeOPYRGt7pNE1IjiIgxRqUtVpjn5etg/XfX8mlXHVkw9TM0XILWOpClPEzNV3KFzRQxe+iKUpdriTFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
which need SCMI over SMC calls forwarded to the firmware
running at EL3 (TF-A). Linux relies on the SCMI Platform
for system services such as clocking, reset, etc.

S32CC platforms use the NXP LINFlexD UART driver for
console by default.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/platforms/Kconfig  | 10 ++++
 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/s32cc.c  | 84 +++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 xen/arch/arm/platforms/s32cc.c

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 76f7e76b1b..310b35122a 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -37,6 +37,13 @@ config MPSOC
 	help
 	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
+config S32CC
+	bool "NXP S32CC platforms support"
+	depends on ARM_64
+	select HAS_LINFLEX
+	help
+	Enable all the required drivers for NXP S32CC platforms
+
 config NO_PLAT
 	bool "No Platforms"
 	help
@@ -56,3 +63,6 @@ config MPSOC_PLATFORM
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
index 0000000000..f262673b09
--- /dev/null
+++ b/xen/arch/arm/platforms/s32cc.c
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+#include <asm/regs.h>
+#include <asm/smccc.h>
+
+#define S32CC_SMC_SCMI_FN   0xFE
+#define S32CC_SMCCC_FID(fn) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
+                                               ARM_SMCCC_CONV_64,   \
+                                               ARM_SMCCC_OWNER_SIP, \
+                                               fn)
+
+static bool s32cc_smc(struct cpu_user_regs *regs)
+{
+    struct arm_smccc_res res;
+    uint32_t fid = get_user_reg(regs, 0);
+
+    /* Check for SMCCC 1.1 availability */
+    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
+    {
+        printk_once(XENLOG_WARNING
+                    "S32CC: No SMCCC 1.1 support, disabling fw calls.");
+        return false;
+    }
+
+    switch ( fid )
+    {
+    /* SCMI */
+    case S32CC_SMCCC_FID(S32CC_SMC_SCMI_FN):
+        goto forward_to_fw;
+
+    default:
+        printk_once(XENLOG_WARNING "S32CC: Unhandled SMC call: %u\n", fid);
+        return false;
+    }
+
+forward_to_fw:
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &res);
+
+    set_user_reg(regs, 0, res.a0);
+    set_user_reg(regs, 1, res.a1);
+    set_user_reg(regs, 2, res.a2);
+    set_user_reg(regs, 3, res.a3);
+
+    return true;
+}
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
+    .smc = s32cc_smc,
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
\ No newline at end of file
-- 
2.45.2


