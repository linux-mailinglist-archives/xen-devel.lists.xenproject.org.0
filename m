Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2520F4B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFTv-0007tD-QR; Tue, 30 Jun 2020 12:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFTu-0007rV-S2
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:22 +0000
X-Inumbo-ID: 27355b6e-bace-11ea-8610-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27355b6e-bace-11ea-8610-12813bfff9fa;
 Tue, 30 Jun 2020 12:35:17 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D9E08A37EA;
 Tue, 30 Jun 2020 14:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CC5CEA37EC;
 Tue, 30 Jun 2020 14:35:15 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yqXAxhkte2Sl; Tue, 30 Jun 2020 14:35:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F2078A37F2;
 Tue, 30 Jun 2020 14:35:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nyGj-uRfaFYR; Tue, 30 Jun 2020 14:35:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A9B48A37E6;
 Tue, 30 Jun 2020 14:35:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 96E1522622;
 Tue, 30 Jun 2020 14:34:44 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xRYgAYFC3oz1; Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id DDD4F2262A;
 Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
X-Quarantine-ID: <xrYKXSnKJAb1>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xrYKXSnKJAb1; Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id B0221224C7;
 Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 04/10] x86/vmx: implement processor tracing for VMX
Date: Tue, 30 Jun 2020 14:33:47 +0200
Message-Id: <70df90dad7e759f4bb3dba405dc45e372a57fab7.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Jan Beulich <jbeulich@suse.com>, luwei.kang@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Use Intel Processor Trace feature in order to
provision vmtrace_pt_* features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmx.c         | 89 ++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/hvm.h      | 38 +++++++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h |  3 +
 xen/include/asm-x86/hvm/vmx/vmx.h  | 14 +++++
 4 files changed, 144 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ab19d9424e..db3f051b40 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -508,11 +508,24 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
+    uint64_t rtit_ctl;
+
     /*
      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
      * be updated at any time via SWAPGS, which we cannot trap.
      */
     v->arch.hvm.vmx.shadow_gs = rdgsshadow();
+
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
+        BUG_ON(rtit_ctl & RTIT_CTL_TRACEEN);
+
+        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.pt_state->status);
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+    }
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
@@ -524,6 +537,17 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        wrmsrl(MSR_RTIT_OUTPUT_BASE,
+               v->arch.hvm.vmx.pt_state->output_base);
+        wrmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+        wrmsrl(MSR_RTIT_STATUS,
+               v->arch.hvm.vmx.pt_state->status);
+    }
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -2240,6 +2264,60 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
+static int vmx_init_pt(struct vcpu *v)
+{
+    v->arch.hvm.vmx.pt_state = xzalloc(struct pt_state);
+
+    if ( !v->arch.hvm.vmx.pt_state )
+        return -EFAULT;
+
+    if ( !v->arch.vmtrace.pt_buf )
+        return -EINVAL;
+
+    if ( !v->domain->vmtrace_pt_size )
+	return -EINVAL;
+
+    v->arch.hvm.vmx.pt_state->output_base = page_to_maddr(v->arch.vmtrace.pt_buf);
+    v->arch.hvm.vmx.pt_state->output_mask.raw = v->domain->vmtrace_pt_size - 1;
+
+    if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
+        return -EFAULT;
+
+    if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
+                              RTIT_CTL_TRACEEN | RTIT_CTL_OS |
+                              RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
+        return -EFAULT;
+
+    return 0;
+}
+
+static int vmx_destroy_pt(struct vcpu* v)
+{
+    if ( v->arch.hvm.vmx.pt_state )
+        xfree(v->arch.hvm.vmx.pt_state);
+
+    v->arch.hvm.vmx.pt_state = NULL;
+    return 0;
+}
+
+static int vmx_control_pt(struct vcpu *v, bool_t enable)
+{
+    if ( !v->arch.hvm.vmx.pt_state )
+        return -EINVAL;
+
+    v->arch.hvm.vmx.pt_state->active = enable;
+    return 0;
+}
+
+static int vmx_get_pt_offset(struct vcpu *v, uint64_t *offset)
+{
+    if ( !v->arch.hvm.vmx.pt_state )
+        return -EINVAL;
+
+    *offset = v->arch.hvm.vmx.pt_state->output_mask.offset;
+    return 0;
+}
+
 static struct hvm_function_table __initdata vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
@@ -2295,6 +2373,10 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+    .vmtrace_init_pt = vmx_init_pt,
+    .vmtrace_destroy_pt = vmx_destroy_pt,
+    .vmtrace_control_pt = vmx_control_pt,
+    .vmtrace_get_pt_offset = vmx_get_pt_offset,
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
@@ -3674,6 +3756,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     hvm_invalidate_regs_fields(regs);
 
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+    }
+
     if ( paging_mode_hap(v->domain) )
     {
         /*
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377dd82..8f194889e5 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -214,6 +214,12 @@ struct hvm_function_table {
     bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
+    /* vmtrace */
+    int (*vmtrace_init_pt)(struct vcpu *v);
+    int (*vmtrace_destroy_pt)(struct vcpu *v);
+    int (*vmtrace_control_pt)(struct vcpu *v, bool_t enable);
+    int (*vmtrace_get_pt_offset)(struct vcpu *v, uint64_t *offset);
+
     /*
      * Parameters and callbacks for hardware-assisted TSC scaling,
      * which are valid only when the hardware feature is available.
@@ -655,6 +661,38 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
     return false;
 }
 
+static inline int vmtrace_init_pt(struct vcpu *v)
+{
+    if ( hvm_funcs.vmtrace_init_pt )
+        return hvm_funcs.vmtrace_init_pt(v);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int vmtrace_destroy_pt(struct vcpu *v)
+{
+    if ( hvm_funcs.vmtrace_destroy_pt )
+        return hvm_funcs.vmtrace_destroy_pt(v);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int vmtrace_control_pt(struct vcpu *v, bool_t enable)
+{
+    if ( hvm_funcs.vmtrace_control_pt )
+        return hvm_funcs.vmtrace_control_pt(v, enable);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int vmtrace_get_pt_offset(struct vcpu *v, uint64_t *offset)
+{
+    if ( hvm_funcs.vmtrace_get_pt_offset )
+        return hvm_funcs.vmtrace_get_pt_offset(v, offset);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 0e9a0b8de6..64c0d82614 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -186,6 +186,9 @@ struct vmx_vcpu {
      * pCPU and wakeup the related vCPU.
      */
     struct pi_blocking_vcpu pi_blocking;
+
+    /* State of processor trace feature */
+    struct pt_state      *pt_state;
 };
 
 int vmx_create_vmcs(struct vcpu *v);
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 111ccd7e61..be7213d3c0 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -689,4 +689,18 @@ typedef union ldt_or_tr_instr_info {
     };
 } ldt_or_tr_instr_info_t;
 
+/* Processor Trace state per vCPU */
+struct pt_state {
+    bool_t active;
+    uint64_t status;
+    uint64_t output_base;
+    union {
+        uint64_t raw;
+        struct {
+            uint32_t size;
+            uint32_t offset;
+        };
+    } output_mask;
+};
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
-- 
2.20.1


