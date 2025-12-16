Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB2CC47BC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188223.1509531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYMZ-0005wP-OU; Tue, 16 Dec 2025 16:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188223.1509531; Tue, 16 Dec 2025 16:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYMZ-0005tO-LT; Tue, 16 Dec 2025 16:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1188223;
 Tue, 16 Dec 2025 16:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYLE-0006gk-B9
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:56:04 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a39022a-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:56:01 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64312565c10so8560758a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:56:01 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:56:00 -0800 (PST)
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
X-Inumbo-ID: 1a39022a-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904161; x=1766508961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAW4FogsFnbSN45BNezCSR9opoNTBUZqtrixmIdk0bI=;
        b=Rn2wZCrwXFKgex7WGwFYkoOhj1x06wvmiYvLuefQ+YHyxvGsr7qYyLM8Y5LubVcLrj
         FYVdt/XFOnNxSsZ8DLGpxqb4gtFgJD/WR2HNgO3/PgtIng9tS6kdNAgFpGpCl5GVgFpR
         AqsmXODFVOKCgPiHIhLarj0ykmslOVgyZXvDveQZCkijnR+5i8tJyIU0sCr0r3JWhzdT
         AKV948KBFcy+NSkalOUSwLEgcWFkV/Rjk1Iz/FuL0yfRIvlht9Vh51HSblk0vfKoeOgk
         E8Acdw2ICcu7GeMK877DhMb2vITVPTmrsOqhA6ziYZ6Y48db/IWreInV3NNIIECM+kkC
         g/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904161; x=1766508961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAW4FogsFnbSN45BNezCSR9opoNTBUZqtrixmIdk0bI=;
        b=fRL/yf5AcswH+ZnbniTmWaAH1hIrLfOmxiTDus785zyXnFeXeSVC2c880mcHSeWjwc
         rcSVR5ewkONvpLNCdsMC1o1Cu6AQfZprray9F8lLlXXCkHVjg8mdvIoZ/FNSvrgtJG7p
         HRJsl58w+F2pe6/cmiUFY/hQDKiZseV8Er+isrb9dG9nvWTk77GtE5jQe+yGigJVZsW6
         1G7vIVgEnFCfgK5qZUOLPz6IVm8sqc+oRZ/Ymk3IDLamiQh98UKnnfoYBQiSlhFjEY2e
         YnjC1eZ4xH/MBF4IY+NJJ3g/j0qvMTcTuF1XXaceEBMN5j8gjKf0Nc+AUfv9VSJxt+5B
         lv3Q==
X-Gm-Message-State: AOJu0YxOQuSqUXCdzy07pe4EeKcNI+xYxOlwJobgj0Vnc0ejvhhGuULv
	h2jQbS46NVu5PlOW6/ZngyI2o3YJ2AGrfKeEvYVx9yfiRzlaz21CU5L2xHa+Og==
X-Gm-Gg: AY/fxX77e8nLPDCPX0O3keXINfQ/3unaH/LsWCd9LojSePzQX4RqQYPg4ZDen45WFFz
	bHuF2ntfm5clDJgqkoNTjqm2ctMVV7rFSJ4+nc7xesVNkh1PEBoRjhc0ETQbaUd+3WQ09Lxyt5B
	P44qS/7DVQleW7faqEmMpgR+DzHZRU+mEaQKxrfIkYZPyfeRdd4Dw361IKH2Nu2rxqrBbwpcaqw
	zw1xjG/SPXwj6o3zPAOlMaI0DQNNEkCmV4eEEbYCgBqCsIB2lmeiw+1uZfS2QyU0BfigQ9WezPU
	t9UwgBtX8RxZLuy5uA+wbaQcKIijc1xufQVLQZ9pMcG5fgZ8bEiyx/xTlDsAEauwclbd08U4ntv
	RbAAQrxQv9pHnLSFK5Kftch5ZWGxdYnCNxv6VcRKkKGtg3IkFgkf07P4t8TNK1R8otNXQgyP6z8
	pQtoG2gI3J/iWUj2O7X/xBIH1EER2VdpbtsvjQwOW/DrZr6DsUEPE6Mu4=
X-Google-Smtp-Source: AGHT+IHE21D8prEkbOcy2Z0u6Ll5QfxFFCqDZn0hzJ2CzKwHpda8L+ZdbrOlqMnctqwlh+iRg2Hzng==
X-Received: by 2002:a17:906:7954:b0:b72:598:2f32 with SMTP id a640c23a62f3a-b7d238e7d77mr1436411566b.42.1765904160764;
        Tue, 16 Dec 2025 08:56:00 -0800 (PST)
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
Subject: [PATCH v7 18/19] xen/riscv: introduce metadata table to store P2M type
Date: Tue, 16 Dec 2025 17:55:28 +0100
Message-ID: <b1e4ed0bb4e2f47a7cdb6afe4b9b05462e00fc84.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
- Put p2m_domain * inside struct p2m_pte_ctx and update an APIs of
  p2m_set_type(), p2m_pte_from_mfn().
  Also, move ASSERT(p2m) closer to p2m_alloc_page(ctx->p2m) inside
  p2m_set_type().
  Update all callers of p2m_set_type() and p2m_pte_from_mfn().
- Update the comment above BUILD_BUG_ON(p2m_invalid): drop unnessary
  sentenses and make it shorter then 80 chars.
- Drop the comment and BUILD_BUG_ON() in p2m_get_type() as it is
  enough to have it in p2m_set_type().
- Update the comment above p2m_set_type() about p2m argument which
  was droppped.
- Make ctx argument of p2m_set_type() const to be able to re-use
  p2m_pte_ctx across multiple iterations without fully reinitializing.
- Declare "struct p2m_pte_ctx tmp_ctx;" as function scope variable and
  rework p2m_set_entry() correspondingly.
---
Changes in V6:
 - Introduce new type md_t to use it instead of pte_t to store metadata
   types outside PTE bits.
 - Integrate introduced struct md_t.
 - Drop local variable "struct domain *d" inside p2m_set_type().
 - Drop __func__ printting and use %pv.
 - Code style fixes
 - Drop unnessarry check inside if-condition in p2m_pte_from_mfn()
   as we have ASSERT(p2m) inside p2m_set_type() anyway.
 - Return back the commnent inside page_to_p2m_table() as it was deleted
   accidently.
 - move the initialization of
p2m_pte_ctx.pt_page and p2m_pte_ctx.level ahead of the loop
 - Add BUILD_BUG_ON(p2m_invalid) before the call of p2m_alloc_page() in p2m_set_type() and in p2m_get_type() before " if ( type == p2m_ext_storage )".
 - Set to NULL tbl_pg->v.md.pg in p2m_free_table().
 - Make argument 't' of p2m_set_type() non-const as we are going to change it.
 - Add some explanatory comments.
 - Update ASSERT at the start of p2m_set_type() to verify that
   passed ctx->index is lesser then 512 and drop calculation of
   an index of root page as it is guaranteed by calc_offset()
   and get_root_pointer() that we will aready get proper page and
   proper index inside this page.
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
 xen/arch/riscv/p2m.c            | 246 ++++++++++++++++++++++++++++----
 2 files changed, 225 insertions(+), 30 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 1a99e1cf0a..48162f5d65 100644
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
index b2d275f7be..bbc3d53d01 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -26,6 +26,25 @@
  */
 #define P2M_MAX_SUPPORTED_LEVEL_MAPPING _AC(2, U)
 
+struct md_t {
+    /*
+     * Describes a type stored outside PTE bits.
+     * Look at the comment above definition of enum p2m_type_t.
+     */
+    p2m_type_t type : 4;
+};
+
+/*
+ * P2M PTE context is used only when a PTE's P2M type is p2m_ext_storage.
+ * In this case, the P2M type is stored separately in the metadata page.
+ */
+struct p2m_pte_ctx {
+    struct p2m_domain *p2m;
+    struct page_info *pt_page;   /* Page table page containing the PTE. */
+    unsigned int index;          /* Index of the PTE within that page. */
+    unsigned int level;          /* Paging level at which the PTE resides. */
+};
+
 static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .mode = HGATP_MODE_OFF,
     .paging_levels = 0,
@@ -37,6 +56,10 @@ unsigned char get_max_supported_mode(void)
     return max_gstage_mode.mode;
 }
 
+/*
+ * If anything is changed here, it may also require updates to
+ * p2m_{get,set}_type().
+ */
 static inline unsigned int calc_offset(const struct p2m_domain *p2m,
                                        const unsigned int lvl,
                                        const paddr_t gpa)
@@ -79,6 +102,9 @@ static inline unsigned int calc_offset(const struct p2m_domain *p2m,
  * The caller is responsible for unmapping the page after use.
  *
  * Returns NULL if the calculated offset into the root table is invalid.
+ *
+ * If anything is changed here, it may also require updates to
+ * p2m_{get,set}_type().
  */
 static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
 {
@@ -370,24 +396,101 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
     return pg;
 }
 
-static int p2m_set_type(pte_t *pte, p2m_type_t t)
+/*
+ * `pte` – PTE entry for which the type `t` will be stored.
+ *
+ * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided.
+ */
+static void p2m_set_type(pte_t *pte, p2m_type_t t,
+                         const struct p2m_pte_ctx *ctx)
 {
-    int rc = 0;
+    struct page_info **md_pg;
+    struct md_t *metadata = NULL;
 
-    if ( t > p2m_first_external )
-        panic("unimplemeted\n");
-    else
-        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
+    /*
+     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
+     * even for the p2m root page table (which is a 16 KB page allocated as
+     * four 4 KB pages), calc_offset() guarantees that the page-table index
+     * will always fall within the range [0, 511].
+     */
+    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
 
-    return rc;
+    /*
+     * At the moment, p2m_get_root_pointer() returns one of four possible p2m
+     * root pages, so there is no need to search for the correct ->pt_page
+     * here.
+     * Non-root page tables are 4 KB pages, so simply using ->pt_page is
+     * sufficient.
+     */
+    md_pg = &ctx->pt_page->v.md.pg;
+
+    if ( !*md_pg && (t >= p2m_first_external) )
+    {
+        BUG_ON(ctx->level > P2M_MAX_SUPPORTED_LEVEL_MAPPING);
+
+        if ( ctx->level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING )
+        {
+            /*
+             * Since p2m_alloc_page() initializes an allocated page with
+             * zeros, p2m_invalid is expected to have the value 0 as well.
+             */
+            BUILD_BUG_ON(p2m_invalid);
+
+            ASSERT(ctx->p2m);
+
+            *md_pg = p2m_alloc_page(ctx->p2m);
+            if ( !*md_pg )
+            {
+                printk("%pd: can't allocate metadata page\n",
+                       ctx->p2m->domain);
+                domain_crash(ctx->p2m->domain);
+
+                return;
+            }
+        }
+    }
+
+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t >= p2m_first_external )
+    {
+        metadata[ctx->index].type = t;
+
+        t = p2m_ext_storage;
+    }
+    else if ( metadata )
+        metadata[ctx->index].type = p2m_invalid;
+
+    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
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
+        const struct md_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
+
+        type = md[ctx->index].type;
+
+        /*
+         * Since p2m_set_type() guarantees that the type will be greater than
+         * p2m_first_external, just check that we received a valid type here.
+         */
+        ASSERT(type > p2m_first_external);
+
+        unmap_domain_page(md);
+    }
 
     return type;
 }
@@ -477,7 +580,14 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     }
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+/*
+ * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL,
+ * it means the function is working with a page table for which the `t`
+ * should not be applicable. Otherwise, the function is handling a leaf PTE
+ * for which `t` is applicable.
+ */
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
+                              struct p2m_pte_ctx *p2m_pte_ctx)
 {
     pte_t e = (pte_t) { PTE_VALID };
 
@@ -485,7 +595,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
 
     ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
 
-    if ( !is_table )
+    if ( p2m_pte_ctx )
     {
         switch ( t )
         {
@@ -498,7 +608,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
         }
 
         p2m_set_permission(&e, t);
-        p2m_set_type(&e, t);
+        p2m_set_type(&e, t, p2m_pte_ctx);
     }
     else
         /*
@@ -518,7 +628,22 @@ static pte_t page_to_p2m_table(const struct page_info *page)
      * set to true and p2m_type_t shouldn't be applied for PTEs which
      * describe an intermediate table.
      */
-    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL);
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
+    {
+        p2m_free_page(p2m, tbl_pg->v.md.pg);
+        tbl_pg->v.md.pg = NULL;
+    }
+    p2m_free_page(p2m, tbl_pg);
 }
 
 /* Allocate a new page table page and hook it in via the given entry. */
@@ -679,12 +804,14 @@ static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
 
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
@@ -700,7 +827,7 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
 
     if ( pte_is_mapping(entry) )
     {
-        p2m_type_t p2mt = p2m_get_type(entry);
+        p2m_type_t p2mt = p2m_get_type(entry, p2m_pte_ctx);
 
 #ifdef CONFIG_IOREQ_SERVER
         /*
@@ -719,10 +846,22 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
         return;
     }
 
-    table = map_domain_page(pte_get_mfn(entry));
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+    table = map_domain_page(mfn);
+    pg = mfn_to_page(mfn);
 
     for ( i = 0; i < P2M_PAGETABLE_ENTRIES(p2m, level); i++ )
-        p2m_free_subtree(p2m, table[i], level - 1);
+    {
+        struct p2m_pte_ctx tmp_ctx = {
+            .pt_page = pg,
+            .index = i,
+            .level = level - 1,
+            .p2m = p2m,
+        };
+
+        p2m_free_subtree(p2m, table[i], &tmp_ctx);
+    }
 
     unmap_domain_page(table);
 
@@ -734,17 +873,13 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
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
@@ -756,6 +891,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
     unsigned int next_level = level - 1;
     unsigned int level_order = P2M_LEVEL_ORDER(next_level);
 
+    struct p2m_pte_ctx p2m_pte_ctx;
+    /* Init with p2m_invalid just to make compiler happy. */
+    p2m_type_t old_type = p2m_invalid;
+
     /*
      * This should only be called with target != level and the entry is
      * a superpage.
@@ -777,6 +916,24 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
 
     table = __map_domain_page(page);
 
+    p2m_pte_ctx.p2m = p2m;
+
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
+    p2m_pte_ctx.pt_page = page;
+    p2m_pte_ctx.level = next_level;
+
     for ( i = 0; i < P2M_PAGETABLE_ENTRIES(p2m, next_level); i++ )
     {
         pte_t *new_entry = table + i;
@@ -788,6 +945,13 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
         pte = *entry;
         pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
 
+        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
+        {
+            p2m_pte_ctx.index = i;
+
+            p2m_set_type(&pte, old_type, &p2m_pte_ctx);
+        }
+
         write_pte(new_entry, pte);
     }
 
@@ -799,7 +963,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
      */
     if ( next_level != target )
         rv = p2m_split_superpage(p2m, table + offsets[next_level],
-                                 next_level, target, offsets);
+                                 next_level, target, offsets, page);
 
     if ( p2m->clean_dcache )
         clean_dcache_va_range(table, PAGE_SIZE);
@@ -840,6 +1004,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      * are still allowed.
      */
     bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
+    struct p2m_pte_ctx tmp_ctx;
     P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
 
     ASSERT(p2m_is_write_locked(p2m));
@@ -882,6 +1047,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
 
     entry = table + offsets[level];
 
+    tmp_ctx.p2m = p2m;
+
     /*
      * If we are here with level > target, we must be at a leaf node,
      * and we need to break up the superpage.
@@ -890,13 +1057,19 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         pte_t split_pte = *entry;
+        struct page_info *tbl_pg = mfn_to_page(domain_page_map_to_mfn(table));
 
         ASSERT(pte_is_superpage(*entry, level));
 
-        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
+                                  tbl_pg) )
         {
+            tmp_ctx.pt_page = tbl_pg;
+            tmp_ctx.index = offsets[level];
+            tmp_ctx.level = level;
+
             /* Free the allocated sub-tree */
-            p2m_free_subtree(p2m, split_pte, level);
+            p2m_free_subtree(p2m, split_pte, &tmp_ctx);
 
             rc = -ENOMEM;
             goto out;
@@ -922,6 +1095,10 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         entry = table + offsets[level];
     }
 
+    tmp_ctx.pt_page = mfn_to_page(domain_page_map_to_mfn(table));
+    tmp_ctx.index = offsets[level];
+    tmp_ctx.level = level;
+
     /*
      * We should always be there with the correct level because all the
      * intermediate tables have been installed if necessary.
@@ -934,7 +1111,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, &tmp_ctx);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
@@ -970,7 +1147,9 @@ static int p2m_set_entry(struct p2m_domain *p2m,
     if ( pte_is_valid(orig_pte) &&
          (!pte_is_valid(*entry) ||
           !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
-        p2m_free_subtree(p2m, orig_pte, level);
+    {
+        p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
+    }
 
  out:
     unmap_domain_page(table);
@@ -1170,7 +1349,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 
     if ( pte_is_valid(entry) )
     {
-        *t = p2m_get_type(entry);
+        struct p2m_pte_ctx p2m_pte_ctx = {
+            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
+            .index = offsets[level],
+            .level = level,
+            .p2m = p2m,
+        };
+
+        *t = p2m_get_type(entry, &p2m_pte_ctx);
 
         mfn = pte_get_mfn(entry);
 
-- 
2.52.0


