Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D75B13B7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 06:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402632.644492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW97F-0001CI-Ge; Thu, 08 Sep 2022 04:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402632.644492; Thu, 08 Sep 2022 04:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW97F-0001AO-Cv; Thu, 08 Sep 2022 04:26:13 +0000
Received: by outflank-mailman (input) for mailman id 402632;
 Thu, 08 Sep 2022 04:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oW97D-00005q-Rn
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 04:26:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5d7ab239-2f2e-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 06:26:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E102106F;
 Wed,  7 Sep 2022 21:26:16 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B7A03F7B4;
 Wed,  7 Sep 2022 21:26:07 -0700 (PDT)
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
X-Inumbo-ID: 5d7ab239-2f2e-11ed-af93-0125da4c0113
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/4] xen/arm: mm: Rename xenheap_* variable to directmap_*
Date: Thu,  8 Sep 2022 04:25:37 +0000
Message-Id: <20220908042538.27076-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908042538.27076-1-Henry.Wang@arm.com>
References: <20220908042538.27076-1-Henry.Wang@arm.com>

With the static heap setup, keep using xenheap_* in the function
setup_xenheap_mappings() will make the code confusing to read,
because we always need to map the full RAM on Arm64. Therefore,
renaming all "xenheap_*" variables to "directmap_*" to make clear
the area is used to access the RAM easily.

On Arm32, only the xenheap is direct mapped today. So the renaming
to "directmap_*" would be still valid for Arm32.

As the xenheap_* is renamed to directmap_*, rename the function
setup_xenheap_mappings() to setup_directmap_mappings() to reflect
the variable renaming, also change the code comment and printed
error message in the function accordingly.

No functional change is intended.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from v4 to v5:
- Mention the function and code comment rename in commit mesg.
- Add Julien's Acked-by.
Changes from v3 to v4:
- Also rename the setup_xenheap_mappings() function name and
  printed messages inside the function.
- Update more comments.
Changes from v2 to v3:
- Adjust the order of this patch, make it #3.
Changes from v1 to v2:
- New commit.
---
 xen/arch/arm/bootfdt.c            |  2 +-
 xen/arch/arm/include/asm/config.h |  2 +-
 xen/arch/arm/include/asm/mm.h     | 31 ++++++++++---------
 xen/arch/arm/mm.c                 | 50 +++++++++++++++++--------------
 xen/arch/arm/setup.c              | 36 +++++++++++-----------
 5 files changed, 64 insertions(+), 57 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 3c98c00981..b4536aed68 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -500,7 +500,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
 
     /*
-     * On Arm64 setup_xenheap_mappings() expects to be called with the lowest
+     * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide
      * the banks sorted in ascending order. So sort them through.
      */
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 2fafb9f228..0fefed1b8a 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -160,7 +160,7 @@
 #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
 #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
 
-#define XENHEAP_VIRT_START     xenheap_virt_start
+#define XENHEAP_VIRT_START     directmap_virt_start
 
 #define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 749fbefa0c..7d21120f98 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -154,19 +154,19 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
-extern mfn_t xenheap_mfn_start, xenheap_mfn_end;
-extern vaddr_t xenheap_virt_end;
+extern mfn_t directmap_mfn_start, directmap_mfn_end;
+extern vaddr_t directmap_virt_end;
 #ifdef CONFIG_ARM_64
-extern vaddr_t xenheap_virt_start;
-extern unsigned long xenheap_base_pdx;
+extern vaddr_t directmap_virt_start;
+extern unsigned long directmap_base_pdx;
 #endif
 
 #ifdef CONFIG_ARM_32
 #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
 #define is_xen_heap_mfn(mfn) ({                                 \
     unsigned long mfn_ = mfn_x(mfn);                            \
-    (mfn_ >= mfn_x(xenheap_mfn_start) &&                        \
-     mfn_ < mfn_x(xenheap_mfn_end));                            \
+    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
+     mfn_ < mfn_x(directmap_mfn_end));                          \
 })
 #else
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
@@ -203,9 +203,12 @@ extern void remove_early_mappings(void);
 extern int init_secondary_pagetables(int cpu);
 /* Switch secondary CPUS to its own pagetables and finalise MMU setup */
 extern void mmu_init_secondary_cpu(void);
-/* Set up the xenheap: up to 1GB of contiguous, always-mapped memory.
- * Base must be 32MB aligned and size a multiple of 32MB. */
-extern void setup_xenheap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
+/*
+ * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
+ * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
+ * For Arm64, map the region in the directmap area.
+ */
+extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
@@ -267,16 +270,16 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
 static inline void *maddr_to_virt(paddr_t ma)
 {
     ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
-    ma -= mfn_to_maddr(xenheap_mfn_start);
+    ma -= mfn_to_maddr(directmap_mfn_start);
     return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
 }
 #else
 static inline void *maddr_to_virt(paddr_t ma)
 {
-    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - xenheap_base_pdx) <
+    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
            (DIRECTMAP_SIZE >> PAGE_SHIFT));
     return (void *)(XENHEAP_VIRT_START -
-                    (xenheap_base_pdx << PAGE_SHIFT) +
+                    (directmap_base_pdx << PAGE_SHIFT) +
                     ((ma & ma_va_bottom_mask) |
                      ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
 }
@@ -319,10 +322,10 @@ static inline struct page_info *virt_to_page(const void *v)
     unsigned long pdx;
 
     ASSERT(va >= XENHEAP_VIRT_START);
-    ASSERT(va < xenheap_virt_end);
+    ASSERT(va < directmap_virt_end);
 
     pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
-    pdx += mfn_to_pdx(xenheap_mfn_start);
+    pdx += mfn_to_pdx(directmap_mfn_start);
     return frame_table + pdx - frametable_base_pdx;
 }
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 7f5b317d3e..11ee49598b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -132,12 +132,12 @@ uint64_t init_ttbr;
 static paddr_t phys_offset;
 
 /* Limits of the Xen heap */
-mfn_t xenheap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
-mfn_t xenheap_mfn_end __read_mostly;
-vaddr_t xenheap_virt_end __read_mostly;
+mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
+mfn_t directmap_mfn_end __read_mostly;
+vaddr_t directmap_virt_end __read_mostly;
 #ifdef CONFIG_ARM_64
-vaddr_t xenheap_virt_start __read_mostly;
-unsigned long xenheap_base_pdx __read_mostly;
+vaddr_t directmap_virt_start __read_mostly;
+unsigned long directmap_base_pdx __read_mostly;
 #endif
 
 unsigned long frametable_base_pdx __read_mostly;
@@ -597,55 +597,59 @@ void mmu_init_secondary_cpu(void)
 }
 
 #ifdef CONFIG_ARM_32
-/* Set up the xenheap: up to 1GB of contiguous, always-mapped memory. */
-void __init setup_xenheap_mappings(unsigned long base_mfn,
-                                   unsigned long nr_mfns)
+/*
+ * Set up the direct-mapped xenheap:
+ * up to 1GB of contiguous, always-mapped memory.
+ */
+void __init setup_directmap_mappings(unsigned long base_mfn,
+                                     unsigned long nr_mfns)
 {
     int rc;
 
     rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
                           PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
     if ( rc )
-        panic("Unable to setup the xenheap mappings.\n");
+        panic("Unable to setup the directmap mappings.\n");
 
-    /* Record where the xenheap is, for translation routines. */
-    xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
+    /* Record where the directmap is, for translation routines. */
+    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
 }
 #else /* CONFIG_ARM_64 */
-void __init setup_xenheap_mappings(unsigned long base_mfn,
-                                   unsigned long nr_mfns)
+/* Map the region in the directmap area. */
+void __init setup_directmap_mappings(unsigned long base_mfn,
+                                     unsigned long nr_mfns)
 {
     int rc;
 
-    /* First call sets the xenheap physical and virtual offset. */
-    if ( mfn_eq(xenheap_mfn_start, INVALID_MFN) )
+    /* First call sets the directmap physical and virtual offset. */
+    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
     {
         unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
 
-        xenheap_mfn_start = _mfn(base_mfn);
-        xenheap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
+        directmap_mfn_start = _mfn(base_mfn);
+        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
         /*
          * The base address may not be aligned to the first level
          * size (e.g. 1GB when using 4KB pages). This would prevent
          * superpage mappings for all the regions because the virtual
          * address and machine address should both be suitably aligned.
          *
-         * Prevent that by offsetting the start of the xenheap virtual
+         * Prevent that by offsetting the start of the directmap virtual
          * address.
          */
-        xenheap_virt_start = DIRECTMAP_VIRT_START +
+        directmap_virt_start = DIRECTMAP_VIRT_START +
             (base_mfn - mfn_gb) * PAGE_SIZE;
     }
 
-    if ( base_mfn < mfn_x(xenheap_mfn_start) )
-        panic("cannot add xenheap mapping at %lx below heap start %lx\n",
-              base_mfn, mfn_x(xenheap_mfn_start));
+    if ( base_mfn < mfn_x(directmap_mfn_start) )
+        panic("cannot add directmap mapping at %lx below heap start %lx\n",
+              base_mfn, mfn_x(directmap_mfn_start));
 
     rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
                           _mfn(base_mfn), nr_mfns,
                           PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
     if ( rc )
-        panic("Unable to setup the xenheap mappings.\n");
+        panic("Unable to setup the directmap mappings.\n");
 }
 #endif
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3c36c050bf..9f3838d004 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -697,11 +697,11 @@ static void __init populate_boot_allocator(void)
 
 #ifdef CONFIG_ARM_32
             /* Avoid the xenheap */
-            if ( s < mfn_to_maddr(xenheap_mfn_end) &&
-                 mfn_to_maddr(xenheap_mfn_start) < e )
+            if ( s < mfn_to_maddr(directmap_mfn_end) &&
+                 mfn_to_maddr(directmap_mfn_start) < e )
             {
-                e = mfn_to_maddr(xenheap_mfn_start);
-                n = mfn_to_maddr(xenheap_mfn_end);
+                e = mfn_to_maddr(directmap_mfn_start);
+                n = mfn_to_maddr(directmap_mfn_end);
             }
 #endif
 
@@ -791,17 +791,17 @@ static void __init setup_mm(void)
 
     /*
      * We need some memory to allocate the page-tables used for the
-     * xenheap mappings. So populate the boot allocator first.
+     * directmap mappings. So populate the boot allocator first.
      *
-     * This requires us to set xenheap_mfn_{start, end} first so the Xenheap
-     * region can be avoided.
+     * This requires us to set directmap_mfn_{start, end} first so the
+     * direct-mapped Xenheap region can be avoided.
      */
-    xenheap_mfn_start = _mfn((e >> PAGE_SHIFT) - xenheap_pages);
-    xenheap_mfn_end = mfn_add(xenheap_mfn_start, xenheap_pages);
+    directmap_mfn_start = _mfn((e >> PAGE_SHIFT) - xenheap_pages);
+    directmap_mfn_end = mfn_add(directmap_mfn_start, xenheap_pages);
 
     populate_boot_allocator();
 
-    setup_xenheap_mappings(mfn_x(xenheap_mfn_start), xenheap_pages);
+    setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
 
     /* Frame table covers all of RAM region, including holes */
     setup_frametable_mappings(ram_start, ram_end);
@@ -816,8 +816,8 @@ static void __init setup_mm(void)
               smp_processor_id());
 
     /* Add xenheap memory that was not already added to the boot allocator. */
-    init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
-                       mfn_to_maddr(xenheap_mfn_end));
+    init_xenheap_pages(mfn_to_maddr(directmap_mfn_start),
+                       mfn_to_maddr(directmap_mfn_end));
 
     init_staticmem_pages();
 }
@@ -833,7 +833,7 @@ static void __init setup_mm(void)
     init_pdx();
 
     /*
-     * We need some memory to allocate the page-tables used for the xenheap
+     * We need some memory to allocate the page-tables used for the directmap
      * mappings. But some regions may contain memory already allocated
      * for other uses (e.g. modules, reserved-memory...).
      *
@@ -852,15 +852,15 @@ static void __init setup_mm(void)
         ram_start = min(ram_start, bank->start);
         ram_end = max(ram_end, bank_end);
 
-        setup_xenheap_mappings(PFN_DOWN(bank->start),
-                               PFN_DOWN(bank->size));
+        setup_directmap_mappings(PFN_DOWN(bank->start),
+                                 PFN_DOWN(bank->size));
     }
 
     total_pages += ram_size >> PAGE_SHIFT;
 
-    xenheap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
-    xenheap_mfn_start = maddr_to_mfn(ram_start);
-    xenheap_mfn_end = maddr_to_mfn(ram_end);
+    directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
+    directmap_mfn_start = maddr_to_mfn(ram_start);
+    directmap_mfn_end = maddr_to_mfn(ram_end);
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
-- 
2.17.1


