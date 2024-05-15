Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3379E8C637A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722061.1125889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AiU-0005h9-1t; Wed, 15 May 2024 09:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722061.1125889; Wed, 15 May 2024 09:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AiT-0005f7-Vb; Wed, 15 May 2024 09:14:29 +0000
Received: by outflank-mailman (input) for mailman id 722061;
 Wed, 15 May 2024 09:14:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AiT-0005f1-6K
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:14:29 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f77944-129b-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 11:14:27 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3162E35340;
 Wed, 15 May 2024 05:14:26 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 297753533F;
 Wed, 15 May 2024 05:14:26 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 24B493533E;
 Wed, 15 May 2024 05:14:25 -0400 (EDT)
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
X-Inumbo-ID: 86f77944-129b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=QBVPADKDiu5x/oX6jZVkmGsvt
	8awM0kSX8QUYnF6Lfs=; b=TLIfs3Y4jdHaaq+/b+rvFIdlA1tnRxUpDOwtLlTt4
	huIdPD5Y4LoAp6EaFithiBn9sPSqHe/KqGbqBV4JRA/7M3iUG4lX1WQ4ffjPJN8J
	fMEZ4ura1w72RPxHsPXilErs1SNsjTrkD7jOnM9r1YeLLlozDmkGucnKz80hgay2
	fc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 08/15] x86/vpmu: guard vmx/svm calls with cpu_has_{vmx,svm}
Date: Wed, 15 May 2024 12:14:22 +0300
Message-Id: <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 86266CC0-129B-11EF-BA87-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

If VMX/SVM disabled in the build, we may still want to have vPMU drivers =
for
PV guests. Yet some calls to vmx/svm-related routines needs to be guarded=
 then.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/vpmu_amd.c   |  8 ++++----
 xen/arch/x86/cpu/vpmu_intel.c | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index db2fa420e1..40b0c8932f 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -290,7 +290,7 @@ static int cf_check amd_vpmu_save(struct vcpu *v,  bo=
ol to_guest)
     context_save(v);
=20
     if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
-         is_msr_bitmap_on(vpmu) )
+         is_msr_bitmap_on(vpmu) && cpu_has_svm )
         amd_vpmu_unset_msr_bitmap(v);
=20
     if ( to_guest )
@@ -363,7 +363,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int ms=
r, uint64_t msr_content)
             return 0;
         vpmu_set(vpmu, VPMU_RUNNING);
=20
-        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
              amd_vpmu_set_msr_bitmap(v);
     }
=20
@@ -372,7 +372,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int ms=
r, uint64_t msr_content)
         (is_pmu_enabled(msr_content) =3D=3D 0) && vpmu_is_set(vpmu, VPMU=
_RUNNING) )
     {
         vpmu_reset(vpmu, VPMU_RUNNING);
-        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
              amd_vpmu_unset_msr_bitmap(v);
         release_pmu_ownership(PMU_OWNER_HVM);
     }
@@ -415,7 +415,7 @@ static void cf_check amd_vpmu_destroy(struct vcpu *v)
 {
     struct vpmu_struct *vpmu =3D vcpu_vpmu(v);
=20
-    if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
+    if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
         amd_vpmu_unset_msr_bitmap(v);
=20
     xfree(vpmu->context);
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.=
c
index cd414165df..10c34a5691 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -269,7 +269,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
     if ( !is_hvm_vcpu(v) )
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_statu=
s);
     /* Save MSR to private context to make it fork-friendly */
-    else if ( mem_sharing_enabled(v->domain) )
+    else if ( mem_sharing_enabled(v->domain) && cpu_has_vmx )
         vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                            &core2_vpmu_cxt->global_ctrl);
 }
@@ -288,7 +288,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, b=
ool to_guest)
=20
     /* Unset PMU MSR bitmap to trap lazy load. */
     if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
-         cpu_has_vmx_msr_bitmap )
+         cpu_has_vmx && cpu_has_vmx_msr_bitmap )
         core2_vpmu_unset_msr_bitmap(v);
=20
     if ( to_guest )
@@ -333,7 +333,7 @@ static inline void __core2_vpmu_load(struct vcpu *v)
         wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
     }
     /* Restore MSR from context when used with a fork */
-    else if ( mem_sharing_is_fork(v->domain) )
+    else if ( mem_sharing_is_fork(v->domain) && cpu_has_vmx )
         vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                             core2_vpmu_cxt->global_ctrl);
 }
@@ -442,7 +442,7 @@ static int cf_check core2_vpmu_alloc_resource(struct =
vcpu *v)
     if ( !acquire_pmu_ownership(PMU_OWNER_HVM) )
         return 0;
=20
-    if ( is_hvm_vcpu(v) )
+    if ( is_hvm_vcpu(v) && cpu_has_vmx )
     {
         if ( vmx_add_host_load_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, 0) )
             goto out_err;
@@ -513,7 +513,7 @@ static int core2_vpmu_msr_common_check(u32 msr_index,=
 int *type, int *index)
         __core2_vpmu_load(current);
         vpmu_set(vpmu, VPMU_CONTEXT_LOADED);
=20
-        if ( is_hvm_vcpu(current) && cpu_has_vmx_msr_bitmap )
+        if ( is_hvm_vcpu(current) && cpu_has_vmx && cpu_has_vmx_msr_bitm=
ap )
             core2_vpmu_set_msr_bitmap(current);
     }
     return 1;
@@ -584,7 +584,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
         if ( msr_content & fixed_ctrl_mask )
             return -EINVAL;
=20
-        if ( is_hvm_vcpu(v) )
+        if ( is_hvm_vcpu(v) && cpu_has_vmx )
             vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                                &core2_vpmu_cxt->global_ctrl);
         else
@@ -653,7 +653,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
             if ( blocked )
                 return -EINVAL;
=20
-            if ( is_hvm_vcpu(v) )
+            if ( is_hvm_vcpu(v) && cpu_has_vmx)
                 vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                                    &core2_vpmu_cxt->global_ctrl);
             else
@@ -672,7 +672,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int =
msr, uint64_t msr_content)
         wrmsrl(msr, msr_content);
     else
     {
-        if ( is_hvm_vcpu(v) )
+        if ( is_hvm_vcpu(v) && cpu_has_vmx )
             vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_conten=
t);
         else
             wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, msr_content);
@@ -706,7 +706,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int =
msr, uint64_t *msr_content)
             *msr_content =3D core2_vpmu_cxt->global_status;
             break;
         case MSR_CORE_PERF_GLOBAL_CTRL:
-            if ( is_hvm_vcpu(v) )
+            if ( is_hvm_vcpu(v) && cpu_has_vmx )
                 vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_con=
tent);
             else
                 rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, *msr_content);
@@ -808,7 +808,7 @@ static void cf_check core2_vpmu_destroy(struct vcpu *=
v)
     vpmu->context =3D NULL;
     xfree(vpmu->priv_context);
     vpmu->priv_context =3D NULL;
-    if ( is_hvm_vcpu(v) && cpu_has_vmx_msr_bitmap )
+    if ( is_hvm_vcpu(v) && cpu_has_vmx && cpu_has_vmx_msr_bitmap )
         core2_vpmu_unset_msr_bitmap(v);
     release_pmu_ownership(PMU_OWNER_HVM);
     vpmu_clear(vpmu);
--=20
2.25.1


