Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2C82F507
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668034.1039894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonf-0000wu-4J; Tue, 16 Jan 2024 19:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668034.1039894; Tue, 16 Jan 2024 19:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonf-0000uH-0u; Tue, 16 Jan 2024 19:08:39 +0000
Received: by outflank-mailman (input) for mailman id 668034;
 Tue, 16 Jan 2024 19:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoY6-0003xp-DS
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:34 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6677bad2-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:32 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-5eae960a.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:30 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2c-m6i4x-5eae960a.us-west-2.amazon.com (Postfix)
 with ESMTPS id 8FD7840E66; Tue, 16 Jan 2024 18:52:28 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:51134]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.118:2525]
 with esmtp (Farcaster)
 id 2563113d-fce9-40c4-960f-6ad2c8bd5a50; Tue, 16 Jan 2024 18:52:27 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:26 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:25 +0000
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
X-Inumbo-ID: 6677bad2-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431153; x=1736967153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6yOB72LIvzh25UA84mj42X06HmCmvwf5nDXcH1vuudI=;
  b=grrY+B6sgb7yaTRgSLvkCPfPOe60ak2w7hBC5ufxojCABWgPqrTSbD+F
   RK37bnP3sizFr30HEYmS5Wiba8ovH+6XFtpq0PdXRHgx94zvnMLAEM/gb
   mf1hgAxx4DogATjYp4nwKviIwotAS5O7Ueewxutp/msQ2STnQouZVp7Qh
   w=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="390202627"
X-Farcaster-Flow-ID: 2563113d-fce9-40c4-960f-6ad2c8bd5a50
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2] xen/arm64: Implement a mapcache for arm64
Date: Tue, 16 Jan 2024 18:50:55 +0000
Message-ID: <20240116185056.15000-27-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Julien Grall <jgrall@amazon.com>

At the moment, on arm64, map_domain_page() is implemented using
virt_to_mfn(). Therefore it is relying on the directmap.

In a follow-up patch, we will allow the admin to remove the directmap.
Therefore we want to implement a mapcache.

Thanksfully there is already one for arm32. So select ARCH_ARM_DOMAIN_PAGE
and add the necessary boiler plate to support 64-bit:
    - The page-table start at level 0, so we need to allocate the level
      1 page-table
    - map_domain_page() should check if the page is in the directmap. If
      yes, then use virt_to_mfn() to limit the performance impact
      when the directmap is still enabled (this will be selectable
      on the command line).

Take the opportunity to replace first_table_offset(...) with offsets[...].

Note that, so far, arch_mfns_in_directmap() always return true on
arm64. So the mapcache is not yet used. This will change in a
follow-up patch.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    There are a few TODOs:
        - It is becoming more critical to fix the mapcache
          implementation (this is not compliant with the Arm Arm)
        - Evaluate the performance

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1a..278243f0d6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,7 +1,6 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
-	select ARCH_MAP_DOMAIN_PAGE
 
 config ARM_64
 	def_bool y
@@ -12,6 +11,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select HAS_ALTERNATIVE
+	select ARCH_MAP_DOMAIN_PAGE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 4f339efb7b..f4a81aa705 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -4,6 +4,7 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 
@@ -236,6 +237,14 @@ void __init setup_mm(void)
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
 
+    /*
+     * The allocators may need to use map_domain_page() (such as for
+     * scrubbing pages). So we need to prepare the domheap area first.
+     */
+    if ( !init_domheap_mappings(smp_processor_id()) )
+        panic("CPU%u: Unable to prepare the domheap page-tables\n",
+              smp_processor_id());
+
     init_staticmem_pages();
 }
 
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index ac2a6d0332..0f6ba48892 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <xen/pmap.h>
 #include <xen/vmap.h>
@@ -8,6 +9,8 @@
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+#undef mfn_to_virt
+#define mfn_to_virt(va) __mfn_to_virt(mfn_x(mfn))
 
 /* cpu0's domheap page tables */
 static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
@@ -31,13 +34,30 @@ bool init_domheap_mappings(unsigned int cpu)
 {
     unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
     lpae_t *root = per_cpu(xen_pgtable, cpu);
+    lpae_t *first;
     unsigned int i, first_idx;
     lpae_t *domheap;
     mfn_t mfn;
 
+    /* Convenience aliases */
+    DECLARE_OFFSETS(offsets, DOMHEAP_VIRT_START);
+
     ASSERT(root);
     ASSERT(!per_cpu(xen_dommap, cpu));
 
+    /*
+     * On Arm64, the root is at level 0. Therefore we need an extra step
+     * to allocate the first level page-table.
+     */
+#ifdef CONFIG_ARM_64
+    if ( create_xen_table(&root[offsets[0]]) )
+        return false;
+
+    first = xen_map_table(lpae_get_mfn(root[offsets[0]]));
+#else
+    first = root;
+#endif
+
     /*
      * The domheap for cpu0 is initialized before the heap is initialized.
      * So we need to use pre-allocated pages.
@@ -58,16 +78,20 @@ bool init_domheap_mappings(unsigned int cpu)
      * domheap mapping pages.
      */
     mfn = virt_to_mfn(domheap);
-    first_idx = first_table_offset(DOMHEAP_VIRT_START);
+    first_idx = offsets[1];
     for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
     {
         lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
         pte.pt.table = 1;
-        write_pte(&root[first_idx + i], pte);
+        write_pte(&first[first_idx + i], pte);
     }
 
     per_cpu(xen_dommap, cpu) = domheap;
 
+#ifdef CONFIG_ARM_64
+    xen_unmap_table(first);
+#endif
+
     return true;
 }
 
@@ -91,6 +115,10 @@ void *map_domain_page(mfn_t mfn)
     lpae_t pte;
     int i, slot;
 
+    /* Bypass the mapcache if the page is in the directmap */
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
+        return mfn_to_virt(mfn);
+
     local_irq_save(flags);
 
     /* The map is laid out as an open-addressed hash table where each
@@ -153,13 +181,25 @@ void *map_domain_page(mfn_t mfn)
 /* Release a mapping taken with map_domain_page() */
 void unmap_domain_page(const void *ptr)
 {
+    unsigned long va = (unsigned long)ptr;
     unsigned long flags;
     lpae_t *map = this_cpu(xen_dommap);
-    int slot = ((unsigned long)ptr - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+    unsigned int slot;
+
+    /* Below we assume that the domheap area doesn't start at 0 */
+    BUILD_BUG_ON(DOMHEAP_VIRT_START == 0);
 
-    if ( !ptr )
+    /*
+     * map_domain_page() may not have mapped anything if the address
+     * is part of the directmap. So ignore anything outside of the
+     * domheap.
+     */
+    if ( (va < DOMHEAP_VIRT_START) ||
+         ((va - DOMHEAP_VIRT_START) >= DOMHEAP_VIRT_SIZE) )
         return;
 
+    slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+
     local_irq_save(flags);
 
     ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index a76578a16f..c48e51d827 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -432,6 +432,11 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+/* Helpers to allocate, map and unmap a Xen page-table */
+int create_xen_table(lpae_t *entry);
+lpae_t *xen_map_table(mfn_t mfn);
+void xen_unmap_table(const lpae_t *table);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index a3b546465b..c549420e8b 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -35,9 +35,13 @@
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x00000a8000000000 - 0x00007fffffffffff (512GB+117TB, L0 slots [21..255])
+ * 0x00000a8000000000 - 0x00007f7fffffffff (117TB, L0 slots [21..254])
  *  Unused
  *
+ * 0x00007f8000000000 - 0x00007fffffffffff (512GB, L0 slot [255])
+ *  (Relative offsets)
+ *  0  -    2G    Domheap: on-demand-mapped
+ *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
  *  1:1 mapping of RAM
  *
@@ -130,6 +134,13 @@
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
+#define DOMHEAP_VIRT_START     SLOT0(255)
+#define DOMHEAP_VIRT_SIZE      GB(2)
+
+#define DOMHEAP_ENTRIES        1024 /* 1024 2MB mapping slots */
+/* Number of domheap pagetable pages required at the second level (2MB mappings) */
+#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
+
 #define DIRECTMAP_VIRT_START   SLOT0(256)
 #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
 #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index e772ab4e66..f26b1412be 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -32,7 +32,7 @@ mm_printk(const char *fmt, ...) {}
 #define HYP_PT_ROOT_LEVEL 1
 #endif
 
-static lpae_t *xen_map_table(mfn_t mfn)
+lpae_t *xen_map_table(mfn_t mfn)
 {
     /*
      * During early boot, map_domain_page() may be unusable. Use the
@@ -44,7 +44,7 @@ static lpae_t *xen_map_table(mfn_t mfn)
     return map_domain_page(mfn);
 }
 
-static void xen_unmap_table(const lpae_t *table)
+void xen_unmap_table(const lpae_t *table)
 {
     /*
      * During early boot, xen_map_table() will not use map_domain_page()
@@ -227,7 +227,7 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static int create_xen_table(lpae_t *entry)
+int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
     void *p;
-- 
2.40.1


