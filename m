Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77A5ACC15
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 09:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398534.639423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6Vq-0002fZ-2F; Mon, 05 Sep 2022 07:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398534.639423; Mon, 05 Sep 2022 07:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6Vp-0002bZ-Td; Mon, 05 Sep 2022 07:27:17 +0000
Received: by outflank-mailman (input) for mailman id 398534;
 Mon, 05 Sep 2022 07:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oV6Vn-0001oQ-M0
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 07:27:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 29a410c7-2cec-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 09:27:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA22BED1;
 Mon,  5 Sep 2022 00:27:19 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4F9A3F73D;
 Mon,  5 Sep 2022 00:27:39 -0700 (PDT)
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
X-Inumbo-ID: 29a410c7-2cec-11ed-a016-b9edf5238543
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and heap allocator
Date: Mon,  5 Sep 2022 07:26:34 +0000
Message-Id: <20220905072635.16294-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905072635.16294-1-Henry.Wang@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>

This commit firstly adds a bool field `reserved_heap` to bootinfo.
This newly introduced field is set at the device tree parsing time
if the reserved heap ranges are defined in the device tree chosen
node.

For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
the reserved heap region for both domheap and xenheap allocation.
Note that the xenheap on Arm32 should be always contiguous, so also
add a helper fit_xenheap_in_reserved_heap() for Arm32 to find the
required xenheap in the reserved heap regions.

For Arm64, In `setup_mm`, if the reserved heap is enabled and used,
we make sure that only these reserved heap pages are added to the
boot allocator. These reserved heap pages in the boot allocator are
added to the heap allocator at `end_boot_allocator()`.

If the reserved heap is disabled, we stick to current page allocation
strategy at boot time.

Also, take the chance to correct a "double not" print in Arm32
`setup_mm()` and replace the open-coding address ~0 by INVALID_PADDR.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
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
 xen/arch/arm/setup.c             | 116 +++++++++++++++++++++++++++----
 3 files changed, 104 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 3796a4bd75..616bf5ce47 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -322,6 +322,8 @@ static int __init process_chosen_node(const void *fdt, int node,
                                      &bootinfo.reserved_mem, MEMBANK_RSVD_HEAP);
         if ( rc )
             return rc;
+
+        bootinfo.reserved_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d0cc556833..22fb950bc8 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -82,6 +82,7 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
 #endif
+    bool reserved_heap;
 };
 
 struct map_range_data
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 8d3f859982..0b4f7cb909 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -556,6 +556,43 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     }
     return e;
 }
+
+/*
+ * Find the contiguous xenheap region that fits in the reserved heap region with
+ * required size and alignment, and return the end address of xenheap.
+ */
+static paddr_t __init fit_xenheap_in_reserved_heap(uint32_t size, paddr_t align)
+{
+    int i;
+    paddr_t end = 0, aligned_start, aligned_end;
+    paddr_t bank_start, bank_size, bank_end;
+
+    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
+        {
+            bank_start = bootinfo.reserved_mem.bank[i].start;
+            bank_size = bootinfo.reserved_mem.bank[i].size;
+            bank_end = bank_start + bank_size;
+
+            if ( bank_size < size )
+                continue;
+
+            aligned_end = bank_end & ~(align - 1);
+            aligned_start = (aligned_end - size) & ~(align - 1);
+
+            if ( aligned_start > bank_start )
+                /*
+                 * Arm32 allocates xenheap from higher address to lower, so if
+                 * there are multiple memory banks that satisfy the requirement,
+                 * use the highest bank.
+                 */
+                end = max(end, aligned_end);
+        }
+    }
+
+    return end;
+}
 #endif
 
 /*
@@ -713,8 +750,9 @@ static void __init populate_boot_allocator(void)
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
-    paddr_t ram_start, ram_end, ram_size, e;
-    unsigned long ram_pages;
+    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
+    paddr_t reserved_heap_end = 0, reserved_heap_size = 0;
+    unsigned long ram_pages, reserved_heap_pages = 0;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
@@ -734,9 +772,9 @@ static void __init setup_mm(void)
 
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
@@ -745,19 +783,42 @@ static void __init setup_mm(void)
 
     total_pages = ram_pages = ram_size >> PAGE_SHIFT;
 
+    if ( bootinfo.reserved_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
+            {
+                bank_start = bootinfo.reserved_mem.bank[i].start;
+                bank_size = bootinfo.reserved_mem.bank[i].size;
+                bank_end = bank_start + bank_size;
+
+                reserved_heap_size += bank_size;
+                reserved_heap_end = max(reserved_heap_end, bank_end);
+            }
+        }
+
+        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
+        if ( reserved_heap_pages < 32<<(20-PAGE_SHIFT) )
+            panic("Too small reserved heap region, should be at least 32M\n");
+    }
+
     /*
      * If the user has not requested otherwise via the command line
      * then locate the xenheap using these constraints:
      *
      *  - must be 32 MiB aligned
      *  - must not include Xen itself or the boot modules
-     *  - must be at most 1GB or 1/32 the total RAM in the system if less
+     *  - must be at most 1GB or 1/32 the total RAM in the system
+     *    (there is no reserved heap) or 1/32 the total reserved
+     *    heap region (there is reserved heap) if less
      *  - must be at least 32M
      *
      * We try to allocate the largest xenheap possible within these
      * constraints.
      */
-    heap_pages = ram_pages;
+    heap_pages = bootinfo.reserved_heap ? reserved_heap_pages : ram_pages;
+
     if ( opt_xenheap_megabytes )
         xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
     else
@@ -767,9 +828,15 @@ static void __init setup_mm(void)
         xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
     }
 
+    /*
+     * On Arm32, xenheap must be contiguous, look for one of the region
+     * that matches the above-mentioned xenheap constraints.
+     */
     do
     {
-        e = consider_modules(ram_start, ram_end,
+        e = bootinfo.reserved_heap ?
+            fit_xenheap_in_reserved_heap(pfn_to_paddr(xenheap_pages), 32<<20) :
+            consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
                              32<<20, 0);
         if ( e )
@@ -779,7 +846,7 @@ static void __init setup_mm(void)
     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
 
     if ( ! e )
-        panic("Not not enough space for xenheap\n");
+        panic("Not enough space for xenheap\n");
 
     domheap_pages = heap_pages - xenheap_pages;
 
@@ -824,9 +891,9 @@ static void __init setup_mm(void)
 static void __init setup_mm(void)
 {
     const struct meminfo *banks = &bootinfo.mem;
-    paddr_t ram_start = ~0;
-    paddr_t ram_end = 0;
-    paddr_t ram_size = 0;
+    paddr_t ram_start = INVALID_PADDR, bank_start = INVALID_PADDR;
+    paddr_t ram_end = 0, bank_end = 0;
+    paddr_t ram_size = 0, bank_size = 0;
     unsigned int i;
 
     init_pdx();
@@ -835,17 +902,36 @@ static void __init setup_mm(void)
      * We need some memory to allocate the page-tables used for the xenheap
      * mappings. But some regions may contain memory already allocated
      * for other uses (e.g. modules, reserved-memory...).
-     *
+     * If there are non-empty reserved heap regions, (only) add these regions
+     * in the boot allocator.
+     */
+    if ( bootinfo.reserved_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
+            {
+                bank_start = bootinfo.reserved_mem.bank[i].start;
+                bank_size = bootinfo.reserved_mem.bank[i].size;
+                bank_end = bank_start + bank_size;
+
+                init_boot_pages(bank_start, bank_end);
+            }
+        }
+    }
+    /*
+     * No reserved heap regions:
      * For simplicity, add all the free regions in the boot allocator.
      */
-    populate_boot_allocator();
+    else
+        populate_boot_allocator();
 
     total_pages = 0;
 
     for ( i = 0; i < banks->nr_banks; i++ )
     {
         const struct membank *bank = &banks->bank[i];
-        paddr_t bank_end = bank->start + bank->size;
+        bank_end = bank->start + bank->size;
 
         ram_size = ram_size + bank->size;
         ram_start = min(ram_start, bank->start);
-- 
2.17.1


