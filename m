Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C3AD3811
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010796.1389100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfw-0008Cw-HD; Tue, 10 Jun 2025 13:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010796.1389100; Tue, 10 Jun 2025 13:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfv-00081x-Sv; Tue, 10 Jun 2025 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1010796;
 Tue, 10 Jun 2025 13:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfs-0004Sm-Qb
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:56 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4859e46-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:54 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ade76b8356cso198040066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:55 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:53 -0700 (PDT)
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
X-Inumbo-ID: a4859e46-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560754; x=1750165554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isW7H3XxNDJXOKkXKD+BdxkPdas0tvZOP6WE8bHGH6A=;
        b=J8Y4UlPzelSPjdd0gYIr+u56Vnc7QtThbAhLkFEQf5yZ4xEnez1elnd7+T4pIdvvjk
         LzGQjSAzQljlLcfeb5ywMyRHw6sA7GAKrMmtVUVK8/S+LGHFMhesK5CMJkBdodCd35+a
         R9Xog8JXZxpdixUJQ4pNToPvDQJaFaJWw0zajk1wcctoNMKq8Y2C9yKxDozRQ6ioQtro
         RyQX4hDtq4zGBMOXZ8rz27VQvLB2LS5HAalREPhCdmHROI7veb3sADsbEEfUX+ptT7Av
         iRjvDk4RlO7vYjFGC24z0RuBkDjGDT9sFA3V/q+wGPWvAF6b1WJvswCOxvsIm4dID1XY
         0C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560754; x=1750165554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isW7H3XxNDJXOKkXKD+BdxkPdas0tvZOP6WE8bHGH6A=;
        b=T9lpwnK3Rl9zirpfe3/eLONaZWcszJZKupGh6h4Eshj57MGpkhYlvooqJREITRN2LI
         +CHOhIouIMxhKGSvndIewbIp2CykwxQ489tbgidEfPysp1wWP23OQHI4Kz4RjlBL6oAi
         DhJC+x1A2rN1Z0HVfaVYQ33v0sA/3mPJY4l+Q2CDWIH6PB/QX95jdsugS9eGp8FSH7B2
         y3EfBbSh/Zt3Ksfrvug+oO17UcIxae533WsJfzbaLhG5kYX+VGIrzI3NGqTnbMcP5r+z
         SAbaUnxu3pFDPQaRMD7KBu6q0he9fnQlpUTIVsjrLozF3XrC2HM35sshIBQ/lcdwQMGu
         g7Dw==
X-Gm-Message-State: AOJu0YwXeLLXJz2sXSgWY8kceDwW93NUIKdtc5BDZAgoDdCrhSSb86N5
	OKMXl0Bsh+fIJEWiyy6zEIf/hrH/x0sEKMSHfq5vc6nMECqPJRmb9lOIbpWhEA==
X-Gm-Gg: ASbGncsI/euk7tuhEvOiqFKZ43r7vsPl2TY6LI3B/RgGg6YLNr5lkURl1KYwBDkkKgf
	C7BznwatN+dbuZ0+9E22xAGI/+iNiZBxSIGVkkmISBHaHBmf2gwfrMd1Dyw0gXieIZmQ5eKv57u
	Eqcu3BG4cKvGHjWgE1yDEuDcZDNi4qa1gJ7z6I5f6Lna7jrbIsHKYp7p04fBKVnz291x06NkrbL
	0fYx0BO37/Hvr6gFBZLVfZH77RdXFIj+myczfNpdVR964ENKlZaJtReDmd42eX1D7w4214FcMIF
	7eqWUl9Kf6/XiXIKAun9ud2m3iwV+ox3u015Jtyyj4+J+7u1QbXXieoeodr35fH8CPzNq9qpNI1
	IhSiGH6/T7SCGW/H33LTjL/zL0r2B
X-Google-Smtp-Source: AGHT+IEBQT2r9op963zJAFCCDKLZ1on4ycT0PLvFnyWKzzTEm0ROTgDFTDJZYhRR0a9pcYdIZ+ajbQ==
X-Received: by 2002:a17:907:1c8e:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ade1a9058e7mr1682029166b.16.1749560753609;
        Tue, 10 Jun 2025 06:05:53 -0700 (PDT)
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
Subject: [PATCH v2 12/17] xen/riscv: Implement p2m_free_entry() and related helpers
Date: Tue, 10 Jun 2025 15:05:27 +0200
Message-ID: <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a working implementation of p2m_free_entry() for RISC-V
based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
of page table entries in the P2M (physical-to-machine) mapping.

Only few things are changed:
- Use p2m_force_flush_sync() instead of p2m_tlb_flush_sync() as latter
  isn't implemented on RISC-V.
- Introduce and use p2m_type_radix_get() to get a type of p2m entry as
  RISC-V's PTE doesn't have enough space to store all necessary types so
  a type is stored in a radix tree.

Key additions include:
- p2m_free_entry(): Recursively frees page table entries at all levels. It
  handles both regular and superpage mappings and ensures that TLB entries
  are flushed before freeing intermediate tables.
- p2m_put_page() and helpers:
  - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
  - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
    superpage.
  - p2m_type_radix_get(): Extracts the stored p2m_type from the radix tree
    using the PTE.
- p2m_free_page(): Returns a page either to the domain's freelist or to
  the domheap, depending on whether the domain is hardware-backed.

Defines XEN_PT_ENTRIES in asm/page.h to simplify loops over page table
entries.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - s/p2m_is_superpage/p2me_is_superpage.
---
 xen/arch/riscv/include/asm/page.h |   1 +
 xen/arch/riscv/p2m.c              | 144 +++++++++++++++++++++++++++++-
 2 files changed, 142 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 1b8b145663..c67b9578c9 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -22,6 +22,7 @@
 #define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
 #define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
 #define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
+#define XEN_PT_ENTRIES              (_AT(unsigned int, 1) << PAGETABLE_ORDER)
 
 /*
  * PTE format:
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 27499a86bb..6b11e87b22 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,11 +345,33 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
+static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
+{
+    void *ptr;
+    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
+
+    ptr = radix_tree_lookup(&p2m->p2m_type, gfn_x(gfn));
+
+    if ( !ptr )
+        return p2m_invalid;
+
+    return radix_tree_ptr_to_int(ptr);
+}
+
+/*
+ * In the case of the P2M, the valid bit is used for other purpose. Use
+ * the type to check whether an entry is valid.
+ */
 static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
 {
-    panic("%s: isn't implemented for now\n", __func__);
+    return p2m_type_radix_get(p2m, pte) != p2m_invalid;
+}
 
-    return false;
+static inline bool p2me_is_superpage(struct p2m_domain *p2m, pte_t pte,
+                                    unsigned int level)
+{
+    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK) &&
+           (level > 0);
 }
 
 static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
@@ -404,11 +426,127 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return GUEST_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It's safe to do the put_page here because page_alloc will
+     * flush the TLBs if the page is reallocated before the end of
+     * this loop.
+     */
+    put_page(pg);
+}
+
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+
+    /* Detect the xenheap page and mark the stored GFN as invalid. */
+    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
+}
+
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
+                         unsigned int level)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
+
+    ASSERT(p2me_is_valid(p2m, pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    if ( level == 1 )
+        return p2m_put_2m_superpage(mfn, p2m_type);
+    else if ( level == 0 )
+        return p2m_put_4k_page(mfn, p2m_type);
+}
+
+static void p2m_free_page(struct domain *d, struct page_info *pg)
+{
+    if ( is_hardware_domain(d) )
+        free_domheap_page(pg);
+    else
+    {
+        spin_lock(&d->arch.paging.lock);
+        page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
+        spin_unlock(&d->arch.paging.lock);
+    }
+}
+
 /* Free pte sub-tree behind an entry */
 static void p2m_free_entry(struct p2m_domain *p2m,
                            pte_t entry, unsigned int level)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    unsigned int i;
+    pte_t *table;
+    mfn_t mfn;
+    struct page_info *pg;
+
+    /* Nothing to do if the entry is invalid. */
+    if ( !p2me_is_valid(p2m, entry) )
+        return;
+
+    if ( p2me_is_superpage(p2m, entry, level) || (level == 0) )
+    {
+#ifdef CONFIG_IOREQ_SERVER
+        /*
+         * If this gets called then either the entry was replaced by an entry
+         * with a different base (valid case) or the shattering of a superpage
+         * has failed (error case).
+         * So, at worst, the spurious mapcache invalidation might be sent.
+         */
+        if ( p2m_is_ram( p2m_type_radix_get(p2m, entry)) &&
+             domain_has_ioreq_server(p2m->domain) )
+            ioreq_request_mapcache_invalidate(p2m->domain);
+#endif
+
+        p2m_put_page(p2m, entry, level);
+
+        return;
+    }
+
+    table = map_domain_page(pte_get_mfn(entry));
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
+        p2m_free_entry(p2m, *(table + i), level - 1);
+
+    unmap_domain_page(table);
+
+    /*
+     * Make sure all the references in the TLB have been removed before
+     * freing the intermediate page table.
+     * XXX: Should we defer the free of the page table to avoid the
+     * flush?
+     */
+    p2m_force_tlb_flush_sync(p2m);
+
+    mfn = pte_get_mfn(entry);
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    page_list_del(pg, &p2m->pages);
+    p2m_free_page(p2m->domain, pg);
 }
 
 /*
-- 
2.49.0


