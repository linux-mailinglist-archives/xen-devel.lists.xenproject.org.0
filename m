Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8CBF241D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146549.1479066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHF-0007tH-2Q; Mon, 20 Oct 2025 15:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146549.1479066; Mon, 20 Oct 2025 15:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHE-0007mg-FI; Mon, 20 Oct 2025 15:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1146549;
 Mon, 20 Oct 2025 15:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHC-0004nC-1C
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:26 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bd70ab4-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:24 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-63c12ff0c5eso9063757a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:24 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:23 -0700 (PDT)
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
X-Inumbo-ID: 9bd70ab4-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975904; x=1761580704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl6njmwO7phQtt0aJWG/R6XFA+PJ+of6uOBGuf6H+j4=;
        b=dDu9vmuO1ImA9uOS1svQPUlbguaEhPYVDcH7ea/YAwdf9GtW/SpFqcuiWIjR/4UCuZ
         4orQnNP5aSMv9a2F2sleG/rbyJT4xVKn/shdEt/8kvwhnnnXWjUwNLZjqMHqCuGLLU9I
         pBu2pNo+aEH58DJg1VseLdUP3nDN/f/UZ0PUx0FxLG0R7CwiApH26w6fJNHrCUW4twQT
         nvDC6di4PtGVNOxpgf+jmYNfCrRt3PjjZMJ8RylO4UzP3lBsMJrLqCNAcT21mqLwY1dr
         5JrqgTMYub2Tl6sRc6RrU7El2P4oqlhHSSTInFVPu2sNxsXD8dmDgG6w3SJvtOSC5UYr
         Az1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975904; x=1761580704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fl6njmwO7phQtt0aJWG/R6XFA+PJ+of6uOBGuf6H+j4=;
        b=bbfG8DSH7n3Lc0ZZ0KAfeOhk+DoN48ZRpQzwlbBj8c6WNPuFCELaenmCDFs5cqXLIs
         guTvrN9IQwkjnxuII2Wf+CluSjaaRN7kkVAYuSUVdnFUeTPhcnGKkVOtcjusu/edJwTc
         qlRqux8/6W954TkLGLXxykS907VCRaCSMo69nL4Tt/aMxohY6oc+++b1VGhQ6sw2Xhua
         6MZ/tC0isQFm30iTWYe0oFiMjKUg7lzo0LjbF/s0Bc4bGh8eZLXqvQL16oixVc7S/n0w
         pYeuTvqfBfsTKUShE4fSshu3+qTEA871d7NnjEmiQu6KxIoev+Pltatbar829E9VQraP
         3gMw==
X-Gm-Message-State: AOJu0YwUeDgdMKSDANk7ewAobms5G5aUUBoCaIcjAbPqZghT86BGOVCc
	fCR2i5RjnLU1+RY2hJJBWvI5CcHXW6wwIsVQxm0+hccUp4+6jifFXA++N4MA6Q==
X-Gm-Gg: ASbGncvAkTi7TVZZwV4ep8+wrdLr3TSLxjgnnBVvfVo193SIe++nM67YkdWeI+63m3A
	2VCHjh5XT5w4uZns11/XkvFE82wfA8VQacQwQotaKk0r079lsUw6PFrgzGEYVuBrvZoAgW0YLXW
	Qxh8TaBKQ5YLywvU+csjojVRGsgOmDj289JzD8Ui1sIb0p1yGsEdZ6ZFD3g5gLvoaUCQLU4MibC
	5tUJ3yyQ6PXXl/DdeyEeuT1TRZo3EFpePqmGxOGe3Ac6+AMYnONlv77SZswLjZv65Lm8N6qXJ04
	f7oogopJGPJgnau+yeJllcnv8oak+ILUttQntWWzyj+vd8IhKFkBSgYktxM9IOT6dphCN1vNSy5
	Jbg/9gceq4b6CJhoZDWbEIpYc7lVbN+PHIxrR/4HNmnlDZSFYkpScQ3Mwvim13uAAuDwb4h9Cwb
	rQ2DVZ2BDZz0waMzuJTd2XsW7NrMp3LSuKv7JRiEJkgKmnrzkqyQHKsFFOjA==
X-Google-Smtp-Source: AGHT+IFqYwk6IErozHNrOYoOlvnnYBZkkOkaDefBUAsTfJtncYT6UbDNoZgGPSEf65bw8j2mOAaAvQ==
X-Received: by 2002:a05:6402:3585:b0:62f:4828:c7d5 with SMTP id 4fb4d7f45d1cf-63c1e283083mr14050514a12.16.1760975903512;
        Mon, 20 Oct 2025 08:58:23 -0700 (PDT)
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
Subject: [for 4.22 v5 13/18] xen/riscv: implement p2m_next_level()
Date: Mon, 20 Oct 2025 17:57:56 +0200
Message-ID: <cfcec559252a365368d1ce19ea75ea41e8e8ee7b.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the p2m_next_level() function, which enables traversal and dynamic
allocation of intermediate levels (if necessary) in the RISC-V
p2m (physical-to-machine) page table hierarchy.

To support this, the following helpers are introduced:
- page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
  tables with correct attributes.
- p2m_alloc_page(): Allocates page table pages, supporting both hardware and
  guest domains.
- p2m_create_table(): Allocates and initializes a new page table page and
  installs it into the hierarchy.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Stray more blanks after * in declaration of functions.
 - Correct the comment above p2m_create_table() as metadata pages isn't
   allocated anymore in this function.
 - Move call of     clear_and_clean_page(page, p2m->clean_dcache); from
   p2m_create_table() to p2m_alloc_page().
 - Drop ACCESS_ONCE() in paging_alloc_page().
---
Changes in V4:
 - make `page` argument of page_to_p2m_table pointer-to-const.
 - Move p2m_next_level()'s local variable `ret` to the more narrow space where
   it is really used.
 - Drop stale ASSERT() in p2m_next_level().
 - Stray blank after * in declaration of paging_alloc_page().
 - Decrease p2m_freelist.total_pages when a page is taken from the p2m freelist.
---
Changes in V3:
 - s/p2me_is_mapping/p2m_is_mapping to be in syc with other p2m_is_*() functions.
 - clear_and_clean_page() in p2m_create_table() instead of clear_page() to be
   sure that page is cleared and d-cache is flushed for it.
 - Move ASSERT(level != 0) in p2m_next_level() ahead of trying to allocate a
   page table.
 - Update p2m_create_table() to allocate metadata page to store p2m type in it
   for each entry of page table.
 - Introduce paging_alloc_page() and use it inside p2m_alloc_page().
 - Add allocated page to p2m->pages list in p2m_alloc_page() to simplify
   a caller code a little bit.
 - Drop p2m_is_mapping() and use pte_is_mapping() instead as P2M PTE's valid
   bit doesn't have another purpose anymore.
 - Update an implementation and prototype of page_to_p2m_table(), it is enough
   to pass only a page as an argument.
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - s/p2m_is_mapping/p2m_is_mapping.
---
 xen/arch/riscv/include/asm/paging.h |  2 +
 xen/arch/riscv/p2m.c                | 77 ++++++++++++++++++++++++++++-
 xen/arch/riscv/paging.c             | 12 +++++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index fe462be223..c1d225d02b 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -15,4 +15,6 @@ int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
 
 void paging_free_page(struct domain *d, struct page_info *pg);
 
+struct page_info *paging_alloc_page(struct domain *d);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index f4658e2560..6018cac336 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -350,6 +350,19 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
+static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
+{
+    struct page_info *pg = paging_alloc_page(p2m->domain);
+
+    if ( pg )
+    {
+        page_list_add(pg, &p2m->pages);
+        clear_and_clean_page(pg, p2m->clean_dcache);
+    }
+
+    return pg;
+}
+
 static int p2m_set_type(pte_t *pte, p2m_type_t t)
 {
     int rc = 0;
@@ -490,6 +503,33 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
     return e;
 }
 
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(const struct page_info *page)
+{
+    /*
+     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
+     * set to true and p2m_type_t shouldn't be applied for PTEs which
+     * describe an intermidiate table.
+     */
+    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
+}
+
+/* Allocate a new page table page and hook it in via the given entry. */
+static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
+{
+    struct page_info *page;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    page = p2m_alloc_page(p2m);
+    if ( page == NULL )
+        return -ENOMEM;
+
+    p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
+
+    return 0;
+}
+
 #define P2M_TABLE_MAP_NONE 0
 #define P2M_TABLE_MAP_NOMEM 1
 #define P2M_TABLE_SUPER_PAGE 2
@@ -514,9 +554,42 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
                           unsigned int level, pte_t **table,
                           unsigned int offset)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    pte_t *entry;
+    mfn_t mfn;
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        int ret;
+
+        if ( !alloc_tbl )
+            return P2M_TABLE_MAP_NONE;
+
+        ret = p2m_create_table(p2m, entry);
+        if ( ret )
+            return P2M_TABLE_MAP_NOMEM;
+    }
+
+    if ( pte_is_mapping(*entry) )
+        return P2M_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    unmap_domain_page(*table);
+
+    /*
+     * TODO: There's an inefficiency here:
+     *       In p2m_create_table(), the page is mapped to clear it.
+     *       Then that mapping is torn down in p2m_create_table(),
+     *       only to be re-established here.
+     */
+    *table = map_domain_page(mfn);
 
-    return P2M_TABLE_MAP_NONE;
+    return P2M_TABLE_NORMAL;
 }
 
 static void p2m_put_foreign_page(struct page_info *pg)
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 773c737ab5..162557dec4 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -117,6 +117,18 @@ void paging_free_page(struct domain *d, struct page_info *pg)
     spin_unlock(&d->arch.paging.lock);
 }
 
+struct page_info *paging_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    spin_lock(&d->arch.paging.lock);
+    pg = page_list_remove_head(&d->arch.paging.freelist);
+    d->arch.paging.total_pages--;
+    spin_unlock(&d->arch.paging.lock);
+
+    return pg;
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
-- 
2.51.0


