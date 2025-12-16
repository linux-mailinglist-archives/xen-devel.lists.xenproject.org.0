Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1FCC4768
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188154.1509490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL8-00012L-Fr; Tue, 16 Dec 2025 16:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188154.1509490; Tue, 16 Dec 2025 16:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL8-0000y1-3i; Tue, 16 Dec 2025 16:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1188154;
 Tue, 16 Dec 2025 16:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL5-0006ge-Nu
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a7f5ba-daa0-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:55:54 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so834784266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:54 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:52 -0800 (PST)
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
X-Inumbo-ID: 15a7f5ba-daa0-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904153; x=1766508953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6J9Xrxco4ykuJgJHFWv0at18cn+lsph96Vq/LbI/yA=;
        b=Nhd609uHgpEaUz30gDI2nyd5qbiGwsxU2llDFRIaHIvU23utjF07Zg5ud1cZXSZg7m
         pn0WvlrAqCWn0MQ7TJOhiUqVHWVHAsvNsXI8Qym1XRKLYt7p2Ia7DKoTUT9/h6mrd+zW
         LvoApMwWl1bGX1+bNdvMJUVRCjT181UD/tMTNTSgTwSmA5HK/hhQLgnGqmlGgrNPcXjw
         W6NzpFPQKksGn7aJjz3FXZqfzZx2iY0FSacq5UXQQr/HUpGpDW6VTcFqzPWpfFzNKOVK
         8MEywqxyhPKLRaHW/wshG2rRg+r92sc7xsmKe20L08+UA0bFh4Hssv/7s94R2J5rJjXK
         d5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904153; x=1766508953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v6J9Xrxco4ykuJgJHFWv0at18cn+lsph96Vq/LbI/yA=;
        b=dBKM/BiPchdc1fwG4rS9REY2C/s6c4Oi8hATWrVIgtbHVhhX5kN2HXZZdENn8n6PF8
         Sz0CEHGVDuRf51p55Sv8bBcTbj0o9RLFUfNtENmewWtzRbLRTjA7JNN0mWut6owsGkJm
         mqlU1RnCLag0+ROUsHJ75Asz6NCYxYEZKKNSMOeylidmZ3ZmNSx5xkSPCcLhnO2hh/9B
         nLRU2UKLdldo6Phb23ojpQszBMSLujhaGV8vPAf0ju52BqbYf6P2O9Hwa2vRgPDw6p62
         NeT01/qNJvfoHuHNkH4imjPHNzVn1QJA7yRHkAZwTC9uqj6zwUz1/dlKRbElXLbxEIEl
         Uf1Q==
X-Gm-Message-State: AOJu0YwHtREIHZRiswWdQ9htYA+e55uDLBcFSODEpBFdfIjCpmrmSpy/
	W9X2ItFdyz0JJSZ+Lrq5Z+3LqRaX85Pl10aTO0gNav1+iJw/iJFXv6XYUDux7g==
X-Gm-Gg: AY/fxX5vuIPIioJ1UF7Ctk+rvd7W6+QPOUUsW5uDx+QlzVEpudkxtZJmG2/Li8g6ckM
	1MhDjPDDp8zVU7xNv1aYmVEUnFuL7sWbnM8VAFZJQ3bdhDQkbJv7CKK91fLOJ9qqZa5m6kLq+KW
	0hyvehMxAA7P9w7b4kyrYRzQzQ88VSv3qLxwMQUBlQy7odRjWTpkygL2kkisIBhkD3DzX4AFCAB
	7iDokbFO3dzW396q/PxGFqE7h0G172MyhFpUPWnZLhdR32lMfJ2KyJJEviqYk9TbSG2Zy+4HdpC
	5Tm2SLGXRcKkFBQLunjshwoBlAnA4miJUXZJhp+sMSDm7QUqIQvZTav/FMpu3RywAbyVhdmvXxB
	hFktvTAKgQLsC9JITf0uF/PDA0p5DHTTI6qdCxk9wXG7NFTK+FyUIs01LRona4sqGibdG6YEOm7
	O0pbR9Y1nEU++7T02mrL+YPMEy1EACRRErqir9VDkr3lPZQZTw0k0=
X-Google-Smtp-Source: AGHT+IHLXAmSgI8gda+I/vP6QGjaJE3S6kT/o4epkJdhmPplKOxSb9TSnagKIlVdkiz8ZD+m0uIZDQ==
X-Received: by 2002:a17:907:3dab:b0:b7a:72bd:ac5d with SMTP id a640c23a62f3a-b7d235cfe63mr1573820166b.13.1765904153180;
        Tue, 16 Dec 2025 08:55:53 -0800 (PST)
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
Subject: [PATCH v7 11/19] xen/riscv: Implement p2m_free_subtree() and related helpers
Date: Tue, 16 Dec 2025 17:55:21 +0100
Message-ID: <3d6c214fb75c1a4fd354e1d89de7cd19404851b3.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V6:
 - Use PTE_RSW instead of 0x300 in the definition of P2M_TYPE_PTE_BITS_MASK.
 - Optimize a if-condtion of p2m_free_subtree() at the start
   of the function to avoid unnessary checks.
 - Change P2M_PAGETABLE_ENTRIES(1) to PAGETABLE_ENTRIES in p2m_put_2m_superpage() as it is expected be the same and in the 
 cae of PAGETABLE_ENTRIES it won't need to update prototypes because
 of one macro.
 - Drop the comment above p2m_put_4k_page() and p2m_put_2m_superpage().
 - Move introduction of pte_is_superpage() to "xen/riscv: Implement superpage splitting for p2m mappings" as it is starting to be used there.
---
Changes in V5:
 - Rewrite the comment inside p2m_put_foreign_page().
 - s/assert_failed/ASSERT_UNREACHABLE.
 - Use p2mt variable when p2m_free_subtree() is called intead of
   p2m_get_type(entry).
 - Update the commit message: drop info about defintion of XEN_PT_ENTRIES
 - Drop also defintion of XEN_PT_ENTRIES as the macro isn't used anymore.
 - Drop ACCESS_ONCE() for paging_free_page() as it is redundant in the
   case when a code is wrapped by a spinlock.
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
 xen/arch/riscv/include/asm/p2m.h      |  15 +++
 xen/arch/riscv/include/asm/paging.h   |   2 +
 xen/arch/riscv/p2m.c                  | 148 +++++++++++++++++++++++++-
 xen/arch/riscv/paging.c               |   8 ++
 xen/arch/riscv/stubs.c                |   5 -
 6 files changed, 176 insertions(+), 8 deletions(-)

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
index fa55d8a3bc..b48693a2b4 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -111,6 +111,8 @@ typedef enum {
     p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
                            PTE_PBMT_IO will be used for such mappings */
     p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
 
     /* Sentinel — not a real type, just a marker for comparison */
     p2m_first_external = p2m_ext_storage,
@@ -121,15 +123,28 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
     return p2m_mmio_direct_io;
 }
 
+/*
+ * Bits 8 and 9 are reserved for use by supervisor software;
+ * the implementation shall ignore this field.
+ * We are going to use to save in these bits frequently used types to avoid
+ * get/set of a type from radix tree.
+ */
+#define P2M_TYPE_PTE_BITS_MASK PTE_RSW
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
 #define p2m_is_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
 #define p2m_is_any_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+#define p2m_is_foreign(t) (p2m_to_mask(t) & P2M_FOREIGN_TYPES)
 
 #include <xen/p2m-common.h>
 
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 01be45528f..fe462be223 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -13,4 +13,6 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
 int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
 int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
 
+void paging_free_page(struct domain *d, struct page_info *pg);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index c23926933f..9ab7262d70 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -356,6 +356,16 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
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
 static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_cache)
 {
     write_pte(p, pte);
@@ -412,11 +422,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return P2M_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It’s safe to call put_page() here because arch_flush_tlb_mask()
+     * will be invoked if the page is reallocated, which will trigger a
+     * flush of the guest TLBs.
+     */
+    put_page(pg);
+}
+
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
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    /* TODO: Handle other p2m types */
+    if ( !p2m_is_foreign(type) )
+        return;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    /*
+     * PAGETABLE_ENTRIES is used instead of P2M_PAGETABLE_ENTRIES(1) because
+     * they are expected to be identical (this is verified in calc_offset()).
+     * This avoids having to pass p2m_domain here and throughout the call stack
+     * above solely for the sake of one macro.
+     */
+    for ( i = 0; i < PAGETABLE_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
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
+        ASSERT_UNREACHABLE();
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
+    ASSERT(level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING);
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !pte_is_valid(entry) )
+        return;
+
+    if ( pte_is_mapping(entry) )
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
+        if ( p2m_is_ram(p2mt) &&
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
+
+    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(p2m, level); i++ )
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
 
 /* Insert an entry in the p2m */
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index d401ddc34e..09631c9894 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -109,6 +109,14 @@ int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages)
     return 0;
 }
 
+void paging_free_page(struct domain *d, struct page_info *pg)
+{
+    spin_lock(&d->arch.paging.lock);
+    page_list_add_tail(pg, &d->arch.paging.freelist);
+    d->arch.paging.total_pages++;
+    spin_unlock(&d->arch.paging.lock);
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index fe7d85ee1d..164fc091b2 100644
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
2.52.0


