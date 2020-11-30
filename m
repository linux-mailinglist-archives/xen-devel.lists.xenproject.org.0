Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD22C89EA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 17:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41340.74481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjmOX-0001Qq-Qt; Mon, 30 Nov 2020 16:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41340.74481; Mon, 30 Nov 2020 16:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjmOX-0001QR-Ne; Mon, 30 Nov 2020 16:51:21 +0000
Received: by outflank-mailman (input) for mailman id 41340;
 Mon, 30 Nov 2020 16:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kjmOW-0001QM-CX
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 16:51:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjmOV-0001PU-UW; Mon, 30 Nov 2020 16:51:19 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjmOV-0007mX-Hc; Mon, 30 Nov 2020 16:51:19 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=XvfdPrYOjfivOrXAndJdfQrCNwEnDaIrvyrxzNqhODk=; b=Mdru5x59232mjdZC+7aa+PxzE/
	zemvWoaOiZkQ5drZzX2l8VIXF4KYhM3ihmfT/YG6aKlvlbZHs4jDCjRujUT7Et013HZggjhMy2tDk
	1nv5uRBw2V2SzU4CY114j+hIMQCMCQzZItcGJFV2CHN1neZ/Ef0cDxHl6e3lb/3ASSM0=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
Date: Mon, 30 Nov 2020 16:50:54 +0000
Message-Id: <34de4c4326673c60d3e2cbd3bbcbcca481906524.1606755042.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

There is simply no guarantee that vmap won't return superpages to the
caller. It can happen if the list of MFNs are contiguous, or we simply
have a large granularity. Although rare, if such things do happen, we
will simply hit BUG_ON() and crash. Properly handle such cases in a new
implementation.

Note that vmap is now too large to be a macro, so implement it as a
normal function and move the declaration to mm.h (page.h cannot handle
mfn_t).

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/domain_page.c |  2 +-
 xen/arch/x86/mm.c          | 43 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/mm.h   |  2 ++
 xen/include/asm-x86/page.h |  2 --
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304fb8..4ba75d397a17 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -338,7 +338,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
         return _mfn(virt_to_mfn(ptr));
 
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
-        return vmap_to_mfn(va);
+        return vmap_to_mfn(ptr);
 
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5a50339284c7..c22385e90d8a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5194,6 +5194,49 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }                                          \
     } while ( false )
 
+mfn_t vmap_to_mfn(const void *v)
+{
+    bool locking = system_state > SYS_STATE_boot;
+    unsigned int l2_offset = l2_table_offset((unsigned long)v);
+    unsigned int l1_offset = l1_table_offset((unsigned long)v);
+    l3_pgentry_t *pl3e = virt_to_xen_l3e((unsigned long)v);
+    l2_pgentry_t *pl2e;
+    l1_pgentry_t *pl1e;
+    struct page_info *l3page;
+    mfn_t ret;
+
+    ASSERT(pl3e);
+    l3page = virt_to_page(pl3e);
+    L3T_LOCK(l3page);
+
+    ASSERT(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
+    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l3e_get_mfn(*pl3e),
+                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
+        L3T_UNLOCK(l3page);
+        return ret;
+    }
+
+    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
+    ASSERT(l2e_get_flags(*pl2e) & _PAGE_PRESENT);
+    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
+        L3T_UNLOCK(l3page);
+        return ret;
+    }
+
+    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
+    UNMAP_DOMAIN_PAGE(pl2e);
+    ASSERT(l1e_get_flags(*pl1e) & _PAGE_PRESENT);
+    ret = l1e_get_mfn(*pl1e);
+    L3T_UNLOCK(l3page);
+    UNMAP_DOMAIN_PAGE(pl1e);
+
+    return ret;
+}
+
 int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75a1cbb..6354d165f48b 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -578,6 +578,8 @@ mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
+mfn_t vmap_to_mfn(const void *v);
+#define vmap_to_page(va) mfn_to_page(vmap_to_mfn(va))
 
 int __sync_local_execstate(void);
 
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 7a771baf7cb3..b2bcc95fd2de 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,8 +291,6 @@ void copy_page_sse2(void *, const void *);
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     l1e_get_mfn(*virt_to_xen_l1e((unsigned long)(va)))
-#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */
 
-- 
2.17.1


