Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98457BE0D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372186.604069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEjb-0007N5-FA; Wed, 20 Jul 2022 18:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372186.604069; Wed, 20 Jul 2022 18:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEjb-0007KK-Bc; Wed, 20 Jul 2022 18:47:47 +0000
Received: by outflank-mailman (input) for mailman id 372186;
 Wed, 20 Jul 2022 18:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0Bt=XZ=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1oEEjZ-0007HU-M1
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:47:45 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de7acfb-085c-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 20:47:41 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 11:47:38 -0700
Received: from tjallen-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.77.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 11:47:37 -0700
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
X-Inumbo-ID: 6de7acfb-085c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658342861; x=1689878861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HvuiVSC6L+zZtd0km8X9OA/UYHsNkzJuQJiqCKLQ7sg=;
  b=hBsRaO9c8zY1K9euqpU1hZfmn3qbmbLZAJzKR4yjRpiFYO/5Wpw7Jd5e
   2BYNZEeTLN/8fRNkq65chl99H1M0o84Kqb4WsHwmwxrOqtiOZf0nhfiLb
   eLK3M7jz/DwmujLFAsA4wPDGFkyxWJVAw8o7f9DKoU1N4bKX0El/G/Jos
   LJQeL8XQWaWB9rJVpMWBHZukyS2VXbw2+dgR1gOhBUkQkdlJ3iB5l/c2o
   ife6c4/Lbu8c8Z8PFKT7BjO8JhLaCwYbNaucWiJBI+iCTQCww6GARzp4/
   AxFFjdBF9f2/jjmMhBSSb+HjbqVX5bWh4GsfqLzjFjA/H0SJ3f2j9RnSn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266635037"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="266635037"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="656393886"
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
Subject: [PATCH v2] x86/mem_sharing: support forks with active vPMU state
Date: Wed, 20 Jul 2022 14:47:29 -0400
Message-Id: <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
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
v2: make some things conditional on CONFIG_MEM_SHARING
    add stub function on AMD to vpmu_ops to simplify allocate context calls
---
 xen/arch/x86/cpu/vpmu.c         | 14 ++++++++++-
 xen/arch/x86/cpu/vpmu_amd.c     | 12 +++++++++
 xen/arch/x86/cpu/vpmu_intel.c   | 32 ++++++++++++++++++++----
 xen/arch/x86/include/asm/vpmu.h | 17 +++++++++++++
 xen/arch/x86/mm/mem_sharing.c   | 44 +++++++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index d2c03a1104..cacc24a30f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -336,7 +336,19 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
 #endif
 }
 
-static void cf_check vpmu_save_force(void *arg)
+#ifdef CONFIG_MEM_SHARING
+int vpmu_allocate_context(struct vcpu *v)
+{
+    struct vpmu_struct *vpmu = vcpu_vpmu(v);
+
+    if ( vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
+        return 0;
+
+    return alternative_call(vpmu_ops.allocate_context, v) ? 0 : -ENOMEM;
+}
+#endif
+
+void cf_check vpmu_save_force(void *arg)
 {
     struct vcpu *v = arg;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 9bacc02ec1..4c76e24551 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -518,6 +518,14 @@ static int cf_check svm_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
+#ifdef CONFIG_MEM_SHARING
+static int cf_check amd_allocate_context(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+#endif
+
 static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
     .initialise = svm_vpmu_initialise,
     .do_wrmsr = amd_vpmu_do_wrmsr,
@@ -527,6 +535,10 @@ static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
     .arch_vpmu_save = amd_vpmu_save,
     .arch_vpmu_load = amd_vpmu_load,
     .arch_vpmu_dump = amd_vpmu_dump,
+
+#ifdef CONFIG_MEM_SHARING
+    .allocate_context = amd_allocate_context
+#endif
 };
 
 static const struct arch_vpmu_ops *__init common_init(void)
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 8612f46973..01d4296485 100644
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
@@ -443,7 +454,7 @@ static int cf_check core2_vpmu_load(struct vcpu *v, bool from_guest)
     return 0;
 }
 
-static int core2_vpmu_alloc_resource(struct vcpu *v)
+static int cf_check core2_vpmu_alloc_resource(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     struct xen_pmu_intel_ctxt *core2_vpmu_cxt = NULL;
@@ -461,11 +472,18 @@ static int core2_vpmu_alloc_resource(struct vcpu *v)
             goto out_err;
     }
 
-    core2_vpmu_cxt = xzalloc_flex_struct(struct xen_pmu_intel_ctxt, regs,
-                                         fixed_pmc_cnt + arch_pmc_cnt *
-                                         (sizeof(struct xen_pmu_cntr_pair) /
-                                          sizeof(*core2_vpmu_cxt->regs)));
+    vpmu->priv_context_size = sizeof(uint64_t);
+    vpmu->context_size = sizeof(struct xen_pmu_intel_ctxt) +
+                         fixed_pmc_cnt * sizeof(uint64_t) +
+                         arch_pmc_cnt * sizeof(struct xen_pmu_cntr_pair);
+    /* Calculate and add the padding for alignment */
+    vpmu->context_size += vpmu->context_size %
+                          sizeof(struct xen_pmu_intel_ctxt);
+
+    core2_vpmu_cxt = _xzalloc(vpmu->context_size,
+                              sizeof(struct xen_pmu_intel_ctxt));
     p = xzalloc(uint64_t);
+
     if ( !core2_vpmu_cxt || !p )
         goto out_err;
 
@@ -889,6 +907,10 @@ static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
     .arch_vpmu_save = core2_vpmu_save,
     .arch_vpmu_load = core2_vpmu_load,
     .arch_vpmu_dump = core2_vpmu_dump,
+
+#ifdef CONFIG_MEM_SHARING
+    .allocate_context = core2_vpmu_alloc_resource
+#endif
 };
 
 const struct arch_vpmu_ops *__init core2_vpmu_init(void)
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index e5709bd44a..8a3ae11562 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -47,6 +47,10 @@ struct arch_vpmu_ops {
     int (*arch_vpmu_save)(struct vcpu *v, bool_t to_guest);
     int (*arch_vpmu_load)(struct vcpu *v, bool_t from_guest);
     void (*arch_vpmu_dump)(const struct vcpu *);
+
+#ifdef CONFIG_MEM_SHARING
+    int (*allocate_context)(struct vcpu *v);
+#endif
 };
 
 const struct arch_vpmu_ops *core2_vpmu_init(void);
@@ -59,6 +63,8 @@ struct vpmu_struct {
     u32 hw_lapic_lvtpc;
     void *context;      /* May be shared with PV guest */
     void *priv_context; /* hypervisor-only */
+    size_t context_size;
+    size_t priv_context_size;
     struct xen_pmu_data *xenpmu_data;
     spinlock_t vpmu_lock;
 };
@@ -108,6 +114,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs);
 void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);
+void vpmu_save_force(void *arg);
 int vpmu_load(struct vcpu *v, bool_t from_guest);
 void vpmu_dump(struct vcpu *v);
 
@@ -136,5 +143,15 @@ static inline void vpmu_switch_to(struct vcpu *next)
         vpmu_load(next, 0);
 }
 
+#ifdef CONFIG_MEM_SHARING
+int vpmu_allocate_context(struct vcpu *v);
+#else
+static inline int vpmu_allocate_context(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+#endif
+
 #endif /* __ASM_X86_HVM_VPMU_H_*/
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8f9d9ed9a9..f851b20938 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1653,6 +1653,46 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
+{
+    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
+    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);
+
+    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
+        return 0;
+    if ( vpmu_allocate_context(cd_vcpu) )
+        return -ENOMEM;
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
@@ -1702,6 +1742,10 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
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


