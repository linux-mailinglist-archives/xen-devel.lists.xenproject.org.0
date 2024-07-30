Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FA940F85
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767525.1178195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkCO-00006V-HE; Tue, 30 Jul 2024 10:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767525.1178195; Tue, 30 Jul 2024 10:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkCO-00004t-DZ; Tue, 30 Jul 2024 10:35:20 +0000
Received: by outflank-mailman (input) for mailman id 767525;
 Tue, 30 Jul 2024 10:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYkCN-0008WT-EE
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:35:19 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 699d59dc-4e5f-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 12:35:18 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id AEB7E3EF9A;
 Tue, 30 Jul 2024 06:35:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id A72C93EF99;
 Tue, 30 Jul 2024 06:35:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 4C14C3EF98;
 Tue, 30 Jul 2024 06:35:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 699d59dc-4e5f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=ZWslkpob5/V135B4z/OMGz0wX
	maU/UJuAqh6Fq+RDfA=; b=XOp0rSK/zbpFTz0gM5wxM1MKCs75QVNnw8ssI6Xju
	okdVvjsIjTpS5shTxmaYiOwdFfhRb7oR5uf6D40D0a476aBDo5Z/chbhQsftjoNq
	JcwipDge7w72QFTHK/MugtEUoBFpbeadF/Y1coPlvMxzZPkZP/Si77FMipfg8hNC
	1I=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v5 10/13] x86/vpmu: guard calls to vmx/svm functions
Date: Tue, 30 Jul 2024 13:35:09 +0300
Message-Id: <fda81012adec8c4993acd83076f1a46f2d71d668.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 66ADABE2-4E5F-11EF-ABA6-9625FCCAB05B-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

If VMX/SVM disabled in the build, we may still want to have vPMU drivers =
for
PV guests. Yet in such case before using VMX/SVM features and functions w=
e have
to explicitly check if they're available in the build. For this purpose
(and also not to complicate conditionals) two helpers introduced --
is_{vmx,svm}_vcpu(v) that check both HVM & VMX/SVM conditions at the same=
 time,
and they replace is_hvm_vcpu(v) macro in Intel/AMD PMU drivers.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
- change kconfig option name SVM/VMX -> AMD_SVM/INTEL_VMX
 - replace is_hvm_vcpu() with is_{svm,vmx}_vcpu()
changes in v4:
 - use IS_ENABLED(CONFIG_{VMX,SVM}) instead of using_{vmx,svm}
 - fix typo
changes in v3:
 - introduced macro is_{vmx,svm}_vcpu(v)
 - changed description
 - reordered patch, do not modify conditionals w/ cpu_has_vmx_msr_bitmap =
check
---
 xen/arch/x86/cpu/vpmu_amd.c   | 11 ++++++-----
 xen/arch/x86/cpu/vpmu_intel.c | 32 +++++++++++++++++---------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 97e6315bd9..a082450e92 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -27,6 +27,7 @@
 #define is_pmu_enabled(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_EN_SHIFT)=
)
 #define set_guest_mode(msr) ((msr) |=3D (1ULL << MSR_F10H_EVNTSEL_GO_SHI=
FT))
 #define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH =
- 1))))
+#define is_svm_vcpu(v) (IS_ENABLED(CONFIG_AMD_SVM) && is_hvm_vcpu(v))
=20
 static unsigned int __read_mostly num_counters;
 static const u32 __read_mostly *counters;
@@ -289,7 +290,7 @@ static int cf_check amd_vpmu_save(struct vcpu *v,  bo=
ol to_guest)
=20
     context_save(v);
=20
-    if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
+    if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_svm_vcpu(v) &&
          is_msr_bitmap_on(vpmu) )
         amd_vpmu_unset_msr_bitmap(v);
=20
@@ -349,7 +350,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int ms=
r, uint64_t msr_content)
         return -EINVAL;
=20
     /* For all counters, enable guest only mode for HVM guest */
-    if ( is_hvm_vcpu(v) && (type =3D=3D MSR_TYPE_CTRL) &&
+    if ( is_svm_vcpu(v) && (type =3D=3D MSR_TYPE_CTRL) &&
          !is_guest_mode(msr_content) )
     {
         set_guest_mode(msr_content);
@@ -363,7 +364,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int ms=
r, uint64_t msr_content)
             return 0;
         vpmu_set(vpmu, VPMU_RUNNING);
=20
-        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+        if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
              amd_vpmu_set_msr_bitmap(v);
     }
=20
@@ -372,7 +373,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int ms=
r, uint64_t msr_content)
         (is_pmu_enabled(msr_content) =3D=3D 0) && vpmu_is_set(vpmu, VPMU=
_RUNNING) )
     {
         vpmu_reset(vpmu, VPMU_RUNNING);
-        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+        if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
              amd_vpmu_unset_msr_bitmap(v);
         release_pmu_ownership(PMU_OWNER_HVM);
     }
@@ -415,7 +416,7 @@ static void cf_check amd_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu =3D vcpu_vpmu(v);
=20
-    if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+    if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
         amd_vpmu_unset_msr_bitmap(v);
=20
     xfree(vpmu->context);
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.=
c
index cd414165df..085495ab5f 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -54,6 +54,8 @@
 #define MSR_PMC_ALIAS_MASK       (~(MSR_IA32_PERFCTR0 ^ MSR_IA32_A_PERFC=
TR0))
 static bool __read_mostly full_width_write;
=20
+#define is_vmx_vcpu(v) (IS_ENABLED(CONFIG_INTEL_VMX) && is_hvm_vcpu(v))
+
 /*
  * MSR_CORE_PERF_FIXED_CTR_CTRL contains the configuration of all fixed
  * counters. 4 bits for every counter.
@@ -266,10 +268,10 @@ static inline void __core2_vpmu_save(struct vcpu *v=
)
         rdmsrl(MSR_P6_EVNTSEL(i), xen_pmu_cntr_pair[i].control);
     }
=20
-    if ( !is_hvm_vcpu(v) )
+    if ( !is_vmx_vcpu(v) )
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_statu=
s);
     /* Save MSR to private context to make it fork-friendly */
-    else if ( mem_sharing_enabled(v->domain) )
+    else if ( is_vmx_vcpu(v) && mem_sharing_enabled(v->domain) )
         vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                            &core2_vpmu_cxt->global_ctrl);
 }
@@ -278,7 +280,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, b=
ool to_guest)
 {
     struct vpmu_struct *vpmu =3D vcpu_vpmu(v);
=20
-    if ( !is_hvm_vcpu(v) )
+    if ( !is_vmx_vcpu(v) )
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, 0);
=20
     if ( !vpmu_are_all_set(vpmu, VPMU_CONTEXT_SAVE | VPMU_CONTEXT_LOADED=
) )
@@ -287,7 +289,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, b=
ool to_guest)
     __core2_vpmu_save(v);
=20
     /* Unset PMU MSR bitmap to trap lazy load. */
-    if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
+    if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_vmx_vcpu(v) &&
          cpu_has_vmx_msr_bitmap )
         core2_vpmu_unset_msr_bitmap(v);
=20
@@ -326,14 +328,14 @@ static inline void __core2_vpmu_load(struct vcpu *v=
)
     if ( vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_DS) )
         wrmsrl(MSR_IA32_DS_AREA, core2_vpmu_cxt->ds_area);
=20
-    if ( !is_hvm_vcpu(v) )
+    if ( !is_vmx_vcpu(v) )
     {
         wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, core2_vpmu_cxt->global_ovf=
_ctrl);
         core2_vpmu_cxt->global_ovf_ctrl =3D 0;
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
     }
     /* Restore MSR from context when used with a fork */
-    else if ( mem_sharing_is_fork(v->domain) )
+    else if ( is_vmx_vcpu(v) && mem_sharing_is_fork(v->domain) )
         vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                             core2_vpmu_cxt->global_ctrl);
 }
@@ -381,7 +383,7 @@ static int core2_vpmu_verify(struct vcpu *v)
     }
=20
     if ( vpmu_is_set(vpmu, VPMU_CPU_HAS_DS) &&
-         !(is_hvm_vcpu(v)
+         !(is_vmx_vcpu(v)
            ? is_canonical_address(core2_vpmu_cxt->ds_area)
            : __addr_ok(core2_vpmu_cxt->ds_area)) )
         return -EINVAL;
@@ -442,7 +444,7 @@ static int cf_check core2_vpmu_alloc_resource(struct =
vcpu *v)
     if ( !acquire_pmu_ownership(PMU_OWNER_HVM) )
         return 0;
=20
-    if ( is_hvm_vcpu(v) )
+    if ( is_vmx_vcpu(v) )
     {
         if ( vmx_add_host_load_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, 0) )
             goto out_err;
@@ -513,7 +515,7 @@ static int core2_vpmu_msr_common_check(u32 msr_index,=
 int *type, int *index)
         __core2_vpmu_load(current);
         vpmu_set(vpmu, VPMU_CONTEXT_LOADED);
=20
-        if ( is_hvm_vcpu(current) && cpu_has_vmx_msr_bitmap )
+        if ( is_vmx_vcpu(current) && cpu_has_vmx_msr_bitmap )
             core2_vpmu_set_msr_bitmap(current);
     }
     return 1;
@@ -562,7 +564,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
             return -EINVAL;
         if ( vpmu_is_set(vpmu, VPMU_CPU_HAS_DS) )
         {
-            if ( !(is_hvm_vcpu(v) ? is_canonical_address(msr_content)
+            if ( !(is_vmx_vcpu(v) ? is_canonical_address(msr_content)
                                   : __addr_ok(msr_content)) )
             {
                 gdprintk(XENLOG_WARNING,
@@ -584,7 +586,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
         if ( msr_content & fixed_ctrl_mask )
             return -EINVAL;
=20
-        if ( is_hvm_vcpu(v) )
+        if ( is_vmx_vcpu(v) )
             vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                                &core2_vpmu_cxt->global_ctrl);
         else
@@ -653,7 +655,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
             if ( blocked )
                 return -EINVAL;
=20
-            if ( is_hvm_vcpu(v) )
+            if ( is_vmx_vcpu(v) )
                 vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                                    &core2_vpmu_cxt->global_ctrl);
             else
@@ -672,7 +674,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
         wrmsrl(msr, msr_content);
     else
     {
-        if ( is_hvm_vcpu(v) )
+        if ( is_vmx_vcpu(v) )
             vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_conten=
t);
         else
             wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, msr_content);
@@ -706,7 +708,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int =
msr, uint64_t *msr_content)
             *msr_content =3D core2_vpmu_cxt->global_status;
             break;
         case MSR_CORE_PERF_GLOBAL_CTRL:
-            if ( is_hvm_vcpu(v) )
+            if ( is_vmx_vcpu(v) )
                 vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_con=
tent);
             else
                 rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, *msr_content);
@@ -808,7 +810,7 @@ static void cf_check core2_vpmu_destroy(struct vcpu *=
v)
     vpmu->context =3D NULL;
     xfree(vpmu->priv_context);
     vpmu->priv_context =3D NULL;
-    if ( is_hvm_vcpu(v) && cpu_has_vmx_msr_bitmap )
+    if ( is_vmx_vcpu(v) && cpu_has_vmx_msr_bitmap )
         core2_vpmu_unset_msr_bitmap(v);
     release_pmu_ownership(PMU_OWNER_HVM);
     vpmu_clear(vpmu);
--=20
2.25.1


