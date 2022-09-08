Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197915B13B8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 06:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402635.644503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW97J-0001cP-06; Thu, 08 Sep 2022 04:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402635.644503; Thu, 08 Sep 2022 04:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW97I-0001Yz-Si; Thu, 08 Sep 2022 04:26:16 +0000
Received: by outflank-mailman (input) for mailman id 402635;
 Thu, 08 Sep 2022 04:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oW97H-000054-D2
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 04:26:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5fb00d8a-2f2e-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 06:26:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16D5D6E;
 Wed,  7 Sep 2022 21:26:19 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A4003F7B4;
 Wed,  7 Sep 2022 21:26:10 -0700 (PDT)
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
X-Inumbo-ID: 5fb00d8a-2f2e-11ed-a016-b9edf5238543
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 4/4] xen/arm: Handle static heap pages in boot and heap allocator
Date: Thu,  8 Sep 2022 04:25:38 +0000
Message-Id: <20220908042538.27076-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908042538.27076-1-Henry.Wang@arm.com>
References: <20220908042538.27076-1-Henry.Wang@arm.com>

This commit firstly adds a bool field `static_heap` to bootinfo.
This newly introduced field is set at the device tree parsing time
if the static heap ranges are defined in the device tree chosen
node.

For Arm32, In `setup_mm`, if the static heap is enabled, we use the
static heap region for both domheap and xenheap allocation. Note
that the xenheap on Arm32 should be always contiguous, so also add
a helper fit_xenheap_in_static_heap() for Arm32 to find the required
xenheap in the static heap regions.

For Arm64, In `setup_mm`, if the static heap is enabled and used,
we make sure that only these static heap pages are added to the boot
allocator. These static heap pages in the boot allocator are
added to the heap allocator at `end_boot_allocator()`.

If the static heap is disabled, we stick to current page allocation
strategy at boot time.

Also, take the chance to correct a "double not" print in Arm32
`setup_mm()` and replace the open-coding address ~0 by INVALID_PADDR.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes from v4 to v5:
- No changes.
Changes from v3 to v4:
- Add Julien's Reviewed-by.
Changes from v2 to v3:
- Adjustment of the terminology change to "static heap".
- Change of wording in comments.
- int i -> unsigned int i.
- Avoid extra indentation by reverting the check of MEMBANK_RSVD_HEAP.
- Use MB(32).
- Drop unnecessary panic and unused variables.
- Avoid the ternary operation in assigning the heap_pages.
- Rework populate_boot_allocator() for static heap.
Changes from v1 to v2:
- Move the global bool `reserved_heap` to bootinfo.
- Replace the open open-coding address ~0 by INVALID_PADDR.
- Do not use reverted logic in heap_pages calculation.
- Remove unused Arm32 reserved_heap_start variable.
- Decouple the arm32 reserved heap too small size check with region
  end check.
- Reuse the arm32 original xenheap finding logic with the new helper
  to make sure xenheap on arm32 is contiguous.
Changes from RFC to v1:
- Rebase on top of latest `setup_mm()` changes.
- Added Arm32 logic in `setup_mm()`.
---
 xen/arch/arm/bootfdt.c           |   2 +
 xen/arch/arm/include/asm/setup.h |   1 +
 xen/arch/arm/setup.c             | 118 +++++++++++++++++++++++++++----
 3 files changed, 107 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index b4536aed68..b092dbc21b 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -319,6 +319,8 @@ static int __init process_chosen_node(const void *fdt, int node,
                                      MEMBANK_STATIC_HEAP);
         if ( rc )
             return rc;
+
+        bootinfo.static_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 09188acae8..5b86cf0245 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -97,6 +97,7 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
 #endif
+    bool static_heap;
 };
 
 struct map_range_data
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 9f3838d004..e0f9809d7e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -556,6 +556,44 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     }
     return e;
 }
+
+/*
+ * Find a contiguous region that fits in the static heap region with
+ * required size and alignment, and return the end address of the region
+ * if found otherwise 0.
+ */
+static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
+{
+    unsigned int i;
+    paddr_t end = 0, aligned_start, aligned_end;
+    paddr_t bank_start, bank_size, bank_end;
+
+    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+            continue;
+
+        bank_start = bootinfo.reserved_mem.bank[i].start;
+        bank_size = bootinfo.reserved_mem.bank[i].size;
+        bank_end = bank_start + bank_size;
+
+        if ( bank_size < size )
+            continue;
+
+        aligned_end = bank_end & ~(align - 1);
+        aligned_start = (aligned_end - size) & ~(align - 1);
+
+        if ( aligned_start > bank_start )
+            /*
+             * Allocate the xenheap as high as possible to keep low-memory
+             * available (assuming the admin supplied region below 4GB)
+             * for other use (e.g. domain memory allocation).
+             */
+            end = max(end, aligned_end);
+    }
+
+    return end;
+}
 #endif
 
 /*
@@ -661,22 +699,51 @@ static void __init init_staticmem_pages(void)
 }
 
 /*
- * Populate the boot allocator. All the RAM but the following regions
- * will be added:
+ * Populate the boot allocator.
+ * If a static heap was not provided by the admin, all the RAM but the
+ * following regions will be added:
  *  - Modules (e.g., Xen, Kernel)
  *  - Reserved regions
  *  - Xenheap (arm32 only)
+ * If a static heap was provided by the admin, populate the boot
+ * allocator with the corresponding regions only, but with Xenheap excluded
+ * on arm32.
  */
 static void __init populate_boot_allocator(void)
 {
     unsigned int i;
     const struct meminfo *banks = &bootinfo.mem;
+    paddr_t s, e;
+
+    if ( bootinfo.static_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+                continue;
+
+            s = bootinfo.reserved_mem.bank[i].start;
+            e = s + bootinfo.reserved_mem.bank[i].size;
+#ifdef CONFIG_ARM_32
+            /* Avoid the xenheap, note that the xenheap cannot across a bank */
+            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
+                 e >= mfn_to_maddr(directmap_mfn_end) )
+            {
+                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
+                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
+            }
+            else
+#endif
+                init_boot_pages(s, e);
+        }
+
+        return;
+    }
 
     for ( i = 0; i < banks->nr_banks; i++ )
     {
         const struct membank *bank = &banks->bank[i];
         paddr_t bank_end = bank->start + bank->size;
-        paddr_t s, e;
 
         s = bank->start;
         while ( s < bank_end )
@@ -714,8 +781,8 @@ static void __init populate_boot_allocator(void)
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
-    paddr_t ram_start, ram_end, ram_size, e;
-    unsigned long ram_pages;
+    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
+    paddr_t static_heap_end = 0, static_heap_size = 0;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
@@ -735,30 +802,51 @@ static void __init setup_mm(void)
 
     for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
     {
-        paddr_t bank_start = bootinfo.mem.bank[i].start;
-        paddr_t bank_size = bootinfo.mem.bank[i].size;
-        paddr_t bank_end = bank_start + bank_size;
+        bank_start = bootinfo.mem.bank[i].start;
+        bank_size = bootinfo.mem.bank[i].size;
+        bank_end = bank_start + bank_size;
 
         ram_size  = ram_size + bank_size;
         ram_start = min(ram_start,bank_start);
         ram_end   = max(ram_end,bank_end);
     }
 
-    total_pages = ram_pages = ram_size >> PAGE_SHIFT;
+    total_pages = ram_size >> PAGE_SHIFT;
+
+    if ( bootinfo.static_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+                continue;
+
+            bank_start = bootinfo.reserved_mem.bank[i].start;
+            bank_size = bootinfo.reserved_mem.bank[i].size;
+            bank_end = bank_start + bank_size;
+
+            static_heap_size += bank_size;
+            static_heap_end = max(static_heap_end, bank_end);
+        }
+
+        heap_pages = static_heap_size >> PAGE_SHIFT;
+    }
+    else
+        heap_pages = total_pages;
 
     /*
      * If the user has not requested otherwise via the command line
      * then locate the xenheap using these constraints:
      *
+     *  - must be contiguous
      *  - must be 32 MiB aligned
      *  - must not include Xen itself or the boot modules
-     *  - must be at most 1GB or 1/32 the total RAM in the system if less
+     *  - must be at most 1GB or 1/32 the total RAM in the system (or static
+          heap if enabled) if less
      *  - must be at least 32M
      *
      * We try to allocate the largest xenheap possible within these
      * constraints.
      */
-    heap_pages = ram_pages;
     if ( opt_xenheap_megabytes )
         xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
     else
@@ -770,7 +858,9 @@ static void __init setup_mm(void)
 
     do
     {
-        e = consider_modules(ram_start, ram_end,
+        e = bootinfo.static_heap ?
+            fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
+            consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
                              32<<20, 0);
         if ( e )
@@ -780,7 +870,7 @@ static void __init setup_mm(void)
     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
 
     if ( ! e )
-        panic("Not not enough space for xenheap\n");
+        panic("Not enough space for xenheap\n");
 
     domheap_pages = heap_pages - xenheap_pages;
 
@@ -825,7 +915,7 @@ static void __init setup_mm(void)
 static void __init setup_mm(void)
 {
     const struct meminfo *banks = &bootinfo.mem;
-    paddr_t ram_start = ~0;
+    paddr_t ram_start = INVALID_PADDR;
     paddr_t ram_end = 0;
     paddr_t ram_size = 0;
     unsigned int i;
-- 
2.17.1


