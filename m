Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E029D73D689
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555082.866827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5e-0001ZI-Qc; Mon, 26 Jun 2023 03:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555082.866827; Mon, 26 Jun 2023 03:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5d-0001C3-Jr; Mon, 26 Jun 2023 03:40:33 +0000
Received: by outflank-mailman (input) for mailman id 555082;
 Mon, 26 Jun 2023 03:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1G-0007ej-38
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 91d915d0-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65C7A1FB;
 Sun, 25 Jun 2023 20:36:44 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCC283F64C;
 Sun, 25 Jun 2023 20:35:57 -0700 (PDT)
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
X-Inumbo-ID: 91d915d0-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 17/52] xen/arm: do not give memory back to static heap
Date: Mon, 26 Jun 2023 11:34:08 +0800
Message-Id: <20230626033443.2943270-18-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If Xenheap is statically configured in Device Tree, its size is
definite. So, we shall not give memory back into static heap, like
we normally do in free_init_memory, etc, once it finishes initialization.

We extract static_heap flag from init data bootinfo, as we also need it
after we destroy init data section. we introduce a new helper
xen_is_using_staticheap to tell whether Xenheap is statically configured in
Device Tree. It is always returning false when !CONFIG_STATIC_MEMORY,
since static heap depends on static memory feature.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/bootfdt.c           |  2 +-
 xen/arch/arm/include/asm/setup.h |  8 +++++++-
 xen/arch/arm/kernel.c            |  3 ++-
 xen/arch/arm/mm.c                |  8 ++++++--
 xen/arch/arm/mmu/setup.c         |  4 ++--
 xen/arch/arm/setup.c             | 29 +++++++++++++++++------------
 6 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2673ad17a1..c4497e3b31 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -341,7 +341,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         if ( rc )
             return rc;
 
-        bootinfo.static_heap = true;
+        static_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0922549631..d691f6bf93 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -104,9 +104,15 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
 #endif
-    bool static_heap;
 };
 
+extern bool static_heap;
+#ifdef CONFIG_STATIC_MEMORY
+#define xen_is_using_staticheap() (static_heap)
+#else
+#define xen_is_using_staticheap() (false)
+#endif
+
 struct map_range_data
 {
     struct domain *d;
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 2e64612ab3..d13ef0330b 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -246,7 +246,8 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
      * Free the original kernel, update the pointers to the
      * decompressed kernel
      */
-    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+    if ( !xen_is_using_staticheap() )
+        fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
 
     return 0;
 }
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e665d1f97a..4b174f4d08 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -177,8 +177,12 @@ void free_init_memory(void)
     if ( rc )
         panic("Unable to remove the init section (rc = %d)\n", rc);
 
-    init_domheap_pages(pa, pa + len);
-    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
+    if ( !xen_is_using_staticheap() )
+    {
+        init_domheap_pages(pa, pa + len);
+        printk("Freed %ldkB init memory.\n",
+               (long)(__init_end-__init_begin)>>10);
+    }
 }
 
 void arch_dump_shared_mem_info(void)
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index a7590a2443..cf7018b190 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -196,7 +196,7 @@ void __init setup_mm(void)
 
     total_pages = ram_size >> PAGE_SHIFT;
 
-    if ( bootinfo.static_heap )
+    if ( xen_is_using_staticheap() )
     {
         for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
         {
@@ -241,7 +241,7 @@ void __init setup_mm(void)
 
     do
     {
-        e = bootinfo.static_heap ?
+        e = xen_is_using_staticheap() ?
             fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
             consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 34923d9984..6f8dd98d6b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -59,6 +59,8 @@ bool __read_mostly acpi_disabled;
 
 domid_t __read_mostly max_init_domid;
 
+bool __read_mostly static_heap;
+
 static __used void init_done(void)
 {
     int rc;
@@ -508,22 +510,25 @@ void __init discard_initial_modules(void)
     struct bootmodules *mi = &bootinfo.modules;
     int i;
 
-    for ( i = 0; i < mi->nr_mods; i++ )
+    if ( !xen_is_using_staticheap() )
     {
-        paddr_t s = mi->module[i].start;
-        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
+        for ( i = 0; i < mi->nr_mods; i++ )
+        {
+            paddr_t s = mi->module[i].start;
+            paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
 
-        if ( mi->module[i].kind == BOOTMOD_XEN )
-            continue;
+            if ( mi->module[i].kind == BOOTMOD_XEN )
+                continue;
 
-        if ( !mfn_valid(maddr_to_mfn(s)) ||
-             !mfn_valid(maddr_to_mfn(e)) )
-            continue;
+            if ( !mfn_valid(maddr_to_mfn(s)) ||
+                 !mfn_valid(maddr_to_mfn(e)) )
+                continue;
 
-        fw_unreserved_regions(s, e, init_domheap_pages, 0);
-    }
+            fw_unreserved_regions(s, e, init_domheap_pages, 0);
+        }
 
-    mi->nr_mods = 0;
+        mi->nr_mods = 0;
+    }
 
     remove_early_mappings();
 }
@@ -660,7 +665,7 @@ void __init populate_boot_allocator(void)
     const struct meminfo *banks = &bootinfo.mem;
     paddr_t s, e;
 
-    if ( bootinfo.static_heap )
+    if ( xen_is_using_staticheap() )
     {
         for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
         {
-- 
2.25.1


