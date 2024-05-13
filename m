Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFCA8C3F8C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720823.1123874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TbF-0007up-KB; Mon, 13 May 2024 11:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720823.1123874; Mon, 13 May 2024 11:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TbE-0007c5-WD; Mon, 13 May 2024 11:12:09 +0000
Received: by outflank-mailman (input) for mailman id 720823;
 Mon, 13 May 2024 11:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6TbC-0003MC-BK
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:12:06 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6b2f0d-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:12:03 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:12:00 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:51808]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.61.78:2525]
 with esmtp (Farcaster)
 id 41b2d30f-ddb1-4efb-88b6-74e78337e70b; Mon, 13 May 2024 11:11:59 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:59 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:59 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:58 +0000
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
X-Inumbo-ID: 9f6b2f0d-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598723; x=1747134723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xrly80bM9b4Iylo4MumX8GuIMjwgPtJngKOUTgszWKw=;
  b=NNSZ4aiOHDISjYhEmI2cPwno0y4heS2Sv78NGsBVFBfKshrdXdegk25/
   jFeoToBxM9IYr8oiVqy2jJy+CRdvZW61ffpElN8a1I17RqejfY/jHuRPP
   i0xRkm08MkGArh19vdAuFS303PKiqA1DMOnqTx0WmlnG70rJUDpZDiiu+
   s=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88736903"
X-Farcaster-Flow-ID: 41b2d30f-ddb1-4efb-88b6-74e78337e70b
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 18/19] xen/arm64: Implement a mapcache for arm64
Date: Mon, 13 May 2024 11:11:16 +0000
Message-ID: <20240513111117.68828-19-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
index 21d03d9f44..0462960fc7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,7 +1,6 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
-	select ARCH_MAP_DOMAIN_PAGE
 
 config ARM_64
 	def_bool y
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 2ec1ffe1dc..826864d25d 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -4,6 +4,7 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
@@ -237,6 +238,14 @@ void __init setup_mm(void)
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
     init_sharedmem_pages();
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
index 60e0122cba..610dfa0466 100644
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
index 1ed1a53ab1..da33c6c52e 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -33,7 +33,7 @@ mm_printk(const char *fmt, ...) {}
 #define HYP_PT_ROOT_LEVEL 1
 #endif
 
-static lpae_t *xen_map_table(mfn_t mfn)
+lpae_t *xen_map_table(mfn_t mfn)
 {
     /*
      * During early boot, map_domain_page() may be unusable. Use the
@@ -45,7 +45,7 @@ static lpae_t *xen_map_table(mfn_t mfn)
     return map_domain_page(mfn);
 }
 
-static void xen_unmap_table(const lpae_t *table)
+void xen_unmap_table(const lpae_t *table)
 {
     /*
      * During early boot, xen_map_table() will not use map_domain_page()
@@ -228,7 +228,7 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static int create_xen_table(lpae_t *entry)
+int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
     void *p;
-- 
2.40.1


