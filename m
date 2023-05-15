Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE8702B8F
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 13:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534713.832029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQf-0000uD-AL; Mon, 15 May 2023 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534713.832029; Mon, 15 May 2023 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQf-0000qu-67; Mon, 15 May 2023 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 534713;
 Mon, 15 May 2023 11:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ig+9=BE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pyWQd-0000c0-P6
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 11:31:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ef7049-f314-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 13:31:46 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so66752665e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 May 2023 04:31:46 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c22c200b003f42328b5d9sm24857485wmg.39.2023.05.15.04.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:31:43 -0700 (PDT)
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
X-Inumbo-ID: 12ef7049-f314-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1684150305; x=1686742305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FePqsA7ELp0EtWX0sxXIM57wZyVx9jZJGScpb51/u1s=;
        b=K/MDGwykdntuhMMRF4Av/PjrIJnlSnmPzh4d19jq99GNIWbqO3TqH2Am2hRpY6UN0l
         PM6O6/zQbTIXMIuCXyFhxp3tCqXpF0p2b8EYwH6JUdrmRWN5fd/lQAJboYmhkBtOD4+H
         j7QsmoLpGPuul0gK7pD4UTLqdi4dNvg1rhTHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150305; x=1686742305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FePqsA7ELp0EtWX0sxXIM57wZyVx9jZJGScpb51/u1s=;
        b=Ykcpv0XmPTds/Zp9iZ11fXTWqevQMmgphLzVU9Jade/6OKuvW/ZGDnZQmyntZotcWz
         LwP/UaWBdYQYyHbQF+Wuo7GkHC2612/Y5MDJlBcDxyEKOexfbOvvCIbARjakCK72oFVK
         YPlgcd4bc4vHaAvw3A++D1qkw1G4FGYKp7NM3MwInKONkQ7QpUP8+7T0ntW8JtMn+DIe
         TcibUb9mwHcH/rA07BX3nf71xIBwk5oMDN0Zj333IgT1xgg85dfIRUSraASjiF+/fnLy
         w5yzx62rwOlI+QIl9vKO0CgEN4gTgsMSG3neF6gha/oTHvdYdO0km3NLQWW0f09tPdGO
         ibWA==
X-Gm-Message-State: AC+VfDz7ivnNOLS7CX8KVvjRoHTfSbUkDOLRBEtP0i3iZ0NL+HCQgYFj
	KEbMskbPMkgD4dsP0EyuR+tWWzQH3Hecs8RNHUY=
X-Google-Smtp-Source: ACHHUZ7q9WubgGbTtqbnUqhWCbotkJGKcKJUhhjjHf1p3pVtVMZKNAsd6Sd7lipunzQqN8XGfbKFQA==
X-Received: by 2002:a7b:cd89:0:b0:3f4:247c:b00a with SMTP id y9-20020a7bcd89000000b003f4247cb00amr19425242wmj.15.1684150305097;
        Mon, 15 May 2023 04:31:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] x86: Add support for CpuidUserDis
Date: Mon, 15 May 2023 12:31:36 +0100
Message-Id: <20230515113136.2465-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
References: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because CpuIdUserDis is reported in CPUID itself, the extended leaf
containing that bit must be retrieved before calling c_early_init()

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
 * Moved LCAP_* setters to the callers in patch1/v3
 * Added rationale for checking CPUID faulting before CpuidUserDis in AMD
---
 xen/arch/x86/cpu/amd.c         | 23 ++++++++++++++++++--
 xen/arch/x86/cpu/common.c      | 38 ++++++++++++++++++++++++----------
 xen/arch/x86/include/asm/amd.h |  1 +
 3 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 440af59670..3072b68628 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -277,9 +277,14 @@ static void __init noinline amd_init_levelling(void)
 	 *
 	 * CPUID faulting is an Intel feature analogous to CpuidUserDis, so
 	 * that can only be present when Xen is itself virtualized (because
-	 * it can be emulated)
+	 * it can be emulated).
+	 *
+	 * Note that probing for the Intel feature _first_ isn't a mistake,
+	 * but a means to ensure MSR_INTEL_PLATFORM_INFO is read and added
+	 * to the raw CPU policy if present.
 	 */
-	if (cpu_has_hypervisor && probe_cpuid_faulting()) {
+	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
+	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
 		expected_levelling_cap |= LCAP_faulting;
 		levelling_caps |= LCAP_faulting;
 		return;
@@ -374,6 +379,20 @@ static void __init noinline amd_init_levelling(void)
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
index 52646f7dfb..9bbb385db4 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -4,6 +4,7 @@
 #include <xen/param.h>
 #include <xen/smp.h>
 
+#include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
@@ -166,8 +167,10 @@ static void set_cpuid_faulting(bool enable)
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
@@ -188,12 +191,18 @@ void ctxt_switch_levelling(const struct vcpu *next)
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
 
@@ -402,6 +411,17 @@ static void generic_identify(struct cpuinfo_x86 *c)
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
 
@@ -418,10 +438,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
 		__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
 
-	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000)
-		c->extended_cpuid_level = eax;
-
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
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


