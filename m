Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426059ECAE1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854598.1267767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKdN-0004Nd-BF; Wed, 11 Dec 2024 11:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854598.1267767; Wed, 11 Dec 2024 11:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKdN-0004Lu-7L; Wed, 11 Dec 2024 11:12:01 +0000
Received: by outflank-mailman (input) for mailman id 854598;
 Wed, 11 Dec 2024 11:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jQm=TE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tLKdM-0004KX-2E
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:12:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bc972ee6-b7b0-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:11:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 813071063;
 Wed, 11 Dec 2024 03:12:25 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B813F5A1;
 Wed, 11 Dec 2024 03:11:55 -0800 (PST)
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
X-Inumbo-ID: bc972ee6-b7b0-11ef-a0d5-8be0dac302b0
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
Subject: [PATCH v5] xen/arm: Check for Static Heap feature when freeing resources
Date: Wed, 11 Dec 2024 11:11:46 +0000
Message-Id: <20241211111146.2827727-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

If the Xen heap is statically configured in Device Tree, its size is
definite, so only the defined memory shall be given to the boot
allocator. Have a check where init_domheap_pages() is called
which takes into account if static heap feature is used.

Extract static_heap flag from init data bootinfo, as it will be needed
after destroying the init data section, rename it to using_static_heap
and use it to tell whether the Xen static heap feature is enabled.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
---
Changes from v4:
 - Add R-by Jan
 - Changed code to reduce nesting in discard_initial_modules (Julien)
Changes from v3:
 - Removed helper using_static_heap(), renamed static_heap variable
   to using_static_heap and simplified #ifdef-ary (Jan suggestion)
Changes from v2:
 - Change xen_is_using_staticheap() to using_static_heap()
 - Move declaration of static_heap to xen/mm.h and import that in
   bootfdt.h
 - Reprased first part of the commit message
Changes from v1:
 - moved static_heap to common/page_alloc.c
 - protect static_heap access with CONFIG_STATIC_MEMORY
 - update comment in arm/kernel.c kernel_decompress()
---
---
 xen/arch/arm/arm32/mmu/mm.c       | 4 ++--
 xen/arch/arm/kernel.c             | 7 ++++---
 xen/arch/arm/mmu/setup.c          | 8 ++++++--
 xen/arch/arm/setup.c              | 3 +++
 xen/common/device-tree/bootfdt.c  | 4 +++-
 xen/common/device-tree/bootinfo.c | 2 +-
 xen/common/page_alloc.c           | 5 +++++
 xen/include/xen/bootfdt.h         | 1 -
 xen/include/xen/mm.h              | 6 ++++++
 9 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 063611412be0..0824d61323b5 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -199,7 +199,7 @@ void __init setup_mm(void)
 
     total_pages = ram_size >> PAGE_SHIFT;
 
-    if ( bootinfo.static_heap )
+    if ( using_static_heap )
     {
         const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
 
@@ -246,7 +246,7 @@ void __init setup_mm(void)
 
     do
     {
-        e = bootinfo.static_heap ?
+        e = using_static_heap ?
             fit_xenheap_in_static_heap(pfn_to_paddr(xenheap_pages), MB(32)) :
             consider_modules(ram_start, ram_end,
                              pfn_to_paddr(xenheap_pages),
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 293d7efaed9c..8270684246ea 100644
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
+    if ( !using_static_heap )
+        fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
 
     return 0;
 }
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9664e85ee6c0..8c87649bc88e 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -341,8 +341,12 @@ void free_init_memory(void)
     if ( rc )
         panic("Unable to remove the init section (rc = %d)\n", rc);
 
-    init_domheap_pages(pa, pa + len);
-    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
+    if ( !using_static_heap )
+    {
+        init_domheap_pages(pa, pa + len);
+        printk("Freed %ldkB init memory.\n",
+               (long)(__init_end-__init_begin) >> 10);
+    }
 }
 
 /**
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2e27af4560a5..85f743a2c6ad 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -206,6 +206,9 @@ void __init discard_initial_modules(void)
     struct bootmodules *mi = &bootinfo.modules;
     int i;
 
+    if ( using_static_heap )
+        return;
+
     for ( i = 0; i < mi->nr_mods; i++ )
     {
         paddr_t s = mi->module[i].start;
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index fc93d86e8232..61ad24c3ddc8 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -410,7 +410,9 @@ static int __init process_chosen_node(const void *fdt, int node,
         if ( rc )
             return rc;
 
-        bootinfo.static_heap = true;
+#ifdef CONFIG_STATIC_MEMORY
+        using_static_heap = true;
+#endif
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 0daf5e941a51..76d652c0de0b 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -407,7 +407,7 @@ void __init populate_boot_allocator(void)
     const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     paddr_t s, e;
 
-    if ( bootinfo.static_heap )
+    if ( using_static_heap )
     {
         for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
         {
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 92abed6514b4..013a1057cc7c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -165,6 +165,11 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Flag saved when Xen is using the static heap feature */
+bool __ro_after_init using_static_heap;
+#endif
+
 unsigned long __read_mostly max_page;
 unsigned long __read_mostly total_pages;
 paddr_t __ro_after_init mem_hotplug;
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 343c48b73d2c..c8bbfd8979b2 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -139,7 +139,6 @@ struct bootinfo {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shmem;
 #endif
-    bool static_heap;
 };
 
 #ifdef CONFIG_ACPI
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d7dcf0f06330..88536e8132f5 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -72,6 +72,12 @@
 
 struct page_info;
 
+#ifdef CONFIG_STATIC_MEMORY
+extern bool using_static_heap;
+#else
+#define using_static_heap false
+#endif
+
 void put_page(struct page_info *page);
 bool __must_check get_page(struct page_info *page,
                            const struct domain *domain);
-- 
2.34.1


