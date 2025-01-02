Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F49FF70F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863733.1275128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpw-0005cN-JK; Thu, 02 Jan 2025 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863733.1275128; Thu, 02 Jan 2025 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpw-0005ZF-CB; Thu, 02 Jan 2025 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 863733;
 Thu, 02 Jan 2025 08:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0qU=T2=bounce.vates.tech=bounce-md_30504962.67765235.v1-68aac7873e55466da24a0637d6e85abf@srs-se1.protection.inumbo.net>)
 id 1tTGpu-0004rS-A6
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:46 +0000
Received: from mail180-43.suw31.mandrillapp.com
 (mail180-43.suw31.mandrillapp.com [198.2.180.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f0b31b-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:42 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-43.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fF660tzLfHCqL
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 68aac7873e55466da24a0637d6e85abf; Thu, 02 Jan 2025 08:45:41 +0000
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
X-Inumbo-ID: f2f0b31b-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807541; x=1736068041;
	bh=bzh0Fm9xRWi5sdSCui/eX3MkuuuaQvZQ4zYj+fK0gX8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uMkU/I3HMgS2qZGZSO21pzx6J2vDfpojCPFRvo48ZMp+qtHL366nMvfZiUiodET6M
	 219uHx3eq4dNDpR0/Xxe51wM9AJwPlbCIq6CpRFeyh4tS+Y4Xw4i91N9viKENyD2Fx
	 TRKHg4wtmFTv3Hybe5/l+1opTsgP4onGoAsm4TLjXymY8QuAEDr3Fn7K2bNRoLxT/u
	 skA4Ai2EpdZlizGVZsxAnGWK2ftbrQPxBQ49QVvDt/GE+0h+vc36Jyq5OixO+rUhJ5
	 BHyxyLUyQ8xwAL5HOFTidAdp+Dmpv89nyKVh6xEe8stYGbz1yF1Dp0p8xKEr4nfwQr
	 aJkiQvFK+PS8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807541; x=1736068041; i=ngoc-tu.dinh@vates.tech;
	bh=bzh0Fm9xRWi5sdSCui/eX3MkuuuaQvZQ4zYj+fK0gX8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=soK6Agw0aE8t92BfDTToFSRLwzXj7Bg2MKx/bNYyVtyUu8eODd49fpS9RqBYvbeaZ
	 8IOuZemgOsEXgYlI9P2oms/DzRhoMqU07bSK3Lxub4R4qk0DRplHCiS3lf1bA12738
	 6FyQGbvdOyXi3bDF/zSi+zQlm3mNZiEfxnaUzKeYeFXH30uvJjbK3flXIC1liS7cKX
	 zKIF1D6dtU90dK+KCxzy19BjYhv+1fiSPtUVtYAj2krjfo4DHLRzU7OTUuJCmXeDLv
	 ATOCqgetCGEMyWmw3Wyxk5PGI6AjP+JVk5xun0+CIdqormyoRzIq6SEl9YlPgz55BF
	 bj8b9S6flXZyQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2009/10]=20x86/vmx:=20Implement=20arch=20LBR?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807540946
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-10-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.68aac7873e55466da24a0637d6e85abf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Use guest LBR_CTL in VMCS to limit LBR operation per guest.

Use MSR bitmap to disable interception of arch LBR MSRs. Reconfigure
bitmap on each valid LBR depth write.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/domain.c                   |   7 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c              | 203 ++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  11 ++
 xen/arch/x86/include/asm/msr.h          |   5 +
 xen/arch/x86/msr.c                      |  86 ++++++++++
 6 files changed, 307 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812..8ed35cbbc8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2021,6 +2021,13 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
+#ifdef CONFIG_HVM
+        /* XRSTORS LBR state behavior depends on MSR_LBR_DEPTH */
+        if ( using_vmx() &&
+             is_hvm_vcpu(n) &&
+             n->domain->arch.cpu_policy->feat.arch_lbr )
+            wrmsrl(MSR_LBR_DEPTH, n->arch.msrs->lbr_depth.raw);
+#endif
         vcpu_restore_fpu_nonlazy(n, false);
         nd->arch.ctxt_switch->to(n);
     }
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 147e998371..a16daad78a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -203,6 +203,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
     P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
     P(cpu_has_vmx_virt_spec_ctrl, "Virtualize SPEC_CTRL");
+    P(cpu_has_vmx_guest_lbr_ctl, "Architectural LBR virtualization");
 #undef P
 
     if ( !printed )
@@ -448,7 +449,8 @@ static int vmx_init_vmcs_config(bool bsp)
 
     min = VM_EXIT_ACK_INTR_ON_EXIT;
     opt = (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOST_PAT |
-           VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
+           VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS |
+           VM_EXIT_CLEAR_GUEST_LBR_CTL);
     min |= VM_EXIT_IA32E_MODE;
     _vmx_vmexit_control = adjust_vmx_controls(
         "VMExit Control", min, opt, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
@@ -489,7 +491,7 @@ static int vmx_init_vmcs_config(bool bsp)
 
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
-           VM_ENTRY_LOAD_BNDCFGS);
+           VM_ENTRY_LOAD_BNDCFGS | VM_ENTRY_LOAD_GUEST_LBR_CTL);
     _vmx_vmentry_control = adjust_vmx_controls(
         "VMEntry Control", min, opt, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);
 
@@ -1329,6 +1331,9 @@ static int construct_vmcs(struct vcpu *v)
               | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF))
               | (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
 
+    if ( cpu_has_vmx_guest_lbr_ctl )
+        __vmwrite(GUEST_LBR_CTL, 0);
+
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
 
@@ -2087,6 +2092,8 @@ void vmcs_dump_vcpu(struct vcpu *v)
            vmr32(GUEST_PREEMPTION_TIMER), vmr32(GUEST_SMBASE));
     printk("DebugCtl = 0x%016lx  DebugExceptions = 0x%016lx\n",
            vmr(GUEST_IA32_DEBUGCTL), vmr(GUEST_PENDING_DBG_EXCEPTIONS));
+    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_LBR_CTL )
+        printk("LbrCtl = 0x%016lx\n", vmr(GUEST_LBR_CTL));
     if ( vmentry_ctl & (VM_ENTRY_LOAD_PERF_GLOBAL_CTRL | VM_ENTRY_LOAD_BNDCFGS) )
         printk("PerfGlobCtl = 0x%016lx  BndCfgS = 0x%016lx\n",
                vmr(GUEST_PERF_GLOBAL_CTRL), vmr(GUEST_BNDCFGS));
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9f1e9d515f..c706f01d79 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -48,6 +48,7 @@
 #include <asm/monitor.h>
 #include <asm/prot-key.h>
 #include <asm/spec_ctrl.h>
+#include <asm/xstate.h>
 #include <public/arch-x86/cpuid.h>
 
 static bool __initdata opt_force_ept;
@@ -773,6 +774,67 @@ void vmx_update_exception_bitmap(struct vcpu *v)
         __vmwrite(EXCEPTION_BITMAP, bitmap);
 }
 
+static void cf_check vmx_set_lbr_depth(struct vcpu *v,
+                                       uint32_t depth)
+{
+    struct cpu_policy *cp = v->domain->arch.cpu_policy;
+    bool host_lip, guest_lip;
+    uint32_t i;
+
+    if ( !cp->feat.arch_lbr )
+        return;
+
+    ASSERT(depth != 0 &&
+           depth <= NUM_MSR_ARCH_LBR_FROM_TO &&
+           depth % 8 == 0);
+    ASSERT(cp->basic.lbr_1Ca.supported_depths & ((1u << (depth / 8)) - 1));
+
+    host_lip = current_cpu_has_lbr_lip;
+    guest_lip = !!cp->basic.lbr_1Ca.ip_contains_lip;
+
+    if ( v->arch.msrs->lbr_depth.raw == depth &&
+         v->arch.hvm.vmx.last_host_lip == host_lip )
+        return;
+
+    if ( host_lip != guest_lip )
+    {
+        for ( i = 0; i < depth; i++ )
+        {
+            vmx_set_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
+            vmx_set_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
+        }
+        vmx_set_msr_intercept(v, MSR_IA32_LASTINTFROMIP, VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_IA32_LASTINTTOIP, VMX_MSR_RW);
+    }
+    else
+    {
+        for ( i = 0; i < depth; i++ )
+        {
+            vmx_clear_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
+        }
+        vmx_clear_msr_intercept(v, MSR_IA32_LASTINTFROMIP, VMX_MSR_RW);
+        vmx_clear_msr_intercept(v, MSR_IA32_LASTINTTOIP, VMX_MSR_RW);
+    }
+
+    /* MSR_{LBR,LER}_INFO don't need translating */
+    for ( i = 0; i < depth; i++ )
+        vmx_clear_msr_intercept(v, MSR_LBR_INFO(i), VMX_MSR_RW);
+    vmx_clear_msr_intercept(v, MSR_LER_INFO, VMX_MSR_RW);
+    /* MSRs beyond LBR_DEPTH always need #GP */
+    for ( i = depth; i < NUM_MSR_ARCH_LBR_FROM_TO; i++ )
+    {
+        vmx_set_msr_intercept(v, MSR_LBR_INFO(i), VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
+        vmx_set_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
+    }
+
+    __vmwrite(XSS_EXIT_BITMAP, host_lip == guest_lip ? 0 : X86_XSS_LBR);
+
+    v->arch.msrs->lbr_depth.raw = depth;
+    v->arch.hvm.vmx.last_host_lip = host_lip;
+}
+
 static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
@@ -871,6 +933,16 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     else
         vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 
+    if ( cp->feat.arch_lbr && v->arch.msrs->lbr_depth.raw == 0 )
+    {
+        uint32_t max_depth;
+
+        ASSERT(cp->basic.lbr_1Ca.supported_depths > 0);
+        max_depth = fls(cp->basic.lbr_1Ca.supported_depths) * 8;
+
+        vmx_set_lbr_depth(v, max_depth);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
@@ -2635,6 +2707,7 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
     const struct vcpu *curr = current;
     struct domain *d = v->domain;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     const struct vcpu_msrs *msrs = v->arch.msrs;
     uint64_t val = 0;
     int rc;
@@ -2679,6 +2752,48 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
         __vmread(GUEST_BNDCFGS, &val);
         break;
 
+    case MSR_LBR_CTL:
+        __vmread(GUEST_LBR_CTL, &val);
+        break;
+
+    case MSR_LBR_DEPTH:
+        val = v->arch.msrs->lbr_depth.raw;
+        break;
+
+    case MSR_LER_INFO:
+    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( v != curr )
+        {
+            val = 0;
+            break;
+        }
+        rdmsrl(reg, val);
+        break;
+
+    case MSR_IA32_LASTINTFROMIP:
+    case MSR_IA32_LASTINTTOIP:
+    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    {
+        struct segment_register cs;
+        int mode_64bit;
+        uint64_t offset;
+
+        if ( v != curr )
+        {
+            val = 0;
+            break;
+        }
+
+        mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
+        hvm_get_segment_register(v, x86_seg_cs, &cs);
+        offset = x86_get_lbr_cs_offset(cp, mode_64bit, &cs, true);
+
+        rdmsrl(reg, val);
+        val += offset;
+        break;
+    }
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -2695,6 +2810,7 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     const struct vcpu *curr = current;
     struct vcpu_msrs *msrs = v->arch.msrs;
     struct domain *d = v->domain;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     int rc;
 
     /* Logic which doesn't require remote VMCS acquisition. */
@@ -2734,6 +2850,43 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         __vmwrite(GUEST_BNDCFGS, val);
         break;
 
+    case MSR_LBR_CTL:
+        __vmwrite(GUEST_LBR_CTL, val);
+        break;
+
+    case MSR_LBR_DEPTH:
+        if ( v == curr )
+            wrmsrl(MSR_LBR_DEPTH, val);
+        vmx_set_lbr_depth(v, val);
+        break;
+
+    case MSR_LER_INFO:
+    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( v == curr )
+            wrmsrl(reg, val);
+        break;
+
+    case MSR_IA32_LASTINTFROMIP:
+    case MSR_IA32_LASTINTTOIP:
+    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    {
+        struct segment_register cs;
+        bool mode_64bit;
+        uint64_t offset;
+
+        if ( v != curr )
+            break;
+
+        mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
+        hvm_get_segment_register(v, x86_seg_cs, &cs);
+        offset = x86_get_lbr_cs_offset(cp, mode_64bit, &cs, false);
+
+        val += offset;
+        wrmsrl(reg, val);
+        break;
+    }
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
@@ -2805,6 +2958,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
     .vmtrace_reset = vmtrace_reset,
+    .set_lbr_depth        = vmx_set_lbr_depth,
 
     .get_reg = vmx_get_reg,
     .set_reg = vmx_set_reg,
@@ -3997,18 +4151,6 @@ static void vmx_idtv_reinject(unsigned long idtv_info)
     }
 }
 
-static void vmx_handle_xsaves(void)
-{
-    gdprintk(XENLOG_ERR, "xsaves should not cause vmexit\n");
-    domain_crash(current->domain);
-}
-
-static void vmx_handle_xrstors(void)
-{
-    gdprintk(XENLOG_ERR, "xrstors should not cause vmexit\n");
-    domain_crash(current->domain);
-}
-
 static void vmx_handle_descriptor_access(uint32_t exit_reason)
 {
     uint64_t instr_info;
@@ -4055,6 +4197,36 @@ static void undo_nmis_unblocked_by_iret(void)
               guest_info | VMX_INTR_SHADOW_NMI);
 }
 
+static void vmx_handle_xsaves_xrstors(bool saving)
+{
+    struct hvm_emulate_ctxt ctxt;
+    int rc;
+
+    if ( saving )
+        hvm_emulate_init_once(&ctxt, x86_insn_is_xsaves, guest_cpu_user_regs());
+    else
+        hvm_emulate_init_once(&ctxt, x86_insn_is_xrstors, guest_cpu_user_regs());
+
+    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
+    {
+    case X86EMUL_UNHANDLEABLE:
+        hvm_dump_emulation_state(XENLOG_G_WARNING, "XSAVES/XRSTORS", &ctxt, rc);
+        hvm_inject_hw_exception(X86_EXC_UD, 0);
+        return;
+
+    case X86EMUL_UNRECOGNIZED:
+        hvm_dump_emulation_state(XENLOG_G_WARNING, "XSAVES/XRSTORS", &ctxt, rc);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        break;
+
+    case X86EMUL_EXCEPTION:
+        hvm_inject_event(&ctxt.ctxt.event);
+        break;
+    }
+
+    hvm_emulate_writeback(&ctxt);
+}
+
 void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
@@ -4695,11 +4867,11 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_XSAVES:
-        vmx_handle_xsaves();
+        vmx_handle_xsaves_xrstors(true);
         break;
 
     case EXIT_REASON_XRSTORS:
-        vmx_handle_xrstors();
+        vmx_handle_xsaves_xrstors(false);
         break;
 
     case EXIT_REASON_ACCESS_GDTR_OR_IDTR:
@@ -4818,6 +4990,9 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( curr->domain->arch.hvm.pi_ops.vcpu_block )
         vmx_pi_do_resume(curr);
 
+    /* Update the XSS exiting bitmap in case of vCPU migration. */
+    vmx_set_lbr_depth(curr, curr->arch.msrs->lbr_depth.raw);
+
     if ( !cpu_has_vmx_vpid )
         goto out;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 939b87eb50..da7e0b4103 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -154,6 +154,9 @@ struct vmx_vcpu {
     /* Are we emulating rather than VMENTERing? */
     uint8_t              vmx_emulate;
 
+    /* If the vCPU last ran on a host CPU with XEN_X86_FEATURE_LBR_LIP */
+    bool                 last_host_lip;
+    /* For legacy LBR only */
     uint8_t              lbr_flags;
 
     /* Bitmask of segments that we can't safely use in virtual 8086 mode */
@@ -229,6 +232,7 @@ extern u32 vmx_pin_based_exec_control;
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
+#define VM_EXIT_CLEAR_GUEST_LBR_CTL     0x04000000
 extern u32 vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
@@ -238,6 +242,7 @@ extern u32 vmx_vmexit_control;
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
+#define VM_ENTRY_LOAD_GUEST_LBR_CTL     0x00200000
 extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
@@ -391,6 +396,10 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_notify_vm_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#define cpu_has_vmx_guest_lbr_ctl \
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     (vmx_vmexit_control & VM_EXIT_CLEAR_GUEST_LBR_CTL) && \
+     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_LBR_CTL))
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 
@@ -480,6 +489,8 @@ enum vmcs_field {
     GUEST_PDPTE0                    = 0x0000280a,
 #define GUEST_PDPTE(n) (GUEST_PDPTE0 + (n) * 2) /* n = 0...3 */
     GUEST_BNDCFGS                   = 0x00002812,
+    GUEST_RTIT_CTL                  = 0x00002814,
+    GUEST_LBR_CTL                   = 0x00002816,
     HOST_PAT                        = 0x00002c00,
     HOST_EFER                       = 0x00002c02,
     HOST_PERF_GLOBAL_CTRL           = 0x00002c04,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 7b00a4db5d..d7578d8cab 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -389,6 +389,11 @@ struct vcpu_msrs
         uint64_t raw;
     } xss;
 
+    /* 0x000014cf - MSR_LBR_DEPTH */
+    struct {
+        uint64_t raw;
+    } lbr_depth;
+
     /*
      * 0xc0000103 - MSR_TSC_AUX
      *
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 68a419ac8e..6c72728f81 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -193,6 +193,38 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         goto get_reg;
 
+    case MSR_LBR_CTL:
+    case MSR_LBR_DEPTH:
+    case MSR_LER_INFO:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        goto get_reg;
+
+    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( msr - MSR_LBR_INFO(0) >= msrs->lbr_depth.raw )
+            goto gp_fault;
+
+        goto get_reg;
+
+    case MSR_IA32_LASTINTFROMIP:
+    case MSR_IA32_LASTINTTOIP:
+    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( (msr >= MSR_LBR_FROM_IP(msrs->lbr_depth.raw) &&
+              msr <= MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) ||
+             (msr >= MSR_LBR_TO_IP(msrs->lbr_depth.raw) &&
+              msr <= MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) )
+            goto gp_fault;
+
+        goto get_reg;
+
     case MSR_IA32_XSS:
         if ( !cp->xstate.xsaves )
             goto gp_fault;
@@ -516,6 +548,60 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         }
 
         goto set_reg;
+
+    case MSR_LBR_CTL:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( val & ~LBR_CTL_VALID )
+            goto gp_fault;
+
+        goto set_reg;
+
+    case MSR_LBR_DEPTH:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( val == 0 ||
+             val > NUM_MSR_ARCH_LBR_FROM_TO ||
+             val % 8 != 0 )
+            goto gp_fault;
+
+        if ( !(cp->basic.lbr_1Ca.supported_depths &
+               ((1u << (val / 8)) - 1)) )
+            goto gp_fault;
+
+        goto set_reg;
+
+    case MSR_LER_INFO:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        goto set_reg;
+
+    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( msr - MSR_LBR_INFO(0) >= v->arch.msrs->lbr_depth.raw )
+            goto gp_fault;
+
+        goto set_reg;
+
+    case MSR_IA32_LASTINTFROMIP:
+    case MSR_IA32_LASTINTTOIP:
+    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( (msr >= MSR_LBR_FROM_IP(v->arch.msrs->lbr_depth.raw) &&
+              msr <= MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) ||
+             (msr >= MSR_LBR_TO_IP(v->arch.msrs->lbr_depth.raw) &&
+              msr <= MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) )
+            goto gp_fault;
+
+        goto set_reg;
 #endif /* CONFIG_HVM */
 
     case MSR_IA32_XSS:
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

