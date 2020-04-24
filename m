Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1F1B7837
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBc-0005CH-Su; Fri, 24 Apr 2020 14:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBb-0005C6-Qx
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:11 +0000
X-Inumbo-ID: b48f0997-8636-11ea-94b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b48f0997-8636-11ea-94b3-12813bfff9fa;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MuoSnDotjegD/IU7znqfvoq0uHwGPTkrgw7f3PEnI1Y=; b=xuA5mu6b8VNL589aA1Dry2Zr7c
 rLLViASjctGpaQ2FWRDrple3fV/d87zRCksnfmo+4OvQymTISmzDNAOdbdLq4BC0H5IDho41Q/hNO
 XZKWeBUqsT70ClXNZYnGxqNZslsJp4oh+XRb2WwX0MmJDtx2qbrlUoKZ6e+uG8FMjH8Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001xF-BL; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1N-0001fN-Vq; Fri, 24 Apr 2020 14:09:38 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 13/15] x86/mm: drop old page table APIs
Date: Fri, 24 Apr 2020 15:09:04 +0100
Message-Id: <d6a642544c5ce0b975cdab8ad054f7a348f17c8d.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
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

Two sets of old APIs, alloc/free_xen_pagetable() and lXe_to_lYe(), are
now dropped to avoid the dependency on direct map.

There are two special cases which still have not been re-written into
the new APIs, thus need special treatment:

rpt in smpboot.c cannot use ephemeral mappings yet. The problem is that
rpt is read and written in context switch code, but the mapping
infrastructure is NOT context-switch-safe, meaning we cannot map rpt in
one domain and unmap in another. Before the mapping infrastructure
supports context switches, rpt has to be globally mapped.

Also, lXe_to_lYe() during Xen image relocation cannot be converted into
map/unmap pairs. We cannot hold on to mappings while the mapping
infrastructure is being relocated! It is enough to remove the direct map
in the second e820 pass, so we still use the direct map (<4GiB) in Xen
relocation (which is during the first e820 pass).

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/mm.c          | 14 --------------
 xen/arch/x86/setup.c       |  4 ++--
 xen/arch/x86/smpboot.c     |  4 ++--
 xen/include/asm-x86/mm.h   |  2 --
 xen/include/asm-x86/page.h |  5 -----
 5 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e8c16027d8..749b6f23e5 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4913,20 +4913,6 @@ int mmcfg_intercept_write(
     return X86EMUL_OKAY;
 }
 
-void *alloc_xen_pagetable(void)
-{
-    mfn_t mfn = alloc_xen_pagetable_new();
-
-    return mfn_eq(mfn, INVALID_MFN) ? NULL : mfn_to_virt(mfn_x(mfn));
-}
-
-void free_xen_pagetable(void *v)
-{
-    mfn_t mfn = v ? virt_to_mfn(v) : INVALID_MFN;
-
-    free_xen_pagetable_new(mfn);
-}
-
 /*
  * For these PTE APIs, the caller must follow the alloc-map-unmap-free
  * lifecycle, which means explicitly mapping the PTE pages before accessing
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 885919d5c3..c76fbf80dc 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1114,7 +1114,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                     continue;
                 *pl4e = l4e_from_intpte(l4e_get_intpte(*pl4e) +
                                         xen_phys_start);
-                pl3e = l4e_to_l3e(*pl4e);
+                pl3e = __va(l4e_get_paddr(*pl4e));
                 for ( j = 0; j < L3_PAGETABLE_ENTRIES; j++, pl3e++ )
                 {
                     /* Not present, 1GB mapping, or already relocated? */
@@ -1124,7 +1124,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                         continue;
                     *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) +
                                             xen_phys_start);
-                    pl2e = l3e_to_l2e(*pl3e);
+                    pl2e = __va(l3e_get_paddr(*pl3e));
                     for ( k = 0; k < L2_PAGETABLE_ENTRIES; k++, pl2e++ )
                     {
                         /* Not present, PSE, or already relocated? */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0e0ae56c76..71d61794ec 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -815,7 +815,7 @@ static int setup_cpu_root_pgt(unsigned int cpu)
     if ( !opt_xpti_hwdom && !opt_xpti_domu )
         return 0;
 
-    rpt = alloc_xen_pagetable();
+    rpt = alloc_xenheap_page();
     if ( !rpt )
         return -ENOMEM;
 
@@ -919,7 +919,7 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
         free_xen_pagetable_new(l3mfn);
     }
 
-    free_xen_pagetable(rpt);
+    free_xenheap_page(rpt);
 
     /* Also zap the stub mapping for this CPU. */
     if ( stub_linear )
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 3d3f9d49ac..cf855b48fd 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -583,8 +583,6 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-void *alloc_xen_pagetable(void);
-void free_xen_pagetable(void *v);
 mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
 
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 8f711f4992..2e3056c08e 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -188,11 +188,6 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 #define l4e_has_changed(x,y,flags) \
     ( !!(((x).l4 ^ (y).l4) & ((PADDR_MASK&PAGE_MASK)|put_pte_flags(flags))) )
 
-/* Pagetable walking. */
-#define l2e_to_l1e(x)              ((l1_pgentry_t *)__va(l2e_get_paddr(x)))
-#define l3e_to_l2e(x)              ((l2_pgentry_t *)__va(l3e_get_paddr(x)))
-#define l4e_to_l3e(x)              ((l3_pgentry_t *)__va(l4e_get_paddr(x)))
-
 #define map_l1t_from_l2e(x)        (l1_pgentry_t *)map_domain_page(l2e_get_mfn(x))
 #define map_l2t_from_l3e(x)        (l2_pgentry_t *)map_domain_page(l3e_get_mfn(x))
 #define map_l3t_from_l4e(x)        (l3_pgentry_t *)map_domain_page(l4e_get_mfn(x))
-- 
2.24.1.AMZN


