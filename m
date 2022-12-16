Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C964EADD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464437.722912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DE-0006DS-Ny; Fri, 16 Dec 2022 11:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464437.722912; Fri, 16 Dec 2022 11:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DE-00067z-J5; Fri, 16 Dec 2022 11:49:12 +0000
Received: by outflank-mailman (input) for mailman id 464437;
 Fri, 16 Dec 2022 11:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69DC-0005eC-8L
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DB-0002Fb-VD; Fri, 16 Dec 2022 11:49:09 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DB-0004sN-Nv; Fri, 16 Dec 2022 11:49:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jcJSzXwZRVoOaBWM+hzG4J8upiEWzEuSM93VyqeBx/0=; b=o85LFLbRuZU3OMGlbhFEtltkQN
	xQpfoMDz0l9IiFoY5MDxE/T+Ir+eoSLmshFsqAmRWlm5CIX5m2J6YWsriPoW4L0vTOnhKfv6tkWsR
	bMyF2to9Zl3/o2IaFVNp3oC7mjAY2K6AbWbpySC0oucxSjfXXoSdrMzUa2sX8xvzFa3A=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Wei Wang <wawei@amazon.de>,
	Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 09/22] x86: lift mapcache variable to the arch level
Date: Fri, 16 Dec 2022 11:48:40 +0000
Message-Id: <20221216114853.8227-10-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

It is going to be needed by HVM and idle domain as well, because without
the direct map, both need a mapcache to map pages.

This only lifts the mapcache variable up. Whether we populate the
mapcache for a domain is unchanged in this patch.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/domain.c             |  4 ++--
 xen/arch/x86/domain_page.c        | 22 ++++++++++------------
 xen/arch/x86/include/asm/domain.h | 12 ++++++------
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d7a8237f01ab..069b7d2af330 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -829,6 +829,8 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
+    mapcache_domain_init(d);
+
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
@@ -836,8 +838,6 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        mapcache_domain_init(d);
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
index 43ace233d75e..eb548eb10efe 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -285,9 +285,6 @@ struct pv_domain
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
 
-    /* map_domain_page() mapping cache. */
-    struct mapcache_domain mapcache;
-
     struct cpuidmasks *cpuidmasks;
 };
 
@@ -326,6 +323,9 @@ struct arch_domain
 
     uint8_t spec_ctrl_flags; /* See SCF_DOM_MASK */
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_domain mapcache;
+
     union {
         struct pv_domain pv;
         struct hvm_domain hvm;
@@ -508,9 +508,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -610,6 +607,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-- 
2.38.1


