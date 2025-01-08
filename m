Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6933A05FE4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867501.1279139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq6-00045U-PH; Wed, 08 Jan 2025 15:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867501.1279139; Wed, 08 Jan 2025 15:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq6-0003rk-EW; Wed, 08 Jan 2025 15:19:22 +0000
Received: by outflank-mailman (input) for mailman id 867501;
 Wed, 08 Jan 2025 15:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXq4-0008Ue-0w
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:20 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecba1b49-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:16 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so30149211a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:16 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:15 -0800 (PST)
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
X-Inumbo-ID: ecba1b49-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349556; x=1736954356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcWHO2t2N7UwLnGLQCw7cWTCMCFtS4oV7aIoPrHjvaM=;
        b=UdXmqDiOmVrAZ2I/sa/7gqtokXWMtdp0UMvvyA4ZZ5n2f+DHsD/K32V+wxV+xTqeHP
         0xZebVgylrTnAeR93o+qzKqytvIHByDP2yjl/zHiFeIqapVXMCW+BNsp/++c7/GEUg+M
         C2sNDDg0pmcg+8CNCB3maT1Dqag5ztXPznUpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349556; x=1736954356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcWHO2t2N7UwLnGLQCw7cWTCMCFtS4oV7aIoPrHjvaM=;
        b=ORMaKUXaSyTif+tA+eOtamvpaRTtPs8HbQGFrEWeM/Nghx2Vk5pBkgm9SvjPf9VhfN
         kom3OSgYzKgXMdgxAavnAzLRxqzBMka3bp0jeb5xlXzUKoNUc+lgIyx4r8rWTJTXUqdt
         q45lfWQuDJT7pTrRwMWPBw1LiaO6d3Y8d3dEg4iWOtWldfiUR8q7gNZtfnZ5ZYxSB3fk
         C/J9hkEhh6H5j7z/B2do2RRGxMFtTg+HcwEY7O9DfRdtxE11x2V24WYUQ1cunpWa1OiI
         49HKzm1z9edsfgIqOspLCkXwL7WHIfnIu6xSZ3tbpWcJHBxc6iI0cPzAL+p+tRr3GY26
         KkPw==
X-Gm-Message-State: AOJu0YxIKdEy8KMzMsGIRBJSjTxAXeToyU4eLiAUC3qn7bz+TiYjaMgK
	Q6IuLKE4BglOVqiJ/WcwHXqOBvdn73uQ544AYuPFD2x6Gi6Ppn+WhoDRL1KYAjIFmUlaMvxKgwT
	gEU8/vQ==
X-Gm-Gg: ASbGncvRw7OhMwlNpzb1tMKZxHWMJRtfl1bOInE0sqLjs18VT6TDqKfU7K8FtN0znPE
	HlQ+jARqhQKP87aygI30dolTwRFCTKytQCpAOVjUjKWuwTNDm3Fv8azHbxi7TyjOZyyMDT/xsZf
	OsZMvWNvcXiMN9oPA2NXiYK6jFNqx35UOzv3VJrG1DFjVjrZ317EX8xkPrt5OTT4HyHgRwfbZNj
	0K2yyOAkclD90hjc+iHgAzaf0ZTGKmtkt3y2kr96HNGHCadOF4upMNq+aeorI76pAS2lLKWXLWP
	/bE=
X-Google-Smtp-Source: AGHT+IF9fxsdMLev/SrCilzHh6Pzzv4UGiliFO6+R9GQV0Y5+wSNaw2EGspt7tbA+yvRoGwZ7vZbYg==
X-Received: by 2002:a05:6402:388a:b0:5d1:2631:b897 with SMTP id 4fb4d7f45d1cf-5d972e08403mr3094678a12.14.1736349555696;
        Wed, 08 Jan 2025 07:19:15 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 14/15] xen/arm64: Implement a mapcache for arm64
Date: Wed,  8 Jan 2025 15:18:21 +0000
Message-ID: <20250108151822.16030-15-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
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
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Add missing "select ARCH_MAP_DOMAIN_PAGE". It was weirdly dropped
    from v2.
  * Bugfix: Unwrap mfn_t before passing it to mfn_to_virt() in
    map_domain_page().

Elias @ v4:
There are a few TODOs:
        - It is becoming more critical to fix the mapcache
          implementation (this is not compliant with the Arm Arm)
        - Evaluate the performance
---
 xen/arch/arm/Kconfig                  |  2 +-
 xen/arch/arm/arm64/mmu/mm.c           |  9 ++++++
 xen/arch/arm/include/asm/mm.h         |  5 +++
 xen/arch/arm/include/asm/mmu/layout.h | 13 +++++++-
 xen/arch/arm/mmu/domain_page.c        | 45 ++++++++++++++++++++++++---
 xen/arch/arm/mmu/pt.c                 |  6 ++--
 6 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827c..5c31bb616608 100644
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
+	select ARCH_MAP_DOMAIN_PAGE
 	select FUNCTION_ALIGNMENT_4B
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 7de5885cc776..8e121e5ffe8d 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -5,6 +5,7 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
+#include <asm/domain_page.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
@@ -283,6 +284,14 @@ void __init setup_mm(void)
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
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 07329a17fffa..0a4dc53a6050 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -434,6 +434,11 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
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
index 19c0ec63a59a..35f4204ce76a 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -36,9 +36,13 @@
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
@@ -133,6 +137,13 @@
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
diff --git a/xen/arch/arm/mmu/domain_page.c b/xen/arch/arm/mmu/domain_page.c
index 3a43601623f0..7276c2b3b868 100644
--- a/xen/arch/arm/mmu/domain_page.c
+++ b/xen/arch/arm/mmu/domain_page.c
@@ -29,13 +29,30 @@ bool init_domheap_mappings(unsigned int cpu)
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
@@ -56,16 +73,20 @@ bool init_domheap_mappings(unsigned int cpu)
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
 
@@ -89,6 +110,10 @@ void *map_domain_page(mfn_t mfn)
     lpae_t pte;
     int i, slot;
 
+    /* Bypass the mapcache if the page is in the directmap */
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
+        return mfn_to_virt(mfn_x(mfn));
+
     local_irq_save(flags);
 
     /* The map is laid out as an open-addressed hash table where each
@@ -151,13 +176,25 @@ void *map_domain_page(mfn_t mfn)
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
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 1ed1a53ab1f2..da33c6c52e39 100644
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
2.47.1


