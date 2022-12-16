Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96C64EB4D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464567.723021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69en-0007sE-7r; Fri, 16 Dec 2022 12:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464567.723021; Fri, 16 Dec 2022 12:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69en-0007mS-0p; Fri, 16 Dec 2022 12:17:41 +0000
Received: by outflank-mailman (input) for mailman id 464567;
 Fri, 16 Dec 2022 12:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007LR-S6
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-000346-KU; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DP-0004sN-UP; Fri, 16 Dec 2022 11:49:24 +0000
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
	bh=CKARFD/JuIFH+12h1mCsTef+zC+DdBGXMOxyO40T+VE=; b=DfWQTxI833VghcPVaObhkv8mmj
	IGlaC4xXPYVQOlW5mgr9i3cecgEpJG6KgM+TqUULclYbbruYehFkAaxttk1VBqd9IpNXbQvcU5iDS
	KY2GIMtKOV5aouN6JJA9munAIlS5nul2zEW98NC+ZzAxnAvvqmb1qI4aohAAh50zE+tg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 21/22] xen/arm64: Implement a mapcache for arm64
Date: Fri, 16 Dec 2022 11:48:52 +0000
Message-Id: <20221216114853.8227-22-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

----

    There are a few TODOs:
        - It is becoming more critical to fix the mapcache
          implementation (this is not compliant with the Arm Arm)
        - Evaluate the performance
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/domain_page.c        | 47 +++++++++++++++++++++++++++----
 xen/arch/arm/include/asm/config.h |  7 +++++
 xen/arch/arm/include/asm/mm.h     |  5 ++++
 xen/arch/arm/mm.c                 |  6 ++--
 xen/arch/arm/setup.c              |  4 +++
 6 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c7f..9c58b2d5c3aa 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select ARM_EFI
 	select HAS_FAST_MULTIPLY
+	select ARCH_MAP_DOMAIN_PAGE
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index 4540b3c5f24c..f3547dc853ef 100644
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
@@ -151,15 +179,24 @@ void *map_domain_page(mfn_t mfn)
 }
 
 /* Release a mapping taken with map_domain_page() */
-void unmap_domain_page(const void *va)
+void unmap_domain_page(const void *ptr)
 {
+    unsigned long va = (unsigned long)ptr;
     unsigned long flags;
     lpae_t *map = this_cpu(xen_dommap);
-    int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+    unsigned int slot;
 
-    if ( !va )
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
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..12b7f1f1b9ea 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -156,6 +156,13 @@
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
 #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
 #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 7a2c775f9562..d73abf1bf763 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -416,6 +416,11 @@ static inline bool arch_has_directmap(void)
     return true;
 }
 
+/* Helpers to allocate, map and unmap a Xen page-table */
+int create_xen_table(lpae_t *entry);
+lpae_t *xen_map_table(mfn_t mfn);
+void xen_unmap_table(const lpae_t *table);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 2af751af9003..f5fb957554a5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -177,7 +177,7 @@ static void __init __maybe_unused build_assertions(void)
 #undef CHECK_SAME_SLOT
 }
 
-static lpae_t *xen_map_table(mfn_t mfn)
+lpae_t *xen_map_table(mfn_t mfn)
 {
     /*
      * During early boot, map_domain_page() may be unusable. Use the
@@ -189,7 +189,7 @@ static lpae_t *xen_map_table(mfn_t mfn)
     return map_domain_page(mfn);
 }
 
-static void xen_unmap_table(const lpae_t *table)
+void xen_unmap_table(const lpae_t *table)
 {
     /*
      * During early boot, xen_map_table() will not use map_domain_page()
@@ -699,7 +699,7 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static int create_xen_table(lpae_t *entry)
+int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
     void *p;
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 88d9d90fb5ad..b1a8f91bb385 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -923,6 +923,10 @@ static void __init setup_mm(void)
      */
     populate_boot_allocator();
 
+    if ( !init_domheap_mappings(smp_processor_id()) )
+        panic("CPU%u: Unable to prepare the domheap page-tables\n",
+              smp_processor_id());
+
     total_pages = 0;
 
     for ( i = 0; i < banks->nr_banks; i++ )
-- 
2.38.1


