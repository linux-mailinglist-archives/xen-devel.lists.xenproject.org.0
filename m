Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21836C807C4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170580.1495739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm2-0004vB-11; Mon, 24 Nov 2025 12:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170580.1495739; Mon, 24 Nov 2025 12:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm1-0004lW-GU; Mon, 24 Nov 2025 12:34:29 +0000
Received: by outflank-mailman (input) for mailman id 1170580;
 Mon, 24 Nov 2025 12:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVly-0001zv-RZ
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e92f87ce-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:25 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b735487129fso616357966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:25 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.23
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
X-Inumbo-ID: e92f87ce-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987664; x=1764592464; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK0L2VvFB7fpyE10p4WRh14qUcf6WCTTRo9w9HXN/kw=;
        b=VqpwspNCcoyvVJ1j5Cq9NNTTX8772uEHgzoIEMkVXxkzZloxRqATcdDEjwivJtLonZ
         Cm3+VlU7ksB/iHpOY2isOPUS/sqmuuIpelU/jSVafPC12Af3/BMcOyHNiW9RmzVR/AfN
         OszBdmtM4hUD8Gk4MsXHDDqN0YbOuUXOuuOyV2MCy7S8ZMmry8xKeVZi5nrTnGVeXqb7
         u2M+oCuHCWHQZYrHwcbWmhTuhAE/m5IwMKwHWl26qlR2AzcMeYGfoDLOAT2Q+hcw/kRW
         tJcGPNE6CAVntBJfsSi+hspd4tPLwX1uB/atu3upQXhke8YwOSA+kUaFVtfqM49JOUZI
         O3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987664; x=1764592464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DK0L2VvFB7fpyE10p4WRh14qUcf6WCTTRo9w9HXN/kw=;
        b=aCAaA31YXbwf+eDyi8Bz6oRMZMA1GGo7hN5ZpH5RZW/sofq5+8Cz3W8ex3OIrrPKFT
         TOEBxUmuX6WrhHj7bFeIwqleodmmdYcMYMpOeJegHD+KpmRb8SS0OEsRvWTGS2zjXyMu
         S6lqGd4AVDs8NvJx9lsAWZl3hTQ4zfsAkPKfnDXZs+MsDlFxklQ+gAGzJ6gvjWlJRziZ
         5qFx5HBtoD58/3ekKT6N4YmkeoZ5A7mr9zE7vkbWJ6jJr3Qa7lCqhzCzeh14nz8SVyzc
         Czpe3OAp4wiTJ0nhMUfjjHzGOWFohcH1iUQ1oIntHvY+XWwJkMbHhe871bN3wWoyzqke
         FCfg==
X-Gm-Message-State: AOJu0YzYs6GEO3RutfkafAnxegqtaxTtn9vLZFy+eRzKbt/kw1m2oneL
	q6Qbn5JmcdeFRLV1lczQlR+r/mNqn2dK5jWsO+DUQEHELrBdrIofUHAriWUY7DzX
X-Gm-Gg: ASbGncteoMUrCWo2CsXXf1biyz8cOrLGlrAfu3Y9/qIQfCxUi9un6MS9R+fCaYxtJ/K
	ConKAEwHa/E9Q3YO/z7QJnoPqjtzBbu1snUFsMn4dqjjXZeh1VbQSu2aJFD+F8LRALi+72RdRag
	pg49S5xHeO3bN4XvdFIlBGrvt5exJ8jCEwm3s+lCUGKX0ujXRI9BDCn3LN0Cr1Vrcg3jEyDTU1t
	1FUoq0Ba5DnTi6XEy4jawJSETFoKdby+T1NkR3mwucncn7vRP0ocP4Y+P8eqNRdu2c8iWyd0hBh
	bXmSQGRkN8fRRb9rwZvgfG/hGqvFaejcQAFZ71H0JKFLGKwXddaVq2r555/QAI9IRB/3RBff97V
	cvBGPWkdUnJUooiRDiS6soFjKNaBMB23j0EZN5HL3+4oHPZpklIToz2+qISEFvm+n+7e291joGh
	/ziid6tVNp9ulOOGteaZDB8WGOtle5Ej1AMMRHxWfYLb7ezDbkBhSnpfc=
X-Google-Smtp-Source: AGHT+IGJE4fJdRi5HSwkax5ti2I3vX0v58VR+lz4oIx91Ys5ax4+qtK51+Vf5+NvsCcvNsUEwjfgAg==
X-Received: by 2002:a17:907:9711:b0:b46:6718:3f20 with SMTP id a640c23a62f3a-b76718cfde7mr1154893366b.48.1763987664316;
        Mon, 24 Nov 2025 04:34:24 -0800 (PST)
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
Subject: [PATCH v6 14/19] xen/riscv: implement p2m_next_level()
Date: Mon, 24 Nov 2025 13:33:47 +0100
Message-ID: <b282a072fb15cdab5ed46ebcdb6f3b12c970a7af.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - s/intermidiate/intermediate.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 8761204720..16663650ee 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -361,6 +361,19 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
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
@@ -501,6 +514,33 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
     return e;
 }
 
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(const struct page_info *page)
+{
+    /*
+     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
+     * set to true and p2m_type_t shouldn't be applied for PTEs which
+     * describe an intermediate table.
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
@@ -525,9 +565,42 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
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
index 09631c9894..76a203edbb 100644
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
2.51.1


