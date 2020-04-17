Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFB1ADFE6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRzB-0008As-7B; Fri, 17 Apr 2020 14:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRz9-0008Ah-Qj
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:28:51 +0000
X-Inumbo-ID: c18f7024-80b7-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c18f7024-80b7-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 14:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38320AB5F;
 Fri, 17 Apr 2020 14:28:49 +0000 (UTC)
Subject: [PATCH 08/10] x86/mm: pagetable_dying() is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <c8ca6185-3242-b259-a16a-3d14e896e9f2@suse.com>
Date: Fri, 17 Apr 2020 16:28:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Its only caller lives in HVM-only code.

This involves wider changes, in order to limit #ifdef-ary: Shadow's
SHOPT_FAST_EMULATION and the fields used by it get constrained to HVM
builds as well. Additionally the shadow_{init,continue}_emulation()
stubs for the !HVM case aren't needed anymore and hence get dropped.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -851,6 +851,7 @@ int paging_enable(struct domain *d, u32
         return shadow_enable(d, mode);
 }
 
+#ifdef CONFIG_HVM
 /* Called from the guest to indicate that a process is being torn down
  * and therefore its pagetables will soon be discarded */
 void pagetable_dying(paddr_t gpa)
@@ -865,6 +866,7 @@ void pagetable_dying(paddr_t gpa)
     BUG();
 #endif
 }
+#endif /* CONFIG_HVM */
 
 /* Print paging-assistance info to the console */
 void paging_dump_domain_info(struct domain *d)
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -66,7 +66,9 @@ int shadow_domain_init(struct domain *d)
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     d->arch.paging.shadow.oos_active = 0;
 #endif
+#ifdef CONFIG_HVM
     d->arch.paging.shadow.pagetable_dying_op = 0;
+#endif
 
     return 0;
 }
@@ -690,8 +692,10 @@ void shadow_promote(struct domain *d, mf
     if ( !test_and_set_bit(_PGC_page_table, &page->count_info) )
     {
         page->shadow_flags = 0;
+#ifdef CONFIG_HVM
         if ( is_hvm_domain(d) )
             page->pagetable_dying = false;
+#endif
     }
 
     ASSERT(!(page->shadow_flags & (1u << type)));
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2764,8 +2764,10 @@ static int sh_page_fault(struct vcpu *v,
     mfn_t gmfn, sl1mfn = _mfn(0);
     shadow_l1e_t sl1e, *ptr_sl1e;
     paddr_t gpa;
+#ifdef CONFIG_HVM
     struct sh_emulate_ctxt emul_ctxt;
     const struct x86_emulate_ops *emul_ops;
+#endif
     int r;
     p2m_type_t p2mt;
     uint32_t rc, error_code;
@@ -3253,7 +3255,13 @@ static int sh_page_fault(struct vcpu *v,
      * caught by user-mode page-table check above.
      */
  emulate_readonly:
+    if ( !is_hvm_domain(d) )
+    {
+        ASSERT_UNREACHABLE();
+        goto not_a_shadow_fault;
+    }
 
+#ifdef CONFIG_HVM
     /* Unshadow if we are writing to a toplevel pagetable that is
      * flagged as a dying process, and that is not currently used. */
     if ( sh_mfn_is_a_page_table(gmfn) && is_hvm_domain(d) &&
@@ -3302,31 +3310,28 @@ static int sh_page_fault(struct vcpu *v,
 #if SHADOW_OPTIMIZATIONS & SHOPT_FAST_EMULATION
  early_emulation:
 #endif
-    if ( is_hvm_domain(d) )
+    /*
+     * If we are in the middle of injecting an exception or interrupt then
+     * we should not emulate: the fault is a side effect of the processor
+     * trying to deliver the exception (e.g. IDT/GDT accesses, pushing the
+     * exception frame onto the stack).  Furthermore it is almost
+     * certainly the case the handler stack is currently considered to be
+     * a page table, so we should unshadow the faulting page before
+     * exiting.
+     */
+    if ( unlikely(hvm_event_pending(v)) )
     {
-        /*
-         * If we are in the middle of injecting an exception or interrupt then
-         * we should not emulate: the fault is a side effect of the processor
-         * trying to deliver the exception (e.g. IDT/GDT accesses, pushing the
-         * exception frame onto the stack).  Furthermore it is almost
-         * certainly the case the handler stack is currently considered to be
-         * a page table, so we should unshadow the faulting page before
-         * exiting.
-         */
-        if ( unlikely(hvm_event_pending(v)) )
-        {
 #if SHADOW_OPTIMIZATIONS & SHOPT_FAST_EMULATION
-            if ( fast_emul )
-            {
-                perfc_incr(shadow_fault_fast_emulate_fail);
-                v->arch.paging.last_write_emul_ok = 0;
-            }
-#endif
-            sh_remove_shadows(d, gmfn, 0 /* thorough */, 1 /* must succeed */);
-            trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ,
-                                       va, gfn);
-            return EXCRET_fault_fixed;
+        if ( fast_emul )
+        {
+            perfc_incr(shadow_fault_fast_emulate_fail);
+            v->arch.paging.last_write_emul_ok = 0;
         }
+#endif
+        sh_remove_shadows(d, gmfn, 0 /* thorough */, 1 /* must succeed */);
+        trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ,
+                                   va, gfn);
+        return EXCRET_fault_fixed;
     }
 
     SHADOW_PRINTK("emulate: eip=%#lx esp=%#lx\n", regs->rip, regs->rsp);
@@ -3334,11 +3339,8 @@ static int sh_page_fault(struct vcpu *v,
     emul_ops = shadow_init_emulation(&emul_ctxt, regs, GUEST_PTE_SIZE);
 
     r = x86_emulate(&emul_ctxt.ctxt, emul_ops);
-
-#ifdef CONFIG_HVM
     if ( r == X86EMUL_EXCEPTION )
     {
-        ASSERT(is_hvm_domain(d));
         /*
          * This emulation covers writes to shadow pagetables.  We tolerate #PF
          * (from accesses spanning pages, concurrent paging updated from
@@ -3360,7 +3362,6 @@ static int sh_page_fault(struct vcpu *v,
             r = X86EMUL_UNHANDLEABLE;
         }
     }
-#endif
 
     /*
      * NB. We do not unshadow on X86EMUL_EXCEPTION. It's not clear that it
@@ -3466,6 +3467,7 @@ static int sh_page_fault(struct vcpu *v,
  emulate_done:
     SHADOW_PRINTK("emulated\n");
     return EXCRET_fault_fixed;
+#endif /* CONFIG_HVM */
 
  mmio:
     if ( !guest_mode(regs) )
@@ -4157,7 +4159,9 @@ sh_update_cr3(struct vcpu *v, int do_loc
 int sh_rm_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
                                  mfn_t smfn, unsigned long off)
 {
+#ifdef CONFIG_HVM
     struct vcpu *curr = current;
+#endif
     int r;
     shadow_l1e_t *sl1p, sl1e;
     struct page_info *sp;
@@ -4165,10 +4169,12 @@ int sh_rm_write_access_from_sl1p(struct
     ASSERT(mfn_valid(gmfn));
     ASSERT(mfn_valid(smfn));
 
+#ifdef CONFIG_HVM
     /* Remember if we've been told that this process is being torn down */
     if ( curr->domain == d && is_hvm_domain(d) )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
+#endif
 
     sp = mfn_to_page(smfn);
 
@@ -4424,6 +4430,7 @@ int sh_remove_l3_shadow(struct domain *d
 }
 #endif /* 64bit guest */
 
+#ifdef CONFIG_HVM
 /**************************************************************************/
 /* Function for the guest to inform us that a process is being torn
  * down.  We remember that as a hint to unshadow its pagetables soon,
@@ -4545,6 +4552,7 @@ static void sh_pagetable_dying(paddr_t g
     put_gfn(d, gpa >> PAGE_SHIFT);
 }
 #endif
+#endif /* CONFIG_HVM */
 
 /**************************************************************************/
 /* Audit tools */
@@ -4878,8 +4886,8 @@ const struct paging_mode sh_paging_mode
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
-#endif /* CONFIG_HVM */
     .shadow.pagetable_dying        = sh_pagetable_dying,
+#endif /* CONFIG_HVM */
     .shadow.trace_emul_write_val   = trace_emulate_write_val,
     .shadow.shadow_levels          = SHADOW_PAGING_LEVELS,
 };
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -66,7 +66,11 @@ extern int shadow_audit_enable;
 #define SHOPT_FAST_EMULATION      0x80  /* Fast write emulation */
 #define SHOPT_OUT_OF_SYNC        0x100  /* Allow guest writes to L1 PTs */
 
+#ifdef CONFIG_HVM
 #define SHADOW_OPTIMIZATIONS     0x1ff
+#else
+#define SHADOW_OPTIMIZATIONS     (0x1ff & ~SHOPT_FAST_EMULATION)
+#endif
 
 
 /******************************************************************************
@@ -715,26 +719,11 @@ struct sh_emulate_ctxt {
 #endif
 };
 
-#ifdef CONFIG_HVM
 const struct x86_emulate_ops *shadow_init_emulation(
     struct sh_emulate_ctxt *sh_ctxt, struct cpu_user_regs *regs,
     unsigned int pte_size);
 void shadow_continue_emulation(
     struct sh_emulate_ctxt *sh_ctxt, struct cpu_user_regs *regs);
-#else
-static inline const struct x86_emulate_ops *shadow_init_emulation(
-    struct sh_emulate_ctxt *sh_ctxt, struct cpu_user_regs *regs,
-    unsigned int pte_size)
-{
-    BUG();
-    return NULL;
-}
-static inline void shadow_continue_emulation(
-    struct sh_emulate_ctxt *sh_ctxt, struct cpu_user_regs *regs)
-{
-    BUG();
-}
-#endif
 
 /* Stop counting towards early unshadows, as we've seen a real page fault */
 static inline void sh_reset_early_unshadow(struct vcpu *v)
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -117,8 +117,10 @@ struct shadow_domain {
     /* OOS */
     bool_t oos_active;
 
+#ifdef CONFIG_HVM
     /* Has this domain ever used HVMOP_pagetable_dying? */
     bool_t pagetable_dying_op;
+#endif
 
 #ifdef CONFIG_PV
     /* PV L1 Terminal Fault mitigation. */
@@ -137,10 +139,12 @@ struct shadow_vcpu {
     unsigned long last_emulated_mfn_for_unshadow;
     /* MFN of the last shadow that we shot a writeable mapping in */
     unsigned long last_writeable_pte_smfn;
+#ifdef CONFIG_HVM
     /* Last frame number that we emulated a write to. */
     unsigned long last_emulated_frame;
     /* Last MFN that we emulated a write successfully */
     unsigned long last_emulated_mfn;
+#endif
 
     /* Shadow out-of-sync: pages that this vcpu has let go out of sync */
     mfn_t oos[SHADOW_OOS_PAGES];
@@ -151,8 +155,10 @@ struct shadow_vcpu {
         unsigned long off[SHADOW_OOS_FIXUPS];
     } oos_fixup[SHADOW_OOS_PAGES];
 
+#ifdef CONFIG_HVM
     bool_t pagetable_dying;
 #endif
+#endif
 };
 
 /************************************************/
@@ -225,10 +231,12 @@ struct paging_vcpu {
     const struct paging_mode *mode;
     /* Nested Virtualization: paging mode of nested guest */
     const struct paging_mode *nestedmode;
+#ifdef CONFIG_HVM
     /* HVM guest: last emulate was to a pagetable */
     unsigned int last_write_was_pt:1;
     /* HVM guest: last write emulation succeeds */
     unsigned int last_write_emul_ok:1;
+#endif
     /* Translated guest: virtual TLB */
     struct shadow_vtlb *vtlb;
     spinlock_t          vtlb_lock;
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -287,7 +287,9 @@ struct page_info
          */
         struct {
             uint16_t shadow_flags;
+#ifdef CONFIG_HVM
             bool pagetable_dying;
+#endif
         };
 
         /* When in use as a shadow, next shadow in this hash chain. */
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -107,8 +107,8 @@ struct shadow_paging_mode {
     void          (*destroy_monitor_table )(struct vcpu *v, mfn_t mmfn);
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
-#endif
     void          (*pagetable_dying       )(paddr_t gpa);
+#endif
     void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
                                             const void *src, unsigned int bytes);
 #endif


