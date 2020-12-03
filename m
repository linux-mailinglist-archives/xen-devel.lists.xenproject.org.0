Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D995F2CD479
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 12:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43348.77930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkmgq-00064r-9P; Thu, 03 Dec 2020 11:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43348.77930; Thu, 03 Dec 2020 11:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkmgq-00064R-64; Thu, 03 Dec 2020 11:22:24 +0000
Received: by outflank-mailman (input) for mailman id 43348;
 Thu, 03 Dec 2020 11:22:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kkmgo-00064M-NV
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 11:22:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkmgo-0002QJ-Ic; Thu, 03 Dec 2020 11:22:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkmgo-0001Sc-6B; Thu, 03 Dec 2020 11:22:22 +0000
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
	bh=+ZJPqw36f+nf9cGOtMdLw6jIeKVmMsOP+3efG7q7Lno=; b=VG2ruECdJC4y3R81Po9B3ETWQV
	XmpDbHy6Kjgh8iqsETdkJKTzzllhpJjpeKzCufYswHz/u/IA5YgA1so7TzMNpcsgqsJ4oGhIT3+JC
	lPpSPEVxkd010c5Xh+5cNZqX+HoD3Ff2jY9OHjYm+fP4rRglTuO9SO0Cph5HJyCebQio=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
Date: Thu,  3 Dec 2020 11:21:59 +0000
Message-Id: <4a69a1177f9496ad0e3ea77e9b1d5b802bf83b60.1606994506.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1

From: Hongyan Xia <hongyxia@amazon.com>

There is simply no guarantee that vmap won't return superpages to the
caller. It can happen if the list of MFNs are contiguous, or we simply
have a large granularity. Although rare, if such things do happen, we
will simply hit BUG_ON() and crash.

Introduce xen_map_to_mfn() to translate any mapped Xen address to mfn
regardless of page size, and wrap vmap_to_mfn() around it.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v2:
- const pl*e
- introduce xen_map_to_mfn().
- goto to a single exit path.
- ASSERT_UNREACHABLE instead of ASSERT.
---
 xen/arch/x86/mm.c          | 54 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/mm.h   |  1 +
 xen/include/asm-x86/page.h |  2 +-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5a50339284c7..53cc5c6de2e6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5194,6 +5194,60 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }                                          \
     } while ( false )
 
+/* Translate mapped Xen address to MFN. */
+mfn_t xen_map_to_mfn(unsigned long va)
+{
+#define CHECK_MAPPED(cond_)     \
+    if ( !(cond_) )             \
+    {                           \
+        ASSERT_UNREACHABLE();   \
+        ret = INVALID_MFN;      \
+        goto out;               \
+    }                           \
+
+    bool locking = system_state > SYS_STATE_boot;
+    unsigned int l2_offset = l2_table_offset(va);
+    unsigned int l1_offset = l1_table_offset(va);
+    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
+    const l2_pgentry_t *pl2e = NULL;
+    const l1_pgentry_t *pl1e = NULL;
+    struct page_info *l3page;
+    mfn_t ret;
+
+    L3T_INIT(l3page);
+    CHECK_MAPPED(pl3e)
+    l3page = virt_to_page(pl3e);
+    L3T_LOCK(l3page);
+
+    CHECK_MAPPED(l3e_get_flags(*pl3e) & _PAGE_PRESENT)
+    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l3e_get_mfn(*pl3e),
+                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
+        goto out;
+    }
+
+    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
+    CHECK_MAPPED(l2e_get_flags(*pl2e) & _PAGE_PRESENT)
+    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
+    {
+        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
+        goto out;
+    }
+
+    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
+    CHECK_MAPPED(l1e_get_flags(*pl1e) & _PAGE_PRESENT)
+    ret = l1e_get_mfn(*pl1e);
+
+#undef CHECK_MAPPED
+ out:
+    L3T_UNLOCK(l3page);
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
+    return ret;
+}
+
 int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75a1cbb..2fc8eeaf7aad 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -578,6 +578,7 @@ mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
+mfn_t xen_map_to_mfn(unsigned long va);
 
 int __sync_local_execstate(void);
 
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 7a771baf7cb3..886adf17a40c 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,7 +291,7 @@ void copy_page_sse2(void *, const void *);
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     l1e_get_mfn(*virt_to_xen_l1e((unsigned long)(va)))
+#define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)va)
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */
-- 
2.17.1


