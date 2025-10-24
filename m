Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE2C0700E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150562.1481677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrM-0004Dg-D2; Fri, 24 Oct 2025 15:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150562.1481677; Fri, 24 Oct 2025 15:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrM-00048c-8F; Fri, 24 Oct 2025 15:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1150562;
 Fri, 24 Oct 2025 15:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEVg=5B=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vCJrK-0003nv-Si
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:37:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5f0f4677-b0ef-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:37:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCA41D34;
 Fri, 24 Oct 2025 08:37:30 -0700 (PDT)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 096CF3F63F;
 Fri, 24 Oct 2025 08:37:36 -0700 (PDT)
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
X-Inumbo-ID: 5f0f4677-b0ef-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Harry Ramsey <yourmail@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] arm: Implement setup_mm for MPU systems
Date: Fri, 24 Oct 2025 16:37:17 +0100
Message-ID: <20251024153719.408806-2-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024153719.408806-1-harry.ramsey@arm.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harry Ramsey <your mail@arm.com>

Implement `setup_mm` for MPU systems. This variant does not require
setting up a direct map.

To reduce code duplication the common initalisation code for both MPU
and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
setup steps are now handled by a new helper function `setup_mm_helper`.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/arm64/mmu/mm.c   | 26 +-------------------
 xen/arch/arm/include/asm/mm.h |  2 ++
 xen/arch/arm/mm.c             | 45 +++++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c         | 30 +++++++++++++++++++++--
 4 files changed, 76 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 3e64be6ae6..70b53be032 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -4,8 +4,6 @@
 #include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
-#include <xen/static-memory.h>
-#include <xen/static-shmem.h>
 
 #include <asm/setup.h>
 
@@ -240,33 +238,18 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
         panic("Unable to setup the directmap mappings.\n");
 }
 
-void __init setup_mm(void)
+void __init setup_mm_helper(void)
 {
     const struct membanks *banks = bootinfo_get_mem();
     paddr_t ram_start = INVALID_PADDR;
     paddr_t ram_end = 0;
-    paddr_t ram_size = 0;
     unsigned int i;
 
-    init_pdx();
-
-    /*
-     * We need some memory to allocate the page-tables used for the directmap
-     * mappings. But some regions may contain memory already allocated
-     * for other uses (e.g. modules, reserved-memory...).
-     *
-     * For simplicity, add all the free regions in the boot allocator.
-     */
-    populate_boot_allocator();
-
-    total_pages = 0;
-
     for ( i = 0; i < banks->nr_banks; i++ )
     {
         const struct membank *bank = &banks->bank[i];
         paddr_t bank_end = bank->start + bank->size;
 
-        ram_size = ram_size + bank->size;
         ram_start = min(ram_start, bank->start);
         ram_end = max(ram_end, bank_end);
 
@@ -274,16 +257,9 @@ void __init setup_mm(void)
                                  PFN_DOWN(bank->size));
     }
 
-    total_pages += ram_size >> PAGE_SHIFT;
-
     directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
     directmap_mfn_start = maddr_to_mfn(ram_start);
     directmap_mfn_end = maddr_to_mfn(ram_end);
-
-    setup_frametable_mappings(ram_start, ram_end);
-
-    init_staticmem_pages();
-    init_sharedmem_pages();
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 7a93dad2ed..1f5b41e602 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -202,6 +202,8 @@ extern void remove_early_mappings(void);
 extern int prepare_secondary_mm(int cpu);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
+/* Helper function to setup memory management */
+extern void setup_mm_helper(void);
 /* map a physical range in virtual memory */
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 3b05b46ee0..f26c28aaf5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -12,8 +12,12 @@
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
 #include <xen/mm.h>
+#include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 #include <xen/vmap.h>
 
+#include <asm/setup.h>
+
 #include <xsm/xsm.h>
 
 #include <public/memory.h>
@@ -24,6 +28,47 @@
 
 unsigned long frametable_base_pdx __read_mostly;
 
+#if !defined(CONFIG_ARM_32) || defined(CONFIG_MPU)
+void __init setup_mm(void)
+{
+    const struct membanks *banks = bootinfo_get_mem();
+    paddr_t ram_start = INVALID_PADDR;
+    paddr_t ram_end = 0;
+    paddr_t ram_size = 0;
+    unsigned int i;
+
+    init_pdx();
+
+    /*
+     * We need some memory to allocate the page-tables used for the directmap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplicity, add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        ram_size = ram_size + bank->size;
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
+    }
+
+    total_pages = ram_size >> PAGE_SHIFT;
+
+    setup_mm_helper();
+
+    setup_frametable_mappings(ram_start, ram_end);
+
+    init_staticmem_pages();
+    init_sharedmem_pages();
+}
+#endif
+
 bool flags_has_rwx(unsigned int flags)
 {
     /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 3f155b7db2..a058db19ef 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -8,9 +8,11 @@
 #include <xen/sizes.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
+#include <xen/pfn.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
 #include <asm/page.h>
+#include <asm/setup.h>
 #include <asm/sysregs.h>
 
 struct page_info *frame_table;
@@ -378,9 +380,33 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
     return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
 }
 
-void __init setup_mm(void)
+/*
+ * Heap must be statically configured in Device Tree through "xen,static-heap"
+ * on MPU systems, use setup_mm_helper() for that.
+ */
+void __init setup_mm_helper(void)
 {
-    BUG_ON("unimplemented");
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    unsigned int bank = 0;
+
+    for ( ; bank < reserved_mem->nr_banks; bank++ )
+    {
+        if ( reserved_mem->bank[bank].type == MEMBANK_STATIC_HEAP )
+        {
+            paddr_t bank_start = round_pgup(reserved_mem->bank[bank].start);
+            paddr_t bank_size = round_pgdown(reserved_mem->bank[bank].size);
+            paddr_t bank_end = bank_start + bank_size;
+
+            /* Map static heap with one MPU protection region */
+            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
+                panic("Failed to map static heap\n");
+
+            break;
+        }
+    }
+
+    if ( bank == reserved_mem->nr_banks )
+        panic("No static heap memory bank found\n");
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
-- 
2.43.0


