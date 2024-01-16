Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A8A82F54C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668088.1040052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp57-0005Vq-U4; Tue, 16 Jan 2024 19:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668088.1040052; Tue, 16 Jan 2024 19:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp57-0005MW-Bx; Tue, 16 Jan 2024 19:26:41 +0000
Received: by outflank-mailman (input) for mailman id 668088;
 Tue, 16 Jan 2024 19:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp54-0002iI-7M
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:38 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 291ce992-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:36 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:34 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com (Postfix)
 with ESMTPS id DA6CEA0786; Tue, 16 Jan 2024 19:26:33 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com [10.0.0.204:53301]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id c4ea0858-a181-498a-b9e5-5a7364e4b9d8; Tue, 16 Jan 2024 19:26:33 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:29 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:29 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 291ce992-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433196; x=1736969196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dpcwsrxvbe9T9hoTCd3fMKYWwbTAEp7kfzrhfuwZSAw=;
  b=HrUtGVMS8rkpFHNHM+OEnP8idThelxNKdXx+SpQg9rpAwjr5YOVFJ/H0
   cfyUx36ZyaqUwEO2CqONPOWNiaplyzg+EiopIy8ruHuskOVo9wA3K+ACP
   zypbvy5+jTrjiScFRupNH+HATWavRsFl3iYAm8GVWxAlH+qcr0FtCps8o
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58701489"
X-Farcaster-Flow-ID: c4ea0858-a181-498a-b9e5-5a7364e4b9d8
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
	Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 (resend) 11/27] x86: Lift mapcache variable to the arch level
Date: Tue, 16 Jan 2024 19:25:55 +0000
Message-ID: <20240116192611.41112-12-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Wei Liu <wei.liu2@citrix.com>

It is going to be needed by HVM and idle domain as well, because without
the direct map, both need a mapcache to map pages.

This only lifts the mapcache variable up. Whether we populate the
mapcache for a domain is unchanged in this patch.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8a31d18f69..8ef3f7746f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -843,6 +843,8 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
+    mapcache_domain_init(d);
+
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
@@ -850,8 +852,6 @@ int arch_domain_create(struct domain *d,
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
index 4d97c68028..85b890b2cb 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -286,9 +286,6 @@ struct pv_domain
     /* Mitigate L1TF with shadow/crashing? */
     bool check_l1tf;
 
-    /* map_domain_page() mapping cache. */
-    struct mapcache_domain mapcache;
-
     struct cpuidmasks *cpuidmasks;
 };
 
@@ -327,6 +324,9 @@ struct arch_domain
 
     uint8_t spec_ctrl_flags; /* See SCF_DOM_MASK */
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_domain mapcache;
+
     union {
         struct pv_domain pv;
         struct hvm_domain hvm;
@@ -517,9 +517,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -619,6 +616,9 @@ struct arch_vcpu
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


