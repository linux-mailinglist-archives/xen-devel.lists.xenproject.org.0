Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AD35C867
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109204.208432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxJ0-0006Cy-40; Mon, 12 Apr 2021 14:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109204.208432; Mon, 12 Apr 2021 14:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxJ0-0006CZ-0i; Mon, 12 Apr 2021 14:12:46 +0000
Received: by outflank-mailman (input) for mailman id 109204;
 Mon, 12 Apr 2021 14:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxIy-0006CA-1V
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:12:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d77315c-b830-495f-8b5f-88d1697ed773;
 Mon, 12 Apr 2021 14:12:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EC03B02C;
 Mon, 12 Apr 2021 14:12:42 +0000 (UTC)
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
X-Inumbo-ID: 6d77315c-b830-495f-8b5f-88d1697ed773
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdzk5wmAXjisOcJzpMedbV3NzErzKi8Z0MukFBUTB+o=;
	b=V/Nq+qGJOPSgrAxgpLSOhZjh4q+WO9SATeW+SzUB2hNrHhjA8IZ5R98AZcVSTbR6DoyQXK
	pSqa/1AOkiyMzb8Wmyp9wBNm2sZEAgeF+VA7OKp27JktIbIQ8dp98guYv2eQmqtQ0rDUkn
	+3fDNHQn2jHJRJoO8gJoFfTIYTt6Rc0=
Subject: [PATCH v2 09/12] x86: make mem-paging configuarable and default it to
 off for being unsupported
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
Date: Mon, 12 Apr 2021 16:12:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While doing so, make the option dependent upon HVM, which really is the
main purpose of the change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,7 +15,6 @@ config X86
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
 	select HAS_KEXEC
-	select HAS_MEM_PAGING
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI
@@ -251,6 +250,10 @@ config HYPERV_GUEST
 
 endif
 
+config MEM_PAGING
+	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HVM
+
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1932,9 +1932,11 @@ int hvm_hap_nested_page_fault(paddr_t gp
         goto out_put_gfn;
     }
 
+#ifdef CONFIG_MEM_PAGING
     /* Check if the page has been paged out */
     if ( p2m_is_paged(p2mt) || (p2mt == p2m_ram_paging_out) )
         paged = 1;
+#endif
 
 #ifdef CONFIG_MEM_SHARING
     /* Mem sharing: if still shared on write access then its enomem */
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_HVM) += altp2m.o
 obj-$(CONFIG_HVM) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
 obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
-obj-y += mem_paging.o
+obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-y += p2m.o p2m-pt.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -155,8 +155,10 @@ int compat_arch_memory_op(unsigned long
     case XENMEM_get_sharing_shared_pages:
         return mem_sharing_get_nr_shared_mfns();
 
+#ifdef CONFIG_MEM_PAGING
     case XENMEM_paging_op:
         return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
+#endif
 
 #ifdef CONFIG_MEM_SHARING
     case XENMEM_sharing_op:
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -994,8 +994,10 @@ long subarch_memory_op(unsigned long cmd
     case XENMEM_get_sharing_shared_pages:
         return mem_sharing_get_nr_shared_mfns();
 
+#ifdef CONFIG_MEM_PAGING
     case XENMEM_paging_op:
         return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
+#endif
 
 #ifdef CONFIG_MEM_SHARING
     case XENMEM_sharing_op:
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -40,9 +40,6 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
-config HAS_MEM_PAGING
-	bool
-
 config HAS_PDX
 	bool
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1096,7 +1096,7 @@ static void complete_domain_destroy(stru
     free_xenoprof_pages(d);
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     xfree(d->vm_event_paging);
 #endif
     xfree(d->vm_event_monitor);
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1856,7 +1856,7 @@ int check_get_page_from_gfn(struct domai
 
     page = get_page_from_gfn(d, gfn_x(gfn), &p2mt, q);
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     if ( p2m_is_paging(p2mt) )
     {
         if ( page )
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -390,7 +390,7 @@ static int vm_event_resume(struct domain
         /* Check flags which apply only when the vCPU is paused */
         if ( atomic_read(&v->vm_event_pause_count) )
         {
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
             if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
                 p2m_mem_paging_resume(d, &rsp);
 #endif
@@ -521,7 +521,7 @@ int __vm_event_claim_slot(struct domain
         return vm_event_grab_slot(ved, current->domain != d);
 }
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
 /* Registered with Xen-bound event channel for incoming notifications. */
 static void mem_paging_notification(struct vcpu *v, unsigned int port)
 {
@@ -546,7 +546,7 @@ static void mem_sharing_notification(str
 /* Clean up on domain destruction */
 void vm_event_cleanup(struct domain *d)
 {
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     if ( vm_event_check_ring(d->vm_event_paging) )
     {
         /* Destroying the wait queue head means waking up all
@@ -613,7 +613,7 @@ int vm_event_domctl(struct domain *d, st
 
     switch ( vec->mode )
     {
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     case XEN_DOMCTL_VM_EVENT_OP_PAGING:
     {
         rc = -EINVAL;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -23,6 +23,7 @@
 
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
+#include <asm/mem_paging.h>
 #include <asm/setup.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
@@ -336,7 +337,7 @@ bool arch_iommu_use_permitted(const stru
      */
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
-            likely(!vm_event_check_ring(d->vm_event_paging)) &&
+            likely(!mem_paging_enabled(d)) &&
             likely(!p2m_get_hostp2m(d)->global_logdirty));
 }
 
--- a/xen/include/asm-x86/mem_paging.h
+++ b/xen/include/asm-x86/mem_paging.h
@@ -24,6 +24,12 @@
 
 int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
 
+#ifdef CONFIG_MEM_PAGING
+# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
+#else
+# define mem_paging_enabled(d) false
+#endif
+
 #endif /*__ASM_X86_MEM_PAGING_H__ */
 
 /*
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
 #define P2M_PAGEABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
                             | p2m_to_mask(p2m_ram_logdirty) )
 
+#ifdef CONFIG_MEM_PAGING
 #define P2M_PAGING_TYPES (p2m_to_mask(p2m_ram_paging_out)        \
                           | p2m_to_mask(p2m_ram_paged)           \
                           | p2m_to_mask(p2m_ram_paging_in))
 
 #define P2M_PAGED_TYPES (p2m_to_mask(p2m_ram_paged))
+#else
+#define P2M_PAGING_TYPES 0
+#define P2M_PAGED_TYPES 0
+#endif
 
 /* Shared types */
 /* XXX: Sharable types could include p2m_ram_ro too, but we would need to
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -530,7 +530,7 @@ struct domain
     struct domain *parent; /* VM fork parent */
 #endif
     /* Memory paging support */
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     struct vm_event_domain *vm_event_paging;
 #endif
     /* VM event monitor support */
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -592,7 +592,7 @@ static XSM_INLINE int xsm_mem_access(XSM
 }
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
 static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -146,7 +146,7 @@ struct xsm_operations {
     int (*mem_access) (struct domain *d);
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     int (*mem_paging) (struct domain *d);
 #endif
 
@@ -592,7 +592,7 @@ static inline int xsm_mem_access (xsm_de
 }
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
 static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
 {
     return xsm_ops->mem_paging(d);
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -124,7 +124,7 @@ void __init xsm_fixup_ops (struct xsm_op
     set_to_dummy_if_null(ops, mem_access);
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     set_to_dummy_if_null(ops, mem_paging);
 #endif
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1256,7 +1256,7 @@ static int flask_mem_access(struct domai
 }
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
 static int flask_mem_paging(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_PAGING);
@@ -1829,7 +1829,7 @@ static struct xsm_operations flask_ops =
     .mem_access = flask_mem_access,
 #endif
 
-#ifdef CONFIG_HAS_MEM_PAGING
+#ifdef CONFIG_MEM_PAGING
     .mem_paging = flask_mem_paging,
 #endif
 


