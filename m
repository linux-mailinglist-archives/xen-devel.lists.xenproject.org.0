Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A77B820C0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125593.1467574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08H-0001fG-Kl; Wed, 17 Sep 2025 21:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125593.1467574; Wed, 17 Sep 2025 21:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08H-0001aR-Cx; Wed, 17 Sep 2025 21:56:09 +0000
Received: by outflank-mailman (input) for mailman id 1125593;
 Wed, 17 Sep 2025 21:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08F-0007Lu-H6
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:07 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba20d68-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:56:05 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b4fb8d3a2dbso210003a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:05 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:03 -0700 (PDT)
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
X-Inumbo-ID: 1ba20d68-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146164; x=1758750964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7U+4TOofR9loysSZtzDcwVl9yN7TxjVK1uzTiKAwHE=;
        b=ngAK3NpFqTngAnn+ML1/T66GSZ1s+gjhQrTXRi5pe66XTFyOjB95RgBOuscZ0TMdY9
         FBpimrhaDg4xYlNmAKNLEay8NHcPsUQOzEybDtr/BeJclqzwu4SLsSKjWXOb5jfy4J3m
         vBa3jBCY1m8lWpvvOLqNl/mEk94J3WQcbnA1i5HOz+8rNMV4z0JUIc5TSF6fkGlcHnaU
         y6d4nwzy/X1BOFSfBgK3ePFrPZaQYI684VKCJ5oWhuIDllszKPVSNhIPyJS/8OvLAQZE
         PFVGt053s55UhJr55A4vz8OjX+CeL0k1cWTOdW640Wg3xNVZo14FT7JlFlhTH0C0LV0f
         kfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146164; x=1758750964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7U+4TOofR9loysSZtzDcwVl9yN7TxjVK1uzTiKAwHE=;
        b=DFXl6miZ40D0XxqiG95o5BnWGLvo3pb2jGyYXM/fuaKYCPoJe55VfD07fN3l98CUJk
         8H4HN+HMB1O90cigxHfOUTiNgojsu6ul1oy38/3wzKhR61mr2LfqHETgVslw6YZqMK/S
         0DbpGIafjDU2oe/V1QiUkekbCePzWjl5eph/Fhk2WK7Ch/ZFkGtKsoPTGKsg78doy6KH
         5jBJbfy1Q2ypuc/4HGzTUUrI53ggXgQK+SbkkuvUMCaSZK1W67QAvLCbJ8R+LNX3hjPk
         Y8rqrO21dnO2IKn8ukDZ6p5qp8P4BoSDj6yUvlWVkNb+YjHia30ERdDQdcEOmXq+zJvN
         cHMQ==
X-Gm-Message-State: AOJu0YxIdNl2qC/yNwrtnZ9Vax4L93Xecqtxr1Cr5/B/gO5yDfWzu0Xs
	5lT4If8OIqaWMFQt0tI/n8z2xPJpu7ufSkh/3Veg4btgKLKekHIYFi0NoOOsq2vVUlU=
X-Gm-Gg: ASbGnctdxIfnf72mscI91Cpo5LP+SsnzNO5Owyp1rgpIBtevO6mIgZk+d6ceJwwMhse
	e4AOW5XYUPyuCSGkIx5ddlkfz7H0ky4CJRqCE21/U2NT38Meo2Ol98e9n1gM9OJ4capjFF5WM8r
	ScVk0U0XlR78abz3Qf9o1lp/50NubTKm57rYTVFmUFI/PSmV1PkRKN6YL6vWqbTZSEkJ6R4madA
	0ohMOfvAW6w/Urb8G19Yd4vuxRFd+vvCkh5pI8142TAmAGLFj4NP4uvIyrvQhEzSps8vfRi3l+Y
	L4KvEwymKZY2vTFdESvgJBTc7baFH+602SePZ/607QvR0k+EskA7kwnnitIwu2fCt/d2NVujBY0
	6JeeDrXCLJZg3kt78US9+BseCOhhFfdhZUao4un2YFBOI
X-Google-Smtp-Source: AGHT+IGKiNzISMMsf0WKmsXB6YFsB1Yn53Cp4xHzKC3xZuPFi1YtGU7Po1yxBBcel6rAIeQws8EkUA==
X-Received: by 2002:a17:903:1b27:b0:266:ddd:772f with SMTP id d9443c01a7336-268119b3d31mr37327005ad.9.1758146163564;
        Wed, 17 Sep 2025 14:56:03 -0700 (PDT)
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
Subject: [PATCH v4 10/18] xen/riscv: implement p2m_set_range()
Date: Wed, 17 Sep 2025 23:55:30 +0200
Message-ID: <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch introduces p2m_set_range() and its core helper p2m_set_entry() for
RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
modifications.

The main changes are:
- Simplification of Break-Before-Make (BBM) approach as according to RISC-V
  spec:
    It is permitted for multiple address-translation cache entries to co-exist
    for the same address. This represents the fact that in a conventional
    TLB hierarchy, it is possible for multiple entries to match a single
    address if, for example, a page is upgraded to a superpage without first
    clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
    with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
    hierarchy. In this case, just as if an SFENCE.VMA is not executed between
    a write to the memory-management tables and subsequent implicit read of the
    same address: it is unpredictable whether the old non-leaf PTE or the new
    leaf PTE is used, but the behavior is otherwise well defined.
  In contrast to the Arm architecture, where BBM is mandatory and failing to
  use it in some cases can lead to CPU instability, RISC-V guarantees
  stability, and the behavior remains safe — though unpredictable in terms of
  which translation will be used.
- Unlike Arm, the valid bit is not repurposed for other uses in this
  implementation. Instead, entry validity is determined based solely on P2M
  PTE's valid bit.

The main functionality is in p2m_set_entry(), which handles mappings aligned
to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).

p2m_set_range() breaks a region down into block-aligned mappings and calls
p2m_set_entry() accordingly.

Stub implementations (to be completed later) include:
- p2m_free_subtree()
- p2m_next_level()
- p2m_pte_from_mfn()

Note: Support for shattering block entries is not implemented in this
patch and will be added separately.

Additionally, some straightforward helper functions are now implemented:
- p2m_write_pte()
- p2m_remove_pte()
- p2m_get_root_pointer()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Introduce gstage_root_level and use it for defintion of P2M_ROOT_LEVEL.
 - Introduce P2M_LEVEL_ORDER() macros and P2M_PAGETABLE_ENTRIES().
 - Add the TODO comment in p2m_write_pte() about possible perfomance
   optimization.
 - Use compound literal for `pte` variable inside p2m_clean_pte().
 - Fix the comment above p2m_next_level().
 - Update ASSERT() inside p2m_set_entry() and leave only a check of a
   target as p2m_mapping_order() that page_order will be correctly
   aligned.
 - Update the comment above declaration of `removing_mapping` in
   p2m_set_entry().
 - Stray blanks.
 - Handle possibly overflow of an amount of unmapped GFNs in case of
   some failute in p2m_set_range().
 - Handle a case when MFN is 0 and removing of such MFN is happening in
   p2m_set_entry.
 - Fix p2m_get_root_pointer() to return correct pointer to root page table.
---
Changes in V3:
 - Drop p2m_access_t connected stuff as it isn't going to be used, at least
   now.
 - Move defintion of P2M_ROOT_ORDER and P2M_ROOT_PAGES to earlier patches.
 - Update the comment above lowest_mapped_gfn declaration.
 - Update the comment above p2m_get_root_pointer(): s/"...ofset of the root
   table"/"...ofset into root table".
 - s/p2m_remove_pte/p2m_clean_pte.
 - Use plain 0 instead of 0x00 in p2m_clean_pte().
 - s/p2m_entry_from_mfn/p2m_pte_from_mfn.
 - s/GUEST_TABLE_*/P2M_TABLE_*.
 - Update the comment above p2m_next_level(): "GFN entry" -> "corresponding
   the entry corresponding to the GFN".
 - s/__p2m_set_entry/_p2m_set_entry.
 - drop "s" for sgfn and smfn prefixes of _p2m_set_entry()'s arguments
   as this function work only with one GFN and one MFN.
 - Return correct return code when p2m_next_level() faild in _p2m_set_entry(),
   also drop "else" and just handle case (rc != P2M_TABLE_NORMAL) separately.
 - Code style fixes.
 - Use unsigned int for "order" in p2m_set_entry().
 - s/p2m_set_entry/p2m_free_subtree.
 - Update ASSERT() in __p2m_set_enty() to check that page_order is propertly
   aligned.
 - Return -EACCES instead of -ENOMEM in the chase when domain is dying and
   someone called p2m_set_entry.
 - s/p2m_set_entry/p2m_set_range.
 - s/__p2m_set_entry/p2m_set_entry
 - s/p2me_is_valid/p2m_is_valid()
 - Return a number of successfully mapped GFNs in case if not all were mapped
   in p2m_set_range().
 - Use BIT(order, UL) instead of 1 << order.
 - Drop IOMMU flushing code from p2m_set_entry().
 - set p2m->need_flush=true when entry in p2m_set_entry() is changed.
 - Introduce p2m_mapping_order() to support superpages.
 - Drop p2m_is_valid() and use pte_is_valid() instead as there is no tricks
   with copying of valid bit anymore.
 - Update p2m_pte_from_mfn() prototype: drop p2m argument.
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - Update the way when p2m TLB is flushed:
 - RISC-V does't require BBM so there is no need to remove PTE before making
   new so drop 'if /*pte_is_valid(orig_pte) */' and remove PTE only removing
   has been requested.
 - Drop p2m->need_flush |= !!pte_is_valid(orig_pte); for the case when
   PTE's removing is happening as RISC-V could cache invalid PTE and thereby
   it requires to do a flush each time and it doesn't matter if PTE is valid
   or not at the moment when PTE removing is happening.
 - Drop a check if PTE is valid in case of PTE is modified as it was mentioned
   above as BBM isn't required so TLB flushing could be defered and there is
   no need to do it before modifying of PTE.
 - Drop p2m->need_flush as it seems like it will be always true.
 - Drop foreign mapping things as it isn't necessary for RISC-V right now.
 - s/p2m_is_valid/p2me_is_valid.
 - Move definition and initalization of p2m->{max_mapped_gfn,lowest_mapped_gfn}
   to this patch.
---
 xen/arch/riscv/include/asm/p2m.h |  39 +++++
 xen/arch/riscv/p2m.c             | 281 ++++++++++++++++++++++++++++++-
 2 files changed, 319 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c98cf547f1..1a43736855 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -8,12 +8,41 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
 extern unsigned long gstage_mode;
+extern unsigned int gstage_root_level;
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+#define P2M_ROOT_LEVEL  gstage_root_level
+
+/*
+ * According to the RISC-V spec:
+ *   When hgatp.MODE specifies a translation scheme of Sv32x4, Sv39x4, Sv48x4,
+ *   or Sv57x4, G-stage address translation is a variation on the usual
+ *   page-based virtual address translation scheme of Sv32, Sv39, Sv48, or
+ *   Sv57, respectively. In each case, the size of the incoming address is
+ *   widened by 2 bits (to 34, 41, 50, or 59 bits).
+ *
+ * P2M_LEVEL_ORDER(lvl) defines the bit position in the GFN from which
+ * the index for this level of the P2M page table starts. The extra 2
+ * bits added by the "x4" schemes only affect the root page table width.
+ *
+ * Therefore, this macro can safely reuse XEN_PT_LEVEL_ORDER() for all
+ * levels: the extra 2 bits do not change the indices of lower levels.
+ *
+ * The extra 2 bits are only relevant if one tried to address beyond the
+ * root level (i.e., P2M_LEVEL_ORDER(P2M_ROOT_LEVEL + 1)), which is
+ * invalid.
+ */
+#define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
+
+#define P2M_ROOT_EXTRA_BITS(lvl) (2 * ((lvl) == P2M_ROOT_LEVEL))
+
+#define P2M_PAGETABLE_ENTRIES(lvl) \
+    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl), UL))
 
 #define paddr_bits PADDR_BITS
 
@@ -52,6 +81,16 @@ struct p2m_domain {
      * when a page is needed to be fully cleared and cleaned.
      */
     bool clean_dcache;
+
+    /* Highest guest frame that's ever been mapped in the p2m */
+    gfn_t max_mapped_gfn;
+
+    /*
+     * Lowest mapped gfn in the p2m. When releasing mapped gfn's in a
+     * preemptible manner this is updated to track where to resume
+     * the search. Apart from during teardown this can only decrease.
+     */
+    gfn_t lowest_mapped_gfn;
 };
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index d8b611961c..db9f7a77ff 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -16,6 +16,7 @@
 #include <asm/riscv_encoding.h>
 
 unsigned long __ro_after_init gstage_mode;
+unsigned int __ro_after_init gstage_root_level;
 
 void __init gstage_mode_detect(void)
 {
@@ -53,6 +54,7 @@ void __init gstage_mode_detect(void)
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
             gstage_mode = mode;
+            gstage_root_level = modes[mode_idx].paging_levels - 1;
             break;
         }
     }
@@ -210,6 +212,9 @@ int p2m_init(struct domain *d)
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
     /*
      * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
      * is not ready for RISC-V support.
@@ -251,13 +256,287 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
+ *
+ * The function will return NULL if the offset into the root table is
+ * invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table_indx >= P2M_ROOT_PAGES )
+        return NULL;
+
+    /*
+     * The P2M root page table is extended by 2 bits, making its size 16KB
+     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
+     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+     * only allocates 4KB pages).
+     *
+     * To determine which of these four 4KB pages the root_table_indx falls
+     * into, we divide root_table_indx by
+     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
+     */
+    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);
+
+    return __map_domain_page(p2m->root + root_table_indx);
+}
+
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+
+    /*
+     * TODO: if multiple adjacent PTEs are written without releasing
+     *       the lock, this then redundant cache flushing can be a
+     *       performance issue.
+     */
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte = { .pte = 0 };
+
+    p2m_write_pte(p, pte, clean_pte);
+}
+
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return (pte_t) { .pte = 0 };
+}
+
+#define P2M_TABLE_MAP_NONE 0
+#define P2M_TABLE_MAP_NOMEM 1
+#define P2M_TABLE_SUPER_PAGE 2
+#define P2M_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the entry corresponding to the GFN,
+ * and map the next-level table if available. The previous table will be
+ * unmapped if the next level was mapped (e.g., when P2M_TABLE_NORMAL is
+ * returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  P2M_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return P2M_TABLE_MAP_NONE;
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_subtree(struct p2m_domain *p2m,
+                             pte_t entry, unsigned int level)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t gfn,
+                           unsigned long page_order,
+                           mfn_t mfn,
+                           p2m_type_t t)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /*
+     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
+     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
+     * are still allowed.
+     */
+    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target <= 2);
+
+    table = p2m_get_root_pointer(p2m, gfn);
+    if ( !table )
+        return -EINVAL;
+
+    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
+    {
+        /*
+         * Don't try to allocate intermediate page table if the mapping
+         * is about to be removed.
+         */
+        rc = p2m_next_level(p2m, !removing_mapping,
+                            level, &table, offsets[level]);
+        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
+        {
+            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
+             */
+            rc = removing_mapping ? 0 : rc;
+            goto out;
+        }
+
+        if ( rc != P2M_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table + offsets[level];
+
+    /*
+     * If we are here with level > target, we must be at a leaf node,
+     * and we need to break up the superpage.
+     */
+    if ( level > target )
+    {
+        panic("Shattering isn't implemented\n");
+    }
+
+    /*
+     * We should always be there with the correct level because all the
+     * intermediate tables have been installed if necessary.
+     */
+    ASSERT(level == target);
+
+    orig_pte = *entry;
+
+    if ( removing_mapping )
+        p2m_clean_pte(entry, p2m->clean_dcache);
+    else
+    {
+        pte_t pte = p2m_pte_from_mfn(mfn, t);
+
+        p2m_write_pte(entry, pte, p2m->clean_dcache);
+
+        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
+                                      gfn_add(gfn, BIT(page_order, UL) - 1));
+        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
+    }
+
+    p2m->need_flush = true;
+
+    /*
+     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
+     * is not ready for RISC-V support.
+     *
+     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
+     * here.
+     */
+#ifdef CONFIG_HAS_PASSTHROUGH
+#   error "add code to flush IOMMU TLB"
+#endif
+
+    rc = 0;
+
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     *
+     * If previously MFN 0 was mapped and it is going to be removed
+     * and considering that during removing MFN 0 is used then `entry`
+     * and `new_entry` will be the same and p2m_free_subtree() won't be
+     * called. This case is handled explicitly.
+     */
+    if ( pte_is_valid(orig_pte) &&
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
+          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
+        p2m_free_subtree(p2m, orig_pte, level);
+
+ out:
+    unmap_domain_page(table);
+
+    return rc;
+}
+
+/* Return mapping order for given gfn, mfn and nr */
+static unsigned long p2m_mapping_order(gfn_t gfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long mask;
+    /* 1gb, 2mb, 4k mappings are supported */
+    unsigned int level = min(P2M_ROOT_LEVEL, _AC(2, U));
+    unsigned long order = 0;
+
+    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+    mask |= gfn_x(gfn);
+
+    for ( ; level != 0; level-- )
+    {
+        if ( !(mask & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)) &&
+             (nr >= BIT(P2M_LEVEL_ORDER(level), UL)) )
+        {
+                order = P2M_LEVEL_ORDER(level);
+                break;
+        }
+    }
+
+    return order;
+}
+
 static int p2m_set_range(struct p2m_domain *p2m,
                          gfn_t sgfn,
                          unsigned long nr,
                          mfn_t smfn,
                          p2m_type_t t)
 {
-    return -EOPNOTSUPP;
+    int rc = 0;
+    unsigned long left = nr;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m->domain->is_dying) )
+        return -EACCES;
+
+    while ( left )
+    {
+        unsigned long order = p2m_mapping_order(sgfn, smfn, left);
+
+        rc = p2m_set_entry(p2m, sgfn, order, smfn, t);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, BIT(order, UL));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, BIT(order, UL));
+
+        left -= BIT(order, UL);
+    }
+
+    if ( left > INT_MAX )
+        rc = -EOVERFLOW;
+
+    return !left ? rc : left;
 }
 
 int map_regions_p2mt(struct domain *d,
-- 
2.51.0


