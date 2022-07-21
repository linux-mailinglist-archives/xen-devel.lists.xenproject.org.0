Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35457CDEB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 16:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372849.604848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXNf-0002Gf-7E; Thu, 21 Jul 2022 14:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372849.604848; Thu, 21 Jul 2022 14:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXNf-0002EX-4Z; Thu, 21 Jul 2022 14:42:23 +0000
Received: by outflank-mailman (input) for mailman id 372849;
 Thu, 21 Jul 2022 14:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNh/=X2=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1oEXNe-0002ER-5w
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 14:42:22 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d40f42-0903-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 16:42:18 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 07:42:16 -0700
Received: from amcguire-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.41.210])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 07:42:14 -0700
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
X-Inumbo-ID: 50d40f42-0903-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658414538; x=1689950538;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=upWoArWDMjRP7S0misRd4b8EMXo9ZmgrhAHS7PyA39Q=;
  b=mBAMuXiV5Li8v/plusqd3f8N8Ccibljx0ga0469Ar8og2wT3bxYpLEgQ
   hRn6B16+FptvULCCEGqrd2+1C2W3tzuCM3ZY7mj+wPmvYCebqpZNNPKJJ
   rx8eYXxV+hcky2QcSsmSI6Ikpsdalh0KXI4+Jy/Ea3B7Kpg2dgS2huix3
   P8onmJHFq/4UvZ8or9lI93O/5oU5UoiI4U8Av+crpFw00f30pIXU/x7dG
   AhqGe4cKi0sMqVTVNVzx1BC3U30FFg2kkaKXxNlcTSnPyPjo7fY1pyiUd
   WPfOzar3C9/JLVSgV9Rwx8/JJlKoy1t80ttS2ZiIf2EEPjPaQw/5nauaS
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="351055309"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="351055309"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="656773623"
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
Subject: [PATCH v3] xen/mem_sharing: support forks with active vPMU state
Date: Thu, 21 Jul 2022 10:42:05 -0400
Message-Id: <249a26c7c469ee913af5c3b367917b2e4bd4d86e.1658409173.git.tamas.lengyel@intel.com>
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
v3: address review comments
v2: make some things conditional on CONFIG_MEM_SHARING
    add stub function on AMD to vpmu_ops to simplify allocate context calls
---
 xen/arch/x86/cpu/vpmu.c         | 14 +++++++++-
 xen/arch/x86/cpu/vpmu_amd.c     | 12 +++++++++
 xen/arch/x86/cpu/vpmu_intel.c   | 32 ++++++++++++++++++----
 xen/arch/x86/include/asm/vpmu.h | 17 ++++++++++++
 xen/arch/x86/mm/mem_sharing.c   | 47 +++++++++++++++++++++++++++++++++
 5 files changed, 116 insertions(+), 6 deletions(-)

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
index 9bacc02ec1..58794a16f0 100644
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
+    .allocate_context = amd_allocate_context,
+#endif
 };
 
 static const struct arch_vpmu_ops *__init common_init(void)
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 8612f46973..b91d818be0 100644
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
+    .allocate_context = core2_vpmu_alloc_resource,
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
index 8f9d9ed9a9..649d93dc54 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1653,6 +1653,49 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
+{
+    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
+    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);
+    int ret;
+
+    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
+        return 0;
+    if ( (ret = vpmu_allocate_context(cd_vcpu)) )
+        return ret;
+
+    /*
+     * The VPMU subsystem only saves the context when the CPU does a context
+     * switch. Otherwise, the relevant MSRs are not saved on vmexit.
+     * We force a save here in case the parent CPU context is still loaded.
+     */
+    if ( vpmu_is_set(d_vpmu, VPMU_CONTEXT_LOADED) )
+    {
+        unsigned int pcpu = smp_processor_id();
+
+        if ( d_vpmu->last_pcpu != pcpu )
+        {
+            on_selected_cpus(cpumask_of(d_vpmu->last_pcpu),
+                             vpmu_save_force, d_vcpu, 1);
+            vpmu_reset(d_vpmu, VPMU_CONTEXT_LOADED);
+        }
+        else
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
+    memcpy(cd_vpmu->priv_context, d_vpmu->priv_context,
+           d_vpmu->priv_context_size);
+
+    return 0;
+}
+
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
@@ -1702,6 +1745,10 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
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


