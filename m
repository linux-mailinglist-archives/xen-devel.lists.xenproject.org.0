Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0019F1E7BCC
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:29:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedCp-0007iS-RN; Fri, 29 May 2020 11:29:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jedCo-0007i1-IT
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:29:42 +0000
X-Inumbo-ID: aaa08e44-a19f-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaa08e44-a19f-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2o9JVrYNzYpbIDhDtoJt6aTVVTe+wwF1KohL4X9QeEI=; b=UUmeVUHBq3KFFYf6JCLtTyrDHe
 OZC9zxH5tLQ2pjF700HYmblMl5iNoFMqxydO6LfCdZcP1HWWK3hkwe4dzvYrEDWT4NHmqA7Y/eRcR
 h98KKJDMn3GWQ9t7Aa5KKQg0xE9IJIdWvj79DIwi152wN0tlPkWTqWeh1KoEsMgKBWlc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jedCd-0002TI-RP; Fri, 29 May 2020 11:29:31 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw9-0006tM-9R; Fri, 29 May 2020 11:12:29 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 13/15] x86/mm: drop old page table APIs
Date: Fri, 29 May 2020 12:11:57 +0100
Message-Id: <cb75e682b8597828b46bcbd79ee3aadeba6ebf53.1590750232.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c          | 14 --------------
 xen/arch/x86/setup.c       |  4 ++--
 xen/arch/x86/smpboot.c     |  4 ++--
 xen/include/asm-x86/mm.h   |  2 --
 xen/include/asm-x86/page.h |  5 -----
 5 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 26694e2f30..38cfa3ce25 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4908,20 +4908,6 @@ int mmcfg_intercept_write(
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
index 2dec7a3fc6..b08b69ff5d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1190,7 +1190,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                     continue;
                 *pl4e = l4e_from_intpte(l4e_get_intpte(*pl4e) +
                                         xen_phys_start);
-                pl3e = l4e_to_l3e(*pl4e);
+                pl3e = __va(l4e_get_paddr(*pl4e));
                 for ( j = 0; j < L3_PAGETABLE_ENTRIES; j++, pl3e++ )
                 {
                     /* Not present, 1GB mapping, or already relocated? */
@@ -1200,7 +1200,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                         continue;
                     *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) +
                                             xen_phys_start);
-                    pl2e = l3e_to_l2e(*pl3e);
+                    pl2e = __va(l3e_get_paddr(*pl3e));
                     for ( k = 0; k < L2_PAGETABLE_ENTRIES; k++, pl2e++ )
                     {
                         /* Not present, PSE, or already relocated? */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 186211ccc9..9cdf198fd6 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -808,7 +808,7 @@ static int setup_cpu_root_pgt(unsigned int cpu)
     if ( !opt_xpti_hwdom && !opt_xpti_domu )
         return 0;
 
-    rpt = alloc_xen_pagetable();
+    rpt = alloc_xenheap_page();
     if ( !rpt )
         return -ENOMEM;
 
@@ -912,7 +912,7 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
         free_xen_pagetable_new(l3mfn);
     }
 
-    free_xen_pagetable(rpt);
+    free_xenheap_page(rpt);
 
     /* Also zap the stub mapping for this CPU. */
     if ( stub_linear )
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 42d1a78731..2ac0cdab83 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -583,8 +583,6 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-void *alloc_xen_pagetable(void);
-void free_xen_pagetable(void *v);
 mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
 void *alloc_map_clear_xen_pt(mfn_t *pmfn);
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 3854feb3ea..ec66ad8df6 100644
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


