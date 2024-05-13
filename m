Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE88C3F7C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720807.1123755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tau-0003xE-Fj; Mon, 13 May 2024 11:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720807.1123755; Mon, 13 May 2024 11:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tau-0003up-CQ; Mon, 13 May 2024 11:11:48 +0000
Received: by outflank-mailman (input) for mailman id 720807;
 Mon, 13 May 2024 11:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tas-0003MC-8y
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:11:46 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 950fd354-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:11:45 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:43 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:45873]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.83.223:2525]
 with esmtp (Farcaster)
 id 736196f1-3ae1-401f-9856-bbbafdb52cd2; Mon, 13 May 2024 11:11:42 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:36 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:36 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:35 +0000
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
X-Inumbo-ID: 950fd354-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598706; x=1747134706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=asW3riQLlEfjH7OhZSjftd0GSOA/iaeDlEAWCyKlviw=;
  b=peW9GTg2yc7m5eRRxKAxWXd9GLGmCCT0K5GBFZHirpAeagQTRgYIjww6
   9AWZQ74UHVXv8QMqfBu38tt4eWf5+KSCHLXDLfrwsv5avDJFpezcykZC9
   zdOjr6Kavncv+CARdTWWOVfTg7VF5eCcXw87y87WUNDRAFZeD2iPhZ1xx
   Y=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="658281373"
X-Farcaster-Flow-ID: 736196f1-3ae1-401f-9856-bbbafdb52cd2
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Wei Wang <wawei@amazon.de>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH V3 04/19] x86: Lift mapcache variable to the arch level
Date: Mon, 13 May 2024 11:11:02 +0000
Message-ID: <20240513111117.68828-5-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Wei Liu <wei.liu2@citrix.com>

It is going to be needed by HVM and idle domain as well, because without
the direct map, both need a mapcache to map pages.

This commit lifts the mapcache variable up and initialise it a bit earlier
for PV and HVM domains.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38b..507d704f16 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -851,6 +851,8 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
+    mapcache_domain_init(d);
+
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
@@ -858,8 +860,6 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        mapcache_domain_init(d);
-
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
     }
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304f..55e337aaf7 100644
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
index 8a97530607..7f0480d7a7 100644
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
 
     uint8_t scf; /* See SCF_DOM_MASK */
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_domain mapcache;
+
     union {
         struct pv_domain pv;
         struct hvm_domain hvm;
@@ -516,9 +516,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -618,6 +615,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-- 
2.40.1


