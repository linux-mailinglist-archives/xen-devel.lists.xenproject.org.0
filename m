Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E8A05FDA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867483.1279040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXps-0000gb-Ik; Wed, 08 Jan 2025 15:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867483.1279040; Wed, 08 Jan 2025 15:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXps-0000YG-Ee; Wed, 08 Jan 2025 15:19:08 +0000
Received: by outflank-mailman (input) for mailman id 867483;
 Wed, 08 Jan 2025 15:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpq-0008Lg-H6
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63db730-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa69107179cso2812353366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:05 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:04 -0800 (PST)
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
X-Inumbo-ID: e63db730-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349545; x=1736954345; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YsfPYnnI6FWUYgHfjtYUL/QekhFikCxvRDQSMOAmr4=;
        b=CP3lwKLnbK8m7BwkCP6XQHqCxwhpL2tmYCLq2a8Q+TVguTyR5aMDjO1Xs70puHmLWx
         GRQ0T20vQ2vQsbByyrEvGojbEA8gljByCgOtIYNpjuMGMrMhlfWvmryIw7t4YS0yjA8K
         ZU43p05ieyVX06KRjiKLvQBrf6K28UmvwU19Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349545; x=1736954345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YsfPYnnI6FWUYgHfjtYUL/QekhFikCxvRDQSMOAmr4=;
        b=A8Eo6oF0eChv+iKtFS14M2zuTVF9XwX8tNBFhF6XrkWjbXo69/DlW3QURtF2I7KT5i
         IzhyYZrltDx/b1+sAlruiGHzyf5Y7m+j5cmv7OQOwglmbY71eXzVdVcvBH0nP/RFS1XW
         OABLtKlTxZ8L5bPmby4Drqkri/iwXNAptnhu0maNPeB3T+3SHv7fcjZi1p1Xs/RehNU7
         +cxPbwODZbGIkVpmBx44Tl+EAzMmZpy74yhq6KTXUChgH1rV/cXGOJWSno80EPtFYg2j
         4MR69NHPMLe8GndQllwdh+Ng9cwAb2/574isjEk8qLMapkU1W0iwoKn0EQh0cupa+ihl
         oZtQ==
X-Gm-Message-State: AOJu0Yye+YXNmEu7WpjbtyIVzwLMNRLw4iFwBbvsUF+XU0l9vVqHEBGs
	UzcZzd1xvDp0RyxW1Iz0Sb7FvFmu+t0+UoJkNu59SISgvp7FCX7605AztIUugiSI8XGJkAn+Li4
	QFiGnHw==
X-Gm-Gg: ASbGncuhskvXfBFQIDYKTzncA50EMdEEIrZdbboeBYWvCUQNSegRsHddKGtvSYKPuJA
	Xkcyqp/Z3IRIM7FRDnny/O133WHggRRl6OGE9cfIceeelHk8RoABlmvgYEQEZhi956gfDN/zMIw
	kbNFPMxh0tyL+8sZDCLw0bQYQKNgaaNHN/AqNp1qLFzpveDht1agpbnMVclDn71fVPkcXh2o7zw
	UkZD7gWe2w2lGjwDhbLDn+76Kc6C5J9k1/5ixDjALxckAioRBdlOGWhaTFHSZ+C9gquD/bNofmI
	kNY=
X-Google-Smtp-Source: AGHT+IEUj4gOUwHUn/rIAicijRfStFxoaCwoTk6QHyfvmCd+pbRo3s4LpEwHMg36vX8h3/K60AU/og==
X-Received: by 2002:a17:907:3da1:b0:aaf:3f57:9d2e with SMTP id a640c23a62f3a-ab2aaaf6571mr264290166b.0.1736349544953;
        Wed, 08 Jan 2025 07:19:04 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Wang <wawei@amazon.de>,
	Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 04/15] x86: Initialize mapcache for PV, HVM, and idle domains
Date: Wed,  8 Jan 2025 15:18:11 +0000
Message-ID: <20250108151822.16030-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

To support the transition away from the direct map, the mapcache will
now be used by HVM and idle domains as well. This patch lifts the
`mapcache` to the arch level and moves its initialization to
`arch_domain_create()`.

For the idle domain to utilize the mapcache, this patch also populates
the mapcache page tables within the `PERDOMAIN` region and adjusts the
initialization sequence in `arch_idle_init()`, as it's no longer covered
by `arch_domain_create()`

With this change, mapcache initialization is now unified across all
domain types—PV, HVM, and idle.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Move mapcache initialization and cleanup back to arch-specific
    code and reword commit message to reflect it. Since v3, the idle
    domain gained its own arch-init function, so initialise the mapcache
    there instead. Panic on failure to initialise it for the idle
    domain, as there's no possible recovery.

v2->v4:
  * Reword the commit message
  * Rebase it on top of staging
  * The logic for the creation of the domain has been reworked
    so introduced #ifdef CONFIG_X86 in the common code to
    initialise the mapcache

v1->v2:
  * Free resources if mapcache initialisation fails
  * Remove `is_idle_domain()` check from `create_perdomain_mappings()`
---
 xen/arch/x86/domain.c             | 13 ++++++++++---
 xen/arch/x86/domain_page.c        | 22 ++++++++++------------
 xen/arch/x86/include/asm/domain.h | 12 ++++++------
 3 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..307ec0f11fed 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -777,6 +777,12 @@ void __init arch_init_idle_domain(struct domain *d)
     };
 
     d->arch.ctxt_switch = &idle_csw;
+
+    BUG_ON(mapcache_domain_init(d));
+
+    /* Slot 260: Per-domain mappings. */
+    idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
+        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 }
 
 int arch_domain_create(struct domain *d,
@@ -832,6 +838,10 @@ int arch_domain_create(struct domain *d,
 
     spec_ctrl_init_domain(d);
 
+    rc = mapcache_domain_init(d);
+    if ( rc )
+        goto fail;
+
     if ( (rc = paging_domain_init(d)) != 0 )
         goto fail;
     paging_initialised = true;
@@ -870,9 +880,6 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        if ( (rc = mapcache_domain_init(d)) != 0 )
-            goto fail;
-
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
     }
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304fb8..55e337aaf703 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -82,11 +82,11 @@ void *map_domain_page(mfn_t mfn)
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v || !is_pv_vcpu(v) )
+    if ( !v )
         return mfn_to_virt(mfn_x(mfn));
 
-    dcache = &v->domain->arch.pv.mapcache;
-    vcache = &v->arch.pv.mapcache;
+    dcache = &v->domain->arch.mapcache;
+    vcache = &v->arch.mapcache;
     if ( !dcache->inuse )
         return mfn_to_virt(mfn_x(mfn));
 
@@ -187,14 +187,14 @@ void unmap_domain_page(const void *ptr)
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
-    ASSERT(v && is_pv_vcpu(v));
+    ASSERT(v);
 
-    dcache = &v->domain->arch.pv.mapcache;
+    dcache = &v->domain->arch.mapcache;
     ASSERT(dcache->inuse);
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
-    hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
+    hashent = &v->arch.mapcache.hash[MAPHASH_HASHFN(mfn)];
 
     local_irq_save(flags);
 
@@ -233,11 +233,9 @@ void unmap_domain_page(const void *ptr)
 
 int mapcache_domain_init(struct domain *d)
 {
-    struct mapcache_domain *dcache = &d->arch.pv.mapcache;
+    struct mapcache_domain *dcache = &d->arch.mapcache;
     unsigned int bitmap_pages;
 
-    ASSERT(is_pv_domain(d));
-
 #ifdef NDEBUG
     if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return 0;
@@ -261,12 +259,12 @@ int mapcache_domain_init(struct domain *d)
 int mapcache_vcpu_init(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    struct mapcache_domain *dcache = &d->arch.pv.mapcache;
+    struct mapcache_domain *dcache = &d->arch.mapcache;
     unsigned long i;
     unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
     unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
 
-    if ( !is_pv_vcpu(v) || !dcache->inuse )
+    if ( !dcache->inuse )
         return 0;
 
     if ( ents > dcache->entries )
@@ -293,7 +291,7 @@ int mapcache_vcpu_init(struct vcpu *v)
     BUILD_BUG_ON(MAPHASHENT_NOTINUSE < MAPCACHE_ENTRIES);
     for ( i = 0; i < MAPHASH_ENTRIES; i++ )
     {
-        struct vcpu_maphash_entry *hashent = &v->arch.pv.mapcache.hash[i];
+        struct vcpu_maphash_entry *hashent = &v->arch.mapcache.hash[i];
 
         hashent->mfn = ~0UL; /* never valid to map */
         hashent->idx = MAPHASHENT_NOTINUSE;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b5a14991ca0b..470192646b50 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -287,9 +287,6 @@ struct pv_domain
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
 
-    /* map_domain_page() mapping cache. */
-    struct mapcache_domain mapcache;
-
     struct cpuidmasks *cpuidmasks;
 };
 
@@ -328,6 +325,9 @@ struct arch_domain
 
     uint8_t scf; /* See SCF_DOM_MASK */
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_domain mapcache;
+
     union {
         struct pv_domain pv;
         struct hvm_domain hvm;
@@ -518,9 +518,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -614,6 +611,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-- 
2.47.1


