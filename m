Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99B8C421F
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720932.1124044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vva-00057R-Hl; Mon, 13 May 2024 13:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720932.1124044; Mon, 13 May 2024 13:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vva-00052N-4v; Mon, 13 May 2024 13:41:18 +0000
Received: by outflank-mailman (input) for mailman id 720932;
 Mon, 13 May 2024 13:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvX-0002lY-PT
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:15 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7664c49f-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:13 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:12 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:6181]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.17:2525] with
 esmtp (Farcaster)
 id 87cd883e-f817-4cc7-8910-c7f435c3254b; Mon, 13 May 2024 13:41:10 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:09 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:08 +0000
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
X-Inumbo-ID: 7664c49f-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607674; x=1747143674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xc4KQdAGUonE6oCgkT6a8PPvVb9mrXzRPtcULUVgVPo=;
  b=ojZJtXKegTqOz/eknVhUo+p/2MSvIWki91nVL3RJ7naDfjNHsEquwVXv
   0vJa1dVqNFmhxKkK9ydQJGWxFUvK0ISLNyNyOLozC6kVoueoi1w1JjlXZ
   GIf/NtYgE2Ha8GgNK4xPJfzcEbXxIMXo6VwN9v5DPxpy6/4/Yoba+qWD5
   A=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="653770276"
X-Farcaster-Flow-ID: 87cd883e-f817-4cc7-8910-c7f435c3254b
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH V3 (resend) 09/19] x86/domain_page: Remove the fast paths when mfn is not in the directmap
Date: Mon, 13 May 2024 13:40:36 +0000
Message-ID: <20240513134046.82605-10-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

When mfn is not in direct map, never use mfn_to_virt for any mappings.

We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
arch_mfns_in_direct_map(mfn, 1) because these two are equivalent. The
extra comparison in arch_mfns_in_direct_map() looks different but because
DIRECTMAP_VIRT_END is always higher, it does not make any difference.

Lastly, domain_page_map_to_mfn() needs to gain to a special case for
the PMAP.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes since Hongyan's version:
        * arch_mfn_in_direct_map() was renamed to arch_mfns_in_directmap()
        * add a special case for the PMAP in domain_page_map_to_mfn()

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 55e337aaf7..89caefc8a2 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -14,8 +14,10 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 #include <asm/current.h>
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/hardirq.h>
+#include <asm/pmap.h>
 #include <asm/setup.h>
 
 static DEFINE_PER_CPU(struct vcpu *, override);
@@ -35,10 +37,11 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     /*
      * When using efi runtime page tables, we have the equivalent of the idle
      * domain's page tables but current may point at another domain's VCPU.
-     * Return NULL as though current is not properly set up yet.
+     * Return the idle domains's vcpu on that core because the efi per-domain
+     * region (where the mapcache is) is in-sync with the idle domain.
      */
     if ( efi_rs_using_pgtables() )
-        return NULL;
+        return idle_vcpu[smp_processor_id()];
 
     /*
      * If guest_table is NULL, and we are running a paravirtualised guest,
@@ -77,18 +80,24 @@ void *map_domain_page(mfn_t mfn)
     struct vcpu_maphash_entry *hashent;
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v )
-        return mfn_to_virt(mfn_x(mfn));
+    if ( !v || !v->domain->arch.mapcache.inuse )
+    {
+        if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
+            return mfn_to_virt(mfn_x(mfn));
+        else
+        {
+            BUG_ON(system_state >= SYS_STATE_smp_boot);
+            return pmap_map(mfn);
+        }
+    }
 
     dcache = &v->domain->arch.mapcache;
     vcache = &v->arch.mapcache;
-    if ( !dcache->inuse )
-        return mfn_to_virt(mfn_x(mfn));
 
     perfc_incr(map_domain_page_count);
 
@@ -184,6 +193,12 @@ void unmap_domain_page(const void *ptr)
     if ( !va || va >= DIRECTMAP_VIRT_START )
         return;
 
+    if ( va >= FIXADDR_START && va < FIXADDR_TOP )
+    {
+        pmap_unmap((void *)ptr);
+        return;
+    }
+
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
@@ -237,7 +252,7 @@ int mapcache_domain_init(struct domain *d)
     unsigned int bitmap_pages;
 
 #ifdef NDEBUG
-    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( !mem_hotplug && arch_mfn_in_directmap(0, max_page) )
         return 0;
 #endif
 
@@ -308,7 +323,7 @@ void *map_domain_page_global(mfn_t mfn)
             local_irq_is_enabled()));
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfn_in_directmap(mfn_x(mfn, 1)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
@@ -335,6 +350,23 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
     if ( va >= DIRECTMAP_VIRT_START )
         return _mfn(virt_to_mfn(ptr));
 
+    /*
+     * The fixmap is stealing the top-end of the VMAP. So the check for
+     * the PMAP *must* happen first.
+     *
+     * Also, the fixmap translate a slot to an address backwards. The
+     * logic will rely on it to avoid any complexity. So check at
+     * compile time this will always hold.
+    */
+    BUILD_BUG_ON(fix_to_virt(FIX_PMAP_BEGIN) < fix_to_virt(FIX_PMAP_END));
+
+    if ( ((unsigned long)fix_to_virt(FIX_PMAP_END) <= va) &&
+         ((va & PAGE_MASK) <= (unsigned long)fix_to_virt(FIX_PMAP_BEGIN)) )
+    {
+        BUG_ON(system_state >= SYS_STATE_smp_boot);
+        return l1e_get_mfn(l1_fixmap[l1_table_offset(va)]);
+    }
+
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
         return vmap_to_mfn(va);
 
-- 
2.40.1


