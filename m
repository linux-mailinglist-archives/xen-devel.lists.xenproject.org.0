Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A29C3F5C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833734.1248973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDF-0000On-P9; Mon, 11 Nov 2024 13:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833734.1248973; Mon, 11 Nov 2024 13:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDF-0000IQ-HP; Mon, 11 Nov 2024 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 833734;
 Mon, 11 Nov 2024 13:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDE-0008Hn-3X
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:12 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e6e21ab-a02e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:12:09 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:08 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.44.209:28838]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.85.229:2525]
 with esmtp (Farcaster)
 id b5db991d-c68a-4314-862b-724dabdd02bc; Mon, 11 Nov 2024 13:12:07 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:06 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:05 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:05 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 3973642133; Mon, 11 Nov 2024 13:12:04 +0000 (UTC)
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
X-Inumbo-ID: 8e6e21ab-a02e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjExOS4yMTMuMTUwIiwiaGVsbyI6InNtdHAtZnctNTIwMDIuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjhlNmUyMWFiLWEwMmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMwNzI5LjQ3ODI1NSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330729; x=1762866729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WkU261d4pu53Tt8wU35o8tACxmmEX0Gg0p1NAEG+StY=;
  b=sc838DbwndjAUygWlYlRX0OHKnSiuh78/7iQ9QCvEP0Glv1UdgecazZi
   Np8s79vz/2PothxiM3edRxj3i5hbY35frQ4VBYG3cxbH3QpyDnk5Rhkz/
   2FF13E8J+FP5x3Rm0Xf/DYx+XWVXboD0JsDGyHZ3Hfv9seJudKhkEO5Et
   s=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="673030962"
X-Farcaster-Flow-ID: b5db991d-c68a-4314-862b-724dabdd02bc
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH V4 07/15] x86/domain_page: Remove the fast paths when mfn is not in the directmap
Date: Mon, 11 Nov 2024 13:11:40 +0000
Message-ID: <20241111131148.52568-8-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
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

    Changes in v4:
        * Introduce helper functions virt_is_fixmap and virt_in_fixmap_range

    Changes since Hongyan's version:
        * arch_mfn_in_direct_map() was renamed to arch_mfns_in_directmap()
        * add a special case for the PMAP in domain_page_map_to_mfn()

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 55e337aaf703..df7d4750ef05 100644
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
@@ -24,6 +26,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
 {
     /* In the common case we use the mapcache of the running VCPU. */
     struct vcpu *v = this_cpu(override) ?: current;
+    struct vcpu *idle_v = idle_vcpu[smp_processor_id()];
 
     /*
      * When current isn't properly set up yet, this is equivalent to
@@ -35,10 +38,11 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     /*
      * When using efi runtime page tables, we have the equivalent of the idle
      * domain's page tables but current may point at another domain's VCPU.
-     * Return NULL as though current is not properly set up yet.
+     * Return the idle domains's vcpu on that core because the efi per-domain
+     * region (where the mapcache is) is in-sync with the idle domain.
      */
     if ( efi_rs_using_pgtables() )
-        return NULL;
+        return idle_v;
 
     /*
      * If guest_table is NULL, and we are running a paravirtualised guest,
@@ -48,7 +52,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     if ( unlikely(pagetable_is_null(v->arch.guest_table)) && is_pv_vcpu(v) )
     {
         /* If we really are idling, perform lazy context switch now. */
-        if ( (v = idle_vcpu[smp_processor_id()]) == current )
+        if ( (v = idle_v) == current )
             sync_local_execstate();
         /* We must now be running on the idle page table. */
         ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
@@ -77,18 +81,24 @@ void *map_domain_page(mfn_t mfn)
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
 
@@ -184,6 +194,12 @@ void unmap_domain_page(const void *ptr)
     if ( !va || va >= DIRECTMAP_VIRT_START )
         return;
 
+    if ( virt_is_fixmap(va) )
+    {
+        pmap_unmap(ptr);
+        return;
+    }
+
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
@@ -237,7 +253,7 @@ int mapcache_domain_init(struct domain *d)
     unsigned int bitmap_pages;
 
 #ifdef NDEBUG
-    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( !mem_hotplug && arch_mfn_in_directmap(0, max_page) )
         return 0;
 #endif
 
@@ -308,7 +324,7 @@ void *map_domain_page_global(mfn_t mfn)
             local_irq_is_enabled()));
 
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfn_in_directmap(mfn_x(mfn, 1)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
@@ -335,6 +351,22 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
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
+    if ( virt_in_fixmap_range(va, FIX_PMAP_BEGIN, FIX_PMAP_END) )
+    {
+        BUG_ON(system_state >= SYS_STATE_smp_boot);
+        return l1e_get_mfn(l1_fixmap[l1_table_offset(va)]);
+    }
+
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
         return vmap_to_mfn(va);
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 80b7b74fd816..381c95a8b11f 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -101,6 +101,31 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
     return __virt_to_fix(vaddr);
 }
 
+static inline bool virt_is_fixmap(const unsigned long vaddr)
+{
+    return vaddr >= FIXADDR_START && vaddr < FIXADDR_TOP;
+}
+
+static inline bool virt_in_fixmap_range(
+    const unsigned long vaddr,
+    const unsigned int start_idx,
+    const unsigned int end_idx
+)
+{
+    unsigned long start_addr = (unsigned long)fix_to_virt(start_idx);
+    unsigned long end_addr = (unsigned long)fix_to_virt(end_idx);
+
+    /*
+     * The check ensures that the virtual address (vaddr) is within the
+     * fixmap range. The addresses are allocated backwards, meaning the
+     * start address is higher than the end address. As a result, the
+     * check ensures that the virtual address is greater than or equal to
+     * the end address, and less than or equal to the start address, which
+     * may appear counterintuitive due to the reverse allocation order.
+     */
+    return ((vaddr & PAGE_MASK) <= start_addr) && (vaddr >= end_addr);
+}
+
 enum fixed_addresses_x {
     /* Index 0 is reserved since fix_x_to_virt(0) == FIXADDR_X_TOP. */
     FIX_X_RESERVED,
-- 
2.40.1


