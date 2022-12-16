Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5CA64EAD9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464426.722835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D4-00043y-Uy; Fri, 16 Dec 2022 11:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464426.722835; Fri, 16 Dec 2022 11:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D4-00041D-Qw; Fri, 16 Dec 2022 11:49:02 +0000
Received: by outflank-mailman (input) for mailman id 464426;
 Fri, 16 Dec 2022 11:49:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D3-0003kh-B9
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D3-0002Cw-AN
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:01 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D3-0004sN-2Y; Fri, 16 Dec 2022 11:49:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=7G8OCEg9k6ZwbQFlkMaRu/1/MXF29psY53uz8Xg2bDg=; b=D3FSa7zJj1nOHbPE0uzqpEjkc6
	XLjSia5eZs8j94llmVkRW73ZJx+jEIZKSyCazN2zcYyAJ2AgNp4DEM+wQ1d2Ko8Qy190hjbUwEzXW
	98NvrzF9sBvk+pL0hwIH4vbCJH/OZ8KtVprS7qh3pYfUHoBMxfDV26AzelEHcIASXdVQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Wei Liu <wei.liu2@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	David Woodhouse <dwmw2@amazon.com>,
	Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 02/22] x86/setup: move vm_init() before acpi calls
Date: Fri, 16 Dec 2022 11:48:33 +0000
Message-Id: <20221216114853.8227-3-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

After the direct map removal, pages from the boot allocator are not
mapped at all in the direct map. Although we have map_domain_page, they
are ephemeral and are less helpful for mappings that are more than a
page, so we want a mechanism to globally map a range of pages, which is
what vmap is for. Therefore, we bring vm_init into early boot stage.

To allow vmap to be initialised and used in early boot, we need to
modify vmap to receive pages from the boot allocator during early boot
stage.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: David Woodhouse <dwmw2@amazon.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/setup.c |  4 ++--
 xen/arch/x86/setup.c | 31 ++++++++++++++++++++-----------
 xen/common/vmap.c    | 37 +++++++++++++++++++++++++++++--------
 3 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90e3..2311726f5ddd 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1028,6 +1028,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_mm();
 
+    vm_init();
+
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
@@ -1039,8 +1041,6 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     system_state = SYS_STATE_boot;
 
-    vm_init();
-
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6bb5bc7c84be..1c2e09711eb0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -870,6 +870,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     int ret;
+    bool vm_init_done = false;
     struct ns16550_defaults ns16550 = {
         .data_bits = 8,
         .parity    = 'n',
@@ -1442,12 +1443,23 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             continue;
 
         if ( !acpi_boot_table_init_done &&
-             s >= (1ULL << 32) &&
-             !acpi_boot_table_init() )
+             s >= (1ULL << 32) )
         {
-            acpi_boot_table_init_done = true;
-            srat_parse_regions(s);
-            setup_max_pdx(raw_max_page);
+            /*
+             * We only initialise vmap and acpi after going through the bottom
+             * 4GiB, so that we have enough pages in the boot allocator.
+             */
+            if ( !vm_init_done )
+            {
+                vm_init();
+                vm_init_done = true;
+            }
+            if ( !acpi_boot_table_init() )
+            {
+                acpi_boot_table_init_done = true;
+                srat_parse_regions(s);
+                setup_max_pdx(raw_max_page);
+            }
         }
 
         if ( pfn_to_pdx((e - 1) >> PAGE_SHIFT) >= max_pdx )
@@ -1624,6 +1636,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_frametable();
 
+    if ( !vm_init_done )
+        vm_init();
+
     if ( !acpi_boot_table_init_done )
         acpi_boot_table_init();
 
@@ -1661,12 +1676,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         end_boot_allocator();
 
     system_state = SYS_STATE_boot;
-    /*
-     * No calls involving ACPI code should go between the setting of
-     * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
-     * will break).
-     */
-    vm_init();
 
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067ec1..1340c7c6faf6 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -34,9 +34,20 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
 
     for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
     {
-        struct page_info *pg = alloc_domheap_page(NULL, 0);
+        mfn_t mfn;
+        int rc;
 
-        map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
+        if ( system_state == SYS_STATE_early_boot )
+            mfn = alloc_boot_pages(1, 1);
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+            BUG_ON(!pg);
+            mfn = page_to_mfn(pg);
+        }
+        rc = map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR);
+        BUG_ON(rc);
         clear_page((void *)va);
     }
     bitmap_fill(vm_bitmap(type), vm_low[type]);
@@ -62,7 +73,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
     spin_lock(&vm_lock);
     for ( ; ; )
     {
-        struct page_info *pg;
+        mfn_t mfn;
 
         ASSERT(vm_low[t] == vm_top[t] || !test_bit(vm_low[t], vm_bitmap(t)));
         for ( start = vm_low[t]; start < vm_top[t]; )
@@ -97,9 +108,16 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
         if ( vm_top[t] >= vm_end[t] )
             return NULL;
 
-        pg = alloc_domheap_page(NULL, 0);
-        if ( !pg )
-            return NULL;
+        if ( system_state == SYS_STATE_early_boot )
+            mfn = alloc_boot_pages(1, 1);
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+            if ( !pg )
+                return NULL;
+            mfn = page_to_mfn(pg);
+        }
 
         spin_lock(&vm_lock);
 
@@ -107,7 +125,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
         {
             unsigned long va = (unsigned long)vm_bitmap(t) + vm_top[t] / 8;
 
-            if ( !map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR) )
+            if ( !map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR) )
             {
                 clear_page((void *)va);
                 vm_top[t] += PAGE_SIZE * 8;
@@ -117,7 +135,10 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
             }
         }
 
-        free_domheap_page(pg);
+        if ( system_state == SYS_STATE_early_boot )
+            init_boot_pages(mfn_to_maddr(mfn), mfn_to_maddr(mfn) + PAGE_SIZE);
+        else
+            free_domheap_page(mfn_to_page(mfn));
 
         if ( start >= vm_top[t] )
         {
-- 
2.38.1


