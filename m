Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B0C807CA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170577.1495733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm0-0004ge-U1; Mon, 24 Nov 2025 12:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170577.1495733; Mon, 24 Nov 2025 12:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm0-0004Wv-0S; Mon, 24 Nov 2025 12:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1170577;
 Mon, 24 Nov 2025 12:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlw-0001Xp-Tz
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6ff8a52-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:21 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so723443166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:21 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:20 -0800 (PST)
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
X-Inumbo-ID: e6ff8a52-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987661; x=1764592461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQp2OoNfq9Sz1ZgJX4NxfN3iqCp+UHoWarG4Q3teMCM=;
        b=jWPTbjfgLGGSX7nhI6F4Acou/ymTmtIziP3OHcDAahc8wgVcn+lvg/LUbBA4LM9Snh
         Ji+L6kEF1ES2dKJD9VHJVqOLTh21Vx3hVmCJepgnhXx9lmQhtW0mlA/VHJ3jz2JuTqtf
         bckahm9FUUbKYYBl+q8ojUbeoBPcXBLgdLQJwxlMBVdlNAKSJlisq51WwMwmK9rPRgH2
         FNW5weRbyIcCAXayp9ad/SAWgBWqkv863aF4MGxqGO4ajBB5c2bPBlUyXJ0SIhPQow4w
         rb61oUjIwnfux8CqNAJfzdhlfb60puUcURgtV0SCpq8jwYXaJ58KIvFfMvjGexyiRROo
         QhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987661; x=1764592461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dQp2OoNfq9Sz1ZgJX4NxfN3iqCp+UHoWarG4Q3teMCM=;
        b=bdvFeS6yZ+f1SEQu6PySwyISQpT3qxndBfMoEA+DUYma0HZ8y3O+1Y69EZwQJpUIui
         iCc3S4EbXGpOw+E7WR7ndXyZh/K1SoU0nPBc4lOkxDitnIkQJsUvZAuVHLSr9PjdtIJl
         6sxIjIkH2t9XuuAYeGCm77PFfgDwZhHIPwW+JsR4gwmOrwRh4paOoypwBLXKCnT/0D0/
         EVmusOrQ6v+vYQEqAVSEVdPEEkkRICv8eu+MK+4YNMHyfdWSJV21131IWqp3igxlTmQH
         0OlqEq3Zxp2vBtgRRrRD59Gw32ont/QKI6qg+DuW0Uf82m+aKTGpglQ6PacFOZh4NEYq
         Apeg==
X-Gm-Message-State: AOJu0YwtW0ZJ5Ff7LgZ4l9gs6aZyRrtAVEub9AZqKhtI2iEPpnUwl148
	muV5lHMV7IP9jKjI6enGVEO62FrnAZ9pNDYQTbzeXqPMGxHgsYQ1OJO8P6SZaWV7
X-Gm-Gg: ASbGncveMyp3TkqGs9mgOYt2wY83XPgW2bacdQl2KE8dHVMRPibDd1lGjnsqFGIoU9h
	jyvcL4QehELLT8XuBZasfQ0xaOJL6sL4dpSLWuw26/AiZ6mm+NLh2zgROC1uDKLLlapWddz/jMQ
	PzPY452Ua4SRiRFymTTaaYoLkl/tn5Cnh8fsAZrS2I2ng3YpPu5XIkduhpgKW6OzJeEv4Dmc1y7
	NLFtVAMANvgIjX6QbnWbpuPS64gVM7DbeFeYoRWwrB9pkmaQQmD1kwZXQDWRERSkISzPrUNlTIz
	PBoeriTR3E6GoU/9APVfTJv+QQHLX38+PoZtW8aBGg01FH8sgOgbljaln3SQsi+ixyD1JQKUDu6
	2BW6P4CVzi5YAp/pgLEzNLOGY6VGWn/QGp8pbkdOay7Kzsx62O7TVLseVhp7Fhiddmy7QRHiujG
	3PTh7ELLMgfmyt3IAVzG/TM26ADJhnOOcS3EXGnZe8pRhU4Kh1tlxDLM4=
X-Google-Smtp-Source: AGHT+IHMZg5zjaC2yYJ/ZQOjLVZV07Qa2zaddo5I7mLFInG9+bWGbTG0UHqITM+efRw3YrG/yaoGcA==
X-Received: by 2002:a17:907:948e:b0:b76:6aca:f1f3 with SMTP id a640c23a62f3a-b7671589e26mr1303600366b.19.1763987660416;
        Mon, 24 Nov 2025 04:34:20 -0800 (PST)
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
Subject: [PATCH v6 11/19] xen/riscv: implement p2m_set_range()
Date: Mon, 24 Nov 2025 13:33:44 +0100
Message-ID: <5f2812bb3b82ba1f9178eb00f68a85388f862f09.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
 - Drop the last paragraph in the comment above P2M_LEVEL_ORDER().
 - Update prototype of calc_offset(..., vaddr_t va) to
   calc_offset(..., paddr_t gpa).
 - Rename root_table_indx to idx.
 - s/clean_pte/clean_cache.
 - Fix identations.
 - Introduce P2M_MAX_SUPPORTED_LEVEL_MAPPING to use it instead of magic constant.
 - Rename GFN_MASK to P2M_TABLE_OFFSET
 - Update the implementation of calc_offset() and get_root_pointer().
 - s/P2M_DECLARE_OFFSETS/P2M_BUILD_LEVEL_OFFSETS.
 - Add BUG_ON() inside P2M_BUILD_LEVEL_OFFSETS() to be sure that
   actual root level isn't higer then maximum possible.
 - Move gstage_mode and gstage_level inside p2m_domain structure.
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
 xen/arch/riscv/include/asm/p2m.h |  38 ++++
 xen/arch/riscv/p2m.c             | 326 ++++++++++++++++++++++++++++++-
 2 files changed, 363 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 9acd6a64a8..fa55d8a3bc 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -8,10 +8,38 @@
 #include <xen/rwlock.h>
 #include <xen/types.h>
 
+#include <asm/page.h>
 #include <asm/page-bits.h>
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode.paging_levels)
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
+ */
+#define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
+
+#define P2M_ROOT_EXTRA_BITS(p2m, lvl) (2 * ((lvl) == P2M_ROOT_LEVEL(p2m)))
+
+#define P2M_PAGETABLE_ENTRIES(p2m, lvl) \
+    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(p2m, lvl), UL))
+
+#define P2M_TABLE_OFFSET(p2m, lvl) (P2M_PAGETABLE_ENTRIES(p2m, lvl) - 1UL)
+
+#define P2M_GFN_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
 
 #define paddr_bits PADDR_BITS
 
@@ -58,6 +86,16 @@ struct p2m_domain {
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
index c559cde13a..c21873b2ac 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
@@ -17,6 +18,13 @@
 #include <asm/riscv_encoding.h>
 #include <asm/vmid.h>
 
+/*
+ * At the moment, only 4K, 2M, and 1G mappings are supported for G-stage
+ * translation. Therefore, the maximum supported page-table level is 2,
+ * which corresponds to 1G mappings.
+ */
+#define P2M_MAX_SUPPORTED_LEVEL_MAPPING _AC(2, U)
+
 static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .mode = HGATP_MODE_OFF,
     .paging_levels = 0,
@@ -28,6 +36,77 @@ unsigned char get_max_supported_mode(void)
     return max_gstage_mode.mode;
 }
 
+static inline unsigned int calc_offset(const struct p2m_domain *p2m,
+                                       const unsigned int lvl,
+                                       const paddr_t gpa)
+{
+    unsigned int off = (gpa >> P2M_GFN_LEVEL_SHIFT(lvl)) &
+                       P2M_TABLE_OFFSET(p2m, lvl);
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
+    return off & (PAGETABLE_ENTRIES - 1);
+}
+
+#define P2M_MAX_ROOT_LEVEL 5
+
+#define P2M_BUILD_LEVEL_OFFSETS(p2m, var, addr) \
+    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1}; \
+    BUG_ON(P2M_ROOT_LEVEL(p2m) >= P2M_MAX_ROOT_LEVEL); \
+    for ( unsigned int i = 0; i <= P2M_ROOT_LEVEL(p2m); i++ ) \
+        var[i] = calc_offset(p2m, i, addr);
+
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
+    unsigned long idx;
+    unsigned long root_level = P2M_ROOT_LEVEL(p2m);
+
+    idx = gfn_x(gfn) >> P2M_LEVEL_ORDER(root_level);
+    if ( idx >= P2M_PAGETABLE_ENTRIES(p2m, root_level) )
+        return NULL;
+
+    /*
+     * The P2M root page table is extended by 2 bits, making its size 16KB
+     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
+     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+     * only allocates 4KB pages).
+     *
+     * Initially, `idx` is derived directly from `gfn`.
+     * To locate the correct entry within a single 4KB page,
+     * we rescale the offset so it falls within one of the 4 pages.
+     *
+     * Example: if `idx == 512`
+     * - A 4KB page holds 512 entries.
+     * - Thus, entry 512 corresponds to index 0 of the second page.
+     */
+    idx /= PAGETABLE_ENTRIES;
+
+    return __map_domain_page(p2m->root + idx);
+}
+
 static void __init gstage_mode_detect(void)
 {
     static const struct gstage_mode_desc modes[] __initconst = {
@@ -232,6 +311,9 @@ int p2m_init(struct domain *d)
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
     /*
      * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
      * is not ready for RISC-V support.
@@ -278,13 +360,255 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_cache)
+{
+    write_pte(p, pte);
+
+    /*
+     * TODO: if multiple adjacent PTEs are written without releasing
+     *       the lock, this then redundant cache flushing can be a
+     *       performance issue.
+     */
+    if ( clean_cache )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
+{
+    pte_t pte = { .pte = 0 };
+
+    p2m_write_pte(p, pte, clean_cache);
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
+    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target <= P2M_MAX_SUPPORTED_LEVEL_MAPPING);
+
+    table = p2m_get_root_pointer(p2m, gfn);
+    if ( !table )
+        return -EINVAL;
+
+    for ( level = P2M_ROOT_LEVEL(p2m); level > target; level-- )
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
+          !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
+        p2m_free_subtree(p2m, orig_pte, level);
+
+ out:
+    unmap_domain_page(table);
+
+    return rc;
+}
+
+/* Return mapping order for given gfn, mfn and nr */
+static unsigned long p2m_mapping_order(const struct p2m_domain *p2m, gfn_t gfn,
+                                       mfn_t mfn, unsigned long nr)
+{
+    unsigned long mask;
+    /* 1gb, 2mb, 4k mappings are supported */
+    unsigned int level = min(P2M_ROOT_LEVEL(p2m), P2M_MAX_SUPPORTED_LEVEL_MAPPING);
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
+            order = P2M_LEVEL_ORDER(level);
+            break;
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
+        unsigned long order = p2m_mapping_order(p2m, sgfn, smfn, left);
+
+        rc = p2m_set_entry(p2m, sgfn, order, smfn, t);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, BIT(order, UL));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+            smfn = mfn_add(smfn, BIT(order, UL));
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
2.51.1


