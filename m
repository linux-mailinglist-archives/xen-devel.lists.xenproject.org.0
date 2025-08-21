Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0DB2FE42
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088817.1446545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-0006CP-Rr; Thu, 21 Aug 2025 15:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088817.1446545; Thu, 21 Aug 2025 15:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7As-00066t-MA; Thu, 21 Aug 2025 15:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1088817;
 Thu, 21 Aug 2025 15:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BQjA=3B=bounce.vates.tech=bounce-md_30504962.68a73a7e.v1-3f408629188242329ca2147b15758713@srs-se1.protection.inumbo.net>)
 id 1up7Ar-0005nU-CD
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:57 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb23df8-7ea3-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:25:51 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bL40mbzBsVD7B
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3f408629188242329ca2147b15758713; Thu, 21 Aug 2025 15:25:50 +0000
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
X-Inumbo-ID: 1eb23df8-7ea3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789950; x=1756059950;
	bh=SbIlPsyNgTEwgIzXTJ1Jn4RTs8uee0L3+cFAML8sLR8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RrEDColLv3XLiy+Pvl2N0Rkll4OwKpU9CDzpuliBKDNj0dP/muYjABsxULNGI2PeH
	 Tw1PIIy0Evg6Og3RYWkVSnvOLZqBkz0BzD3v3ogYXZorZm/abMLKYsbnHmpRZu2Obn
	 VX5QApBlilJEm/9thqD0gmVW76Oar4QNjr8ukBruQjeqFw9oVlQWzVuO/aHeo2TDjU
	 uRUdGmBZzCI+xl/p3BogKOp0vH7OIn5BTYpo50IWfYqaJv0z+G/S2gqaSuJTzr58C5
	 ZoWL61+MplY/3PPkq76cQpfiT8y6jcS0mFD74aKCzDCab4jTgYgJWO8jQe4qzuEiWs
	 LDKFj4Ck04HcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789950; x=1756050450; i=teddy.astie@vates.tech;
	bh=SbIlPsyNgTEwgIzXTJ1Jn4RTs8uee0L3+cFAML8sLR8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=buf6aQGC7jf864Xe0EzUrya0YgB08xs1kCH9qIHZ3T9fuFJTI86NIGWDEHRjDQLhs
	 ppY8Qa88CBvW/CUVc/LgKw7mWjCih/AiHaLuTU4fe40FUxGzTc6vEn4Ms0KKat457X
	 yeFhTbXsYv6NGumt34ve8fAIHZHpV0VTPFrd9zOFUnKOtxvobXEP/wgMVt9WJdzmD1
	 xkNp+bTgvdxDJmLZ6aK7TUDRUWSlXv3kB2/Drg/TL1q1h8dtHrYEAOdem5bvx7tDIb
	 wGeA3ptW/YQvnx51n4peEl6ju1Zdu47X2IwnSYPMdnZor3OCLHzHS5oy0/ZhLT2Pka
	 KoQtTC5cUKJew==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=201/9]=20x86/hvm:=20Use=20direct=20structures=20instead=20of=20guest=20handles?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789949800
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <de595114d532e0fa6c885c47cf2b3551ad495525.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3f408629188242329ca2147b15758713?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Make these functions work with hypervisor-owned pointer rather than
guest handles, so the function parameters don't have to live in guest memory.

No functional changes intended.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 126 +++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 56 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 56c7de3977..8bf59c63fe 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4142,19 +4142,14 @@ static int hvmop_flush_tlb_all(void)
     return paging_flush_tlb(NULL) ? 0 : -ERESTART;
 }
 
-static int hvmop_set_evtchn_upcall_vector(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_evtchn_upcall_vector_t) uop)
+static int hvmop_set_evtchn_upcall_vector(xen_hvm_evtchn_upcall_vector_t op)
 {
-    xen_hvm_evtchn_upcall_vector_t op;
     struct domain *d = current->domain;
     struct vcpu *v;
 
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
-    if ( copy_from_guest(&op, uop, 1) )
-        return -EFAULT;
-
     if ( op.vector < 0x10 )
         return -EINVAL;
 
@@ -4434,26 +4429,21 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     return rc;
 }
 
-static int hvmop_set_param(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_param_t) arg)
+static int hvmop_set_param(struct xen_hvm_param op)
 {
-    struct xen_hvm_param a;
     struct domain *d;
     int rc;
 
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a.index >= HVM_NR_PARAMS )
+    if ( op.index >= HVM_NR_PARAMS )
         return -EINVAL;
 
-    d = rcu_lock_domain_by_any_id(a.domid);
+    d = rcu_lock_domain_by_any_id(op.domid);
     if ( d == NULL )
         return -ESRCH;
 
     rc = -EINVAL;
     if ( is_hvm_domain(d) )
-        rc = hvm_set_param(d, a.index, a.value);
+        rc = hvm_set_param(d, op.index, op.value);
 
     rcu_unlock_domain(d);
     return rc;
@@ -4544,31 +4534,21 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
     return 0;
 };
 
-static int hvmop_get_param(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_param_t) arg)
+static int hvmop_get_param(struct xen_hvm_param *op)
 {
-    struct xen_hvm_param a;
     struct domain *d;
     int rc;
 
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a.index >= HVM_NR_PARAMS )
+    if ( op->index >= HVM_NR_PARAMS )
         return -EINVAL;
 
-    d = rcu_lock_domain_by_any_id(a.domid);
+    d = rcu_lock_domain_by_any_id(op->domid);
     if ( d == NULL )
         return -ESRCH;
 
     rc = -EINVAL;
-    if ( is_hvm_domain(d) && !(rc = hvm_get_param(d, a.index, &a.value)) )
-    {
-        rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u = %"PRIx64,
-                    a.index, a.value);
-    }
+    if ( is_hvm_domain(d) && !(rc = hvm_get_param(d, op->index, &op->value)) )
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u = %"PRIx64, a.index, a.value);
 
     rcu_unlock_domain(d);
     return rc;
@@ -5046,18 +5026,13 @@ static int compat_altp2m_op(
     return rc;
 }
 
-static int hvmop_get_mem_type(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
+static int hvmop_get_mem_type(struct xen_hvm_get_mem_type *op)
 {
-    struct xen_hvm_get_mem_type a;
     struct domain *d;
     p2m_type_t t;
     int rc;
 
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    d = rcu_lock_domain_by_any_id(a.domid);
+    d = rcu_lock_domain_by_any_id(op->domid);
     if ( d == NULL )
         return -ESRCH;
 
@@ -5074,25 +5049,22 @@ static int hvmop_get_mem_type(
      * type, not in allocating or unsharing. That'll happen
      * on access.
      */
-    get_gfn_query_unlocked(d, a.pfn, &t);
+    get_gfn_query_unlocked(d, op->pfn, &t);
     if ( p2m_is_mmio(t) )
-        a.mem_type =  HVMMEM_mmio_dm;
+        op->mem_type =  HVMMEM_mmio_dm;
     else if ( t == p2m_ioreq_server )
-        a.mem_type = HVMMEM_ioreq_server;
+        op->mem_type = HVMMEM_ioreq_server;
     else if ( p2m_is_readonly(t) )
-        a.mem_type =  HVMMEM_ram_ro;
+        op->mem_type =  HVMMEM_ram_ro;
     else if ( p2m_is_ram(t) )
-        a.mem_type =  HVMMEM_ram_rw;
+        op->mem_type =  HVMMEM_ram_rw;
     else if ( p2m_is_pod(t) )
-        a.mem_type =  HVMMEM_ram_rw;
+        op->mem_type =  HVMMEM_ram_rw;
     else if ( p2m_is_grant(t) )
-        a.mem_type =  HVMMEM_ram_rw;
+        op->mem_type =  HVMMEM_ram_rw;
     else
-        a.mem_type =  HVMMEM_mmio_dm;
+        op->mem_type =  HVMMEM_mmio_dm;
 
-    rc = -EFAULT;
-    if ( __copy_to_guest(arg, &a, 1) )
-        goto out;
     rc = 0;
 
  out:
@@ -5115,28 +5087,70 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     switch ( op )
     {
     case HVMOP_set_evtchn_upcall_vector:
-        rc = hvmop_set_evtchn_upcall_vector(
-            guest_handle_cast(arg, xen_hvm_evtchn_upcall_vector_t));
+    {
+        struct xen_hvm_evtchn_upcall_vector op;
+
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+
+        rc = hvmop_set_evtchn_upcall_vector(op);
         break;
+    }
     
     case HVMOP_set_param:
-        rc = hvmop_set_param(
-            guest_handle_cast(arg, xen_hvm_param_t));
+    {
+        struct xen_hvm_param op;
+        
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+
+        rc = hvmop_set_param(op);
         break;
+    }
 
     case HVMOP_get_param:
-        rc = hvmop_get_param(
-            guest_handle_cast(arg, xen_hvm_param_t));
+    {
+        struct xen_hvm_param op;
+        
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+
+        rc = hvmop_get_param(&op);
+
+        if ( !rc && copy_to_guest(arg, &op, 1) )
+            rc = -EFAULT;
         break;
+    }
 
     case HVMOP_flush_tlbs:
         rc = guest_handle_is_null(arg) ? hvmop_flush_tlb_all() : -EINVAL;
         break;
 
     case HVMOP_get_mem_type:
-        rc = hvmop_get_mem_type(
-            guest_handle_cast(arg, xen_hvm_get_mem_type_t));
+    {
+        struct xen_hvm_get_mem_type op;
+
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc = -EFAULT;
+            break;
+        }
+        
+        rc = hvmop_get_mem_type(&op);
+
+        if ( !rc && copy_to_guest(arg, &op, 1) )
+            rc = -EFAULT;
         break;
+    }
 
     case HVMOP_pagetable_dying:
     {
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


