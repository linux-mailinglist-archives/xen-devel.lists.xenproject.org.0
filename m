Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AA93F7AE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766796.1177342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRJ6-0003gf-Fp; Mon, 29 Jul 2024 14:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766796.1177342; Mon, 29 Jul 2024 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRJ6-0003da-C7; Mon, 29 Jul 2024 14:25:00 +0000
Received: by outflank-mailman (input) for mailman id 766796;
 Mon, 29 Jul 2024 14:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYRJ4-0003ZM-53
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:24:58 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53711ad6-4db6-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 16:24:56 +0200 (CEST)
Received: from CH5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:1f4::16)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 14:24:51 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::60) by CH5PR04CA0015.outlook.office365.com
 (2603:10b6:610:1f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 14:24:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 14:24:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:49 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 09:24:48 -0500
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
X-Inumbo-ID: 53711ad6-4db6-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHRmPxEHO4owW8CpirPq6sPM52zHNmRnguTaoiLfEoNT+m9fO75v7XgZe87s1w+95LH1+Lc33AH/9mTPhFpUKl+0D03NYHyfSCR0CiaLUlLBPj7W2dECks5NoufNCi06TmoQWCY43ssL7QVzDaDUQfRX9x7rWTtJVVEMtTbfJCNIBuWayBju3gBxouCYlynE+3twiMj0gWxgNsMnKI/qqzQmckXn7otOnAUDZ/mPLAtPqMnn7l/YGP9G+CXeAFs86W5wM/mMUSjkpH2AoDKeYcXn9DCmvgp8FNgECg63bshjC33gTtqxfg9w+GjtHcB7UrOZ1xSgZS65bL2NfxviVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSm79FkEI7y4i+M/UCormwCYBTtHPSb5Zm5QtdPtlSY=;
 b=yQ61iHq5CACPPembOTSkn/0/wY4G64w9UlZOj0ETwCQgsWIxk3ClwXHzjbVQZ6qJODEqiek4pDZzsbWeiQ5VjTqq+xamsXxCd3WzWNX2xSqmcT5CrABaMcFAhragWjhXfD4TXBImgQDGqATt8ula76V3f+/86RwMq7xVS+hCFK04sX5miv1cuOnaO2+CDr5sa6PVgN/p6SkVmlpreKZ2QXEUMvcdZvyVfbdwCk64ELv0JnY0/nC55NEFjWQS0+1RzL82Z8klileNcC4U+KBbCG3769tmNWKWV3Wjb02GiYJFhaCE2fqM4aY226pUqog054Z178dqsKWqfbClVZz1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSm79FkEI7y4i+M/UCormwCYBTtHPSb5Zm5QtdPtlSY=;
 b=kF4meOSDHYvfi5+9M4M4MLOD2vua6NcldG7dSmBDcYHCxwXeeRz+zyFR6RSsnHut8IWNJwZqK0dktg6aWZDjIYw6PZdEuD9XIOXBSjtKrqeXcYeUtRHIKIx0bZTvgeVcFmFzo9Xv9ZSnZj2Mw2VkyKjzM6pHj5JQhrCM4Y0s50g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: stack check instrumentation
Date: Mon, 29 Jul 2024 10:24:17 -0400
Message-ID: <20240729142421.137283-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729142421.137283-1-stewart.hildebrand@amd.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb1ffd3-64e5-47c0-2937-08dcafda3515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7qvpyGSaSAs7SSrqASTkAaSrjFv9vxREIO1PCtmW84zvr7o7RILwe/tYSlrh?=
 =?us-ascii?Q?vmepIDw9+yvtk3OR2neys3fAr1cc4tk5CAjJkK3uGIDX3be6vIJJf6ebS8bH?=
 =?us-ascii?Q?pBPNni5e5PeafIToF1n4FibidLn2n0RSs0+T25cW5zYsIuxCWUjk7ZgjQQrT?=
 =?us-ascii?Q?6zjlAYbSPZRkSVBc6p4cmr44JVvg5GA5ib0/mU7N/EhNB4gLpBra0g+CNhen?=
 =?us-ascii?Q?YqIP7qnNzzPBFuiUtx4uQuPJSwtKRJiS1PQCuyPO6nvea+KWE85q6SDs2qe3?=
 =?us-ascii?Q?UepdfQEtlJcp9y72lov/b+1S/xE8fknNvSy+Dun+SVKkz4fkTQ/k/kzruA0o?=
 =?us-ascii?Q?vejt4fG8BQgpaJ23ZHCd/3QQCdtCTdA4BwT7/LgsQQKSI3No1DC9b+zcOejw?=
 =?us-ascii?Q?7cVLHreXhg9KO0Q5qeeNMOM61LjKVhtN3bZCvaaf6fwtTRZ+xtbQCpNKCSqf?=
 =?us-ascii?Q?5OonyXV8q6gYFoNEFURlNe3nuPfFVow/zoZYkHdJQMcGk8a/tWVBEEeDLiZZ?=
 =?us-ascii?Q?dYbo1PQ0rtOuuMbWfC9ybmC0UGxs4bTA6ESDpAQHhENVefblMshnsje0APXy?=
 =?us-ascii?Q?y4nnb9vuX8kLpee03dgcxDcT+DMbBRDJ6bswsY4jFMDQMAmXb4itAPa6ZdDg?=
 =?us-ascii?Q?XGpQtsX501WIG9bTxjWP7vZL1WFKHNbn9usZ/lLFOyUcR/KkY26OfF+CxOsa?=
 =?us-ascii?Q?6aW1XfE6IrfaLaHQUrpz4lda4jJPUZkanAhS4CXn6CEvoGp+C5L6UkjDGajW?=
 =?us-ascii?Q?hg5t089vMXpUmxMEY9d/J2mlTfkbHz/CAeqhDOd7UX7T9sEb3LtXg2Fqj/hN?=
 =?us-ascii?Q?qfjxTlaARioVVajQVRjZDfzDT3ec0Qti0UJ/CnHF5bT5ohR3XI4Fmdu+laTi?=
 =?us-ascii?Q?ir/bEt+XxWY7TJEsbfsNBWX1JfzWtFfmQwON2hFPaEcgGFtjnu2uLV6+7oma?=
 =?us-ascii?Q?IWK+ZM4nt8zVydhJpzW/WeBx/NDJcrX1WzZ6Atd5J+YYfeL5tDQcQCjG6niW?=
 =?us-ascii?Q?82Bj9K7UrBSIHGT5dE3WKPYyWkNPPZeAY9OFujHPuCf465vzkJRCROSqCPvu?=
 =?us-ascii?Q?Qj4l9NKJYMUbukqQf0vVELmaTh5NGS+MSKXePAjDKaYooSVx5/VFAmVjc7y2?=
 =?us-ascii?Q?tSaVQ+ZGu2md2m1otGobiThrlBulXjjZPEVPCGxFX5D+9Q4PqZv6Gt9lKQ/r?=
 =?us-ascii?Q?5q/a2VzuP/WzumY2sC3XMQjsKo/m+iFZ5116an5jbUDmNupYFT/c/opzHypm?=
 =?us-ascii?Q?H4Cnh0cLAMXsNAFNhr3G6Iqh1KF5UJcdUXx9eqAMczTevK2YsajcqZ2UtqVR?=
 =?us-ascii?Q?WExc9hCXgCS8gtqswcbDdxoaIDN/AldnbxV2xMa8OImf+x4W6GH+5tihKuk+?=
 =?us-ascii?Q?4/7ugUnatb7O4s96obgNKApGSqx9J7qIeokD0GI6+WbfrZ6UeuzLUBM3jZRF?=
 =?us-ascii?Q?g+QQYEyJgI5E2/Zvq20Dz4QvEacebL5H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:24:50.6984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb1ffd3-64e5-47c0-2937-08dcafda3515
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714

Use the -finstrument-functions option to check that the stack pointer is
valid upon each function entry. Only enable it for debug builds due to
the overhead introduced.

Use per-cpu variables to store the stack base and nesting level. The
nesting level is used to avoid invoking __cyg_profile_func_enter
recursively.

A check is added for whether per-cpu data has been initialized. Since
TPIDR_EL2 resets to an unknown value, initialize it to an invalid value.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC: I only tested this on arm64. I still need to test with arm32.

RFC: Should we put this under its own config option instead of reusing
     CONFIG_DEBUG?

RFC: Is there a better value for INVALID_PER_CPU_OFFSET? We can't use 0
     because 0 is a valid value for get_per_cpu_offset().
---
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/arm64/head.S        |  4 +++
 xen/arch/arm/domain.c            |  3 +++
 xen/arch/arm/include/asm/page.h  |  2 ++
 xen/arch/arm/include/asm/traps.h |  8 ++++++
 xen/arch/arm/setup.c             |  4 +++
 xen/arch/arm/smpboot.c           |  3 +++
 xen/arch/arm/traps.c             | 45 ++++++++++++++++++++++++++++++++
 8 files changed, 70 insertions(+)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 022dcda19224..c39cb65d183d 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
+CFLAGS-$(CONFIG_DEBUG) += -finstrument-functions
 
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 2fa07dc3a04b..4a332b9cbc7c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -399,6 +399,10 @@ FUNC_LOCAL(cpu_init)
          * than SP_EL0.
          */
         msr spsel, #1
+
+        ldr   x0, =INVALID_PER_CPU_OFFSET
+        msr   tpidr_el2, x0
+
         ret
 END(cpu_init)
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 7cfcefd27944..93ebe6e5f8af 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -26,6 +26,7 @@
 #include <asm/procinfo.h>
 #include <asm/regs.h>
 #include <asm/tee/tee.h>
+#include <asm/traps.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
@@ -328,6 +329,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
 
     set_current(next);
 
+    stack_set(next->arch.stack);
+
     prev = __context_switch(prev, next);
 
     schedule_tail(prev);
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e68a..6b5aaf1eb3ff 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -7,6 +7,8 @@
 #include <asm/lpae.h>
 #include <asm/sysregs.h>
 
+#define INVALID_PER_CPU_OFFSET            _AC(0x1, UL)
+
 /* Shareability values for the LPAE entries */
 #define LPAE_SH_NON_SHAREABLE 0x0
 #define LPAE_SH_UNPREDICTALE  0x1
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 9a60dbf70e5b..13e6997c2643 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -118,6 +118,14 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
 
 void finalize_instr_emulation(const struct instr_details *instr);
 
+#ifdef CONFIG_DEBUG
+void stack_check_init(void);
+void stack_set(unsigned char *base);
+#else
+static inline void stack_check_init(void) { }
+static inline void stack_set(unsigned char *base) { }
+#endif
+
 #endif /* __ASM_ARM_TRAPS__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0c2fdaceaf21..07d07feff602 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -47,6 +47,7 @@
 #include <asm/setup.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
+#include <asm/traps.h>
 
 struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
 
@@ -733,6 +734,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     percpu_init_areas();
     set_processor_id(0); /* needed early, for smp_processor_id() */
 
+    stack_check_init();
+
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
@@ -924,6 +927,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
      * since the static one we're running on is about to be freed. */
     memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
            sizeof(struct cpu_info));
+    stack_set(idle_vcpu[0]->arch.stack);
     switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
 }
 
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 04e363088d60..1c689f2caed7 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -30,6 +30,7 @@
 #include <asm/psci.h>
 #include <asm/acpi.h>
 #include <asm/tee/tee.h>
+#include <asm/traps.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
@@ -329,6 +330,8 @@ void asmlinkage start_secondary(void)
 
     set_processor_id(cpuid);
 
+    stack_check_init();
+
     identify_cpu(&current_cpu_data);
     processor_setup();
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index aac6c599f878..b4890eec7ec4 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
 }
 
+#ifdef CONFIG_DEBUG
+DEFINE_PER_CPU(unsigned int, stack_check_nesting);
+DEFINE_PER_CPU(unsigned char *, stack_base);
+
+void __attribute__((no_instrument_function)) stack_set(unsigned char *base)
+{
+    this_cpu(stack_base) = base;
+}
+
+void __init __attribute__((no_instrument_function)) stack_check_init(void)
+{
+    this_cpu(stack_check_nesting) = 0;
+    stack_set(init_data.stack);
+}
+
+__attribute__((no_instrument_function))
+void __cyg_profile_func_enter(void *this_fn, void *call_site)
+{
+    unsigned char *sp;
+
+    if ( get_per_cpu_offset() == INVALID_PER_CPU_OFFSET )
+        return;
+
+    asm volatile ("mov %0, sp" : "=r" (sp) );
+
+    if ( sp < this_cpu(stack_base) ||
+         sp > (this_cpu(stack_base) + STACK_SIZE) )
+    {
+        if ( this_cpu(stack_check_nesting) )
+            return;
+
+        this_cpu(stack_check_nesting)++;
+        printk("CPU %d stack pointer out of bounds (sp %#lx, stack base %#lx)\n",
+               smp_processor_id(), (uintptr_t)sp,
+               (uintptr_t)this_cpu(stack_base));
+        BUG();
+    }
+}
+
+__attribute__((no_instrument_function))
+void __cyg_profile_func_exit(void *this_fn, void *call_site)
+{
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
-- 
2.45.2


