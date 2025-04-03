Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391BA7A86E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 19:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936975.1338079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7n-0006BI-VQ; Thu, 03 Apr 2025 17:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936975.1338079; Thu, 03 Apr 2025 17:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7n-00068f-Rk; Thu, 03 Apr 2025 17:13:07 +0000
Received: by outflank-mailman (input) for mailman id 936975;
 Thu, 03 Apr 2025 17:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+EW4=WV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u0O7m-0005tR-B8
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 17:13:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e77b7e48-10ae-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 19:13:05 +0200 (CEST)
Received: from MW4PR04CA0347.namprd04.prod.outlook.com (2603:10b6:303:8a::22)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:13:00 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::d8) by MW4PR04CA0347.outlook.office365.com
 (2603:10b6:303:8a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Thu,
 3 Apr 2025 17:13:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 17:12:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:12:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:12:58 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 3 Apr 2025 12:12:57 -0500
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
X-Inumbo-ID: e77b7e48-10ae-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdFF8HbezAIxFhy67uMlSxM/hwNE9DBo81RsfqfkHZu5Meq8Es1pRpeu3UbL2hjgOc/6sbwg75kuv+nNNUlnR/LTL8oMiotWa2gGYYtHfnIFVTS58BumjoEGWXQSaeD8h+arEABadUyIDCfmcwOWLUg9BHcZvgoShl/FaSkS6k7TPYdopDi5IHLhdxz+wRVCnZ7S8sNMu23oyqtdtLAM4bSRA01mXsdlacO/9xN4RkkfLjllOYKI8TNcgvPdUvPAwqByT5mTy+OOAIWfR3ctobKiofipPtYE0Nsswm4H1DSoU5YRF90D6eP8SfZyoNMBH1+FUMMEstC5ObCq9exX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iEKLthfgRWveEe3S4iS12T9P0XaDOcrSQh/HuvVFWc=;
 b=eOqWzF0eXhyxLaKlaRZIlyFevsMj7WA2fBcwu+c6lJ1QHJ6FXk4TwI95y9lLEfxjkptpLKOdS4js0hE1VuQ3CwjrDwI61kGcZ49MkQsCrXUgFOkmdu8ZKCkt6xzkP4dsYoEKtACM5EoeEg543rjOFcykQUIaZeTQ0CioKjkct0UCzxXRRYRog4x7wutFnvDpUpGxxvBH9Dk/Ska0gkqXXQEMgj2/l045USnQXKffzsLdvpf51vX400LE8gbr2ACQ91KK3ZS4ho82OX4aATDYtWeyAQw6UE258PR8CTfCN5tEnUJd05uzp+87pF/hrMD0XR+aS2bMW3F7L/oTctDXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iEKLthfgRWveEe3S4iS12T9P0XaDOcrSQh/HuvVFWc=;
 b=wo0dWDxZ9b8rJPf8K4n9m1VXwVSbe7yzeqEauQt/dsolsYWQwehiHbHAq+naZxPsnUJZPBU5/4/IDy4TaqkKES8SiMT1a/nTPdCMSz+nia1WZA0CUIx94+vz5a/qK3dk+/OCZWn4ea97dUCZlYUxEn6VnbqMXfFq/d3X52CZZkI=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/3] xen/arm32: Create the same boot-time MPU regions as arm64
Date: Thu, 3 Apr 2025 18:12:40 +0100
Message-ID: <20250403171241.975377-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cfe95f-cc09-42c2-3fc9-08dd72d2c8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q06R+4FoUE6+yZvhUmsuH7Mw3KUIgTh+LQVyIR4fO7iU+hHe/IfCKRzAxRXE?=
 =?us-ascii?Q?ZAatyp1lv/rLoJTeYg4zSc9z/5/Q29WY5XLdSFAkfGoh18fWg/2PAlb54Ub8?=
 =?us-ascii?Q?QwKMNkKHO0rN3NY4dNK9MXsGkO74BJNQL1Z4Pw/J8gqcAkZdiGY3y6P3LOo4?=
 =?us-ascii?Q?oHXIyIpYqhxrv3fK26YzQ46YzHhIz48qDPTHUigVgMwHsPr2Q/tOjV96SX1p?=
 =?us-ascii?Q?uq4c1CTOqLxXGttIXmdDfOBt7YV5bU2ITDY/sPOZW9if9PYPEFbYKjyFPpUC?=
 =?us-ascii?Q?qK1DjU5RvfTxjK+x/00uJz3RZs97sPl80/5W9G36tHKZlPwmeaidJJ1mLZ61?=
 =?us-ascii?Q?k1h1sPmZrDdSbFUQmERZe82fnrIzfumfrbFC41lhHMFy9y9695nux0D3tdgI?=
 =?us-ascii?Q?EA7L0kY5hwfoAhVS+rDIrgsjZ7gL1gWdQ9V3ksCLcoervYTXs6rMF9hiaryZ?=
 =?us-ascii?Q?6qRoI2eLNPhISBcl48q669N5QgtGUCIDSlKzP8lqvw6ckkm3gE6CeTLHMhSt?=
 =?us-ascii?Q?/SkI2sX69FyRJHIe/tkLiFIJVqxSuFtSu/5Jksx4V4+8VslEC+Zf2K1Z4Mg6?=
 =?us-ascii?Q?5LmOMoZ7aI261Wg/GfXKS7FLe8KR3AdFsY0iUHpaPXm8i81IATiAtCrkclC7?=
 =?us-ascii?Q?z1T+TV35JDHhFU8gA5uKCHFCftOA95HlXgsEH2RGv46x+nXsRK5g2BvJJG/V?=
 =?us-ascii?Q?Lma/n25TTVViYexGsOPhtK78EN5FRmWTh1KV3nevujzDAuP+hu9aoEAAOfa0?=
 =?us-ascii?Q?HxLYdXrf4DU/tYzTvDstkykaPnNuULSGhV+XJNIHeiFJcnWbtPnyDJy6zR9Q?=
 =?us-ascii?Q?9HsCBzfHovFp6sCyBv5SzuMaodphnv26W22C0xm0dyUQJ9Bz26RgXnr8qM7g?=
 =?us-ascii?Q?f7xvTYeCntmwP1ArESq5lfYxoRajE+OMuosdSZmhfruVyEc6DDf+GgmxPm84?=
 =?us-ascii?Q?no5kCSXnhPF6AFIGl8wRStAoMarTSFhsDWuUw5urOBmTywq+vHKZ3vlYR9cG?=
 =?us-ascii?Q?FOMcgl9Y0UapA/28VCpyzDXEAvhfDGjyf0W/J2EQpFlve1l0/KbCJ00O70QV?=
 =?us-ascii?Q?T6JXL5MkyMQT0mmUjJziFe6RqXTxKdOwh4of8LxWVqCx/7iXWuIQ3MVKjYfF?=
 =?us-ascii?Q?Db+HEHgdtwDeUoBfMGJSg7AweTkiltIN1M96eoFpKcUpkZ9QAXHDdWYsHMmL?=
 =?us-ascii?Q?c7WE1cur0NxpN9ZTxZjwteaTvtJ/QEFYUEhcfji6ByTZwYXtst/mLWtqVA9f?=
 =?us-ascii?Q?xUImFWej21gw5gXvo4LZpkDURaxIBq4hU8zw6LIWisnY3Ctbko0G+kxBqjJ7?=
 =?us-ascii?Q?x5yHEXsHfQ9aXlqLXBopJ8dMdX9KGlJpdvLfhshO4ODZS7XfqP3whEM0GtcN?=
 =?us-ascii?Q?SQDevs3+zPQ4lJbE38bQql4cYQRvzZLFr8FBXIiLb4LaPeO+a3sJF9fKyEYs?=
 =?us-ascii?Q?Gd2GppEZBmMDFN9jj+Ii/tLScIf6uqy5WFn/Ff/YLVatkNXZQIMMqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:12:59.4107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cfe95f-cc09-42c2-3fc9-08dd72d2c8e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003

We have created the same boot-time MPU protection regions as Armv8-R AArch64.
Also, we have defined *_PRBAR macros for arm32. The only difference from
arm64 is that XN is 1-bit for arm32.
The macros have been defined in mpu/cpregs.h.

Also defined WRITE_SYSREG_ASM() to write to system registers in assembly.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
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

 xen/arch/arm/arm32/Makefile           |  1 +
 xen/arch/arm/arm32/mpu/Makefile       |  1 +
 xen/arch/arm/arm32/mpu/head.S         | 91 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h     |  4 ++
 xen/arch/arm/include/asm/mpu/cpregs.h | 30 +++++++++
 5 files changed, 127 insertions(+)
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
index 0000000000..719ae3624e
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/arm32/macros.h>
+#include <asm/mpu/prepare_xen_region.inc>
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
+ * Clobbers r0 - r1
+ */
+FUNC_LOCAL(enable_mpu)
+    /* Set up memory attribute type tables */
+    mov_w r0, MAIR0VAL
+    mov_w r1, MAIR1VAL
+    mcr   CP32(r0, HMAIR0)
+    mcr   CP32(r1, HMAIR1)
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
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index aec9e8f329..6019a2cbdd 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -1,6 +1,10 @@
 #ifndef __ASM_ARM_CPREGS_H
 #define __ASM_ARM_CPREGS_H
 
+#ifdef CONFIG_MPU
+#include <asm/mpu/cpregs.h>
+#endif
+
 /*
  * AArch32 Co-processor registers.
  *
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
new file mode 100644
index 0000000000..66871379a5
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_MPU_CPREGS_H
+#define __ASM_ARM_MPU_CPREGS_H
+
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
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
+#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
+
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


