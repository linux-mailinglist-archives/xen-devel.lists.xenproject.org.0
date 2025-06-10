Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60863AD380F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010794.1389092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfv-00082k-Gk; Tue, 10 Jun 2025 13:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010794.1389092; Tue, 10 Jun 2025 13:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfv-0007to-79; Tue, 10 Jun 2025 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1010794;
 Tue, 10 Jun 2025 13:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfr-0004Sm-Qm
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3dcafd2-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad8826c05f2so1032951666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:53 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:52 -0700 (PDT)
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
X-Inumbo-ID: a3dcafd2-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560753; x=1750165553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKgMuqwtGlngKUtxs7WkqY46iwjdHqw/qZ4SKOhC8y4=;
        b=FCYOwUWE5szHaOoORZcTt73x45EFNkV4QLHrSyKYkZbG3w5SHTWV4FpAqhPyAmYvNg
         rCCpTdiHizF6Iny8XLhDnYEBmda18G5L8B74IruRMx/i6q1o8ngfziI4BXc8YDraI4Tj
         0wnu3KliP8nvFke7MOA9qrF817Bih7HylSab13tBv+bytU2/i0iiIbBUExdvNtGdhmSl
         8kUCT9XjCaCLGTbf9x5j2FUOKTmTt8BkonCt/XogV3yfk05a04N5aCH5oW9WPstOYRzS
         8Ow1u7oBbzjaAzUsex6AVE1d+jkGkkvmaNN7zpdnx2F1t/bUbC2/rdk3te5XZv3K0Tka
         E4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560753; x=1750165553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKgMuqwtGlngKUtxs7WkqY46iwjdHqw/qZ4SKOhC8y4=;
        b=ndbSuFoOLR8Nlp4eNG+nR1fFSNalnlI3ZdBcndB/Ew/GIqj27Zu/ZgHmlcZDItyb/I
         B6LpLZhGAi8KlGuPFn1GLfb4nXNSN3X0Ck9U2Wel3M4sqY1jfJdw0yEHLwYE2nJR5ODQ
         PNLU3grAI28L5ipg2Kp/XnUwYCofaMSBiG03+xMNpJT8beGilZnjYiOPJA9fRvXnAVsZ
         zb9L6mUGdn8riBmW7+BbXrw+oHd5oKHEvW2kh01rsVUT3fnIhTT/vP3GUvsqvOO4igjp
         grByP+f+0XdplANrbHNAiDUL/Ymda3Z9ANrDtGzrZlJjvV8LS7RvZaFnGLeUdh8bTkbC
         SK8A==
X-Gm-Message-State: AOJu0YxQCmFfXU8rkrv3Q9OU4Z0bBBGy34lrx0QOB0IjhnG/DNx+ZwwU
	82aPmg/CpblRyqo4i2/A97mfA6RsKWei7+HbsloaLOKYH8VD/xewaQK7yqSg+w==
X-Gm-Gg: ASbGncvfl+NAmvZ19tXQCMqHhZpiDgTvv/YgW/r3Op9nqz/ZP04IpaeQ6lcK0DJr9H+
	aBz5PF6ZRZovXeD1Or6pJmFcjUkAmHEkzAh5JWKcfGgpuwo06oXgRah3uFpzTd+kGdSOgo+yebY
	R5V/6z+U/sZkJqXlQlJNWPm5Nmp4dKlBrQf3q0StYqKmoCIp9/2NeQ3kdbGjw9tuqYzXA7usLH8
	rATYD6swroaHwZUTNT8zfhftr7UlQNYMdKEDsFv9GIv4shFLHtjEG8BnTA6gzxkduQsOZv+8Q9f
	YBek2xmlxRDrJYblqlSUbANW2sXD7UVRYcQSWjMSF+m7dwBQWIsOrWB6ezAYdPXvsyAz3oNOaZi
	bKPmQhsSG9VjwIRMQPqFQ1vTBP5s0
X-Google-Smtp-Source: AGHT+IE/MrshjTl9H2fGWoqTEfbobX3NFO8EvJMxaYOPyEN628kL3PsU5h5YcCUYk6w2ymkbH+oNww==
X-Received: by 2002:a17:907:d16:b0:ad9:f54f:70a2 with SMTP id a640c23a62f3a-ade1aa07b5fmr1528915966b.22.1749560752677;
        Tue, 10 Jun 2025 06:05:52 -0700 (PDT)
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
Subject: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and __p2m_set_entry()
Date: Tue, 10 Jun 2025 15:05:26 +0200
Message-ID: <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
modifications.

Key differences include:
- TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
  break-before-make (BBM). As a result, the flushing logic is simplified.
  TLB invalidation can be deferred until p2m_write_unlock() is called.
  Consequently, the p2m->need_flush flag is always considered true and is
  removed.
- Page Table Traversal: The order of walking the page tables differs from Arm,
  and this implementation reflects that reversed traversal.
- Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
  P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.

The main functionality is in __p2m_set_entry(), which handles mappings aligned
to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).

p2m_set_entry() breaks a region down into block-aligned mappings and calls
__p2m_set_entry() accordingly.

Stub implementations (to be completed later) include:
- p2m_free_entry()
- p2m_next_level()
- p2m_entry_from_mfn()
- p2me_is_valid()

Note: Support for shattering block entries is not implemented in this patch
and will be added separately.

Additionally, some straightforward helper functions are now implemented:
- p2m_write_pte()
- p2m_remove_pte()
- p2m_get_root_pointer()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/p2m.h |  16 ++
 xen/arch/riscv/p2m.c             | 260 ++++++++++++++++++++++++++++++-
 2 files changed, 275 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index af2025b9fd..fdebd18356 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -9,8 +9,13 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
+#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
+#define P2M_ROOT_ORDER  XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)
+#define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -49,6 +54,17 @@ struct p2m_domain {
 
     /* Current VMID in use */
     uint16_t vmid;
+
+    /* Highest guest frame that's ever been mapped in the p2m */
+    gfn_t max_mapped_gfn;
+
+    /*
+     * Lowest mapped gfn in the p2m. When releasing mapped gfn's in a
+     * preemptible manner this is update to track recall where to
+     * resume the search. Apart from during teardown this can only
+     * decrease.
+     */
+    gfn_t lowest_mapped_gfn;
 };
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index cea37c8bda..27499a86bb 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -231,6 +231,8 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
     p2m->vmid = INVALID_VMID;
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
 
     p2m->default_access = p2m_access_rwx;
 
@@ -325,6 +327,214 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
+ *
+ * The function will return NULL if the offset of the root table is
+ * invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table_indx >= P2M_ROOT_PAGES )
+        return NULL;
+
+    return __map_domain_page(p2m->root + root_table_indx);
+}
+
+static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
+{
+    panic("%s: isn't implemented for now\n", __func__);
+
+    return false;
+}
+
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&pte, 0x00, sizeof(pte));
+    p2m_write_pte(p, pte, clean_pte);
+}
+
+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
+                                p2m_type_t t, p2m_access_t a)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return (pte_t) { .pte = 0 };
+}
+
+#define GUEST_TABLE_MAP_NONE 0
+#define GUEST_TABLE_MAP_NOMEM 1
+#define GUEST_TABLE_SUPER_PAGE 2
+#define GUEST_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the corresponding GFN entry,
+ * and map the next table, if available. The previous table will be
+ * unmapped if the next level was mapped (e.g GUEST_TABLE_NORMAL
+ * returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  GUEST_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  GUEST_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  GUEST_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  GUEST_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return GUEST_TABLE_MAP_NONE;
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_entry(struct p2m_domain *p2m,
+                           pte_t entry, unsigned int level)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int __p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t sgfn,
+                           unsigned int page_order,
+                           mfn_t smfn,
+                           p2m_type_t t,
+                           p2m_access_t a)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target <= 2);
+
+    table = p2m_get_root_pointer(p2m, sgfn);
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
+        if ( (rc == GUEST_TABLE_MAP_NONE) || (rc == GUEST_TABLE_MAP_NOMEM) )
+        {
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
+             */
+            rc = removing_mapping ?  0 : -ENOENT;
+            goto out;
+        }
+        else if ( rc != GUEST_TABLE_NORMAL )
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
+     * We should always be there with the correct level because
+     * all the intermediate tables have been installed if necessary.
+     */
+    ASSERT(level == target);
+
+    orig_pte = *entry;
+
+    /*
+     * The access type should always be p2m_access_rwx when the mapping
+     * is removed.
+     */
+    ASSERT(!mfn_eq(INVALID_MFN, smfn) || (a == p2m_access_rwx));
+
+    if ( removing_mapping )
+        p2m_remove_pte(entry, p2m->clean_pte);
+    else {
+        pte_t pte = p2m_entry_from_mfn(p2m, smfn, t, a);
+
+        p2m_write_pte(entry, pte, p2m->clean_pte);
+
+        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
+                                      gfn_add(sgfn, (1UL << page_order) - 1));
+        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, sgfn);
+    }
+
+#ifdef CONFIG_HAS_PASSTHROUGH
+    if ( is_iommu_enabled(p2m->domain) &&
+         (pte_is_valid(orig_pte) || pte_is_valid(*entry)) )
+    {
+        unsigned int flush_flags = 0;
+
+        if ( pte_is_valid(orig_pte) )
+            flush_flags |= IOMMU_FLUSHF_modified;
+        if ( pte_is_valid(*entry) )
+            flush_flags |= IOMMU_FLUSHF_added;
+
+        rc = iommu_iotlb_flush(p2m->domain, _dfn(gfn_x(sgfn)),
+                               1UL << page_order, flush_flags);
+    }
+    else
+#endif
+        rc = 0;
+
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     */
+    if ( p2me_is_valid(p2m, orig_pte) &&
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
+        p2m_free_entry(p2m, orig_pte, level);
+
+out:
+    unmap_domain_page(table);
+
+    return rc;
+}
+
 static int p2m_set_entry(struct p2m_domain *p2m,
                          gfn_t sgfn,
                          unsigned long nr,
@@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
                          p2m_type_t t,
                          p2m_access_t a)
 {
-    return -EOPNOTSUPP;
+    int rc = 0;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m->domain->is_dying) )
+        return -ENOMEM;
+
+    while ( nr )
+    {
+        unsigned long mask;
+        unsigned long order = 0;
+        /* 1gb, 2mb, 4k mappings are supported */
+        unsigned int i = ( P2M_ROOT_LEVEL > 2 ) ? 2 : P2M_ROOT_LEVEL;
+
+        /*
+         * Don't take into account the MFN when removing mapping (i.e
+         * MFN_INVALID) to calculate the correct target order.
+         *
+         * XXX: Support superpage mappings if nr is not aligned to a
+         * superpage size.
+         */
+        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
+        mask |= gfn_x(sgfn) | nr;
+
+        for ( ; i != 0; i-- )
+        {
+            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
+            {
+                    order = XEN_PT_LEVEL_ORDER(i);
+                    break;
+            }
+        }
+
+        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, (1 << order));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, (1 << order));
+
+        nr -= (1 << order);
+    }
+
+    return rc;
 }
 
 static int p2m_insert_mapping(struct domain *d, gfn_t start_gfn,
-- 
2.49.0


