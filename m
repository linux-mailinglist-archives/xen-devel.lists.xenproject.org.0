Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC3CD6AEB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192172.1511528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiv9-0001uI-7i; Mon, 22 Dec 2025 16:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192172.1511528; Mon, 22 Dec 2025 16:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiv9-0001qw-2S; Mon, 22 Dec 2025 16:38:07 +0000
Received: by outflank-mailman (input) for mailman id 1192172;
 Mon, 22 Dec 2025 16:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiv7-00085h-C5
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:38:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95da2142-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:38:03 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64b8e5d1611so4637192a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:38:03 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037de004fsm1149128166b.45.2025.12.22.08.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:38:02 -0800 (PST)
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
X-Inumbo-ID: 95da2142-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421483; x=1767026283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snjG4R/pA1CFKmrsMjW984DLPxncWtCMO3mbZglzYjc=;
        b=FTKDi5LVX/yGU1afdBpJUkl+FPe1he+lOvWoAbkoVLqKgsee1qztHw5+t44M27Ct/d
         3MPUcVIsrs4i6WyCpVmVdHy+yMUVFTtjjxBA/dfiBFBaV9zac2iuFTF61FO3mf+JZ6EV
         lwqAtiUGOw6ay3/dG3iSHidwxKoLrNlMh2Y4dOWuVVhpja18U3A3DtB/GO0TGP4tvYnQ
         iobzSbqyGfu+bBMwEUbL+e2MOJQ4/Um+I/GvOAoiH4rJXRG/nuBzBf5n8tQA+cb7STD4
         2ztGB0RYobR+fgnGLJ9g0sM47ydFTG7oSITBI4rgI5MCScr9J9BQpUBqK1LSbucBheUe
         y3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421483; x=1767026283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snjG4R/pA1CFKmrsMjW984DLPxncWtCMO3mbZglzYjc=;
        b=Exxc2B9x+SmZZF0PnRUVQwvsEKgygSYn9RJMGYrBAxYdfLyHkOyo5Jlp2x3wFRDl8I
         O0EfNlNXAliM6hk2zMXO1b6+rWb3SzbvRYiuz8HWwb7X5bOC6FCqTA6AHc7BA78s7DJY
         bzvCjC7D2vtBqmHaCo7anLvhse3Umq9ahJ9Vb5PZ8LhnBeForCovyUsHpBxbrKx/CCYq
         2gE4Z7ICQKC3P0eWCrmUyg0fAXGK2CCG5umb3Tctx2rdnly+sXdFHz9H2SH7bq3OUYE4
         UcXTWWi6FUY9/w4ZL9GXBaQtBtHTD50XvlJBYg4upxQKoMyDD1Kqnjs4/Fmavw7DUOwe
         gCMQ==
X-Gm-Message-State: AOJu0YxqocfFVL+4bX18VVWnibNgIuCv7aIAMhQTaKtGed8Xt/bu3/Zk
	FRDArDkmeuQicmBIEJ3QY1s0EGjhUtfn969S9OC1wI4JpsxGypovuWDBHdoFYQ==
X-Gm-Gg: AY/fxX5qs6b2z+JfOhqBqV816Is61ly1Tpd4LC7QqbvXWzcFVOLwt3DS75i5pSSmWhX
	KM0X5rz5MraCuuoLb4/G6rRVgkoX6xuW4MN9121oXjDr1BSfVR3CgQkyFk7Aqv6/0iUyE6iJytw
	ITURn70I/d2FegVyzkIdI3/bVa1ob6H26bDZelVdwQA0ULZAeuNbPf6LcM2RyLPV8ab4kMg+KcU
	axfVFWctsztQ/KpTCrUGF+HTt42QSlLxWaltYpeqyQ9fLhfa1OZujdnxlM9ZwRtVn8pYSxD/ZYx
	mAKK/WXE3spIJPFJ5T6s4KgnWEjhFJ3vaxOtG/xvZwGkIQlwM19fCMdo24+Ab1wCLgfsob2rywA
	6C+8JtaEopSt2PHyuoGRUZBycFx6Cif8e46nkcMAshufeJxkZI17Y9foquW3EuvLa5IIoxFCLZ2
	pW5dnhj5HFNXhYy7085BAuRpolgRJh2m6l/Eecyp4s9XDERSr1j++2p49g7dxZ2s/Vyw==
X-Google-Smtp-Source: AGHT+IGl4+5cwit28zyS+FC7ckzBQFpj70pEn0gT8nTWI/cUrgY36FnvSC8pIPig+JQtSEWYV8J2iw==
X-Received: by 2002:a17:907:3f98:b0:b73:78f3:15b3 with SMTP id a640c23a62f3a-b80371f98f1mr1136707266b.47.1766421482573;
        Mon, 22 Dec 2025 08:38:02 -0800 (PST)
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
Subject: [PATCH v8 3/3] xen/riscv: update p2m_set_entry() to free unused metadata pages
Date: Mon, 22 Dec 2025 17:37:49 +0100
Message-ID: <898c078cb84f8cf0b24ea1c61480b264a4da6ba5.1766406895.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766406895.git.oleksii.kurochko@gmail.com>
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V8:
 - New patch.
---
 xen/arch/riscv/include/asm/flushtlb.h |  2 +-
 xen/arch/riscv/include/asm/mm.h       | 12 ++++++++++
 xen/arch/riscv/p2m.c                  | 32 +++++++++++++++++++++------
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index ab32311568ac..4f64f9757058 100644
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
index 48162f5d65cd..a005d0247a6f 100644
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
index 24dd07165bd1..a6e4c01b873d 100644
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
@@ -450,16 +462,27 @@ static void p2m_set_type(pte_t *pte, p2m_type_t t,
 
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
@@ -626,18 +649,13 @@ static pte_t page_to_p2m_table(const struct page_info *page)
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


