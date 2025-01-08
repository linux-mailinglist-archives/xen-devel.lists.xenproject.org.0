Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD960A05EA0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867328.1278885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4v-0008P8-Gh; Wed, 08 Jan 2025 14:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867328.1278885; Wed, 08 Jan 2025 14:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4v-0008Kf-3R; Wed, 08 Jan 2025 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 867328;
 Wed, 08 Jan 2025 14:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4s-0005q4-T5
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd1f9b7-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:32 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so1798129a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:32 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a41esm25260184a12.1.2025.01.08.06.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:31 -0800 (PST)
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
X-Inumbo-ID: 1dd1f9b7-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346632; x=1736951432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+w+3NcnUX3Zar0o1eFpwbIWoYl9kfXdM+GmtfECN9Y=;
        b=CJYTOJ7dPqv6H2INxyBAkJI5a3fJ8NY8bA4xtzPGSutHwoJ+82fDuFy2vOCnwSBQ21
         RTtIzbVOn27RNP/hFaDqiHossDLzLHmtoP8C0H9809fV3mdFaIACusaZ/CRBowqraW0e
         PGoqVoD2QT4wMsgJOZPJz75pfnV3aFZOiBh9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346632; x=1736951432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+w+3NcnUX3Zar0o1eFpwbIWoYl9kfXdM+GmtfECN9Y=;
        b=q6SzKZJ5PRJ8D1wFcT8OASbW5DLKj588PhpIYMNBMJzTgnJl8dHT3X9V95KGxYpIfJ
         Soyeqw/PtSjv1c9i4ef43uzcXjm7gcTnZ6CdAwXXw6QrrwVlk6wizc5LnMUtkd34wreC
         3FO/UstkZKsfqv/SNgiNZXcslNpWMJvXiZS6bFVQ8kQe3NVzkYTs0edN1EU+egjEwTFd
         obqyKlho9PDGACCPQkxpY1srzChwGf09LPjPvcidYeYrq8dq8/G10b92jDprMqPlH9Ej
         W9J6yOsRnej/v5lKoVenfm0t0XMw5l/FHdJC3Mkb8Ai7HdaKz136/MFK4gbAurzcs0V/
         G6Fg==
X-Gm-Message-State: AOJu0YyMa+bece6bk8uv174kgkVQdlzm6Fk828Fsug1K/gaJo+qw5p5e
	pecX6OOVdkTET89XTH+tuRg4FaqtdUmdrbRHYhk6FDkQDywJQeqT35oAU+h+Koklu7di0IZ/TJ4
	G
X-Gm-Gg: ASbGncsJ8RguGhfmzcN4sJTuPCVt33uVQGLTfGZ+/gCOvbzI6Rw9SZmcK2Hh3/mt5ry
	rPV+5A3kGVfobrtn6ULSxWW/00UJdMqaJrP9Se2CGUIgQnhsGIPcD4r5+qT4zsHXTiY0qte2oMq
	D27VhydyXTbKQCM2mYNBxudnUttXxL1Fg2wy+BkR4wl8XlxdqEhPWjnkbqf+zZFQfykvMjZ4Sbi
	2e9uOfx5tMCxtVg3NSweup+VK1cDXoBwx4iA2wu4eiRX8255iPUmePv4HUBqiITDfE=
X-Google-Smtp-Source: AGHT+IEFaKPQqexDpzrOqyp0ve20f3nJ0Bl9tu8TrAhlQl+LI4LCrLF0fA2VgPpHt6fkFPVf5GnV0A==
X-Received: by 2002:a17:907:9612:b0:aaf:137:b5fa with SMTP id a640c23a62f3a-ab291929579mr627471066b.26.1736346631621;
        Wed, 08 Jan 2025 06:30:31 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 09/18] x86/mm: simplify create_perdomain_mapping() interface
Date: Wed,  8 Jan 2025 15:26:49 +0100
Message-ID: <20250108142659.99490-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no longer any callers of create_perdomain_mapping() that request a
reference to the used L1 tables, and hence the only difference between them is
whether the caller wants the region to be populated, or just the paging
structures to be allocated.

Simplify the arguments to create_perdomain_mapping() to reflect the current
usages: drop the last two arguments and instead introduce a boolean to signal
whether the caller wants the region populated.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain_page.c    | 10 ++++----
 xen/arch/x86/hvm/hvm.c        |  2 +-
 xen/arch/x86/include/asm/mm.h |  3 +--
 xen/arch/x86/mm.c             | 43 +++++++----------------------------
 xen/arch/x86/pv/domain.c      |  4 +---
 xen/arch/x86/x86_64/mm.c      |  3 +--
 6 files changed, 16 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304fb8..ad6d86be6918 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -254,8 +254,7 @@ int mapcache_domain_init(struct domain *d)
     spin_lock_init(&dcache->lock);
 
     return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1,
-                                    NIL(l1_pgentry_t *), NULL);
+                                    2 * bitmap_pages + 1, false);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
@@ -272,16 +271,15 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents,
-                                          NIL(l1_pgentry_t *), NULL);
+        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents, false);
 
         /* Populate bit maps. */
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
         if ( !rc )
             rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
-                                          nr, NULL, NIL(struct page_info *));
+                                          nr, true);
 
         if ( rc )
             return rc;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 70fdddae583d..e7817144059e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -601,7 +601,7 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, false);
     if ( rc )
         goto fail;
 
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 65cd751087dc..0c57442c9593 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -601,8 +601,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg);
+                             unsigned int nr, bool populate);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 mfn_t *mfn, unsigned long nr);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 713ae8dd6fa3..45664c56cb8f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6301,8 +6301,7 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
 }
 
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **pl1tab,
-                             struct page_info **ppg)
+                             unsigned int nr, bool populate)
 {
     struct page_info *pg;
     l3_pgentry_t *l3tab;
@@ -6351,55 +6350,32 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
 
     unmap_domain_page(l3tab);
 
-    if ( !pl1tab && !ppg )
-    {
-        unmap_domain_page(l2tab);
-        return 0;
-    }
-
     for ( l1tab = NULL; !rc && nr--; )
     {
         l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
 
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            if ( pl1tab && !IS_NIL(pl1tab) )
-            {
-                l1tab = alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
-                if ( !l1tab )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-                ASSERT(!pl1tab[l2_table_offset(va)]);
-                pl1tab[l2_table_offset(va)] = l1tab;
-                pg = virt_to_page(l1tab);
-            }
-            else
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+            if ( !pg )
             {
-                pg = alloc_domheap_page(d, MEMF_no_owner);
-                if ( !pg )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-                l1tab = __map_domain_page(pg);
+                rc = -ENOMEM;
+                break;
             }
+            l1tab = __map_domain_page(pg);
             clear_page(l1tab);
             *pl2e = l2e_from_page(pg, __PAGE_HYPERVISOR_RW);
         }
         else if ( !l1tab )
             l1tab = map_l1t_from_l2e(*pl2e);
 
-        if ( ppg &&
+        if ( populate &&
              !(l1e_get_flags(l1tab[l1_table_offset(va)]) & _PAGE_PRESENT) )
         {
             pg = alloc_domheap_page(d, MEMF_no_owner);
             if ( pg )
             {
                 clear_domain_page(page_to_mfn(pg));
-                if ( !IS_NIL(ppg) )
-                    *ppg++ = pg;
                 l1tab[l1_table_offset(va)] =
                     l1e_from_page(pg, __PAGE_HYPERVISOR_RW | _PAGE_AVAIL0);
                 l2e_add_flags(*pl2e, _PAGE_AVAIL0);
@@ -6618,10 +6594,7 @@ void free_perdomain_mappings(struct domain *d)
                         unmap_domain_page(l1tab);
                     }
 
-                    if ( is_xen_heap_page(l1pg) )
-                        free_xenheap_page(page_to_virt(l1pg));
-                    else
-                        free_domheap_page(l1pg);
+                    free_domheap_page(l1pg);
                 }
 
             unmap_domain_page(l2tab);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index dfaeeb2e2cc2..ca32e7b5d686 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -278,9 +278,7 @@ int switch_compat(struct domain *d)
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                                    1U << GDT_LDT_VCPU_SHIFT,
-                                    NIL(l1_pgentry_t *),
-                                    NULL);
+                                    1U << GDT_LDT_VCPU_SHIFT, false);
 }
 
 static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index c08b28d9693b..55bba7e473ae 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -731,8 +731,7 @@ void __init zap_low_mappings(void)
 int setup_compat_arg_xlat(struct vcpu *v)
 {
     return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
-                                    PFN_UP(COMPAT_ARG_XLAT_SIZE),
-                                    NULL, NIL(struct page_info *));
+                                    PFN_UP(COMPAT_ARG_XLAT_SIZE), true);
 }
 
 void free_compat_arg_xlat(struct vcpu *v)
-- 
2.46.0


