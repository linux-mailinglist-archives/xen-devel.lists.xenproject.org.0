Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B31C0879
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG3K-0002zB-RN; Thu, 30 Apr 2020 20:45:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG3J-0002yJ-F3
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:45:01 +0000
X-Inumbo-ID: 701ee8de-8b23-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 701ee8de-8b23-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wgpps+8lZONEwS5fLM70YV18IA19BevUWAZAtXCq3Wg=; b=Tycjx5YewosH0ZNVQ/Ai+rio1p
 sRQC/0oEorEhrqHDpNUyb9p7BJo/des8e7rOv6UuFAfSP9+nIxTNe0FT2TZOw/7qlW1ZM/tx/tpCt
 dxmMkwXkZfljbUe+crVha8JlCQBA/jA1mlUxFRaEyFHFQVfEZLa/IxXcjmxxA+vDI6PE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG38-0004Lq-Dy; Thu, 30 Apr 2020 20:44:50 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG38-0005wj-4w; Thu, 30 Apr 2020 20:44:50 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 09/16] x86: lift mapcache variable to the arch level
Date: Thu, 30 Apr 2020 21:44:18 +0100
Message-Id: <0794bccd94b7613dafab85ecc30a832229af7997.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

It is going to be needed by HVM and idle domain as well, because without
the direct map, both need a mapcache to map pages.

This only lifts the mapcache variable up. Whether we populate the
mapcache for a domain is unchanged in this patch.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/domain.c        |  4 ++--
 xen/arch/x86/domain_page.c   | 22 ++++++++++------------
 xen/include/asm-x86/domain.h | 12 ++++++------
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a4428190d5..e73f1efe85 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -634,6 +634,8 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
+    mapcache_domain_init(d);
+
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d)) != 0 )
@@ -641,8 +643,6 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        mapcache_domain_init(d);
-
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
     }
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 3a244bb500..7b22e7c6ed 100644
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
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 5b6d909266..1cee04c0c5 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -271,9 +271,6 @@ struct pv_domain
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
 
-    /* map_domain_page() mapping cache. */
-    struct mapcache_domain mapcache;
-
     struct cpuidmasks *cpuidmasks;
 };
 
@@ -306,6 +303,9 @@ struct arch_domain
     uint32_t pci_cf8;
     uint8_t cmos_idx;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_domain mapcache;
+
     union {
         struct pv_domain pv;
         struct hvm_domain hvm;
@@ -482,9 +482,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -567,6 +564,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-- 
2.24.1.AMZN


