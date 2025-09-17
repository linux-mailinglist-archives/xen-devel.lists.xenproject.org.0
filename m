Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE2BB820C9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125599.1467602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08N-0002qo-6Z; Wed, 17 Sep 2025 21:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125599.1467602; Wed, 17 Sep 2025 21:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08M-0002fH-S5; Wed, 17 Sep 2025 21:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1125599;
 Wed, 17 Sep 2025 21:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08K-0007Lt-2y
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:12 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1de127b2-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:09 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b54dd647edcso246149a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:09 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:07 -0700 (PDT)
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
X-Inumbo-ID: 1de127b2-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146167; x=1758750967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSDbiXfntjTDpIx6oGO3PjzMx5fUjcTMiZWj5cdZF5A=;
        b=FUkZZX5fuUAG/McSZBW4MZl4cdvynAev76940SY73JBQIFSe9NfmXBUBkUxm3LKapp
         Nw/BjgnUdzh0ZS8YBTTebg2xT6P+aefv2AlTbrnsH8MomPdPnW6hyJLKuIKuGwl61nnQ
         FofAZ8S+FJdLkIAnG+ZvhJMENMzvDnyEb8QhHzaaCkKvMKPQ5VSIR5+o+bdVn9ugtTIH
         dYZ43pAzryx6jIH4BkJJhmqXU0wQUMGWCICyg3FZoPo43C97HYnKF1eeiubbPyRzUMJt
         NxJ8pRECVZFxG6ICXBFW7fWFePlKlNLXYPALcxee4WqSA6a34I09pIWxI8HOOQiM/YyL
         fFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146167; x=1758750967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSDbiXfntjTDpIx6oGO3PjzMx5fUjcTMiZWj5cdZF5A=;
        b=MERX49+LHzm/SqbIDGadOEfLNoJ5OouimQ3TLVxxVfOWdAuXh2rJ9p4OP9QF7YPpx5
         tGPrNAy/Ss0e3O3OPFRkHeTOlwha0CB8hBH2ZD3bbo+CM1mm+QTdVYBlx63MXcJ17fRP
         2fxCrHVh3qfxUkAg6RAhBuUTD2chKtLpQKUqCtRXRYN++lxMUeNyo6hMG1ilLlx7tusD
         CYMoIAMHazBNy87JZnjJ0AyVZYq7dgFgdA3Tju6uheOdrKTZPvjPDoRpCeoshrUnQW/5
         N0CtJ9m4mVxWmV0rX5S8xtsCvOmmRABi/2299EYYyOKOBURqFPttm9QdhE4faPNlONRq
         cZpQ==
X-Gm-Message-State: AOJu0YxKcHoKDucIGJGEw0zTktzbzZBOuehlqbWMSbcTS0VYvSZ0dG1f
	dBPdBF88j9DGOE17ayLX8UFVwZgpZ/kHsCNe41V0kw0HbS+TL3vhBKM9AC2Xotwa04A=
X-Gm-Gg: ASbGncuTQi37Z/EfKpSCgDvfhTQRSbHmYcNHK7W8jIbyacJq6LZxjJb/yjDGwJJMe7l
	X5ceJMqrH3/5IzQHaEn4hO2Yt5AOxPIrzXj/AxNHd7pJ/CSmrxZ06eJb1qwk4n4y6gnO4N20cz6
	Amiptuef49DhZwVmMyLmuUEcmEZXYifY6ptQRJgNwp25FEDE5xigBSIUoDuUxYDV1rlgmcCIWI7
	Mp43YNJkm7Iq94itOZzvvyhi/fb3AM+8vX96VgOlPBOqQNvT6ix9ixUqVeO2ezhxeQ+nvzRyI5c
	kb/ZsU2WUjvz7y1cwvwzLnyWKSaKJVsE6T8SSP5+bEcgw7MgCQ+VVt1LDexp8PqWpQuSsBGzL5T
	tViU+/xXy0XXbQZSVLsVRwBTnhJa7WacqcBM+cR7Gw74Q
X-Google-Smtp-Source: AGHT+IECYmCn9BXbpgApuxCBLKt9DNurYE551I03EeiaFrImSmWiiMpA8s3CPcvyywmoeUGGrNqoHw==
X-Received: by 2002:a17:902:ecd1:b0:263:57e7:8950 with SMTP id d9443c01a7336-2681217f3e4mr48631885ad.19.1758146167572;
        Wed, 17 Sep 2025 14:56:07 -0700 (PDT)
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
Subject: [PATCH v4 13/18] xen/riscv: implement p2m_next_level()
Date: Wed, 17 Sep 2025 23:55:33 +0200
Message-ID: <30a203de44b04a06613aa1f873a072a4594c5bb4.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/p2m.c                | 79 ++++++++++++++++++++++++++++-
 xen/arch/riscv/paging.c             | 12 +++++
 3 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 9712aa77c5..69cb414962 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -15,4 +15,6 @@ int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
 
 void paging_free_page(struct domain *d, struct page_info *pg);
 
+struct page_info * paging_alloc_page(struct domain *d);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 2d4433360d..bf4945e99f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -414,6 +414,48 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
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
+static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
+{
+    struct page_info *pg = paging_alloc_page(p2m->domain);
+
+    if ( pg )
+        page_list_add(pg, &p2m->pages);
+
+    return pg;
+}
+
+/*
+ * Allocate a new page table page with an extra metadata page and hook it
+ * in via the given entry.
+ */
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
+    clear_and_clean_page(page, p2m->clean_dcache);
+
+    p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
+
+    return 0;
+}
+
 #define P2M_TABLE_MAP_NONE 0
 #define P2M_TABLE_MAP_NOMEM 1
 #define P2M_TABLE_SUPER_PAGE 2
@@ -438,9 +480,42 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
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
index 049b850e03..803b026f34 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -115,6 +115,18 @@ void paging_free_page(struct domain *d, struct page_info *pg)
     spin_unlock(&d->arch.paging.lock);
 }
 
+struct page_info *paging_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    spin_lock(&d->arch.paging.lock);
+    pg = page_list_remove_head(&d->arch.paging.freelist);
+    ACCESS_ONCE(d->arch.paging.total_pages)--;
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


