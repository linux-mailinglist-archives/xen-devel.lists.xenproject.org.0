Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B3CFEE41
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196927.1514657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWTF-0003Nw-QW; Wed, 07 Jan 2026 16:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196927.1514657; Wed, 07 Jan 2026 16:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWTF-0003Ky-Hu; Wed, 07 Jan 2026 16:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1196927;
 Wed, 07 Jan 2026 16:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWTD-00033L-NB
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:33:15 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90712ea5-ebe6-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:33:14 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7cee045187so187259266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:33:14 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27c755sm561592366b.18.2026.01.07.08.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:33:13 -0800 (PST)
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
X-Inumbo-ID: 90712ea5-ebe6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803594; x=1768408394; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJZSiko2nJXPL9NTYScplDvXQDw7YOhI5gws96iyp7k=;
        b=PkAuaMwbCy0RkUAXTRC6ctxGPGqmknfHiMA5XjWrj7+NAEiO1NJ4b91K+SpWTC9Rzi
         R7EOqWZzChQAASZ0EIa7mM+jitJLWiMhL6XHXr5Yjz6uiQMzK7nfi3W4lgE3hKld4HuI
         /dmIVXrU0cpCG6GEVNU7tIbYFGSyGD9gar5q6mg8s0hqaF4tHRdZ7k84NpQ/R58W7bJ2
         6OvqkacQeMlJpEdLCUXiBuazDpJvqtcom12gL0y7ap5UVWvmPBP0F/buC6bqUx6LzMhl
         HAKxWP2O44G5SndqcPZB0OY6JODnaaI2raT4Vksefz1IN+iTeq1Urh2+oxiuNeoauD3b
         Ulqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803594; x=1768408394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iJZSiko2nJXPL9NTYScplDvXQDw7YOhI5gws96iyp7k=;
        b=ZqhkbAzVuOYPJ4dNHDvCf3Mv0sRyuGaCL+bHWtLkJy9+J7W7pnxcRrA0p9gPP62hMs
         FBlr1+Np6BbP2eEDW//kEBWfYECTm9E+etE8zaVcPfRvRTD2GsohkEuFbbvRN2R/k+08
         ceqfYYd4o0hkOtpPq3H+ZFw/lsD+5Tz7GG6NkIxa6HH9yHOT8L7gDnwcP3Fj1DcsqObW
         bi1KMRk7nwAw96TfXbQoPaw62SqwB+9rFM9/tuocqLONcImkvMpu2UKlBjxizW0K11JR
         /5pYyflxy4qEXTrEQ5xdki89Klnhs5yOskpTuqN7Ee58v2L2zq0qNrkfiYdTFMkTza+x
         14zA==
X-Gm-Message-State: AOJu0Yy/Vw6XX24vFjGJAyhiGppaZIzF283XLVcYN6N5BfCKB2inz8Pd
	0qawihlialuQhwOlb3EzJVh37tZA636GLxVRF3Y2tMprO6Xw8mJscamR7xLw9Q==
X-Gm-Gg: AY/fxX7SMuiDKlPcPy8glDQ5GaxgiSv60QdykyjIMDQ11oF26NtzvRTOulzT/Di6QIC
	g4gO5OCym+or+9UvzhjaLKm+PFY7uFkKPSgfkZOZ+G5oRFdbu1iaD8f3/xX3UxrbvoiUBNxBs2X
	hQ9fRZksUV3Wj+2whPf47obDcYe5zTCcYIdblTht1i8mWVMTg9yRdYiF84XrWrmzfQN2dwkXnpD
	4nB/+vK0LS8F9+FzpRpsk3qQw03GN7jUg3A+VZeJzRUllD4M88JpiWXNzLTGEwxGTgVKNuxdnUQ
	JKaS0CN61yAVNILQ32XMdDLX0gMWrNmoVcPT07DCtgSY3RiSlZfS64sOkiGBQjbtYxYfEimuhXU
	Qc/F+lRL8NmIvxlaIYCO+9LjKXdDMF9Qdj/I6VvYC5UeKXCXEC3WZjIQ+F1Zq6/+IDaoJ3AWdxN
	5IPtWIWiWHz6HAn0Kf5zkHJiS24Qy2Iov/cxuVixZTtV/aFdHYD34vMA==
X-Google-Smtp-Source: AGHT+IFAf70CmWuElP0VndkfJS2nwryxIUulDqOwebDXN3eOOcbTXkoz+7h3WjTTEfmRkEVpSZ6W+Q==
X-Received: by 2002:a17:906:4fd1:b0:b80:40ea:1d65 with SMTP id a640c23a62f3a-b8444fd5896mr388290566b.31.1767803593768;
        Wed, 07 Jan 2026 08:33:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 3/3] xen/riscv: update p2m_set_entry() to free unused metadata pages
Date: Wed,  7 Jan 2026 17:32:59 +0100
Message-ID: <842b192c9f3cadc948a194de4789c16deafc32cb.1767803451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767803451.git.oleksii.kurochko@gmail.com>
References: <cover.1767803451.git.oleksii.kurochko@gmail.com>
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
Changes in v5:
 - Nothing changed. Only rebase.
---
Changes in v4:
 - Move implementation of alloc_domain_struct() and free_domain_struct()
   ahead of alloc_vcpu_struct().
---
Changes in v3:
 - Move alloc_domain_struct() and free_domain_struct() to not have
   forward declaration.
 - Add Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
Changes in v2:
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
index c40ea483a7cd..0abeb374c110 100644
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
@@ -448,16 +460,27 @@ static void p2m_set_type(pte_t *pte, p2m_type_t t,
 
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
@@ -624,18 +647,13 @@ static pte_t page_to_p2m_table(const struct page_info *page)
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


