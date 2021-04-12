Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A8935C863
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109197.208419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxH3-00062n-NI; Mon, 12 Apr 2021 14:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109197.208419; Mon, 12 Apr 2021 14:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxH3-00062R-KA; Mon, 12 Apr 2021 14:10:45 +0000
Received: by outflank-mailman (input) for mailman id 109197;
 Mon, 12 Apr 2021 14:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxH2-000622-Kh
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:10:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d87d0314-b9d5-41cb-a850-589de889cb5e;
 Mon, 12 Apr 2021 14:10:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D093EB133;
 Mon, 12 Apr 2021 14:10:42 +0000 (UTC)
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
X-Inumbo-ID: d87d0314-b9d5-41cb-a850-589de889cb5e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saN7xHAgr8abNwYS5Ioqwzd7tue8dyVnuFdM2ErCD3g=;
	b=q5tlWIwfF/AcvLpa6HWjscWdEki7z7bqRverBSwwR2hm9Khcv08Vh6GYZmMzamg7vkMGKX
	8yZKdGcay2JgT0WNk7j8aS5tSxCMRitlxVydjXjQu2/7Pf0HNaqvvjwf6AlI5EVCjz/ePQ
	u7+vh7lb7iVI0KL76hMnOa1hiqtvgU8=
Subject: [PATCH v2 08/12] x86: mem-access is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <91921cd4-902e-3341-10b7-718550658c8d@suse.com>
Date: Mon, 12 Apr 2021 16:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By excluding the file from being built for !HVM, #ifdef-ary can be
removed from it.

The new HVM dependency on the Kconfig option is benign for Arm.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,7 +15,6 @@ config X86
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
 	select HAS_KEXEC
-	select MEM_ACCESS_ALWAYS_ON
 	select HAS_MEM_PAGING
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
@@ -92,6 +91,7 @@ config PV_LINEAR_PT
 config HVM
 	def_bool !PV_SHIM_EXCLUSIVE
 	select IOREQ_SERVER
+	select MEM_ACCESS_ALWAYS_ON
 	prompt "HVM support"
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -139,7 +139,6 @@ bool p2m_mem_access_emulate_check(struct
     return violation;
 }
 
-#ifdef CONFIG_HVM
 bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
                           struct npfec npfec,
                           vm_event_request_t **req_ptr)
@@ -282,7 +281,6 @@ int p2m_set_altp2m_mem_access(struct dom
      */
     return ap2m->set_entry(ap2m, gfn, mfn, PAGE_ORDER_4K, t, a, -1);
 }
-#endif
 
 static int set_mem_access(struct domain *d, struct p2m_domain *p2m,
                           struct p2m_domain *ap2m, p2m_access_t a,
@@ -290,7 +288,6 @@ static int set_mem_access(struct domain
 {
     int rc = 0;
 
-#ifdef CONFIG_HVM
     if ( ap2m )
     {
         rc = p2m_set_altp2m_mem_access(d, p2m, ap2m, a, gfn);
@@ -299,9 +296,6 @@ static int set_mem_access(struct domain
             rc = 0;
     }
     else
-#else
-    ASSERT(!ap2m);
-#endif
     {
         p2m_access_t _a;
         p2m_type_t t;
@@ -362,7 +356,6 @@ long p2m_set_mem_access(struct domain *d
     long rc = 0;
 
     /* altp2m view 0 is treated as the hostp2m */
-#ifdef CONFIG_HVM
     if ( altp2m_idx )
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
@@ -372,9 +365,6 @@ long p2m_set_mem_access(struct domain *d
 
         ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
-#else
-    ASSERT(!altp2m_idx);
-#endif
 
     if ( !xenmem_access_to_p2m_access(p2m, access, &a) )
         return -EINVAL;
@@ -422,7 +412,6 @@ long p2m_set_mem_access_multi(struct dom
     long rc = 0;
 
     /* altp2m view 0 is treated as the hostp2m */
-#ifdef CONFIG_HVM
     if ( altp2m_idx )
     {
         if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
@@ -432,9 +421,6 @@ long p2m_set_mem_access_multi(struct dom
 
         ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
-#else
-    ASSERT(!altp2m_idx);
-#endif
 
     p2m_lock(p2m);
     if ( ap2m )
@@ -484,7 +470,6 @@ int p2m_get_mem_access(struct domain *d,
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-#ifdef CONFIG_HVM
     if ( !altp2m_active(d) )
     {
         if ( altp2m_idx )
@@ -499,9 +484,6 @@ int p2m_get_mem_access(struct domain *d,
 
         p2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
     }
-#else
-    ASSERT(!altp2m_idx);
-#endif
 
     return _p2m_get_mem_access(p2m, gfn, access);
 }
@@ -512,7 +494,6 @@ void arch_p2m_set_access_required(struct
 
     p2m_get_hostp2m(d)->access_required = access_required;
 
-#ifdef CONFIG_HVM
     if ( altp2m_active(d) )
     {
         unsigned int i;
@@ -524,7 +505,6 @@ void arch_p2m_set_access_required(struct
                 p2m->access_required = access_required;
         }
     }
-#endif
 }
 
 bool p2m_mem_access_sanity_check(const struct domain *d)
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -265,6 +265,7 @@ void vm_event_emulate_check(struct vcpu
         return;
     }
 
+#ifdef CONFIG_HVM
     switch ( rsp->reason )
     {
     case VM_EVENT_REASON_MEM_ACCESS:
@@ -298,6 +299,7 @@ void vm_event_emulate_check(struct vcpu
     default:
         break;
     };
+#endif
 }
 
 void vm_event_reset_vmtrace(struct vcpu *v)
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -58,6 +58,7 @@ config MEM_ACCESS_ALWAYS_ON
 config MEM_ACCESS
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
+	depends on HVM
 	---help---
 
 	  Framework to configure memory access types for guests and receive


