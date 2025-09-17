Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709ABB82192
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125687.1467616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Hs-0007Zf-Ru; Wed, 17 Sep 2025 22:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125687.1467616; Wed, 17 Sep 2025 22:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0Hs-0007Xg-Os; Wed, 17 Sep 2025 22:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1125687;
 Wed, 17 Sep 2025 22:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08U-0007Lu-Jb
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:22 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21cc1b56-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:56:16 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-26983b5411aso1412745ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:15 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:13 -0700 (PDT)
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
X-Inumbo-ID: 21cc1b56-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146174; x=1758750974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds+7Ox7wi39qespVZnaAV04YH/eEJPfsE5uBaveiQ6o=;
        b=X3k5Xdx1SdA3Lh4hyBJCOZfuBfrMKFPC+KVlPVTwQb3f8KBtYK9I+MHL5VGaWpth+M
         DeVp6elKvzbWVnzcavitHr7jeL7XqAX4kx4QIwtaMOrllJZwRtST5ZKnR3UaXKjyMoFW
         hszFbCfjs26Hor1C5F4O8R320LDz0r1KpSp2hSfZA9Hb5zIJ4G6Kdpk7GJHIZ4aHhHqB
         /5++0Y6vw3jk/y08GSqRlEFnALtiBbyu9qpBbmps6CZ+WxNlGWRy3qNGqiZWeqE0tAZl
         mMBRDwrw3rmIGWLDX2S7uK3Q2D77SAgaxgselHa+3LK6UVbOXS76eKb5Z5/D3h1b98Lf
         ijFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146174; x=1758750974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ds+7Ox7wi39qespVZnaAV04YH/eEJPfsE5uBaveiQ6o=;
        b=ROFwxTu23+0gYBqmEB6sv9716KMxELbfV3xHkdAty5mvtFy9GFEz+Y9CdtW0DfnJ9o
         Gg4+iXLYOM3f6YkBzPmsqLQS+5nF1XaPt0uatsTjkisbt7z66yaF7awpmMmqPCtalcif
         Wa0nQ1NU1Nos8OOVLGoHClhp1Qu0p5oUv25Q/p1fGyMOsgnkROpbCUAs6+GwNq70U/fG
         +DxgsoAmK0RrS1VbUqvGdqqw8QmphdFQ6CLpDkkiV8DlsmJYXTwogr8Q8sa+2eWrucaY
         yay4CihJhREI3EtTHt4+1w5f6HFWdIFJNVEeYHbH9/RyoTJXPz38IwUcI+5rS7Jq2OPe
         kYxQ==
X-Gm-Message-State: AOJu0Yx08K61vjQL+HsHzuGl7vhcMg7Biq17HJENHvSuVk4A6IR0pOsk
	9EAM7BSo3EA0e4OEk6I6T3pAgONEZ1A3+daqA5VdxIFXgIKr+hjPLj4Vht1861skNZY=
X-Gm-Gg: ASbGnctatPBLQrEQy0Q4SGSGidS3EYyJj2k358f9ZkGU68Kj3CmLDJwWGstrRzcc+Cu
	WgzfLbZxbKL6N1iKAZbmMYVS9HQS9jTllxV7izch/Ax5GHE3158A3+hiU7boTKnNvvakWgmaxrK
	AcXgL+9cJFnjhQNkWfsIYnzeqkKgULV2bUleZMfH2XgjoZ7bckdoulPBeTzMvkt+RlDaGoJ/d8J
	GhDHP8G7++1pip1f6rFTdNdsvzzC/sCSG++TNmBISZZyCiZ+9Dm7gyJOBqyU/bzQXcMgPVLT41X
	SajT5rSPtnwXfORlbphdgb9mZjz0Ai7X/JlIkAQ/I6CWpX55OaWYODr2P907KWRMK0T+OpbcErT
	f+nN5egqJG5W99NDJXcMxl4o/K9Zb3W45VtdjJsBNl9Pj
X-Google-Smtp-Source: AGHT+IEAXrWsRpP+CUwqPeg1T17Oa8Q5eqNZLWNS3IJc6kCdn4FmDzismYUiV8EHK23q6btjvLkasw==
X-Received: by 2002:a17:902:ecce:b0:250:643e:c947 with SMTP id d9443c01a7336-268137ee403mr42768085ad.28.1758146173958;
        Wed, 17 Sep 2025 14:56:13 -0700 (PDT)
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
Subject: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M type
Date: Wed, 17 Sep 2025 23:55:38 +0200
Message-ID: <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
`struct page_info`'s v.md.metadata field of the corresponding intermediate
page.
Such pages are allocated with MEMF_no_owner, which allows us to use
the v field for the purpose of storing the metadata table.

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

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
 - Update the comment above declation of md structure inside struct page_info to:
   "Page is used as an intermediate P2M page table".
 - Allocate metadata table on demand to save some memory. (1)
 - Rework p2m_set_type():
   - Add allocatation of metadata page only if needed.
   - Move a check what kind of type we are handling inside p2m_set_type().
 - Move mapping of metadata page inside p2m_get_type() as it is needed only
   in case if PTE's type is equal to p2m_ext_storage.
 - Add some description to p2m_get_type() function.
 - Drop blank after return type of p2m_alloc_table().
 - Drop allocation of metadata page inside p2m_alloc_table becaues of (1).
 - Fix p2m_free_table() to free metadata page only if it was allocated.
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
 xen/arch/riscv/p2m.c            | 247 +++++++++++++++++++++++++++-----
 2 files changed, 218 insertions(+), 38 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 1b16809749..1464119b6f 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -149,6 +149,15 @@ struct page_info
             /* Order-size of the free chunk this page is the head of. */
             unsigned int order;
         } free;
+
+        /* Page is used as an intermediate P2M page table */
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
index a5ea61fe61..14809bd089 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -16,6 +16,16 @@
 #include <asm/paging.h>
 #include <asm/riscv_encoding.h>
 
+/*
+ * P2M PTE context is used only when a PTE's P2M type is p2m_ext_storage.
+ * In this case, the P2M type is stored separately in the metadata page.
+ */
+struct p2m_pte_ctx {
+    struct page_info *pt_page;   /* Page table page containing the PTE. */
+    unsigned int index;          /* Index of the PTE within that page. */
+    unsigned int level;          /* Paging level at which the PTE resides. */
+};
+
 unsigned long __ro_after_init gstage_mode;
 unsigned int __ro_after_init gstage_root_level;
 
@@ -289,24 +299,98 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+static struct page_info * p2m_alloc_table(struct p2m_domain *p2m);
+
+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
+ * otherwise, they may be NULL.
+ */
+static void p2m_set_type(pte_t *pte, const p2m_type_t t,
+                         struct p2m_pte_ctx *ctx,
+                         struct p2m_domain *p2m)
 {
-    int rc = 0;
+    /*
+    * For the root page table (16 KB in size), we need to select the correct
+    * metadata table, since allocations are 4 KB each. In total, there are
+    * 4 tables of 4 KB each.
+    * For none-root page table index of ->pt_page[] will be always 0 as
+    * index won't be higher then 511. ASSERT() below verifies that.
+    */
+    struct page_info **md_pg =
+        &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.metadata;
+    pte_t *metadata = NULL;
+
+     /* Be sure that an index correspondent to page level is passed. */
+    ASSERT(ctx->index <= P2M_PAGETABLE_ENTRIES(ctx->level));
+
+    if ( !*md_pg && (t >= p2m_first_external) )
+    {
+        /*
+         * Ensure that when `t` is stored outside the PTE bits
+         * (i.e. `t == p2m_ext_storage` or higher),
+         * both `ctx` and `p2m` are provided.
+         */
+        ASSERT(p2m && ctx);
 
-    if ( t > p2m_first_external )
-        panic("unimplemeted\n");
-    else
+        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
+        {
+            struct domain *d = p2m->domain;
+
+            *md_pg = p2m_alloc_table(p2m);
+            if ( !*md_pg )
+            {
+                printk("%s: can't allocate extra memory for dom%d\n",
+                        __func__, d->domain_id);
+                domain_crash(d);
+            }
+        }
+        else
+            /*
+             * It is not legal to set a type for an entry which shouldn't
+             * be mapped.
+             */
+            ASSERT_UNREACHABLE();
+    }
+
+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t < p2m_first_external )
+    {
         pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
 
-    return rc;
+        if ( metadata )
+            metadata[ctx->index].pte = p2m_invalid;
+    }
+    else
+    {
+        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx->index].pte = t;
+    }
+
+    if ( metadata )
+        unmap_domain_page(metadata);
 }
 
-static p2m_type_t p2m_get_type(const pte_t pte)
+/*
+ * `pte` -> PTE entry that stores the PTE's type.
+ *
+ * If the PTE's type is `p2m_ext_storage`, `ctx` should be provided;
+ * otherwise it could be NULL.
+ */
+static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
 
     if ( type == p2m_ext_storage )
-        panic("unimplemented\n");
+    {
+        pte_t *md = __map_domain_page(ctx->pt_page->v.md.metadata);
+        type = md[ctx->index].pte;
+        unmap_domain_page(ctx->pt_page->v.md.metadata);
+    }
 
     return type;
 }
@@ -381,7 +465,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+static pte_t p2m_pte_from_mfn(const mfn_t mfn, const p2m_type_t t,
+                              struct p2m_pte_ctx *p2m_pte_ctx,
+                              const bool is_table,
+                              struct p2m_domain *p2m)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -402,7 +489,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
     if ( !is_table )
     {
         p2m_set_permission(&e, t);
-        p2m_set_type(&e, t);
+        p2m_set_type(&e, t, p2m_pte_ctx, p2m);
     }
     else
         /*
@@ -421,8 +508,13 @@ static pte_t page_to_p2m_table(const struct page_info *page)
      * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
      * set to true and p2m_type_t shouldn't be applied for PTEs which
      * describe an intermidiate table.
+     * That it also a reason why `p2m_pte_ctx` argument is NULL as a type
+     * isn't set for p2m tables.
+     * As p2m_pte_from_mfn()'s last argument is necessary only when a type
+     * should be set. For p2m table we don't set a type, so it is okay
+     * to have NULL for this argument.
      */
-    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, true, NULL);
 }
 
 static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
@@ -435,22 +527,47 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Allocate a page table with an additional extra page to store
+ * metadata for each entry of the page table.
+ * Link this metadata page to page table page's list field.
+ */
+static struct page_info *p2m_alloc_table(struct p2m_domain *p2m)
+{
+    struct page_info *page_tbl = p2m_alloc_page(p2m);
+
+    if ( !page_tbl )
+        return NULL;
+
+    clear_and_clean_page(page_tbl, p2m->clean_dcache);
+
+    return page_tbl;
+}
+
+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    ASSERT(tbl_pg->v.md.metadata);
+
+    if ( tbl_pg->v.md.metadata )
+        p2m_free_page(p2m, tbl_pg->v.md.metadata);
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
-    clear_and_clean_page(page, p2m->clean_dcache);
-
     p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
 
     return 0;
@@ -599,12 +716,14 @@ static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
 
 /* Free pte sub-tree behind an entry */
 static void p2m_free_subtree(struct p2m_domain *p2m,
-                             pte_t entry, unsigned int level)
+                             pte_t entry,
+                             const struct p2m_pte_ctx *p2m_pte_ctx)
 {
     unsigned int i;
     pte_t *table;
     mfn_t mfn;
     struct page_info *pg;
+    unsigned int level = p2m_pte_ctx->level;
 
     /*
      * Check if the level is valid: only 4K - 2M - 1G mappings are supported.
@@ -620,7 +739,7 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
 
     if ( (level == 0) || pte_is_superpage(entry, level) )
     {
-        p2m_type_t p2mt = p2m_get_type(entry);
+        p2m_type_t p2mt = p2m_get_type(entry, p2m_pte_ctx);
 
 #ifdef CONFIG_IOREQ_SERVER
         /*
@@ -629,7 +748,7 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
          * has failed (error case).
          * So, at worst, the spurious mapcache invalidation might be sent.
          */
-        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
+        if ( p2m_is_ram(p2mt) &&
              domain_has_ioreq_server(p2m->domain) )
             ioreq_request_mapcache_invalidate(p2m->domain);
 #endif
@@ -639,9 +758,21 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
         return;
     }
 
-    table = map_domain_page(pte_get_mfn(entry));
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+    table = map_domain_page(mfn);
+    pg = mfn_to_page(mfn);
+
     for ( i = 0; i < P2M_PAGETABLE_ENTRIES(level); i++ )
-        p2m_free_subtree(p2m, table[i], level - 1);
+    {
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = pg,
+            .index = i,
+            .level = level -1
+        };
+
+        p2m_free_subtree(p2m, table[i], &tmp_ctx);
+    }
 
     unmap_domain_page(table);
 
@@ -653,17 +784,13 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
      */
     p2m_tlb_flush_sync(p2m);
 
-    mfn = pte_get_mfn(entry);
-    ASSERT(mfn_valid(mfn));
-
-    pg = mfn_to_page(mfn);
-
-    p2m_free_page(p2m, pg);
+    p2m_free_table(p2m, pg);
 }
 
 static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
                                 unsigned int level, unsigned int target,
-                                const unsigned int *offsets)
+                                const unsigned int *offsets,
+                                struct page_info *tbl_pg)
 {
     struct page_info *page;
     unsigned long i;
@@ -682,7 +809,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
     ASSERT(level > target);
     ASSERT(pte_is_superpage(*entry, level));
 
-    page = p2m_alloc_page(p2m);
+    page = p2m_alloc_table(p2m);
     if ( !page )
     {
         /*
@@ -707,6 +834,22 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+        {
+            struct p2m_pte_ctx p2m_pte_ctx = {
+                .pt_page = tbl_pg,
+                .index = offsets[level],
+            };
+
+            p2m_type_t old_type = p2m_get_type(pte, &p2m_pte_ctx);
+
+            p2m_pte_ctx.pt_page = page;
+            p2m_pte_ctx.index = i;
+            p2m_pte_ctx.level = level;
+
+            p2m_set_type(&pte, old_type, &p2m_pte_ctx, p2m);
+        }
+
         write_pte(new_entry, pte);
     }
 
@@ -718,7 +861,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     if ( next_level != target )
         rv = p2m_split_superpage(p2m, table + offsets[next_level],
-                                 level - 1, target, offsets);
+                                 level - 1, target, offsets, page);
 
     if ( p2m->clean_dcache )
         clean_dcache_va_range(table, PAGE_SIZE);
@@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *tbl_pg = virt_to_page(table);
 
         ASSERT(pte_is_superpage(*entry, level));
 
-        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
+                                  tbl_pg) )
         {
+            struct p2m_pte_ctx tmp_ctx = {
+                .pt_page = tbl_pg,
+                .index = offsets[level],
+                .level = level,
+            };
+
             /* Free the allocated sub-tree */
-            p2m_free_subtree(p2m, split_pte, level);
+            p2m_free_subtree(p2m, split_pte, &tmp_ctx);
 
             rc = -ENOMEM;
             goto out;
@@ -856,7 +1007,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = virt_to_page(table),
+            .index =  offsets[level],
+            .level = level,
+        };
+
+        pte_t pte = p2m_pte_from_mfn(mfn, t, &tmp_ctx, false, p2m);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
@@ -892,7 +1049,15 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     if ( pte_is_valid(orig_pte) &&
          (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
           (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
-        p2m_free_subtree(p2m, orig_pte, level);
+    {
+        struct p2m_pte_ctx tmp_ctx = {
+                .pt_page = virt_to_page(table),
+                .index = offsets[level],
+                .level = level,
+        };
+
+        p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
+    }
 
  out:
     unmap_domain_page(table);
@@ -979,7 +1144,6 @@ int map_regions_p2mt(struct domain *d,
     return rc;
 }
 
-
 /*
  * p2m_get_entry() should always return the correct order value, even if an
  * entry is not present (i.e. the GFN is outside the range):
@@ -1082,7 +1246,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( pte_is_valid(entry) )
     {
         if ( t )
-            *t = p2m_get_type(entry);
+        {
+            struct p2m_pte_ctx p2m_pte_ctx = {
+                .pt_page = virt_to_page(table),
+                .index = offsets[level],
+            };
+
+            *t = p2m_get_type(entry,&p2m_pte_ctx);
+        }
 
         mfn = pte_get_mfn(entry);
         /*
-- 
2.51.0


