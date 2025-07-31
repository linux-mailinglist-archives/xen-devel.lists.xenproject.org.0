Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1CB17487
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065970.1431355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjI-0003Bj-Ig; Thu, 31 Jul 2025 16:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065970.1431355; Thu, 31 Jul 2025 16:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjI-0003A7-F3; Thu, 31 Jul 2025 16:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1065970;
 Thu, 31 Jul 2025 16:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgQ-0000zK-SU
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:59:06 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46575398-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:59:01 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55b797ad392so1255519e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:59:01 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:59 -0700 (PDT)
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
X-Inumbo-ID: 46575398-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977540; x=1754582340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX/IvnaSg+TBaVH3h6HU80ocSKilMokIToU2WpARmXk=;
        b=Qd+EFpX5xdyLZTZV45LcQXZQXq7urY1sfh932BYxpMFywyvP/RFckz9Kda/DAjh8p0
         Z78hI+vuUQcrK9wQsHfrgXqZ4lWa0G1tz40BA9KTsl/ROOqyGXLVoyEdZcfujwmH1I41
         649CXm+Rr2EhpMKiQh3cj2BsKR2N2G0H4jyEkmvrrJzUHEQPWKg6oXi6j/iSTCGjk/RD
         zr47CpIoZrmQJR7dlaJX+gwk/I2YKNo8g71K6itlHwawK1capjksFFGhfU4ZzDwzrHSs
         pIPA0VsFw5dNur+Qi4fKvd55fztoPZMp0yX7uj5IMVQxo6P4FqswvoDURAa1lKLUkE0r
         f/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977540; x=1754582340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EX/IvnaSg+TBaVH3h6HU80ocSKilMokIToU2WpARmXk=;
        b=opO+0BaKaLPpB1MArIcjbwAiEom911R6MmX1Z/rz+q2OR8bG5U1I1tndqFu5Denuyl
         ODXjxhFUzoVoWZ2a0mVwEcy0LZr5hSBrBGmeSH8UbvpbM/mOnw/CHvqrSorv/gAqvqtD
         +wvscv7iGPy6gb8tMjmZpgWrA59QYUqHFXLSIxDb+t0jk22ZrsvgLuAa8kLFvnssdt3c
         CM7i9HRm3E9TtARb4vBp8nEkNA0dluDTek8l1nblCs+bElCo6PMccRsmWxp3zb0t/pjx
         WTm3lOOMsrdPUmnBbF3qYn7TNtMsN6nqw20jQu1Qo9Lu2EEeoXmGi8x50p38YuVMNR7l
         Ww8g==
X-Gm-Message-State: AOJu0Ywv0Ln0TaRyqmsXWULxNK3knx1G1SV2jZv+jmTL3DZMVvwMi2B8
	3+ngloWN2llCbTliEiB1duDfoofLJzmY8clx7/WkYnIOph1tOFEspQab7u98wg==
X-Gm-Gg: ASbGncvSFKb2ux7ZyLl0iNmVtD/Wdklh1eODkBBjZKsgxmPxwInS/Vjn5i7b+zCOqaf
	Miv81Qqv/9neB3/lyhKDxYiWXvvFX7QFI4w1P6U1Gbe4BREy1gdpgc9/bbLh5HMhO2rCgStM6lE
	ZAQ2TewELM0Q9Q264/9mOqED3W9xxdcHHl/fN7vzCORvgTHryfIyETN1qGlVHsmiUmK45MqENuJ
	ZGsgaeQEVsgM545506fr5G3fIIbNisdXYlpC5gfbiw94nbayr4Qr9Ah4/Jr7qwd3cOQdhWeDWyP
	a6DGDenMlvwGdCJ6M9bm/SLIxebKNaF34ESHy8cs9V2nrmGKZIKoy5D5QAjRwrlAJg8voouW/x+
	Kn5a9EXgxjy96164bj2bZ/eqVgfVt5aC6/tk6Oq3pXKlE9B6q4X04zfEbgWLD5lwXZlBXP/RK
X-Google-Smtp-Source: AGHT+IF5zHEapqut2Mu0868zzfYS/rrg1qZ8aVIR8wjeA9Qh5d4+ZIRYdg18vbUfn9OCZVvedaco3w==
X-Received: by 2002:a05:6512:3050:b0:55b:8a28:3cbc with SMTP id 2adb3069b0e04-55b8a283d8cmr810801e87.51.1753977540151;
        Thu, 31 Jul 2025 08:59:00 -0700 (PDT)
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
Subject: [PATCH v3 20/20] xen/riscv: introduce metadata table to store P2M type
Date: Thu, 31 Jul 2025 17:58:19 +0200
Message-ID: <802d757c167121c0a5ae2e529f5a365f779c5e59.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V's PTE has only two available bits that can be used to store the P2M
type. This is insufficient to represent all the current RISC-V P2M types.
Therefore, some P2M types must be stored outside the PTE bits.

To address this, a metadata table is introduced to store P2M types that
cannot fit in the PTE itself. Not all P2M types are stored in the
metadata table—only those that require it.

The metadata table is linked to the intermediate page table via the
`struct page_info`'s list field of the corresponding intermediate page.

To simplify the allocation and linking of intermediate and metadata page
tables, `p2m_{alloc,free}_table()` functions are implemented.

These changes impact `p2m_split_superpage()`, since when a superpage is
split, it is necessary to update the metadata table of the new
intermediate page table — if the entry being split has its P2M type set
to `p2m_ext_storage` in its `P2M_TYPES` bits. In addition to updating
the metadata of the new intermediate page table, the corresponding entry
in the metadata for the original superpage is invalidated.

Also, update p2m_{get,set}_type to work with P2M types which don't fit
into PTE bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Add is_p2m_foreign() macro and connected stuff.
 - Change struct domain *d argument of p2m_get_page_from_gfn() to
   struct p2m_domain.
 - Update the comment above p2m_get_entry().
 - s/_t/p2mt for local variable in p2m_get_entry().
 - Drop local variable addr in p2m_get_entry() and use gfn_to_gaddr(gfn)
   to define offsets array.
 - Code style fixes.
 - Update a check of rc code from p2m_next_level() in p2m_get_entry()
   and drop "else" case.
 - Do not call p2m_get_type() if p2m_get_entry()'s t argument is NULL.
 - Use struct p2m_domain instead of struct domain for p2m_lookup() and
   p2m_get_page_from_gfn().
 - Move defintion of get_page() from "xen/riscv: implement mfn_valid() and page reference, ownership handling helpers"
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/mm.h |   9 ++
 xen/arch/riscv/p2m.c            | 205 +++++++++++++++++++++++++-------
 2 files changed, 170 insertions(+), 44 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index d5be328906..7cf0988f44 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -150,6 +150,15 @@ struct page_info
             /* Order-size of the free chunk this page is the head of. */
             unsigned int order;
         } free;
+
+        /* Page is used to store metadata: p2m type. */
+        struct {
+            /*
+             * Pointer to a page which store metadata for an intermediate page
+             * table.
+             */
+            struct page_info *metadata;
+        } md;
     } v;
 
     union {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 24a09d4537..a909db654a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -101,7 +101,16 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
 {
     struct domain *d = p2m->domain;
     struct page_info *page;
-    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
+    /*
+     * If the root page table starts at Level <= 2, and since only 1GB, 2MB,
+     * and 4KB mappings are supported (as enforced by the ASSERT() in
+     * p2m_set_entry()), it is necessary to allocate P2M_ROOT_PAGES for
+     * the root page table itself, plus an additional P2M_ROOT_PAGES for
+     * metadata storage. This is because only two free bits are available in
+     * the PTE, which are not sufficient to represent all possible P2M types.
+     */
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES *
+                                       ((P2M_ROOT_LEVEL <= 2) ? 2 : 1);
 
     /*
      * Return back nr_root_pages to assure the root table memory is also
@@ -114,6 +123,23 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
     if ( !page )
         return -ENOMEM;
 
+    if ( P2M_ROOT_LEVEL <= 2 )
+    {
+        /*
+         * In the case where P2M_ROOT_LEVEL <= 2, it is necessary to allocate
+         * a page of the same size as that used for the root page table.
+         * Therefore, p2m_allocate_root() can be safely reused.
+         */
+        struct page_info *metadata = p2m_allocate_root(d);
+        if ( !metadata )
+        {
+            free_domheap_pages(page, P2M_ROOT_ORDER);
+            return -ENOMEM;
+        }
+
+        page->v.md.metadata = metadata;
+    }
+
     p2m->root = page;
 
     return 0;
@@ -198,24 +224,25 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+static void p2m_set_type(pte_t *pte, const p2m_type_t t, const unsigned int i)
 {
-    int rc = 0;
-
     if ( t > p2m_ext_storage )
-        panic("unimplemeted\n");
+    {
+        ASSERT(pte);
+
+        pte[i].pte = t;
+    }
     else
         pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
-
-    return rc;
 }
 
-static p2m_type_t p2m_get_type(const pte_t pte)
+static p2m_type_t p2m_get_type(const pte_t pte, const pte_t *metadata,
+                               const unsigned int i)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
 
     if ( type == p2m_ext_storage )
-        panic("unimplemented\n");
+        type = metadata[i].pte;
 
     return type;
 }
@@ -265,7 +292,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
+                              struct page_info *metadata_pg,
+                              const unsigned int indx,
+                              bool is_table)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -285,12 +315,21 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 
     if ( !is_table )
     {
+        pte_t *metadata = __map_domain_page(metadata_pg);
+
         p2m_set_permission(&e, t);
 
+        metadata[indx].pte = p2m_invalid;
+
         if ( t < p2m_ext_storage )
-            p2m_set_type(&e, t);
+            p2m_set_type(&e, t, indx);
         else
-            panic("unimplemeted\n");
+        {
+            e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+            p2m_set_type(metadata, t, indx);
+        }
+
+        unmap_domain_page(metadata);
     }
     else
         /*
@@ -309,8 +348,10 @@ static pte_t page_to_p2m_table(struct page_info *page)
      * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
      * set to true and p2m_type_t shouldn't be applied for PTEs which
      * describe an intermidiate table.
+     * That it also a reason why `metadata` and `indx` argument of
+     * p2m_pte_from_mfn() are NULL.
      */
-    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, 0, true);
 }
 
 static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
@@ -323,22 +364,71 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Allocate a page table with an additional extra page to store
+ * metadata for each entry of the page table.
+ * Link this metadata page to page table page's list field.
+ */
+static struct page_info * p2m_alloc_table(struct p2m_domain *p2m)
+{
+    enum table_type
+    {
+        INTERMEDIATE_TABLE=0,
+        /*
+         * At the moment, metadata is going to store P2M type
+         * for each PTE of page table.
+         */
+        METADATA_TABLE,
+        TABLE_MAX
+    };
+
+    struct page_info *tables[TABLE_MAX];
+
+    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
+    {
+        tables[i] = p2m_alloc_page(p2m);
+
+        if ( !tables[i] )
+            goto out;
+
+        clear_and_clean_page(tables[i]);
+    }
+
+    tables[INTERMEDIATE_TABLE]->v.md.metadata = tables[METADATA_TABLE];
+
+    return tables[INTERMEDIATE_TABLE];
+
+ out:
+    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
+        if ( tables[i] )
+            p2m_free_page(p2m, tables[i]);
+
+    return NULL;
+}
+
+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    ASSERT(tbl_pg->v.md.metadata);
+
+    p2m_free_page(p2m, tbl_pg->v.md.metadata);
+    p2m_free_page(p2m, tbl_pg);
+}
+
 /*
  * Allocate a new page table page with an extra metadata page and hook it
  * in via the given entry.
  */
 static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
 {
-    struct page_info *page;
+    struct page_info *page = p2m_alloc_table(p2m);
 
     ASSERT(!pte_is_valid(*entry));
 
-    page = p2m_alloc_page(p2m);
-    if ( page == NULL )
-        return -ENOMEM;
-
-    clear_and_clean_page(page);
-
     p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_pte);
 
     return 0;
@@ -453,10 +543,9 @@ static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
 }
 
 /* Put any references on the page referenced by pte. */
-static void p2m_put_page(const pte_t pte, unsigned int level)
+static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
 {
     mfn_t mfn = pte_get_mfn(pte);
-    p2m_type_t p2m_type = p2m_get_type(pte);
 
     ASSERT(pte_is_valid(pte));
 
@@ -470,10 +559,10 @@ static void p2m_put_page(const pte_t pte, unsigned int level)
     switch ( level )
     {
     case 1:
-        return p2m_put_2m_superpage(mfn, p2m_type);
+        return p2m_put_2m_superpage(mfn, p2mt);
 
     case 0:
-        return p2m_put_4k_page(mfn, p2m_type);
+        return p2m_put_4k_page(mfn, p2mt);
     }
 }
 
@@ -486,10 +575,11 @@ static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
 
 /* Free pte sub-tree behind an entry */
 static void p2m_free_subtree(struct p2m_domain *p2m,
-                             pte_t entry, unsigned int level)
+                             pte_t entry, unsigned int level,
+                             const pte_t *metadata, const unsigned int index)
 {
     unsigned int i;
-    pte_t *table;
+    pte_t *table, *tmp_metadata;
     mfn_t mfn;
     struct page_info *pg;
 
@@ -499,6 +589,8 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
 
     if ( pte_is_superpage(entry, level) || (level == 0) )
     {
+        p2m_type_t p2mt = p2m_get_type(entry, metadata, index);
+
 #ifdef CONFIG_IOREQ_SERVER
         /*
          * If this gets called then either the entry was replaced by an entry
@@ -511,15 +603,21 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
             ioreq_request_mapcache_invalidate(p2m->domain);
 #endif
 
-        p2m_put_page(entry, level);
+        p2m_put_page(entry, level, p2mt);
 
         return;
     }
 
-    table = map_domain_page(pte_get_mfn(entry));
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+    table = map_domain_page(mfn);
+    pg = mfn_to_page(mfn);
+    tmp_metadata = __map_domain_page(pg->v.md.metadata);
+
     for ( i = 0; i < XEN_PT_ENTRIES; i++ )
-        p2m_free_subtree(p2m, table[i], level - 1);
+        p2m_free_subtree(p2m, table[i], level - 1, tmp_metadata, i);
 
+    unmap_domain_page(tmp_metadata);
     unmap_domain_page(table);
 
     /*
@@ -530,23 +628,19 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
      */
     p2m_tlb_flush_sync(p2m);
 
-    mfn = pte_get_mfn(entry);
-    ASSERT(mfn_valid(mfn));
-
-    pg = mfn_to_page(mfn);
-
-    page_list_del(pg, &p2m->pages);
-    p2m_free_page(p2m, pg);
+    p2m_free_table(p2m, pg);
 }
 
 static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
                                 unsigned int level, unsigned int target,
-                                const unsigned int *offsets)
+                                const unsigned int *offsets,
+                                pte_t *metadata_tbl)
 {
     struct page_info *page;
     unsigned long i;
     pte_t pte, *table;
     bool rv = true;
+    pte_t *tmp_metadata_tbl;
 
     /* Convenience aliases */
     mfn_t mfn = pte_get_mfn(*entry);
@@ -560,7 +654,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
     ASSERT(level > target);
     ASSERT(pte_is_superpage(*entry, level));
 
-    page = p2m_alloc_page(p2m->domain);
+    page = p2m_alloc_table(p2m);
     if ( !page )
     {
         /*
@@ -572,6 +666,8 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         return false;
     }
 
+    tmp_metadata_tbl = __map_domain_page(page->v.md.metadata);
+
     table = __map_domain_page(page);
 
     /*
@@ -589,6 +685,9 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+            tmp_metadata_tbl[i] = metadata_tbl[offsets[level]];
+
         write_pte(new_entry, pte);
     }
 
@@ -600,7 +699,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     if ( next_level != target )
         rv = p2m_split_superpage(p2m, table + offsets[next_level],
-                                 level - 1, target, offsets);
+                                 level - 1, target, offsets, tmp_metadata_tbl);
 
     if ( p2m->clean_pte )
         clean_dcache_va_range(table, PAGE_SIZE);
@@ -612,6 +711,8 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     unmap_domain_page(table);
 
+    unmap_domain_page(tmp_metadata_tbl);
+
     /*
      * Even if we failed, we should (according to the current implemetation
      * of a way how sub-tree is freed if p2m_split_superpage hasn't been
@@ -690,18 +791,23 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *metadata = virt_to_page(table)->v.md.metadata;
+        pte_t *metadata_tbl = __map_domain_page(metadata);
 
         ASSERT(pte_is_superpage(*entry, level));
 
-        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
+                                  metadata_tbl) )
         {
             /* Free the allocated sub-tree */
-            p2m_free_subtree(p2m, split_pte, level);
+            p2m_free_subtree(p2m, split_pte, level, metadata_tbl, offsets[level]);
 
             rc = -ENOMEM;
             goto out;
         }
 
+        unmap_domain_page(metadata_tbl);
+
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
         p2m->need_flush = true;
@@ -734,7 +840,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_pte);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, virt_to_page(table)->v.md.metadata,
+                                     offsets[level], false);
 
         p2m_write_pte(entry, pte, p2m->clean_pte);
 
@@ -764,7 +871,12 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( pte_is_valid(orig_pte) &&
          !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
-        p2m_free_subtree(p2m, orig_pte, level);
+    {
+        struct page_info *metadata = virt_to_page(table)->v.md.metadata;
+        pte_t *metadata_tbl = __map_domain_page(metadata);
+        p2m_free_subtree(p2m, orig_pte, level, metadata_tbl, offsets[level]);
+        unmap_domain_page(metadata_tbl);
+    }
 
  out:
     unmap_domain_page(table);
@@ -924,7 +1036,12 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( pte_is_valid(entry) )
     {
         if ( t )
-            *t = p2m_get_type(entry);
+        {
+            struct page_info *metadata_pg = virt_to_page(table)->v.md.metadata;
+            pte_t *metadata = __map_domain_page(metadata_pg);
+            *t = p2m_get_type(entry, metadata, offsets[level]);
+            unmap_domain_page(metadata);
+        }
 
         mfn = pte_get_mfn(entry);
         /*
-- 
2.50.1


