Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42540B17481
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065922.1431304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViA-0000MA-A1; Thu, 31 Jul 2025 16:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065922.1431304; Thu, 31 Jul 2025 16:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViA-0000K2-76; Thu, 31 Jul 2025 16:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1065922;
 Thu, 31 Jul 2025 16:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgB-0001FB-Mi
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:51 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fbad327-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:50 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-555024588b1so1294000e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:50 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:48 -0700 (PDT)
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
X-Inumbo-ID: 3fbad327-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977529; x=1754582329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StTBO6QPLNBjKleSGjDNqc33RY5wJ7PjLuBf0sj/FWM=;
        b=LVR7NiMbmoAwkTBfz6lKXP2OfexGvgAvxRIIqe2c9s8eyTX9OvN9ts/bqBHd4IVX0m
         +Hfv4SCY8fecb4QDEc2Hc6Ig0GxVI0e63TkijLVC2vP7FvDcIwQfd5T1wkpL6g67dqyA
         edYVVYxmzKk2oqEtAuZrvJAi828DnIfnkRT812hoGHPxka5F2Wu+LXoLc3gTl3KJvl3s
         BckPl7acusUI6eOkPMUNUc+aCAait+CJXhACidBWHTqM/lcWl9KOx8XSD4diSQq4JFxH
         3DUx1UV3K5BQ8fjSKtZNT8UVKm/VszVqTzSXutd7ETTM54IMhSBM8u4tLRKaC7kUj2/4
         2QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977529; x=1754582329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StTBO6QPLNBjKleSGjDNqc33RY5wJ7PjLuBf0sj/FWM=;
        b=ELXB35eY8Mnz8xdXtPXVoFSEcek5Cmuh2cYk/cx+odsxxCwf73z8UYdgnL8Ir5lPXs
         sz1bDfv4OsII06OMNGt2wnfbBUACI7pt1Yeyrmn5cFjQ+VJTeAEBJu6AqxqoOaj6JWbH
         1WusH61OtTVu6kcZo1b3P+BvIOHRvy8RaR83ZwJnDb63J3El08IjEXd4vEvFC0CGiJxy
         EeXK+PtT630+FUsq2Vfdx7N1V2U9OG8/06h3mL5BQLx7w3Q15nr/e8iUtFj8ryh7T39D
         gCajqC0Kz/gXQaaWxHlUiC9irHVwWwLF6yn+EWJDzq4HN5WNOda1oOU7r4/XuKgab887
         5sWg==
X-Gm-Message-State: AOJu0YxtM+j6YyleHUDhQHonXlKycY8566He834XovsN20BGM4/1jn0J
	hyWigRXMevkMkwmxl5/nL0PnS1D2KLiEGW1PQqihiWWpcRpSaohisrNbn5XCCg==
X-Gm-Gg: ASbGncvRVmcRXpnUhw1Xwy/shUyhjGuSt3g8BbYEMM27873sKxWTfJBlsVp2nf5lToe
	pSF/WtKIf0tFmCqSRx6UIogqkXuu2GNj/lRNMTEP6pgHXqJysBbjn97+mEkF+VLoJDuyA5iR4Vw
	jo6a3TK0Ek9QMnNX9U7w6qd1PITlVKYL5q4rL+FuG7CYQT+pVdKX55/SG0Gd9L0uP5jopc3QeQv
	sg0lc8cmYNjusMnPv+XoMf7heRmp2K2ROJthkcLz3PvCy3lg31VufNVBs2Lr/P/bipT/hUvBPBp
	cwVEe7R0gNgydUtSv9gjMvbsENMEA8hHd/D7rhEVRwIJZIn7/T8ORwjdI9C7MDVnRnUd9gvNRIX
	f40yaWs1qiGYXuYT0L+NdlHEcxL0GV1+XoeK2s/5+fj/gUfZdRLDjcZpAz89h9eBQ4mDa/oX7
X-Google-Smtp-Source: AGHT+IFPZNBVWzDAkCO16wEd9+4o4LZMpnG6Ew5Mfti5hJlpZGh0FHkTWJfx8oFmIsWfmGud0tXF9Q==
X-Received: by 2002:a05:6512:a95:b0:553:510d:f46b with SMTP id 2adb3069b0e04-55b7c071824mr3451131e87.32.1753977529096;
        Thu, 31 Jul 2025 08:58:49 -0700 (PDT)
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
Subject: [PATCH v3 13/20] xen/riscv: Implement p2m_free_subtree() and related helpers
Date: Thu, 31 Jul 2025 17:58:12 +0200
Message-ID: <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/p2m.h    |  18 +++-
 xen/arch/riscv/include/asm/page.h   |   6 ++
 xen/arch/riscv/include/asm/paging.h |   2 +
 xen/arch/riscv/p2m.c                | 137 +++++++++++++++++++++++++++-
 xen/arch/riscv/paging.c             |   7 ++
 5 files changed, 168 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 26ad87b8df..fbc73448a7 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -79,10 +79,20 @@ typedef enum {
     p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
     p2m_grant_map_rw,   /* Read/write grant mapping */
     p2m_grant_map_ro,   /* Read-only grant mapping */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
 } p2m_type_t;
 
 #define p2m_mmio_direct p2m_mmio_direct_io
 
+/*
+ * Bits 8 and 9 are reserved for use by supervisor software;
+ * the implementation shall ignore this field.
+ * We are going to use to save in these bits frequently used types to avoid
+ * get/set of a type from radix tree.
+ */
+#define P2M_TYPE_PTE_BITS_MASK  0x300
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(t_) BIT(t_, UL)
 
@@ -93,10 +103,16 @@ typedef enum {
 #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
                          p2m_to_mask(p2m_grant_map_ro))
 
+                            /* Foreign mappings types */
+#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
+                           p2m_to_mask(p2m_map_foreign_ro))
+
 /* Useful predicates */
 #define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
 #define p2m_is_any_ram(t_) (p2m_to_mask(t_) & \
-                            (P2M_RAM_TYPES | P2M_GRANT_TYPES))
+                            (P2M_RAM_TYPES | P2M_GRANT_TYPES | \
+                             P2M_FOREIGN_TYPES))
+#define p2m_is_foreign(t_) (p2m_to_mask(t_) & P2M_FOREIGN_TYPES)
 
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
index 557fbd1abc..c9063b7f76 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -12,4 +12,6 @@ int paging_freelist_init(struct domain *d, unsigned long pages,
 
 bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages);
 
+void paging_free_page(struct domain *d, struct page_info *pg);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 6c99719c66..2467e459cc 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -197,6 +197,16 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
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
@@ -248,11 +258,136 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
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
+
+    /*
+     * Detect the xenheap page and mark the stored GFN as invalid.
+     * We don't free the underlying page until the guest requested to do so.
+     * So we only need to tell the page is not mapped anymore in the P2M by
+     * marking the stored GFN as invalid.
+     */
+    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
+}
+
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const pte_t pte, unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_get_type(pte);
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
+        return p2m_put_2m_superpage(mfn, p2m_type);
+
+    case 0:
+        return p2m_put_4k_page(mfn, p2m_type);
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
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( pte_is_superpage(entry, level) || (level == 0) )
+    {
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
+        p2m_put_page(entry, level);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
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
+    page_list_del(pg, &p2m->pages);
+    p2m_free_page(p2m, pg);
 }
 
 /*
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index bbe1186900..853e0e14c6 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -84,6 +84,13 @@ bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
     return true;
 }
 
+void paging_free_page(struct domain *d, struct page_info *pg)
+{
+    spin_lock(&d->arch.paging.lock);
+    page_list_add_tail(pg, &d->arch.paging.freelist);
+    spin_unlock(&d->arch.paging.lock);
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
-- 
2.50.1


