Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB51A85AFA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947123.1344842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCI-0007e3-QN; Fri, 11 Apr 2025 11:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947123.1344842; Fri, 11 Apr 2025 11:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCI-0007cT-LF; Fri, 11 Apr 2025 11:05:22 +0000
Received: by outflank-mailman (input) for mailman id 947123;
 Fri, 11 Apr 2025 11:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3CCH-0007Jn-Iw
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:05:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2009::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da2a2565-16c4-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:05:19 +0200 (CEST)
Received: from BYAPR07CA0041.namprd07.prod.outlook.com (2603:10b6:a03:60::18)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 11:05:13 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::8d) by BYAPR07CA0041.outlook.office365.com
 (2603:10b6:a03:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Fri,
 11 Apr 2025 11:05:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 11:05:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:11 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 11 Apr 2025 06:05:10 -0500
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
X-Inumbo-ID: da2a2565-16c4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arHwlPWdu+O/ZF95cIjFM6lbH1ciPmX28WxtUu/1xnZVTV1lN1sGQK5knqsPecLIOscbdFTdqiqZCQ9mLcYzyHqNBGquoojS1gUnnRBceMAWCNjoLZf4rC/4GawDL8FTKp+fWm4gokuHRituhZulu0QZziQ0cuDiL1ehxaH187dhFb4nhLQ93rZIJ+JJcN0jKuaKC/+C/oe3ugqjM3O8IgkB1lHhwt0sI7UdjuYqvM3axEZkCBGsONH291ZQl8ZaVpRIDA0X090zfKlT5USdwWRM0pTIRVFIkKl9McfHNWTIY5jqWBtLmUnVaX1DyvSkFq4D0k337BNTwGfuWWjqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGzdqxIQBFpHYe8CZuusCg+Xnz1IG6o/Om6AUX6NyzE=;
 b=arHmrhjjFzwjY9BxMxw2vzSmnCaABUOKhBwkF1CMfltAEOLdHxeoEspG+aMTrPVkrJn6O0AHEn+Mjhx9fTrCrQAGXmniPNQZb3OrxbcClHxkFC3HPJadchAMtM3wg14prVnstkpJtksZpPVo9VSvpLsOP0qaX9kf+sqT5u3WWEssmE1km3rKedYv9hZERAUu7t+brD5br/GRM2rNKX/FXEUPRVAfS+6qoHZbfdMsbde1mokSiggEFrsMyP5e8hgKmGqFC0VbI2NnMr1+4IbbgSNofO1TvVY1V0ihCMyV19aUkmUpmSMHwrn7jBH5k48BTg/h8iHb+p/eem4AAR89fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGzdqxIQBFpHYe8CZuusCg+Xnz1IG6o/Om6AUX6NyzE=;
 b=ZcCvBcXtrmSNX4Pyb2pzNbwsi+yGsaU8ZTW5GOUdHYDRUcxdXbHjfHm2znZ7hYxD4N6XlRT7ux4qwgN4na9iIbq2O6lszWAaigdNKC2bJ3SLNI6D9AltddExoEiqq1JvNKYpBNZl3dXc81IbE48MJZu3B6rD0xVDNQ5yZdrGvtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions as arm64
Date: Fri, 11 Apr 2025 12:04:51 +0100
Message-ID: <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a5c8f0-3240-44f5-a8f3-08dd78e8bb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?20Kp10CJXCTpH043vC0b+3qB820md2hPRIaJWxNAwEGgW+5vUS9ppfTLAa7e?=
 =?us-ascii?Q?TdmASkv1EsOGkKDV27iPg1kuMVS4hdxbTimPstWe5BHl8gjIQzS3tF7vcMzr?=
 =?us-ascii?Q?BHlCIy5nTbz343ej2gTpgedTtUrGcgmkHcOaV0t4X2s2HdiVP+U4knR8jQ5v?=
 =?us-ascii?Q?cKGNeRbXzdfyVSaRV1glJ26gV3qILZTjw6wqj55oXMugu5D3IQs3zuUT0K5u?=
 =?us-ascii?Q?R4lbwBCjR0CPN6rfFLlCGRgbnHjTsHRuqc9onPWDaL+iK1OdA2SKqrUCAHWI?=
 =?us-ascii?Q?ljiu51L5YITgiSaAo8RiIx9KTZfd599A/Z0XOEsYM8OxFV3eY2VyJZrpc1zu?=
 =?us-ascii?Q?KZZycSxqUi4qn58diyAhzVtiqI1MPQzbjnzfWTEVAuG3WF5Pzo8LyF5/fIa3?=
 =?us-ascii?Q?9qaNcBk74sqxPu3D0uMFgcD9CjaTAHeuQaVWcBEKYYlKebvAMbBq6SIqGu1r?=
 =?us-ascii?Q?3ot2f89DBFbiyskMFsDWL6GG+JB0RpiJ4+gTyanB2KrxAjVgRB/XGu1gZL/Z?=
 =?us-ascii?Q?fIPo4WWjB63tUjP48Yzchf8UJ+QRBZi7b3mSI3ebTEp2L8ecf37yurtOASBo?=
 =?us-ascii?Q?tj3afq0J1QmLybRs4xMq1PxbyyB7AZ2UJbQbE/4a4SztP7V3JVRJkBrGU90a?=
 =?us-ascii?Q?YUCbDP9EbA0+lS775szT/DLRXudqbskl/sc9RCQ7LMfBk6JB68iQLeJoKom1?=
 =?us-ascii?Q?cdFmGLclsM81SvLUF3V318K+VHyhJXHcCptwg7g1O+uvA2NVsoSkIxHgutF0?=
 =?us-ascii?Q?3+DqcQzgUAk9iliufG4tee/y2cPnwO4ezmjQNXX58Y2btWG61lsPqpwiML/9?=
 =?us-ascii?Q?4KAq67Q2Phibdq9imo2L0Y1SRD20a7p6HVneZ5x90qvdVdUamicOkYmwb0e5?=
 =?us-ascii?Q?d9NXcQJkVDUPF0Je8myOB+CnpQqhbQuazgN33KXekpf8uhaVZFPw4GGypY38?=
 =?us-ascii?Q?4S6izqcO6n7dWnJtrQ7AMbyEvn0ACoa5ZE+pNLWtVXdGMRBrqNtD2adpZSr1?=
 =?us-ascii?Q?vFDKmDrXAE6XsU+w5zLtsOD1IDV7PUL70Xlp0aYwlHYQl3gvJt9dEkU9Ovun?=
 =?us-ascii?Q?1mEube9oW9TUq8PiNgz7eNTT44dE56j0bldY+Nb7FTCpp0SiamZR5fr2yP/O?=
 =?us-ascii?Q?RsPaFP0XZhQubxmhXOjPxLpgiGkjQ1wIdOGlLXI7vwz1eE/NsPOtWmjP90bq?=
 =?us-ascii?Q?zcy+UfGyW4GjIGGk4lNw2+lzXuhkmkbYt+4cvwsYZ451pkLHZATRMk9XtuD0?=
 =?us-ascii?Q?MrqYX7J7bwHeq2jGLzn1hKG0rxHZQuvSPebKkT+r9ipS8MNHRwwHd4JQdSFv?=
 =?us-ascii?Q?o42QcJC0o3uvtCoOCTn9sgcQWl5U/dr+3+Dm5RwVgY2Z3AR+xoF1aUJexG3r?=
 =?us-ascii?Q?b54fTRcCklqV3HBOtp6T3bX/elpQCKRF0PBoYjMFicoqJYruDcq3Mm+/igQ8?=
 =?us-ascii?Q?aL+X7BSUR9u86YstKX/6KjsOoalXxNp8v/vgEPV3bt8tSgvr5DClo3atAdTG?=
 =?us-ascii?Q?OGQy1artfzwqiSHs1IvtKnabeKLF1/ixtzZX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:05:12.4011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a5c8f0-3240-44f5-a8f3-08dd78e8bb33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916

Boot-time MPU protection regions (similar to Armv8-R AArch64) are created for
Armv8-R AArch32.
Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
XN is 1-bit for arm32.
Defined the system registers and macros in mpu/cpregs.h.

Introduced WRITE_SYSREG_ASM() to write to system registers in assembly.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from

v1 -

1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
being done in enable_mmu(). All the mm related configurations happen in this
function.

2. Fixed some typos. 

v2 -
1. Include the common prepare_xen_region.inc in head.S.

2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.

v3 -
1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()

2. enable_boot_cpu_mm() is defined in head.S

v4 -
1. *_PRBAR is moved to arm32/sysregs.h.

2. MPU specific CP15 system registers are defined in mpu/cpregs.h. 

v5 -
1. WRITE_SYSREG_ASM is enclosed within #ifdef __ASSEMBLY__

2. enable_mpu() clobbers r0 only.

3. Definitions in mpu/cpregs.h in enclosed within ARM_32.

4. Removed some #ifdefs and style changes.

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   1 +
 xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/sysregs.h |   9 ++
 xen/arch/arm/include/asm/cpregs.h        |   2 +
 xen/arch/arm/include/asm/mpu/cpregs.h    |  27 ++++++
 6 files changed, 144 insertions(+)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 40a2b4803f..537969d753 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,5 +1,6 @@
 obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
new file mode 100644
index 0000000000..b2c5245e51
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R-AArch32 MPU system.
+ */
+
+#include <asm/arm32/macros.h>
+#include <asm/arm32/sysregs.h>
+#include <asm/cpregs.h>
+#include <asm/mpu.h>
+#include <asm/mpu/regions.inc>
+#include <asm/page.h>
+
+/*
+ * Set up the memory attribute type tables and enable EL2 MPU and data cache.
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch32 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers r0
+ */
+FUNC_LOCAL(enable_mpu)
+    /* Set up memory attribute type tables */
+    mov_w r0, MAIR0VAL
+    mcr   CP32(r0, HMAIR0)
+    mov_w r0, MAIR1VAL
+    mcr   CP32(r0, HMAIR1)
+
+    mrc   CP32(r0, HSCTLR)
+    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
+    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    mcr   CP32(r0, HSCTLR)
+    isb
+
+    ret
+END(enable_mpu)
+
+/*
+ * Maps the various sections of Xen (described in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Clobbers r0 - r5
+ *
+ */
+FUNC(enable_boot_cpu_mm)
+    /* Get the number of regions specified in MPUIR_EL2 */
+    mrc   CP32(r5, MPUIR_EL2)
+    and   r5, r5, #NUM_MPU_REGIONS_MASK
+
+    /* x0: region sel */
+    mov   r0, #0
+    /* Xen text section. */
+    mov_w   r1, _stext
+    mov_w   r2, _etext
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    mov_w   r1, _srodata
+    mov_w   r2, _erodata
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    mov_w   r1, __ro_after_init_start
+    mov_w   r2, __init_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+    /* Xen code section. */
+    mov_w   r1, __init_begin
+    mov_w   r2, __init_data_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    mov_w   r1, __init_data_begin
+    mov_w   r2, __bss_end
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
+    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
+    b    enable_mpu
+END(enable_boot_cpu_mm)
+
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+FUNC(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+END(enable_secondary_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 22871999af..8d7b95d982 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -20,6 +20,15 @@
  * uses r0 as a placeholder register. */
 #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
 
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
+#ifdef __ASSEMBLY__
+#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
+#endif /* __ASSEMBLY__ */
+
 #ifndef __ASSEMBLY__
 
 /* C wrappers */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index aec9e8f329..a7503a190f 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_CPREGS_H
 #define __ASM_ARM_CPREGS_H
 
+#include <asm/mpu/cpregs.h>
+
 /*
  * AArch32 Co-processor registers.
  *
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
new file mode 100644
index 0000000000..e2f3b2264c
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_MPU_CPREGS_H
+#define __ASM_ARM_MPU_CPREGS_H
+
+#ifdef CONFIG_ARM_32
+
+/* CP15 CR0: MPU Type Register */
+#define HMPUIR          p15,4,c0,c0,4
+
+/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
+#define HPRSELR         p15,4,c6,c2,1
+#define PRBAR_EL2       p15,4,c6,c3,0
+#define PRLAR_EL2       p15,4,c6,c8,1
+
+#define MPUIR_EL2       HMPUIR
+#define PRSELR_EL2      HPRSELR
+
+#endif /* CONFIG_ARM_32 */
+#endif /* __ASM_ARM_MPU_CPREGS_H */
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


