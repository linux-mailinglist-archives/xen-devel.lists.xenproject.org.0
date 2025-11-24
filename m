Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED546C807CF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170582.1495748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm3-0005EB-Fo; Mon, 24 Nov 2025 12:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170582.1495748; Mon, 24 Nov 2025 12:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm2-00052G-V2; Mon, 24 Nov 2025 12:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1170582;
 Mon, 24 Nov 2025 12:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVm0-0001Xp-2z
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:28 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b8618e-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:26 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so6370515a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:26 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:24 -0800 (PST)
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
X-Inumbo-ID: e9b8618e-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987665; x=1764592465; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGXjcl4bzWfmrQHbEGDLfbvaNcULNHnb/4QqHCXuuw0=;
        b=fl6lZUy1z2BnB7KoGidTtoj/mTWWtyyiSYKDSVb+cO+AYOlrJnJuYHaNYCaVpLz+Cs
         RaoKo2TCqDhISKGfnneMfFsrUvuU4gkd/r2TQpF5By0yqEx2qK78wPCMlyd399TAgac4
         o1kIeN5PspWoYXCDHijv6rDRKhFMR1mZtOUgAxzxO+DvHEA0IqVRpdlJvwyjxoOHpIRW
         x+GMPZcRwjYmIXoA2T1nsmMdIT8o0O84piKwQ61YW4T9D030lom+xog0mIFE/B2MlpbE
         t/2wk03IkxS07mj6wejD4Iq/FAR7yRdadZDQU9xmavNmE8/ozu+F7rds5KyX/RzbE8RN
         Xgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987665; x=1764592465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGXjcl4bzWfmrQHbEGDLfbvaNcULNHnb/4QqHCXuuw0=;
        b=D2lA0l0bLi66YlZluKmBsTCHAj8Tkd6avH3MLEkjTf0wsbxd1cRRWejtrInprgPEDE
         GGgMUhSQNuBMqpR0dagmyDDJ7lpWedxNBw1n0LklJBHUVNAQ6AKHYbUf+ar0h5HWnvrm
         bVxjWRcNJpyvFmI6r/dquVt0cKK7AWEyNm1MDJ3xIqR1oC8gVZWCx2DWMEgO45kf6uTI
         eK6nYA1UfvsuHVTUlRLp/cN0jKTh6+Z9SOUQXVqBq3LTl9UTHurrwYzUOCm4CsW+4J/W
         m+KZtZlQLA3Lb4EsCvT4GWfpaLK2Biu9pGlu2JRlITi5hO6SIpnkd/KDCXCEYhYGL7MA
         40XQ==
X-Gm-Message-State: AOJu0YwXUcb8wW+mJ5Xp4cSvHWF7lHVIkBmTjjaauf2oveGKRPPE4z6S
	JyBNFBUkiuZXbnuu/4HVTdS0gjFLlozG+Sbg/cZ1Lsh8IwKOppUpSVcfkUvR8Swk
X-Gm-Gg: ASbGncuB2l5eSzwkth84HSn13hmRpN2SQSkaihF6bbjUFqUSVgcUkmgIr+RwWTIkhiF
	N5R4AIcKnv7a0sPD2dk6JXk6PCJck6O1mf55Hnnr7M8qxK5a8EW9vG8voKwR3SXEAuZcmFAKjLv
	moCDAAarAIuI0uuMWcBg60SEHd40TmE5nlfvgGaHo9WK0LR8UgF3vsnO7sx56TLCyrtd4n2d2eW
	TQAOfKO+9ZFjJMzFb8Jtrfubxf5PASpj96DunmUBHFjsyH1jkE/z3TgfBIEPqXYO2jo8bD2jCp/
	Er1faIdZysY00eldW8uJYGDURu4g49X6HCwm8AHwq7OA7/uozsjccngi1PjgYNx8tjauGEkEspI
	C8mL3M5L9P5qW78oWOta0LihNYCca5WCYvAVjuSbZnlBQM4Q+tQr1BxsBmv4frs7v8FzCFsOGVM
	6aq46OC1+NfiBQFM6LAXT2AgmNtWryNosHvwxr2QFnYf7ptzETi8zj1QY=
X-Google-Smtp-Source: AGHT+IGUzf5O3Fs9PsDR3D4iInrsRcuWqHw7CfxK66+HfRlX3e/RhLvLffcQzyfw2D2CoKfQGhhpqg==
X-Received: by 2002:a17:906:7314:b0:b70:b13c:3622 with SMTP id a640c23a62f3a-b7671549d09mr1271883866b.4.1763987665154;
        Mon, 24 Nov 2025 04:34:25 -0800 (PST)
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
Subject: [PATCH v6 15/19] xen/riscv: Implement superpage splitting for p2m mappings
Date: Mon, 24 Nov 2025 13:33:48 +0100
Message-ID: <a6437054d985b8a014c771fcbd1634fb80cea4e6.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
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
index c6b7acf1b7..4b6baeaaf2 100644
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
index 16663650ee..b29c0a220a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -746,7 +746,88 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
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
@@ -811,7 +892,38 @@ static int p2m_set_entry(struct p2m_domain *p2m,
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
2.51.1


