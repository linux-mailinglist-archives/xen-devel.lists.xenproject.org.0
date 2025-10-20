Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D110CBF2529
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146752.1479141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsSt-0001Rf-VK; Mon, 20 Oct 2025 16:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146752.1479141; Mon, 20 Oct 2025 16:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsSt-0001PV-Rd; Mon, 20 Oct 2025 16:10:31 +0000
Received: by outflank-mailman (input) for mailman id 1146752;
 Mon, 20 Oct 2025 16:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHJ-0004DQ-5f
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:33 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecbc962-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:29 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61feb87fe26so7452500a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:29 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:28 -0700 (PDT)
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
X-Inumbo-ID: 9ecbc962-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975909; x=1761580709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDa93JYdlrJBVGYbKahVuI6TF95B0R8FzGilI4cTMac=;
        b=G7d8WHd5kiChlSga6XsZ7R2BgNOZ+HqTV5+8F8UC5KRJl0iFAFfpB3mmjRLEy97Vo2
         JpCOQZToy8+rT4mGANdj5nO0QOCSdKfra5u5FRy1z1oCkFEQs/EAtJB9XL7GAczeTgbL
         Z1c6REQDyeyhdBNDnV4pin5BCqnbp19RWTIIoiEWkE93Zf/L7rfT6qHM3rLmGPnCAUYq
         Akg9wGm/y3ATAMvGM9YN6j1hkcdlywme3JrBzi1n7eEKreanPDYTPp9jW4bnX2immqZf
         QptQQd0qtvcPU1jhjoPoIwM6NGFdvUMAe+uhe8Uperf4yTJY8ythMquyRA8HbQTShNng
         skcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975909; x=1761580709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDa93JYdlrJBVGYbKahVuI6TF95B0R8FzGilI4cTMac=;
        b=VBB1wzrELt0+R3MPNklCmeXzTdYJUyDnJVtEr+Fv+/hFPkEbD5OcZZ8ttFScD/qT/h
         eHkS9T0mpH/hdMTWYHE6D9m229D/JJf3bqI+b9BK+HolE7LEIItOO5cvwVP+ngusa29u
         9W4/FrgmRqyiubHoTXU+46W5QiflLsXvanpqUpQI9vLnL+rosmiUDc8nT6fliQlBoxbD
         tO9Rit/EXlsI3yRBxbh8B6j3zXw3EZOZF/gMs4oCRazzdRfzPhUtkdwlCV7t02MSy55e
         MaHBJi83IB5qVfaIutP04ha509TTMFbNOXPygpnZoCQKJk1mvZwQaH5uwO/b2kGJKSes
         EPVg==
X-Gm-Message-State: AOJu0Yxb1zK6zYGn/3mI6Z6z+ECjGyhfqus8p61NCqIEGrVXsRFCO+a5
	fQqrJpXLA+K+bi7DdqCXMTxCwE4DhEc0GhWSePGYxT2VSf9lli6kW4kA8QLDuw==
X-Gm-Gg: ASbGncvADm4zAzGQFa7kpBq5QKtaXZtuDlICGHqEEEp1gAa1o0rA5GfAsK5UvJQ1MBD
	oIMAVSjX4a9EyOx6+Ca4BdAeotdyz/3RqwviF+jLCAa+Twip7SOAmvKzM6bZAEqWl86s9BLMnXP
	aO33K23cHmpqgJKZye1H7Wzq9vcQFp1i4bL0ajFBUCaIK6lwoHSq1ZCnThC6Zkyz+bNZzJP7tnR
	mlNuRDFSjjNeFpT0GMgMm88mwD369bo7mnmVG5q5xCBMqCnqoJs+RUItZSOX/OnDADNmfootQBu
	98ulyc6jPauNM48dFr47yVTwjV0UXUzaTbaFRnuihHOwf7kHWLR+4+rW29lWjvTdvdiu6mjWkBj
	HuHJ8YbFlQhUAZijARGFOneZDzjQe8ZHqiy3lLZ5imnR5oR5U10K/0BB73tAhIliR6d5lJXZ+U5
	SOVCyJtrtiUMXA3K2Qs60SBGsnbI/4Pb6f4KpxJ62/h7yUCD3hd554KL5Y6zPaUNl3EIov
X-Google-Smtp-Source: AGHT+IFr1+sijGlicdQIZ3Jl96itdkZYVPSX02NsTR/7zDEozik/UzSOH8RlkPgourkWJtcalOkeow==
X-Received: by 2002:a05:6402:50ca:b0:63c:4da1:9a0a with SMTP id 4fb4d7f45d1cf-63c4da19c6fmr8788792a12.30.1760975908429;
        Mon, 20 Oct 2025 08:58:28 -0700 (PDT)
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
Subject: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store P2M type
Date: Mon, 20 Oct 2025 17:58:01 +0200
Message-ID: <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Rename metadata member of stuct md inside struct page_info to pg.
 - Stray blank in the declaration of p2m_alloc_table().
 - Use "<" instead of "<=" in ASSERT() in p2m_set_type().
 - Move the check that ctx is provided to an earlier point in
   p2m_set_type().
 - Set `md_pg` after ASSERT() in p2m_set_type().
 - Add BUG_ON() insetead of ASSERT_UNREACHABLE() in p2m_set_type().
 - Drop a check that metadata isn't NULL before unmap_domain_page() is
   being called.
 - Make const `md` variable in p2m_get_type().
 - unmap correct domain's page in p2m_get_type: use `md` instead of
   ctx->pt_page->v.md.pg.
 - Add description of how p2m and p2m_pte_ctx is expected to be used
   in p2m_pte_from_mfn() and drop a comment from page_to_p2m_table().
 - Drop the stale part of the comment above p2m_alloc_table().
 - Drop ASSERT(tbl_pg->v.md.pg) from p2m_free_table() as tbl_pg->v.md.pg
   is created conditionally now.
 - Drop an introduction of p2m_alloc_table(), update p2m_alloc_page()
   correspondengly and use it instead.
 - Add missing blank in definition of level member for tmp_ctx variable
   in p2m_free_subtree(). Also, add the comma at the end.
 - Initialize old_type once before for-loop in p2m_split_superpage() as
   old type will be used for all newly created PTEs.
 - Properly initialize p2m_pte_ctx.level with next_level instead of
   level when p2m_set_type() is going to be called for new PTEs.
 - Fix identations.
 - Move ASSERT(p2m) on top of p2m_set_type() to be sure that NULL isn't
   passed for p2m argument of p2m_set_type().
 - s/virt_to_page(table)/mfn_to_page(domain_page_map_to_mfn(table))
   to recieve correct page for a table which is mapped by domain_page_map().
 - Add "return;" after domain_crash() in p2m_set_type() to avoid potential
   NULL pointer dereference of md_pg.
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
 xen/arch/riscv/p2m.c            | 223 +++++++++++++++++++++++++++-----
 2 files changed, 198 insertions(+), 34 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 1b16809749..b18892e4fc 100644
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
+            struct page_info *pg;
+        } md;
     } v;
 
     union {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 785d11aaff..c8112faacb 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -20,6 +20,16 @@
 
 #define P2M_SUPPORTED_LEVEL_MAPPING 2
 
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
 unsigned char __ro_after_init gstage_mode;
 unsigned int __ro_after_init gstage_root_level;
 
@@ -363,24 +373,89 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
+ * otherwise, only p2m may be NULL.
+ */
+static void p2m_set_type(pte_t *pte, const p2m_type_t t,
+                         struct p2m_pte_ctx *ctx,
+                         struct p2m_domain *p2m)
 {
-    int rc = 0;
+    struct page_info **md_pg;
+    pte_t *metadata = NULL;
 
-    if ( t > p2m_first_external )
-        panic("unimplemeted\n");
-    else
+    ASSERT(p2m);
+
+     /* Be sure that an index correspondent to page level is passed. */
+    ASSERT(ctx && ctx->index < P2M_PAGETABLE_ENTRIES(ctx->level));
+
+    /*
+     * For the root page table (16 KB in size), we need to select the correct
+     * metadata table, since allocations are 4 KB each. In total, there are
+     * 4 tables of 4 KB each.
+     * For none-root page table index of ->pt_page[] will be always 0 as
+     * index won't be higher then 511. ASSERT() above verifies that.
+     */
+    md_pg = &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.pg;
+
+    if ( !*md_pg && (t >= p2m_first_external) )
+    {
+        BUG_ON(ctx->level > P2M_SUPPORTED_LEVEL_MAPPING);
+
+        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
+        {
+            struct domain *d = p2m->domain;
+
+            *md_pg = p2m_alloc_page(p2m);
+            if ( !*md_pg )
+            {
+                printk("%s: can't allocate extra memory for dom%d\n",
+                       __func__, d->domain_id);
+                domain_crash(d);
+
+                return;
+            }
+        }
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
+    unmap_domain_page(metadata);
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
+        const pte_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
+        type = md[ctx->index].pte;
+        unmap_domain_page(md);
+    }
 
     return type;
 }
@@ -470,7 +545,15 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+/*
+ * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL and p2m = NULL,
+ * it means the function is working with a page table for which the `t`
+ * should not be applicable. Otherwise, the function is handling a leaf PTE
+ * for which `t` is applicable.
+ */
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
+                              struct p2m_pte_ctx *p2m_pte_ctx,
+                              struct p2m_domain *p2m)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -478,7 +561,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 
     ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
 
-    if ( !is_table )
+    if ( p2m_pte_ctx && p2m )
     {
         switch ( t )
         {
@@ -491,7 +574,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
         }
 
         p2m_set_permission(&e, t);
-        p2m_set_type(&e, t);
+        p2m_set_type(&e, t, p2m_pte_ctx, p2m);
     }
     else
         /*
@@ -506,12 +589,19 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 /* Generate table entry with correct attributes. */
 static pte_t page_to_p2m_table(const struct page_info *page)
 {
-    /*
-     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
-     * set to true and p2m_type_t shouldn't be applied for PTEs which
-     * describe an intermidiate table.
-     */
-    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, NULL);
+}
+
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    if ( tbl_pg->v.md.pg )
+        p2m_free_page(p2m, tbl_pg->v.md.pg);
+    p2m_free_page(p2m, tbl_pg);
 }
 
 /* Allocate a new page table page and hook it in via the given entry. */
@@ -673,12 +763,14 @@ static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
 
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
@@ -694,7 +786,7 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
 
     if ( (level == 0) || pte_is_superpage(entry, level) )
     {
-        p2m_type_t p2mt = p2m_get_type(entry);
+        p2m_type_t p2mt = p2m_get_type(entry, p2m_pte_ctx);
 
 #ifdef CONFIG_IOREQ_SERVER
         /*
@@ -713,9 +805,21 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
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
+            .level = level - 1,
+        };
+
+        p2m_free_subtree(p2m, table[i], &tmp_ctx);
+    }
 
     unmap_domain_page(table);
 
@@ -727,17 +831,13 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
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
@@ -749,6 +849,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
     unsigned int next_level = level - 1;
     unsigned int level_order = P2M_LEVEL_ORDER(next_level);
 
+    struct p2m_pte_ctx p2m_pte_ctx;
+    /* Init with p2m_invalid just to make compiler happy. */
+    p2m_type_t old_type = p2m_invalid;
+
     /*
      * This should only be called with target != level and the entry is
      * a superpage.
@@ -770,6 +874,19 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
 
     table = __map_domain_page(page);
 
+    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+    {
+        p2m_pte_ctx.pt_page = tbl_pg;
+        p2m_pte_ctx.index = offsets[level];
+        /*
+         * It doesn't really matter what is a value for a level as
+         * p2m_get_type() doesn't need it, so it is initialized just in case.
+         */
+        p2m_pte_ctx.level = level;
+
+        old_type = p2m_get_type(*entry, &p2m_pte_ctx);
+    }
+
     for ( i = 0; i < P2M_PAGETABLE_ENTRIES(next_level); i++ )
     {
         pte_t *new_entry = table + i;
@@ -781,6 +898,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+        {
+            p2m_pte_ctx.pt_page = page;
+            p2m_pte_ctx.index = i;
+            p2m_pte_ctx.level = next_level;
+
+            p2m_set_type(&pte, old_type, &p2m_pte_ctx, p2m);
+        }
+
         write_pte(new_entry, pte);
     }
 
@@ -792,7 +918,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     if ( next_level != target )
         rv = p2m_split_superpage(p2m, table + offsets[next_level],
-                                 next_level, target, offsets);
+                                 next_level, target, offsets, page);
 
     if ( p2m->clean_dcache )
         clean_dcache_va_range(table, PAGE_SIZE);
@@ -883,13 +1009,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *tbl_pg = mfn_to_page(domain_page_map_to_mfn(table));
 
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
@@ -927,7 +1061,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+            .index =  offsets[level],
+            .level = level,
+        };
+
+        pte_t pte = p2m_pte_from_mfn(mfn, t, &tmp_ctx, p2m);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
@@ -963,7 +1103,15 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     if ( pte_is_valid(orig_pte) &&
          (!pte_is_valid(*entry) ||
          !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
-        p2m_free_subtree(p2m, orig_pte, level);
+    {
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+            .index = offsets[level],
+            .level = level,
+        };
+
+        p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
+    }
 
  out:
     unmap_domain_page(table);
@@ -1153,7 +1301,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     if ( pte_is_valid(entry) )
     {
         if ( t )
-            *t = p2m_get_type(entry);
+        {
+            struct p2m_pte_ctx p2m_pte_ctx = {
+                .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+                .index = offsets[level],
+            };
+
+            *t = p2m_get_type(entry, &p2m_pte_ctx);
+        }
 
         mfn = pte_get_mfn(entry);
 
-- 
2.51.0


