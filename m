Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C068A9CDD00
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837076.1253034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuj-00025U-4A; Fri, 15 Nov 2024 10:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837076.1253034; Fri, 15 Nov 2024 10:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuj-00023X-0y; Fri, 15 Nov 2024 10:50:57 +0000
Received: by outflank-mailman (input) for mailman id 837076;
 Fri, 15 Nov 2024 10:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtuh-0000kJ-GY
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7b422713-a33f-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 11:50:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DBD61476;
 Fri, 15 Nov 2024 02:51:21 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86DA23F6A8;
 Fri, 15 Nov 2024 02:50:50 -0800 (PST)
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
X-Inumbo-ID: 7b422713-a33f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjdiNDIyNzEzLWEzM2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjY3ODUyLjMzNzcwMywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] xen/arm: do not give memory back to static heap
Date: Fri, 15 Nov 2024 10:50:36 +0000
Message-Id: <20241115105036.218418-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115105036.218418-1-luca.fancellu@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

If Xenheap is statically configured in Device Tree, its size is
definite. So, the memory shall not be given back into static heap, like
it's normally done in free_init_memory, etc, once the initialization
is finished.

Extract static_heap flag from init data bootinfo, as it will be needed
after destroying the init data section.
Introduce a new helper xen_is_using_staticheap() to tell whether Xenheap
is statically configured in the Device Tree.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
This is a rebase of this one: https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-18-Penny.Zheng@arm.com/
---
 xen/arch/arm/arm32/mmu/mm.c          |  4 ++--
 xen/arch/arm/kernel.c                |  3 ++-
 xen/arch/arm/mmu/setup.c             |  8 ++++++--
 xen/arch/arm/setup.c                 | 27 ++++++++++++++-------------
 xen/common/device-tree/bootfdt.c     |  2 +-
 xen/common/device-tree/bootinfo.c    |  2 +-
 xen/common/device-tree/device-tree.c |  3 +++
 xen/include/xen/bootfdt.h            | 11 ++++++++++-
 8 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 063611412be0..b7ca7c94c9ca 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -199,7 +199,7 @@ void __init setup_mm(void)
 
     total_pages = ram_size >> PAGE_SHIFT;
 
-    if ( bootinfo.static_heap )
+    if ( xen_is_using_staticheap() )
     {
         const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
 
@@ -246,7 +246,7 @@ void __init setup_mm(void)
 
     do
     {
-        e = bootinfo.static_heap ?
+        e = xen_is_using_staticheap() ?
             fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
             consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 293d7efaed9c..a4a99607b668 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -247,7 +247,8 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
      * Free the original kernel, update the pointers to the
      * decompressed kernel
      */
-    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+    if ( !xen_is_using_staticheap() )
+        fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
 
     return 0;
 }
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 1b1d302c8788..d0775793f4b4 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -343,8 +343,12 @@ void free_init_memory(void)
     if ( rc )
         panic("Unable to remove the init section (rc = %d)\n", rc);
 
-    init_domheap_pages(pa, pa + len);
-    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
+    if ( !xen_is_using_staticheap() )
+    {
+        init_domheap_pages(pa, pa + len);
+        printk("Freed %ldkB init memory.\n",
+               (long)(__init_end-__init_begin) >> 10);
+    }
 }
 
 /**
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca94..91340d5dc201 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -206,24 +206,25 @@ void __init discard_initial_modules(void)
     struct bootmodules *mi = &bootinfo.modules;
     int i;
 
-    for ( i = 0; i < mi->nr_mods; i++ )
+    if ( !xen_is_using_staticheap() )
     {
-        paddr_t s = mi->module[i].start;
-        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
-
-        if ( mi->module[i].kind == BOOTMOD_XEN )
-            continue;
+        for ( i = 0; i < mi->nr_mods; i++ )
+        {
+            paddr_t s = mi->module[i].start;
+            paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
 
-        if ( !mfn_valid(maddr_to_mfn(s)) ||
-             !mfn_valid(maddr_to_mfn(e)) )
-            continue;
+            if ( mi->module[i].kind == BOOTMOD_XEN )
+                continue;
 
-        fw_unreserved_regions(s, e, init_domheap_pages, 0);
-    }
+            if ( !mfn_valid(maddr_to_mfn(s)) ||
+                 !mfn_valid(maddr_to_mfn(e)) )
+                continue;
 
-    mi->nr_mods = 0;
+            fw_unreserved_regions(s, e, init_domheap_pages, 0);
+        }
 
-    remove_early_mappings();
+        mi->nr_mods = 0;
+    }
 }
 
 /* Relocate the FDT in Xen heap */
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 927f59c64b0d..ccb150b34a63 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -403,7 +403,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         if ( rc )
             return rc;
 
-        bootinfo.static_heap = true;
+        static_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index f2e6a1145b7c..1e83d5172938 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -386,7 +386,7 @@ void __init populate_boot_allocator(void)
     const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     paddr_t s, e;
 
-    if ( bootinfo.static_heap )
+    if ( xen_is_using_staticheap() )
     {
         for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
         {
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index d0528c582565..22b69c49171b 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -25,6 +25,9 @@
 #include <asm/setup.h>
 #include <xen/err.h>
 
+/* Flag saved when Xen is using the static heap feature (xen,static-heap) */
+bool __read_mostly static_heap;
+
 const void *device_tree_flattened;
 dt_irq_xlate_func dt_irq_xlate;
 /* Host device tree */
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f38..0015a4babde7 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -132,7 +132,6 @@ struct bootinfo {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shmem;
 #endif
-    bool static_heap;
 };
 
 #ifdef CONFIG_ACPI
@@ -156,6 +155,7 @@ struct bootinfo {
 }
 
 extern struct bootinfo bootinfo;
+extern bool static_heap;
 
 bool check_reserved_regions_overlap(paddr_t region_start,
                                     paddr_t region_size);
@@ -206,4 +206,13 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
 }
 #endif
 
+static inline bool xen_is_using_staticheap(void)
+{
+#ifdef CONFIG_STATIC_MEMORY
+    return static_heap;
+#else
+    return false;
+#endif
+}
+
 #endif /* XEN_BOOTFDT_H */
-- 
2.34.1


