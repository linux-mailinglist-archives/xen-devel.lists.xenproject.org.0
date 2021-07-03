Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F423BA9B4
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149548.276611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBV-0000qJ-3d; Sat, 03 Jul 2021 17:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149548.276611; Sat, 03 Jul 2021 17:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBV-0000oT-0B; Sat, 03 Jul 2021 17:12:05 +0000
Received: by outflank-mailman (input) for mailman id 149548;
 Sat, 03 Jul 2021 17:12:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjBT-0000YD-BV
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:12:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBR-0007bT-Ta; Sat, 03 Jul 2021 17:12:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBR-0005vs-KR; Sat, 03 Jul 2021 17:12:01 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Mi7EgN/CRi27LYrSm9zQaxJ46g16tr2Wj55yCnIlKA4=; b=I/EuoQBYvNK1bKaRntBYRnGvh
	FJ43TXmrBKZj4zbksjE7SIxxWCUKk6nfjSWCj0x0iJJ7YgMKjcCmrz8/L0gJwva1bxEltPCOYbypW
	buNjjooGqQMKG6EXQ6nAueboG2EfwBVx6u/Sn0arGUPWI1///rBxo1zrPXvaKuBnFnhK0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled for arch supporting PV guest
Date: Sat,  3 Jul 2021 18:11:49 +0100
Message-Id: <20210703171152.15874-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703171152.15874-1-julien@xen.org>
References: <20210703171152.15874-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

XENMEM_exchange can only be used by PV guest but the check is well
hidden in steal_page(). This is because paging_model_external() will
return false only for PV domain.

To make clearer this is PV only, add a check at the beginning of the
implementation.

In a follow-up patch, mfn_to_gfn() will be completely removed for
arch not supporting M2P as it is a call for trouble to use it.
Take the opportunity to compile out the code if CONFIG_PV is not set.

Ideally, we would want to to move the hypercall implementation in
arch/x86/pv/mm.c. But this is incredibly tangled.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Ideally we would want to move the hypercall implementation in
arch/x86/pv/mm.c. But this is a bit messy. So for now just #ifdef it.

Changes in v5:
    - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
    - Used paging_mode_translate() rather than is_pv_domain()
    - Reword the commit message to explain why the #ifdef rather than
      implementing mfn_to_gfn() using a BUG_ON() or moving the code
      to arch/x86/pv.

Changes in v4:
    - Patch added
---
 xen/common/memory.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index e07bd9a5ea4b..9bc78aae35db 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -522,6 +522,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
 
 static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 {
+#ifdef CONFIG_PV
     struct xen_memory_exchange exch;
     PAGE_LIST_HEAD(in_chunk_list);
     PAGE_LIST_HEAD(out_chunk_list);
@@ -609,6 +610,13 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         goto fail_early;
     }
 
+    if ( paging_mode_translate(d) )
+    {
+        rc = -EOPNOTSUPP;
+        rcu_unlock_domain(d);
+        goto fail_early;
+    }
+
     rc = xsm_memory_exchange(XSM_TARGET, d);
     if ( rc )
     {
@@ -648,7 +656,6 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 
             for ( k = 0; k < (1UL << exch.in.extent_order); k++ )
             {
-#ifdef CONFIG_X86
                 p2m_type_t p2mt;
 
                 /* Shared pages cannot be exchanged */
@@ -659,14 +666,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                     rc = -ENOMEM;
                     goto fail; 
                 }
-#else /* !CONFIG_X86 */
-                mfn = gfn_to_mfn(d, _gfn(gmfn + k));
-#endif
                 if ( unlikely(!mfn_valid(mfn)) )
                 {
-#ifdef CONFIG_X86
                     put_gfn(d, gmfn + k);
-#endif
                     rc = -EINVAL;
                     goto fail;
                 }
@@ -676,16 +678,12 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                 rc = steal_page(d, page, MEMF_no_refcount);
                 if ( unlikely(rc) )
                 {
-#ifdef CONFIG_X86
                     put_gfn(d, gmfn + k);
-#endif
                     goto fail;
                 }
 
                 page_list_add(page, &in_chunk_list);
-#ifdef CONFIG_X86
                 put_gfn(d, gmfn + k);
-#endif
             }
         }
 
@@ -768,8 +766,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
             guest_physmap_add_page(d, _gfn(gpfn), mfn,
                                    exch.out.extent_order);
 
-            if ( !paging_mode_translate(d) &&
-                 __copy_mfn_to_guest_offset(exch.out.extent_start,
+            if ( __copy_mfn_to_guest_offset(exch.out.extent_start,
                                             (i << out_chunk_order) + j,
                                             mfn) )
                 rc = -EFAULT;
@@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
         rc = -EFAULT;
     return rc;
+#else /* !CONFIG_PV */
+    return -EOPNOTSUPP;
+#endif
 }
 
 int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
-- 
2.17.1


