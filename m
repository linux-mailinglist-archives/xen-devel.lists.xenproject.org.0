Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69EAD3812
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010798.1389110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfy-00008G-5E; Tue, 10 Jun 2025 13:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010798.1389110; Tue, 10 Jun 2025 13:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfx-0008S9-KX; Tue, 10 Jun 2025 13:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1010798;
 Tue, 10 Jun 2025 13:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyft-0004iH-Ue
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:57 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5fb739d-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:57 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso5067639a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:57 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:55 -0700 (PDT)
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
X-Inumbo-ID: a5fb739d-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560757; x=1750165557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH1ZHh1K+bIKxqRJUfRmKzme+LOvg3rfA9LFTdq0giM=;
        b=URDUhvExcyXwBpvSfXo2fFeGw8yLDIyhxsYPT3iOQ3XL8BHuLeLZiUigj54B2SKEGd
         qcKRetIVCbYw5LF/+3oT7xf4hBe3t5jgxQ55tDElhXJI1w8mLd+Y3XBu1LtLnaRBeILJ
         6mUPXUUSXExw7bFGiP2OfmoteVmb3LNZzrmcubWGOddqkydsMTRbavwi1f36cQDwMaB9
         UWRW3ezjb7qlCK22EbPswmhcInvXw+YsNUspg7yFEUVRJKLf2M92UM3bChZBrFbZa9Ee
         UCTikrJSn/TepScasCE3xh5bFW181GxB5Eia0uomeShixEOq2XCBx3N9EraT+vgAUrZi
         ptNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560757; x=1750165557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH1ZHh1K+bIKxqRJUfRmKzme+LOvg3rfA9LFTdq0giM=;
        b=UkJZIK4jgLd1W0gjhDM7/aAAyyU1er48Pc1ualwcl8FL2UPho+rQW2LJfQjKtZ2B+A
         LjAq9ljE9TRHiyn7XNvNy05FKtYa0BBcWzJfXemto2riVwCDGz6Se+ElmXHl3WFZAdt5
         MFidSjiEGEA59rAek6t1X7iPRUE2ie1CyLfp5fR5CwY5CnSA3QTs9X1oxgO2bpL5iLns
         pBLKtfOMhaFFZitcWE6D0HtV4mnsOLVWlm4BRazIHopEAIAaVB0E2kTdNYk6YQy5tOyl
         zbZudC1W+2DtRApvZaGvbG3HMiyw92dY1pTLzl+kGA3u8LeHyRRmww6Q+2uc73rVYMHa
         I0AA==
X-Gm-Message-State: AOJu0Yxek2ZPd+q4j7InoHWASPgdTgJal443iLetrUv2hQS+z9fY9UJD
	1+yT+CLJJxx6oCgf+THgIdAb7t8opsmwOYqDIxdMEQ2FAbgrwYAYCYJkPaHd3g==
X-Gm-Gg: ASbGnctcdMEXUq4jYw9/4NK9Bo/FPuPjHKdP8RANoduMBnEEcskFrPs6IKCIm+nB6yM
	Rg4D4JQwMNguMEqwtjRXCDcAkbBjkxPsWqa6Zb231BCLjTp6C7DNtplwhfhoMYoyM84jqKZ/yxI
	GoMYZ8Wk+hGLHjI9b+TztPJvoGSh5MbqmoCr7aSIa7thk3xawXULVfns5rnCNzA/tFAsTqvRgGx
	fCQbo6HbEZOOGsJhHJlt6MGCBj6ZAUJQBLtp1vc3Cz0h/ToPvnjrfqauZq1uN7Vf82ompBMTHIA
	MQwwGjIO4VXehqk6K3p8KBDVO5Z6MNbu1ygy47hZu6/5b801wyED5KkxjMz6mrD5g5RDg1ptXnD
	ddP0VvSNV0i0Et2UI631jLFGnmthX
X-Google-Smtp-Source: AGHT+IE6DUsF2JRpbY+BbpzpDedxFbnMl0ETK6qltI4CDqfked9uZsa0lA6xeKZ2cn5AVxbQOlyzvg==
X-Received: by 2002:a17:907:7fa2:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-ade7ac2cd8emr266695966b.4.1749560755700;
        Tue, 10 Jun 2025 06:05:55 -0700 (PDT)
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
Subject: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
Date: Tue, 10 Jun 2025 15:05:29 +0200
Message-ID: <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the p2m_next_level() function, which enables traversal and dynamic
allocation of intermediate levels (if necessary) in the RISC-V
p2m (physical-to-machine) page table hierarchy.

To support this, the following helpers are introduced:
- p2me_is_mapping(): Determines whether a PTE represents a valid mapping.
- page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
  tables with correct attributes.
- p2m_alloc_page(): Allocates page table pages, supporting both hardware and
  guest domains.
- p2m_create_table(): Allocates and initializes a new page table page and
  installs it into the hierarchy.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - s/p2m_is_mapping/p2me_is_mapping.
---
 xen/arch/riscv/p2m.c | 103 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index cba04acf38..87dd636b80 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
     return p2m_type_radix_get(p2m, pte) != p2m_invalid;
 }
 
+/*
+ * pte_is_* helpers are checking the valid bit set in the
+ * PTE but we have to check p2m_type instead (look at the comment above
+ * p2me_is_valid())
+ * Provide our own overlay to check the valid bit.
+ */
+static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
+{
+    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
+}
+
 static inline bool p2me_is_superpage(struct p2m_domain *p2m, pte_t pte,
                                     unsigned int level)
 {
@@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
     return e;
 }
 
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
+{
+    /*
+     * Since this function generates a table entry, according to "Encoding
+     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
+     * to point to the next level of the page table.
+     * Therefore, to ensure that an entry is a page table entry,
+     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
+     * which overrides whatever was passed as `p2m_type_t` and guarantees that
+     * the entry is a page table entry by setting r = w = x = 0.
+     */
+    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
+}
+
+static struct page_info *p2m_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    /*
+     * For hardware domain, there should be no limit in the number of pages that
+     * can be allocated, so that the kernel may take advantage of the extended
+     * regions. Hence, allocate p2m pages for hardware domains from heap.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        pg = alloc_domheap_page(d, MEMF_no_owner);
+        if ( pg == NULL )
+            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
+    }
+    else
+    {
+        spin_lock(&d->arch.paging.lock);
+        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
+        spin_unlock(&d->arch.paging.lock);
+    }
+
+    return pg;
+}
+
+/* Allocate a new page table page and hook it in via the given entry. */
+static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
+{
+    struct page_info *page;
+    pte_t *p;
+
+    ASSERT(!p2me_is_valid(p2m, *entry));
+
+    page = p2m_alloc_page(p2m->domain);
+    if ( page == NULL )
+        return -ENOMEM;
+
+    page_list_add(page, &p2m->pages);
+
+    p = __map_domain_page(page);
+    clear_page(p);
+
+    unmap_domain_page(p);
+
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
+
+    return 0;
+}
+
 #define GUEST_TABLE_MAP_NONE 0
 #define GUEST_TABLE_MAP_NOMEM 1
 #define GUEST_TABLE_SUPER_PAGE 2
@@ -516,9 +591,33 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
                           unsigned int level, pte_t **table,
                           unsigned int offset)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !p2me_is_valid(p2m, *entry) )
+    {
+        if ( !alloc_tbl )
+            return GUEST_TABLE_MAP_NONE;
+
+        ret = p2m_create_table(p2m, entry);
+        if ( ret )
+            return GUEST_TABLE_MAP_NOMEM;
+    }
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
+    if ( p2me_is_mapping(p2m, *entry) )
+        return GUEST_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    unmap_domain_page(*table);
+    *table = map_domain_page(mfn);
 
-    return GUEST_TABLE_MAP_NONE;
+    return GUEST_TABLE_NORMAL;
 }
 
 static void p2m_put_foreign_page(struct page_info *pg)
-- 
2.49.0


