Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7011C0890
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG8f-0004Z0-Hs; Thu, 30 Apr 2020 20:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG8d-0004YD-Sn
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:50:31 +0000
X-Inumbo-ID: 2ef3fdc6-8b24-11ea-9ab3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ef3fdc6-8b24-11ea-9ab3-12813bfff9fa;
 Thu, 30 Apr 2020 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pf2FpaoK+GE72TCueex6j/niFJJvks21euODf44DpKQ=; b=myk0BmGzVF8fak/lksv7yEF7pT
 Mp4P90HlVzy+aldv4qpMsqb3GS79SKDnwbvhBvYs9haauxpfTXMD/J+xFHgXBS95YqVnglhAUQl0I
 lHqbeROnHMkm1cgsVEMu1bymFqhvS+dfVuYXNAgcyzdqOPhLSnvtQBDSsysu/+0vsqJ4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG8I-0004Uh-QR; Thu, 30 Apr 2020 20:50:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG3C-0005wj-Vj; Thu, 30 Apr 2020 20:44:55 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 12/16] x86/domain_page: remove the fast paths when mfn is not
 in the directmap
Date: Thu, 30 Apr 2020 21:44:21 +0100
Message-Id: <72c1d30ea95756ff6c8e14b084d7dd2e74b83043.1588278317.git.hongyxia@amazon.com>
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

From: Hongyan Xia <hongyxia@amazon.com>

When mfn is not in direct map, never use mfn_to_virt for any mappings.

We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
arch_mfn_in_direct_map(mfn) because these two are equivalent. The
extra comparison in arch_mfn_in_direct_map() looks different but because
DIRECTMAP_VIRT_END is always higher, it does not make any difference.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/domain_page.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 7b22e7c6ed..fc705f056e 100644
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
+    if ( arch_mfn_in_directmap(mfn_x(mfn)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v )
-        return mfn_to_virt(mfn_x(mfn));
+    if ( !v || !v->domain->arch.mapcache.inuse )
+    {
+        if ( arch_mfn_in_directmap(mfn_x(mfn)) )
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
     if ( va >= DIRECTMAP_VIRT_START )
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
+    if ( !mem_hotplug && arch_mfn_in_directmap(max_page) )
         return 0;
 #endif
 
@@ -308,7 +323,7 @@ void *map_domain_page_global(mfn_t mfn)
             local_irq_is_enabled()));
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfn_in_directmap(mfn_x(mfn)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
-- 
2.24.1.AMZN


