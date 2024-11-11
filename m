Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56749C3F64
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833731.1248951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDC-0008KV-L3; Mon, 11 Nov 2024 13:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833731.1248951; Mon, 11 Nov 2024 13:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDC-0008IY-HU; Mon, 11 Nov 2024 13:12:10 +0000
Received: by outflank-mailman (input) for mailman id 833731;
 Mon, 11 Nov 2024 13:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDB-0008Hn-Cv
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:09 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c45a329-a02e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:12:06 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:03 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.44.209:54712]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.85.229:2525]
 with esmtp (Farcaster)
 id de6160ee-520b-4d69-b6a4-ec18ab5288c7; Mon, 11 Nov 2024 13:12:02 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:02 +0000
Received: from EX19MTAUWA002.ant.amazon.com (10.250.64.202) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:01 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:01 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 293DA42116; Mon, 11 Nov 2024 13:12:00 +0000 (UTC)
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
X-Inumbo-ID: 8c45a329-a02e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjExOS4yMTMuMTUwIiwiaGVsbyI6InNtdHAtZnctNTIwMDIuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjhjNDVhMzI5LWEwMmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMwNzI2LjU4OTYyLCJzZW5kZXIiOiJwcnZzPTAzOGQyNmQwYz1lbGlhc2VseUBhbWF6b24uY28udWsiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330726; x=1762866726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0qBSENfwgqkU95D4y/S6zHGmXrylZ30lTrQ15I4hHT8=;
  b=Ja9giNNfVZ0R9geoVcyvCZtt6oK/GBnykRvhM15+qV1IDdgT7CQYGoln
   buJKEh5d8DeCNq/kswFRXYPmr6pBGCtMUUS0z36Q4mOQnTAj+aDk0SmYK
   bWuBBUgSybjeHw7SFklsNSU5U2WyFpZc42jZd7IwuTGL7BPapdIuTFEGA
   0=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="673030954"
X-Farcaster-Flow-ID: de6160ee-520b-4d69-b6a4-ec18ab5288c7
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Wei Wang <wawei@amazon.de>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 04/15] x86: Initialize mapcache for PV, HVM, and idle domains
Date: Mon, 11 Nov 2024 13:11:37 +0000
Message-ID: <20241111131148.52568-5-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

To support the transition away from the direct map, the mapcache will now
be used by HVM and idle domains as well. This patch lifts the `mapcache`
to the arch level and moves its initialization earlier in
`arch_domain_create()` to cover PV, HVM, and idle domains.

For the idle domain to utilize the mapcache, this patch also populates the
mapcache page tables within the `PERDOMAIN` region and adjusts the
initialization sequence.

With this change, mapcache initialization is now unified across all domain
types—PV, HVM, and idle.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

	Changes in V4:
        * Reword the commit message
        * Rebase it on top of staging
            * The logic for the creation of the domain has been reworked
              so introduced #ifdef CONFIG_X86 in the common code to
              initialise the mapcache

	Changes in V2:
        * Free resources if mapcache initialisation fails
        * Remove `is_idle_domain()` check from `create_perdomain_mappings()`

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..38338f519dea 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -777,6 +777,10 @@ void __init arch_init_idle_domain(struct domain *d)
     };
 
     d->arch.ctxt_switch = &idle_csw;
+
+    /* Slot 260: Per-domain mappings. */
+    idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
+        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 }
 
 int arch_domain_create(struct domain *d,
@@ -870,9 +874,6 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        if ( (rc = mapcache_domain_init(d)) != 0 )
-            goto fail;
-
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
     }
@@ -909,7 +910,6 @@ int arch_domain_create(struct domain *d,
     XFREE(d->arch.cpu_policy);
     if ( paging_initialised )
         paging_final_teardown(d);
-    free_perdomain_mappings(d);
 
     return rc;
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
index 478ce41ad8ca..b0fd477c62e7 100644
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
@@ -612,6 +609,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbdc5..a7f4929b5893 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -738,6 +738,11 @@ struct domain *domain_create(domid_t domid,
 
     rangeset_domain_initialise(d);
 
+#ifdef CONFIG_X86
+    if ( (err = mapcache_domain_init(d)) != 0)
+        goto fail;
+#endif
+
     if ( is_idle_domain(d) )
         arch_init_idle_domain(d);
 
@@ -820,6 +825,10 @@ struct domain *domain_create(domid_t domid,
     ASSERT(err < 0);      /* Sanity check paths leading here. */
     err = err ?: -EILSEQ; /* Release build safety. */
 
+#ifdef CONFIG_X86
+    free_perdomain_mappings(d);
+#endif
+
     d->is_dying = DOMDYING_dead;
     if ( hardware_domain == d )
         hardware_domain = old_hwdom;
-- 
2.40.1


