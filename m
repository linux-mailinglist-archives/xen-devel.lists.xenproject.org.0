Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44122668B85
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476626.739056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjl-00068b-Sh; Fri, 13 Jan 2023 05:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476626.739056; Fri, 13 Jan 2023 05:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjl-0005sH-EQ; Fri, 13 Jan 2023 05:36:21 +0000
Received: by outflank-mailman (input) for mailman id 476626;
 Fri, 13 Jan 2023 05:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeK-0005sJ-LY
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6c024867-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB60FEC;
 Thu, 12 Jan 2023 21:31:24 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D3473F587;
 Thu, 12 Jan 2023 21:30:39 -0800 (PST)
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
X-Inumbo-ID: 6c024867-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 21/40] xen/arm: move MMU-specific setup_mm to setup_mmu.c
Date: Fri, 13 Jan 2023 13:28:54 +0800
Message-Id: <20230113052914.3845596-22-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_mm is used for Xen to setup memory management subsystem, like boot
allocator, direct-mapping, xenheap, frametable and static memory pages.
We could inherit some components seamlessly in MPU system like
boot allocator, whilst we need to implement some components differently
in MPU, like xenheap, and some components could not be applied in MPU system,
like direct-mapping.

In the commit, we move setup_mm and its related functions and
variables to setup_mmu.c in preparation of implementing MPU
version of setup_mm later in future commits

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile            |   3 +
 xen/arch/arm/include/asm/setup.h |   5 +
 xen/arch/arm/setup.c             | 326 +---------------------------
 xen/arch/arm/setup_mmu.c         | 350 +++++++++++++++++++++++++++++++
 4 files changed, 362 insertions(+), 322 deletions(-)
 create mode 100644 xen/arch/arm/setup_mmu.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 21188b207f..adeb17b7ab 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,9 @@ obj-y += physdev.o
 obj-y += processor.o
 obj-y += psci.o
 obj-y += setup.o
+ifneq ($(CONFIG_HAS_MPU), y)
+obj-y += setup_mmu.o
+endif
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 4f39a1aa0a..8f353b67f8 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -158,6 +158,11 @@ struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
 struct bootcmdline * boot_cmdline_find_by_name(const char *name);
 const char *boot_module_kind_as_string(bootmodule_kind kind);
 
+extern void init_pdx(void);
+extern void init_staticmem_pages(void);
+extern void populate_boot_allocator(void);
+extern void setup_mm(void);
+
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d7d200179c..3ebf9e9a5c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -2,7 +2,7 @@
 /*
  * xen/arch/arm/setup.c
  *
- * Early bringup code for an ARMv7-A with virt extensions.
+ * Early bringup code for an ARMv7-A/ARM64v8R with virt extensions.
  *
  * Tim Deegan <tim@xen.org>
  * Copyright (c) 2011 Citrix Systems.
@@ -57,11 +57,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
 
-#ifdef CONFIG_ARM_32
-static unsigned long opt_xenheap_megabytes __initdata;
-integer_param("xenheap_megabytes", opt_xenheap_megabytes);
-#endif
-
 domid_t __read_mostly max_init_domid;
 
 static __used void init_done(void)
@@ -455,138 +450,6 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-#ifdef CONFIG_ARM_32
-/*
- * Returns the end address of the highest region in the range s..e
- * with required size and alignment that does not conflict with the
- * modules from first_mod to nr_modules.
- *
- * For non-recursive callers first_mod should normally be 0 (all
- * modules and Xen itself) or 1 (all modules but not Xen).
- */
-static paddr_t __init consider_modules(paddr_t s, paddr_t e,
-                                       uint32_t size, paddr_t align,
-                                       int first_mod)
-{
-    const struct bootmodules *mi = &bootinfo.modules;
-    int i;
-    int nr;
-
-    s = (s+align-1) & ~(align-1);
-    e = e & ~(align-1);
-
-    if ( s > e ||  e - s < size )
-        return 0;
-
-    /* First check the boot modules */
-    for ( i = first_mod; i < mi->nr_mods; i++ )
-    {
-        paddr_t mod_s = mi->module[i].start;
-        paddr_t mod_e = mod_s + mi->module[i].size;
-
-        if ( s < mod_e && mod_s < e )
-        {
-            mod_e = consider_modules(mod_e, e, size, align, i+1);
-            if ( mod_e )
-                return mod_e;
-
-            return consider_modules(s, mod_s, size, align, i+1);
-        }
-    }
-
-    /* Now check any fdt reserved areas. */
-
-    nr = fdt_num_mem_rsv(device_tree_flattened);
-
-    for ( ; i < mi->nr_mods + nr; i++ )
-    {
-        paddr_t mod_s, mod_e;
-
-        if ( fdt_get_mem_rsv(device_tree_flattened,
-                             i - mi->nr_mods,
-                             &mod_s, &mod_e ) < 0 )
-            /* If we can't read it, pretend it doesn't exist... */
-            continue;
-
-        /* fdt_get_mem_rsv returns length */
-        mod_e += mod_s;
-
-        if ( s < mod_e && mod_s < e )
-        {
-            mod_e = consider_modules(mod_e, e, size, align, i+1);
-            if ( mod_e )
-                return mod_e;
-
-            return consider_modules(s, mod_s, size, align, i+1);
-        }
-    }
-
-    /*
-     * i is the current bootmodule we are evaluating, across all
-     * possible kinds of bootmodules.
-     *
-     * When retrieving the corresponding reserved-memory addresses, we
-     * need to index the bootinfo.reserved_mem bank starting from 0, and
-     * only counting the reserved-memory modules. Hence, we need to use
-     * i - nr.
-     */
-    nr += mi->nr_mods;
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
-    {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            r_e = consider_modules(r_e, e, size, align, i + 1);
-            if ( r_e )
-                return r_e;
-
-            return consider_modules(s, r_s, size, align, i + 1);
-        }
-    }
-    return e;
-}
-
-/*
- * Find a contiguous region that fits in the static heap region with
- * required size and alignment, and return the end address of the region
- * if found otherwise 0.
- */
-static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
-{
-    unsigned int i;
-    paddr_t end = 0, aligned_start, aligned_end;
-    paddr_t bank_start, bank_size, bank_end;
-
-    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
-    {
-        if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
-            continue;
-
-        bank_start = bootinfo.reserved_mem.bank[i].start;
-        bank_size = bootinfo.reserved_mem.bank[i].size;
-        bank_end = bank_start + bank_size;
-
-        if ( bank_size < size )
-            continue;
-
-        aligned_end = bank_end & ~(align - 1);
-        aligned_start = (aligned_end - size) & ~(align - 1);
-
-        if ( aligned_start > bank_start )
-            /*
-             * Allocate the xenheap as high as possible to keep low-memory
-             * available (assuming the admin supplied region below 4GB)
-             * for other use (e.g. domain memory allocation).
-             */
-            end = max(end, aligned_end);
-    }
-
-    return end;
-}
-#endif
-
 /*
  * Return the end of the non-module region starting at s. In other
  * words return s the start of the next modules after s.
@@ -621,7 +484,7 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
     return lowest;
 }
 
-static void __init init_pdx(void)
+void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
 
@@ -666,7 +529,7 @@ static void __init init_pdx(void)
 }
 
 /* Static memory initialization */
-static void __init init_staticmem_pages(void)
+void __init init_staticmem_pages(void)
 {
 #ifdef CONFIG_STATIC_MEMORY
     unsigned int bank;
@@ -700,7 +563,7 @@ static void __init init_staticmem_pages(void)
  * allocator with the corresponding regions only, but with Xenheap excluded
  * on arm32.
  */
-static void __init populate_boot_allocator(void)
+void __init populate_boot_allocator(void)
 {
     unsigned int i;
     const struct meminfo *banks = &bootinfo.mem;
@@ -769,187 +632,6 @@ static void __init populate_boot_allocator(void)
     }
 }
 
-#ifdef CONFIG_ARM_32
-static void __init setup_mm(void)
-{
-    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
-    paddr_t static_heap_end = 0, static_heap_size = 0;
-    unsigned long heap_pages, xenheap_pages, domheap_pages;
-    unsigned int i;
-    const uint32_t ctr = READ_CP32(CTR);
-
-    if ( !bootinfo.mem.nr_banks )
-        panic("No memory bank\n");
-
-    /* We only supports instruction caches implementing the IVIPT extension. */
-    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
-        panic("AIVIVT instruction cache not supported\n");
-
-    init_pdx();
-
-    ram_start = bootinfo.mem.bank[0].start;
-    ram_size  = bootinfo.mem.bank[0].size;
-    ram_end   = ram_start + ram_size;
-
-    for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
-    {
-        bank_start = bootinfo.mem.bank[i].start;
-        bank_size = bootinfo.mem.bank[i].size;
-        bank_end = bank_start + bank_size;
-
-        ram_size  = ram_size + bank_size;
-        ram_start = min(ram_start,bank_start);
-        ram_end   = max(ram_end,bank_end);
-    }
-
-    total_pages = ram_size >> PAGE_SHIFT;
-
-    if ( bootinfo.static_heap )
-    {
-        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
-        {
-            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
-                continue;
-
-            bank_start = bootinfo.reserved_mem.bank[i].start;
-            bank_size = bootinfo.reserved_mem.bank[i].size;
-            bank_end = bank_start + bank_size;
-
-            static_heap_size += bank_size;
-            static_heap_end = max(static_heap_end, bank_end);
-        }
-
-        heap_pages = static_heap_size >> PAGE_SHIFT;
-    }
-    else
-        heap_pages = total_pages;
-
-    /*
-     * If the user has not requested otherwise via the command line
-     * then locate the xenheap using these constraints:
-     *
-     *  - must be contiguous
-     *  - must be 32 MiB aligned
-     *  - must not include Xen itself or the boot modules
-     *  - must be at most 1GB or 1/32 the total RAM in the system (or static
-          heap if enabled) if less
-     *  - must be at least 32M
-     *
-     * We try to allocate the largest xenheap possible within these
-     * constraints.
-     */
-    if ( opt_xenheap_megabytes )
-        xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
-    else
-    {
-        xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
-        xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
-        xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
-    }
-
-    do
-    {
-        e = bootinfo.static_heap ?
-            fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
-            consider_modules(ram_start, ram_end,
-                             pfn_to_paddr(xenheap_pages),
-                             32<<20, 0);
-        if ( e )
-            break;
-
-        xenheap_pages >>= 1;
-    } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
-
-    if ( ! e )
-        panic("Not enough space for xenheap\n");
-
-    domheap_pages = heap_pages - xenheap_pages;
-
-    printk("Xen heap: %"PRIpaddr"-%"PRIpaddr" (%lu pages%s)\n",
-           e - (pfn_to_paddr(xenheap_pages)), e, xenheap_pages,
-           opt_xenheap_megabytes ? ", from command-line" : "");
-    printk("Dom heap: %lu pages\n", domheap_pages);
-
-    /*
-     * We need some memory to allocate the page-tables used for the
-     * directmap mappings. So populate the boot allocator first.
-     *
-     * This requires us to set directmap_mfn_{start, end} first so the
-     * direct-mapped Xenheap region can be avoided.
-     */
-    directmap_mfn_start = _mfn((e >> PAGE_SHIFT) - xenheap_pages);
-    directmap_mfn_end = mfn_add(directmap_mfn_start, xenheap_pages);
-
-    populate_boot_allocator();
-
-    setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
-
-    /* Frame table covers all of RAM region, including holes */
-    setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);
-
-    /*
-     * The allocators may need to use map_domain_page() (such as for
-     * scrubbing pages). So we need to prepare the domheap area first.
-     */
-    if ( !init_domheap_mappings(smp_processor_id()) )
-        panic("CPU%u: Unable to prepare the domheap page-tables\n",
-              smp_processor_id());
-
-    /* Add xenheap memory that was not already added to the boot allocator. */
-    init_xenheap_pages(mfn_to_maddr(directmap_mfn_start),
-                       mfn_to_maddr(directmap_mfn_end));
-
-    init_staticmem_pages();
-}
-#else /* CONFIG_ARM_64 */
-static void __init setup_mm(void)
-{
-    const struct meminfo *banks = &bootinfo.mem;
-    paddr_t ram_start = INVALID_PADDR;
-    paddr_t ram_end = 0;
-    paddr_t ram_size = 0;
-    unsigned int i;
-
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
-    for ( i = 0; i < banks->nr_banks; i++ )
-    {
-        const struct membank *bank = &banks->bank[i];
-        paddr_t bank_end = bank->start + bank->size;
-
-        ram_size = ram_size + bank->size;
-        ram_start = min(ram_start, bank->start);
-        ram_end = max(ram_end, bank_end);
-
-        setup_directmap_mappings(PFN_DOWN(bank->start),
-                                 PFN_DOWN(bank->size));
-    }
-
-    total_pages += ram_size >> PAGE_SHIFT;
-
-    directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
-    directmap_mfn_start = maddr_to_mfn(ram_start);
-    directmap_mfn_end = maddr_to_mfn(ram_end);
-
-    setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);
-
-    init_staticmem_pages();
-}
-#endif
-
 static bool __init is_dom0less_mode(void)
 {
     struct bootmodules *mods = &bootinfo.modules;
diff --git a/xen/arch/arm/setup_mmu.c b/xen/arch/arm/setup_mmu.c
new file mode 100644
index 0000000000..7e5d87f8bd
--- /dev/null
+++ b/xen/arch/arm/setup_mmu.c
@@ -0,0 +1,350 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/setup_mmu.c
+ *
+ * Early bringup code for an ARMv7-A with virt extensions.
+ *
+ * Tim Deegan <tim@xen.org>
+ * Copyright (c) 2011 Citrix Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/param.h>
+#include <xen/pfn.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+#ifdef CONFIG_ARM_32
+static unsigned long opt_xenheap_megabytes __initdata;
+integer_param("xenheap_megabytes", opt_xenheap_megabytes);
+
+/*
+ * Returns the end address of the highest region in the range s..e
+ * with required size and alignment that does not conflict with the
+ * modules from first_mod to nr_modules.
+ *
+ * For non-recursive callers first_mod should normally be 0 (all
+ * modules and Xen itself) or 1 (all modules but not Xen).
+ */
+static paddr_t __init consider_modules(paddr_t s, paddr_t e,
+                                       uint32_t size, paddr_t align,
+                                       int first_mod)
+{
+    const struct bootmodules *mi = &bootinfo.modules;
+    int i;
+    int nr;
+
+    s = (s+align-1) & ~(align-1);
+    e = e & ~(align-1);
+
+    if ( s > e ||  e - s < size )
+        return 0;
+
+    /* First check the boot modules */
+    for ( i = first_mod; i < mi->nr_mods; i++ )
+    {
+        paddr_t mod_s = mi->module[i].start;
+        paddr_t mod_e = mod_s + mi->module[i].size;
+
+        if ( s < mod_e && mod_s < e )
+        {
+            mod_e = consider_modules(mod_e, e, size, align, i+1);
+            if ( mod_e )
+                return mod_e;
+
+            return consider_modules(s, mod_s, size, align, i+1);
+        }
+    }
+
+    /* Now check any fdt reserved areas. */
+
+    nr = fdt_num_mem_rsv(device_tree_flattened);
+
+    for ( ; i < mi->nr_mods + nr; i++ )
+    {
+        paddr_t mod_s, mod_e;
+
+        if ( fdt_get_mem_rsv(device_tree_flattened,
+                             i - mi->nr_mods,
+                             &mod_s, &mod_e ) < 0 )
+            /* If we can't read it, pretend it doesn't exist... */
+            continue;
+
+        /* fdt_get_mem_rsv returns length */
+        mod_e += mod_s;
+
+        if ( s < mod_e && mod_s < e )
+        {
+            mod_e = consider_modules(mod_e, e, size, align, i+1);
+            if ( mod_e )
+                return mod_e;
+
+            return consider_modules(s, mod_s, size, align, i+1);
+        }
+    }
+
+    /*
+     * i is the current bootmodule we are evaluating, across all
+     * possible kinds of bootmodules.
+     *
+     * When retrieving the corresponding reserved-memory addresses, we
+     * need to index the bootinfo.reserved_mem bank starting from 0, and
+     * only counting the reserved-memory modules. Hence, we need to use
+     * i - nr.
+     */
+    nr += mi->nr_mods;
+    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            r_e = consider_modules(r_e, e, size, align, i + 1);
+            if ( r_e )
+                return r_e;
+
+            return consider_modules(s, r_s, size, align, i + 1);
+        }
+    }
+    return e;
+}
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
+
+void __init setup_mm(void)
+{
+    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
+    paddr_t static_heap_end = 0, static_heap_size = 0;
+    unsigned long heap_pages, xenheap_pages, domheap_pages;
+    unsigned int i;
+    const uint32_t ctr = READ_CP32(CTR);
+
+    if ( !bootinfo.mem.nr_banks )
+        panic("No memory bank\n");
+
+    /* We only supports instruction caches implementing the IVIPT extension. */
+    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
+        panic("AIVIVT instruction cache not supported\n");
+
+    init_pdx();
+
+    ram_start = bootinfo.mem.bank[0].start;
+    ram_size  = bootinfo.mem.bank[0].size;
+    ram_end   = ram_start + ram_size;
+
+    for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
+    {
+        bank_start = bootinfo.mem.bank[i].start;
+        bank_size = bootinfo.mem.bank[i].size;
+        bank_end = bank_start + bank_size;
+
+        ram_size  = ram_size + bank_size;
+        ram_start = min(ram_start,bank_start);
+        ram_end   = max(ram_end,bank_end);
+    }
+
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
+
+    /*
+     * If the user has not requested otherwise via the command line
+     * then locate the xenheap using these constraints:
+     *
+     *  - must be contiguous
+     *  - must be 32 MiB aligned
+     *  - must not include Xen itself or the boot modules
+     *  - must be at most 1GB or 1/32 the total RAM in the system (or static
+          heap if enabled) if less
+     *  - must be at least 32M
+     *
+     * We try to allocate the largest xenheap possible within these
+     * constraints.
+     */
+    if ( opt_xenheap_megabytes )
+        xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
+    else
+    {
+        xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
+        xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
+        xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
+    }
+
+    do
+    {
+        e = bootinfo.static_heap ?
+            fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
+            consider_modules(ram_start, ram_end,
+                             pfn_to_paddr(xenheap_pages),
+                             32<<20, 0);
+        if ( e )
+            break;
+
+        xenheap_pages >>= 1;
+    } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
+
+    if ( ! e )
+        panic("Not enough space for xenheap\n");
+
+    domheap_pages = heap_pages - xenheap_pages;
+
+    printk("Xen heap: %"PRIpaddr"-%"PRIpaddr" (%lu pages%s)\n",
+           e - (pfn_to_paddr(xenheap_pages)), e, xenheap_pages,
+           opt_xenheap_megabytes ? ", from command-line" : "");
+    printk("Dom heap: %lu pages\n", domheap_pages);
+
+    /*
+     * We need some memory to allocate the page-tables used for the
+     * directmap mappings. So populate the boot allocator first.
+     *
+     * This requires us to set directmap_mfn_{start, end} first so the
+     * direct-mapped Xenheap region can be avoided.
+     */
+    directmap_mfn_start = _mfn((e >> PAGE_SHIFT) - xenheap_pages);
+    directmap_mfn_end = mfn_add(directmap_mfn_start, xenheap_pages);
+
+    populate_boot_allocator();
+
+    setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
+
+    /* Frame table covers all of RAM region, including holes */
+    setup_frametable_mappings(ram_start, ram_end);
+    max_page = PFN_DOWN(ram_end);
+
+    /*
+     * The allocators may need to use map_domain_page() (such as for
+     * scrubbing pages). So we need to prepare the domheap area first.
+     */
+    if ( !init_domheap_mappings(smp_processor_id()) )
+        panic("CPU%u: Unable to prepare the domheap page-tables\n",
+              smp_processor_id());
+
+    /* Add xenheap memory that was not already added to the boot allocator. */
+    init_xenheap_pages(mfn_to_maddr(directmap_mfn_start),
+                       mfn_to_maddr(directmap_mfn_end));
+
+    init_staticmem_pages();
+}
+#else /* CONFIG_ARM_64 */
+void __init setup_mm(void)
+{
+    const struct meminfo *banks = &bootinfo.mem;
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
+    total_pages = 0;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        ram_size = ram_size + bank->size;
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
+
+        setup_directmap_mappings(PFN_DOWN(bank->start),
+                                 PFN_DOWN(bank->size));
+    }
+
+    total_pages += ram_size >> PAGE_SHIFT;
+
+    directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
+    directmap_mfn_start = maddr_to_mfn(ram_start);
+    directmap_mfn_end = maddr_to_mfn(ram_end);
+
+    setup_frametable_mappings(ram_start, ram_end);
+    max_page = PFN_DOWN(ram_end);
+
+    init_staticmem_pages();
+}
+#endif
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


