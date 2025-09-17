Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35939B820C6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125594.1467582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08I-0001vV-TU; Wed, 17 Sep 2025 21:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125594.1467582; Wed, 17 Sep 2025 21:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08I-0001hk-Kb; Wed, 17 Sep 2025 21:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1125594;
 Wed, 17 Sep 2025 21:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08G-0007Lu-9P
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:08 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c5624d9-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:56:06 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b54fc45db56so246508a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:06 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:04 -0700 (PDT)
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
X-Inumbo-ID: 1c5624d9-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146165; x=1758750965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S85/7YEfvWzEAWgm6nDQ8J3mMWbmh28C9PxVG5Fm6Vg=;
        b=HEeLLUXxFn7GKYlpm3eTbCr4d+NjkETO1IUXIDGvrWcjRdkjhNxX/0xHwW5CVarciJ
         7tl+sqBPE14glEIvxLPbAQVtmLJGnen69BU2Kwb8Ugx+49WChWHuglNxSefgN3TXmhE2
         A96TFnDUYUH2YYPbJ43mOH5a2H9X7PlxNb//InO3VPTOA52jurhdcV6QhEdHUzWeoOZE
         hCHOIkQmfYgds4asQmTPiezz56/djCFBoFKsvPO+dCpd4fpwAy0Jx5F5P0hprCYWFJzG
         1zCqYJrxiC59G9Q5Zf6Hg7DiBJMmGRQfcfOiQ55QUzaoxtTzPfWxGlTSrgxdFqLIUzGe
         Jwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146165; x=1758750965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S85/7YEfvWzEAWgm6nDQ8J3mMWbmh28C9PxVG5Fm6Vg=;
        b=aEMtNYBLZDjlH96KPmWvbmddcBVsigKWQF4SSDr2JsTAhOWY/tEqD8hPfGeu3JQqu5
         ZPE7rz+a2X5At/pd5c2owHmweDP8m7oMfqNhfWinVJDvEqDiIQb7Rs5jX98vN62iYC6l
         NcLs8nhQV0CCPhfTWzFFyG2G9Zp0aHDS21DgXnlR7LUSn5LJlrSxTmZm5qvHjigKul7u
         2Fe9YgGiUNPHgTwaHO6cJ/pA7/h50wK5SNGvMzs/ZWuZ6ZneVKPwT/LGp8ak3e6Ba3R3
         PWDc35axwXO4RzFz1jE+4Qa0eSKH3bszJ067r0pXWlLbgbb/YRhGDEkwTzTTeEX1tS89
         +pAA==
X-Gm-Message-State: AOJu0YzWKoICJJ9aocFYXX7GACO1NJW25cZQUpd3rzLmz2JU+4ack0/j
	vTlm/z4b0uNiTwuZTtp/3In5AGQHOPelQdz3CmoH+Vvnz6bkCHUn0mvZrFdh2+yHQKI=
X-Gm-Gg: ASbGncsqjluKEUHI0v0Q8ixBb0k+aJXURkQcTkE+qIaDreGqxvdH02gOGniojazMBIQ
	z4hrUs3p1qYntZx+CZv1B3vC7Rwmr2RAigxvXdHbWbg+lX3FQpVxRsAuL1ghmt+WiqXZQZFTWQi
	5jkL+Yv7KS8K2Ls+PRcf/myV23sL04ddKtjjFyVzRmE9329IAenhHRXhYoy3qANnL7EplpzGac0
	qvW8QONVRMNw9IJiz/l5JS72iuc5+giUzs/xSc2mbWXP2oIXugG6GQd/iDF3RzqPeDnIenfEhLd
	11W2pUJ0hs9nai6AwH/SIOztE00WuWP0TzJ8/zzf9lHCIdqe4KKPPBjsbAS2cMcWkA00LiVtai6
	Qf8ds3IrlIaBSSVQmjPGkq5ezmnrgnVWabXwE0ZKOQGis
X-Google-Smtp-Source: AGHT+IFz5svr8DqExqXfJbwMC1EufVubPVjC8rKYpXhjFU6hgEsvH48jLhzLOrLFQ6owjGji5fKjIQ==
X-Received: by 2002:a17:903:41ce:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-26813ef9e7dmr50447375ad.58.1758146164894;
        Wed, 17 Sep 2025 14:56:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 11/18] xen/riscv: Implement p2m_free_subtree() and related helpers
Date: Wed, 17 Sep 2025 23:55:31 +0200
Message-ID: <18ed5517721254a56e992d9cd9bc1a64672eda8a.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch introduces a working implementation of p2m_free_subtree() for RISC-V
based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
of page table entries in the P2M (physical-to-machine) mapping.

Only few things are changed:
- Introduce and use p2m_get_type() to get a type of p2m entry as
  RISC-V's PTE doesn't have enough space to store all necessary types so
  a type is stored outside PTE. But, at the moment, handle only types
  which fit into PTE's bits.

Key additions include:
- p2m_free_subtree(): Recursively frees page table entries at all levels. It
  handles both regular and superpage mappings and ensures that TLB entries
  are flushed before freeing intermediate tables.
- p2m_put_page() and helpers:
  - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
  - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
    superpage.
  - p2m_get_type(): Extracts the stored p2m_type from the PTE bits.
- p2m_free_page(): Returns a page to a domain's freelist.
- Introduce p2m_is_foreign() and connected to it things.

Defines XEN_PT_ENTRIES in asm/page.h to simplify loops over page table
entries.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Stray blanks.
 - Implement arch_flush_tlb_mask() to make the comment in p2m_put_foreign()
   clear and explicit.
 - Update the comment above p2m_is_ram() in p2m_put_4k_page() with an explanation
   why p2m_is_ram() is used.
 - Add a type check inside p2m_put_2m_superpage().
 - Swap two conditions around in p2m_free_subtree():
     if ( (level == 0) || pte_is_superpage(entry, level) )
 - Add ASSERT() inside p2m_free_subtree() to check that level is <= 2; otherwise,
   it could consume a lot of time and big memory usage because of recursion.
 - Drop page_list_del() before p2m_free_page() as page_list_del() is called
   inside p2m_free_page().
 - Update p2m_freelist's total_pages when a page is added to p2m_freelist in
   paging_free_page().
 - Introduce P2M_SUPPORTED_LEVEL_MAPPING and use it in ASSERTs() which check
   supported level.
 - Use P2M_PAGETABLE_ENTRIES as XEN_PT_ENTRIES
   doesn't takeinto  into acount that G stage root page table is
   extended by 2 bits.
 - Update prototype of p2m_put_page() to not have unnecessary changes later.
---
Changes in V3:
 - Use p2m_tlb_flush_sync(p2m) instead of p2m_force_tlb_flush_sync() in
   p2m_free_subtree().
 - Drop p2m_is_valid() implementation as pte_is_valid() is going to be used
   instead.
 - Drop p2m_is_superpage() and introduce pte_is_superpage() instead.
 - s/p2m_free_entry/p2m_free_subtree.
 - s/p2m_type_radix_get/p2m_get_type.
 - Update implementation of p2m_get_type() to get type both from PTE bits,
   other cases will be covered in a separate patch. This requires an
   introduction of new P2M_TYPE_PTE_BITS_MASK macros.
 - Drop p2m argument of p2m_get_type() as it isn't needed anymore.
 - Put cheapest checks first in p2m_is_superpage().
 - Use switch() in p2m_put_page().
 - Update the comment in p2m_put_foreign_page().
 - Code style fixes.
 - Move p2m_foreign stuff to this commit.
 - Drop p2m argument of p2m_put_page() as itsn't used anymore.
---
Changes in V2:
 - New patch. It was a part of 2ma big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - s/p2m_is_superpage/p2me_is_superpage.
---
 xen/arch/riscv/include/asm/flushtlb.h |   6 +-
 xen/arch/riscv/include/asm/p2m.h      |  18 ++-
 xen/arch/riscv/include/asm/page.h     |   6 +
 xen/arch/riscv/include/asm/paging.h   |   2 +
 xen/arch/riscv/p2m.c                  | 152 +++++++++++++++++++++++++-
 xen/arch/riscv/paging.c               |   8 ++
 xen/arch/riscv/stubs.c                |   5 -
 7 files changed, 187 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index e70badae0c..ab32311568 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -41,8 +41,10 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
     BUG_ON("unimplemented");
 }
 
-/* Flush specified CPUs' TLBs */
-void arch_flush_tlb_mask(const cpumask_t *mask);
+static inline void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+    sbi_remote_hfence_gvma(mask, 0, 0);
+}
 
 #endif /* ASM__RISCV__FLUSHTLB_H */
 
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 1a43736855..29685c7852 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -106,6 +106,8 @@ typedef enum {
     p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
                            PTE_PBMT_IO will be used for such mappings */
     p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
 
     /* Sentinel — not a real type, just a marker for comparison */
     p2m_first_external = p2m_ext_storage,
@@ -116,15 +118,29 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
     return p2m_mmio_direct_io;
 }
 
+/*
+ * Bits 8 and 9 are reserved for use by supervisor software;
+ * the implementation shall ignore this field.
+ * We are going to use to save in these bits frequently used types to avoid
+ * get/set of a type from radix tree.
+ */
+#define P2M_TYPE_PTE_BITS_MASK  0x300
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(t) BIT(t, UL)
 
 /* RAM types, which map to real machine frames */
 #define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
 
+/* Foreign mappings types */
+#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
+                           p2m_to_mask(p2m_map_foreign_ro))
+
 /* Useful predicates */
 #define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
-#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & \
+                            (P2M_RAM_TYPES | P2M_FOREIGN_TYPES))
+#define p2m_is_foreign(t) (p2m_to_mask(t) & P2M_FOREIGN_TYPES)
 
 #include <xen/p2m-common.h>
 
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 66cb192316..cb303af0c0 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -20,6 +20,7 @@
 #define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
 #define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
 #define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
+#define XEN_PT_ENTRIES              (_AT(unsigned int, 1) << PAGETABLE_ORDER)
 
 /*
  * PTE format:
@@ -182,6 +183,11 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
 
+static inline bool pte_is_superpage(pte_t p, unsigned int level)
+{
+    return (level > 0) && pte_is_mapping(p);
+}
+
 static inline int clean_and_invalidate_dcache_va_range(const void *p,
                                                        unsigned long size)
 {
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index befad14f82..9712aa77c5 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -13,4 +13,6 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
 int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages);
 int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
 
+void paging_free_page(struct domain *d, struct page_info *pg);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index db9f7a77ff..10acfa0a9c 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -98,6 +98,8 @@ void __init gstage_mode_detect(void)
     local_hfence_gvma_all();
 }
 
+#define P2M_SUPPORTED_LEVEL_MAPPING 2
+
 /*
  * Force a synchronous P2M TLB flush.
  *
@@ -286,6 +288,16 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
+static p2m_type_t p2m_get_type(const pte_t pte)
+{
+    p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
+
+    if ( type == p2m_ext_storage )
+        panic("unimplemented\n");
+
+    return type;
+}
+
 static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
 {
     write_pte(p, pte);
@@ -342,11 +354,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return P2M_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It’s safe to call put_page() here because arch_flush_tlb_mask()
+     * will be invoked if the page is reallocated before the end of
+     * this loop, which will trigger a flush of the guest TLBs.
+     */
+    put_page(pg);
+}
+
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    if ( p2m_is_foreign(type) )
+    {
+        ASSERT(mfn_valid(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
+    }
+}
+
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    /*
+     * TODO: Handle other p2m types, but be aware that any changes to handle
+     * different types should require an update on the relinquish code to
+     * handle preemption.
+     */
+    if ( !p2m_is_foreign(type) )
+        return;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(1); i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+
+    ASSERT(pte_is_valid(pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    switch ( level )
+    {
+    case 1:
+        return p2m_put_2m_superpage(mfn, p2mt);
+
+    case 0:
+        return p2m_put_4k_page(mfn, p2mt);
+
+    default:
+        assert_failed("Unsupported level");
+        break;
+    }
+}
+
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
+{
+    page_list_del(pg, &p2m->pages);
+
+    paging_free_page(p2m->domain, pg);
+}
+
 /* Free pte sub-tree behind an entry */
 static void p2m_free_subtree(struct p2m_domain *p2m,
                              pte_t entry, unsigned int level)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /*
+     * Check if the level is valid: only 4K - 2M - 1G mappings are supported.
+     * To support levels > 2, the implementation of p2m_free_subtree() would
+     * need to be updated, as the current recursive approach could consume
+     * excessive time and memory.
+     */
+    ASSERT(level <= P2M_SUPPORTED_LEVEL_MAPPING);
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( (level == 0) || pte_is_superpage(entry, level) )
+    {
+        p2m_type_t p2mt = p2m_get_type(entry);
+
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
+             domain_has_ioreq_server(p2m->domain) )
+            ioreq_request_mapcache_invalidate(p2m->domain);
+#endif
+
+        p2m_put_page(entry, level, p2mt);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(level); i++ )
+        p2m_free_subtree(p2m, table[i], level - 1);
+
+    unmap_domain_page(table);
+
+    /*
+     * Make sure all the references in the TLB have been removed before
+     * freing the intermediate page table.
+     * XXX: Should we defer the free of the page table to avoid the
+     * flush?
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    p2m_free_page(p2m, pg);
 }
 
 /*
@@ -377,7 +525,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      * Check if the level target is valid: we only support
      * 4K - 2M - 1G mapping.
      */
-    ASSERT(target <= 2);
+    ASSERT(target <= P2M_SUPPORTED_LEVEL_MAPPING);
 
     table = p2m_get_root_pointer(p2m, gfn);
     if ( !table )
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index ed537fee07..049b850e03 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -107,6 +107,14 @@ int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
     return 0;
 }
 
+void paging_free_page(struct domain *d, struct page_info *pg)
+{
+    spin_lock(&d->arch.paging.lock);
+    page_list_add_tail(pg, &d->arch.paging.freelist);
+    ACCESS_ONCE(d->arch.paging.total_pages)++;
+    spin_unlock(&d->arch.paging.lock);
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 1a8c86cd8d..ad6fdbf501 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,11 +65,6 @@ int arch_monitor_domctl_event(struct domain *d,
 
 /* smp.c */
 
-void arch_flush_tlb_mask(const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void smp_send_event_check_mask(const cpumask_t *mask)
 {
     BUG_ON("unimplemented");
-- 
2.51.0


