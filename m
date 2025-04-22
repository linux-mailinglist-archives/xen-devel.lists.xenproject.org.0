Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C6A95A53
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 03:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961637.1353009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u72FF-00079K-II; Tue, 22 Apr 2025 01:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961637.1353009; Tue, 22 Apr 2025 01:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u72FF-00077z-FK; Tue, 22 Apr 2025 01:16:17 +0000
Received: by outflank-mailman (input) for mailman id 961637;
 Tue, 22 Apr 2025 01:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u72FC-00077t-Jp
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 01:16:15 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f09a13-1f17-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 03:16:00 +0200 (CEST)
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
X-Inumbo-ID: 59f09a13-1f17-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745284557; x=1745543757;
	bh=/F+DYral6rY1fKs2AxCoRLU8bgtfLuZCw1WO7W82OEk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RbfOD9T4/US0uGXTiE9aVMN/U4YgDO2tv2sLa6248BZHJin99wKGmi6/OIwivyd0S
	 P2KTgYoS8NQdttY9EiAZw1B/S2o8Y11WXi+K38bl9lBwzR5aFrC99kzTkrQ9JzeZFA
	 AQ3fezmLlXnyUS6r8X3Lz5Y5FV4mdtRn7DeyfHTNzjubpjKqdfPw15ygMZPSk6I/c+
	 eY3P3Mam4rxLYm76xSVbMeUGICSY9lplgmSZt8d/ayZE3FkrEWb1VIQKMfrLVfvCib
	 eB/dCfGWAJAuHPIKmYNKMXoCx56x2CoUIZ+d1MS724Mdr/U67A29HMiYXB812An+R2
	 ql+bhDyUMIpYw==
Date: Tue, 22 Apr 2025 01:15:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v2] x86/vmx: Update __vmread() signature
Message-ID: <20250422011530.3010312-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a376b09d611f1ce0a9d572984fd1c1c4ba368c8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Current implementation of __vmread() returns the result via pointer argumen=
t
which leads to having excess code in some places.

Update the signature of __vmread() to return `unsigned long` and drop the
pointer argument as per suggestion in [1].

Update all call sites everywhere in the VT-x code.

[1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff228ec@=
citrix.com/

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
bloat-o-meter reports:
add/remove: 0/0 grow/shrink: 2/3 up/down: 8/-28 (-20)
Function                                     old     new   delta
vmx_vmexit_handler                          7000    7005      +5
nvmx_hap_walk_L1_p2m                         258     261      +3
vmx_do_resume                                485     484      -1
shadow_to_vvmcs_bulk                         304     294     -10
vvmcs_to_shadow_bulk                         296     279     -17
Total: Before=3D3540972, After=3D3540952, chg -0.00%

Changes since v1:
- Limited the scope of the change to __vmread() signature change only
- Link to v1: https://lore.kernel.org/xen-devel/20250408011454.2274613-1-dm=
ukhin@ford.com/
- Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines=
/1778785297
---
 xen/arch/x86/cpu/vpmu_intel.c          |   3 +-
 xen/arch/x86/hvm/vmx/intr.c            |  26 +---
 xen/arch/x86/hvm/vmx/realmode.c        |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 208 +++++++++++--------------
 xen/arch/x86/hvm/vmx/vvmx.c            |  43 +++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  19 +--
 7 files changed, 132 insertions(+), 180 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 7ce98ee42e..3c08448ba4 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -796,8 +796,7 @@ static int cf_check core2_vpmu_do_interrupt(void)
     else
     {
         /* No PMC overflow but perhaps a Trace Message interrupt. */
-        __vmread(GUEST_IA32_DEBUGCTL, &msr_content);
-        if ( !(msr_content & IA32_DEBUGCTLMSR_TR) )
+        if ( !(__vmread(GUEST_IA32_DEBUGCTL) & IA32_DEBUGCTLMSR_TR) )
             return 0;
     }
=20
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 91b407e6bc..9e9217e8b6 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -63,9 +63,8 @@ static void vmx_enable_intr_window(struct vcpu *v, struct=
 hvm_intack intack)
=20
     if ( unlikely(tb_init_done) )
     {
-        unsigned long intr;
+        unsigned long intr =3D __vmread(VM_ENTRY_INTR_INFO);
=20
-        __vmread(VM_ENTRY_INTR_INFO, &intr);
         TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
               (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
     }
@@ -81,9 +80,8 @@ static void vmx_enable_intr_window(struct vcpu *v, struct=
 hvm_intack intack)
          * we may immediately vmexit and hance make no progress!
          * (see SDM 3B 21.3, "Other Causes of VM Exits").
          */
-        unsigned long intr_shadow;
+        unsigned long intr_shadow =3D __vmread(GUEST_INTERRUPTIBILITY_INFO=
);
=20
-        __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
         if ( intr_shadow & VMX_INTR_SHADOW_STI )
         {
             /* Having both STI-blocking and MOV-SS-blocking fails vmentry.=
 */
@@ -144,14 +142,8 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu=
 *v)
         if ( nvcpu->nv_vmexit_pending ||
              nvcpu->nv_vmswitch_in_progress )
             r =3D hvm_intblk_rflags_ie;
-        else
-        {
-            unsigned long intr_info;
-
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-            if ( intr_info & INTR_INFO_VALID_MASK )
-                r =3D hvm_intblk_rflags_ie;
-        }
+        else if ( __vmread(VM_ENTRY_INTR_INFO) & INTR_INFO_VALID_MASK )
+            r =3D hvm_intblk_rflags_ie;
     }
     else if ( nvcpu->nv_vmentry_pending )
         r =3D hvm_intblk_rflags_ie;
@@ -253,8 +245,6 @@ void asmlinkage vmx_intr_assist(void)
     pt_vector =3D pt_update_irq(v);
=20
     do {
-        unsigned long intr_info;
-
         intack =3D hvm_vcpu_has_pending_irq(v);
         if ( likely(intack.source =3D=3D hvm_intsrc_none) )
             goto out;
@@ -275,8 +265,7 @@ void asmlinkage vmx_intr_assist(void)
                 goto out;
             }
=20
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-            if ( intr_info & INTR_INFO_VALID_MASK )
+            if ( __vmread(VM_ENTRY_INTR_INFO) & INTR_INFO_VALID_MASK )
             {
                 if ( (intack.source =3D=3D hvm_intsrc_pic) ||
                      (intack.source =3D=3D hvm_intsrc_nmi) ||
@@ -299,8 +288,7 @@ void asmlinkage vmx_intr_assist(void)
         }
         else
         {
-            __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-            if ( intr_info & INTR_INFO_VALID_MASK )
+            if ( __vmread(VM_ENTRY_INTR_INFO) & INTR_INFO_VALID_MASK )
             {
                 vmx_enable_intr_window(v, intack);
                 goto out;
@@ -377,7 +365,7 @@ void asmlinkage vmx_intr_assist(void)
         }
=20
         /* we need update the RVI field */
-        __vmread(GUEST_INTR_STATUS, &status);
+        status =3D __vmread(GUEST_INTR_STATUS);
         status &=3D ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
         status |=3D VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK &
                     intack.vector;
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmod=
e.c
index ff44ddcfa6..ee7a3570ec 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -159,7 +159,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     unsigned int emulations =3D 0;
=20
     /* Get-and-clear VM_ENTRY_INTR_INFO. */
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+    intr_info =3D __vmread(VM_ENTRY_INTR_INFO);
     if ( intr_info & INTR_INFO_VALID_MASK )
         __vmwrite(VM_ENTRY_INTR_INFO, 0);
=20
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15..c2e4410f89 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1031,7 +1031,7 @@ u64 virtual_vmcs_vmread(const struct vcpu *v, u32 vmc=
s_encoding)
     u64 res;
=20
     virtual_vmcs_enter(v);
-    __vmread(vmcs_encoding, &res);
+    res =3D __vmread(vmcs_encoding);
     virtual_vmcs_exit(v);
=20
     return res;
@@ -1691,7 +1691,7 @@ void vmx_vcpu_flush_pml_buffer(struct vcpu *v)
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_PML_INDEX, &pml_idx);
+    pml_idx =3D __vmread(GUEST_PML_INDEX);
=20
     /* Do nothing if PML buffer is empty. */
     if ( pml_idx =3D=3D (NR_PML_ENTRIES - 1) )
@@ -1874,9 +1874,8 @@ void vmx_destroy_vmcs(struct vcpu *v)
 void vmx_vmentry_failure(void)
 {
     struct vcpu *curr =3D current;
-    unsigned long error;
+    unsigned long error =3D __vmread(VM_INSTRUCTION_ERROR);
=20
-    __vmread(VM_INSTRUCTION_ERROR, &error);
     gprintk(XENLOG_ERR, "VM%s error: %#lx\n",
             curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH", error);
=20
@@ -1905,7 +1904,6 @@ void cf_check vmx_do_resume(void)
 {
     struct vcpu *v =3D current;
     bool debug_state;
-    unsigned long host_cr4;
=20
     if ( v->arch.hvm.vmx.active_cpu =3D=3D smp_processor_id() )
         vmx_vmcs_reload(v);
@@ -1957,8 +1955,7 @@ void cf_check vmx_do_resume(void)
     hvm_do_resume(v);
=20
     /* Sync host CR4 in case its value has changed. */
-    __vmread(HOST_CR4, &host_cr4);
-    if ( host_cr4 !=3D read_cr4() )
+    if ( __vmread(HOST_CR4) !=3D read_cr4() )
         __vmwrite(HOST_CR4, read_cr4());
=20
     reset_stack_and_jump(vmx_asm_do_vmentry);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4883bd823d..a95d46f019 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -902,7 +902,7 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
         return X86_MODE_REAL;
     if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
         return X86_MODE_VM86;
-    __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
+    cs_ar_bytes =3D __vmread(GUEST_CS_AR_BYTES);
     if ( hvm_long_mode_active(v) &&
          likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
         return X86_MODE_64BIT;
@@ -926,7 +926,7 @@ static void vmx_save_dr(struct vcpu *v)
     v->arch.dr[3] =3D read_debugreg(3);
     v->arch.dr6   =3D read_debugreg(6);
     /* DR7 must be saved as it is used by vmx_restore_dr(). */
-    __vmread(GUEST_DR7, &v->arch.dr7);
+    v->arch.dr7 =3D __vmread(GUEST_DR7);
 }
=20
 static void __restore_debug_registers(struct vcpu *v)
@@ -963,17 +963,17 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_=
hw_cpu *c)
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_SYSENTER_CS, &c->sysenter_cs);
-    __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
-    __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
+    c->sysenter_cs =3D __vmread(GUEST_SYSENTER_CS);
+    c->sysenter_esp =3D __vmread(GUEST_SYSENTER_ESP);
+    c->sysenter_eip =3D __vmread(GUEST_SYSENTER_EIP);
=20
-    __vmread(VM_ENTRY_INTR_INFO, &ev);
+    ev =3D __vmread(VM_ENTRY_INTR_INFO);
     if ( (ev & INTR_INFO_VALID_MASK) &&
          hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MAS=
K),
                                      ev & INTR_INFO_VECTOR_MASK) )
     {
         c->pending_event =3D ev;
-        __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &ev);
+        ev =3D __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE);
         c->error_code =3D ev;
     }
=20
@@ -1197,11 +1197,7 @@ static void cf_check vmx_ctxt_switch_to(struct vcpu =
*v)
=20
 unsigned int vmx_get_cpl(void)
 {
-    unsigned long attr;
-
-    __vmread(GUEST_SS_AR_BYTES, &attr);
-
-    return MASK_EXTR(attr, X86_SEG_AR_DPL);
+    return MASK_EXTR(__vmread(GUEST_SS_AR_BYTES), X86_SEG_AR_DPL);
 }
=20
 static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)
@@ -1271,14 +1267,14 @@ static void cf_check vmx_get_segment_register(
         fallthrough;
=20
     case x86_seg_es ... x86_seg_gs:
-        __vmread(GUEST_SEG_SELECTOR(tmp_seg), &sel);
-        __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
+        sel =3D __vmread(GUEST_SEG_SELECTOR(tmp_seg));
+        attr =3D __vmread(GUEST_SEG_AR_BYTES(tmp_seg));
         fallthrough;
=20
     case x86_seg_gdtr:
     case x86_seg_idtr:
-        __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
-        __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
+        limit =3D __vmread(GUEST_SEG_LIMIT(tmp_seg));
+        reg->base =3D __vmread(GUEST_SEG_BASE(tmp_seg));
         break;
=20
     default:
@@ -1436,7 +1432,7 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v,=
 u64 *gpat)
         return 0;
=20
     vmx_vmcs_enter(v);
-    __vmread(GUEST_PAT, gpat);
+    *gpat =3D __vmread(GUEST_PAT);
     vmx_vmcs_exit(v);
     return 1;
 }
@@ -1555,11 +1551,7 @@ static void cf_check vmx_init_hypercall_page(void *p=
)
=20
 static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
 {
-    unsigned long intr_shadow;
-
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-
-    return intr_shadow;
+    return __vmread(GUEST_INTERRUPTIBILITY_INFO);
 }
=20
 static void cf_check vmx_set_interrupt_shadow(
@@ -1573,12 +1565,12 @@ static void cf_check vmx_get_nonreg_state(struct vc=
pu *v,
 {
     vmx_vmcs_enter(v);
=20
-    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info)=
;
-    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
+    nrs->vmx.activity_state =3D __vmread(GUEST_ACTIVITY_STATE);
+    nrs->vmx.interruptibility_info =3D __vmread(GUEST_INTERRUPTIBILITY_INF=
O);
+    nrs->vmx.pending_dbg =3D __vmread(GUEST_PENDING_DBG_EXCEPTIONS);
=20
     if ( cpu_has_vmx_virtual_intr_delivery )
-        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
+        nrs->vmx.interrupt_status =3D __vmread(GUEST_INTR_STATUS);
=20
     vmx_vmcs_exit(v);
 }
@@ -1896,7 +1888,7 @@ static void cf_check vmx_update_guest_efer(struct vcp=
u *v)
      * The intended guest running mode is derived from VM_ENTRY_IA32E_MODE=
,
      * which (architecturally) is the guest's LMA setting.
      */
-    __vmread(VM_ENTRY_CONTROLS, &entry_ctls);
+    entry_ctls =3D __vmread(VM_ENTRY_CONTROLS);
=20
     entry_ctls &=3D ~VM_ENTRY_IA32E_MODE;
     if ( guest_efer & EFER_LMA )
@@ -2063,9 +2055,10 @@ static void cf_check vmx_inject_event(const struct x=
86_event *event)
         {
             unsigned long val;
=20
-            __vmread(GUEST_DR7, &val);
+            val =3D __vmread(GUEST_DR7);
             __vmwrite(GUEST_DR7, val & ~DR_GENERAL_DETECT);
-            __vmread(GUEST_IA32_DEBUGCTL, &val);
+
+            val =3D __vmread(GUEST_IA32_DEBUGCTL);
             __vmwrite(GUEST_IA32_DEBUGCTL, val & ~IA32_DEBUGCTLMSR_LBR);
         }
         if ( cpu_has_monitor_trap_flag )
@@ -2089,7 +2082,7 @@ static void cf_check vmx_inject_event(const struct x8=
6_event *event)
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         intr_info =3D vcpu_2_nvmx(curr).intr.intr_info;
     else
-        __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+        intr_info =3D __vmread(VM_ENTRY_INTR_INFO);
=20
     if ( unlikely(intr_info & INTR_INFO_VALID_MASK) &&
          (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) =3D=3D X86_ET_HW_=
EXC) )
@@ -2125,12 +2118,9 @@ static void cf_check vmx_inject_event(const struct x=
86_event *event)
=20
 static bool cf_check vmx_event_pending(const struct vcpu *v)
 {
-    unsigned long intr_info;
-
     ASSERT(v =3D=3D current);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
=20
-    return intr_info & INTR_INFO_VALID_MASK;
+    return __vmread(VM_ENTRY_INTR_INFO) & INTR_INFO_VALID_MASK;
 }
=20
 static void cf_check vmx_set_info_guest(struct vcpu *v)
@@ -2149,7 +2139,7 @@ static void cf_check vmx_set_info_guest(struct vcpu *=
v)
      * to set the GUEST_PENDING_DBG_EXCEPTIONS.BS here incurs
      * immediately vmexit and hence make no progress.
      */
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    intr_shadow =3D __vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( v->domain->debugger_attached &&
          (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
          (intr_shadow & VMX_INTR_SHADOW_STI) )
@@ -2178,7 +2168,7 @@ static u8 set_svi(int isr)
     if ( isr < 0 )
         isr =3D 0;
=20
-    __vmread(GUEST_INTR_STATUS, &status);
+    status =3D __vmread(GUEST_INTR_STATUS);
     old =3D status >> VMX_GUEST_INTR_STATUS_SVI_OFFSET;
     if ( isr !=3D old )
     {
@@ -2518,9 +2508,9 @@ static bool cf_check vmx_vcpu_emulate_ve(struct vcpu =
*v)
     veinfo->eptp_index =3D vcpu_altp2m(v).p2midx;
=20
     vmx_vmcs_enter(v);
-    __vmread(EXIT_QUALIFICATION, &veinfo->exit_qualification);
-    __vmread(GUEST_LINEAR_ADDRESS, &veinfo->gla);
-    __vmread(GUEST_PHYSICAL_ADDRESS, &veinfo->gpa);
+    veinfo->exit_qualification =3D __vmread(EXIT_QUALIFICATION);
+    veinfo->gla =3D __vmread(GUEST_LINEAR_ADDRESS);
+    veinfo->gpa =3D __vmread(GUEST_PHYSICAL_ADDRESS);
     vmx_vmcs_exit(v);
=20
     hvm_inject_hw_exception(X86_EXC_VE,
@@ -2541,8 +2531,8 @@ static bool cf_check vmx_get_pending_event(
     unsigned long intr_info, error_code;
=20
     vmx_vmcs_enter(v);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-    __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &error_code);
+    intr_info =3D __vmread(VM_ENTRY_INTR_INFO);
+    error_code =3D __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE);
     vmx_vmcs_exit(v);
=20
     if ( !(intr_info & INTR_INFO_VALID_MASK) )
@@ -2739,11 +2729,11 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v=
, unsigned int reg)
     {
     case MSR_SPEC_CTRL:
         ASSERT(cpu_has_vmx_virt_spec_ctrl);
-        __vmread(SPEC_CTRL_SHADOW, &val);
+        val =3D __vmread(SPEC_CTRL_SHADOW);
         break;
=20
     case MSR_IA32_BNDCFGS:
-        __vmread(GUEST_BNDCFGS, &val);
+        val =3D __vmread(GUEST_BNDCFGS);
         break;
=20
     default:
@@ -3161,9 +3151,9 @@ void __init vmx_fill_funcs(void)
  */
 static int get_instruction_length(void)
 {
-    unsigned long len;
+    /* Safe: callers audited */
+    unsigned long len =3D __vmread(VM_EXIT_INSTRUCTION_LEN);
=20
-    __vmread(VM_EXIT_INSTRUCTION_LEN, &len); /* Safe: callers audited */
     BUG_ON((len < 1) || (len > MAX_INST_LEN));
     return len;
 }
@@ -3176,7 +3166,7 @@ void update_guest_eip(void)
     regs->rip +=3D get_instruction_length(); /* Safe: callers audited */
     regs->eflags &=3D ~X86_EFLAGS_RF;
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &x);
+    x =3D __vmread(GUEST_INTERRUPTIBILITY_INFO);
     if ( x & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS) )
     {
         x &=3D ~(VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS);
@@ -3424,21 +3414,21 @@ static int cf_check vmx_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        __vmread(GUEST_SYSENTER_CS, msr_content);
+        *msr_content =3D __vmread(GUEST_SYSENTER_CS);
         break;
     case MSR_IA32_SYSENTER_ESP:
-        __vmread(GUEST_SYSENTER_ESP, msr_content);
+        *msr_content =3D __vmread(GUEST_SYSENTER_ESP);
         break;
     case MSR_IA32_SYSENTER_EIP:
-        __vmread(GUEST_SYSENTER_EIP, msr_content);
+        *msr_content =3D __vmread(GUEST_SYSENTER_EIP);
         break;
=20
     case MSR_FS_BASE:
-        __vmread(GUEST_FS_BASE, msr_content);
+        *msr_content =3D __vmread(GUEST_FS_BASE);
         break;
=20
     case MSR_GS_BASE:
-        __vmread(GUEST_GS_BASE, msr_content);
+        *msr_content =3D __vmread(GUEST_GS_BASE);
         break;
=20
     case MSR_SHADOW_GS_BASE:
@@ -3462,7 +3452,7 @@ static int cf_check vmx_msr_read_intercept(
         break;
=20
     case MSR_IA32_DEBUGCTLMSR:
-        __vmread(GUEST_IA32_DEBUGCTL, msr_content);
+        *msr_content =3D __vmread(GUEST_IA32_DEBUGCTL);
         break;
=20
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
@@ -3828,7 +3818,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
=20
-    __vmread(VM_EXIT_INTR_INFO, &vector);
+    vector =3D __vmread(VM_EXIT_INTR_INFO);
     BUG_ON(!(vector & INTR_INFO_VALID_MASK));
=20
     vector &=3D INTR_INFO_VECTOR_MASK;
@@ -3893,7 +3883,7 @@ static void ept_handle_violation(ept_qual_t q, paddr_=
t gpa)
=20
     if ( q.gla_valid )
     {
-        __vmread(GUEST_LINEAR_ADDRESS, &gla);
+        gla =3D __vmread(GUEST_LINEAR_ADDRESS);
         npfec.gla_valid =3D 1;
         if( q.gla_fault )
             npfec.kind =3D npfec_kind_with_gla;
@@ -3944,7 +3934,7 @@ static void vmx_failed_vmentry(unsigned int exit_reas=
on,
     struct vcpu *curr =3D current;
=20
     printk("%pv vmentry failure (reason %#x): ", curr, exit_reason);
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
+    exit_qualification =3D __vmread(EXIT_QUALIFICATION);
     switch ( failed_vmentry_reason )
     {
     case EXIT_REASON_INVALID_GUEST_STATE:
@@ -4001,13 +3991,12 @@ void vmx_enter_realmode(struct cpu_user_regs *regs)
=20
 static int vmx_handle_eoi_write(void)
 {
-    unsigned long exit_qualification;
+    unsigned long exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
     /*
      * 1. Must be a linear access data write.
      * 2. Data write must be to the EOI register.
      */
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
     if ( (((exit_qualification >> 12) & 0xf) =3D=3D 1) &&
          ((exit_qualification & 0xfff) =3D=3D APIC_EOI) )
     {
@@ -4033,21 +4022,14 @@ static void vmx_propagate_intr(unsigned long intr)
         .vector =3D MASK_EXTR(intr, INTR_INFO_VECTOR_MASK),
         .type =3D MASK_EXTR(intr, INTR_INFO_INTR_TYPE_MASK),
     };
-    unsigned long tmp;
=20
     if ( intr & INTR_INFO_DELIVER_CODE_MASK )
-    {
-        __vmread(VM_EXIT_INTR_ERROR_CODE, &tmp);
-        event.error_code =3D tmp;
-    }
+        event.error_code =3D __vmread(VM_EXIT_INTR_ERROR_CODE);
     else
         event.error_code =3D X86_EVENT_NO_EC;
=20
     if ( event.type >=3D X86_ET_SW_INT )
-    {
-        __vmread(VM_EXIT_INSTRUCTION_LEN, &tmp);
-        event.insn_len =3D tmp;
-    }
+        event.insn_len =3D __vmread(VM_EXIT_INSTRUCTION_LEN);
     else
         event.insn_len =3D 0;
=20
@@ -4071,7 +4053,7 @@ static void vmx_idtv_reinject(unsigned long idtv_info=
)
             {
                 unsigned long ec;
=20
-                __vmread(IDT_VECTORING_ERROR_CODE, &ec);
+                ec =3D __vmread(IDT_VECTORING_ERROR_CODE);
                 __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, ec);
             }
         }
@@ -4086,7 +4068,7 @@ static void vmx_idtv_reinject(unsigned long idtv_info=
)
         {
             unsigned long intr_info;
=20
-            __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_info);
+            intr_info =3D __vmread(GUEST_INTERRUPTIBILITY_INFO);
             __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
                       intr_info & ~VMX_INTR_SHADOW_NMI);
         }
@@ -4111,8 +4093,8 @@ static void vmx_handle_descriptor_access(uint32_t exi=
t_reason)
     uint64_t exit_qualification;
     unsigned int desc;
=20
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
-    __vmread(VMX_INSTRUCTION_INFO, &instr_info);
+    exit_qualification =3D __vmread(EXIT_QUALIFICATION);
+    instr_info =3D __vmread(VMX_INSTRUCTION_INFO);
=20
     if ( exit_reason =3D=3D EXIT_REASON_ACCESS_GDTR_OR_IDTR )
     {
@@ -4137,7 +4119,7 @@ static int vmx_handle_apic_write(void)
     unsigned long exit_qualification;
=20
     ASSERT(cpu_has_vmx_apic_reg_virt);
-    __vmread(EXIT_QUALIFICATION, &exit_qualification);
+    exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
@@ -4146,7 +4128,7 @@ static void undo_nmis_unblocked_by_iret(void)
 {
     unsigned long guest_info;
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+    guest_info =3D __vmread(GUEST_INTERRUPTIBILITY_INFO);
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
               guest_info | VMX_INTR_SHADOW_NMI);
 }
@@ -4159,12 +4141,12 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
     struct vcpu *v =3D current;
     struct domain *currd =3D v->domain;
=20
-    __vmread(GUEST_RIP,    &regs->rip);
-    __vmread(GUEST_RSP,    &regs->rsp);
-    __vmread(GUEST_RFLAGS, &regs->rflags);
+    regs->rip =3D __vmread(GUEST_RIP);
+    regs->rsp =3D __vmread(GUEST_RSP);
+    regs->rflags =3D __vmread(GUEST_RFLAGS);
=20
     if ( hvm_long_mode_active(v) )
-        __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
+        cs_ar_bytes =3D __vmread(GUEST_CS_AR_BYTES);
=20
     hvm_sanitize_regs_fields(regs, !(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE=
));
=20
@@ -4174,17 +4156,17 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
          * Xen allows the guest to modify some CR4 bits directly, update c=
ached
          * values to match.
          */
-        __vmread(GUEST_CR4, &v->arch.hvm.hw_cr[4]);
+        v->arch.hvm.hw_cr[4] =3D __vmread(GUEST_CR4);
         v->arch.hvm.guest_cr[4] &=3D v->arch.hvm.vmx.cr4_host_mask;
         v->arch.hvm.guest_cr[4] |=3D (v->arch.hvm.hw_cr[4] &
                                     ~v->arch.hvm.vmx.cr4_host_mask);
=20
-        __vmread(GUEST_CR3, &v->arch.hvm.hw_cr[3]);
+        v->arch.hvm.hw_cr[3] =3D __vmread(GUEST_CR3);
         if ( vmx_unrestricted_guest(v) || hvm_paging_enabled(v) )
             v->arch.hvm.guest_cr[3] =3D v->arch.hvm.hw_cr[3];
     }
=20
-    __vmread(VM_EXIT_REASON, &exit_reason);
+    exit_reason =3D __vmread(VM_EXIT_REASON);
=20
     if ( hvm_long_mode_active(v) )
         TRACE_TIME(TRC_HVM_VMX_EXIT64, exit_reason, regs->rip, regs->rip >=
> 32);
@@ -4200,7 +4182,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         vmx_do_extint(regs);
         break;
     case EXIT_REASON_EXCEPTION_NMI:
-        __vmread(VM_EXIT_INTR_INFO, &intr_info);
+        intr_info =3D __vmread(VM_EXIT_INTR_INFO);
         BUG_ON(!(intr_info & INTR_INFO_VALID_MASK));
         vector =3D intr_info & INTR_INFO_VECTOR_MASK;
         if ( vector =3D=3D X86_EXC_MC )
@@ -4237,12 +4219,12 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
=20
         if ( v->arch.hvm.vmx.secondary_exec_control &
             SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS )
-            __vmread(EPTP_INDEX, &idx);
+        {
+            idx =3D __vmread(EPTP_INDEX);
+        }
         else
         {
-            unsigned long eptp;
-
-            __vmread(EPT_POINTER, &eptp);
+            unsigned long eptp =3D __vmread(EPT_POINTER);
=20
             if ( (idx =3D p2m_find_altp2m_by_eptp(v->domain, eptp)) =3D=3D
                  INVALID_ALTP2M )
@@ -4259,10 +4241,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_r=
egs *regs)
=20
     if ( unlikely(currd->arch.monitor.vmexit_enabled) )
     {
-        int rc;
-
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
-        rc =3D hvm_monitor_vmexit(exit_reason, exit_qualification);
+        int rc =3D hvm_monitor_vmexit(exit_reason, __vmread(EXIT_QUALIFICA=
TION));
         if ( rc < 0 )
             goto exit_and_crash;
         if ( rc )
@@ -4327,7 +4306,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
=20
     hvm_maybe_deassert_evtchn_irq();
=20
-    __vmread(IDT_VECTORING_INFO, &idtv_info);
+    idtv_info =3D __vmread(IDT_VECTORING_INFO);
     if ( exit_reason !=3D EXIT_REASON_TASK_SWITCH )
         vmx_idtv_reinject(idtv_info);
=20
@@ -4362,7 +4341,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
              */
-            __vmread(EXIT_QUALIFICATION, &exit_qualification);
+            exit_qualification =3D __vmread(EXIT_QUALIFICATION);
             TRACE(TRC_HVM_TRAP_DEBUG, exit_qualification);
             __restore_debug_registers(v);
             write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE)=
;
@@ -4388,29 +4367,25 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
              */
             if ( unlikely(regs->eflags & X86_EFLAGS_TF) )
             {
-                unsigned long int_info;
-
-                __vmread(GUEST_INTERRUPTIBILITY_INFO, &int_info);
+                unsigned long int_info =3D __vmread(GUEST_INTERRUPTIBILITY=
_INFO);
=20
                 if ( int_info & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV=
_SS) )
                 {
-                    unsigned long pending_dbg;
+                    unsigned long exc =3D __vmread(GUEST_PENDING_DBG_EXCEP=
TIONS);
=20
-                    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &pending_dbg);
-                    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS,
-                              pending_dbg | DR_STEP);
+                    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, exc | DR_STEP)=
;
                 }
             }
=20
             if ( !v->domain->debugger_attached )
             {
                 unsigned long insn_len =3D 0;
-                int rc;
                 unsigned long trap_type =3D MASK_EXTR(intr_info,
                                                     INTR_INFO_INTR_TYPE_MA=
SK);
+                int rc;
=20
                 if ( trap_type >=3D X86_ET_SW_INT )
-                    __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
+                    insn_len =3D __vmread(VM_EXIT_INSTRUCTION_LEN);
=20
                 rc =3D hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_DEBUG_EXCEPTION,
@@ -4428,10 +4403,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_r=
egs *regs)
             TRACE(TRC_HVM_TRAP, vector);
             if ( !v->domain->debugger_attached )
             {
-                unsigned long insn_len;
+                unsigned long insn_len =3D __vmread(VM_EXIT_INSTRUCTION_LE=
N);
                 int rc;
=20
-                __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
                 rc =3D hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_SOFTWARE_BREAKPOINT,
                                        X86_ET_SW_EXC,
@@ -4454,8 +4428,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
             vmx_fpu_dirty_intercept();
             break;
         case X86_EXC_PF:
-            __vmread(EXIT_QUALIFICATION, &exit_qualification);
-            __vmread(VM_EXIT_INTR_ERROR_CODE, &ecode);
+            exit_qualification =3D __vmread(EXIT_QUALIFICATION);
+            ecode =3D __vmread(VM_EXIT_INTR_ERROR_CODE);
             regs->error_code =3D ecode;
=20
             HVM_DBG_LOG(DBG_LEVEL_VMMU,
@@ -4522,7 +4496,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         };
         unsigned int inst_len, source;
=20
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
         source =3D (exit_qualification >> 30) & 3;
         /* Vectored event should fill in interrupt information. */
         WARN_ON((source =3D=3D 3) && !(idtv_info & INTR_INFO_VALID_MASK));
@@ -4536,9 +4510,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
                      > 3)) /* IntrType > 3? */
             ? get_instruction_length() /* Safe: SDM 3B 23.2.4 */ : 0;
         if ( (source =3D=3D 3) && (idtv_info & INTR_INFO_DELIVER_CODE_MASK=
) )
-            __vmread(IDT_VECTORING_ERROR_CODE, &ecode);
+            ecode =3D __vmread(IDT_VECTORING_ERROR_CODE);
         else
-             ecode =3D -1;
+            ecode =3D -1;
=20
         hvm_task_switch(exit_qualification, reasons[source], ecode, inst_l=
en,
                         0 /* EFLAGS.RF already updated. */);
@@ -4565,7 +4539,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
     case EXIT_REASON_INVLPG:
         update_guest_eip(); /* Safe: INVLPG */
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
         vmx_invlpg_intercept(exit_qualification);
         break;
     case EXIT_REASON_RDTSCP:
@@ -4591,13 +4565,13 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
=20
     case EXIT_REASON_CR_ACCESS:
     {
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
         if ( vmx_cr_access(exit_qualification) =3D=3D X86EMUL_OKAY )
             update_guest_eip(); /* Safe: MOV Cn, LMSW, CLTS */
         break;
     }
     case EXIT_REASON_DR_ACCESS:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
         vmx_dr_access(exit_qualification, regs);
         break;
     case EXIT_REASON_MSR_READ:
@@ -4671,7 +4645,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_EOI_INDUCED:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
         ASSERT(cpu_has_vmx_virtual_intr_delivery);
=20
@@ -4695,7 +4669,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         unsigned int bytes;
         int rc;
=20
-        __vmread(EXIT_QUALIFICATION, &io_qual.raw);
+        io_qual.raw =3D __vmread(EXIT_QUALIFICATION);
         bytes =3D io_qual.size + 1;
=20
         rc =3D hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str=
);
@@ -4728,10 +4702,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_r=
egs *regs)
=20
     case EXIT_REASON_EPT_VIOLATION:
     {
-        paddr_t gpa;
+        paddr_t gpa =3D __vmread(GUEST_PHYSICAL_ADDRESS);
=20
-        __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET=
) &&
              !(idtv_info & INTR_INFO_VALID_MASK) )
@@ -4743,9 +4716,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
=20
     case EXIT_REASON_EPT_MISCONFIG:
     {
-        paddr_t gpa;
+        paddr_t gpa =3D __vmread(GUEST_PHYSICAL_ADDRESS);
=20
-        __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
         if ( !ept_handle_misconfig(gpa) )
             goto exit_and_crash;
         break;
@@ -4781,7 +4753,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_PML_FULL:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET=
) &&
              !(idtv_info & INTR_INFO_VALID_MASK) )
@@ -4804,7 +4776,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
         break;
=20
     case EXIT_REASON_NOTIFY:
-        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        exit_qualification =3D __vmread(EXIT_QUALIFICATION);
=20
         if ( unlikely(exit_qualification & NOTIFY_VM_CONTEXT_INVALID) )
         {
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index ceb5e5a322..09be4f3602 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -400,8 +400,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     unsigned long base, index, seg_base, disp, offset;
     int scale, size;
=20
-    __vmread(VMX_INSTRUCTION_INFO, &offset);
-    info.word =3D offset;
+    info.word =3D __vmread(VMX_INSTRUCTION_INFO);
=20
     if ( info.fields.memreg ) {
         decode->type =3D VMX_INST_MEMREG_TYPE_REG;
@@ -428,7 +427,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
=20
         scale =3D 1 << info.fields.scaling;
=20
-        __vmread(EXIT_QUALIFICATION, &disp);
+        disp =3D __vmread(EXIT_QUALIFICATION);
=20
         size =3D 1 << (info.fields.addr_size + 1);
=20
@@ -997,7 +996,7 @@ static void vvmcs_to_shadow_bulk(struct vcpu *v, unsign=
ed int n,
=20
     virtual_vmcs_enter(v);
     for ( i =3D 0; i < n; i++ )
-        __vmread(field[i], &value[i]);
+        value[i] =3D __vmread(field[i]);
     virtual_vmcs_exit(v);
=20
     for ( i =3D 0; i < n; i++ )
@@ -1012,7 +1011,7 @@ fallback:
=20
 static inline void shadow_to_vvmcs(const struct vcpu *v, unsigned int fiel=
d)
 {
-    unsigned long value;
+    unsigned long value =3D 0;
=20
     if ( vmread_safe(field, &value) =3D=3D 0 )
         set_vvmcs(v, field, value);
@@ -1036,7 +1035,7 @@ static void shadow_to_vvmcs_bulk(struct vcpu *v, unsi=
gned int n,
     }
=20
     for ( i =3D 0; i < n; i++ )
-        __vmread(field[i], &value[i]);
+        value[i] =3D __vmread(field[i]);
=20
     virtual_vmcs_enter(v);
     for ( i =3D 0; i < n; i++ )
@@ -1405,7 +1404,7 @@ static void nvmx_update_apicv(struct vcpu *v)
     }
     else
        /* Keep previous SVI if there's any. */
-       __vmread(GUEST_INTR_STATUS, &status);
+       status =3D __vmread(GUEST_INTR_STATUS);
=20
     rvi =3D vlapic_has_pending_irq(v);
     if ( rvi !=3D -1 )
@@ -1687,7 +1686,6 @@ static int nvmx_handle_vmresume(struct cpu_user_regs =
*regs)
     bool launched;
     struct vcpu *v =3D current;
     struct nestedvmx *nvmx =3D &vcpu_2_nvmx(v);
-    unsigned long intr_shadow;
     int rc;
=20
     if ( !vvmcx_valid(v) )
@@ -1696,8 +1694,7 @@ static int nvmx_handle_vmresume(struct cpu_user_regs =
*regs)
         return X86EMUL_OKAY;       =20
     }
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-    if ( intr_shadow & VMX_INTR_SHADOW_MOV_SS )
+    if ( __vmread(GUEST_INTERRUPTIBILITY_INFO) & VMX_INTR_SHADOW_MOV_SS )
     {
         vmfail_valid(regs, VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS);
         return X86EMUL_OKAY;
@@ -1723,7 +1720,6 @@ static int nvmx_handle_vmlaunch(struct cpu_user_regs =
*regs)
     bool launched;
     struct vcpu *v =3D current;
     struct nestedvmx *nvmx =3D &vcpu_2_nvmx(v);
-    unsigned long intr_shadow;
     int rc;
=20
     if ( !vvmcx_valid(v) )
@@ -1732,8 +1728,7 @@ static int nvmx_handle_vmlaunch(struct cpu_user_regs =
*regs)
         return X86EMUL_OKAY;
     }
=20
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-    if ( intr_shadow & VMX_INTR_SHADOW_MOV_SS )
+    if ( __vmread(GUEST_INTERRUPTIBILITY_INFO) & VMX_INTR_SHADOW_MOV_SS )
     {
         vmfail_valid(regs, VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS);
         return X86EMUL_OKAY;
@@ -2355,7 +2350,7 @@ int cf_check nvmx_hap_walk_L1_p2m(
=20
     vmx_vmcs_enter(v);
=20
-    __vmread(EXIT_QUALIFICATION, &exit_qual);
+    exit_qual =3D __vmread(EXIT_QUALIFICATION);
     rc =3D nept_translate_l2ga(v, L2_gpa, page_order, rwx_rights, &gfn, p2=
m_acc,
                              &exit_qual, &exit_reason);
     switch ( rc )
@@ -2391,7 +2386,7 @@ void nvmx_idtv_handling(void)
     struct nestedvcpu *nvcpu =3D &vcpu_nestedhvm(v);
     unsigned long idtv_info, reason;
=20
-    __vmread(IDT_VECTORING_INFO, &idtv_info);
+    idtv_info =3D __vmread(IDT_VECTORING_INFO);
     if ( likely(!(idtv_info & INTR_INFO_VALID_MASK)) )
         return;
=20
@@ -2399,7 +2394,7 @@ void nvmx_idtv_handling(void)
      * If L0 can solve the fault that causes idt vectoring, it should
      * be reinjected, otherwise, pass to L1.
      */
-    __vmread(VM_EXIT_REASON, &reason);
+    reason =3D __vmread(VM_EXIT_REASON);
     if ( (uint16_t)reason !=3D EXIT_REASON_EPT_VIOLATION ?
          !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) :
          !nvcpu->nv_vmexit_pending )
@@ -2407,7 +2402,7 @@ void nvmx_idtv_handling(void)
         __vmwrite(VM_ENTRY_INTR_INFO, idtv_info & ~INTR_INFO_RESVD_BITS_MA=
SK);
         if ( idtv_info & INTR_INFO_DELIVER_CODE_MASK )
         {
-            __vmread(IDT_VECTORING_ERROR_CODE, &reason);
+            reason =3D __vmread(IDT_VECTORING_ERROR_CODE);
             __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, reason);
         }
         /*
@@ -2418,7 +2413,7 @@ void nvmx_idtv_handling(void)
          * This means EXIT_INSTRUCTION_LEN is always valid here, for
          * software interrupts both injected by L1, and generated in L2.
          */
-        __vmread(VM_EXIT_INSTRUCTION_LEN, &reason);
+        reason =3D __vmread(VM_EXIT_INSTRUCTION_LEN);
         __vmwrite(VM_ENTRY_INSTRUCTION_LEN, reason);
    }
 }
@@ -2452,7 +2447,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
         u64 exec_bitmap;
         int vector;
=20
-        __vmread(VM_EXIT_INTR_INFO, &intr_info);
+        intr_info =3D __vmread(VM_EXIT_INTR_INFO);
         vector =3D intr_info & INTR_INFO_VECTOR_MASK;
         /*
          * decided by L0 and L1 exception bitmap, if the vetor is set by
@@ -2531,7 +2526,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
             unsigned long qual;
             u16 port, size;
=20
-            __vmread(EXIT_QUALIFICATION, &qual);
+            qual =3D __vmread(EXIT_QUALIFICATION);
             port =3D qual >> 16;
             size =3D (qual & 7) + 1;
             do {
@@ -2638,7 +2633,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
         cr_access_qual_t qual;
         u32 mask =3D 0;
=20
-        __vmread(EXIT_QUALIFICATION, &qual.raw);
+        qual.raw =3D __vmread(EXIT_QUALIFICATION);
         /* also according to guest exec_control */
         ctrl =3D __n2_exec_control(v);
=20
@@ -2680,7 +2675,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
                 {
                     u64 cr0_gh_mask =3D get_vvmcs(v, CR0_GUEST_HOST_MASK);
=20
-                    __vmread(CR0_READ_SHADOW, &old_val);
+                    old_val =3D __vmread(CR0_READ_SHADOW);
                     changed_bits =3D old_val ^ val;
                     if ( changed_bits & cr0_gh_mask )
                         nvcpu->nv_vmexit_pending =3D 1;
@@ -2696,7 +2691,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
                 {
                     u64 cr4_gh_mask =3D get_vvmcs(v, CR4_GUEST_HOST_MASK);
=20
-                    __vmread(CR4_READ_SHADOW, &old_val);
+                    old_val =3D __vmread(CR4_READ_SHADOW);
                     changed_bits =3D old_val ^ val;
                     if ( changed_bits & cr4_gh_mask )
                         nvcpu->nv_vmexit_pending =3D 1;
@@ -2732,7 +2727,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs=
,
             {
                 u64 cr0_gh_mask =3D get_vvmcs(v, CR0_GUEST_HOST_MASK);
=20
-                __vmread(CR0_READ_SHADOW, &old_val);
+                old_val =3D __vmread(CR0_READ_SHADOW);
                 old_val &=3D X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS;
                 val =3D qual.lmsw_data &
                       (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index 33d3d43a38..fbbf9acce8 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -320,16 +320,20 @@ static always_inline void __vmpclear(u64 addr)
     BUG();
 }
=20
-static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
+static always_inline unsigned long __vmread(unsigned long field)
 {
-    asm volatile ( "vmread %1, %0\n\t"
+    unsigned long value;
+
+    asm volatile ( "vmread %[field], %[value]\n\t"
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, vmread)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
-                   : "=3Drm" (*value)
-                   : "r" (field),
+                   : [value] "=3Drm" (value)
+                   : [field] "r" (field),
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0) );
+
+    return value;
 }
=20
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
@@ -363,7 +367,7 @@ static inline enum vmx_insn_errno vmread_safe(unsigned =
long field,
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
     else if ( unlikely(fail_valid) )
-        __vmread(VM_INSTRUCTION_ERROR, &ret);
+        ret =3D __vmread(VM_INSTRUCTION_ERROR);
=20
     return ret;
 }
@@ -371,8 +375,6 @@ static inline enum vmx_insn_errno vmread_safe(unsigned =
long field,
 static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
                                                unsigned long value)
 {
-    unsigned long ret;
-
     asm goto ( "vmwrite %[value], %[field]\n\t"
                "jc %l[vmfail_invalid]\n\t"
                "jz %l[vmfail_error]"
@@ -386,8 +388,7 @@ static inline enum vmx_insn_errno vmwrite_safe(unsigned=
 long field,
     return VMX_INSN_FAIL_INVALID;
=20
  vmfail_error:
-    __vmread(VM_INSTRUCTION_ERROR, &ret);
-    return ret;
+    return __vmread(VM_INSTRUCTION_ERROR);
 }
=20
 static always_inline void __invept(unsigned long type, uint64_t eptp)
--=20
2.34.1



