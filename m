Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A70BF241E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146550.1479077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHH-0008L1-5d; Mon, 20 Oct 2025 15:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146550.1479077; Mon, 20 Oct 2025 15:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHG-0008Ct-Py; Mon, 20 Oct 2025 15:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1146550;
 Mon, 20 Oct 2025 15:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHD-0004nC-2w
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:27 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c72f692-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:25 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-63c4b41b38cso5340998a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:25 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:24 -0700 (PDT)
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
X-Inumbo-ID: 9c72f692-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975905; x=1761580705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkYFJ9zErQoksj5TICQm5GZ8ZBubAIBB0QgY0lfMcMo=;
        b=H9HzZC8+xyIf4gfgzxzRprsCXUB4eUqxt7O7OwToMdxLjJ0RITApRnna5X6WRgR+Yr
         l2mkC70Qy9zF9F18UulnkC2SmMgZji+103dgS6aKY+sCyCA+7D8VVYugd71SuUq8wfnu
         b736G9AyVevKx/VebwoyUMaKNTekquAtC8z5yc4BmoKVQE6MmAVy9MyrtWCjJwWKu6cO
         7LYOw7ThK22JgdYwr78bFvUiZYmgHurKLIzTs8rlXy0PdIHHueMaRviGWu4zbN9iI4Sj
         rXsImWfCfz7KYR4WqtRcMvtotoiz7HW29Iar0ZgAIGaKpIFSHa+B4Ujxzq3mVOJcwY0a
         Bbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975905; x=1761580705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkYFJ9zErQoksj5TICQm5GZ8ZBubAIBB0QgY0lfMcMo=;
        b=gd68dNMT/sCDJ0wH8bSyvYeaBloquxoWCh7ecvQZLdOFcn1ZuFZRf3yzyqF/3elPjz
         YlhIIdVDLJIsujPjhVAyswAmYyAwkhd921J0z7aA9VzzwoNTe0xB2kiFjmS7BRkid3Lf
         9V6tjlqRMYroEwLhFZHVAH6vEKuMuMRgi7tlzU01DMXcIbuDXY7GNafxyRARqUVpKAfe
         0xa91MwWFNmDaEe7D1XVpL1iyBmX7KkxUk+/jIwnC+4NsGKiddJYJ7yVWkgaFHJ6wpGv
         pbHulaGcnEDUnCXjmbZPaN1CY44diDSHXbZPPZkxYMcrKseVSiegdoDRDUej3JRJBTLV
         Ntcw==
X-Gm-Message-State: AOJu0YxZK0nZ/vEmRywRhQYr7C3bt1u4sCEe2WBslOM7f8mrznG45bKh
	B0X4afxJu1InTiGJHqDh8S/FNZk0/lUCkdDyagvZAefieBbl8opFBGXWh41jxg==
X-Gm-Gg: ASbGncu5ZcQmkpRJr59xEdyi17MioJl42yOsopFqi9mdIauEmV+9K0qpJOdeJTnXgHd
	JTZxLGD2wnWcXuNLBO9w6kuU8+Niio1fUUWHTBYpA7Q0dSf+hEnJAVHh5Tp9LZAwOwkYekLgdp9
	2cumWW5q2pvhStefecpW0zWEpwD8mcj1b8WpddoDPLW6GEAYQW39+N6tu0f/pT5PSsih4YXBxMW
	uy6ehkK9NDVKE3p/9c9hN0JQbwJ1PyMOcBGutwVlcc4rxyZMLRUnpBRpy1Bwkwr35diVxY1hP1v
	69BwUTgI4Zb4tDZ21vwI8t3kcb53ZzTUPS4sMjAWDX4G1vTDDb2IvFfkwsFAqfQ2KhVs+SVM3pl
	1v+6DC1cy/TlzYOdNKdB4NKQYGjL/8MjOvyI+0uzoRNgmoiqWf9eiOA/pTx6EjFOE77F9YWp7F+
	ITmDaaDQuCHAVAYJqi6dpgFEeWzDoxE/7wSpEkWCEcVZj1EZg=
X-Google-Smtp-Source: AGHT+IE+N6aBidIuBuDN8zDsY4bu5srQfeHwXqQ1F4VgjSOhMruGnk2DKADIDBYqol9L5KY/HiVu6A==
X-Received: by 2002:a05:6402:358a:b0:61c:9852:bb9f with SMTP id 4fb4d7f45d1cf-63c1f630745mr12406192a12.1.1760975904493;
        Mon, 20 Oct 2025 08:58:24 -0700 (PDT)
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
Subject: [for 4.22 v5 14/18] xen/riscv: Implement superpage splitting for p2m mappings
Date: Mon, 20 Oct 2025 17:57:57 +0200
Message-ID: <5ee174bc9b0a5ad4de91d65116d7844ca2bcdceb.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/p2m.c | 116 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 6018cac336..383047580a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -735,7 +735,88 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
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
+    for ( i = 0; i < P2M_PAGETABLE_ENTRIES(next_level); i++ )
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
@@ -800,7 +881,38 @@ static int p2m_set_entry(struct p2m_domain *p2m,
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
2.51.0


