Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F523217812
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSn-0007rG-Ap; Tue, 07 Jul 2020 19:41:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSm-0007ml-4K
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:41:08 +0000
X-Inumbo-ID: cabb34d2-c089-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cabb34d2-c089-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 19:41:03 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0D846A26BB;
 Tue,  7 Jul 2020 21:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id ADD5EA26A8;
 Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fXx8pdKVsSKH; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A79E9A26AF;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l2_NCbfU6I40; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 61B5DA2660;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 39C8D2247C;
 Tue,  7 Jul 2020 21:40:05 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Lg6X8o5lhAGl; Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0020522452;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <OFjbTfOjfw3p>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OFjbTfOjfw3p; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id B5839223C8;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 07/11] x86/vmx: implement IPT in VMX
Date: Tue,  7 Jul 2020 21:39:46 +0200
Message-Id: <7ddfc44d6ffde0fa307f0e074225f588c397aef0.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Jan Beulich <jbeulich@suse.com>, tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Use Intel Processor Trace feature to provide vmtrace_pt_*
interface for HVM/VMX.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmx.c         | 110 +++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h |   3 +
 xen/include/asm-x86/hvm/vmx/vmx.h  |  14 ++++
 3 files changed, 127 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cc6d4ece22..63a5a76e16 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -428,6 +428,56 @@ static void vmx_domain_relinquish_resources(struct domain *d)
     vmx_free_vlapic_mapping(d);
 }
 
+static int vmx_init_pt(struct vcpu *v)
+{
+    int rc;
+    uint64_t size = v->domain->processor_trace_buf_kb * KB(1);
+
+    if ( !v->vmtrace.pt_buf || !size )
+        return -EINVAL;
+
+    /*
+     * We don't accept trace buffer size smaller than single page
+     * and the upper bound is defined as 4GB in the specification.
+     * The buffer size must be also a power of 2.
+     */
+    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
+        return -EINVAL;
+
+    v->arch.hvm.vmx.ipt_state = xzalloc(struct ipt_state);
+
+    if ( !v->arch.hvm.vmx.ipt_state )
+        return -ENOMEM;
+
+    v->arch.hvm.vmx.ipt_state->output_base =
+        page_to_maddr(v->vmtrace.pt_buf);
+    v->arch.hvm.vmx.ipt_state->output_mask.raw = size - 1;
+
+    rc = vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0);
+
+    if ( rc )
+        return rc;
+
+    rc = vmx_add_guest_msr(v, MSR_RTIT_CTL,
+                              RTIT_CTL_TRACE_EN | RTIT_CTL_OS |
+                              RTIT_CTL_USR | RTIT_CTL_BRANCH_EN);
+
+    if ( rc )
+        return rc;
+
+    return 0;
+}
+
+static int vmx_destroy_pt(struct vcpu* v)
+{
+    if ( v->arch.hvm.vmx.ipt_state )
+        xfree(v->arch.hvm.vmx.ipt_state);
+
+    v->arch.hvm.vmx.ipt_state = NULL;
+    return 0;
+}
+
+
 static int vmx_vcpu_initialise(struct vcpu *v)
 {
     int rc;
@@ -471,6 +521,14 @@ static int vmx_vcpu_initialise(struct vcpu *v)
 
     vmx_install_vlapic_mapping(v);
 
+    if ( v->domain->processor_trace_buf_kb )
+    {
+        rc = vmx_init_pt(v);
+
+        if ( rc )
+            return rc;
+    }
+
     return 0;
 }
 
@@ -483,6 +541,7 @@ static void vmx_vcpu_destroy(struct vcpu *v)
      * prior to vmx_domain_destroy so we need to disable PML for each vcpu
      * separately here.
      */
+    vmx_destroy_pt(v);
     vmx_vcpu_disable_pml(v);
     vmx_destroy_vmcs(v);
     passive_domain_destroy(v);
@@ -513,6 +572,18 @@ static void vmx_save_guest_msrs(struct vcpu *v)
      * be updated at any time via SWAPGS, which we cannot trap.
      */
     v->arch.hvm.vmx.shadow_gs = rdgsshadow();
+
+    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
+                  v->arch.hvm.vmx.ipt_state->active) )
+    {
+        uint64_t rtit_ctl;
+        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
+        BUG_ON(rtit_ctl & RTIT_CTL_TRACE_EN);
+
+        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.ipt_state->output_mask.raw);
+    }
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
@@ -524,6 +595,17 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
+                  v->arch.hvm.vmx.ipt_state->active) )
+    {
+        wrmsrl(MSR_RTIT_OUTPUT_BASE,
+               v->arch.hvm.vmx.ipt_state->output_base);
+        wrmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.ipt_state->output_mask.raw);
+        wrmsrl(MSR_RTIT_STATUS,
+               v->arch.hvm.vmx.ipt_state->status);
+    }
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -2240,6 +2322,25 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
+static int vmx_control_pt(struct vcpu *v, bool enable)
+{
+    if ( !v->arch.hvm.vmx.ipt_state )
+        return -EINVAL;
+
+    v->arch.hvm.vmx.ipt_state->active = enable;
+    return 0;
+}
+
+static int vmx_get_pt_offset(struct vcpu *v, uint64_t *offset, uint64_t *size)
+{
+    if ( !v->arch.hvm.vmx.ipt_state )
+        return -EINVAL;
+
+    *offset = v->arch.hvm.vmx.ipt_state->output_mask.offset;
+    *size = v->arch.hvm.vmx.ipt_state->output_mask.size + 1;
+    return 0;
+}
+
 static struct hvm_function_table __initdata vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
@@ -2295,6 +2396,8 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+    .vmtrace_control_pt = vmx_control_pt,
+    .vmtrace_get_pt_offset = vmx_get_pt_offset,
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
@@ -3674,6 +3777,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     hvm_invalidate_regs_fields(regs);
 
+    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
+                  v->arch.hvm.vmx.ipt_state->active) )
+    {
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.ipt_state->output_mask.raw);
+    }
+
     if ( paging_mode_hap(v->domain) )
     {
         /*
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 6153ba6769..65971fa6ad 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -186,6 +186,9 @@ struct vmx_vcpu {
      * pCPU and wakeup the related vCPU.
      */
     struct pi_blocking_vcpu pi_blocking;
+
+    /* State of processor trace feature */
+    struct ipt_state      *ipt_state;
 };
 
 int vmx_create_vmcs(struct vcpu *v);
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 111ccd7e61..8d7c67e43d 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -689,4 +689,18 @@ typedef union ldt_or_tr_instr_info {
     };
 } ldt_or_tr_instr_info_t;
 
+/* Processor Trace state per vCPU */
+struct ipt_state {
+    bool active;
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
2.17.1


