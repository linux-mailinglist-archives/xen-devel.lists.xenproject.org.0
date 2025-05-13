Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA1AB4AFB
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 07:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982483.1368842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCP-0003X0-4A; Tue, 13 May 2025 05:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982483.1368842; Tue, 13 May 2025 05:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCP-0003VT-0R; Tue, 13 May 2025 05:29:05 +0000
Received: by outflank-mailman (input) for mailman id 982483;
 Tue, 13 May 2025 05:29:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ws9y=X5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uEiCN-0003NS-02
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 05:29:03 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bf58ebe-2fbb-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 07:28:59 +0200 (CEST)
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
X-Inumbo-ID: 2bf58ebe-2fbb-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747114137; x=1747373337;
	bh=bf36XoFZ8pHmwDNnfTbiLOydmIWMr92nck/XVDPHPgc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RTdM19kFYdu39rtmWmCXqC+0nlr2OsVpZkH21KOdSmNUoSZBgMMIZOQSclBrR7vPm
	 nL/kKmbw0KLNaYC5RCHDzCXus7onFU+RfQw8oxoaxQcdkOAYpDCNQDfeqIEy1fb5Wt
	 4dQ4CtJVm8TEwF67VNv5Zk1W9xUMt9rs4bvvnAMwkV6ruTgXlPECqqEAEyD72My05P
	 hxkLEFE1hunnbXmBEzQEcUEKWadYfkzZmvnerNZqQcxYnFFQukYcKBZg5+sZzluCKE
	 US1Qr7ORtHxq3R+/2D5EDS1Ep/2LGpuMjwUbgAB0OZBQXfxoNv1dTSgehDTiAP14AB
	 ucyvq2wMhMx8Q==
Date: Tue, 13 May 2025 05:28:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com
Subject: [PATCH v5 1/2] x86/vmx: replace __vmread() with vmread()
Message-ID: <20250513052809.3947164-2-dmukhin@ford.com>
In-Reply-To: <20250513052809.3947164-1-dmukhin@ford.com>
References: <20250513052809.3947164-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a8fc4d77a667e971c48657b5b9063da0ea5c4a26
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use vmread() instead of __vmread() everywhere in the VT-x code.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/cpu/vpmu_intel.c   |   2 +-
 xen/arch/x86/hvm/vmx/intr.c     |  12 +--
 xen/arch/x86/hvm/vmx/realmode.c |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c     |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c      | 170 ++++++++++++++++----------------
 xen/arch/x86/hvm/vmx/vvmx.c     |  36 +++----
 6 files changed, 115 insertions(+), 115 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 7ce98ee42e..e358342ac9 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -796,7 +796,7 @@ static int cf_check core2_vpmu_do_interrupt(void)
     else
     {
         /* No PMC overflow but perhaps a Trace Message interrupt. */
-        __vmread(GUEST_IA32_DEBUGCTL, &msr_content);
+        msr_content =3D vmread(GUEST_IA32_DEBUGCTL);
         if ( !(msr_content & IA32_DEBUGCTLMSR_TR) )
             return 0;
     }
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 91b407e6bc..b622ae1e60 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -65,7 +65,7 @@ static void vmx_enable_intr_window(struct vcpu *v, struct=
 hvm_intack intack)
     {
         unsigned long intr;
=20
-        __vmread(VM_ENTRY_INTR_INFO, &intr);
+        intr =3D vmread(VM_ENTRY_INTR_INFO);
         TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
               (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
     }
@@ -83,7 +83,7 @@ static void vmx_enable_intr_window(struct vcpu *v, struct=
 hvm_intack intack)
          */
         unsigned long intr_shadow;
=20
-        __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+        intr_shadow =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
         if ( intr_shadow & VMX_INTR_SHADOW_STI )
         {
             /* Having both STI-blocking and MOV-SS-blocking fails vmentry.=
 */
@@ -148,7 +148,7 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu =
*v)
         {
             unsigned long intr_info;
=20
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+            intr_info =3D vmread(VM_ENTRY_INTR_INFO);
             if ( intr_info & INTR_INFO_VALID_MASK )
                 r =3D hvm_intblk_rflags_ie;
         }
@@ -275,7 +275,7 @@ void asmlinkage vmx_intr_assist(void)
                 goto out;
             }
=20
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+            intr_info =3D vmread(VM_ENTRY_INTR_INFO);
             if ( intr_info & INTR_INFO_VALID_MASK )
             {
                 if ( (intack.source =3D=3D hvm_intsrc_pic) ||
@@ -299,7 +299,7 @@ void asmlinkage vmx_intr_assist(void)
         }
         else
         {
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+            intr_info =3D vmread(VM_ENTRY_INTR_INFO);
             if ( intr_info & INTR_INFO_VALID_MASK )
             {
                 vmx_enable_intr_window(v, intack);
@@ -377,7 +377,7 @@ void asmlinkage vmx_intr_assist(void)
         }
=20
         /* we need update the RVI field */
-        __vmread(GUEST_INTR_STATUS, &status);
+        status =3D vmread(GUEST_INTR_STATUS);
         status &=3D ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
         status |=3D VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK &
                     intack.vector;
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmod=
e.c
index ff44ddcfa6..40cbc273d0 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -159,7 +159,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     unsigned int emulations =3D 0;
=20
     /* Get-and-clear VM_ENTRY_INTR_INFO. */
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+    intr_info =3D vmread(VM_ENTRY_INTR_INFO);
     if ( intr_info & INTR_INFO_VALID_MASK )
         __vmwrite(VM_ENTRY_INTR_INFO, 0);
=20
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15..f6267f65dd 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1031,7 +1031,7 @@ u64 virtual_vmcs_vmread(const struct vcpu *v, u32 vmc=
s_encoding)
     u64 res;
=20
     virtual_vmcs_enter(v);
-    __vmread(vmcs_encoding, &res);
+    res =3D vmread(vmcs_encoding);
     virtual_vmcs_exit(v);
=20
     return res;
@@ -1691,7 +1691,7 @@ void vmx_vcpu_flush_pml_buffer(struct vcpu *v)
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_PML_INDEX, &pml_idx);
+    pml_idx =3D vmread(GUEST_PML_INDEX);
=20
     /* Do nothing if PML buffer is empty. */
     if ( pml_idx =3D=3D (NR_PML_ENTRIES - 1) )
@@ -1876,7 +1876,7 @@ void vmx_vmentry_failure(void)
     struct vcpu *curr =3D current;
     unsigned long error;
=20
-    __vmread(VM_INSTRUCTION_ERROR, &error);
+    error =3D vmread(VM_INSTRUCTION_ERROR);
     gprintk(XENLOG_ERR, "VM%s error: %#lx\n",
             curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH", error);
=20
@@ -1957,7 +1957,7 @@ void cf_check vmx_do_resume(void)
     hvm_do_resume(v);
=20
     /* Sync host CR4 in case its value has changed. */
-    __vmread(HOST_CR4, &host_cr4);
+    host_cr4 =3D vmread(HOST_CR4);
     if ( host_cr4 !=3D read_cr4() )
         __vmwrite(HOST_CR4, read_cr4());
=20
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 827db6bdd8..203ca83c16 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -902,7 +902,7 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
         return X86_MODE_REAL;
     if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
         return X86_MODE_VM86;
-    __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
+    cs_ar_bytes =3D vmread(GUEST_CS_AR_BYTES);
     if ( hvm_long_mode_active(v) &&
          likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
         return X86_MODE_64BIT;
@@ -952,7 +952,7 @@ static void __restore_debug_registers(struct vcpu *v)
  */
 static void vmx_restore_dr(struct vcpu *v)
 {
-    /* NB. __vmread() is not usable here, so we cannot read from the VMCS.=
 */
+    /* NB. vmread() is not usable here, so we cannot read from the VMCS. *=
/
     if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
         __restore_debug_registers(v);
 }
@@ -963,17 +963,17 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_=
hw_cpu *c)
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_SYSENTER_CS, &c->sysenter_cs);
-    __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
-    __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
+    c->sysenter_cs =3D vmread(GUEST_SYSENTER_CS);
+    c->sysenter_esp =3D vmread(GUEST_SYSENTER_ESP);
+    c->sysenter_eip =3D vmread(GUEST_SYSENTER_EIP);
=20
-    __vmread(VM_ENTRY_INTR_INFO, &ev);
+    ev =3D vmread(VM_ENTRY_INTR_INFO);
     if ( (ev & INTR_INFO_VALID_MASK) &&
          hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MAS=
K),
                                      ev & INTR_INFO_VECTOR_MASK) )
     {
         c->pending_event =3D ev;
-        __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &ev);
+        ev =3D vmread(VM_ENTRY_EXCEPTION_ERROR_CODE);
         c->error_code =3D ev;
     }
=20
@@ -1199,7 +1199,7 @@ unsigned int vmx_get_cpl(void)
 {
     unsigned long attr;
=20
-    __vmread(GUEST_SS_AR_BYTES, &attr);
+    attr =3D vmread(GUEST_SS_AR_BYTES);
=20
     return MASK_EXTR(attr, X86_SEG_AR_DPL);
 }
@@ -1271,14 +1271,14 @@ static void cf_check vmx_get_segment_register(
         fallthrough;
=20
     case x86_seg_es ... x86_seg_gs:
-        __vmread(GUEST_SEG_SELECTOR(tmp_seg), &sel);
-        __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
+        sel =3D vmread(GUEST_SEG_SELECTOR(tmp_seg));
+        attr =3D vmread(GUEST_SEG_AR_BYTES(tmp_seg));
         fallthrough;
=20
     case x86_seg_gdtr:
     case x86_seg_idtr:
-        __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
-        __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
+        limit =3D vmread(GUEST_SEG_LIMIT(tmp_seg));
+        reg->base =3D vmread(GUEST_SEG_BASE(tmp_seg));
         break;
=20
     default:
@@ -1436,7 +1436,7 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v,=
 u64 *gpat)
         return 0;
=20
     vmx_vmcs_enter(v);
-    __vmread(GUEST_PAT, gpat);
+    *gpat =3D vmread(GUEST_PAT);
     vmx_vmcs_exit(v);
     return 1;
 }
@@ -1557,7 +1557,7 @@ static unsigned int cf_check vmx_get_interrupt_shadow=
(struct vcpu *v)
 {
     unsigned long intr_shadow;
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    intr_shadow =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
=20
     return intr_shadow;
 }
@@ -1573,12 +1573,12 @@ static void cf_check vmx_get_nonreg_state(struct vc=
pu *v,
 {
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info)=
;
-    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
+    nrs->vmx.activity_state =3D vmread(GUEST_ACTIVITY_STATE);
+    nrs->vmx.interruptibility_info =3D vmread(GUEST_INTERRUPTIBILITY_INFO)=
;
+    nrs->vmx.pending_dbg =3D vmread(GUEST_PENDING_DBG_EXCEPTIONS);
=20
     if ( cpu_has_vmx_virtual_intr_delivery )
-        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
+        nrs->vmx.interrupt_status =3D vmread(GUEST_INTR_STATUS);
=20
     vmx_vmcs_exit(v);
 }
@@ -1896,7 +1896,7 @@ static void cf_check vmx_update_guest_efer(struct vcp=
u *v)
      * The intended guest running mode is derived from VM_ENTRY_IA32E_MODE=
,
      * which (architecturally) is the guest's LMA setting.
      */
-    __vmread(VM_ENTRY_CONTROLS, &entry_ctls);
+    entry_ctls =3D vmread(VM_ENTRY_CONTROLS);
=20
     entry_ctls &=3D ~VM_ENTRY_IA32E_MODE;
     if ( guest_efer & EFER_LMA )
@@ -2063,9 +2063,9 @@ static void cf_check vmx_inject_event(const struct x8=
6_event *event)
         {
             unsigned long val;
=20
-            __vmread(GUEST_DR7, &val);
+            val =3D vmread(GUEST_DR7);
             __vmwrite(GUEST_DR7, val & ~DR_GENERAL_DETECT);
-            __vmread(GUEST_IA32_DEBUGCTL, &val);
+            val =3D vmread(GUEST_IA32_DEBUGCTL);
             __vmwrite(GUEST_IA32_DEBUGCTL, val & ~IA32_DEBUGCTLMSR_LBR);
         }
         if ( cpu_has_monitor_trap_flag )
@@ -2089,7 +2089,7 @@ static void cf_check vmx_inject_event(const struct x8=
6_event *event)
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         intr_info =3D vcpu_2_nvmx(curr).intr.intr_info;
     else
-        __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+        intr_info =3D vmread(VM_ENTRY_INTR_INFO);
=20
     if ( unlikely(intr_info & INTR_INFO_VALID_MASK) &&
          (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) =3D=3D X86_ET_HW_=
EXC) )
@@ -2128,7 +2128,7 @@ static bool cf_check vmx_event_pending(const struct v=
cpu *v)
     unsigned long intr_info;
=20
     ASSERT(v =3D=3D current);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+    intr_info =3D vmread(VM_ENTRY_INTR_INFO);
=20
     return intr_info & INTR_INFO_VALID_MASK;
 }
@@ -2149,7 +2149,7 @@ static void cf_check vmx_set_info_guest(struct vcpu *=
v)
      * to set the GUEST_PENDING_DBG_EXCEPTIONS.BS here incurs
      * immediately vmexit and hence make no progress.
      */
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    intr_shadow =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( v->domain->debugger_attached &&
          (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
          (intr_shadow & VMX_INTR_SHADOW_STI) )
@@ -2178,7 +2178,7 @@ static u8 set_svi(int isr)
     if ( isr < 0 )
         isr =3D 0;
=20
-    __vmread(GUEST_INTR_STATUS, &status);
+    status =3D vmread(GUEST_INTR_STATUS);
     old =3D status >> VMX_GUEST_INTR_STATUS_SVI_OFFSET;
     if ( isr !=3D old )
     {
@@ -2518,9 +2518,9 @@ static bool cf_check vmx_vcpu_emulate_ve(struct vcpu =
*v)
     veinfo->eptp_index =3D vcpu_altp2m(v).p2midx;
=20
     vmx_vmcs_enter(v);
-    __vmread(EXIT_QUALIFICATION, &veinfo->exit_qualification);
-    __vmread(GUEST_LINEAR_ADDRESS, &veinfo->gla);
-    __vmread(GUEST_PHYSICAL_ADDRESS, &veinfo->gpa);
+    veinfo->exit_qualification =3D vmread(EXIT_QUALIFICATION);
+    veinfo->gla =3D vmread(GUEST_LINEAR_ADDRESS);
+    veinfo->gpa =3D vmread(GUEST_PHYSICAL_ADDRESS);
     vmx_vmcs_exit(v);
=20
     hvm_inject_hw_exception(X86_EXC_VE,
@@ -2541,8 +2541,8 @@ static bool cf_check vmx_get_pending_event(
     unsigned long intr_info, error_code;
=20
     vmx_vmcs_enter(v);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-    __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &error_code);
+    intr_info =3D vmread(VM_ENTRY_INTR_INFO);
+    error_code =3D vmread(VM_ENTRY_EXCEPTION_ERROR_CODE);
     vmx_vmcs_exit(v);
=20
     if ( !(intr_info & INTR_INFO_VALID_MASK) )
@@ -2739,11 +2739,11 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v=
, unsigned int reg)
     {
     case MSR_SPEC_CTRL:
         ASSERT(cpu_has_vmx_virt_spec_ctrl);
-        __vmread(SPEC_CTRL_SHADOW, &val);
+        val =3D vmread(SPEC_CTRL_SHADOW);
         break;
=20
     case MSR_IA32_BNDCFGS:
-        __vmread(GUEST_BNDCFGS, &val);
+        val =3D vmread(GUEST_BNDCFGS);
         break;
=20
     default:
@@ -3163,7 +3163,8 @@ static int get_instruction_length(void)
 {
     unsigned long len;
=20
-    __vmread(VM_EXIT_INSTRUCTION_LEN, &len); /* Safe: callers audited */
+    /* Safe: callers audited */
+    len =3D vmread(VM_EXIT_INSTRUCTION_LEN);
     BUG_ON((len < 1) || (len > MAX_INST_LEN));
     return len;
 }
@@ -3176,7 +3177,7 @@ void update_guest_eip(void)
     regs->rip +=3D get_instruction_length(); /* Safe: callers audited */
     regs->eflags &=3D ~X86_EFLAGS_RF;
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &x);
+    x =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( x & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS) )
     {
         x &=3D ~(VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS);
@@ -3424,21 +3425,21 @@ static int cf_check vmx_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        __vmread(GUEST_SYSENTER_CS, msr_content);
+        *msr_content =3D vmread(GUEST_SYSENTER_CS);
         break;
     case MSR_IA32_SYSENTER_ESP:
-        __vmread(GUEST_SYSENTER_ESP, msr_content);
+        *msr_content =3D vmread(GUEST_SYSENTER_ESP);
         break;
     case MSR_IA32_SYSENTER_EIP:
-        __vmread(GUEST_SYSENTER_EIP, msr_content);
+        *msr_content =3D vmread(GUEST_SYSENTER_EIP);
         break;
=20
     case MSR_FS_BASE:
-        __vmread(GUEST_FS_BASE, msr_content);
+        *msr_content =3D vmread(GUEST_FS_BASE);
         break;
=20
     case MSR_GS_BASE:
-        __vmread(GUEST_GS_BASE, msr_content);
+        *msr_content =3D vmread(GUEST_GS_BASE);
         break;
=20
     case MSR_SHADOW_GS_BASE:
@@ -3462,7 +3463,7 @@ static int cf_check vmx_msr_read_intercept(
         break;
=20
     case MSR_IA32_DEBUGCTLMSR:
-        __vmread(GUEST_IA32_DEBUGCTL, msr_content);
+        *msr_content =3D vmread(GUEST_IA32_DEBUGCTL);
         break;
=20
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
@@ -3828,7 +3829,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
=20
-    __vmread(VM_EXIT_INTR_INFO, &vector);
+    vector =3D vmread(VM_EXIT_INTR_INFO);
     BUG_ON(!(vector & INTR_INFO_VALID_MASK));
=20
     vector &=3D INTR_INFO_VECTOR_MASK;
@@ -3893,7 +3894,7 @@ static void ept_handle_violation(ept_qual_t q, paddr_=
t gpa)
=20
     if ( q.gla_valid )
     {
-        __vmread(GUEST_LINEAR_ADDRESS, &gla);
+        gla =3D vmread(GUEST_LINEAR_ADDRESS);
         npfec.gla_valid =3D 1;
         if( q.gla_fault )
             npfec.kind =3D npfec_kind_with_gla;
@@ -3944,7 +3945,7 @@ static void vmx_failed_vmentry(unsigned int exit_reas=
on,
     struct vcpu *curr =3D current;
=20
     printk("%pv vmentry failure (reason %#x): ", curr, exit_reason);
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
+    exit_qualification =3D vmread(EXIT_QUALIFICATION);
     switch ( failed_vmentry_reason )
     {
     case EXIT_REASON_INVALID_GUEST_STATE:
@@ -4007,7 +4008,7 @@ static int vmx_handle_eoi_write(void)
      * 1. Must be a linear access data write.
      * 2. Data write must be to the EOI register.
      */
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
+    exit_qualification =3D vmread(EXIT_QUALIFICATION);
     if ( (((exit_qualification >> 12) & 0xf) =3D=3D 1) &&
          ((exit_qualification & 0xfff) =3D=3D APIC_EOI) )
     {
@@ -4037,7 +4038,7 @@ static void vmx_propagate_intr(unsigned long intr)
=20
     if ( intr & INTR_INFO_DELIVER_CODE_MASK )
     {
-        __vmread(VM_EXIT_INTR_ERROR_CODE, &tmp);
+        tmp =3D vmread(VM_EXIT_INTR_ERROR_CODE);
         event.error_code =3D tmp;
     }
     else
@@ -4045,7 +4046,7 @@ static void vmx_propagate_intr(unsigned long intr)
=20
     if ( event.type >=3D X86_ET_SW_INT )
     {
-        __vmread(VM_EXIT_INSTRUCTION_LEN, &tmp);
+        tmp =3D vmread(VM_EXIT_INSTRUCTION_LEN);
         event.insn_len =3D tmp;
     }
     else
@@ -4071,7 +4072,7 @@ static void vmx_idtv_reinject(unsigned long idtv_info=
)
             {
                 unsigned long ec;
=20
-                __vmread(IDT_VECTORING_ERROR_CODE, &ec);
+                ec =3D vmread(IDT_VECTORING_ERROR_CODE);
                 __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, ec);
             }
         }
@@ -4086,7 +4087,7 @@ static void vmx_idtv_reinject(unsigned long idtv_info=
)
         {
             unsigned long intr_info;
=20
-            __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_info);
+            intr_info =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
             __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
                       intr_info & ~VMX_INTR_SHADOW_NMI);
         }
@@ -4111,8 +4112,8 @@ static void vmx_handle_descriptor_access(uint32_t exi=
t_reason)
     uint64_t exit_qualification;
     unsigned int desc;
=20
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
-    __vmread(VMX_INSTRUCTION_INFO, &instr_info);
+    exit_qualification =3D vmread(EXIT_QUALIFICATION);
+    instr_info =3D vmread(VMX_INSTRUCTION_INFO);
=20
     if ( exit_reason =3D=3D EXIT_REASON_ACCESS_GDTR_OR_IDTR )
     {
@@ -4137,7 +4138,7 @@ static int vmx_handle_apic_write(void)
     unsigned long exit_qualification;
=20
     ASSERT(cpu_has_vmx_apic_reg_virt);
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
+    exit_qualification =3D vmread(EXIT_QUALIFICATION);
=20
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
@@ -4146,7 +4147,7 @@ static void undo_nmis_unblocked_by_iret(void)
 {
     unsigned long guest_info;
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+    guest_info =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
               guest_info | VMX_INTR_SHADOW_NMI);
 }
@@ -4159,12 +4160,12 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
     struct vcpu *v =3D current;
     struct domain *currd =3D v->domain;
=20
-    __vmread(GUEST_RIP,    &regs->rip);
-    __vmread(GUEST_RSP,    &regs->rsp);
-    __vmread(GUEST_RFLAGS, &regs->rflags);
+    regs->rip =3D vmread(GUEST_RIP);
+    regs->rsp =3D vmread(GUEST_RSP);
+    regs->rflags =3D vmread(GUEST_RFLAGS);
=20
     if ( hvm_long_mode_active(v) )
-        __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
+        cs_ar_bytes =3D vmread(GUEST_CS_AR_BYTES);
=20
     hvm_sanitize_regs_fields(regs, !(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE=
));
=20
@@ -4174,17 +4175,17 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
          * Xen allows the guest to modify some CR4 bits directly, update c=
ached
          * values to match.
          */
-        __vmread(GUEST_CR4, &v->arch.hvm.hw_cr[4]);
+        v->arch.hvm.hw_cr[4] =3D vmread(GUEST_CR4);
         v->arch.hvm.guest_cr[4] &=3D v->arch.hvm.vmx.cr4_host_mask;
         v->arch.hvm.guest_cr[4] |=3D (v->arch.hvm.hw_cr[4] &
                                     ~v->arch.hvm.vmx.cr4_host_mask);
=20
-        __vmread(GUEST_CR3, &v->arch.hvm.hw_cr[3]);
+        v->arch.hvm.hw_cr[3] =3D vmread(GUEST_CR3);
         if ( vmx_unrestricted_guest(v) || hvm_paging_enabled(v) )
             v->arch.hvm.guest_cr[3] =3D v->arch.hvm.hw_cr[3];
     }
=20
-    __vmread(VM_EXIT_REASON, &exit_reason);
+    exit_reason =3D vmread(VM_EXIT_REASON);
=20
     if ( hvm_long_mode_active(v) )
         TRACE_TIME(TRC_HVM_VMX_EXIT64, exit_reason, regs->rip, regs->rip >=
> 32);
@@ -4200,7 +4201,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         vmx_do_extint(regs);
         break;
     case EXIT_REASON_EXCEPTION_NMI:
-        __vmread(VM_EXIT_INTR_INFO, &intr_info);
+        intr_info =3D vmread(VM_EXIT_INTR_INFO);
         BUG_ON(!(intr_info & INTR_INFO_VALID_MASK));
         vector =3D intr_info & INTR_INFO_VECTOR_MASK;
         if ( vector =3D=3D X86_EXC_MC )
@@ -4237,12 +4238,12 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
=20
         if ( v->arch.hvm.vmx.secondary_exec_control &
             SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS )
-            __vmread(EPTP_INDEX, &idx);
+            idx =3D vmread(EPTP_INDEX);
         else
         {
             unsigned long eptp;
=20
-            __vmread(EPT_POINTER, &eptp);
+            eptp =3D vmread(EPT_POINTER);
=20
             if ( (idx =3D p2m_find_altp2m_by_eptp(v->domain, eptp)) =3D=3D
                  INVALID_ALTP2M )
@@ -4261,7 +4262,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
     {
         int rc;
=20
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
         rc =3D hvm_monitor_vmexit(exit_reason, exit_qualification);
         if ( rc < 0 )
             goto exit_and_crash;
@@ -4327,7 +4328,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
=20
     hvm_maybe_deassert_evtchn_irq();
=20
-    __vmread(IDT_VECTORING_INFO, &idtv_info);
+    idtv_info =3D vmread(IDT_VECTORING_INFO);
     if ( exit_reason !=3D EXIT_REASON_TASK_SWITCH )
         vmx_idtv_reinject(idtv_info);
=20
@@ -4362,7 +4363,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
              */
-            __vmread(EXIT_QUALIFICATION, &exit_qualification);
+            exit_qualification =3D vmread(EXIT_QUALIFICATION);
             TRACE(TRC_HVM_TRAP_DEBUG, exit_qualification);
             __restore_debug_registers(v);
             write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE)=
;
@@ -4390,15 +4391,14 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
             {
                 unsigned long int_info;
=20
-                __vmread(GUEST_INTERRUPTIBILITY_INFO, &int_info);
+                int_info =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
=20
                 if ( int_info & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV=
_SS) )
                 {
                     unsigned long pending_dbg;
=20
-                    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &pending_dbg);
-                    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS,
-                              pending_dbg | DR_STEP);
+                    pending_dbg =3D vmread(GUEST_PENDING_DBG_EXCEPTIONS);
+                    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, pending_dbg | =
DR_STEP);
                 }
             }
=20
@@ -4410,7 +4410,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
                                                     INTR_INFO_INTR_TYPE_MA=
SK);
=20
                 if ( trap_type >=3D X86_ET_SW_INT )
-                    __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
+                    insn_len =3D vmread(VM_EXIT_INSTRUCTION_LEN);
=20
                 rc =3D hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_DEBUG_EXCEPTION,
@@ -4431,7 +4431,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
                 unsigned long insn_len;
                 int rc;
=20
-                __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
+                insn_len =3D vmread(VM_EXIT_INSTRUCTION_LEN);
                 rc =3D hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_SOFTWARE_BREAKPOINT,
                                        X86_ET_SW_EXC,
@@ -4454,8 +4454,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
             vmx_fpu_dirty_intercept();
             break;
         case X86_EXC_PF:
-            __vmread(EXIT_QUALIFICATION, &exit_qualification);
-            __vmread(VM_EXIT_INTR_ERROR_CODE, &ecode);
+            exit_qualification =3D vmread(EXIT_QUALIFICATION);
+            ecode =3D vmread(VM_EXIT_INTR_ERROR_CODE);
             regs->error_code =3D ecode;
=20
             HVM_DBG_LOG(DBG_LEVEL_VMMU,
@@ -4522,7 +4522,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         };
         unsigned int inst_len, source;
=20
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
         source =3D (exit_qualification >> 30) & 3;
         /* Vectored event should fill in interrupt information. */
         WARN_ON((source =3D=3D 3) && !(idtv_info & INTR_INFO_VALID_MASK));
@@ -4536,7 +4536,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
                      > 3)) /* IntrType > 3? */
             ? get_instruction_length() /* Safe: SDM 3B 23.2.4 */ : 0;
         if ( (source =3D=3D 3) && (idtv_info & INTR_INFO_DELIVER_CODE_MASK=
) )
-            __vmread(IDT_VECTORING_ERROR_CODE, &ecode);
+            ecode =3D vmread(IDT_VECTORING_ERROR_CODE);
         else
              ecode =3D -1;
=20
@@ -4565,7 +4565,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
     case EXIT_REASON_INVLPG:
         update_guest_eip(); /* Safe: INVLPG */
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
         vmx_invlpg_intercept(exit_qualification);
         break;
     case EXIT_REASON_RDTSCP:
@@ -4591,13 +4591,13 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
=20
     case EXIT_REASON_CR_ACCESS:
     {
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
         if ( vmx_cr_access(exit_qualification) =3D=3D X86EMUL_OKAY )
             update_guest_eip(); /* Safe: MOV Cn, LMSW, CLTS */
         break;
     }
     case EXIT_REASON_DR_ACCESS:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
         vmx_dr_access(exit_qualification, regs);
         break;
     case EXIT_REASON_MSR_READ:
@@ -4671,7 +4671,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_EOI_INDUCED:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
=20
         ASSERT(cpu_has_vmx_virtual_intr_delivery);
=20
@@ -4695,7 +4695,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         unsigned int bytes;
         int rc;
=20
-        __vmread(EXIT_QUALIFICATION, &io_qual.raw);
+        io_qual.raw =3D vmread(EXIT_QUALIFICATION);
         bytes =3D io_qual.size + 1;
=20
         rc =3D hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str=
);
@@ -4730,8 +4730,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
     {
         paddr_t gpa;
=20
-        __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        gpa =3D vmread(GUEST_PHYSICAL_ADDRESS);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET=
) &&
              !(idtv_info & INTR_INFO_VALID_MASK) )
@@ -4745,7 +4745,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
     {
         paddr_t gpa;
=20
-        __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
+        gpa =3D vmread(GUEST_PHYSICAL_ADDRESS);
         if ( !ept_handle_misconfig(gpa) )
             goto exit_and_crash;
         break;
@@ -4781,7 +4781,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_PML_FULL:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET=
) &&
              !(idtv_info & INTR_INFO_VALID_MASK) )
@@ -4804,7 +4804,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_NOTIFY:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & NOTIFY_VM_CONTEXT_INVALID) )
         {
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index ceb5e5a322..720c86aeaf 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -400,7 +400,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     unsigned long base, index, seg_base, disp, offset;
     int scale, size;
=20
-    __vmread(VMX_INSTRUCTION_INFO, &offset);
+    offset =3D vmread(VMX_INSTRUCTION_INFO);
     info.word =3D offset;
=20
     if ( info.fields.memreg ) {
@@ -428,7 +428,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
=20
         scale =3D 1 << info.fields.scaling;
=20
-        __vmread(EXIT_QUALIFICATION, &disp);
+        disp =3D vmread(EXIT_QUALIFICATION);
=20
         size =3D 1 << (info.fields.addr_size + 1);
=20
@@ -997,7 +997,7 @@ static void vvmcs_to_shadow_bulk(struct vcpu *v, unsign=
ed int n,
=20
     virtual_vmcs_enter(v);
     for ( i =3D 0; i < n; i++ )
-        __vmread(field[i], &value[i]);
+        value[i] =3D vmread(field[i]);
     virtual_vmcs_exit(v);
=20
     for ( i =3D 0; i < n; i++ )
@@ -1036,7 +1036,7 @@ static void shadow_to_vvmcs_bulk(struct vcpu *v, unsi=
gned int n,
     }
=20
     for ( i =3D 0; i < n; i++ )
-        __vmread(field[i], &value[i]);
+        value[i] =3D vmread(field[i]);
=20
     virtual_vmcs_enter(v);
     for ( i =3D 0; i < n; i++ )
@@ -1405,7 +1405,7 @@ static void nvmx_update_apicv(struct vcpu *v)
     }
     else
        /* Keep previous SVI if there's any. */
-       __vmread(GUEST_INTR_STATUS, &status);
+       status =3D vmread(GUEST_INTR_STATUS);
=20
     rvi =3D vlapic_has_pending_irq(v);
     if ( rvi !=3D -1 )
@@ -1696,7 +1696,7 @@ static int nvmx_handle_vmresume(struct cpu_user_regs =
*regs)
         return X86EMUL_OKAY;       =20
     }
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    intr_shadow =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( intr_shadow & VMX_INTR_SHADOW_MOV_SS )
     {
         vmfail_valid(regs, VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS);
@@ -1732,7 +1732,7 @@ static int nvmx_handle_vmlaunch(struct cpu_user_regs =
*regs)
         return X86EMUL_OKAY;
     }
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    intr_shadow =3D vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( intr_shadow & VMX_INTR_SHADOW_MOV_SS )
     {
         vmfail_valid(regs, VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS);
@@ -2355,7 +2355,7 @@ int cf_check nvmx_hap_walk_L1_p2m(
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(EXIT_QUALIFICATION, &exit_qual);
+    exit_qual =3D vmread(EXIT_QUALIFICATION);
     rc =3D nept_translate_l2ga(v, L2_gpa, page_order, rwx_rights, &gfn, p2=
m_acc,
                              &exit_qual, &exit_reason);
     switch ( rc )
@@ -2391,7 +2391,7 @@ void nvmx_idtv_handling(void)
     struct nestedvcpu *nvcpu =3D &vcpu_nestedhvm(v);
     unsigned long idtv_info, reason;
=20
-    __vmread(IDT_VECTORING_INFO, &idtv_info);
+    idtv_info =3D vmread(IDT_VECTORING_INFO);
     if ( likely(!(idtv_info & INTR_INFO_VALID_MASK)) )
         return;
=20
@@ -2399,7 +2399,7 @@ void nvmx_idtv_handling(void)
      * If L0 can solve the fault that causes idt vectoring, it should
      * be reinjected, otherwise, pass to L1.
      */
-    __vmread(VM_EXIT_REASON, &reason);
+    reason =3D vmread(VM_EXIT_REASON);
     if ( (uint16_t)reason !=3D EXIT_REASON_EPT_VIOLATION ?
          !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) :
          !nvcpu->nv_vmexit_pending )
@@ -2407,7 +2407,7 @@ void nvmx_idtv_handling(void)
         __vmwrite(VM_ENTRY_INTR_INFO, idtv_info & ~INTR_INFO_RESVD_BITS_MA=
SK);
         if ( idtv_info & INTR_INFO_DELIVER_CODE_MASK )
         {
-            __vmread(IDT_VECTORING_ERROR_CODE, &reason);
+            reason =3D vmread(IDT_VECTORING_ERROR_CODE);
             __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, reason);
         }
         /*
@@ -2418,7 +2418,7 @@ void nvmx_idtv_handling(void)
          * This means EXIT_INSTRUCTION_LEN is always valid here, for
          * software interrupts both injected by L1, and generated in L2.
          */
-        __vmread(VM_EXIT_INSTRUCTION_LEN, &reason);
+        reason =3D vmread(VM_EXIT_INSTRUCTION_LEN);
         __vmwrite(VM_ENTRY_INSTRUCTION_LEN, reason);
    }
 }
@@ -2452,7 +2452,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
         u64 exec_bitmap;
         int vector;
=20
-        __vmread(VM_EXIT_INTR_INFO, &intr_info);
+        intr_info =3D vmread(VM_EXIT_INTR_INFO);
         vector =3D intr_info & INTR_INFO_VECTOR_MASK;
         /*
          * decided by L0 and L1 exception bitmap, if the vetor is set by
@@ -2531,7 +2531,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
             unsigned long qual;
             u16 port, size;
=20
-            __vmread(EXIT_QUALIFICATION, &qual);
+            qual =3D vmread(EXIT_QUALIFICATION);
             port =3D qual >> 16;
             size =3D (qual & 7) + 1;
             do {
@@ -2638,7 +2638,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
         cr_access_qual_t qual;
         u32 mask =3D 0;
=20
-        __vmread(EXIT_QUALIFICATION, &qual.raw);
+        qual.raw =3D vmread(EXIT_QUALIFICATION);
         /* also according to guest exec_control */
         ctrl =3D __n2_exec_control(v);
=20
@@ -2680,7 +2680,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
                 {
                     u64 cr0_gh_mask =3D get_vvmcs(v, CR0_GUEST_HOST_MASK);
=20
-                    __vmread(CR0_READ_SHADOW, &old_val);
+                    old_val =3D vmread(CR0_READ_SHADOW);
                     changed_bits =3D old_val ^ val;
                     if ( changed_bits & cr0_gh_mask )
                         nvcpu->nv_vmexit_pending =3D 1;
@@ -2696,7 +2696,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
                 {
                     u64 cr4_gh_mask =3D get_vvmcs(v, CR4_GUEST_HOST_MASK);
=20
-                    __vmread(CR4_READ_SHADOW, &old_val);
+                    old_val =3D vmread(CR4_READ_SHADOW);
                     changed_bits =3D old_val ^ val;
                     if ( changed_bits & cr4_gh_mask )
                         nvcpu->nv_vmexit_pending =3D 1;
@@ -2732,7 +2732,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
             {
                 u64 cr0_gh_mask =3D get_vvmcs(v, CR0_GUEST_HOST_MASK);
=20
-                __vmread(CR0_READ_SHADOW, &old_val);
+                old_val =3D vmread(CR0_READ_SHADOW);
                 old_val &=3D X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS;
                 val =3D qual.lmsw_data &
                       (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS);
--=20
2.34.1



