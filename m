Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F01A888F4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950903.1347080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4N2K-0007MV-K8; Mon, 14 Apr 2025 16:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950903.1347080; Mon, 14 Apr 2025 16:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4N2K-0007L4-G8; Mon, 14 Apr 2025 16:51:56 +0000
Received: by outflank-mailman (input) for mailman id 950903;
 Mon, 14 Apr 2025 16:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4Mwy-0003ls-Ch
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:46:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2417::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec1014e-194f-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 18:46:22 +0200 (CEST)
Received: from DS7PR05CA0082.namprd05.prod.outlook.com (2603:10b6:8:57::23) by
 DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Mon, 14 Apr 2025 16:46:16 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::c) by DS7PR05CA0082.outlook.office365.com
 (2603:10b6:8:57::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.14 via Frontend Transport; Mon,
 14 Apr 2025 16:46:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 16:46:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:46:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:46:15 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 14 Apr 2025 11:46:14 -0500
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
X-Inumbo-ID: fec1014e-194f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyouC0F1VOJPrYxwNG9BIiDftSAGZl2JdkovJLtWUwBDEFos7mSFwlk+vw5ahoGmel/AEmkQldyL1fN4ft84H0vzp24EWIJMOce5Ox9xREvmSxDG9dJPB1beU09qAA5YQfut6KCv2xzNHFcZhtDUsLDsKmH2FLRDSgXSF/6lpnbt/A/3oD7CKtEk+7OXKMzSz7eGnA6eX7viwIxErO4Fals7vt2mxfH44SHtnVCiXPj1Us0Do/Jc2d/zK2u/mMi1GeKoEoXnIqdhW2k4kTe8ecW95x3ELqO8xtRZwg9heuTESVjzhIxxO3z0VxdN2Yf7oWgYyvnhhZSjtGW0Z/klvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNIWLC11mww1ctAKkkxjTtOLEi7G6fnYwxxAr4py6UM=;
 b=h+SWg9Vb1QZP/UaODgcPtfB1aAQvBI0+rm/50929WDAc9ZTArdJYjNda+tX6Dz2CWAzWIDZ2iAPjBpu86+97eNfue4sxk7mat1cA/Ty7cMycJX6rnPrzJrJ1pZe3d6y4XsIpmhjXdkIRRYa0Jgnycky8qNPfislx4RkFx9zJTB+soCIVNDvO6iiLLly16Eymw3tlZo6FD+CzAerIbPLbdFXAY4K4XGFhNtB286FtMlDaWmmZEaEbKonkWS5j02L1Alw9Aq0zgNiRhcEkezwU8RWFsi3+tywzdrjjqeKLU+fyhGvoD0oMXeOkbMZb/3ERkj7zBvhI9/DmTA6WmStv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNIWLC11mww1ctAKkkxjTtOLEi7G6fnYwxxAr4py6UM=;
 b=IgK+ZK8LswMi2LK67SsZCpWiuRD/1L1W9cBsh53UDIOnJKABwIfgovRD+h0ANdsCpRU5IaSghBuLABmbvbngXl28U3eYO+awIlJL+Ibutj85IoyKrFPNkAYV9WFn5pIVs5/sDAihh4x8GzA/W4DFErtWQKuHoFKWKI3aB2svw+U=
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
Subject: [PATCH v7 2/3] xen/arm32: Create the same boot-time MPU regions as arm64
Date: Mon, 14 Apr 2025 17:45:13 +0100
Message-ID: <20250414164514.588373-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ab11f8-a117-4af2-0d7d-08dd7b73e011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AfF9FriVU48jUW3H4JKW2A432M8zrp7NGpvY1r50FK1At5zWIjsqRQ7TvIdF?=
 =?us-ascii?Q?gcYRu9lUur3bPBBpTsRRpU9rWHWuG3+k5ZVdmJFB3soiEMfZ2CTGVWPEqy3p?=
 =?us-ascii?Q?b0ShxtkppE9its+PkMq2hkJBS2PLxVaj8cz1xFJYMx6ChIzecmMdsjdNFzyi?=
 =?us-ascii?Q?jmA1tU8aBPAZ6Xnk1N87EFkT6WGCHs7kTJkTBiIEDYr9XHhRyfxll0XrIBHr?=
 =?us-ascii?Q?u5OYyzepVC3XUcJQj1nxR7ZXkWpG/L4amPSdcNltpEEZAithrBQDDt9x+Abn?=
 =?us-ascii?Q?Nkj/NeWHwupM7LqwUaU04+8RNPf/LAuEfB5SXOCVLLf6lXFRUd7gKaEIXXcd?=
 =?us-ascii?Q?WzxzGKH2CbRFqR3PgU4meRPIHeKhtC+qmYp8v8jJAoGzbxpNgx0IG1ljZ2K6?=
 =?us-ascii?Q?mNq/O5sw4N1oZcL+FOxTt8hCzEADZ34RqiyHEo+GyoTLR7VSdpsq6dTl4WRu?=
 =?us-ascii?Q?/Y27S4g9TTx/FFiYXOJpO5KvX9rV0pxljN7/TXFyMGliXMLbya66ZbL0tCn4?=
 =?us-ascii?Q?GKL44YkgWhCwmU1P5Q3Nt0Pr4+Cs5jHEuUdOGjCdE+mQdGk1mjDcP7wEP36L?=
 =?us-ascii?Q?k5uYsVn/gZ7U3kSu2YcqPqXBtwKdF4NbbI20vFtmI7h5PfvfwLdikF479ILV?=
 =?us-ascii?Q?06KYfRp3ctfU+kO02L29bHQ3tznCa0Fmh7JNE6RrU5ODQHN04hDcEVbd4qLQ?=
 =?us-ascii?Q?SIyqIJa1jsNihzeF4QHWgp/VKFwGj0x0tkBSW3TP7l7qTOLb7Ebn14HEIkxx?=
 =?us-ascii?Q?JEoh5U9dwo6g04MliWwxj8fM761MdV0LI0dtT2YMGKSKf+OrHwkGcjmfxPx2?=
 =?us-ascii?Q?s7zpE/n6MZeTZNbJcT1Wzem5sFxpxyzw5siq4JsGIn9xlLXXy15+Tiq/aRyE?=
 =?us-ascii?Q?MpPqQ1CbTjiuuF0H30qJG2+myFEgrnoqtJwT+PXBRZISFkyb2Yg4bQlOuRJ7?=
 =?us-ascii?Q?aJVeEYcGv7whQIIT89GoqrXG4gLn04ctkZqgUYHUBsXmouSL1VvOs9hE7JAo?=
 =?us-ascii?Q?cn8co7CaKRBU6MyJWS+uWCB0NsWwfaX9KZhyIYCoKby+a89iyJohrs1K8MFQ?=
 =?us-ascii?Q?EB7ogVjkqxKo/7MeRYphZkM2gHFg6Y02nYEv9dplgKu45IIrIUfl6732Xwht?=
 =?us-ascii?Q?hfAxZR3UXLZNRYmoy5p9X31C2SUEsjuKdO9YloUULoaldANpED6OOf7pzd7+?=
 =?us-ascii?Q?xdNhoR/pCuNEEcoqdpHgXVp7Hr70Cv0rfTDOZ8VppSQidLUjOdrN8V/f7yKc?=
 =?us-ascii?Q?XtcPddudJv/aPExb/hvcFCFRbqDUwmzgDQs5+zR/5L/pUAVI80PFe4+8VaSe?=
 =?us-ascii?Q?7L4OzBzb7w0Je2Kp+bnYU1cpMhpw7CahEHyHtpy1wDEHMVqsbOAF5rDdOtMl?=
 =?us-ascii?Q?STypmptmUYZ+MCfSostJ15JttMlGPhunY5Lo23+Z0lCpA3UFALGjNsltR9BX?=
 =?us-ascii?Q?7bfTDDRa9Rk8FX2kp+S6mzhsEnSSsfQGUlVzv/2F/ecmvdG2mULYaLfpnebJ?=
 =?us-ascii?Q?hsACMLJDH/tXTLeDMXzg5i/DvTcDAScwvgDl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:46:16.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ab11f8-a117-4af2-0d7d-08dd7b73e011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525

Create Boot-time MPU protection regions (similar to Armv8-R AArch64) for
Armv8-R AArch32.
Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
XN is 1-bit for arm32.
Define the system registers and macros in mpu/cpregs.h.

Introduce WRITE_SYSREG_ASM() to write to system registers in assembly.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
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

v6 -
1. Coding style issues.

2. Kept Luca's R-b and T-b as the changes should not impact the behavior.

3. Added alias and renamed the sysregs as it is named in the specs.

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   1 +
 xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/sysregs.h |  13 ++-
 xen/arch/arm/include/asm/cpregs.h        |   2 +
 xen/arch/arm/include/asm/mpu/cpregs.h    |  32 +++++++
 6 files changed, 151 insertions(+), 2 deletions(-)
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
index 22871999af..ef1a870fd6 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -20,7 +20,16 @@
  * uses r0 as a placeholder register. */
 #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
 
-#ifndef __ASSEMBLY__
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
+#ifdef __ASSEMBLY__
+
+#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
+
+#else /* __ASSEMBLY__ */
 
 /* C wrappers */
 #define READ_CP32(name...) ({                                   \
@@ -84,7 +93,7 @@
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
 
-#endif /* __ASSEMBLY__ */
+#endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
 /*
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
index 0000000000..d5cd0e04d5
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_CPREGS_H
+#define __ARM_MPU_CPREGS_H
+
+/* CP15 CR0: MPU Type Register */
+#define HMPUIR          p15,4,c0,c0,4
+
+/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
+#define HPRSELR         p15,4,c6,c2,1
+#define HPRBAR          p15,4,c6,c3,0
+#define HPRLAR          p15,4,c6,c8,1
+
+/* Aliases of AArch64 names for use in common code */
+#ifdef CONFIG_ARM_32
+/* Alphabetically... */
+#define MPUIR_EL2       HMPUIR
+#define PRBAR_EL2       HPRBAR
+#define PRLAR_EL2       HPRLAR
+#define PRSELR_EL2      HPRSELR
+#endif /* CONFIG_ARM_32 */
+
+#endif /* __ARM_MPU_CPREGS_H */
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
2.25.1


