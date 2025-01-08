Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E9A05E9B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867322.1278845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4q-00078V-8e; Wed, 08 Jan 2025 14:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867322.1278845; Wed, 08 Jan 2025 14:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4q-00071f-0T; Wed, 08 Jan 2025 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 867322;
 Wed, 08 Jan 2025 14:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4o-0005q4-S4
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:30 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad05b41-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso2013637466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f015b53sm2489423166b.163.2025.01.08.06.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:26 -0800 (PST)
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
X-Inumbo-ID: 1ad05b41-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346627; x=1736951427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3R5hmlmCEd3MS69pC9DKVq/z/e8dZ+FD++Vyspageo=;
        b=LzA1uq2ALJ7yTUr9qkhSQEj48adVHC/ZkKUJiJ5CMX2s7DKCO7wxpiBrUT2I91dVnh
         2Z1FN0mmcd4W6CPW1Moth8/NDWs84SKa4LNhjhSATuNixUhzOd47vqXziDlbD3oFM1Q7
         YhYDILv2Fx/WAA7SckkBHnEv3MTwfjSTsXB24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346627; x=1736951427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3R5hmlmCEd3MS69pC9DKVq/z/e8dZ+FD++Vyspageo=;
        b=Lgu30hwA1yhpXMdnCVp+7kY7LlslUZ2ry/2gIYqoaQueyc1wL8RP0d4fsNqvBuTGT7
         ZatO8hmuyTxGXxxosfUSYB99zQVp0E1p8RvOurWV/+D1EaWE8taZC5QHC3WH9BRlGBe0
         oyPg5ep/1pJsXKpVFjI6GFCsXr48KFtFP/BlxAtfPonxi4Cih1rAjvhaJ9pmuJgna5u3
         Bf2RxrumEoEO5nIrhVEdMWFFyJwOYxYicVqNHrLREEk10/yG/+/Z/eQeFsBsqaVWDhOK
         vTHbX33qZOAmbi5zpWekRlqlpo3a0cGxyq5K6Xj0ALmG6kEwsNuY1oS4+sQ8mhTsPS0k
         6OoA==
X-Gm-Message-State: AOJu0YxV0iG9M9uDhAM6NuG2J98uxvLlc5EAob8s6Ey8+9q+oELq2fAr
	DuOKfkPGcv+VOg6fvdLWXfzWvmkdjQE1ULPuI22pKjFAZL9wjPeF1YP6wEFQxs3TLL8RHQy2df/
	r
X-Gm-Gg: ASbGncvq0QsBoCFVG4d17xvA10Na2ggH8ivyRrfhulHQyHWjuF14xpeU/psgjYB2p1t
	/q68Qbo0/6AjfAz2+s+PDKu/RwLV1Y27VwEn9Or3JG5W9333xSbWmhCEdnObZvI/rK3a07+PzRX
	6NJidi5HtPrzC0oTinwjbS/fprsNJsgl3C5cjuG3cGaxrmD/21LwOnHvMraYYZpNQu6+Enuvtcy
	K8WpGXs8YKKlTR0iRWy14WA3AezGfaUHN+SzHTItDtjjxOyHvXc16UVGykWO+9Slow=
X-Google-Smtp-Source: AGHT+IFOHqB2X4YYIijHMhEMuthvZwPSfHYYCzV0yIvDkNOaCTZyCxMx+sLWOIfq27OgFwEuvS3YwQ==
X-Received: by 2002:a17:907:7f08:b0:aab:9430:40e9 with SMTP id a640c23a62f3a-ab2ab70a84emr230283666b.32.1736346626620;
        Wed, 08 Jan 2025 06:30:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 05/18] x86/mm: switch destroy_perdomain_mapping() parameter from domain to vCPU
Date: Wed,  8 Jan 2025 15:26:45 +0100
Message-ID: <20250108142659.99490-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for the per-domain area being populated with per-vCPU mappings
change the parameter of destroy_perdomain_mapping() to be a vCPU instead of a
domain, and also update the function logic to allow manipulation of per-domain
mappings using the linear page table mappings.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mm.h |  2 +-
 xen/arch/x86/mm.c             | 24 +++++++++++++++++++++++-
 xen/arch/x86/pv/domain.c      |  3 +--
 xen/arch/x86/x86_64/mm.c      |  2 +-
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index b50a51327b2b..65cd751087dc 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -605,7 +605,7 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
                              struct page_info **ppg);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 mfn_t *mfn, unsigned long nr);
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0abea792486c..713ae8dd6fa3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6511,10 +6511,11 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
     unmap_domain_page(l3tab);
 }
 
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
     const l3_pgentry_t *l3tab, *pl3e;
+    const struct domain *d = v->domain;
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
@@ -6523,6 +6524,27 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
     if ( !d->arch.perdomain_l3_pg )
         return;
 
+    /* Use likely to force the optimization for the fast path. */
+    if ( likely(v == current) )
+    {
+        l1_pgentry_t *pl1e;
+
+        /* Ensure page-tables are from current (if current != curr_vcpu). */
+        sync_local_execstate();
+
+        pl1e = &__linear_l1_table[l1_linear_offset(va)];
+
+        /* Fast path: zap L1 entries using the recursive linear mappings. */
+        for ( ; nr--; pl1e++ )
+        {
+            if ( perdomain_l1e_needs_freeing(*pl1e) )
+                free_domheap_page(l1e_get_page(*pl1e));
+            l1e_write(pl1e, l1e_empty());
+        }
+
+        return;
+    }
+
     l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index bc7cd0c62f0e..7e8bffaae9a0 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -285,8 +285,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 
 static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
-                              1U << GDT_LDT_VCPU_SHIFT);
+    destroy_perdomain_mapping(v, GDT_VIRT_START(v), 1U << GDT_LDT_VCPU_SHIFT);
 }
 
 void pv_vcpu_destroy(struct vcpu *v)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 389d813ebe63..c08b28d9693b 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -737,7 +737,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
 
 void free_compat_arg_xlat(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
                               PFN_UP(COMPAT_ARG_XLAT_SIZE));
 }
 
-- 
2.46.0


