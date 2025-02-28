Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEEA49E90
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898968.1307495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34U-00061u-In; Fri, 28 Feb 2025 16:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898968.1307495; Fri, 28 Feb 2025 16:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34U-0005yO-Dk; Fri, 28 Feb 2025 16:18:42 +0000
Received: by outflank-mailman (input) for mailman id 898968;
 Fri, 28 Feb 2025 16:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34S-0003Uh-W9
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id aa9850cf-f5ef-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 17:18:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C84871515;
 Fri, 28 Feb 2025 08:18:52 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03F03F5A1;
 Fri, 28 Feb 2025 08:18:36 -0800 (PST)
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
X-Inumbo-ID: aa9850cf-f5ef-11ef-9898-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 9/9] arm/mpu: Implement setup_mappings for MPU system
Date: Fri, 28 Feb 2025 16:18:17 +0000
Message-Id: <20250228161817.3342443-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the function setup_pagetables() take care to initialise
the mappings on MMU system; MPU systems don't have page tables,
but needs to track the status of the MPU programmed regions.

So rename setup_pagetables() into setup_mappings() and implement the
function on MPU systems, start introducing data structures and functions
to track the MPU status from the C world.

The xen_mpumap_mask bitmap is used to track which MPU region are
enabled at runtime.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h |  2 ++
 xen/arch/arm/include/asm/mm.h        |  2 +-
 xen/arch/arm/mmu/setup.c             |  2 +-
 xen/arch/arm/mpu/mm.c                | 12 +++++++++
 xen/arch/arm/mpu/setup.c             | 40 ++++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  2 +-
 6 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index dce77da60110..4b7579d0ce18 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -17,6 +17,8 @@
 
 #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
 
+#define PRENR_MASK              GENMASK(31, 0)
+
 /* Access permission attributes. */
 /* Read/Write at EL2, No Access at EL1/EL0. */
 #define AP_RW_EL2 0x0
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index e7767cdab493..370054554432 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -206,7 +206,7 @@ extern unsigned long frametable_base_pdx;
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
-extern void setup_pagetables(void);
+extern void setup_mappings(void);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe9778194..35ffa5479dd3 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -354,7 +354,7 @@ static void __init create_llc_coloring_mappings(void)
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
  */
-void __init setup_pagetables(void)
+void __init setup_mappings(void)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index fb94f5d1d93d..4614c36f04cc 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -8,10 +8,22 @@
  *
  */
 
+#include <xen/init.h>
 #include <asm/mpu/mm.h>
 #include <asm/page.h>
 #include <asm/sysregs.h>
 
+/* Maximum number of supported MPU memory regions by the EL2 MPU. */
+uint8_t __ro_after_init max_xen_mpumap;
+
+/*
+ * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
+ * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
+ * region 1, ..., and so on.
+ * If a MPU memory region gets enabled, set the according bit to 1.
+ */
+DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
+
 /* EL2 Xen MPU memory region mapping table. */
 pr_t xen_mpumap[MAX_MPU_REGIONS];
 
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index 290baaca9fd7..b37f309ec8e3 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -14,6 +14,46 @@
 /* Needs to be kept in sync with the regions programmed in arm64/mpu/head.S */
 #define EARLY_FDT_MAP_REGION_NUMBER 6
 
+extern uint8_t max_xen_mpumap;
+extern DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
+extern pr_t xen_mpumap[MAX_MPU_REGIONS];
+
+/*
+ * The code in this function needs to track the regions programmed in
+ * arm64/mpu/head.S
+ */
+void __init setup_mappings(void)
+{
+    register_t prenr;
+    unsigned int i = 0;
+
+    /*
+     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
+     * the EL2 MPU.
+     */
+    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
+
+    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
+    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
+
+    /*
+     * Set the bitfield for regions enabled in assembly boot-time.
+     * This code works under the assumption that the code in head.S has
+     * allocated and enabled regions below 32 (N < 32).
+     */
+    while ( prenr > 0 )
+    {
+        if (prenr & 0x1)
+        {
+            set_bit(i, xen_mpumap_mask);
+            read_protection_region(&xen_mpumap[i], i);
+        }
+
+        prenr >>= 1;
+        i++;
+    }
+}
+
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* Map at least a page containing the DTB address, exclusive range */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d43..fc6c9456bc2e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -340,7 +340,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
      * Page tables must be setup after LLC coloring initialization because
      * coloring info are required in order to create colored mappings
      */
-    setup_pagetables();
+    setup_mappings();
     /* Device-tree was mapped in boot page tables, remap it in the new tables */
     device_tree_flattened = early_fdt_map(fdt_paddr);
 
-- 
2.34.1


