Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498A30C33A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80594.147487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xOI-0000jj-Sl; Tue, 02 Feb 2021 15:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80594.147487; Tue, 02 Feb 2021 15:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xOI-0000jJ-Ox; Tue, 02 Feb 2021 15:14:54 +0000
Received: by outflank-mailman (input) for mailman id 80594;
 Tue, 02 Feb 2021 15:14:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6xOH-0000jB-2o
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:14:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe867e53-0065-4840-bdb5-4ca1e89e753d;
 Tue, 02 Feb 2021 15:14:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB41EABDA;
 Tue,  2 Feb 2021 15:14:50 +0000 (UTC)
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
X-Inumbo-ID: fe867e53-0065-4840-bdb5-4ca1e89e753d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612278891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeRk8iTaKeNpeQPP3n3RrlbXOFqNj3jioAO6kau3rEA=;
	b=HWi6/qYfuHeQ34uppAIGDdzmTj4cBKoym/aW5Vm6wOhtJQRcLKxHOb1YSjthDuuZ7DNr/I
	wpHgA6XuAxsZXHP9C4KnDunzCcQmDQoc+xAGYCnbN2PKQxDuPR6c9p/H5oQ8QRWZpEM5Ts
	/DsMTQWIjSM5xeCe/PILW5X+RlClUNs=
Subject: [PATCH v2 2/2] IOREQ: refine when to send mapcache invalidation
 request
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
Message-ID: <e2682f84-b3bb-b9fb-edd8-863b9036de95@suse.com>
Date: Tue, 2 Feb 2021 16:14:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

XENMEM_decrease_reservation isn't the only means by which pages can get
removed from a guest, yet all removals ought to be signaled to qemu. Put
setting of the flag into the central p2m_remove_page() underlying all
respective hypercalls as well as a few similar places, mainly in PoD
code.

Additionally there's no point sending the request for the local domain
when the domain acted upon is a different one. The latter domain's ioreq
server mapcaches need invalidating. We assume that domain to be paused
at the point the operation takes place, so sending the request in this
case happens from the hvm_do_resume() path, which as one of its first
steps calls handle_hvm_io_completion().

Even without the remote operation aspect a single domain-wide flag
doesn't do: Guests may e.g. decrease-reservation on multiple vCPU-s in
parallel. Each of them needs to issue an invalidation request in due
course, in particular because exiting to guest context should not happen
before the request was actually seen by (all) the emulator(s).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Preemption related adjustment split off. Make flag per-vCPU. More
    places to set the flag. Also handle acting on a remote domain.
    Re-base.
---
I'm still unconvinced of moving the flag setting into p2m_set_entry().
Besides likely causing false positives, we'd also need to make the
function retrieve the prior entry's type in order to do this for
displaced RAM entries only. Instead I've identified more places where
the flag should be set.

--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -759,10 +759,9 @@ static void p2m_free_entry(struct p2m_do
          * has failed (error case).
          * So, at worst, the spurious mapcache invalidation might be sent.
          */
-        if ( (p2m->domain == current->domain) &&
-              domain_has_ioreq_server(p2m->domain) &&
-              p2m_is_ram(entry.p2m.type) )
-            p2m->domain->mapcache_invalidate = true;
+        if ( p2m_is_ram(entry.p2m.type) &&
+             domain_has_ioreq_server(p2m->domain) )
+            ioreq_request_mapcache_invalidate(p2m->domain);
 #endif
 
         p2m->stats.mappings[level]--;
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1509,8 +1509,8 @@ static void do_trap_hypercall(struct cpu
      * Note that sending the invalidation request causes the vCPU to block
      * until all the IOREQ servers have acknowledged the invalidation.
      */
-    if ( unlikely(curr->domain->mapcache_invalidate) &&
-         test_and_clear_bool(curr->domain->mapcache_invalidate) )
+    if ( unlikely(curr->mapcache_invalidate) &&
+         test_and_clear_bool(curr->mapcache_invalidate) )
         ioreq_signal_mapcache_invalidate();
 #endif
 }
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -32,7 +32,6 @@
 
 static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    const struct vcpu *curr = current;
     long rc;
 
     switch ( cmd & MEMOP_CMD_MASK )
@@ -42,14 +41,11 @@ static long hvm_memory_op(int cmd, XEN_G
         return -ENOSYS;
     }
 
-    if ( !curr->hcall_compat )
+    if ( !current->hcall_compat )
         rc = do_memory_op(cmd, arg);
     else
         rc = compat_memory_op(cmd, arg);
 
-    if ( (cmd & MEMOP_CMD_MASK) == XENMEM_decrease_reservation )
-        curr->domain->mapcache_invalidate = true;
-
     return rc;
 }
 
@@ -327,9 +323,11 @@ int hvm_hypercall(struct cpu_user_regs *
 
     HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu -> %lx", eax, regs->rax);
 
-    if ( unlikely(currd->mapcache_invalidate) &&
-         test_and_clear_bool(currd->mapcache_invalidate) )
+    if ( unlikely(curr->mapcache_invalidate) )
+    {
+        curr->mapcache_invalidate = false;
         ioreq_signal_mapcache_invalidate();
+    }
 
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -28,6 +28,7 @@
 #include <xen/vm_event.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
+#include <xen/ioreq.h>
 #include <xen/param.h>
 #include <public/vm_event.h>
 #include <asm/domain.h>
@@ -815,6 +816,8 @@ p2m_remove_page(struct p2m_domain *p2m,
         }
     }
 
+    ioreq_request_mapcache_invalidate(p2m->domain);
+
     return p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,
                          p2m->default_access);
 }
@@ -1301,6 +1304,8 @@ static int set_typed_p2m_entry(struct do
             ASSERT(mfn_valid(mfn_add(omfn, i)));
             set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
         }
+
+        ioreq_request_mapcache_invalidate(d);
     }
 
     P2M_DEBUG("set %d %lx %lx\n", gfn_p2mt, gfn_l, mfn_x(mfn));
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/event.h>
+#include <xen/ioreq.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
@@ -647,6 +648,8 @@ p2m_pod_decrease_reservation(struct doma
                 set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
             p2m_pod_cache_add(p2m, page, cur_order);
 
+            ioreq_request_mapcache_invalidate(d);
+
             steal_for_cache =  ( p2m->pod.entry_count > p2m->pod.count );
 
             ram -= n;
@@ -835,6 +838,8 @@ p2m_pod_zero_check_superpage(struct p2m_
     p2m_pod_cache_add(p2m, mfn_to_page(mfn0), PAGE_ORDER_2M);
     p2m->pod.entry_count += SUPERPAGE_PAGES;
 
+    ioreq_request_mapcache_invalidate(d);
+
     ret = SUPERPAGE_PAGES;
 
 out_reset:
@@ -997,6 +1002,8 @@ p2m_pod_zero_check(struct p2m_domain *p2
             /* Add to cache, and account for the new p2m PoD entry */
             p2m_pod_cache_add(p2m, mfn_to_page(mfns[i]), PAGE_ORDER_4K);
             p2m->pod.entry_count++;
+
+            ioreq_request_mapcache_invalidate(d);
         }
     }
 
@@ -1315,6 +1322,8 @@ guest_physmap_mark_populate_on_demand(st
         p2m->pod.entry_count -= pod_count;
         BUG_ON(p2m->pod.entry_count < 0);
         pod_unlock(p2m);
+
+        ioreq_request_mapcache_invalidate(d);
     }
 
 out:
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -35,6 +35,17 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+void ioreq_request_mapcache_invalidate(const struct domain *d)
+{
+    struct vcpu *v = current;
+
+    if ( d == v->domain )
+        v->mapcache_invalidate = true;
+    else if ( d->creation_finished )
+        for_each_vcpu ( d, v )
+            v->mapcache_invalidate = true;
+}
+
 /* Ask ioemu mapcache to invalidate mappings. */
 void ioreq_signal_mapcache_invalidate(void)
 {
@@ -206,6 +217,7 @@ bool vcpu_ioreq_handle_completion(struct
     struct ioreq_server *s;
     struct ioreq_vcpu *sv;
     enum vio_completion completion;
+    bool res = true;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
     {
@@ -232,17 +244,27 @@ bool vcpu_ioreq_handle_completion(struct
         break;
 
     case VIO_mmio_completion:
-        return arch_ioreq_complete_mmio();
+        res = arch_ioreq_complete_mmio();
+        break;
 
     case VIO_pio_completion:
-        return handle_pio(vio->req.addr, vio->req.size,
-                          vio->req.dir);
+        res = handle_pio(vio->req.addr, vio->req.size,
+                         vio->req.dir);
+        break;
 
     default:
-        return arch_vcpu_ioreq_completion(completion);
+        res = arch_vcpu_ioreq_completion(completion);
+        break;
     }
 
-    return true;
+    if ( res && unlikely(v->mapcache_invalidate) )
+    {
+        v->mapcache_invalidate = false;
+        ioreq_signal_mapcache_invalidate();
+        res = false;
+    }
+
+    return res;
 }
 
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -103,6 +103,7 @@ struct ioreq_server *ioreq_server_select
 int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
                bool buffered);
 unsigned int ioreq_broadcast(ioreq_t *p, bool buffered);
+void ioreq_request_mapcache_invalidate(const struct domain *d);
 void ioreq_signal_mapcache_invalidate(void);
 
 void ioreq_domain_init(struct domain *d);
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -225,6 +225,14 @@ struct vcpu
     bool             hcall_compat;
 #endif
 
+#ifdef CONFIG_IOREQ_SERVER
+    /*
+     * Indicates that mapcache invalidation request should be sent to
+     * the device emulator.
+     */
+    bool             mapcache_invalidate;
+#endif
+
     /* The CPU, if any, which is holding onto this VCPU's state. */
 #define VCPU_CPU_CLEAN (~0u)
     unsigned int     dirty_cpu;
@@ -444,11 +452,6 @@ struct domain
      * unpaused for the first time by the systemcontroller.
      */
     bool             creation_finished;
-    /*
-     * Indicates that mapcache invalidation request should be sent to
-     * the device emulator.
-     */
-    bool             mapcache_invalidate;
 
     /* Which guest this guest has privileges on */
     struct domain   *target;


