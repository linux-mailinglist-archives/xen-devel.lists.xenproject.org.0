Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C687959F466
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 09:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392231.630460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkrw-00017O-LH; Wed, 24 Aug 2022 07:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392231.630460; Wed, 24 Aug 2022 07:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkrw-00014V-Gt; Wed, 24 Aug 2022 07:32:08 +0000
Received: by outflank-mailman (input) for mailman id 392231;
 Wed, 24 Aug 2022 07:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSDv=Y4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oQkru-0000Uo-5m
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 07:32:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d9b55bcd-237e-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 09:32:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D67A0106F;
 Wed, 24 Aug 2022 00:32:07 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 867C23F718;
 Wed, 24 Aug 2022 00:32:01 -0700 (PDT)
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
X-Inumbo-ID: d9b55bcd-237e-11ed-bd2e-47488cf2e6aa
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap allocator
Date: Wed, 24 Aug 2022 07:31:27 +0000
Message-Id: <20220824073127.16762-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220824073127.16762-1-Henry.Wang@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>

This commit firstly adds a global variable `reserved_heap`.
This newly introduced global variable is set at the device tree
parsing time if the reserved heap ranges are defined in the device
tree chosen node.

For Arm32, In `setup_mm`, if the reserved heap is enabled, we use
the reserved heap region for both domheap and xenheap allocation.

For Arm64, In `setup_mm`, if the reserved heap is enabled and used,
we make sure that only these reserved heap pages are added to the
boot allocator. These reserved heap pages in the boot allocator are
added to the heap allocator at `end_boot_allocator()`.

If the reserved heap is disabled, we stick to current page allocation
strategy at boot time.

Also, take the chance to correct a "double not" print in Arm32
`setup_mm()`.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
With reserved heap enabled, for Arm64, naming of global variables such
as `xenheap_mfn_start` and `xenheap_mfn_end` seems to be ambiguous,
wondering if we should rename these variables.
---
Changes from RFC to v1:
- Rebase on top of latest `setup_mm()` changes.
- Added Arm32 logic in `setup_mm()`.
---
 xen/arch/arm/bootfdt.c           |  2 +
 xen/arch/arm/include/asm/setup.h |  2 +
 xen/arch/arm/setup.c             | 79 +++++++++++++++++++++++++-------
 3 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 33704ca487..ab73b6e212 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -325,6 +325,8 @@ static int __init process_chosen_node(const void *fdt, int node,
                                      true);
         if ( rc )
             return rc;
+
+        reserved_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index e80f3d6201..00536a6d55 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
 
 extern domid_t max_init_domid;
 
+extern bool reserved_heap;
+
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 500307edc0..fe76cf6325 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
 
 domid_t __read_mostly max_init_domid;
 
+bool __read_mostly reserved_heap;
+
 static __used void init_done(void)
 {
     /* Must be done past setting system_state. */
@@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
-    paddr_t ram_start, ram_end, ram_size, e;
-    unsigned long ram_pages;
+    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
+    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,
+            reserved_heap_size = 0;
+    unsigned long ram_pages, reserved_heap_pages = 0;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
@@ -720,9 +724,9 @@ static void __init setup_mm(void)
 
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
@@ -731,6 +735,25 @@ static void __init setup_mm(void)
 
     total_pages = ram_pages = ram_size >> PAGE_SHIFT;
 
+    if ( reserved_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].xen_heap )
+            {
+                bank_start = bootinfo.reserved_mem.bank[i].start;
+                bank_size = bootinfo.reserved_mem.bank[i].size;
+                bank_end = bank_start + bank_size;
+
+                reserved_heap_size += bank_size;
+                reserved_heap_start = min(reserved_heap_start, bank_start);
+                reserved_heap_end = max(reserved_heap_end, bank_end);
+            }
+        }
+
+        reserved_heap_pages = reserved_heap_size >> PAGE_SHIFT;
+    }
+
     /*
      * If the user has not requested otherwise via the command line
      * then locate the xenheap using these constraints:
@@ -743,7 +766,8 @@ static void __init setup_mm(void)
      * We try to allocate the largest xenheap possible within these
      * constraints.
      */
-    heap_pages = ram_pages;
+    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
+
     if ( opt_xenheap_megabytes )
         xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
     else
@@ -755,17 +779,21 @@ static void __init setup_mm(void)
 
     do
     {
-        e = consider_modules(ram_start, ram_end,
+        e = !reserved_heap ?
+            consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
-                             32<<20, 0);
+                             32<<20, 0) :
+            reserved_heap_end;
+
         if ( e )
             break;
 
         xenheap_pages >>= 1;
     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
 
-    if ( ! e )
-        panic("Not not enough space for xenheap\n");
+    if ( ! e ||
+         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
+        panic("Not enough space for xenheap\n");
 
     domheap_pages = heap_pages - xenheap_pages;
 
@@ -810,9 +838,9 @@ static void __init setup_mm(void)
 static void __init setup_mm(void)
 {
     const struct meminfo *banks = &bootinfo.mem;
-    paddr_t ram_start = ~0;
-    paddr_t ram_end = 0;
-    paddr_t ram_size = 0;
+    paddr_t ram_start = ~0, bank_start = ~0;
+    paddr_t ram_end = 0, bank_end = 0;
+    paddr_t ram_size = 0, bank_size = 0;
     unsigned int i;
 
     init_pdx();
@@ -821,17 +849,36 @@ static void __init setup_mm(void)
      * We need some memory to allocate the page-tables used for the xenheap
      * mappings. But some regions may contain memory already allocated
      * for other uses (e.g. modules, reserved-memory...).
-     *
+     * If reserved heap regions are properly defined, (only) add these regions
+     * in the boot allocator.
+     */
+    if ( reserved_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].xen_heap )
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


