Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E445EEC1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232874.404085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxQ-0001RN-53; Fri, 26 Nov 2021 13:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232874.404085; Fri, 26 Nov 2021 13:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxP-0001Fm-Gr; Fri, 26 Nov 2021 13:08:03 +0000
Received: by outflank-mailman (input) for mailman id 232874;
 Fri, 26 Nov 2021 13:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavi-0003W9-LH
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ccbe9a-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:14 +0100 (CET)
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
X-Inumbo-ID: a1ccbe9a-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QWYA8RzofckUZhmsWLLEN5SvofjWDHZvKGXYl+18TtA=;
  b=a38c0gbxJmGI3Nh31PuRPPhWz9hSfTKB1nbH+OGfY9AYQEX8fpi9p1Bk
   BJ6wG7QfR6X6X3fP7Do3Pbd77VJqu/t/JRNjwit9jlv5FB+RnyWRqXFIZ
   yFOQInYOJXAg6i4pORMELapPMrH1J72cerTDSO99/irrBcpS5+1rHc2hl
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xuATDL/Ujsk3IBsj/4PLeC2nsPQPNvWNgs+MYXwsZ8jtg4oXz3BtZSpvHXDNNzrhRA0VtbE8As
 y96KuZctYjPvNCyKGuwvsO3BYTAxdGWa0pu5BQICTtUVxF4E7HBsgXUz8edVLlvFuaaPp1gUwk
 gR5DT7vNLKcnv+k6fedCAhpIWkQ7bH/kiy5GIQjoDPQPJN911x5U84iF1G8fgBMSNiJEDuyMF4
 UBDLXZjenKPG4hhyeiCcZSzbjkjJuHasq4OvNT9mZDvnnhf7N/oTfnKvQ25NYDRCZBfDuIEzFG
 r1faQWocCCMFtkE7JWYOOHMl
X-SBRS: 5.1
X-MesageID: 58193867
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OU1D/q+v1/YHgJfioHQ7DrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 GAWD2DVPf/ZZmGjLohzOtm2pENU6JeDy4BjHgs/rCg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhNk
 4V8kbaIWz5qGfPUguEGYj8BDCNxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0eRKeFN
 5RGAdZpRA/iZBcUA0YPMaA7jsiUrVf8a2Rh9GvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0Z4EAIskQ0BO0iY2K+xycHVkiFyFDZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 yNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lexc3b5lVJWG1O
 yc/XD+9ArcIZxNGioctPuqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5m9vNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:Erf1tauPYuyCuFd/nusetGzj7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193867"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 28/65] x86/hvm: Annotate fnptr targets from hvm_funcs
Date: Fri, 26 Nov 2021 12:34:09 +0000
Message-ID: <20211126123446.32324-29-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In svm.c, make a few rearrangements.  svm_update_guest_cr() has no external
callers so can become static, but needs moving along with svm_fpu_enter() to
avoid a forward declaration.  Also move svm_update_guest_efer() to drop its
forward declaration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/nestedsvm.c        |  27 ++-
 xen/arch/x86/hvm/svm/svm.c              | 344 ++++++++++++++++----------------
 xen/arch/x86/hvm/vmx/intr.c             |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c              | 145 +++++++-------
 xen/arch/x86/hvm/vmx/vvmx.c             |  21 +-
 xen/include/asm-x86/hvm/svm/nestedsvm.h |  22 +-
 xen/include/asm-x86/hvm/svm/svm.h       |   1 -
 xen/include/asm-x86/hvm/vmx/vmcs.h      |   8 +-
 xen/include/asm-x86/hvm/vmx/vmx.h       |   2 +-
 xen/include/asm-x86/hvm/vmx/vvmx.h      |  23 +--
 11 files changed, 306 insertions(+), 297 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 6d9063004077..10a3e72a96fb 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -80,7 +80,7 @@ int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 }
 
 /* Interface methods */
-int nsvm_vcpu_initialise(struct vcpu *v)
+int cf_check nsvm_vcpu_initialise(struct vcpu *v)
 {
     void *msrpm;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -110,7 +110,7 @@ int nsvm_vcpu_initialise(struct vcpu *v)
     return -ENOMEM;
 }
 
-void nsvm_vcpu_destroy(struct vcpu *v)
+void cf_check nsvm_vcpu_destroy(struct vcpu *v)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -150,7 +150,7 @@ void nsvm_vcpu_destroy(struct vcpu *v)
     svm->ns_iomap = NULL;
 }
 
-int nsvm_vcpu_reset(struct vcpu *v)
+int cf_check nsvm_vcpu_reset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
 
@@ -855,8 +855,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     return 0;
 }
 
-int
-nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *trap)
+int cf_check nsvm_vcpu_vmexit_event(
+    struct vcpu *v, const struct x86_event *trap)
 {
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
@@ -865,7 +865,7 @@ nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *trap)
     return NESTEDHVM_VMEXIT_DONE;
 }
 
-uint64_t nsvm_vcpu_hostcr3(struct vcpu *v)
+uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v)
 {
     return vcpu_nestedsvm(v).ns_vmcb_hostcr3;
 }
@@ -1030,8 +1030,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     return 1;
 }
 
-bool_t
-nsvm_vmcb_guest_intercepts_event(
+bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode)
 {
     return nsvm_vmcb_guest_intercepts_exitcode(v,
@@ -1206,8 +1205,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-bool_t
-nsvm_vmcb_hap_enabled(struct vcpu *v)
+bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v)
 {
     return vcpu_nestedsvm(v).ns_hap_enabled;
 }
@@ -1216,10 +1214,9 @@ nsvm_vmcb_hap_enabled(struct vcpu *v)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int
-nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x)
+int cf_check nsvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, bool access_r, bool access_w, bool access_x)
 {
     uint32_t pfec;
     unsigned long nested_cr3, gfn;
@@ -1242,7 +1239,7 @@ nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
     return NESTEDHVM_PAGEFAULT_DONE;
 }
 
-enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
+enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f0e10dec046e..9c62c0cd80ee 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -67,8 +67,6 @@ void noreturn svm_asm_do_resume(void);
 
 u32 svm_feature_flags;
 
-static void svm_update_guest_efer(struct vcpu *);
-
 static struct hvm_function_table svm_function_table;
 
 /*
@@ -122,11 +120,144 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
         hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
-static void svm_cpu_down(void)
+static void cf_check svm_cpu_down(void)
 {
     write_efer(read_efer() & ~EFER_SVME);
 }
 
+static void svm_fpu_enter(struct vcpu *v)
+{
+    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
+
+    vcpu_restore_fpu_lazy(v);
+    vmcb_set_exception_intercepts(
+        n1vmcb,
+        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << TRAP_no_device));
+}
+
+static void cf_check svm_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    uint64_t value;
+
+    switch ( cr )
+    {
+    case 0:
+    {
+        unsigned long hw_cr0_mask = 0;
+
+        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+        {
+            if ( v != current )
+            {
+                if ( !v->arch.fully_eager_fpu )
+                    hw_cr0_mask |= X86_CR0_TS;
+            }
+            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
+                svm_fpu_enter(v);
+        }
+
+        if ( paging_mode_hap(v->domain) )
+        {
+            uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
+
+            /* Trap CR3 updates if CR3 memory events are enabled. */
+            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
+                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
+               vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
+        }
+
+        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        if ( !paging_mode_hap(v->domain) )
+            value |= X86_CR0_PG | X86_CR0_WP;
+        vmcb_set_cr0(vmcb, value);
+        break;
+    }
+    case 2:
+        vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
+        break;
+    case 3:
+        vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
+        if ( !nestedhvm_enabled(v->domain) )
+        {
+            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+                hvm_asid_flush_vcpu(v);
+        }
+        else if ( nestedhvm_vmswitch_in_progress(v) )
+            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
+        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+            hvm_asid_flush_vcpu_asid(
+                nestedhvm_vcpu_in_guestmode(v)
+                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
+        break;
+    case 4:
+        value = HVM_CR4_HOST_MASK;
+        if ( paging_mode_hap(v->domain) )
+            value &= ~X86_CR4_PAE;
+        value |= v->arch.hvm.guest_cr[4];
+
+        if ( !hvm_paging_enabled(v) )
+        {
+            /*
+             * When the guest thinks paging is disabled, Xen may need to hide
+             * the effects of shadow paging, as hardware runs with the host
+             * paging settings, rather than the guests settings.
+             *
+             * Without CR0.PG, all memory accesses are user mode, so
+             * _PAGE_USER must be set in the shadow pagetables for guest
+             * userspace to function.  This in turn trips up guest supervisor
+             * mode if SMEP/SMAP are left active in context.  They wouldn't
+             * have any effect if paging was actually disabled, so hide them
+             * behind the back of the guest.
+             */
+            value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
+        }
+
+        vmcb_set_cr4(vmcb, value);
+        break;
+    default:
+        BUG();
+    }
+}
+
+static void cf_check svm_update_guest_efer(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    unsigned long guest_efer = v->arch.hvm.guest_efer,
+        xen_efer = read_efer();
+
+    if ( paging_mode_shadow(v->domain) )
+    {
+        /* EFER.NX is a Xen-owned bit and is not under guest control. */
+        guest_efer &= ~EFER_NXE;
+        guest_efer |= xen_efer & EFER_NXE;
+
+        /*
+         * CR0.PG is a Xen-owned bit, and remains set even when the guest has
+         * logically disabled paging.
+         *
+         * LMA was calculated using the guest CR0.PG setting, but LME needs
+         * clearing to avoid interacting with Xen's CR0.PG setting.  As writes
+         * to CR0 are intercepted, it is safe to leave LME clear at this
+         * point, and fix up both LME and LMA when CR0.PG is set.
+         */
+        if ( !(guest_efer & EFER_LMA) )
+            guest_efer &= ~EFER_LME;
+    }
+
+    /* SVME must remain set in non-root mode. */
+    guest_efer |= EFER_SVME;
+
+    vmcb_set_efer(vmcb, guest_efer);
+
+    ASSERT(nestedhvm_enabled(v->domain) ||
+           !(v->arch.hvm.guest_efer & EFER_SVME));
+
+    if ( nestedhvm_enabled(v->domain) )
+        svm_nested_features_on_efer_update(v);
+}
+
 unsigned long *
 svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
 {
@@ -165,7 +296,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
-static void svm_enable_msr_interception(struct domain *d, uint32_t msr)
+static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
 
@@ -377,13 +508,13 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
     svm_update_guest_efer(v);
 }
 
-static void svm_save_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static void cf_check svm_save_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     svm_save_cpu_state(v, ctxt);
     svm_vmcb_save(v, ctxt);
 }
 
-static int svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static int cf_check svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     svm_load_cpu_state(v, ctxt);
     if ( svm_vmcb_restore(v, ctxt) )
@@ -396,17 +527,7 @@ static int svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     return 0;
 }
 
-static void svm_fpu_enter(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    vcpu_restore_fpu_lazy(v);
-    vmcb_set_exception_intercepts(
-        n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << TRAP_no_device));
-}
-
-static void svm_fpu_leave(struct vcpu *v)
+static void cf_check svm_fpu_leave(struct vcpu *v)
 {
     struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
@@ -428,7 +549,7 @@ static void svm_fpu_leave(struct vcpu *v)
     }
 }
 
-static unsigned int svm_get_interrupt_shadow(struct vcpu *v)
+static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int intr_shadow = 0;
@@ -442,7 +563,8 @@ static unsigned int svm_get_interrupt_shadow(struct vcpu *v)
     return intr_shadow;
 }
 
-static void svm_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
+static void cf_check svm_set_interrupt_shadow(
+    struct vcpu *v, unsigned int intr_shadow)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -456,7 +578,7 @@ static void svm_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
 
-static int svm_guest_x86_mode(struct vcpu *v)
+static int cf_check svm_guest_x86_mode(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -469,129 +591,7 @@ static int svm_guest_x86_mode(struct vcpu *v)
     return likely(vmcb->cs.db) ? 4 : 2;
 }
 
-void svm_update_guest_cr(struct vcpu *v, unsigned int cr, unsigned int flags)
-{
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    uint64_t value;
-
-    switch ( cr )
-    {
-    case 0:
-    {
-        unsigned long hw_cr0_mask = 0;
-
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
-                svm_fpu_enter(v);
-        }
-
-        if ( paging_mode_hap(v->domain) )
-        {
-            uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
-
-            /* Trap CR3 updates if CR3 memory events are enabled. */
-            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
-                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
-               vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
-        }
-
-        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
-        if ( !paging_mode_hap(v->domain) )
-            value |= X86_CR0_PG | X86_CR0_WP;
-        vmcb_set_cr0(vmcb, value);
-        break;
-    }
-    case 2:
-        vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
-        break;
-    case 3:
-        vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
-        if ( !nestedhvm_enabled(v->domain) )
-        {
-            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
-        }
-        else if ( nestedhvm_vmswitch_in_progress(v) )
-            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
-        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
-        break;
-    case 4:
-        value = HVM_CR4_HOST_MASK;
-        if ( paging_mode_hap(v->domain) )
-            value &= ~X86_CR4_PAE;
-        value |= v->arch.hvm.guest_cr[4];
-
-        if ( !hvm_paging_enabled(v) )
-        {
-            /*
-             * When the guest thinks paging is disabled, Xen may need to hide
-             * the effects of shadow paging, as hardware runs with the host
-             * paging settings, rather than the guests settings.
-             *
-             * Without CR0.PG, all memory accesses are user mode, so
-             * _PAGE_USER must be set in the shadow pagetables for guest
-             * userspace to function.  This in turn trips up guest supervisor
-             * mode if SMEP/SMAP are left active in context.  They wouldn't
-             * have any effect if paging was actually disabled, so hide them
-             * behind the back of the guest.
-             */
-            value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
-        }
-
-        vmcb_set_cr4(vmcb, value);
-        break;
-    default:
-        BUG();
-    }
-}
-
-static void svm_update_guest_efer(struct vcpu *v)
-{
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    unsigned long guest_efer = v->arch.hvm.guest_efer,
-        xen_efer = read_efer();
-
-    if ( paging_mode_shadow(v->domain) )
-    {
-        /* EFER.NX is a Xen-owned bit and is not under guest control. */
-        guest_efer &= ~EFER_NXE;
-        guest_efer |= xen_efer & EFER_NXE;
-
-        /*
-         * CR0.PG is a Xen-owned bit, and remains set even when the guest has
-         * logically disabled paging.
-         *
-         * LMA was calculated using the guest CR0.PG setting, but LME needs
-         * clearing to avoid interacting with Xen's CR0.PG setting.  As writes
-         * to CR0 are intercepted, it is safe to leave LME clear at this
-         * point, and fix up both LME and LMA when CR0.PG is set.
-         */
-        if ( !(guest_efer & EFER_LMA) )
-            guest_efer &= ~EFER_LME;
-    }
-
-    /* SVME must remain set in non-root mode. */
-    guest_efer |= EFER_SVME;
-
-    vmcb_set_efer(vmcb, guest_efer);
-
-    ASSERT(nestedhvm_enabled(v->domain) ||
-           !(v->arch.hvm.guest_efer & EFER_SVME));
-
-    if ( nestedhvm_enabled(v->domain) )
-        svm_nested_features_on_efer_update(v);
-}
-
-static void svm_cpuid_policy_changed(struct vcpu *v)
+static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
     struct vmcb_struct *vmcb = svm->vmcb;
@@ -632,13 +632,13 @@ void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
     }
 }
 
-static unsigned int svm_get_cpl(struct vcpu *v)
+static unsigned int cf_check svm_get_cpl(struct vcpu *v)
 {
     return vmcb_get_cpl(v->arch.hvm.svm.vmcb);
 }
 
-static void svm_get_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check svm_get_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -682,8 +682,8 @@ static void svm_get_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check svm_set_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -752,12 +752,12 @@ static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static unsigned long svm_get_shadow_gs_base(struct vcpu *v)
+static unsigned long cf_check svm_get_shadow_gs_base(struct vcpu *v)
 {
     return v->arch.hvm.svm.vmcb->kerngsbase;
 }
 
-static int svm_set_guest_pat(struct vcpu *v, u64 gpat)
+static int cf_check svm_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -768,7 +768,7 @@ static int svm_set_guest_pat(struct vcpu *v, u64 gpat)
     return 1;
 }
 
-static int svm_get_guest_pat(struct vcpu *v, u64 *gpat)
+static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -816,7 +816,7 @@ static uint64_t svm_get_tsc_offset(uint64_t host_tsc, uint64_t guest_tsc,
     return guest_tsc - scale_tsc(host_tsc, ratio);
 }
 
-static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct vmcb_struct *n1vmcb, *n2vmcb;
@@ -852,7 +852,7 @@ static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     vmcb_set_tsc_offset(vmcb, offset + n2_tsc_offset);
 }
 
-static void svm_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
+static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -871,7 +871,8 @@ static void svm_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
-static void svm_set_descriptor_access_exiting(struct vcpu *v, bool enable)
+static void cf_check svm_set_descriptor_access_exiting(
+    struct vcpu *v, bool enable)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -888,7 +889,7 @@ static void svm_set_descriptor_access_exiting(struct vcpu *v, bool enable)
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
 
-static unsigned int svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
+static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int len = v->arch.hvm.svm.cached_insn_len;
@@ -903,7 +904,7 @@ static unsigned int svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
     return len;
 }
 
-static void svm_init_hypercall_page(void *p)
+static void cf_check svm_init_hypercall_page(void *p)
 {
     unsigned int i;
 
@@ -1144,7 +1145,7 @@ static int acpi_c1e_quirk(int dir, unsigned int port, unsigned int bytes,
     return X86EMUL_OKAY;
 }
 
-static int svm_domain_initialise(struct domain *d)
+static int cf_check svm_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
         .from = svm_ctxt_switch_from,
@@ -1162,7 +1163,7 @@ static int svm_domain_initialise(struct domain *d)
     return 0;
 }
 
-static int svm_vcpu_initialise(struct vcpu *v)
+static int cf_check svm_vcpu_initialise(struct vcpu *v)
 {
     int rc;
 
@@ -1179,7 +1180,7 @@ static int svm_vcpu_initialise(struct vcpu *v)
     return 0;
 }
 
-static void svm_vcpu_destroy(struct vcpu *v)
+static void cf_check svm_vcpu_destroy(struct vcpu *v)
 {
     svm_destroy_vmcb(v);
     passive_domain_destroy(v);
@@ -1300,7 +1301,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
     event->error_code = ec;
 }
 
-static void svm_inject_event(const struct x86_event *event)
+static void cf_check svm_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
     struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
@@ -1430,12 +1431,12 @@ static void svm_inject_event(const struct x86_event *event)
         HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
 
-static bool svm_event_pending(const struct vcpu *v)
+static bool cf_check svm_event_pending(const struct vcpu *v)
 {
     return v->arch.hvm.svm.vmcb->event_inj.v;
 }
 
-static void svm_cpu_dead(unsigned int cpu)
+static void cf_check svm_cpu_dead(unsigned int cpu)
 {
     paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
@@ -1461,7 +1462,7 @@ static void svm_cpu_dead(unsigned int cpu)
     }
 }
 
-static int svm_cpu_up_prepare(unsigned int cpu)
+static int cf_check svm_cpu_up_prepare(unsigned int cpu)
 {
     paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
@@ -1616,7 +1617,7 @@ static int _svm_cpu_up(bool bsp)
     return 0;
 }
 
-static int svm_cpu_up(void)
+static int cf_check svm_cpu_up(void)
 {
     return _svm_cpu_up(false);
 }
@@ -1745,7 +1746,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void svm_fpu_dirty_intercept(void)
+static void cf_check svm_fpu_dirty_intercept(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -1791,7 +1792,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
     __restore_debug_registers(vmcb, v);
 }
 
-static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
+static int cf_check svm_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *v = current;
     const struct domain *d = v->domain;
@@ -1986,7 +1988,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     return X86EMUL_EXCEPTION;
 }
 
-static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
+static int cf_check svm_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
@@ -2405,7 +2408,7 @@ static void svm_vmexit_mce_intercept(
     }
 }
 
-static void svm_wbinvd_intercept(void)
+static void cf_check svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
         flush_all(FLUSH_CACHE);
@@ -2450,12 +2453,13 @@ static bool is_invlpg(const struct x86_emulate_state *state,
            (ext & 7) == 7;
 }
 
-static void svm_invlpg(struct vcpu *v, unsigned long linear)
+static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
     svm_asid_g_invlpg(v, linear);
 }
 
-static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
+static bool cf_check svm_get_pending_event(
+    struct vcpu *v, struct x86_event *info)
 {
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb478782..13bbe8430df5 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -147,7 +147,7 @@ static void vmx_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
  *         used but may have negative impact on interrupt performance.
  */
 
-enum hvm_intblk nvmx_intr_blocked(struct vcpu *v)
+enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
 {
     int r = hvm_intblk_none;
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 1bb3710f7baa..441be8127148 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -655,7 +655,7 @@ void vmx_vmcs_reload(struct vcpu *v)
     vmx_load_vmcs(v);
 }
 
-int vmx_cpu_up_prepare(unsigned int cpu)
+int cf_check vmx_cpu_up_prepare(unsigned int cpu)
 {
     /*
      * If nvmx_cpu_up_prepare() failed, do not return failure and just fallback
@@ -676,7 +676,7 @@ int vmx_cpu_up_prepare(unsigned int cpu)
     return -ENOMEM;
 }
 
-void vmx_cpu_dead(unsigned int cpu)
+void cf_check vmx_cpu_dead(unsigned int cpu)
 {
     vmx_free_vmcs(per_cpu(vmxon_region, cpu));
     per_cpu(vmxon_region, cpu) = 0;
@@ -774,12 +774,12 @@ static int _vmx_cpu_up(bool bsp)
     return 0;
 }
 
-int vmx_cpu_up()
+int cf_check vmx_cpu_up()
 {
     return _vmx_cpu_up(false);
 }
 
-void vmx_cpu_down(void)
+void cf_check vmx_cpu_down(void)
 {
     struct list_head *active_vmcs_list = &this_cpu(active_vmcs_list);
     unsigned long flags;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b1eee802fde7..88a6a5ec824b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -68,14 +68,16 @@ static void vmx_ctxt_switch_to(struct vcpu *v);
 
 static int alloc_vlapic_mapping(void);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
-                                unsigned int flags);
-static void vmx_update_guest_efer(struct vcpu *v);
-static void vmx_wbinvd_intercept(void);
-static void vmx_fpu_dirty_intercept(void);
-static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content);
-static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
-static void vmx_invlpg(struct vcpu *v, unsigned long linear);
+static void cf_check vmx_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags);
+static void cf_check vmx_update_guest_efer(struct vcpu *v);
+static void cf_check vmx_wbinvd_intercept(void);
+static void cf_check vmx_fpu_dirty_intercept(void);
+static int cf_check vmx_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content);
+static int cf_check vmx_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content);
+static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear);
 
 static mfn_t __read_mostly apic_access_mfn = INVALID_MFN_INITIALIZER;
 
@@ -103,7 +105,7 @@ void vmx_pi_per_cpu_init(unsigned int cpu)
     spin_lock_init(&per_cpu(vmx_pi_blocking, cpu).lock);
 }
 
-static void vmx_vcpu_block(struct vcpu *v)
+static void cf_check vmx_vcpu_block(struct vcpu *v)
 {
     unsigned long flags;
     unsigned int dest;
@@ -395,7 +397,7 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_unpause(d);
 }
 
-static int vmx_domain_initialise(struct domain *d)
+static int cf_check vmx_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
         .from = vmx_ctxt_switch_from,
@@ -414,7 +416,7 @@ static int vmx_domain_initialise(struct domain *d)
     return 0;
 }
 
-static void domain_creation_finished(struct domain *d)
+static void cf_check domain_creation_finished(struct domain *d)
 {
     gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
     bool ipat;
@@ -444,7 +446,7 @@ static void vmx_init_ipt(struct vcpu *v)
     v->arch.msrs->rtit.output_limit = size - 1;
 }
 
-static int vmx_vcpu_initialise(struct vcpu *v)
+static int cf_check vmx_vcpu_initialise(struct vcpu *v)
 {
     int rc;
 
@@ -491,7 +493,7 @@ static int vmx_vcpu_initialise(struct vcpu *v)
     return 0;
 }
 
-static void vmx_vcpu_destroy(struct vcpu *v)
+static void cf_check vmx_vcpu_destroy(struct vcpu *v)
 {
     /*
      * There are cases that domain still remains in log-dirty mode when it is
@@ -589,7 +591,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
         __vmwrite(EXCEPTION_BITMAP, bitmap);
 }
 
-static void vmx_cpuid_policy_changed(struct vcpu *v)
+static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
 
@@ -625,7 +627,7 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
 }
 
-int vmx_guest_x86_mode(struct vcpu *v)
+int cf_check vmx_guest_x86_mode(struct vcpu *v)
 {
     unsigned long cs_ar_bytes;
 
@@ -822,7 +824,7 @@ static void vmx_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 }
 
 
-static void vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static void cf_check vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     if ( v == current )
         vmx_save_guest_msrs(v);
@@ -831,7 +833,7 @@ static void vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     vmx_vmcs_save(v, ctxt);
 }
 
-static int vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     /* Not currently safe to use in current context. */
     ASSERT(v != current);
@@ -857,7 +859,7 @@ static void vmx_fpu_enter(struct vcpu *v)
     __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
 }
 
-static void vmx_fpu_leave(struct vcpu *v)
+static void cf_check vmx_fpu_leave(struct vcpu *v)
 {
     ASSERT(!v->fpu_dirtied);
     ASSERT(read_cr0() & X86_CR0_TS);
@@ -934,7 +936,7 @@ unsigned int vmx_get_cpl(void)
     return (attr >> 5) & 3;
 }
 
-static unsigned int _vmx_get_cpl(struct vcpu *v)
+static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)
 {
     unsigned int cpl;
 
@@ -960,8 +962,8 @@ static unsigned int _vmx_get_cpl(struct vcpu *v)
 #define vm86_ds_attr 0xf3
 #define vm86_tr_attr 0x8b
 
-static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check vmx_get_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     unsigned long attr = 0, sel = 0, limit;
 
@@ -1061,8 +1063,8 @@ static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check vmx_set_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     uint32_t attr, sel, limit;
     uint64_t base;
@@ -1161,12 +1163,12 @@ static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
     vmx_vmcs_exit(v);
 }
 
-static unsigned long vmx_get_shadow_gs_base(struct vcpu *v)
+static unsigned long cf_check vmx_get_shadow_gs_base(struct vcpu *v)
 {
     return v->arch.hvm.vmx.shadow_gs;
 }
 
-static int vmx_set_guest_pat(struct vcpu *v, u64 gpat)
+static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
          unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
@@ -1178,7 +1180,7 @@ static int vmx_set_guest_pat(struct vcpu *v, u64 gpat)
     return 1;
 }
 
-static int vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
+static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
          unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
@@ -1190,7 +1192,7 @@ static int vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
     return 1;
 }
 
-static bool vmx_set_guest_bndcfgs(struct vcpu *v, u64 val)
+static bool cf_check vmx_set_guest_bndcfgs(struct vcpu *v, u64 val)
 {
     ASSERT(cpu_has_mpx && cpu_has_vmx_mpx);
 
@@ -1201,7 +1203,7 @@ static bool vmx_set_guest_bndcfgs(struct vcpu *v, u64 val)
     return true;
 }
 
-static bool vmx_get_guest_bndcfgs(struct vcpu *v, u64 *val)
+static bool cf_check vmx_get_guest_bndcfgs(struct vcpu *v, u64 *val)
 {
     ASSERT(cpu_has_mpx && cpu_has_vmx_mpx);
 
@@ -1212,7 +1214,7 @@ static bool vmx_get_guest_bndcfgs(struct vcpu *v, u64 *val)
     return true;
 }
 
-static void vmx_handle_cd(struct vcpu *v, unsigned long value)
+static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
     {
@@ -1262,7 +1264,7 @@ static void vmx_handle_cd(struct vcpu *v, unsigned long value)
     }
 }
 
-static void vmx_setup_tsc_scaling(struct vcpu *v)
+static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
 {
     if ( v->domain->arch.vtsc )
         return;
@@ -1272,7 +1274,7 @@ static void vmx_setup_tsc_scaling(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     vmx_vmcs_enter(v);
 
@@ -1283,7 +1285,7 @@ static void vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
+static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
     vmx_vmcs_enter(v);
     v->arch.hvm.vmx.exec_control &= ~CPU_BASED_RDTSC_EXITING;
@@ -1293,7 +1295,8 @@ static void vmx_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_descriptor_access_exiting(struct vcpu *v, bool enable)
+static void cf_check vmx_set_descriptor_access_exiting(
+    struct vcpu *v, bool enable)
 {
     if ( enable )
         v->arch.hvm.vmx.secondary_exec_control |=
@@ -1307,7 +1310,7 @@ static void vmx_set_descriptor_access_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_init_hypercall_page(void *p)
+static void cf_check vmx_init_hypercall_page(void *p)
 {
     unsigned int i;
 
@@ -1330,7 +1333,7 @@ static void vmx_init_hypercall_page(void *p)
     }
 }
 
-static unsigned int vmx_get_interrupt_shadow(struct vcpu *v)
+static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
@@ -1339,7 +1342,8 @@ static unsigned int vmx_get_interrupt_shadow(struct vcpu *v)
     return intr_shadow;
 }
 
-static void vmx_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
+static void cf_check vmx_set_interrupt_shadow(
+    struct vcpu *v, unsigned int intr_shadow)
 {
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
 }
@@ -1390,7 +1394,7 @@ static void vmx_load_pdptrs(struct vcpu *v)
     return;
 }
 
-static void vmx_update_host_cr3(struct vcpu *v)
+static void cf_check vmx_update_host_cr3(struct vcpu *v)
 {
     vmx_vmcs_enter(v);
     __vmwrite(HOST_CR3, v->arch.cr3);
@@ -1409,8 +1413,8 @@ void vmx_update_debug_state(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
-                                unsigned int flags)
+static void cf_check vmx_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags)
 {
     vmx_vmcs_enter(v);
 
@@ -1612,7 +1616,7 @@ static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_guest_efer(struct vcpu *v)
+static void cf_check vmx_update_guest_efer(struct vcpu *v)
 {
     unsigned long entry_ctls, guest_efer = v->arch.hvm.guest_efer,
         xen_efer = read_efer();
@@ -1714,7 +1718,8 @@ void nvmx_enqueue_n2_exceptions(struct vcpu *v,
                  nvmx->intr.intr_info, nvmx->intr.error_code);
 }
 
-static int nvmx_vmexit_event(struct vcpu *v, const struct x86_event *event)
+static int cf_check nvmx_vmexit_event(
+    struct vcpu *v, const struct x86_event *event)
 {
     nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
                                hvm_intsrc_none);
@@ -1800,7 +1805,7 @@ void vmx_inject_nmi(void)
  *  - #DB is X86_EVENTTYPE_HW_EXCEPTION, except when generated by
  *    opcode 0xf1 (which is X86_EVENTTYPE_PRI_SW_EXCEPTION)
  */
-static void vmx_inject_event(const struct x86_event *event)
+static void cf_check vmx_inject_event(const struct x86_event *event)
 {
     unsigned long intr_info;
     struct vcpu *curr = current;
@@ -1881,7 +1886,7 @@ static void vmx_inject_event(const struct x86_event *event)
         HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
 
-static bool vmx_event_pending(const struct vcpu *v)
+static bool cf_check vmx_event_pending(const struct vcpu *v)
 {
     unsigned long intr_info;
 
@@ -1891,7 +1896,7 @@ static bool vmx_event_pending(const struct vcpu *v)
     return intr_info & INTR_INFO_VALID_MASK;
 }
 
-static void vmx_set_info_guest(struct vcpu *v)
+static void cf_check vmx_set_info_guest(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
@@ -1919,7 +1924,8 @@ static void vmx_set_info_guest(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_eoi_exit_bitmap(struct vcpu *v, uint8_t vector, bool set)
+static void cf_check vmx_update_eoi_exit_bitmap(
+    struct vcpu *v, uint8_t vector, bool set)
 {
     if ( set )
         vmx_set_eoi_exit_bitmap(v, vector);
@@ -1947,7 +1953,7 @@ static u8 set_svi(int isr)
     return old;
 }
 
-static void vmx_process_isr(int isr, struct vcpu *v)
+static void cf_check vmx_process_isr(int isr, struct vcpu *v)
 {
     unsigned int i;
     const struct vlapic *vlapic = vcpu_vlapic(v);
@@ -2035,7 +2041,7 @@ static void __vmx_deliver_posted_interrupt(struct vcpu *v)
     }
 }
 
-static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
+static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 {
     struct pi_desc old, new, prev;
 
@@ -2082,7 +2088,7 @@ static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
     __vmx_deliver_posted_interrupt(v);
 }
 
-static void vmx_sync_pir_to_irr(struct vcpu *v)
+static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int group, i;
@@ -2098,12 +2104,12 @@ static void vmx_sync_pir_to_irr(struct vcpu *v)
         vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
 }
 
-static bool vmx_test_pir(const struct vcpu *v, uint8_t vec)
+static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
 {
     return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
 }
 
-static void vmx_handle_eoi(uint8_t vector, int isr)
+static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
 {
     uint8_t old_svi = set_svi(isr);
     static bool warned;
@@ -2112,7 +2118,7 @@ static void vmx_handle_eoi(uint8_t vector, int isr)
         printk(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
-static void vmx_enable_msr_interception(struct domain *d, uint32_t msr)
+static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
 
@@ -2120,12 +2126,12 @@ static void vmx_enable_msr_interception(struct domain *d, uint32_t msr)
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
 
-static bool_t vmx_is_singlestep_supported(void)
+static bool cf_check vmx_is_singlestep_supported(void)
 {
     return !!cpu_has_monitor_trap_flag;
 }
 
-static void vmx_vcpu_update_eptp(struct vcpu *v)
+static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct p2m_domain *p2m = NULL;
@@ -2150,7 +2156,7 @@ static void vmx_vcpu_update_eptp(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
+static void cf_check vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
 {
     struct domain *d = v->domain;
     u32 mask = SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
@@ -2194,7 +2200,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static int vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
+static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
 {
     int rc = X86EMUL_EXCEPTION;
     struct vcpu *curr = current;
@@ -2207,7 +2213,7 @@ static int vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
     return rc;
 }
 
-static bool_t vmx_vcpu_emulate_ve(struct vcpu *v)
+static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
 {
     const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
     ve_info_t *veinfo;
@@ -2244,7 +2250,8 @@ static bool_t vmx_vcpu_emulate_ve(struct vcpu *v)
     return rc;
 }
 
-static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
+static bool cf_check vmx_get_pending_event(
+    struct vcpu *v, struct x86_event *info)
 {
     unsigned long intr_info, error_code;
 
@@ -2281,7 +2288,8 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
      RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
 
-static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
+static int cf_check vmtrace_get_option(
+    struct vcpu *v, uint64_t key, uint64_t *output)
 {
     const struct vcpu_msrs *msrs = v->arch.msrs;
 
@@ -2302,7 +2310,8 @@ static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
     return 0;
 }
 
-static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
+static int cf_check vmtrace_set_option(
+    struct vcpu *v, uint64_t key, uint64_t value)
 {
     struct vcpu_msrs *msrs = v->arch.msrs;
     bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
@@ -2356,7 +2365,7 @@ static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
     return 0;
 }
 
-static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
+static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     struct vcpu_msrs *msrs = v->arch.msrs;
     uint64_t new_ctl;
@@ -2388,13 +2397,13 @@ static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
     return 0;
 }
 
-static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
     *pos = v->arch.msrs->rtit.output_offset;
     return v->arch.hvm.vmx.ipt_active;
 }
 
-static int vmtrace_reset(struct vcpu *v)
+static int cf_check vmtrace_reset(struct vcpu *v)
 {
     if ( !v->arch.hvm.vmx.ipt_active )
         return -EINVAL;
@@ -2764,7 +2773,7 @@ void update_guest_eip(void)
         hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
-static void vmx_fpu_dirty_intercept(void)
+static void cf_check vmx_fpu_dirty_intercept(void)
 {
     struct vcpu *curr = current;
 
@@ -2799,7 +2808,7 @@ static void vmx_invlpg_intercept(unsigned long linear)
     paging_invlpg(current, linear);
 }
 
-static void vmx_invlpg(struct vcpu *v, unsigned long linear)
+static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear)
 {
     if ( cpu_has_vmx_vpid )
         vpid_sync_vcpu_gva(v, linear);
@@ -3125,7 +3134,8 @@ static int is_last_branch_msr(u32 ecx)
     return 0;
 }
 
-static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
+static int cf_check vmx_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
     uint64_t tmp;
@@ -3328,7 +3338,8 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
+static int cf_check vmx_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
@@ -3528,7 +3539,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     do_IRQ(regs);
 }
 
-static void vmx_wbinvd_intercept(void)
+static void cf_check vmx_wbinvd_intercept(void)
 {
     if ( !cache_flush_permitted(current->domain) || iommu_snoop )
         return;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e9f94daf6493..12d80be9ee57 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -62,7 +62,7 @@ void nvmx_cpu_dead(unsigned int cpu)
     XFREE(per_cpu(vvmcs_buf, cpu));
 }
 
-int nvmx_vcpu_initialise(struct vcpu *v)
+int cf_check nvmx_vcpu_initialise(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
@@ -150,7 +150,7 @@ int nvmx_vcpu_initialise(struct vcpu *v)
     return 0;
 }
  
-void nvmx_vcpu_destroy(struct vcpu *v)
+void cf_check nvmx_vcpu_destroy(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
@@ -199,7 +199,7 @@ static void vcpu_relinquish_resources(struct vcpu *v)
     FREE_XENHEAP_PAGE(nvmx->msr_merged);
 }
 
-void nvmx_domain_relinquish_resources(struct domain *d)
+void cf_check nvmx_domain_relinquish_resources(struct domain *d)
 {
     struct vcpu *v;
 
@@ -210,17 +210,17 @@ void nvmx_domain_relinquish_resources(struct domain *d)
     }
 }
 
-int nvmx_vcpu_reset(struct vcpu *v)
+int cf_check nvmx_vcpu_reset(struct vcpu *v)
 {
     return 0;
 }
 
-uint64_t nvmx_vcpu_eptp_base(struct vcpu *v)
+uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v)
 {
     return get_vvmcs(v, EPT_POINTER) & PAGE_MASK;
 }
 
-bool_t nvmx_ept_enabled(struct vcpu *v)
+bool cf_check nvmx_ept_enabled(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
 
@@ -514,7 +514,7 @@ static void vmfail(struct cpu_user_regs *regs, enum vmx_insn_errno errno)
         vmfail_invalid(regs);
 }
 
-bool_t nvmx_intercepts_exception(
+bool cf_check nvmx_intercepts_exception(
     struct vcpu *v, unsigned int vector, int error_code)
 {
     u32 exception_bitmap, pfec_match=0, pfec_mask=0;
@@ -2346,10 +2346,9 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int
-nvmx_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x)
+int cf_check nvmx_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, bool access_r, bool access_w, bool access_x)
 {
     int rc;
     unsigned long gfn;
diff --git a/xen/include/asm-x86/hvm/svm/nestedsvm.h b/xen/include/asm-x86/hvm/svm/nestedsvm.h
index 087369845761..32ba092a30cd 100644
--- a/xen/include/asm-x86/hvm/svm/nestedsvm.h
+++ b/xen/include/asm-x86/hvm/svm/nestedsvm.h
@@ -107,24 +107,24 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
 void svm_nested_features_on_efer_update(struct vcpu *v);
 
 /* Interface methods */
-void nsvm_vcpu_destroy(struct vcpu *v);
-int nsvm_vcpu_initialise(struct vcpu *v);
-int nsvm_vcpu_reset(struct vcpu *v);
+void cf_check nsvm_vcpu_destroy(struct vcpu *v);
+int cf_check nsvm_vcpu_initialise(struct vcpu *v);
+int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
-int nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *event);
-uint64_t nsvm_vcpu_hostcr3(struct vcpu *v);
-bool_t nsvm_vmcb_guest_intercepts_event(
+int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *event);
+uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
+bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode);
-bool_t nsvm_vmcb_hap_enabled(struct vcpu *v);
-enum hvm_intblk nsvm_intr_blocked(struct vcpu *v);
+bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
+enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
 
 /* Interrupts, vGIF */
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
 void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
 bool_t nestedsvm_gif_isset(struct vcpu *v);
-int nsvm_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                         unsigned int *page_order, uint8_t *p2m_acc,
-                         bool_t access_r, bool_t access_w, bool_t access_x);
+int cf_check nsvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, bool access_r, bool access_w, bool access_x);
 
 #define NSVM_INTR_NOTHANDLED     3
 #define NSVM_INTR_NOTINTERCEPTED 2
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index 05e968502694..6292133ca21e 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -47,7 +47,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
 
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 03c9ccf627ab..9119aa8536df 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -22,10 +22,10 @@
 
 extern void vmcs_dump_vcpu(struct vcpu *v);
 extern int vmx_vmcs_init(void);
-extern int  vmx_cpu_up_prepare(unsigned int cpu);
-extern void vmx_cpu_dead(unsigned int cpu);
-extern int  vmx_cpu_up(void);
-extern void vmx_cpu_down(void);
+int cf_check vmx_cpu_up_prepare(unsigned int cpu);
+void cf_check vmx_cpu_dead(unsigned int cpu);
+int cf_check vmx_cpu_up(void);
+void cf_check vmx_cpu_down(void);
 
 struct vmcs_struct {
     u32 vmcs_revision_id;
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 85530d2e0e26..459c84dd9f09 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -587,7 +587,7 @@ static inline int __vmxon(u64 addr)
     return rc;
 }
 
-int vmx_guest_x86_mode(struct vcpu *v);
+int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
 
 void vmx_inject_extint(int trap, uint8_t source);
diff --git a/xen/include/asm-x86/hvm/vmx/vvmx.h b/xen/include/asm-x86/hvm/vmx/vvmx.h
index d5f68f30b129..6726c26f09fa 100644
--- a/xen/include/asm-x86/hvm/vmx/vvmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vvmx.h
@@ -84,26 +84,25 @@ union vmx_inst_info {
     u32 word;
 };
 
-int nvmx_vcpu_initialise(struct vcpu *v);
-void nvmx_vcpu_destroy(struct vcpu *v);
-int nvmx_vcpu_reset(struct vcpu *v);
-uint64_t nvmx_vcpu_eptp_base(struct vcpu *v);
-enum hvm_intblk nvmx_intr_blocked(struct vcpu *v);
-bool_t nvmx_intercepts_exception(
+int cf_check nvmx_vcpu_initialise(struct vcpu *v);
+void cf_check nvmx_vcpu_destroy(struct vcpu *v);
+int cf_check nvmx_vcpu_reset(struct vcpu *v);
+uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v);
+enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v);
+bool cf_check nvmx_intercepts_exception(
     struct vcpu *v, unsigned int vector, int error_code);
-void nvmx_domain_relinquish_resources(struct domain *d);
+void cf_check nvmx_domain_relinquish_resources(struct domain *d);
 
-bool_t nvmx_ept_enabled(struct vcpu *v);
+bool cf_check nvmx_ept_enabled(struct vcpu *v);
 
 #define EPT_TRANSLATE_SUCCEED       0
 #define EPT_TRANSLATE_VIOLATION     1
 #define EPT_TRANSLATE_MISCONFIG     2
 #define EPT_TRANSLATE_RETRY         3
 
-int
-nvmx_hap_walk_L1_p2m(struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa,
-                     unsigned int *page_order, uint8_t *p2m_acc,
-                     bool_t access_r, bool_t access_w, bool_t access_x);
+int cf_check nvmx_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, bool access_r, bool access_w, bool access_x);
 /*
  * Virtual VMCS layout
  *
-- 
2.11.0


