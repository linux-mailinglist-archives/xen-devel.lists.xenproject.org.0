Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99606FCB8D
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532378.828571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRK-0002gA-7e; Tue, 09 May 2023 16:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532378.828571; Tue, 09 May 2023 16:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRK-0002cd-4V; Tue, 09 May 2023 16:43:50 +0000
Received: by outflank-mailman (input) for mailman id 532378;
 Tue, 09 May 2023 16:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwQRI-0002Ky-DQ
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:43:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabb4d0a-ee88-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:43:46 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3064099f9b6so3915731f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:43:46 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002ffbf2213d4sm14754606wrt.75.2023.05.09.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:43:44 -0700 (PDT)
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
X-Inumbo-ID: aabb4d0a-ee88-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683650625; x=1686242625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16GgcLP2BBqsFeayUECe7ljf4/vLwO1azevfRpDiAnE=;
        b=HuBJiOT6QALlrn9nb56NQbzi6cla2ddOsWT7xW5nGmKpcyzIYNsdiPxKyWV9v1KN4B
         /uIHJ7Xy/LdlgRK3eynfeh8W3+AQGlV/DVg0JCRSqLnHxZqU4FpCzVgbw242PvnRAFrb
         KZv11Jspf0AuzoLRYVG11tRamYzXLmkAKH/E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650625; x=1686242625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16GgcLP2BBqsFeayUECe7ljf4/vLwO1azevfRpDiAnE=;
        b=Qe/kYIS/nk4zN18OEe5bPE3UVMbbzCbwoaeuyPGvzySAp3ncE6zy/6k2xNL1Kp9pNc
         Nx3ZcYLAKr6+0ne2bchZYI4JN4BIS4zgoCEwweD1Qz0VnMZT/rLBGrLGXVrzhOaUTF7P
         xDRK/eo4d1jaAujPuko+JE1jJo0ROxDqVlEUCCVBPRievF5Sr+ns6k3Q2/jExK7T6mmj
         87BNNRjVN1Xz+5LLUF8qzX19ldiXo5oBH43uuJOSibZAdf/g/FbTlhBbUDlYeDJIs7n6
         BqQ5fBlkAdrjMtJPSBSbB5s8at0AHvDND1iX12oNse57p3B/dyg0TvCHenGO8hCHz2Cr
         lXNA==
X-Gm-Message-State: AC+VfDwvdx8U8E18cBtw9bqGMkmX9WxVLoCW19jJVHwOLdPkrqgM2GVg
	WMtSKKlDhionSoW90SrKDSBHu3dMoQtX09Q4oK4=
X-Google-Smtp-Source: ACHHUZ7NMADEFOOpRrJnC2oe43bnCiHaWZNRSN6qIYJRojhJXSRulKGcG6OnzfawBJdlc/o7zsGVEg==
X-Received: by 2002:a5d:5701:0:b0:307:2ba7:c617 with SMTP id a1-20020a5d5701000000b003072ba7c617mr10532538wrv.52.1683650625641;
        Tue, 09 May 2023 09:43:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] x86: Add support for CpuidUserDis
Date: Tue,  9 May 2023 17:43:36 +0100
Message-Id: <20230509164336.12523-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because CpuIdUserDis is reported in CPUID itself, the extended leaf
containing that bit must be retrieved before calling c_early_init()

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
 * Style fixes
 * MSR index inlined in rdmsr/wrmsr
 * Swapped Intel's conditional guard so typically true condition goes first
 * Factored the vendor-specific non functional changes into another patch
---
 xen/arch/x86/cpu/amd.c         | 20 ++++++++++++++++-
 xen/arch/x86/cpu/common.c      | 40 +++++++++++++++++++++++-----------
 xen/arch/x86/cpu/intel.c       |  5 ++++-
 xen/arch/x86/include/asm/amd.h |  1 +
 4 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 899bae7a10..cc9c89fd19 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -279,8 +279,12 @@ static void __init noinline amd_init_levelling(void)
 	 * that can only be present when Xen is itself virtualized (because
 	 * it can be emulated)
 	 */
-	if (cpu_has_hypervisor && probe_cpuid_faulting())
+	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
+	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
+		expected_levelling_cap |= LCAP_faulting;
+		levelling_caps |=  LCAP_faulting;
 		return;
+	}
 
 	probe_masking_msrs();
 
@@ -371,6 +375,20 @@ static void __init noinline amd_init_levelling(void)
 		ctxt_switch_masking = amd_ctxt_switch_masking;
 }
 
+void amd_set_cpuid_user_dis(bool enable)
+{
+	const uint64_t bit = K8_HWCR_CPUID_USER_DIS;
+	uint64_t val;
+
+	rdmsrl(MSR_K8_HWCR, val);
+
+	if (!!(val & bit) == enable)
+		return;
+
+	val ^= bit;
+	wrmsrl(MSR_K8_HWCR, val);
+}
+
 /*
  * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
  * for each known erratum. Return 1 if erratum is found.
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 4bfaac4590..9bbb385db4 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -4,6 +4,7 @@
 #include <xen/param.h>
 #include <xen/smp.h>
 
+#include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
@@ -144,8 +145,6 @@ bool __init probe_cpuid_faulting(void)
 		return false;
 	}
 
-	expected_levelling_cap |= LCAP_faulting;
-	levelling_caps |=  LCAP_faulting;
 	setup_force_cpu_cap(X86_FEATURE_CPUID_FAULTING);
 
 	return true;
@@ -168,8 +167,10 @@ static void set_cpuid_faulting(bool enable)
 void ctxt_switch_levelling(const struct vcpu *next)
 {
 	const struct domain *nextd = next ? next->domain : NULL;
+	bool enable_cpuid_faulting;
 
-	if (cpu_has_cpuid_faulting) {
+	if (cpu_has_cpuid_faulting ||
+	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
 		/*
 		 * No need to alter the faulting setting if we are switching
 		 * to idle; it won't affect any code running in idle context.
@@ -190,12 +191,18 @@ void ctxt_switch_levelling(const struct vcpu *next)
 		 * an interim escape hatch in the form of
 		 * `dom0=no-cpuid-faulting` to restore the older behaviour.
 		 */
-		set_cpuid_faulting(nextd && (opt_dom0_cpuid_faulting ||
-					     !is_control_domain(nextd) ||
-					     !is_pv_domain(nextd)) &&
-				   (is_pv_domain(nextd) ||
-				    next->arch.msrs->
-				    misc_features_enables.cpuid_faulting));
+		enable_cpuid_faulting = nextd && (opt_dom0_cpuid_faulting ||
+		                                  !is_control_domain(nextd) ||
+		                                  !is_pv_domain(nextd)) &&
+		                        (is_pv_domain(nextd) ||
+		                         next->arch.msrs->
+		                         misc_features_enables.cpuid_faulting);
+
+		if (cpu_has_cpuid_faulting)
+			set_cpuid_faulting(enable_cpuid_faulting);
+		else
+			amd_set_cpuid_user_dis(enable_cpuid_faulting);
+
 		return;
 	}
 
@@ -404,6 +411,17 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
 	c->phys_proc_id = c->apicid;
 
+	eax = cpuid_eax(0x80000000);
+	if ((eax >> 16) == 0x8000)
+		c->extended_cpuid_level = eax;
+
+	/*
+	 * These AMD-defined flags are out of place, but we need
+	 * them early for the CPUID faulting probe code
+	 */
+	if (c->extended_cpuid_level >= 0x80000021)
+		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
+
 	if (this_cpu->c_early_init)
 		this_cpu->c_early_init(c);
 
@@ -420,10 +438,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
 		__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
 
-	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000)
-		c->extended_cpuid_level = eax;
-
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index a04414ba1d..bbe7b7d1ce 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -233,8 +233,11 @@ static void __init noinline intel_init_levelling(void)
 	 * MSRs may be emulated though, so we allow it in that case.
 	 */
 	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
-	    probe_cpuid_faulting())
+	    probe_cpuid_faulting()) {
+		expected_levelling_cap |= LCAP_faulting;
+		levelling_caps |=  LCAP_faulting;
 		return;
+	}
 
 	probe_masking_msrs();
 
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a975d3de26..09ee52dc1c 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -155,5 +155,6 @@ extern bool amd_legacy_ssbd;
 extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
+void amd_set_cpuid_user_dis(bool enable);
 
 #endif /* __AMD_H__ */
-- 
2.34.1


