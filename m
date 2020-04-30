Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F21C0878
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG32-0002op-RO; Thu, 30 Apr 2020 20:44:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG31-0002ok-Rk
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:43 +0000
X-Inumbo-ID: 691dd6bc-8b23-11ea-9aaf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 691dd6bc-8b23-11ea-9aaf-12813bfff9fa;
 Thu, 30 Apr 2020 20:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N6y7WNNIWMO3WocYdovup6f1egnxn9RTSj105NrfG5Q=; b=5iNBkOqMsqkMJcNQR3NM3JHRRb
 2aO9ma52JHL8rPL36/oljF/PGHY5SZKIQQ0BFSJFXel6loih+ewgqTI6TlDfFduTOxG2/d/MGFbSi
 W706jUyccJkaU4kKJxiJoqsA5Ech9GyThky18TeWGyHfDCdcj0Il4eiEWpF8rbL9NJ5U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG2w-0004Kt-MH; Thu, 30 Apr 2020 20:44:38 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG2w-0005wj-Bb; Thu, 30 Apr 2020 20:44:38 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 01/16] x86/setup: move vm_init() before acpi calls
Date: Thu, 30 Apr 2020 21:44:10 +0100
Message-Id: <d000ae874e008bf0c9d3da67d08e43bcd3d42761.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
---
 xen/arch/arm/setup.c |  4 ++--
 xen/arch/x86/setup.c | 31 ++++++++++++++++++++-----------
 xen/common/vmap.c    | 37 +++++++++++++++++++++++++++++--------
 3 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..8f0ac87419 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -822,6 +822,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_mm();
 
+    vm_init();
+
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
@@ -833,8 +835,6 @@ void __init start_xen(unsigned long boot_phys_offset,
      */
     system_state = SYS_STATE_boot;
 
-    vm_init();
-
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fc0a6e5fcc..faca8c9758 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -695,6 +695,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     int i, j, e820_warn = 0, bytes = 0;
     bool acpi_boot_table_init_done = false, relocated = false;
     int ret;
+    bool vm_init_done = false;
     struct ns16550_defaults ns16550 = {
         .data_bits = 8,
         .parity    = 'n',
@@ -1301,12 +1302,23 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1483,6 +1495,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_frametable();
 
+    if ( !vm_init_done )
+        vm_init();
+
     if ( !acpi_boot_table_init_done )
         acpi_boot_table_init();
 
@@ -1520,12 +1535,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         end_boot_allocator();
 
     system_state = SYS_STATE_boot;
-    /*
-     * No calls involving ACPI code should go between the setting of
-     * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
-     * will break).
-     */
-    vm_init();
 
     console_init_ring();
     vesa_init();
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 9964ab2096..e8533a8a80 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -35,9 +35,20 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
 
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
@@ -63,7 +74,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
     spin_lock(&vm_lock);
     for ( ; ; )
     {
-        struct page_info *pg;
+        mfn_t mfn;
 
         ASSERT(vm_low[t] == vm_top[t] || !test_bit(vm_low[t], vm_bitmap(t)));
         for ( start = vm_low[t]; start < vm_top[t]; )
@@ -98,9 +109,16 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
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
 
@@ -108,7 +126,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
         {
             unsigned long va = (unsigned long)vm_bitmap(t) + vm_top[t] / 8;
 
-            if ( !map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR) )
+            if ( !map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR) )
             {
                 clear_page((void *)va);
                 vm_top[t] += PAGE_SIZE * 8;
@@ -118,7 +136,10 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
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
2.24.1.AMZN


