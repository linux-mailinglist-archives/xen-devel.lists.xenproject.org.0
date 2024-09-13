Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF119778B7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 08:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797935.1207999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sozbF-0002F8-PV; Fri, 13 Sep 2024 06:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797935.1207999; Fri, 13 Sep 2024 06:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sozbF-0002Cc-Mc; Fri, 13 Sep 2024 06:16:09 +0000
Received: by outflank-mailman (input) for mailman id 797935;
 Fri, 13 Sep 2024 06:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwZy=QL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sozbD-0002CW-Dn
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 06:16:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a673b416-7197-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 08:16:03 +0200 (CEST)
Received: from DM6PR02CA0168.namprd02.prod.outlook.com (2603:10b6:5:332::35)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 06:15:58 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::7c) by DM6PR02CA0168.outlook.office365.com
 (2603:10b6:5:332::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Fri, 13 Sep 2024 06:15:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 06:15:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 01:15:56 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 13 Sep 2024 01:15:55 -0500
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
X-Inumbo-ID: a673b416-7197-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGCHCYQJPUPEih2LYqjl3VwJqR8yAOKRtHQKwPMnaieDG8wSUGauhPuNF9F7tQtnDu5KUTwHO4yNGvOlyr19cj7hTYnhbJ1j4Skw3PwVXhjyh9pI8eUByHUjLSba7I5bY0dIe1mN/txAzg8GwgRi45XIGlXm+BCQ91hixk1so9pMAaGi5hPzJuxtpmBB6lNH6td3VJDnHeJsLgwrMQNBq1K0/bOdytuZa0Kl26EkKZt6T5gY8EBo8OE12vvcS1LoAE204pzzdWZPz52AIUNi4SGmIJWQHtycq6/rHXI5Z/OGablAVERuUDVajy8UVoXPXnzozswzdMkiwNzkr1noqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/42H29EItYBgcmXVbbAipTPaS2qi5aEzwaFimWyQKs=;
 b=hxa2+HHBqeFtm4e9knqrNFAB5ND6tvKOMEoWII0gxLEJO4XOVq3Eg5xdKaJeB0LQhimyBV19YpqwUss30uWLrozMsSDA5XscOJroNqu+ZzKFreMhio7v50aXorCSVmE4cJF7LO6lZ6LEBp6E78FBhV4+yZC9jzbfzi9D2T3W0hriVVVhntjSgKw2kjKT8PBR95IPohRs9LxzrFIk1OPrTkDSrDShkw78Xrp8bxfnXguWLQVCLpHcDkEsC9OMvm48pceYuiDXEaqazs/e4v67zqJc5q/7bJKPchnP5fV4fPsg7MK8g01mQPvR3rwsXkSfY58g/TqWFMwNOmmjvpey1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/42H29EItYBgcmXVbbAipTPaS2qi5aEzwaFimWyQKs=;
 b=gHzFQYUMVUzRxT4l0WqXgylmkFvMJ3uJRdt16DuPDYRTZP0xbsjHjWkTz/I+nbmSc+64cvA821py5WVegAvFCOb6uhBInzu/F22ow4y9anE9wIggH5K0nqqLQEg8HhVXpolf0Ff51rjyM2ZI/4HBi/FYfYZO20naLzUxtNAMo4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm: Drop deprecated early printk platform options
Date: Fri, 13 Sep 2024 08:15:29 +0200
Message-ID: <20240913061529.213002-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: f199fdc9-73fc-44ff-dc86-08dcd3bb8848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBqV9XCLuKMVvkHDt0m7KRCcdM3/CXgTb8Iblkv9jdAW9m/6SXzD6VPqVMqq?=
 =?us-ascii?Q?8zMtSO97V0oQd89RrHktO+E+ndYRQNBOOqSqRM9VAWKEjLph+6vHxBCRIU/l?=
 =?us-ascii?Q?I+eDcSqvR7x5/hZtyDEAwTMaFsrRU63rCsMDBxM2aUiKysONCMbSEB99g6Kx?=
 =?us-ascii?Q?7FcFjMSNC6scgGv3eans8gY26nhM/n+cBJMh9furtsNA70eFEqgc0s6M7/8h?=
 =?us-ascii?Q?4eloDKIHfGOyAD0pwKdSMolbpTwGt3irpuvuosavN3FkdZW0LgLSEoiVkhvH?=
 =?us-ascii?Q?GUByT+E0RvMKzs8wbhkF8zqqwUQ4YNfh97Dw9lDlUOucAxWCcUwlhKLQAgnc?=
 =?us-ascii?Q?UzbRuxN6QMvSUvRymr0pK3WRawL7wqAyakLJ1mDR7w7cVP28PvyD2pt/ttj4?=
 =?us-ascii?Q?bEMc2Q6RaRfJDcH9bsfLKqfCGHnGKH78jeUPG32rofi0b5q9Ko4161JfCnck?=
 =?us-ascii?Q?IsXDlMePeHvVLBo9B9wNY+zXB40MYsYR0ijVLKSe0F0IU0CECenlhATH/y35?=
 =?us-ascii?Q?JmSWb1uO6B2Ht5rssbStFVCLSy7foJIMasvg1Rq4JN9tQp/jZfO+YLeOZ4SI?=
 =?us-ascii?Q?9prh3jTa5ePzvEa9U3KL7f6Ac8eD0oTYe5+B0NNEDVbNrgWtBZBFF7No2uyA?=
 =?us-ascii?Q?5P1FXJwhwLXN0CNJPanLGO7HBY5fyaBbLTgN9Zd6MPZOdxHa0pNYy104ehbG?=
 =?us-ascii?Q?uf7aZ28MP1DHygePWJXvXyBxHTcybyfvwJjN2Pw1zOQzZGhmwTw3JrK39Xmx?=
 =?us-ascii?Q?UUfjikGLpKG7jV6gDL/7QzD25eCOT7i8GSFZP5CYwde6+4AqTXhk+M3qTZXo?=
 =?us-ascii?Q?OhJQuEYup5PxBRCFpe/6JkUAHJcYDtamS1ptkCYR1be8tgWUrh9VnMRtPNE9?=
 =?us-ascii?Q?+rSJPkOxnAYBxOViQNg4lpgq7U2SJQ8plpjz/Y5kgZ4vlAXtz3TPwCwIGk7R?=
 =?us-ascii?Q?iS+zWGDwR8QKw5OrU2thYCHCVu0rPucd7i9E8jOsBYtq/z7WAabx7ZlkDeP3?=
 =?us-ascii?Q?hpYpzRJvixOvCJh/WZhpOHxeTav4/Y5+e07g+8fwWweKZdlTuC7ZCfB7p+fi?=
 =?us-ascii?Q?YaBC9TRI7w6jRWHpmJA5GJ0lpMpsXMcO0Py71ORrcH0GDeDwqy06QR4qT8Ax?=
 =?us-ascii?Q?5DKTA/+b6H8ZmRNRx1g+iTK1CNwoKiJ3BrLxXB6hlfTUhCtTRWmIAMW4Iw9/?=
 =?us-ascii?Q?bzm2FexyUg7bZA76/xHAHf1NDuPOMT27gDOpzZsfF51jQ0mBZtyjGq9zsjyB?=
 =?us-ascii?Q?xv3P5TC/ay+75OFtb1zJyAtwRSed87WqzX+rgE9o+y2zBlUA3GiMAByfpZkD?=
 =?us-ascii?Q?8RvaD8oLYaK1NpIJmJ0fsF7g1kE9Y5WMRQwS9oYFBLlqBJg686lKwxAQCNX3?=
 =?us-ascii?Q?mwzDUkyovBEnr4JIMibuOacjbMhk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:15:57.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f199fdc9-73fc-44ff-dc86-08dcd3bb8848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

The predefined configurations for early printk have been deprecated for
a sufficient amount of time. Let's finally remove them.

Note:
In order not to loose these predefined configurations, I wrote a wiki
page: https://wiki.xenproject.org/wiki/Xen_on_ARM_Early_Printk

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/early-printk.txt |   4 -
 xen/arch/arm/Kconfig.debug     | 155 ++-------------------------------
 2 files changed, 9 insertions(+), 150 deletions(-)

diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.txt
index bc2d65aa2ea3..e6b9124a38e3 100644
--- a/docs/misc/arm/early-printk.txt
+++ b/docs/misc/arm/early-printk.txt
@@ -35,8 +35,4 @@ Other options depends on the driver selected:
 
   - For all other uarts there are no additional options.
 
-As a convenience it is also possible to select from a list of
-predefined configurations available in the list of choice for "Early
-printk" for specific platform.
-
 By default early printk is disabled.
diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index eec860e88e0b..2fa0acd2a3f1 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -13,177 +13,67 @@ choice
 		Choose one of the UART drivers for early printk, then you'll
 		have to specify the parameters, like the base address.
 
-		Deprecated: Alternatively, there are platform specific options
-		which will have default values for the various parameters. But
-		such option will soon be removed.
-
 	config EARLY_UART_CHOICE_8250
 		select EARLY_UART_8250
 		bool "Early printk via 8250 UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a 8250 UART. You can use this option to
-			provide the parameters for the 8250 UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a 8250 UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_CADENCE
 		select EARLY_UART_CADENCE
 		depends on ARM_64
 		bool "Early printk via Cadence UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a Cadence UART. You can use this option to
-			provide the parameters for the Cadence UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a Cadence UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_EXYNOS4210
 		select EARLY_UART_EXYNOS4210
 		depends on ARM_32
 		bool "Early printk via Exynos4210 UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a Exynos 4210 UART. You can use this option to
-			provide the parameters for the Exynos 4210 UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a Exynos 4210 UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_IMX_LPUART
 		select EARLY_UART_IMX_LPUART
 		depends on ARM_64
 		bool "Early printk via i.MX LPUART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a i.MX LPUART. You can use this option to
-			provide the parameters for the i.MX LPUART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a i.MX LPUART.
+
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
 		bool "Early printk via MESON UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a MESON UART. You can use this option to
-			provide the parameters for the MESON UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a MESON UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_MVEBU
 		select EARLY_UART_MVEBU
 		depends on ARM_64
 		bool "Early printk via MVEBU UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a MVEBU UART. You can use this option to
-			provide the parameters for the MVEBU UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a MVEBU UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_PL011
 		select EARLY_UART_PL011
 		bool "Early printk via PL011 UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a PL011 UART. You can use this option to
-			provide the parameters for the PL011 UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a PL011 UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
 	config EARLY_UART_CHOICE_SCIF
 		select EARLY_UART_SCIF
 		bool "Early printk via SCIF UART"
 		help
 			Say Y here if you wish the early printk to direct their
-			output to a SCIF UART. You can use this option to
-			provide the parameters for the SCIF UART rather than
-			selecting one of the platform specific options below if
-			you know the parameters for the port.
+			output to a SCIF UART.
 
-			This option is preferred over the platform specific
-			options; the platform specific options are deprecated
-			and will soon be removed.
-
-	config EARLY_PRINTK_BRCM
-		bool "Early printk with 8250 on Broadcom 7445D0 boards with A15 processors"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_DRA7
-		bool "Early printk with 8250 on DRA7 platform"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_EXYNOS5250
-		bool "Early printk with the second UART on Exynos5250"
-		select EARLY_UART_EXYNOS4210
-		depends on ARM_32
-	config EARLY_PRINTK_FASTMODEL
-		bool "Early printk with pl011 on ARM Fastmodel software emulators"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_HIKEY960
-		bool "Early printk with pl011 with Hikey 960"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_JUNO
-		bool "Early printk with pl011 on Juno platform"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_LAGER
-		bool "Early printk with SCIF0 on Renesas Lager board (R-Car H2 processor)"
-		select EARLY_UART_SCIF
-	config EARLY_PRINTK_MIDWAY
-		bool "Early printk with pl011 on Calxeda Midway processors"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_MVEBU
-		bool "Early printk with MVEBU for Marvell Armada 3700 SoCs"
-		select EARLY_UART_MVEBU
-		depends on ARM_64
-	config EARLY_PRINTK_OMAP5432
-		bool "Early printk with UART3 on TI OMAP5432 processors"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_RCAR3
-		bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
-		select EARLY_UART_SCIF
-	config EARLY_PRINTK_SEATTLE
-		bool "Early printk with pl011 for AMD Seattle processor"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_SUN6I
-		bool "Early printk with 8250 on Allwinner A31 processors"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_SUN7I
-		bool "Early printk with 8250 on Allwinner A20 processors"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_THUNDERX
-		bool "Early printk with pl011 for Cavium ThunderX processor"
-		select EARLY_UART_PL011
-		depends on ARM_64
-	config EARLY_PRINTK_VEXPRESS
-		bool "Early printk with pl011 for versatile express"
-		select EARLY_UART_PL011
-	config EARLY_PRINTK_XGENE_MCDIVITT
-		bool "Early printk with 820 on Xgene mcdivitt platform"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_XGENE_STORM
-		bool "Early printk with 820 on Xgene storm platform"
-		select EARLY_UART_8250
-	config EARLY_PRINTK_ZYNQMP
-		bool "Early printk with Cadence UART for Xilinx ZynqMP SoCs"
-		select EARLY_UART_CADENCE
-		depends on ARM_64
 endchoice
 
 
@@ -219,25 +109,6 @@ config EARLY_UART_BASE_ADDRESS
 	depends on EARLY_PRINTK
 	hex "Early printk, physical base address of debug UART"
 	range 0x0 0xffffffff if ARM_32
-	default 0xF040AB00 if EARLY_PRINTK_BRCM
-	default 0x4806A000 if EARLY_PRINTK_DRA7
-	default 0x1c090000 if EARLY_PRINTK_FASTMODEL
-	default 0x12c20000 if EARLY_PRINTK_EXYNOS5250
-	default 0xfff32000 if EARLY_PRINTK_HIKEY960
-	default 0x7ff80000 if EARLY_PRINTK_JUNO
-	default 0xe6e60000 if EARLY_PRINTK_LAGER
-	default 0xfff36000 if EARLY_PRINTK_MIDWAY
-	default 0xd0012000 if EARLY_PRINTK_MVEBU
-	default 0x48020000 if EARLY_PRINTK_OMAP5432
-	default 0xe6e88000 if EARLY_PRINTK_RCAR3
-	default 0xe1010000 if EARLY_PRINTK_SEATTLE
-	default 0x01c28000 if EARLY_PRINTK_SUN6I
-	default 0x01c28000 if EARLY_PRINTK_SUN7I
-	default 0x87e024000000 if EARLY_PRINTK_THUNDERX
-	default 0x1c090000 if EARLY_PRINTK_VEXPRESS
-	default 0x1c021000 if EARLY_PRINTK_XGENE_MCDIVITT
-	default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
-	default 0xff000000 if EARLY_PRINTK_ZYNQMP
 
 config EARLY_UART_PL011_BAUD_RATE
 	depends on EARLY_UART_PL011
@@ -250,7 +121,6 @@ config EARLY_UART_PL011_BAUD_RATE
 		not try to initialize the UART, so that bootloader or firmware
 		settings can be used for maximum compatibility.
 
-	default 115200 if EARLY_PRINTK_FASTMODEL
 	default 0
 
 config EARLY_UART_PL011_MMIO32
@@ -274,13 +144,6 @@ config EARLY_UART_8250_REG_SHIFT
 
 		Default to 0.
 
-	default 2 if EARLY_PRINTK_BRCM
-	default 2 if EARLY_PRINTK_DRA7
-	default 2 if EARLY_PRINTK_OMAP5432
-	default 2 if EARLY_PRINTK_SUN6I
-	default 2 if EARLY_PRINTK_SUN7I
-	default 2 if EARLY_PRINTK_XGENE_MCDIVITT
-	default 2 if EARLY_PRINTK_XGENE_STORM
 	default 0
 
 choice EARLY_UART_SCIF_VERSION
-- 
2.25.1


