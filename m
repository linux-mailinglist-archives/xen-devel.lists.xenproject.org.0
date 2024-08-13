Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DC950B45
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776486.1186661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6C-0007tN-3N; Tue, 13 Aug 2024 17:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776486.1186661; Tue, 13 Aug 2024 17:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6B-0007qw-V3; Tue, 13 Aug 2024 17:14:19 +0000
Received: by outflank-mailman (input) for mailman id 776486;
 Tue, 13 Aug 2024 17:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcsl=PM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdv6A-0007JM-7z
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:14:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2412::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77edf91e-5997-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:14:17 +0200 (CEST)
Received: from CH0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:610:b3::32)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 17:14:10 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::10) by CH0PR03CA0057.outlook.office365.com
 (2603:10b6:610:b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Tue, 13 Aug 2024 17:14:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 17:14:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:09 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 13 Aug 2024 12:14:07 -0500
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
X-Inumbo-ID: 77edf91e-5997-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCAyRdf3T9u/L9pQSSavjL4LC8u0F1E/Lt57eyCzxN09hL6ssS0Ls8kH9SCB3ruwyAifSJpIsN8bJw+OlhWQn8UZDM/iSw8qVCBV49FUoKyw+uxl0pxzeYy6LW4yLjc1PkAdIUU3LR+nkXYMeCpYhQ0EI3bDTr0akgH9EdSfckGo+V1+ayoQbGkVpQBKz4sD2cVtXJRF+eKigC1CLD7KQiO4OZyHAIv1YwOj1p8MB237oLcT0cIOAhsuHYDScUTVO/7ZutkOAnDTc/Xvni/NBJg3t+1VrgcgbWu3eDM3RiuQGq5H98Mr+XWH7kMFOtrHUquQd2rEmoas4Aof1g6NXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t/nB18k33JmikWIsTZUH9Fi3nu8O21bDaKGSgVj5HY=;
 b=W9u3LWuc1P2cqNLvApvRgU87/HsFAJOvNkl8a6zCAciISLZYkvWC+mr8gLDRAGXPEM/UEFnf3QD5jnjdxDAZpvl/vXQ4BIG6C8ELIZ/oKTS5rPcIrxoCFxuFTGDcxoyI54TI6ULGsybviILfEF+1X1tZUP688sSBsU68UxSh4XyBgxaSQg9yGbRECovabm1VasAdVliweORSEbb3wBRg4pNgr+tVC7gS91JSiCV/Boyqcy2JV9PNhxqselKnJ+PG5mHmNlID0oRNMejLsQJcOIdDvKzV8xaMTyDHsA3zwROC/RSxNwYFkcBxz6jnNfqq8wayNTKt2J0gO9KESxZVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t/nB18k33JmikWIsTZUH9Fi3nu8O21bDaKGSgVj5HY=;
 b=LlLAA4L29tPB1d3hoELRaLuLwJQxhNOIFQ0PR0LzYBqU7OHFLKF5VER2NY+aRqKfTRl5GLv/rdfJLZ1H9LvRqAKm6orClvRPliayN+/VNcs1QwGBoNN2tJ33OvzQc9918+BKRR/j6Ily3rhpxgpPAyV5Z3VsJyFbt3U/ptOt59w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Penny Zheng <penny.zheng@arm.com>, "Wei
 Chen" <wei.chen@arm.com>
Subject: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Date: Tue, 13 Aug 2024 18:13:54 +0100
Message-ID: <20240813171356.46760-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 554ff9d2-33f5-4a54-ccdb-08dcbbbb58d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aLcuU0YyPYlq67p48ejlMr/PmVKoXUeEu/ME9g00DeNX8PE9AkPD40vewb6f?=
 =?us-ascii?Q?KVfI0KUf4QziX5f5imAZk6b9Pzpv1SLdMNSOGojlrHkn+/IbVXCanAJoEdQI?=
 =?us-ascii?Q?sLrFX3yUScL1X+wFWPnKugMpBLIGG9rstLttLlgIvtpZ39aYqoqGXAxRGDZs?=
 =?us-ascii?Q?jK6GHAUyWgH00n8vcD2dPUAmkHTSXwp6mDapvMhNxV6zXo8mfy1mWHVYmbfg?=
 =?us-ascii?Q?1aFZGwSgUyl98Zk4JUsHdrN7iiT0AhThqdFNcXPtcD3rynGR2eOt1S9kMw9W?=
 =?us-ascii?Q?7/q1SeRx1ZZW9UxLYgFwyr79JfsS9LirAuEurAA7nBFZJ+zHIp3uz22mR2UO?=
 =?us-ascii?Q?103dWrt8wB17YdNOeBK9yhjAUUVCW2uX+UIMLWa7D/74xM7sJ8DS/xzW/jnG?=
 =?us-ascii?Q?yJZoOF0anqZVCZj9ccOLmWWJp0HiA9J1Xpc07ZwTgrqmFNfoGBw7TiyrfCdY?=
 =?us-ascii?Q?kNq0wYls12yleWek8OUzMF//OTZI0fEog5zUXNwU60dArKUeOEOEbr4GsO2S?=
 =?us-ascii?Q?Vo370TQZzTPaHsGTBo1SzBdhtBhTuFXYdSlVOcNEW/RwtGd6yef5sGI4n+pe?=
 =?us-ascii?Q?bfbgTFkuMWJ41mTRAkCz0HSz7YsO1fdJpReeua4ChxsIgZqZkKdlDxjk/Y+/?=
 =?us-ascii?Q?8/Sfo4WMgV1zV9qT1g3/3gMiMjr6Tty3DGZbY7jWQM58V8gwMHOKc6VBPfiD?=
 =?us-ascii?Q?YT5XcuD3mHG43eBKZHxvvIznzWm+k5/Jy1Q0EMjhiABI92NJTJd2kNzi8IJ1?=
 =?us-ascii?Q?9v0145rZv3oEd//fqpdCzRekmtRMsXiUNzCDg+1zgsXUXQ0OnhjjhJotHHmF?=
 =?us-ascii?Q?QARiEw4B4Vpqh8zdGxhTZ82rEQCVYFSZmI4f5Y19buoZWAnkcdIveyvOzXxr?=
 =?us-ascii?Q?pocW5h6YYhPokxMxNCFhUa7CM1ZAPUECN3irxCjOOLzfZX2yzDCKTmifmMVW?=
 =?us-ascii?Q?gWI/kWCr2+t4c/UdNf46xn8X1M/OJz04n+66o/Mxu4baFvPGqpaUPcK2QHEW?=
 =?us-ascii?Q?Y0b1qPAwh1qKfh54czQoSV7LHhPbuYeGFpP0HLV08sqcPTpaOm6seeS+/H8B?=
 =?us-ascii?Q?Sfeot7/KN3rT83AVoK7M0CZxAyQGJfuvC5+WN522MGPSLFktRiJd2BY5Z7Nd?=
 =?us-ascii?Q?f2b4mpZJimxektPbJ8dD7zhhxJHEaA5pP+/fcZnUDU5gbaiIq/65GFhk/QtD?=
 =?us-ascii?Q?gMNmx45Zoljax9kWxKTK30IEx/zqYvEyBxglcwqmYoxOthpHoJIvzTwQ12Fa?=
 =?us-ascii?Q?3/pBYPvJPWLSMqW/CGyedBvBxLbgE3uKkkTJNBKnOXYqR1MhaJ/VlyOMO7jW?=
 =?us-ascii?Q?1jdzv4OfFCODKkHkMBSmXan14CD8KUwtlhRBqE6Q530hwGBEYyo7YHYPu58O?=
 =?us-ascii?Q?ZpE5rIyo2I5sFsQLLLFIq5d14CM47CbynEOAVz1gFFPO4EnzRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:14:10.2580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 554ff9d2-33f5-4a54-ccdb-08dcbbbb58d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791

From: Penny Zheng <penny.zheng@arm.com>

Introduced CONFIG_VMAP which is selected by the architectures that use
MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.

VMAP is widely used in ALTERNATIVE feature to remap a range of memory
with new memory attributes. Since this is highly dependent on virtual
address translation, we choose to fold VMAP in MMU system.

In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
only support in MMU system on ARM architecture. And ALTERNATIVE now
depends on VMAP.

HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP.
2. cpuerrata.c is not gated on HAS_VMAP.

v2 - 1. Introduced CONFIG_VMAP in common/Kconfig.
2. Architectures using MMU select this config.
3. vm_init() now uses CONFIG_VMAP.

 xen/arch/arm/Kconfig   | 4 +++-
 xen/arch/arm/setup.c   | 2 ++
 xen/arch/x86/Kconfig   | 2 ++
 xen/common/Kconfig     | 3 +++
 xen/include/xen/vmap.h | 2 ++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 21d03d9f44..e30a7da186 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,7 +12,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
@@ -61,6 +61,7 @@ config PADDR_BITS
 config MMU
 	def_bool y
 	select HAS_PMAP
+	select HAS_VMAP
 
 source "arch/Kconfig"
 
@@ -171,6 +172,7 @@ config ARM_SSBD
 
 config HARDEN_BRANCH_PREDICTOR
 	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	depends on HAS_VMAP
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cb2c0a16b8..7f686d2cca 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -447,7 +447,9 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
+#ifdef CONFIG_HAS_ALTERNATIVE
     apply_alternatives_all();
+#endif
     enable_errata_workarounds();
     enable_cpu_features();
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7ef5c8bc48..32be057978 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -1,6 +1,7 @@
 config X86_64
 	def_bool y
 	select 64BIT
+	select HAS_VMAP
 
 config X86
 	def_bool y
@@ -31,6 +32,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select HAS_VMAP
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 565ceda741..188918ec5c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -77,6 +77,9 @@ config HAS_PIRQ
 config HAS_PMAP
 	bool
 
+config HAS_VMAP
+	bool
+
 config HAS_SCHED_GRANULARITY
 	bool
 
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index fdae37e950..c1dd7ac22f 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
 /* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
+#ifdef CONFIG_HAS_VMAP
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
+#endif
 }
 
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1


