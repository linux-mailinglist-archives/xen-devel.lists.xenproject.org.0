Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FDCC477D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188158.1509511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYLB-0001d5-Ee; Tue, 16 Dec 2025 16:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188158.1509511; Tue, 16 Dec 2025 16:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYLA-0001Ui-Rs; Tue, 16 Dec 2025 16:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1188158;
 Tue, 16 Dec 2025 16:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL8-0006gk-2R
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16ea90d5-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:56 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b79f98adea4so712633866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:56 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:55 -0800 (PST)
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
X-Inumbo-ID: 16ea90d5-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904156; x=1766508956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ3bNNr179l0Ub08HW3ugda+t4az01c0QSn+78Tp9Yg=;
        b=Z+4HREwd9V/p6sH7hA2Al6skiZqZB0M6iAGDN+qkWQMN7AZ00N/qikueOMP57vO9K9
         BHAgNQsGOjHG48FcpgDI3qwcEtwtJVnNIbU9GAN8teSxArSBhbM4dj31kMF0Zhdqh8E/
         5XvbMrsMezX+hxQ1w0I3/sEZfUhutTRUabKB+mwD5XrpvuufyJRepLGBKQHWtUVSFYHS
         wpEKWenksk7mRZ7flv3khLzPQ6CgaOkQyhAgHnYjhr/m4sq+Gti+Qg57WNYJdT7ypAya
         ZcOGUHQbG9rWSTADNIsyGyMUEOLuXcD4FogX7PD9yiqzIOoLeoJkK/8hdqyGDlOkqlxf
         cukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904156; x=1766508956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZ3bNNr179l0Ub08HW3ugda+t4az01c0QSn+78Tp9Yg=;
        b=Mg7ScvY4sHEbCgsRe/1dkKLC2K//Qcw0Ia9/ukM10zBjH20Njwg8TM8ynQKvTczgUq
         TWHMmyh+2Bp/IWI8Pt2TDF6pUE3zZy6Rc3QhYEHvMHGHqDr54wDs9x2l2hX1gCawc3tP
         iZd5ZLOqZTTJyYfhSC00fNZsFx7Hnb9RPMSu9evZsSjhWADf3clhtWljsGeC4bTU5Ca+
         vGPYUSI65483XvRJbbs0MgG5rXa2UH6Adi2qzt91ee1ukgbr4SrcNoYoQXqXs9JWvF31
         44wK1qntg6HdlCi26f8dD4//qbqDDIRnO1YqzZpR0ZQQHN51QsxVcbUc34cEeIjBY22H
         DKXw==
X-Gm-Message-State: AOJu0Yxpu3JIFpOg2t+5Zgj6LMzt0ZkBF5Xptx4OVBAzdURpYpw9A1gm
	E7ledqMXxv2eZDxE8g4Xd/jR8mE8mcVHbi3SOyZodC3kPsslVVgKDJZqSHsJww==
X-Gm-Gg: AY/fxX4ULyLRQvhRhCvSChlxEs3Ydl3wd9NbNdHu5CY2b1eBlPYwLMj4mAcxqHIrD0m
	4lHoTyQJf17UA8OtnSK62LJrm3/kk+ldIiFd8fKjJMU7qu3OCsvLNgqG49/n4bSZyZ9V4GP1cWG
	L006e8L+9/t/SRbOKwkWimTBYG3kKQWiT4/IuNoSEAL6QloJKi1DpfC2LyAanUhjdhUS7OMdgsT
	jLK4SnRNyg1OlfOh0tiOHAimdriUlBkJCGwlhUta/jAjIYHRYk6JKYdVcz156JNIkOZv8ijPBfS
	iI5M2lP5lgi1rOOilLOV2JgzlMbsse1GOCsycpzKeBU4f6p7Cjc9zBkXy9nBXJYJT+x2NOnc9VC
	esaKHWfwvW//6/pk9Gfh0ujDA29MgDn+cXVC3bjUjHAgpE0t06ZXAe+gumj2g3occoFNke8AAHs
	PwIROVuNvfnszuuHQshPK5p8y1P5d5PLw8b8g7crTNPaQHiRt2men0prizKppTEZezDQ==
X-Google-Smtp-Source: AGHT+IFRnqhrPRqmJcXk6Y8a+tXmuYNxyKo8WxQRVL3L2S7F6DS7PTeNOYTrbceZ7ZBZptXXf9lJnA==
X-Received: by 2002:a17:906:9f88:b0:b72:6a39:49d7 with SMTP id a640c23a62f3a-b7d23c1b192mr1673214966b.33.1765904155439;
        Tue, 16 Dec 2025 08:55:55 -0800 (PST)
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
Subject: [PATCH v7 13/19] xen/riscv: implement p2m_next_level()
Date: Tue, 16 Dec 2025 17:55:23 +0100
Message-ID: <1c05ace2c8371cb60c073b34dd9e838cbcd1c7be.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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
Changes in V6-7:
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
index 48e75b1867..9e1a660316 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -357,6 +357,19 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
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
@@ -497,6 +510,33 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
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
@@ -521,9 +561,42 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
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
2.52.0


