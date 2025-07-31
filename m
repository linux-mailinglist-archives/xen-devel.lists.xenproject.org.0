Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58CB17485
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065958.1431341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViu-0002Ea-E1; Thu, 31 Jul 2025 16:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065958.1431341; Thu, 31 Jul 2025 16:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViu-0002AO-7o; Thu, 31 Jul 2025 16:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1065958;
 Thu, 31 Jul 2025 16:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgF-0001FB-1F
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:55 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415b75fa-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:52 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55b80332144so1151450e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:52 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:51 -0700 (PDT)
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
X-Inumbo-ID: 415b75fa-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977532; x=1754582332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WvQAbd5W6c1J3vMXeOaOWZxLDZn187RMIM0P4l0lSA=;
        b=UY5fqwjXLAZNhxIvtTB5apeqMKTWSalM+VwXxr93XwQn4N5HL2YbfoOKJmOH8Tj0ZT
         AP+xgkJYWyCx0j6OeBiuE1GnY3Rfu4ikmI0BmR0+M+VYw2CR84FBdsnpavKPQS6Dk7DP
         /rbhGxCdS1a0CiOP+kyeoDKb/QjHmJbnt8AsjoEClWAjkGItG1YNb08dMabaIoq/njLq
         PZZhwsb2cDgKxvdHwN2EbHuQ3cs0K0GiWV94lQaqrmfedjsjttUgtAQBrjh/sc+7xz9L
         MxYeInOVoIZWniOilOa/qlatpY6X2oD/evAWebeRFgh+kPPh6hts6gJcOmt0ozbLufh/
         oXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977532; x=1754582332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WvQAbd5W6c1J3vMXeOaOWZxLDZn187RMIM0P4l0lSA=;
        b=PCF4Xp1iTMvK2CeFauXbabfQiAWGwNgAjQK5w3Jja5zX2BtCAlmo/MB69UmkygsO/Z
         uBb4Gzs5CkjATs7nW4xtMnGRFunRcy88p+BA6DWJeHTYPtuIZGoPgEPF97Lh5t1On2Ic
         N38Tdi6vhGk9MHzK3lmtErZ/nwb8iI4x6gNEOxnJUPFRmfNOeosvejdpilIeyerH9sfd
         BUiyFDbDHe7iMiNM2T36qXPXCfnB0t9k/0Psc3neVIjgxP5bxW92fGa07qQZcYJvRtYX
         BJEWCw8H1sxBXyqAPlC4/7vgw0ZW5XuF1zIet4PZrDoa9ia/Lg/S/FGnHNDglPWN6d4w
         K/Lg==
X-Gm-Message-State: AOJu0Yz+QfrfKXl6HMm1c/wuCQn6KdApBIy3s3M093s7bYDMG7CzVDIj
	PQT0njZXI7A/Kb4b9VE7yPhDVDfElQTNrwSZnadlIubU+91D2ZEtVenQxbsB/w==
X-Gm-Gg: ASbGncvdcGwpBMnq2eJL5ea/Eug2j0PNy6K/JZip406UO+pI3BeubPYte/LnjZVNWwV
	RkbjchvGYrp1ELMytBom6X73Re1zuE5ousbdoh4Oqo80jPBKPNhBIma0dLE47b+eftCJ8KPTCkZ
	SHPFTRGYaZ7gnjz9j9zQnnwBqkBrh6mxKfGCXZ+ZSKtsp5y07ThRIaOtD10cLMUpzM1yCK8kBKq
	UP/DiK56do5pNS4jNTK1xU+1qrog3WE8LQ3YCcpQQjA8TUUiBJsYkknlU1lUOl0qbQvJ6VaIL/e
	HmhQOGHqw3vinsVAa6Ak79OZk8pMSiizesAja+9uekds2VUlfldEvuFJPUpu8Kc60kniBPJJWmX
	PX8n63bDPp/CTWgnAP0GSC4wTLEeg/xT6MzaZiWVJGN++ypxDuXqCxu+FOZScRA==
X-Google-Smtp-Source: AGHT+IFUL+r0vELSRPXlMJpUW6Bf4l26MhjYDT+k1OvitanoT2IEWz2lxt4Du+S5xPPH0p+SKix/tw==
X-Received: by 2002:a05:6512:239e:b0:553:2cc1:2bb4 with SMTP id 2adb3069b0e04-55b7c00ba56mr2871988e87.12.1753977531883;
        Thu, 31 Jul 2025 08:58:51 -0700 (PDT)
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
Subject: [PATCH v3 15/20] xen/riscv: implement p2m_next_level()
Date: Thu, 31 Jul 2025 17:58:14 +0200
Message-ID: <8d8953fb00b4ac64bb2e82d827da4fbbe0c29918.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/p2m.c                | 80 ++++++++++++++++++++++++++++-
 xen/arch/riscv/paging.c             | 11 ++++
 3 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index c9063b7f76..3642bcfc7a 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -14,4 +14,6 @@ bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages);
 
 void paging_free_page(struct domain *d, struct page_info *pg);
 
+struct page_info * paging_alloc_page(struct domain *d);
+
 #endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index efc7320619..e04cfde8c7 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -302,6 +302,48 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
     return e;
 }
 
+/* Generate table entry with correct attributes. */
+static pte_t page_to_p2m_table(struct page_info *page)
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
+    clear_and_clean_page(page);
+
+    p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_pte);
+
+    return 0;
+}
+
 #define P2M_TABLE_MAP_NONE 0
 #define P2M_TABLE_MAP_NOMEM 1
 #define P2M_TABLE_SUPER_PAGE 2
@@ -326,9 +368,43 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
                           unsigned int level, pte_t **table,
                           unsigned int offset)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( !alloc_tbl )
+            return P2M_TABLE_MAP_NONE;
+
+        ret = p2m_create_table(p2m, entry);
+        if ( ret )
+            return P2M_TABLE_MAP_NOMEM;
+    }
+
+    /* The function p2m_next_level() is never called at the last level */
+    ASSERT(level != 0);
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
index 853e0e14c6..72ff183260 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -91,6 +91,17 @@ void paging_free_page(struct domain *d, struct page_info *pg)
     spin_unlock(&d->arch.paging.lock);
 }
 
+struct page_info * paging_alloc_page(struct domain *d)
+{
+    struct page_info *pg;
+
+    spin_lock(&d->arch.paging.lock);
+    pg = page_list_remove_head(&d->arch.paging.freelist);
+    spin_unlock(&d->arch.paging.lock);
+
+    return pg;
+}
+
 /* Domain paging struct initialization. */
 int paging_domain_init(struct domain *d)
 {
-- 
2.50.1


