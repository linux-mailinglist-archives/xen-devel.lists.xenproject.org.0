Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C71A7A05
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:48:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOK3Q-0005SE-So; Tue, 14 Apr 2020 11:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOK3P-0005S1-7f
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:48:35 +0000
X-Inumbo-ID: de812ad4-7e45-11ea-8927-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de812ad4-7e45-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 11:48:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1A54AD63;
 Tue, 14 Apr 2020 11:48:32 +0000 (UTC)
Subject: [PATCH v6 07/10] x86/HVM: don't needlessly intercept APERF/MPERF/TSC
 MSR reads
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <622f62e7-0dad-cca0-ed51-a84728d161c9@suse.com>
Date: Tue, 14 Apr 2020 13:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If the hardware can handle accesses, we should allow it to do so. This
way we can expose EFRO to HVM guests, and "all" that's left for exposing
APERF/MPERF is to figure out how to handle writes to these MSRs. (Note
that the leaf 6 guest CPUID checks will evaluate to false for now, as
recalculate_misc() zaps the entire leaf.)

For TSC the intercepts are made mirror the RDTSC ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
v4: Make TSC intercepts mirror RDTSC ones. Re-base.
v3: New.

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -595,6 +595,7 @@ static void svm_cpuid_policy_changed(str
     struct vmcb_struct *vmcb = svm->vmcb;
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
+    unsigned int mode;
 
     if ( opt_hvm_fep ||
          (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
@@ -607,6 +608,17 @@ static void svm_cpuid_policy_changed(str
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+
+    /* Allow direct reads from APERF/MPERF if permitted by the policy. */
+    mode = cp->basic.raw[6].c & CPUID6_ECX_APERFMPERF_CAPABILITY
+           ? MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW;
+    svm_intercept_msr(v, MSR_IA32_APERF, mode);
+    svm_intercept_msr(v, MSR_IA32_MPERF, mode);
+
+    /* Allow direct access to their r/o counterparts if permitted. */
+    mode = cp->extd.efro ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW;
+    svm_intercept_msr(v, MSR_APERF_RD_ONLY, mode);
+    svm_intercept_msr(v, MSR_MPERF_RD_ONLY, mode);
 }
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
@@ -860,7 +872,10 @@ static void svm_set_rdtsc_exiting(struct
     {
         general1_intercepts |= GENERAL1_INTERCEPT_RDTSC;
         general2_intercepts |= GENERAL2_INTERCEPT_RDTSCP;
+        svm_enable_intercept_for_msr(v, MSR_IA32_TSC);
     }
+    else
+        svm_intercept_msr(v, MSR_IA32_TSC, MSR_INTERCEPT_WRITE);
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -108,6 +108,7 @@ static int construct_vmcb(struct vcpu *v
     {
         vmcb->_general1_intercepts |= GENERAL1_INTERCEPT_RDTSC;
         vmcb->_general2_intercepts |= GENERAL2_INTERCEPT_RDTSCP;
+        svm_intercept_msr(v, MSR_IA32_TSC, MSR_INTERCEPT_WRITE);
     }
 
     /* Guest segment limits. */
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1141,8 +1141,13 @@ static int construct_vmcs(struct vcpu *v
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_CS, VMX_MSR_RW);
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_ESP, VMX_MSR_RW);
         vmx_clear_msr_intercept(v, MSR_IA32_SYSENTER_EIP, VMX_MSR_RW);
+
+        if ( !(v->arch.hvm.vmx.exec_control & CPU_BASED_RDTSC_EXITING) )
+            vmx_clear_msr_intercept(v, MSR_IA32_TSC, VMX_MSR_R);
+
         if ( paging_mode_hap(d) && (!is_iommu_enabled(d) || iommu_snoop) )
             vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
             vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, VMX_MSR_RW);
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -585,6 +585,18 @@ static void vmx_cpuid_policy_changed(str
         vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
     else
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+
+    /* Allow direct reads from APERF/MPERF if permitted by the policy. */
+    if ( cp->basic.raw[6].c & CPUID6_ECX_APERFMPERF_CAPABILITY )
+    {
+        vmx_clear_msr_intercept(v, MSR_IA32_APERF, VMX_MSR_R);
+        vmx_clear_msr_intercept(v, MSR_IA32_MPERF, VMX_MSR_R);
+    }
+    else
+    {
+        vmx_set_msr_intercept(v, MSR_IA32_APERF, VMX_MSR_R);
+        vmx_set_msr_intercept(v, MSR_IA32_MPERF, VMX_MSR_R);
+    }
 }
 
 int vmx_guest_x86_mode(struct vcpu *v)
@@ -1250,7 +1262,12 @@ static void vmx_set_rdtsc_exiting(struct
     vmx_vmcs_enter(v);
     v->arch.hvm.vmx.exec_control &= ~CPU_BASED_RDTSC_EXITING;
     if ( enable )
+    {
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
+        vmx_set_msr_intercept(v, MSR_IA32_TSC, VMX_MSR_R);
+    }
+    else
+        vmx_clear_msr_intercept(v, MSR_IA32_TSC, VMX_MSR_R);
     vmx_update_cpu_exec_control(v);
     vmx_vmcs_exit(v);
 }
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -243,7 +243,7 @@ XEN_CPUFEATURE(ENQCMD,        6*32+29) /
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */
-XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
+XEN_CPUFEATURE(EFRO,          7*32+10) /*S  APERF/MPERF Read Only interface */
 
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */


