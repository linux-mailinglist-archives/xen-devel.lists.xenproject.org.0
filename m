Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F1A05EA1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867327.1278881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4v-0008Kw-2W; Wed, 08 Jan 2025 14:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867327.1278881; Wed, 08 Jan 2025 14:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4u-0008G5-L8; Wed, 08 Jan 2025 14:30:36 +0000
Received: by outflank-mailman (input) for mailman id 867327;
 Wed, 08 Jan 2025 14:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4s-0006o2-K7
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9c9886-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:33 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso3092335666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:33 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4971sm2525510466b.107.2025.01.08.06.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:32 -0800 (PST)
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
X-Inumbo-ID: 1e9c9886-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346633; x=1736951433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jBVxxfhyjQo3CPYAi6vNYnRQLQEERzPDDK3eitXPfE=;
        b=f7MNmPUBzZU/65+N/0U9PUwAj6mHPSvT7fY1NT7mXcJREbhr+2o8Hirf8bQy/jNVsy
         sX2uUwKHTlVxa4ZVFiomxEhSSPPCGJ9b3W6zDGz20/ncpvrNhJOp+YDQU28mFFm3mITW
         uPkOuh6TQiYecfmYJcZTgJT7Xm160pFQ9noCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346633; x=1736951433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jBVxxfhyjQo3CPYAi6vNYnRQLQEERzPDDK3eitXPfE=;
        b=qM+fPcdop30knuBJLRfGM+M6H+bG+2pZP7TVjFS3LG4mPDPFS/x2i9soEFB6RPc2Ya
         Tfp8TqySoAwLWcdt57AC9ppvpcyl8HxpW1gsgEwDI3+qIur0TBAxAxn4LBm7kXU7O974
         htVEOPDnJpNYRdzwWNwkDgr8u4Ep5iM+iTLF8yDLmR1HwNGFvgKv9tbms4AFYMlwfYXi
         DYOO1mUTLKqBxEH1PWsD9Ey6gtO1eR9b2Gg0384/unIZxA9a2dSp7xKbhNAE1T5jmb0e
         Bo1bTMx3ZryBzY29AMiCEDytz4/02S9bhrTAVZDdPZpriemGTjCoyO5DoG82JtH1f997
         Qd7Q==
X-Gm-Message-State: AOJu0YyH05pJzNjdzsHFQkzLDyazSsEbvR1fzGx64LvHE4i01cPi6rRC
	FmYSP5ILgm17VBSKwJKiZ0QCQOYd6BJs7PoYFdXG1gFnt4Ks0ZIvcmT7R04tPGrrE8fHV+L6CUf
	O
X-Gm-Gg: ASbGnctnRCb1E30t2r/QFaA3xY35w1+oIaRN/GHRFTtORyBLhdb9C3AdFEVZ7HlwG8L
	42LO3Y0KECxVbtpLHc6e3/yGAXckk3GMRebW1YQwyjmbGjW9Yxaq+ZY12ghE1G0DgnX910hwvFZ
	W9PI0nIErInk7XsF5UDi888oFR++rbT6hkANx4+t2UI/IoYqqneB01RCzfOjTdufDMH4MNO8ACp
	pQ2Z8eJHPcxtODHTJJrOkSbshb6s35zYK7WW14579lxWiVXTr4y1mCZY98U7YvxyRk=
X-Google-Smtp-Source: AGHT+IEprDOxP9xe+A8TyhkOIHhL+eL4gFw3vAZc1g+A9Cc6FCNI9TzjKmB6a6JD0IbDmktTNWtZeg==
X-Received: by 2002:a17:907:3f95:b0:aae:b259:ef6c with SMTP id a640c23a62f3a-ab2aacfbb7cmr303604566b.0.1736346632906;
        Wed, 08 Jan 2025 06:30:32 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 10/18] x86/mm: switch {create,destroy}_perdomain_mapping() domain parameter to vCPU
Date: Wed,  8 Jan 2025 15:26:50 +0100
Message-ID: <20250108142659.99490-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for the per-domain area being per-vCPU.  This requires moving
some of the {create,destroy}_perdomain_mapping() calls to the domain
initialization and tear down paths into vCPU initialization and tear down.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c             | 12 ++++++++----
 xen/arch/x86/domain_page.c        | 13 +++++--------
 xen/arch/x86/hvm/hvm.c            |  5 -----
 xen/arch/x86/include/asm/domain.h |  2 +-
 xen/arch/x86/include/asm/mm.h     |  4 ++--
 xen/arch/x86/mm.c                 |  6 ++++--
 xen/arch/x86/pv/domain.c          |  2 +-
 xen/arch/x86/x86_64/mm.c          |  2 +-
 8 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 0481164f3727..6e1f622f7385 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -559,6 +559,10 @@ int arch_vcpu_create(struct vcpu *v)
 
     v->arch.flags = TF_kernel_mode;
 
+    rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, false);
+    if ( rc )
+        return rc;
+
     rc = mapcache_vcpu_init(v);
     if ( rc )
         return rc;
@@ -607,6 +611,7 @@ int arch_vcpu_create(struct vcpu *v)
     return rc;
 
  fail:
+    free_perdomain_mappings(v);
     paging_vcpu_teardown(v);
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
@@ -629,6 +634,8 @@ void arch_vcpu_destroy(struct vcpu *v)
         hvm_vcpu_destroy(v);
     else
         pv_vcpu_destroy(v);
+
+    free_perdomain_mappings(v);
 }
 
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
@@ -870,8 +877,7 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        if ( (rc = mapcache_domain_init(d)) != 0 )
-            goto fail;
+        mapcache_domain_init(d);
 
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
@@ -909,7 +915,6 @@ int arch_domain_create(struct domain *d,
     XFREE(d->arch.cpu_policy);
     if ( paging_initialised )
         paging_final_teardown(d);
-    free_perdomain_mappings(d);
 
     return rc;
 }
@@ -935,7 +940,6 @@ void arch_domain_destroy(struct domain *d)
 
     if ( is_pv_domain(d) )
         pv_domain_destroy(d);
-    free_perdomain_mappings(d);
 
     free_xenheap_page(d->shared_info);
     cleanup_domain_irq_mapping(d);
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index ad6d86be6918..1372be20224e 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -231,7 +231,7 @@ void unmap_domain_page(const void *ptr)
     local_irq_restore(flags);
 }
 
-int mapcache_domain_init(struct domain *d)
+void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
     unsigned int bitmap_pages;
@@ -240,7 +240,7 @@ int mapcache_domain_init(struct domain *d)
 
 #ifdef NDEBUG
     if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
-        return 0;
+        return;
 #endif
 
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
@@ -252,9 +252,6 @@ int mapcache_domain_init(struct domain *d)
                       (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
 
     spin_lock_init(&dcache->lock);
-
-    return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1, false);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
@@ -271,14 +268,14 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents, false);
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents, false);
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
                                           nr, true);
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
                                           nr, true);
 
         if ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e7817144059e..0dc693818349 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -601,10 +601,6 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
-    rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, false);
-    if ( rc )
-        goto fail;
-
     hvm_init_cacheattr_region_list(d);
 
     rc = paging_enable(d, PG_refcounts|PG_translate|PG_external);
@@ -708,7 +704,6 @@ int hvm_domain_initialise(struct domain *d,
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
- fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
     XFREE(d->arch.hvm.pl_time);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index fbe59baa82ec..7c143d2a6c46 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -73,7 +73,7 @@ struct mapcache_domain {
     unsigned long *garbage;
 };
 
-int mapcache_domain_init(struct domain *d);
+void mapcache_domain_init(struct domain *d);
 int mapcache_vcpu_init(struct vcpu *v);
 void mapcache_override_current(struct vcpu *v);
 
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 0c57442c9593..f501e5e115ff 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -600,13 +600,13 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, bool populate);
 void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                 mfn_t *mfn, unsigned long nr);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
-void free_perdomain_mappings(struct domain *d);
+void free_perdomain_mappings(struct vcpu *v);
 
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 45664c56cb8f..c321f5723b04 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6300,9 +6300,10 @@ static bool perdomain_l1e_needs_freeing(l1_pgentry_t l1e)
            (_PAGE_PRESENT | _PAGE_AVAIL0);
 }
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, bool populate)
 {
+    struct domain *d = v->domain;
     struct page_info *pg;
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
@@ -6560,8 +6561,9 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
     unmap_domain_page(l3tab);
 }
 
-void free_perdomain_mappings(struct domain *d)
+void free_perdomain_mappings(struct vcpu *v)
 {
+    struct domain *d = v->domain;
     l3_pgentry_t *l3tab;
     unsigned int i;
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index ca32e7b5d686..534d2899100f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -277,7 +277,7 @@ int switch_compat(struct domain *d)
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
+    return create_perdomain_mapping(v, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT, false);
 }
 
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 55bba7e473ae..3b421d218e0b 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -730,7 +730,7 @@ void __init zap_low_mappings(void)
 
 int setup_compat_arg_xlat(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    return create_perdomain_mapping(v, ARG_XLAT_START(v),
                                     PFN_UP(COMPAT_ARG_XLAT_SIZE), true);
 }
 
-- 
2.46.0


