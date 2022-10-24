Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414D60B335
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429274.680203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0nS-0006ov-Ew; Mon, 24 Oct 2022 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429274.680203; Mon, 24 Oct 2022 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0nS-0006mJ-BV; Mon, 24 Oct 2022 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 429274;
 Mon, 24 Oct 2022 16:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GI/c=2Z=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1on0nR-0006Ma-2b
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:59:29 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35afac73-53bd-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 18:59:25 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:59:10 -0700
Received: from mprakash-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.103.22])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:59:08 -0700
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
X-Inumbo-ID: 35afac73-53bd-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666630765; x=1698166765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cIgjQoZ7vxuC/i2lSZmYDXohIiSi9UuPb1px2tV3KLg=;
  b=Jjnj74sm6jYTpmD/YCNVoV3AuEC2YIxB0Vv375j/iANnimMOMQu90Q0M
   iqLQ6BiVrD3hGwHoQ3TqIsCBK++nRctn33uNQ86EUGzyMK2Fva0+k8DSe
   tdYWi1zEm/Ns629cuNa27Skc2Ux8FWTj9gX/FJAWbpZH+PukbS3XWL6wU
   8Cr7yOt3ejODgPamf6VUh1X7n8Ejf+q+oDMWgszpnzN8wCC6W37Ifyfjj
   EpPd7Z80apOeGHfMAZtE4j0Z78HvEHgUWd8ON1VOpIAxF+iDHpKfPm4YR
   H8fWQXDTTJ6EGLtJBYs7gclmQReeFzzTNFCILrR7jmWcbDL1JqOJ/5Z1P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="309160171"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="309160171"
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736483876"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="736483876"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Date: Mon, 24 Oct 2022 12:58:54 -0400
Message-Id: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a handful
of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by an
external privileged tool is necessary, thus we extend the domctl to allow for
querying for any guest MSRs. To remain compatible with the existing setup if
no specific MSR is requested via the domctl the default list is returned.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/include/xenctrl.h              |  4 +++
 tools/libs/ctrl/xc_domain.c          | 35 ++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_save_x86_pv.c |  2 ++
 xen/arch/x86/cpu/vpmu.c              | 10 ++++++++
 xen/arch/x86/cpu/vpmu_amd.c          |  7 ++++++
 xen/arch/x86/cpu/vpmu_intel.c        | 37 ++++++++++++++++++++++++++++
 xen/arch/x86/domctl.c                | 35 +++++++++++++++++---------
 xen/arch/x86/include/asm/vpmu.h      |  2 ++
 8 files changed, 120 insertions(+), 12 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0c8b4c3aa7..04244213bf 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -872,6 +872,10 @@ int xc_vcpu_getinfo(xc_interface *xch,
                     uint32_t vcpu,
                     xc_vcpuinfo_t *info);
 
+typedef struct xen_domctl_vcpu_msr xc_vcpumsr_t;
+int xc_vcpu_get_msrs(xc_interface *xch, uint32_t domid, uint32_t vcpu,
+                     uint32_t count, xc_vcpumsr_t *msrs);
+
 long long xc_domain_get_cpu_usage(xc_interface *xch,
                                   uint32_t domid,
                                   int vcpu);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 14c0420c35..d3a7e1fea6 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2201,6 +2201,41 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
 }
+
+int xc_vcpu_get_msrs(xc_interface *xch, uint32_t domid, uint32_t vcpu,
+                     uint32_t count, xc_vcpumsr_t *msrs)
+{
+    int rc;
+    DECLARE_DOMCTL;
+    domctl.cmd = XEN_DOMCTL_get_vcpu_msrs;
+    domctl.domain = domid;
+    domctl.u.vcpu_msrs.vcpu = vcpu;
+    domctl.u.vcpu_msrs.msr_count = count;
+
+    if ( !msrs )
+    {
+        if ( (rc = xc_domctl(xch, &domctl)) < 0 )
+            return rc;
+
+        return domctl.u.vcpu_msrs.msr_count;
+    }
+    else
+    {
+        DECLARE_HYPERCALL_BOUNCE(msrs, count * sizeof(xc_vcpumsr_t), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+
+        if ( xc_hypercall_bounce_pre(xch, msrs) )
+            return -1;
+
+        set_xen_guest_handle(domctl.u.vcpu_msrs.msrs, msrs);
+
+        rc = do_domctl(xch, &domctl);
+
+        xc_hypercall_bounce_post(xch, msrs);
+
+        return rc;
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..7ac313bf3f 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -719,6 +719,8 @@ static int write_one_vcpu_msrs(struct xc_sr_context *ctx, uint32_t id)
         goto err;
     }
 
+    memset(buffer, 0, buffersz);
+
     set_xen_guest_handle(domctl.u.vcpu_msrs.msrs, buffer);
     if ( xc_domctl(xch, &domctl) < 0 )
     {
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 64cdbfc48c..438dfbe196 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -651,6 +651,16 @@ void vpmu_dump(struct vcpu *v)
         alternative_vcall(vpmu_ops.arch_vpmu_dump, v);
 }
 
+int vpmu_get_msr(struct vcpu *v, unsigned int msr, uint64_t *val)
+{
+    ASSERT(v != current);
+
+    if ( !vpmu_is_set(vcpu_vpmu(v), VPMU_CONTEXT_ALLOCATED) )
+        return -EOPNOTSUPP;
+
+    return alternative_call(vpmu_ops.get_msr, v, msr, val);
+}
+
 long do_xenpmu_op(
     unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
 {
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 58794a16f0..75bd68e541 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -518,6 +518,12 @@ static int cf_check svm_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
+static int cf_check amd_get_msr(struct vcpu *v, unsigned int msr, uint64_t *val)
+{
+    /* TODO in case an external tool needs access to these MSRs */
+    return -ENOSYS;
+}
+
 #ifdef CONFIG_MEM_SHARING
 static int cf_check amd_allocate_context(struct vcpu *v)
 {
@@ -535,6 +541,7 @@ static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
     .arch_vpmu_save = amd_vpmu_save,
     .arch_vpmu_load = amd_vpmu_load,
     .arch_vpmu_dump = amd_vpmu_dump,
+    .get_msr = amd_get_msr,
 
 #ifdef CONFIG_MEM_SHARING
     .allocate_context = amd_allocate_context,
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index b91d818be0..b4b6ecfb15 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -898,6 +898,42 @@ static int cf_check vmx_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
+static int cf_check core2_vpmu_get_msr(struct vcpu *v, unsigned int msr,
+                                       uint64_t *val)
+{
+    int type, index, ret = 0;
+    struct vpmu_struct *vpmu = vcpu_vpmu(v);
+    struct xen_pmu_intel_ctxt *core2_vpmu_cxt = vpmu->context;
+    uint64_t *fixed_counters = vpmu_reg_pointer(core2_vpmu_cxt, fixed_counters);
+    struct xen_pmu_cntr_pair *xen_pmu_cntr_pair =
+        vpmu_reg_pointer(core2_vpmu_cxt, arch_counters);
+
+    if ( !is_core2_vpmu_msr(msr, &type, &index) )
+        return -EINVAL;
+
+    vcpu_pause(v);
+
+    if ( msr == MSR_CORE_PERF_GLOBAL_OVF_CTRL )
+        *val = core2_vpmu_cxt->global_ovf_ctrl;
+    else if ( msr == MSR_CORE_PERF_GLOBAL_STATUS )
+        *val = core2_vpmu_cxt->global_status;
+    else if ( msr == MSR_CORE_PERF_GLOBAL_CTRL )
+        *val = core2_vpmu_cxt->global_ctrl;
+    else if ( msr >= MSR_CORE_PERF_FIXED_CTR0 &&
+              msr < MSR_CORE_PERF_FIXED_CTR0 + fixed_pmc_cnt )
+        *val = fixed_counters[msr - MSR_CORE_PERF_FIXED_CTR0];
+    else if ( msr >= MSR_P6_PERFCTR(0) && msr < MSR_P6_PERFCTR(arch_pmc_cnt) )
+        *val = xen_pmu_cntr_pair[msr - MSR_P6_PERFCTR(0)].counter;
+    else if ( msr >= MSR_P6_EVNTSEL(0) && msr < MSR_P6_EVNTSEL(arch_pmc_cnt) )
+        *val = xen_pmu_cntr_pair[msr - MSR_P6_EVNTSEL(0)].control;
+    else
+        ret = -EINVAL;
+
+    vcpu_unpause(v);
+
+    return ret;
+}
+
 static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
     .initialise = vmx_vpmu_initialise,
     .do_wrmsr = core2_vpmu_do_wrmsr,
@@ -907,6 +943,7 @@ static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
     .arch_vpmu_save = core2_vpmu_save,
     .arch_vpmu_load = core2_vpmu_load,
     .arch_vpmu_dump = core2_vpmu_dump,
+    .get_msr = core2_vpmu_get_msr,
 
 #ifdef CONFIG_MEM_SHARING
     .allocate_context = core2_vpmu_alloc_resource,
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index e9bfbc57a7..c481aa8575 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1104,8 +1104,7 @@ long arch_do_domctl(
             break;
 
         ret = -EINVAL;
-        if ( (v == curr) || /* no vcpu_pause() */
-             !is_pv_domain(d) )
+        if ( v == curr )
             break;
 
         /* Count maximum number of optional msrs. */
@@ -1127,36 +1126,48 @@ long arch_do_domctl(
 
                 vcpu_pause(v);
 
-                for ( j = 0; j < ARRAY_SIZE(msrs_to_send); ++j )
+                for ( j = 0; j < ARRAY_SIZE(msrs_to_send) && i < vmsrs->msr_count; ++j )
                 {
                     uint64_t val;
-                    int rc = guest_rdmsr(v, msrs_to_send[j], &val);
+                    int rc;
+
+                    if ( copy_from_guest_offset(&msr, vmsrs->msrs, i, 1) )
+                    {
+                        ret = -EFAULT;
+                        break;
+                    }
+
+                    msr.index = msr.index ?: msrs_to_send[j];
+
+                    rc = guest_rdmsr(v, msr.index, &val);
 
                     /*
                      * It is the programmers responsibility to ensure that
-                     * msrs_to_send[] contain generally-read/write MSRs.
+                     * the msr requested contain generally-read/write MSRs.
                      * X86EMUL_EXCEPTION here implies a missing feature, and
                      * that the guest doesn't have access to the MSR.
                      */
                     if ( rc == X86EMUL_EXCEPTION )
                         continue;
+                    if ( rc == X86EMUL_UNHANDLEABLE )
+                        ret = vpmu_get_msr(v, msr.index, &val);
+                    else
+                        ret = (rc == X86EMUL_OKAY) ? 0 : -ENXIO;
 
-                    if ( rc != X86EMUL_OKAY )
+                    if ( ret )
                     {
                         ASSERT_UNREACHABLE();
-                        ret = -ENXIO;
                         break;
                     }
 
                     if ( !val )
                         continue; /* Skip empty MSRs. */
 
-                    if ( i < vmsrs->msr_count && !ret )
+                    msr.value = val;
+                    if ( copy_to_guest_offset(vmsrs->msrs, i, &msr, 1) )
                     {
-                        msr.index = msrs_to_send[j];
-                        msr.value = val;
-                        if ( copy_to_guest_offset(vmsrs->msrs, i, &msr, 1) )
-                            ret = -EFAULT;
+                        ret = -EFAULT;
+                        break;
                     }
                     ++i;
                 }
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 05e1fbfccf..2fcf570b25 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -47,6 +47,7 @@ struct arch_vpmu_ops {
     int (*arch_vpmu_save)(struct vcpu *v, bool_t to_guest);
     int (*arch_vpmu_load)(struct vcpu *v, bool_t from_guest);
     void (*arch_vpmu_dump)(const struct vcpu *);
+    int (*get_msr)(struct vcpu *v, unsigned int msr, uint64_t *val);
 
 #ifdef CONFIG_MEM_SHARING
     int (*allocate_context)(struct vcpu *v);
@@ -117,6 +118,7 @@ void vpmu_save(struct vcpu *v);
 void cf_check vpmu_save_force(void *arg);
 int vpmu_load(struct vcpu *v, bool_t from_guest);
 void vpmu_dump(struct vcpu *v);
+int vpmu_get_msr(struct vcpu *v, unsigned int msr, uint64_t *val);
 
 static inline int vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 {
-- 
2.34.1


