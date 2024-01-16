Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F282F544
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668079.1039974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4u-0003HV-E1; Tue, 16 Jan 2024 19:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668079.1039974; Tue, 16 Jan 2024 19:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4u-0003F8-Aj; Tue, 16 Jan 2024 19:26:28 +0000
Received: by outflank-mailman (input) for mailman id 668079;
 Tue, 16 Jan 2024 19:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp4s-0002iI-Kv
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:26 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2306d3fa-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:24 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:23 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix)
 with ESMTPS id DA21380750; Tue, 16 Jan 2024 19:26:19 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:34232]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id e3eca962-163c-4e87-9189-8e1da0e3c898; Tue, 16 Jan 2024 19:26:19 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:18 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:18 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2306d3fa-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433184; x=1736969184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3bfMq1Uef4k7zIlKxhavHHhyVuwSclhXcQaPCDrDa7g=;
  b=U2mekgigfQlp97fKeRfKjC/qPWGbEmz4IGoFfdKDtubzcHxaSflsjfG6
   5K9mtCaBhSLR2/z2mDnHYJviq35/vO6zXD/dG+xk5D1gVQ541cin8ZtXq
   C7JPbYCs2Goos6ShROhNsfC3ru6OGglQ9UGhV25OUGAySGg5sPfE/BDZU
   Q=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="627983547"
X-Farcaster-Flow-ID: e3eca962-163c-4e87-9189-8e1da0e3c898
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, David Woodhouse
	<dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 02/27] x86/setup: Move vm_init() before acpi calls
Date: Tue, 16 Jan 2024 19:25:46 +0000
Message-ID: <20240116192611.41112-3-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Wei Liu <wei.liu2@citrix.com>

After the direct map removal, pages from the boot allocator are not
going to be mapped in the direct map. Although we have map_domain_page,
they are ephemeral and are less helpful for mappings that are more than a
page, so we want a mechanism to globally map a range of pages, which is
what vmap is for. Therefore, we bring vm_init into early boot stage.

To allow vmap to be initialised and used in early boot, we need to
modify vmap to receive pages from the boot allocator during early boot
stage.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: David Woodhouse <dwmw2@amazon.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        - The return of map_pages_to_xen() is now checked in a separate
          patch
        - Clarify the commit message
        - Group the new boolean with the others

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 59dd9bb25a..7e28f62d09 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -748,6 +748,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
 
     setup_mm();
 
+    vm_init();
+
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
@@ -759,8 +761,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
      */
     system_state = SYS_STATE_boot;
 
-    vm_init();
-
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 897b7e9208..4d0c90b7a0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -989,6 +989,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
+    bool vm_init_done = false;
     int ret;
     struct ns16550_defaults ns16550 = {
         .data_bits = 8,
@@ -1531,12 +1532,23 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1722,6 +1734,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     init_frametable();
 
+    if ( !vm_init_done )
+        vm_init();
+
     if ( !acpi_boot_table_init_done )
         acpi_boot_table_init();
 
@@ -1761,12 +1776,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
index 830f64c5ef..fc5c70da4d 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -34,10 +34,19 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
 
     for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
     {
-        struct page_info *pg = alloc_domheap_page(NULL, 0);
+        mfn_t mfn;
         int rc;
 
-        rc = map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
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
         BUG_ON(rc);
 
         clear_page((void *)va);
@@ -65,7 +74,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
     spin_lock(&vm_lock);
     for ( ; ; )
     {
-        struct page_info *pg;
+        mfn_t mfn;
 
         ASSERT(vm_low[t] == vm_top[t] || !test_bit(vm_low[t], vm_bitmap(t)));
         for ( start = vm_low[t]; start < vm_top[t]; )
@@ -100,9 +109,16 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
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
 
@@ -110,7 +126,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
         {
             unsigned long va = (unsigned long)vm_bitmap(t) + vm_top[t] / 8;
 
-            if ( !map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR) )
+            if ( !map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR) )
             {
                 clear_page((void *)va);
                 vm_top[t] += PAGE_SIZE * 8;
@@ -120,7 +136,10 @@ static void *vm_alloc(unsigned int nr, unsigned int align,
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
2.40.1


