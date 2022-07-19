Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8F57A4FA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370787.602662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqrx-0002YN-Bj; Tue, 19 Jul 2022 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370787.602662; Tue, 19 Jul 2022 17:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqrx-0002Vu-8c; Tue, 19 Jul 2022 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 370787;
 Tue, 19 Jul 2022 17:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0fU=XY=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1oDqrv-0002Vo-HA
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:18:47 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d75ccb72-0786-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:18:45 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 10:18:30 -0700
Received: from jlirvin-mobl5.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.39.211])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 10:18:29 -0700
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
X-Inumbo-ID: d75ccb72-0786-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658251125; x=1689787125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7OuMzZMeAVedQlxQcpp8HXe51NYN54wYxaB9nOgs/74=;
  b=nZcs3cFO6ezobCUnFm09uwHQQBbnbDH6wZ6R/LoicPXYKGGVVkP6f7mD
   52w/z15u4mo+EcwI0Wv6eB/1zo3P+8SK6QC1WrGu3OiMON1qD497SW4oD
   KhwZdQymdT/ykmjObbtMbtDTM306Th49nllOSrxJFa+Gx2Pxxh4OAThhs
   LOURijGgqAq0BgvcXSF1EFkWDtiurU5yjR9DHqwHgmM0YJIKkCXWYJr8d
   Z7eVOPisBsYyUMi+GjS92cxyZbUJ+NJ78E0FTUC5ujlaS8qa7nQxDam6o
   eoob1QvRdqxqnHbTZ55sdC3fjD3ody+7apYtEGZICvQ7ne/kWqKB0nMXO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="284110682"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="284110682"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="924859998"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] xen/mem_sharing: support forks with active vPMU state
Date: Tue, 19 Jul 2022 13:18:11 -0400
Message-Id: <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the vPMU state from a parent isn't copied to VM forks. To enable the
vPMU state to be copied to a fork VM we export certain vPMU functions. First,
the vPMU context needs to be allocated for the fork if the parent has one. For
this we introduce vpmu->allocate_context, which has previously only been called
when the guest enables the PMU on itself. Furthermore, we export
vpmu_save_force so that the PMU context can be saved on-demand even if no
context switch took place on the parent's CPU yet. Additionally, we make sure
all relevant configuration MSRs are saved in the vPMU context so the copy is
complete and the fork starts with the same PMU config as the parent.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/cpu/vpmu.c         | 12 ++++++++-
 xen/arch/x86/cpu/vpmu_intel.c   | 16 +++++++++++
 xen/arch/x86/include/asm/vpmu.h |  5 ++++
 xen/arch/x86/mm/mem_sharing.c   | 48 +++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index d2c03a1104..2b5d64a60d 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -336,7 +336,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
 #endif
 }
 
-static void cf_check vpmu_save_force(void *arg)
+void cf_check vpmu_save_force(void *arg)
 {
     struct vcpu *v = arg;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
@@ -529,6 +529,16 @@ void vpmu_initialise(struct vcpu *v)
         put_vpmu(v);
 }
 
+void vpmu_allocate_context(struct vcpu *v)
+{
+    struct vpmu_struct *vpmu = vcpu_vpmu(v);
+
+    if ( vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
+        return;
+
+    alternative_call(vpmu_ops.allocate_context, v);
+}
+
 static void cf_check vpmu_clear_last(void *arg)
 {
     if ( this_cpu(last_vcpu) == arg )
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 8612f46973..31dc0ee14b 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -282,10 +282,17 @@ static inline void __core2_vpmu_save(struct vcpu *v)
     for ( i = 0; i < fixed_pmc_cnt; i++ )
         rdmsrl(MSR_CORE_PERF_FIXED_CTR0 + i, fixed_counters[i]);
     for ( i = 0; i < arch_pmc_cnt; i++ )
+    {
         rdmsrl(MSR_IA32_PERFCTR0 + i, xen_pmu_cntr_pair[i].counter);
+        rdmsrl(MSR_P6_EVNTSEL(i), xen_pmu_cntr_pair[i].control);
+    }
 
     if ( !is_hvm_vcpu(v) )
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
+    /* Save MSR to private context to make it fork-friendly */
+    else if ( mem_sharing_enabled(v->domain) )
+        vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
+                           &core2_vpmu_cxt->global_ctrl);
 }
 
 static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
@@ -346,6 +353,10 @@ static inline void __core2_vpmu_load(struct vcpu *v)
         core2_vpmu_cxt->global_ovf_ctrl = 0;
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
     }
+    /* Restore MSR from context when used with a fork */
+    else if ( mem_sharing_is_fork(v->domain) )
+        vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
+                            core2_vpmu_cxt->global_ctrl);
 }
 
 static int core2_vpmu_verify(struct vcpu *v)
@@ -474,7 +485,11 @@ static int core2_vpmu_alloc_resource(struct vcpu *v)
                                     sizeof(uint64_t) * fixed_pmc_cnt;
 
     vpmu->context = core2_vpmu_cxt;
+    vpmu->context_size = sizeof(struct xen_pmu_intel_ctxt) +
+                         fixed_pmc_cnt * sizeof(uint64_t) +
+                         arch_pmc_cnt * sizeof(struct xen_pmu_cntr_pair);
     vpmu->priv_context = p;
+    vpmu->priv_context_size = sizeof(uint64_t);
 
     if ( !has_vlapic(v->domain) )
     {
@@ -882,6 +897,7 @@ static int cf_check vmx_vpmu_initialise(struct vcpu *v)
 
 static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
     .initialise = vmx_vpmu_initialise,
+    .allocate_context = core2_vpmu_alloc_resource,
     .do_wrmsr = core2_vpmu_do_wrmsr,
     .do_rdmsr = core2_vpmu_do_rdmsr,
     .do_interrupt = core2_vpmu_do_interrupt,
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index e5709bd44a..14d0939247 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -40,6 +40,7 @@
 /* Arch specific operations shared by all vpmus */
 struct arch_vpmu_ops {
     int (*initialise)(struct vcpu *v);
+    int (*allocate_context)(struct vcpu *v);
     int (*do_wrmsr)(unsigned int msr, uint64_t msr_content);
     int (*do_rdmsr)(unsigned int msr, uint64_t *msr_content);
     int (*do_interrupt)(struct cpu_user_regs *regs);
@@ -59,6 +60,8 @@ struct vpmu_struct {
     u32 hw_lapic_lvtpc;
     void *context;      /* May be shared with PV guest */
     void *priv_context; /* hypervisor-only */
+    size_t context_size;
+    size_t priv_context_size;
     struct xen_pmu_data *xenpmu_data;
     spinlock_t vpmu_lock;
 };
@@ -106,8 +109,10 @@ void vpmu_lvtpc_update(uint32_t val);
 int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write);
 void vpmu_do_interrupt(struct cpu_user_regs *regs);
 void vpmu_initialise(struct vcpu *v);
+void vpmu_allocate_context(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);
+void vpmu_save_force(void *arg);
 int vpmu_load(struct vcpu *v, bool_t from_guest);
 void vpmu_dump(struct vcpu *v);
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8f9d9ed9a9..39cd03abf7 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1653,6 +1653,50 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
+{
+    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
+    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);
+
+    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
+        return 0;
+    if ( !vpmu_is_set(cd_vpmu, VPMU_CONTEXT_ALLOCATED) )
+    {
+        vpmu_allocate_context(cd_vcpu);
+        if ( !vpmu_is_set(cd_vpmu, VPMU_CONTEXT_ALLOCATED) )
+            return -ENOMEM;
+    }
+
+    /*
+     * The VPMU subsystem only saves the context when the CPU does a context
+     * switch. Otherwise, the relevant MSRs are not saved on vmexit.
+     * We force a save here in case the parent CPU context is still loaded.
+     */
+    if ( vpmu_is_set(d_vpmu, VPMU_CONTEXT_LOADED) )
+    {
+        int pcpu = smp_processor_id();
+
+        if ( d_vpmu->last_pcpu != pcpu )
+        {
+            on_selected_cpus(cpumask_of(d_vpmu->last_pcpu),
+                             vpmu_save_force, (void *)d_vcpu, 1);
+            vpmu_reset(d_vpmu, VPMU_CONTEXT_LOADED);
+        } else
+            vpmu_save(d_vcpu);
+    }
+
+    if ( vpmu_is_set(d_vpmu, VPMU_RUNNING) )
+        vpmu_set(cd_vpmu, VPMU_RUNNING);
+
+    /* Make sure context gets (re-)loaded when scheduled next */
+    vpmu_reset(cd_vpmu, VPMU_CONTEXT_LOADED);
+
+    memcpy(cd_vpmu->context, d_vpmu->context, d_vpmu->context_size);
+    memcpy(cd_vpmu->priv_context, d_vpmu->priv_context, d_vpmu->priv_context_size);
+
+    return 0;
+}
+
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
@@ -1702,6 +1746,10 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
             copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
         }
 
+        ret = copy_vpmu(d_vcpu, cd_vcpu);
+        if ( ret )
+            return ret;
+
         hvm_vmtrace_reset(cd_vcpu);
 
         copy_vcpu_nonreg_state(d_vcpu, cd_vcpu);
-- 
2.34.1


