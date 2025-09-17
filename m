Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ABAB8219E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125763.1467646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Ik-0000w8-O4; Wed, 17 Sep 2025 22:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125763.1467646; Wed, 17 Sep 2025 22:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Ik-0000u1-JE; Wed, 17 Sep 2025 22:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1125763;
 Wed, 17 Sep 2025 22:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08M-0007Lt-39
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:14 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb3aab1-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:10 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso323471b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:10 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:08 -0700 (PDT)
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
X-Inumbo-ID: 1eb3aab1-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146169; x=1758750969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHAAkZYflTFjWq/L7+VdJfutxn9e76f5Fh7Kk/TWJlg=;
        b=TGgsuEx77p7cmZB1aWEe1PDzPji2nEFp1eVDM/qXtr+n/kjjncnMjOHZt9Cj4B2FkU
         d9i3sCjjCrSvc2ePavFHnGSr4AyDUX17tK964HIEuOxTp5r9sD9wq2Bu4vg/wie7TGDn
         0b6T4tHpQWK/np9A9/NLieTqkccoApV+WC3b5JMD72pbmjsm8WSKGiQsKZmlz66ECv5O
         MT9gk4J6gI2jZupx+88+Kdokf9VCTVVb0AUDvUvLMcMbaroCt/1s54JiLuJoDSAZ8EsY
         E8B+BxfFLish7/GhQL9WJ+Rm4M3BaCExso8Ut2WabSwfJlbW3ujbFwh/oKV5RuV/j9Kc
         UWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146169; x=1758750969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHAAkZYflTFjWq/L7+VdJfutxn9e76f5Fh7Kk/TWJlg=;
        b=TzE6AWDAntb+Kh8LR7eYj9SeQcgFKKjQaW2RskEGw9RTvjTRIBWHvbtz6182p5LOz0
         v1TnljuFEk3uEp8UxR1C9llAbBdUI4mJXzD4LiSmY+qDaTkwsTQTBgPhlRAYajK1UAPa
         SaD+7a+X01karuKJd/MlWre2I/lr8xxSw3SQHeVzQlSMWVgre/GY/k5P79MzVB6K/LOe
         poO+Bc1GBL0z/RRNQRj8+P2U2OtGlr3CzHqupuA1YHjpdAxhnx+WtwUHIHIk90IUYv1T
         ivvHHtrKnVsi2KqtNPSc3EM43wQt++LkMR36R9e0BxN8p9YLX5MUXYTtHCTpjCS6KVr9
         yNZQ==
X-Gm-Message-State: AOJu0Yxbtn6FfsaqsD3XlvJPfd7f0+9M1JLt21EVeKsWVldwoLDQ94FG
	6V0Ewr4GkmoH8fe9Hdf59eJvS1qqxVy2IjDZ7ys0/VsCDxX29gY9dUXDU4T8q5jzB08=
X-Gm-Gg: ASbGncsufNV2aKP5Y4VM0+JwtE+OsMrKv1J66NLV4RRmjL2BYLLpGvCk6X82DzbXDEI
	rGVGYHqSjVKhlhiktX5qCZVj7OPX0t8kfcTU6yHzyVsy3kudhMEJCOngnAKURy+px2zsMhdb3Xs
	Pfr4rpGn0RM/W8ezbOGMgNCoBApmTa/uizBHbdHxciE7R9N52n/02arw04bOXekYiHvClzNbTbo
	Dq/3E0A551LppTtDFYpeNvTmY+nc9ksF76mC7NWjM/pctmvkdUENO8silPonA0F6S3K4GIPPQYA
	0Kn09/Ssw9w6huYehDA0eHjTO8BrNQi4cwVQ51IX6vwgTST23ATcAaQiIQivoKTgSA4PujgCzh/
	lY3f5y8ciEkDfCpZhnNUMZo9rLKiL+1WvzPtVyvimUIoq
X-Google-Smtp-Source: AGHT+IFRc0lTC9CHjAt86cWRwA6G6UVKrzGQLeD8EdWUI1dDgx8UL2Vyp0U8TFn8LsBl0ymjvBZ1Jg==
X-Received: by 2002:a17:902:e745:b0:266:3098:666 with SMTP id d9443c01a7336-268137f202emr43875055ad.32.1758146168904;
        Wed, 17 Sep 2025 14:56:08 -0700 (PDT)
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
Subject: [PATCH v4 14/18] xen/riscv: Implement superpage splitting for p2m mappings
Date: Wed, 17 Sep 2025 23:55:34 +0200
Message-ID: <ff4df3d98d5acdffee3b1c1b0c345c25ea44264c.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/p2m.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index bf4945e99f..1577b09b15 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -661,6 +661,87 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
     p2m_free_page(p2m, pg);
 }
 
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
+                                 level - 1, target, offsets);
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
 /*
  * Insert an entry in the p2m. This should be called with a mapping
  * equal to a page/superpage.
@@ -729,7 +810,38 @@ static int p2m_set_entry(struct p2m_domain *p2m,
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


