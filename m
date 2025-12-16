Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5ECC47D4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188293.1509567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYN5-000888-1W; Tue, 16 Dec 2025 16:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188293.1509567; Tue, 16 Dec 2025 16:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYN4-00083h-QN; Tue, 16 Dec 2025 16:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1188293;
 Tue, 16 Dec 2025 16:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL9-0006gk-8i
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17954e4d-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:57 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso933928666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:57 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:56 -0800 (PST)
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
X-Inumbo-ID: 17954e4d-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904157; x=1766508957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHHCIzHZyaTnkr2DlsPf6BvUrICTFqGn7vDM9vV1Gt8=;
        b=MmSiUZGgbvcpljxjoI+ihn5TFUjoHO4KDrDbcff85hoO1DA5PEubapWc/h1I9cVj+U
         dJHvPT3OgmxdTpy7vBxwF45VYl8Rkd0tXoWYirTzyZpZRx9JpME1Gx1VTW82yD+QuoZc
         sq5nKFW6t+hszcVV5L7mzcOKTzxiiz16T/P2dUS3xXUPnR4LF6E593i1h+kpPxJMWvBo
         +mi+1xxkqps1gEQKZJ+MJWlehtAom7i5Ms45O6UxEUlMLmUc4W1AZjZ/4w8phUP0EQdR
         OBLUY2h4aUoPYPK7RXoftnsPsv7t+de/p9Xi1du63JHvALAxyoH1bYji4gdmn8ylE/Kj
         YblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904157; x=1766508957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHHCIzHZyaTnkr2DlsPf6BvUrICTFqGn7vDM9vV1Gt8=;
        b=AAtLN9rOfWLmmnApEmawwC1WzHWV3LHgrk3LOn66QIiTTQ5kKlJq/X105GOQEu1SnD
         HmR4RC2Zz83PedL/ZJ85Io4zWXbYUrKHX52jzG4Xbvxah7YbAr6QbYUcMGeCmTa60cTz
         Fj5b119wvLWi3FHOalpdrY/RsOZ2JCMzANGfwMMTwH1RROb/ll6uUIHcRH1QjfXnVHtI
         aSTMzn4SRvQH22fR3NieaMC9pgYDfYdd2M7ueEeCJpSZOf0dXaUX9tVPfkJBSmPOEQX2
         +YblxCb+ImltKXrixq4U7iD6uo83DFscTVV3FMbbOmIBu+9wb2fq1oLO82YjCulF1Kr2
         G7RA==
X-Gm-Message-State: AOJu0YyHme6Yfkp9qb+diffrljKED6u+1yZNQq5ktFAvwwHv5/ufGxOp
	Ms4aDZCpiCfd076cDtV0lTwHnSO3K/V3rwtkA3s+b00EQzMrEFrzRiYdDToigA==
X-Gm-Gg: AY/fxX6YhqGBaPZ5MGenlzBsN4SOWDaA3zFEPbxj+MCtEQ9njCqBvnRQwTvEonIqoIm
	9Kn/BniHAx0/ebdKBf9edqvkjn/ijgjYycJOTam0vddEx6qsFOLG4EMPR91NZZpO6UA6e666HuN
	UcLyBKY2yjlwFc1IjvAdfLUp5KLSsnnyBpoYiUNNZJsQlcjPsxrYNghWgHLGDxzUVxwEE0oIiMR
	hScuOSjFZVR0uNgXk60hxXcgPjzBWHtMP0xfzvnhWEl0RaccPZWzRyXiszoAqqecR7oKGG3EQly
	0tN9ikPHhG8AX8tw1kdN7DSvlD85EneQ7sT6gJG4xpeYc3aQud6+xlp8mQn9zRCJRCYknLLfz9n
	DwcQhh94YOSKozJ8K4WCLijaP49tCiEigbftMRhMoWT9h5NhnO5srcnhrpmQpa6Wjp3TmscES5O
	BQueqCUb/m6vZnicV15DxNIJk08SblEeKVbSwllA3GEQIYwaeyYr4ObBM=
X-Google-Smtp-Source: AGHT+IFq8pWZqw1VVV9XuKz/HpK2WKDS++VyK0Qi0zkxI4GUhEonWHjkEIXdXpT/amQksDbo1N173w==
X-Received: by 2002:a17:906:c109:b0:b73:8cea:62bb with SMTP id a640c23a62f3a-b7d237730b0mr1526198666b.31.1765904156415;
        Tue, 16 Dec 2025 08:55:56 -0800 (PST)
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
Subject: [PATCH v7 14/19] xen/riscv: Implement superpage splitting for p2m mappings
Date: Tue, 16 Dec 2025 17:55:24 +0100
Message-ID: <7f5e65fbaf518bfd5db127987d44c9bcee463d18.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for down large memory mappings ("superpages") in the RISC-V
p2m mapping so that smaller, more precise mappings ("finer-grained entries")
can be inserted into lower levels of the page table hierarchy.

To implement that the following is done:
- Introduce p2m_split_superpage(): Recursively shatters a superpage into
  smaller page table entries down to the target level, preserving original
  permissions and attributes.
- p2m_set_entry() updated to invoke superpage splitting when inserting
  entries at lower levels within a superpage-mapped region.

This implementation is based on the ARM code, with modifications to the part
that follows the BBM (break-before-make) approach, some parts are simplified
as according to RISC-V spec:
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

Additionally, the page table walk logic has been adjusted, as ARM uses the
opposite level numbering compared to RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6-7:
 - Move introduction of pte_is_superpage() here as it is starting to be
   used in this patch now.
---
Changes in V5:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
 - use next_level when p2m_split_superpage() is recursively called
   instead of using "level-1".
---
Changes in V4:
 - s/number of levels/level numbering in the commit message.
 - s/permissions/attributes.
 - Remove redundant comment in p2m_split_superpage() about page
   splitting.
 - Use P2M_PAGETABLE_ENTRIES as XEN_PT_ENTRIES
   doesn't takeinto  into acount that G stage root page table is
   extended by 2 bits.
 - Use earlier introduced P2M_LEVEL_ORDER().
---
Changes in V3:
 - Move     page_list_add(page, &p2m->pages) inside p2m_alloc_page().
 - Use 'unsigned long' for local vairiable 'i' in p2m_split_superpage().
 - Update the comment above if ( next_level != target ) in p2m_split_superpage().
 - Reverse cycle to iterate through page table levels in p2m_set_entry().
 - Update p2m_split_superpage() with the same changes which are done in the
   patch "P2M: Don't try to free the existing PTE if we can't allocate a new table".
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - Update the commit above the cycle which creates new page table as
   RISC-V travserse page tables in an opposite to ARM order.
 - RISC-V doesn't require BBM so there is no needed for invalidating
   and TLB flushing before updating PTE.
---
 xen/arch/riscv/include/asm/page.h |   5 ++
 xen/arch/riscv/p2m.c              | 116 +++++++++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b7cd61df8d..b465a90325 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -190,6 +190,11 @@ static inline bool pte_is_mapping(pte_t p)
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
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 9e1a660316..8d572f838f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -742,7 +742,88 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
     p2m_free_page(p2m, pg);
 }
 
-/* Insert an entry in the p2m */
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned long i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = P2M_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level > target);
+    ASSERT(pte_is_superpage(*entry, level));
+
+    page = p2m_alloc_page(p2m);
+    if ( !page )
+    {
+        /*
+         * The caller is in charge to free the sub-tree.
+         * As we didn't manage to allocate anything, just tell the
+         * caller there is nothing to free by invalidating the PTE.
+         */
+        memset(entry, 0, sizeof(*entry));
+        return false;
+    }
+
+    table = __map_domain_page(page);
+
+    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(p2m, next_level); i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct attributes are kept.
+         */
+        pte = *entry;
+        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
+
+        write_pte(new_entry, pte);
+    }
+
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset
+     * for every entry to know whether the entry should be shattered.
+     */
+    if ( next_level != target )
+        rv = p2m_split_superpage(p2m, table + offsets[next_level],
+                                 next_level, target, offsets);
+
+    if ( p2m->clean_dcache )
+        clean_dcache_va_range(table, PAGE_SIZE);
+
+    /*
+     * TODO: an inefficiency here: the caller almost certainly wants to map
+     *       the same page again, to update the one entry that caused the
+     *       request to shatter the page.
+     */
+    unmap_domain_page(table);
+
+    /*
+     * Even if we failed, we should (according to the current implemetation
+     * of a way how sub-tree is freed if p2m_split_superpage hasn't been
+     * finished fully) install the newly allocated PTE
+     * entry.
+     * The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
+
+    return rv;
+}
+
+/* Insert an entry in the p2m. */
 static int p2m_set_entry(struct p2m_domain *p2m,
                          gfn_t gfn,
                          unsigned long page_order,
@@ -807,7 +888,38 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( level > target )
     {
-        panic("Shattering isn't implemented\n");
+        /* We need to split the original page. */
+        pte_t split_pte = *entry;
+
+        ASSERT(pte_is_superpage(*entry, level));
+
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        {
+            /* Free the allocated sub-tree */
+            p2m_free_subtree(p2m, split_pte, level);
+
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        p2m_write_pte(entry, split_pte, p2m->clean_dcache);
+
+        p2m->need_flush = true;
+
+        /* Then move to the level we want to make real changes */
+        for ( ; level > target; level-- )
+        {
+            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+
+            /*
+             * The entry should be found and either be a table
+             * or a superpage if level 0 is not targeted
+             */
+            ASSERT(rc == P2M_TABLE_NORMAL ||
+                   (rc == P2M_TABLE_SUPER_PAGE && target > 0));
+        }
+
+        entry = table + offsets[level];
     }
 
     /*
-- 
2.52.0


