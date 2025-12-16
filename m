Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE7CC47C2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188238.1509551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYMf-0006W4-Cc; Tue, 16 Dec 2025 16:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188238.1509551; Tue, 16 Dec 2025 16:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYMf-0006UT-8R; Tue, 16 Dec 2025 16:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1188238;
 Tue, 16 Dec 2025 16:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYLF-0006gk-0i
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:56:05 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad9df3d-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:56:03 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-649728a2228so6507098a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:56:03 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:56:01 -0800 (PST)
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
X-Inumbo-ID: 1ad9df3d-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904162; x=1766508962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed6ubQSKim63EAsaGe0KmMXZB1/GjuvxCRNk8IaYETQ=;
        b=EjT5qx9d5l512+GWzlxlOBulHOBQD9vkrLr9r2m9GAqz+ZWsQljDlNS5ifbuLfgGGV
         EhoFRHOMEWKFEx/mvixbuMNJkxmYbzI2qEApeeEpCe6NONs8wro1Hws6mqZ+Ha3BQGXX
         6YHuZ4Ke/BFAf2MHl6PQ/hZOqNHd0phHxXNvM3OODDFqOMAg75rt/ROL2HZz9WUyd07u
         toPu2BT8mF8JCWdzOCIoy2uFLuRFMSBnoT4rumtNOIoY2S71hwuFlnCwr1U6fbKmQ8D1
         Cmr3r7GNu+ju8JIJ29+ZqLmoxwSykBMRw1JNAZIiCeOwNPBSLV35DpGcSt/uhlq+T8SF
         ZV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904162; x=1766508962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ed6ubQSKim63EAsaGe0KmMXZB1/GjuvxCRNk8IaYETQ=;
        b=FIHW/VOjqF9h5wjlhcUf51xRrAOLqp+dcyF2HlJANRVblYnk03WW1AjLOJzUUttVII
         iGzMYJDQnU+ryulwy1gsbnLUm8JQ49tyJaKNzAHhfm08pqKU6qhYuXPcbAJw9jsMTdls
         3nBHj5lulLtgid4mu6Zj/WcIAkkLrP9zy59dPp5Kbv0tCvZ275x2fvFrKhQBH+L5WfPh
         dgwBPduWEFRXgNdB9HCEZkjLk9naOtBg+npPiIRPi2ZaZDfZe/9ofPdHUBJm7aIeyErs
         PuRWbWsE04v2BMVLJVpFafv22lmv0Hmd4MJv1Sg0mFTjM+CIlKtVLa4R5JO74FrfQD+f
         iueg==
X-Gm-Message-State: AOJu0YxgeNYqYj1ymKFJyVUScIJWF2GUc2L4fhy2/V/NJ/+Sz4Gr70Q5
	a+jMNG3RIoNgmLbXTqlnx2XUUklBB8V8iznlo0YA5OgnAES24UgH1GWlZgkQPQ==
X-Gm-Gg: AY/fxX4e+xeM3ILvc7LKj9EX46NLjx6rXTrRXzRvyXm3cFaXgl/T5t9ozsAw5a/wsg4
	BrVBNFaSuww3v8uAP4U3WAW5FMgFWe335kJl+JxKioQf6IDiLxcpnC7fHZRd7GeULka2nAK67iO
	C8nPmV4WpMJgMoxoS1r5yyaXey83lj0+M5mQWtsDVkvouzEWYfgbUesoGhxe+UA/A517MxeYhSm
	0JwfFIw10gc5SAIQSLeM5tSn/M+QneGNVecvjaBi1g+xd/qXL6ON/QKXdbnJ0RVtOLsFP4QFDJf
	fxFJgsXDVCLWdzPkLZlkbNntr62O0rXaMGS/P+KnwP4JjLvD0Ore01OlSd7RJSoNYcO2AB8rHVm
	URLGQJognplesJaBXRhbph8c2GJ6zacO2YMAuDoNco9l5bgMQ6tA9PxMt32ZiMQ6/NGkQ5ejkZm
	bxTfx+W6kF5Var4xMp38I3OQpFC0F+gwhtbV2M76ap5TwaYhzGualGwcM=
X-Google-Smtp-Source: AGHT+IE2rFMU05wY3GKq+WOgxrWncQrUmNG/hmxTgSbtrJm5bXQKWrd+gN57HuRFWk+DrNaP0OlBOg==
X-Received: by 2002:a17:907:3d93:b0:b79:f753:68fb with SMTP id a640c23a62f3a-b7d235c7f02mr1714213766b.4.1765904161969;
        Tue, 16 Dec 2025 08:56:01 -0800 (PST)
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
Subject: [PATCH v7 19/19] xen/riscv: update p2m_set_entry to free unused metadata pages
Date: Tue, 16 Dec 2025 17:55:29 +0100
Message-ID: <4274ff86c3b7233c03d72faf8989991094a7630a.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce tracking of metadata page entries usage and if all of them are
p2m_invalid then free them.

Intermediate P2M page tables are allocated with MEMF_no_owner, so we are free
to repurpose struct page_info fields for them. Since page_info.u.* is not
used for such pages, introduce a used_entries counter in struct page_info
to track how many metadata entries are in use for a given intermediate P2M
page table.

The counter is updated in p2m_set_type() when metadata entries transition
between p2m_invalid and a valid external type. When the last metadata entry
is cleared (used_entries == 0), the associated metadata page is freed and
returned to the P2M pool.

Refactor metadata page freeing into a new helper, p2m_free_metadata_page(),
as the same logic is needed both when tearing down a P2M table and when
all metadata entries become p2m_invalid in p2m_set_type(). As part of this
refactoring, move the declaration of p2m_free_page() earlier to satisfy the
new helper.

Additionally, implement page_set_tlbflush_timestamp() for RISC-V instead of
BUGing, as it is invoked when returning memory to the domheap.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - New patch.
---
 xen/arch/riscv/include/asm/flushtlb.h |  2 +-
 xen/arch/riscv/include/asm/mm.h       | 12 ++++++++++
 xen/arch/riscv/p2m.c                  | 32 +++++++++++++++++++++------
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index ab32311568..4f64f97570 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -38,7 +38,7 @@ static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
 
 static inline void page_set_tlbflush_timestamp(struct page_info *page)
 {
-    BUG_ON("unimplemented");
+    page->tlbflush_timestamp = tlbflush_current_time();
 }
 
 static inline void arch_flush_tlb_mask(const cpumask_t *mask)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 48162f5d65..a005d0247a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -113,6 +113,18 @@ struct page_info
             unsigned long type_info;
         } inuse;
 
+        /* Page is used as an intermediate P2M page table: count_info == 0 */
+        struct {
+            /*
+            * Tracks the number of used entries in the metadata page table.
+            *
+            * If used_entries == 0, then `page_info.v.md.pg` can be freed and
+            * returned to the P2M pool.
+            */
+            unsigned long used_entries;
+        } md;
+
+
         /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
         union {
             struct {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index bbc3d53d01..496e8c394f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -51,6 +51,18 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .name = "Bare",
 };
 
+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
+                                          struct page_info **md_pg)
+{
+    if ( *md_pg )
+    {
+        p2m_free_page(p2m, *md_pg);
+        *md_pg = NULL;
+    }
+}
+
 unsigned char get_max_supported_mode(void)
 {
     return max_gstage_mode.mode;
@@ -455,16 +467,27 @@ static void p2m_set_type(pte_t *pte, p2m_type_t t,
 
     if ( t >= p2m_first_external )
     {
+        if ( metadata[ctx->index].type == p2m_invalid )
+            ctx->pt_page->u.md.used_entries++;
+
         metadata[ctx->index].type = t;
 
         t = p2m_ext_storage;
     }
     else if ( metadata )
+    {
+        if ( metadata[ctx->index].type != p2m_invalid )
+            ctx->pt_page->u.md.used_entries--;
+
         metadata[ctx->index].type = p2m_invalid;
+    }
 
     pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
 
     unmap_domain_page(metadata);
+
+    if ( *md_pg && !ctx->pt_page->u.md.used_entries )
+        p2m_free_metadata_page(ctx->p2m, md_pg);
 }
 
 /*
@@ -631,18 +654,13 @@ static pte_t page_to_p2m_table(const struct page_info *page)
     return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL);
 }
 
-static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
-
 /*
  * Free page table's page and metadata page linked to page table's page.
  */
 static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
 {
-    if ( tbl_pg->v.md.pg )
-    {
-        p2m_free_page(p2m, tbl_pg->v.md.pg);
-        tbl_pg->v.md.pg = NULL;
-    }
+    p2m_free_metadata_page(p2m, &tbl_pg->v.md.pg);
+
     p2m_free_page(p2m, tbl_pg);
 }
 
-- 
2.52.0


