Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B064EB4B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464568.723031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69en-00081h-Tc; Fri, 16 Dec 2022 12:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464568.723031; Fri, 16 Dec 2022 12:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69en-0007rW-DE; Fri, 16 Dec 2022 12:17:41 +0000
Received: by outflank-mailman (input) for mailman id 464568;
 Fri, 16 Dec 2022 12:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007LX-Sv
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00034K-Pm; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DI-0004sN-5A; Fri, 16 Dec 2022 11:49:16 +0000
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
	bh=jom7H6x2BCLQ18RtIk9fRFrou3zZPb9ESzutK4ktU4s=; b=2RyXYNdTUX810VURPQvYrG93Xp
	8Whz/cVeKcjuD7pbldeGloSA2ysSekiJM9OjXO77IdzmxUwxtEXNwq6XqXjaDQZhp9d4eDFBE6ole
	LBNuWArzLaEXMv1bennufkSv8TDnBYdMsYTqzFtbPDkLrBtYidoYd2g0XlI6hKpw61aI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 14/22] x86/domain_page: remove the fast paths when mfn is not in the directmap
Date: Fri, 16 Dec 2022 11:48:45 +0000
Message-Id: <20221216114853.8227-15-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 xen/arch/x86/domain_page.c | 50 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 55e337aaf703..89caefc8a210 100644
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
2.38.1


