Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EBC6F8842
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530596.826320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgI-00077G-48; Fri, 05 May 2023 17:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530596.826320; Fri, 05 May 2023 17:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgI-00073j-0s; Fri, 05 May 2023 17:57:22 +0000
Received: by outflank-mailman (input) for mailman id 530596;
 Fri, 05 May 2023 17:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1gM=A2=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1puzgF-0006ws-LN
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:57:19 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46190858-eb6e-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 19:57:17 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so14429995e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:57:17 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020adfe30c000000b00306423904d6sm3053844wrj.45.2023.05.05.10.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 10:57:15 -0700 (PDT)
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
X-Inumbo-ID: 46190858-eb6e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683309436; x=1685901436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubIK+XYgAIIZcyqAhGOfgJDl4JEExigDY8ufylt9qvw=;
        b=iUVAAHDp7zE3tBjYt2RmDBRUg2mKNMFd53nbCBsmyRuBT8fWhlFV7g8QWARjB8ygI2
         fxg29XQGaCSIq5vPpT61NLslfCNlWHG1Q7E7ijP3E62sfacQeSvj/Lnc2ncHdxFrUXSU
         CBqrGZcqBIQtYo6p8QFP051fkN/U9nmKodnyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309436; x=1685901436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubIK+XYgAIIZcyqAhGOfgJDl4JEExigDY8ufylt9qvw=;
        b=Q3a3nADK+czQJIQYO1kVngJ8+cs3bIyDet1zsveRPSuAsfFFUQ4KlkHcG3N0iPwhs1
         yYJ+Usd1v6f/RDpc2WfZat8wWUbyIATnvQNvWiQLSCqbjkqH8GrJi7ZiPIrt34oypskH
         /CJUudRzwR/F/h6LnxylnoCY7u/SA7md3imHHyoZ2P8NVA53LbZg6yWnAJQCcHdfdAt3
         cqjK+fPzkfk91uzhfeGHkSQbwWaSzbpsfRsv4c42gRhRndx1US1dATa0l8oSZpyh1rGD
         Za9/NT2xi9qznx9ADgB0CMwpZ6yCP2h+U2ja9GwoN4pTk2v15dRSyI5pe522ZEws93EH
         UIOQ==
X-Gm-Message-State: AC+VfDw0zTscQzc4gF5wEzVtk98dYm+QqzW//AQD++jwN06rZLICgt/n
	06GD2/6vTLYf1bs15+lB5nJatKSaG8kdI2Xxoc8=
X-Google-Smtp-Source: ACHHUZ6CrKzTndC7mGLtHexYNG/IMPc8wRB57ggtG2k3REK1pCr2UWWgO52VIUGy8rend9Fb/kIOwg==
X-Received: by 2002:a05:600c:257:b0:3f1:800f:cc61 with SMTP id 23-20020a05600c025700b003f1800fcc61mr1771921wmj.13.1683309436339;
        Fri, 05 May 2023 10:57:16 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86: Add support for CpuidUserDis
Date: Fri,  5 May 2023 18:57:04 +0100
Message-Id: <20230505175705.18098-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Includes a refactor to move vendor-specific probes to vendor-specific
files. Furthermore, because CpuIdUserDis is reported in Cpuid itself,
the extended leaf containing that bit must be retrieved before calling
c_early_init()

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpu/amd.c         | 29 ++++++++++++++++++-
 xen/arch/x86/cpu/common.c      | 51 ++++++++++++++++++----------------
 xen/arch/x86/cpu/intel.c       | 11 +++++++-
 xen/arch/x86/include/asm/amd.h |  1 +
 4 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index caafe44740..9269015edd 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -271,8 +271,20 @@ static void __init noinline amd_init_levelling(void)
 {
 	const struct cpuidmask *m = NULL;
 
-	if (probe_cpuid_faulting())
+	/*
+	 * If there's support for CpuidUserDis or CPUID faulting then
+	 * we can skip levelling because CPUID accesses are trapped anyway.
+	 *
+	 * CPUID faulting is an Intel feature analogous to CpuidUserDis, so
+	 * that can only be present when Xen is itself virtualized (because
+	 * it can be emulated)
+	 */
+	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
+	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
+		expected_levelling_cap |= LCAP_faulting;
+		levelling_caps |=  LCAP_faulting;
 		return;
+	}
 
 	probe_masking_msrs();
 
@@ -363,6 +375,21 @@ static void __init noinline amd_init_levelling(void)
 		ctxt_switch_masking = amd_ctxt_switch_masking;
 }
 
+void amd_set_cpuid_user_dis(bool enable)
+{
+	const uint64_t msr_addr = MSR_K8_HWCR;
+	const uint64_t bit = K8_HWCR_CPUID_USER_DIS;
+	uint64_t val;
+
+	rdmsrl(msr_addr, val);
+
+	if (!!(val & bit) == enable)
+		return;
+
+	val ^= bit;
+	wrmsrl(msr_addr, val);
+}
+
 /*
  * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
  * for each known erratum. Return 1 if erratum is found.
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index edc4db1335..9bbb385db4 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -4,6 +4,7 @@
 #include <xen/param.h>
 #include <xen/smp.h>
 
+#include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
@@ -131,17 +132,6 @@ bool __init probe_cpuid_faulting(void)
 	uint64_t val;
 	int rc;
 
-	/*
-	 * Don't bother looking for CPUID faulting if we aren't virtualised on
-	 * AMD or Hygon hardware - it won't be present.  Likewise for Fam0F
-	 * Intel hardware.
-	 */
-	if (((boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
-	     ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
-	      boot_cpu_data.x86 == 0xf)) &&
-	    !cpu_has_hypervisor)
-		return false;
-
 	if ((rc = rdmsr_safe(MSR_INTEL_PLATFORM_INFO, val)) == 0)
 		raw_cpu_policy.platform_info.cpuid_faulting =
 			val & MSR_PLATFORM_INFO_CPUID_FAULTING;
@@ -155,8 +145,6 @@ bool __init probe_cpuid_faulting(void)
 		return false;
 	}
 
-	expected_levelling_cap |= LCAP_faulting;
-	levelling_caps |=  LCAP_faulting;
 	setup_force_cpu_cap(X86_FEATURE_CPUID_FAULTING);
 
 	return true;
@@ -179,8 +167,10 @@ static void set_cpuid_faulting(bool enable)
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
@@ -201,12 +191,18 @@ void ctxt_switch_levelling(const struct vcpu *next)
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
 
@@ -415,6 +411,17 @@ static void generic_identify(struct cpuinfo_x86 *c)
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
 
@@ -431,10 +438,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
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
index 71fc1a1e18..7e5c657758 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -226,8 +226,17 @@ static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
  */
 static void __init noinline intel_init_levelling(void)
 {
-	if (probe_cpuid_faulting())
+	/* Intel Fam0f is old enough that probing for CPUID faulting support
+	 * introduces spurious #GP(0) when the appropriate MSRs are read,
+	 * so skip it altogether. In the case where Xen is virtualized these
+	 * MSRs may be emulated though, so we allow it in that case.
+	 */
+	if ((cpu_has_hypervisor || boot_cpu_data.x86 !=0xf) &&
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


