Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E89D2201
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839761.1255579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK4B-0006Jx-Fn; Tue, 19 Nov 2024 08:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839761.1255579; Tue, 19 Nov 2024 08:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK4B-0006HS-BP; Tue, 19 Nov 2024 08:58:35 +0000
Received: by outflank-mailman (input) for mailman id 839761;
 Tue, 19 Nov 2024 08:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Q5=SO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tDK49-0005G3-6G
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:58:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 722ac493-a654-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 09:58:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21B7D150C;
 Tue, 19 Nov 2024 00:58:59 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C15323F6A8;
 Tue, 19 Nov 2024 00:58:27 -0800 (PST)
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
X-Inumbo-ID: 722ac493-a654-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjcyMmFjNDkzLWE2NTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA2NzEwLjAxNDA3Niwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Date: Tue, 19 Nov 2024 08:58:06 +0000
Message-Id: <20241119085806.805142-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119085806.805142-1-luca.fancellu@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
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

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - moved static_heap to common/page_alloc.c
 - protect static_heap access with CONFIG_STATIC_MEMORY
 - update comment in arm/kernel.c kernel_decompress()
---
---
 xen/arch/arm/arm32/mmu/mm.c       |  4 ++--
 xen/arch/arm/kernel.c             |  7 ++++---
 xen/arch/arm/mmu/setup.c          |  8 ++++++--
 xen/arch/arm/setup.c              | 27 ++++++++++++++-------------
 xen/common/device-tree/bootfdt.c  |  4 +++-
 xen/common/device-tree/bootinfo.c |  2 +-
 xen/common/page_alloc.c           |  5 +++++
 xen/include/xen/bootfdt.h         | 14 +++++++++++++-
 8 files changed, 48 insertions(+), 23 deletions(-)

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
index 293d7efaed9c..d2245ec9d2ef 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -244,10 +244,11 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
     size += offset;
 
     /*
-     * Free the original kernel, update the pointers to the
-     * decompressed kernel
+     * In case Xen is not using the static heap feature, free the original
+     * kernel, update the pointers to the decompressed kernel
      */
-    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+    if ( !xen_is_using_staticheap() )
+        fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
 
     return 0;
 }
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9664e85ee6c0..83c0a1480447 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -341,8 +341,12 @@ void free_init_memory(void)
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
index 927f59c64b0d..6cc9ae146a97 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -403,7 +403,9 @@ static int __init process_chosen_node(const void *fdt, int node,
         if ( rc )
             return rc;
 
-        bootinfo.static_heap = true;
+#ifdef CONFIG_STATIC_MEMORY
+        static_heap = true;
+#endif
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
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 33c8c917d984..b1fdb4efcff0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -164,6 +164,11 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Flag saved when Xen is using the static heap feature (xen,static-heap) */
+bool __ro_after_init static_heap;
+#endif
+
 unsigned long __read_mostly max_page;
 unsigned long __read_mostly total_pages;
 paddr_t __ro_after_init mem_hotplug;
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f38..c861590e38c8 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -132,7 +132,6 @@ struct bootinfo {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shmem;
 #endif
-    bool static_heap;
 };
 
 #ifdef CONFIG_ACPI
@@ -157,6 +156,10 @@ struct bootinfo {
 
 extern struct bootinfo bootinfo;
 
+#ifdef CONFIG_STATIC_MEMORY
+extern bool static_heap;
+#endif
+
 bool check_reserved_regions_overlap(paddr_t region_start,
                                     paddr_t region_size);
 
@@ -206,4 +209,13 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
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


