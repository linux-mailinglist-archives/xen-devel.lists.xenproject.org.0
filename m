Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01936308879
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78049.141805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SDO-0008MA-Pk; Fri, 29 Jan 2021 11:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78049.141805; Fri, 29 Jan 2021 11:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SDO-0008Ll-Lr; Fri, 29 Jan 2021 11:45:26 +0000
Received: by outflank-mailman (input) for mailman id 78049;
 Fri, 29 Jan 2021 11:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5SDM-0008Lb-W7
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:45:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec74e483-0c1c-492f-aef2-da970d39cd23;
 Fri, 29 Jan 2021 11:45:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34152AD7F;
 Fri, 29 Jan 2021 11:45:20 +0000 (UTC)
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
X-Inumbo-ID: ec74e483-0c1c-492f-aef2-da970d39cd23
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611920720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IP+ploB4BycZMqYzKOnkMrXZSNLwOA1/j8iBJyaxwbA=;
	b=lwgkq1zACZTSkMIvyUWNjTdNPvLTmJXa41G61Mpco1XHujpQaa0bGiT2Gg6u2OcI7haNjo
	ZqnbV89kCAfNxmm8eVigxCEhkQxernUt1GafpspZYrPMmrmKrW6CHF+t+2DO00bD6v75fK
	jcpOE7qIpynlhQC5MOjF+jJ6lI/g3kU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: support emulated UMIP
Message-ID: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Date: Fri, 29 Jan 2021 12:45:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There are three noteworthy drawbacks:
1) The intercepts we need to enable here are CPL-independent, i.e. we
   now have to emulate certain instructions for ring 0.
2) On VMX there's no intercept for SMSW, so the emulation isn't really
   complete there.
3) The CR4 write intercept on SVM is lower priority than all exception
   checks, so we need to intercept #GP.
Therefore this emulation doesn't get offered to guests by default.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Don't offer emulation by default. Re-base.
v2: Split off the x86 insn emulator part. Re-base. Use hvm_featureset
    in hvm_cr4_guest_reserved_bits().

--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -453,6 +453,13 @@ static void __init calculate_hvm_max_pol
     __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
 
     /*
+     * Xen can often provide UMIP emulation to HVM guests even if the host
+     * doesn't have such functionality.
+     */
+    if ( hvm_funcs.set_descriptor_access_exiting )
+        __set_bit(X86_FEATURE_UMIP, hvm_featureset);
+
+    /*
      * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
@@ -504,6 +511,10 @@ static void __init calculate_hvm_def_pol
     for ( i = 0; i < ARRAY_SIZE(hvm_featureset); ++i )
         hvm_featureset[i] &= hvm_featuremask[i];
 
+    /* Don't offer UMIP emulation by default. */
+    if ( !cpu_has_umip )
+        __clear_bit(X86_FEATURE_UMIP, hvm_featureset);
+
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -991,7 +991,8 @@ unsigned long hvm_cr4_guest_valid_bits(c
                                 X86_CR4_PCE                    |
             (p->basic.fxsr    ? X86_CR4_OSFXSR            : 0) |
             (p->basic.sse     ? X86_CR4_OSXMMEXCPT        : 0) |
-            (p->feat.umip     ? X86_CR4_UMIP              : 0) |
+            ((p == &host_cpuid_policy ? &hvm_max_cpuid_policy : p)->feat.umip
+                              ? X86_CR4_UMIP              : 0) |
             (vmxe             ? X86_CR4_VMXE              : 0) |
             (p->feat.fsgsbase ? X86_CR4_FSGSBASE          : 0) |
             (p->basic.pcid    ? X86_CR4_PCIDE             : 0) |
@@ -3731,6 +3732,13 @@ int hvm_descriptor_access_intercept(uint
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
 
+    if ( (is_write || curr->arch.hvm.guest_cr[4] & X86_CR4_UMIP) &&
+         hvm_get_cpl(curr) )
+    {
+        hvm_inject_hw_exception(TRAP_gp_fault, 0);
+        return X86EMUL_OKAY;
+    }
+
     if ( currd->arch.monitor.descriptor_access_enabled )
     {
         ASSERT(curr->arch.vm_event);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -547,6 +547,28 @@ void svm_update_guest_cr(struct vcpu *v,
             value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
         }
 
+        if ( v->domain->arch.cpuid->feat.umip && !cpu_has_umip )
+        {
+            u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+
+            if ( v->arch.hvm.guest_cr[4] & X86_CR4_UMIP )
+            {
+                value &= ~X86_CR4_UMIP;
+                ASSERT(vmcb_get_cr_intercepts(vmcb) & CR_INTERCEPT_CR0_READ);
+                general1_intercepts |= GENERAL1_INTERCEPT_IDTR_READ |
+                                       GENERAL1_INTERCEPT_GDTR_READ |
+                                       GENERAL1_INTERCEPT_LDTR_READ |
+                                       GENERAL1_INTERCEPT_TR_READ;
+            }
+            else if ( !v->domain->arch.monitor.descriptor_access_enabled )
+                general1_intercepts &= ~(GENERAL1_INTERCEPT_IDTR_READ |
+                                         GENERAL1_INTERCEPT_GDTR_READ |
+                                         GENERAL1_INTERCEPT_LDTR_READ |
+                                         GENERAL1_INTERCEPT_TR_READ);
+
+            vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+        }
+
         vmcb_set_cr4(vmcb, value);
         break;
     default:
@@ -883,7 +905,14 @@ static void svm_set_descriptor_access_ex
     if ( enable )
         general1_intercepts |= mask;
     else
+    {
         general1_intercepts &= ~mask;
+        if ( (v->arch.hvm.guest_cr[4] & X86_CR4_UMIP) && !cpu_has_umip )
+            general1_intercepts |= GENERAL1_INTERCEPT_IDTR_READ |
+                                   GENERAL1_INTERCEPT_GDTR_READ |
+                                   GENERAL1_INTERCEPT_LDTR_READ |
+                                   GENERAL1_INTERCEPT_TR_READ;
+    }
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
@@ -1781,6 +1810,16 @@ static void svm_vmexit_do_cr_access(
         __update_guest_eip(regs, vmcb->nextrip - vmcb->rip);
 }
 
+static bool is_cr4_write(const struct x86_emulate_state *state,
+                         const struct x86_emulate_ctxt *ctxt)
+{
+    unsigned int cr;
+
+    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x22) &&
+           x86_insn_modrm(state, NULL, &cr) == 3 &&
+           cr == 4;
+}
+
 static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct vmcb_struct *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
@@ -2728,6 +2767,14 @@ void svm_vmexit_handler(struct cpu_user_
         svm_fpu_dirty_intercept();
         break;
 
+    case VMEXIT_EXCEPTION_GP:
+        HVMTRACE_1D(TRAP, TRAP_gp_fault);
+        /* We only care about ring 0 faults with error code zero. */
+        if ( vmcb->exitinfo1 || vmcb_get_cpl(vmcb) ||
+             !hvm_emulate_one_insn(is_cr4_write, "CR4 write") )
+            hvm_inject_hw_exception(TRAP_gp_fault, vmcb->exitinfo1);
+        break;
+
     case VMEXIT_EXCEPTION_PF:
     {
         unsigned long va;
@@ -2873,7 +2920,16 @@ void svm_vmexit_handler(struct cpu_user_
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
         break;
 
-    case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
+    case VMEXIT_CR0_READ:
+        if ( (v->arch.hvm.guest_cr[4] & X86_CR4_UMIP) &&
+             vmcb_get_cpl(vmcb) )
+        {
+            ASSERT(!cpu_has_umip);
+            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            break;
+        }
+        /* fall through */
+    case VMEXIT_CR1_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
         if ( cpu_has_svm_decode && (vmcb->exitinfo1 & (1ULL << 63)) )
             svm_vmexit_do_cr_access(vmcb, regs);
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -141,6 +141,10 @@ static int construct_vmcb(struct vcpu *v
         HVM_TRAP_MASK |
         (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
 
+    /* For UMIP emulation intercept #GP to catch faulting CR4 writes. */
+    if ( v->domain->arch.cpuid->feat.umip && !cpu_has_umip )
+        vmcb->_exception_intercepts |= 1U << TRAP_gp_fault;
+
     if ( paging_mode_hap(v->domain) )
     {
         vmcb->_np_enable = 1; /* enable nested paging */
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1074,7 +1074,8 @@ static int construct_vmcs(struct vcpu *v
 
     /*
      * Disable features which we don't want active by default:
-     *  - Descriptor table exiting only if wanted by introspection
+     *  - Descriptor table exiting only if needed for CR4.UMIP write
+     *    emulation or wanted by introspection
      *  - x2APIC - default is xAPIC mode
      *  - VPID settings chosen at VMEntry time
      *  - VMCS Shadowing only when in nested VMX mode
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1264,7 +1264,7 @@ static void vmx_set_descriptor_access_ex
     if ( enable )
         v->arch.hvm.vmx.secondary_exec_control |=
             SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
-    else
+    else if ( !(v->arch.hvm.guest_cr[4] & X86_CR4_UMIP) || cpu_has_umip )
         v->arch.hvm.vmx.secondary_exec_control &=
             ~SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
 
@@ -1514,6 +1514,21 @@ static void vmx_update_guest_cr(struct v
             v->arch.hvm.hw_cr[4] &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
         }
 
+        if ( v->domain->arch.cpuid->feat.umip && !cpu_has_umip )
+        {
+            if ( (v->arch.hvm.guest_cr[4] & X86_CR4_UMIP) )
+            {
+                ASSERT(cpu_has_vmx_dt_exiting);
+                v->arch.hvm.hw_cr[4] &= ~X86_CR4_UMIP;
+                v->arch.hvm.vmx.secondary_exec_control |=
+                    SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
+            }
+            else if ( !v->domain->arch.monitor.descriptor_access_enabled )
+                v->arch.hvm.vmx.secondary_exec_control &=
+                    ~SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
+            vmx_update_secondary_exec_control(v);
+        }
+
         __vmwrite(GUEST_CR4, v->arch.hvm.hw_cr[4]);
 
         /*
@@ -1537,6 +1552,7 @@ static void vmx_update_guest_cr(struct v
                                              (X86_CR4_PSE | X86_CR4_SMEP |
                                               X86_CR4_SMAP)
                                              : 0;
+            v->arch.hvm.vmx.cr4_host_mask |= cpu_has_umip ? 0 : X86_CR4_UMIP;
             if ( v->domain->arch.monitor.write_ctrlreg_enabled &
                  monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4) )
                 v->arch.hvm.vmx.cr4_host_mask |=
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -110,6 +110,7 @@
 
 /* CPUID level 0x00000007:0.ecx */
 #define cpu_has_avx512_vbmi     boot_cpu_has(X86_FEATURE_AVX512_VBMI)
+#define cpu_has_umip            boot_cpu_has(X86_FEATURE_UMIP)
 #define cpu_has_avx512_vbmi2    boot_cpu_has(X86_FEATURE_AVX512_VBMI2)
 #define cpu_has_gfni            boot_cpu_has(X86_FEATURE_GFNI)
 #define cpu_has_vaes            boot_cpu_has(X86_FEATURE_VAES)

