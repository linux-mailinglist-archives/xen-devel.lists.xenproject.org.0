Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6D8D814F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734878.1140999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5vv-0001w1-6X; Mon, 03 Jun 2024 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734878.1140999; Mon, 03 Jun 2024 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5vv-0001ts-3r; Mon, 03 Jun 2024 11:32:59 +0000
Received: by outflank-mailman (input) for mailman id 734878;
 Mon, 03 Jun 2024 11:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5vt-0001tR-Je
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:32:57 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e42810-219d-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:32:54 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 9F1E42A952;
 Mon,  3 Jun 2024 07:32:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 954432A951;
 Mon,  3 Jun 2024 07:32:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id C5AB22A950;
 Mon,  3 Jun 2024 07:32:51 -0400 (EDT)
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
X-Inumbo-ID: 03e42810-219d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qFt1GhHtKwmXz/WKqzqf/F4up
	h4obWVv/1gPxRugSAk=; b=eb/w/s2vBAl1xjuLGLhjiOsOKxouCwL4tCmyPuNr4
	s1tVy5bcyujmGfgxPFTy1dwn0MDaMpN+BwVG4rD+PXRwZB1oJU9AqHZ9qN9CpRq0
	sNwmfOpNyAp3UM4gOoNlXy7GX/cm1nhomnFHH+rwaG28E/bf732DDkGHyNDLJz6M
	bs=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 13/16] x86/vpmu: guard calls to vmx/svm functions
Date: Mon,  3 Jun 2024 14:32:49 +0300
Message-Id: <b7f68e09ccc54782410d65173e490f477364a5f0.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 03271692-219D-11EF-AFD9-6488940A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

If VMX/SVM disabled in the build, we may still want to have vPMU drivers =
for
PV guests. Yet in such case before using VMX/SVM features and functions w=
e have
to explicitly check if they're available in the build. For this puspose
(and also not to complicate conditionals) two helpers introduced --
is_{vmx,svm}_vcpu(v) that check both HVM & VMX/SVM conditions at the same=
 time,
and they replace is_hvm_vcpu(v) macro where needed.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - introduced macro is_{vmx,svm}_vcpu(v)
 - changed description
 - reordered patch, do not modify conditionals w/ cpu_has_vmx_msr_bitmap =
check
---
 xen/arch/x86/cpu/vpmu_amd.c   |  9 +++++----
 xen/arch/x86/cpu/vpmu_intel.c | 16 +++++++++-------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 97e6315bd9..217501ecd3 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -27,6 +27,7 @@
 #define is_pmu_enabled(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_EN_SHIFT)=
)
 #define set_guest_mode(msr) ((msr) |=3D (1ULL << MSR_F10H_EVNTSEL_GO_SHI=
FT))
 #define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH =
- 1))))
+#define is_svm_vcpu(v) (using_svm && is_hvm_vcpu(v))
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
index cd414165df..f95a9b058d 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -54,6 +54,8 @@
 #define MSR_PMC_ALIAS_MASK       (~(MSR_IA32_PERFCTR0 ^ MSR_IA32_A_PERFC=
TR0))
 static bool __read_mostly full_width_write;
=20
+#define is_vmx_vcpu(v) ( using_vmx && is_hvm_vcpu(v) )
+
 /*
  * MSR_CORE_PERF_FIXED_CTR_CTRL contains the configuration of all fixed
  * counters. 4 bits for every counter.
@@ -269,7 +271,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
     if ( !is_hvm_vcpu(v) )
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_statu=
s);
     /* Save MSR to private context to make it fork-friendly */
-    else if ( mem_sharing_enabled(v->domain) )
+    else if ( is_vmx_vcpu(v) && mem_sharing_enabled(v->domain) )
         vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                            &core2_vpmu_cxt->global_ctrl);
 }
@@ -333,7 +335,7 @@ static inline void __core2_vpmu_load(struct vcpu *v)
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
     }
     /* Restore MSR from context when used with a fork */
-    else if ( mem_sharing_is_fork(v->domain) )
+    else if ( is_vmx_vcpu(v) && mem_sharing_is_fork(v->domain) )
         vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                             core2_vpmu_cxt->global_ctrl);
 }
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
--=20
2.25.1


