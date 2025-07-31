Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5CB17482
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065919.1431294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVi6-0008Nj-WD; Thu, 31 Jul 2025 16:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065919.1431294; Thu, 31 Jul 2025 16:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVi6-0008LI-TQ; Thu, 31 Jul 2025 16:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1065919;
 Thu, 31 Jul 2025 16:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgA-0000zK-Oz
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:50 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ef59a14-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:48 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55b82db8fd4so1220142e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:48 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:47 -0700 (PDT)
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
X-Inumbo-ID: 3ef59a14-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977528; x=1754582328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDoQIzI2S7GR+bSHxAC8/G+9LMVK6bHSqsbe1u3enIo=;
        b=A9nX/T2LzyYhvjhgjHzpQOFqfjdp1YpTtRK2PPOVmdQHJh27HLmrSLxQsXvIdWWfL5
         DCEghB7qmezJyhPUGNzOOxeApgLKQCF2EXrd3QGVWhf6uZDs9wQGTiiXO41Sp7JcK4Ur
         0nv3IHvQNOc55DEhx6NEHdPq+ylkf1yEUjIu386Geag8ppQGHclQzfKNsij96AunxbnL
         QOEbvvrssOOIHgkHACCd34ateTjDNaPXvMR7SoL85e92wMUlBgSIRhP08ZKSt6pa/Cyo
         gD/BtxCUCA1zgXH1eH6rTT2w9tmtg330zZ52/nyfIBNmA9T0el6Zw/pA1gkE/IaHsiVb
         2Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977528; x=1754582328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDoQIzI2S7GR+bSHxAC8/G+9LMVK6bHSqsbe1u3enIo=;
        b=EwetYyOo5G30xh05/gfODqHNCcobHLrMr8COwE58uadk5wCj+VqxgL46OtXH+1go/g
         ruvdys8Wzyl5OHNA+FZSxkQ3o0eqvuiQj9G1LJfpN3c1IbcEKCwOCMPC8Gcqkd4krg8X
         p9JVm/I8OgWzwdW9d+gUwAeyVR2zQ2QTygbOZoeZxvYFNsRHHnRS7/i7UI7usW29x8n8
         vp2PQccjYLVzpRKSqcmtsJvdoSK+mpGdW8kwCuShJHfvrDJs37jx7mJc21r08kcU/WEl
         n1pXNjIUTlTkZjcAUG0m7A3ZEQD/f5x9EUzMn43FHtIwk3BYdOkSGpfsgXotCBTHXVL/
         ecYA==
X-Gm-Message-State: AOJu0YzmvdqpkW+d5wFK3p5ACgKzG5ELUg0CYJCYQfYlYkY4ZcLf2HMX
	GIbxGNyNtHNSRRRd9x3bp/RWGTnhALWDTjciMuT6E9/hPlO+8Or9J+9HoSGViw==
X-Gm-Gg: ASbGncsFMkJKlgTuVb2CYsGtcDVv1+7smfSU4AgUYZ0N6Cgb6Xvz4+jdDGrRyi8Kr9P
	s+Hx3zSoR/AI5WOsSE8zKxetvHIGbKXge667/S1ltiz8RLopvChqB2QqJ939fTWTkYwvRcWejss
	uzyj97gASzVsu6ek8r70omvg3o8GTtQSFkEEhzjXgTnj8rzUkdzRVDbmFlz4HsusiHM/3LgWyg2
	ppAjGSf4CxCP5A0CX9SOKl1vdwrIwHMK5q5sE8F9WOe54iyPLP4aSowxAZxW5WqA4b9Fwv50OAA
	WpijFOnC8KjuThBzApUFTKwtSEHpa+lR4uNGTPxtaAmDMpEPyEvl/cnkH0bzVd7WSkHTJuyzlX0
	yi+Xef5jW1lJVs1QWcVKIPiH1kRZu0t3aVRSEw+6SYycBNx71utCopdeGAKWNoA==
X-Google-Smtp-Source: AGHT+IEsoRjnCH5J/XCiLOdthErnQOm9hvMya+nx5aWP4rvVgFpdGsFIjLh0CQm+q4NtXYtRX2yDpA==
X-Received: by 2002:a05:6512:3190:b0:55b:840c:5636 with SMTP id 2adb3069b0e04-55b840c58b9mr1996653e87.50.1753977527760;
        Thu, 31 Jul 2025 08:58:47 -0700 (PDT)
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
Subject: [PATCH v3 12/20] xen/riscv: implement p2m_set_range()
Date: Thu, 31 Jul 2025 17:58:11 +0200
Message-ID: <ea69584222a4c41eac276de1ec8eed25b13642d3.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/p2m.h |  12 ++
 xen/arch/riscv/p2m.c             | 250 ++++++++++++++++++++++++++++++-
 2 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index ada3c398b4..26ad87b8df 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -7,11 +7,13 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
 extern unsigned int p2m_root_order;
 #define P2M_ROOT_ORDER  p2m_root_order
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
 
 #define paddr_bits PADDR_BITS
 
@@ -50,6 +52,16 @@ struct p2m_domain {
      * shattered), call p2m_tlb_flush_sync().
      */
     bool need_flush;
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
index 7cfcf76f24..6c99719c66 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -3,6 +3,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 
+#include <asm/page.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
 #include <asm/riscv_encoding.h>
@@ -132,6 +133,9 @@ int p2m_init(struct domain *d)
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
     /*
      * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
      * is not ready for RISC-V support.
@@ -175,13 +179,257 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
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
+    root_table_indx = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table_indx >= P2M_ROOT_PAGES )
+        return NULL;
+
+    return __map_domain_page(p2m->root + root_table_indx);
+}
+
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&pte, 0, sizeof(pte));
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
+ * Take the currently mapped table, find the corresponding the entry
+ * corresponding to the GFN, and map the next table, if available.
+ * The previous table will be unmapped if the next level was mapped
+ * (e.g P2M_TABLE_NORMAL returned).
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
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT((target <= 2) && !(page_order % PAGETABLE_ORDER));
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
+            rc = removing_mapping ?  0 : rc;
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
+        p2m_clean_pte(entry, p2m->clean_pte);
+    else
+    {
+        pte_t pte = p2m_pte_from_mfn(mfn, t);
+
+        p2m_write_pte(entry, pte, p2m->clean_pte);
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
+     */
+    if ( pte_is_valid(orig_pte) &&
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
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
+    unsigned int level = min(P2M_ROOT_LEVEL, 2);
+    unsigned long order = 0;
+
+    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+    mask |= gfn_x(gfn);
+
+    for ( ; level != 0; level-- )
+    {
+        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1)) &&
+             (nr >= BIT(XEN_PT_LEVEL_ORDER(level), UL)) )
+        {
+                order = XEN_PT_LEVEL_ORDER(level);
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
+    return !left ? 0 : left == nr ? rc : (nr - left);
 }
 
 static int p2m_insert_mapping(struct p2m_domain *p2m, gfn_t start_gfn,
-- 
2.50.1


