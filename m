Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A3BF241A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146543.1479054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHC-0007QE-KX; Mon, 20 Oct 2025 15:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146543.1479054; Mon, 20 Oct 2025 15:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHB-0007H9-W1; Mon, 20 Oct 2025 15:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1146543;
 Mon, 20 Oct 2025 15:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH9-0004nC-Bm
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a10beb1-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so9337929a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:21 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:20 -0700 (PDT)
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
X-Inumbo-ID: 9a10beb1-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975901; x=1761580701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfS5FANeXCoY4Zhsy/t9BHhWxI7P3NDzOuDkNE6RLcc=;
        b=k57Z819PT7SHx49NeX1XenDLl4oulWp5YC5zbiTYHUI8thurnU49a4sKQGqpMLIc3/
         TGJWTAkZ2QBduolkJIvBSlMa3eJyaPwZUZlFSVhSyqGSyCU0Z2h5513yg0y8qrRLlkgY
         jr7dcKDwkx9lN83xCMs8lO+NzSOFqQs3WJ4GZWl+Luss97YrBE5/IpaHla1XQViTDEgQ
         Eqo70BPg9hZQDfxPxUY+zZFH2sWaZ1tkGbj8RSF1h18Y6B62FhFPgaKDRz1Wx6n3rNuC
         A7NfpADo9+hK5jB1IMtGbPTuFEk9OBeOjrsZSwgraSqLH0YV9++LT+JxPk/PPmnu6NNc
         oaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975901; x=1761580701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfS5FANeXCoY4Zhsy/t9BHhWxI7P3NDzOuDkNE6RLcc=;
        b=Zoe90ySvEjGevLuV5A7T2S+rLL39D/qx7760kvyOW6lJkNUcu35zCCFQYfVepftixE
         97DCTIbs4AcSTL49VCsaotKe9pPM/B5XyrL0KEpWIHa/uHIcBozbIvofcLKpPyRmmOGp
         nQTzTvKnnQCoLWjE2i2v3QubeI14OCfpeptwmxmfA3uI3GRHuUkKl0oh3KrUWc7rra1T
         WhRhrjZEQGqYgybttJK46ka6qP4gNhl6t4BRBO7ZQz4pphWMPZVIg27111z319BVvj8b
         IliRLzXPzXAmI4WdMJvCYwj0yekrg2QxivaA4aqmR/WHejGAAeVGw4OXw78WjoOVmOUM
         9LIg==
X-Gm-Message-State: AOJu0Ywr3GEJgDGieGtXAEtKppfErlgh60lIS28ZU4O9v5ji03FeqBmo
	BMArBSYWLi1nbx5xrI241xhVeD8z7fMlUUMH/cGVJmu9biGlfrdcJ1FpLyt+Cg==
X-Gm-Gg: ASbGncuzUqKXyh8TmLGDLKlXYWrTSKKfl1WWi9dFYMw8USYIgFmHCPDqdFkP+/tHBk5
	jH5j6M5dybD9qn9bcEeSZ+5EtBPcS7UlQHjnlGZ6pN/D++FmxpS9eBSOg4cQHaPVgSSuOr8O+yS
	foKxF0hvSJ0Xk2+zazQ7iINmu0nF6UlPJL4LkrmexQU1FLaEusmdKwE7MSfJ5nUy6WIB0wBGPF7
	yPiOor7VraEF5Shd3TvdCMUHqyHFdGnkwyBruYkMDFueNxAaq2MPYP8ClfR+4zpO9l83QSm8kVG
	YyrH0fDOdEJpUejElJOpZlz7EtI+VwE74uiEP1mN7ow/Z9P+JNTcQNWDCxmCJh3WJLQ5C2qj27p
	AZuEENrUtuFGv8fyTd0D4OEIk6NopqiTZV8o24dJNYV+j/gRHJ4kcew0box5nB8njAhzArbTHqS
	5Nv1ezWtsfQf4rwLx+nolMkOcl+ETnlaQpTmxtalDyJZ1gKY2rDRNU+eYDTw==
X-Google-Smtp-Source: AGHT+IHVIf/TL2QYySrNY2TnZAAzFDqzO4600vue0hhiBBlr9O/L2+dEvjK30uZBQGZVTrUz8DDffg==
X-Received: by 2002:a05:6402:4316:b0:637:ee0d:383d with SMTP id 4fb4d7f45d1cf-63c1f62cad5mr13735515a12.3.1760975900403;
        Mon, 20 Oct 2025 08:58:20 -0700 (PDT)
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
Subject: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
Date: Mon, 20 Oct 2025 17:57:53 +0200
Message-ID: <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Update the comment above p2m_get_root_pointer().
 - Fix an identation for p2m_set_entry()'s arguments.
 - Update the comment in p2m_set_entry() where lookup is happening.
 - Drop part of the comment above p2m_set_entry() as it is not really
   needed anymore.
 - Introduce P2M_DECLARE_OFFSETS() to use it insetead of
   DECLARE_OFFSETS() as the latter could have an issue with P2M code.
 - Update p2m_get_root_pointer() to work only with P2M root properties.
 - Update the comment inside in p2m_set_entry() for the case when
   p2m_next_level() returns P2M_TABLE_MAP_{NONE,NOMEM}.
 - Simplify a little bit a condition when p2m_free_subtree() by removing
   a case when removing && mfn(0) are checked explicitly.
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
 xen/arch/riscv/include/asm/p2m.h |  43 ++++
 xen/arch/riscv/p2m.c             | 331 ++++++++++++++++++++++++++++++-
 2 files changed, 373 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 4fafb26e1e..ce8bcb944f 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -8,12 +8,45 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
 extern unsigned char gstage_mode;
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
+
+#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)
+
+#define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
 
 #define paddr_bits PADDR_BITS
 
@@ -52,6 +85,16 @@ struct p2m_domain {
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
index e571257022..f13458712a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
@@ -17,6 +18,43 @@
 #include <asm/vmid.h>
 
 unsigned char __ro_after_init gstage_mode;
+unsigned int __ro_after_init gstage_root_level;
+
+/*
+ * The P2M root page table is extended by 2 bits, making its size 16KB
+ * (instead of 4KB for non-root page tables). Therefore, P2M root page
+ * is allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+ * only allocates 4KB pages).
+ */
+#define ENTRIES_PER_ROOT_PAGE \
+    (P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL) / P2M_ROOT_ORDER)
+
+static inline unsigned int calc_offset(unsigned int lvl, vaddr_t va)
+{
+    unsigned int offset = (va >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);
+
+    /*
+     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
+     * page table spans 4 consecutive 4KB pages.
+     * We want to return an index within one of these 4 pages.
+     * The specific page to use is determined by `p2m_get_root_pointer()`.
+     *
+     * Example: if `offset == 512`:
+     *  - A single 4KB page holds 512 entries.
+     *  - Therefore, entry 512 corresponds to index 0 of the second page.
+     *
+     * At all other levels, only one page is allocated, and `offset` is
+     * always in the range 0 to 511, since the VPN is 9 bits long.
+     */
+    return offset % ENTRIES_PER_ROOT_PAGE;
+}
+
+#define P2M_MAX_ROOT_LEVEL 4
+
+#define P2M_DECLARE_OFFSETS(var, addr) \
+    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
+    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
+        var[i] = calc_offset(i, addr);
 
 static void __init gstage_mode_detect(void)
 {
@@ -54,6 +92,14 @@ static void __init gstage_mode_detect(void)
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
             gstage_mode = mode;
+            gstage_root_level = modes[mode_idx].paging_levels - 1;
+            /*
+             * The highest supported mode at the moment is Sv57, where L4
+             * is the root page table.
+             * If this changes in the future, P2M_MAX_ROOT_LEVEL must be
+             * updated accordingly.
+             */
+            ASSERT(gstage_root_level <= P2M_MAX_ROOT_LEVEL);
             break;
         }
     }
@@ -218,6 +264,9 @@ int p2m_init(struct domain *d)
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
     /*
      * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
      * is not ready for RISC-V support.
@@ -259,13 +308,293 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+/*
+ * Map one of the four root pages of the P2M root page table.
+ *
+ * The P2M root page table is larger than normal (16KB instead of 4KB),
+ * so it is allocated as four consecutive 4KB pages. This function selects
+ * the appropriate 4KB page based on the given GFN and returns a mapping
+ * to it.
+ *
+ * The caller is responsible for unmapping the page after use.
+ *
+ * Returns NULL if the calculated offset into the root table is invalid.
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
+     * Initially, `root_table_indx` is derived directly from `va`.
+     * To locate the correct entry within a single 4KB page,
+     * we rescale the offset so it falls within one of the 4 pages.
+     *
+     * Example: if `root_table_indx == 512`
+     * - A 4KB page holds 512 entries.
+     * - Thus, entry 512 corresponds to index 0 of the second page.
+     */
+    root_table_indx /= ENTRIES_PER_ROOT_PAGE;
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
+/* Insert an entry in the p2m */
+static int p2m_set_entry(struct p2m_domain *p2m,
+                         gfn_t gfn,
+                         unsigned long page_order,
+                         mfn_t mfn,
+                         p2m_type_t t)
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
+    P2M_DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
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
+             * and none should be allocated). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore lookup failure.
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
+     * In case of a VALID -> INVALID transition, the original PTE should
+     * always be freed.
+     *
+     * In case of a VALID -> VALID transition, the original PTE should be
+     * freed only if the MFNs are different. If the MFNs are the same
+     * (i.e., only permissions differ), there is no need to free the
+     * original PTE.
+     */
+    if ( pte_is_valid(orig_pte) &&
+         (!pte_is_valid(*entry) ||
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
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


