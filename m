Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B483F9F0A15
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 11:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856555.1269138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3GL-0001OL-OV; Fri, 13 Dec 2024 10:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856555.1269138; Fri, 13 Dec 2024 10:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3GL-0001MZ-Ln; Fri, 13 Dec 2024 10:51:13 +0000
Received: by outflank-mailman (input) for mailman id 856555;
 Fri, 13 Dec 2024 10:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7A3=TG=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tM3GK-0001MS-80
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 10:51:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 26ed9ab1-b940-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 11:51:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CDB711FB;
 Fri, 13 Dec 2024 02:51:33 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281263F720;
 Fri, 13 Dec 2024 02:51:03 -0800 (PST)
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
X-Inumbo-ID: 26ed9ab1-b940-11ef-a0d6-8be0dac302b0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v7] xen/arm: Check for Static Heap feature when freeing resources
Date: Fri, 13 Dec 2024 10:50:47 +0000
Message-Id: <20241213105047.3043403-1-luca.fancellu@arm.com>
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v6:
 - fix issue in discard_initial_modules that prevented remove_early_mappings
   to be called (Michal)
 - Modify code in kernel_decompress to exit early (Michal)
 - Add R-by Michal
Changes from v5:
 - Drop Jan R-by due to the code changes
 - Static heap is not dependent on static memory, so delete #ifdefs
   for CONFIG_STATIC_MEMORY
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
 xen/arch/arm/kernel.c             | 7 +++++++
 xen/arch/arm/mmu/setup.c          | 8 ++++++--
 xen/arch/arm/setup.c              | 8 ++++++++
 xen/common/device-tree/bootfdt.c  | 2 +-
 xen/common/device-tree/bootinfo.c | 2 +-
 xen/common/page_alloc.c           | 3 +++
 xen/include/xen/bootfdt.h         | 1 -
 xen/include/xen/mm.h              | 2 ++
 9 files changed, 30 insertions(+), 7 deletions(-)

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
index 293d7efaed9c..80fad8b3362c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -235,6 +235,13 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
     for ( ; i < (1 << kernel_order_out); i++ )
         free_domheap_page(pages + i);
 
+    /*
+     * When using static heap feature, don't give bootmodules memory back to
+     * the heap allocator
+     */
+    if ( using_static_heap )
+        return 0;
+
     /*
      * When freeing the kernel, we need to pass the module start address and
      * size as they were before taking an offset to gzip header into account,
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
index 2e27af4560a5..545702d8a32d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -206,6 +206,13 @@ void __init discard_initial_modules(void)
     struct bootmodules *mi = &bootinfo.modules;
     int i;
 
+    /*
+     * When using static heap feature, don't give bootmodules memory back to
+     * the heap allocator
+     */
+    if ( using_static_heap )
+        goto out;
+
     for ( i = 0; i < mi->nr_mods; i++ )
     {
         paddr_t s = mi->module[i].start;
@@ -223,6 +230,7 @@ void __init discard_initial_modules(void)
 
     mi->nr_mods = 0;
 
+ out:
     remove_early_mappings();
 }
 
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index fc93d86e8232..47386d4fffea 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -410,7 +410,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         if ( rc )
             return rc;
 
-        bootinfo.static_heap = true;
+        using_static_heap = true;
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
index 92abed6514b4..1f424333db27 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -165,6 +165,9 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+/* Flag saved when Xen is using the static heap feature */
+bool __ro_after_init using_static_heap;
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
index d7dcf0f06330..16f733281af3 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -72,6 +72,8 @@
 
 struct page_info;
 
+extern bool using_static_heap;
+
 void put_page(struct page_info *page);
 bool __must_check get_page(struct page_info *page,
                            const struct domain *domain);
-- 
2.34.1


