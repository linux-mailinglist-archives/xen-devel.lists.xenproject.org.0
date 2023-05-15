Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7839702B8D
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 13:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534712.832018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQe-0000fQ-0x; Mon, 15 May 2023 11:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534712.832018; Mon, 15 May 2023 11:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWQd-0000c1-TF; Mon, 15 May 2023 11:31:47 +0000
Received: by outflank-mailman (input) for mailman id 534712;
 Mon, 15 May 2023 11:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ig+9=BE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pyWQc-0000Ms-7e
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 11:31:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11f9e53a-f314-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 13:31:44 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307a8386946so4859001f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 May 2023 04:31:44 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c22c200b003f42328b5d9sm24857485wmg.39.2023.05.15.04.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:31:42 -0700 (PDT)
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
X-Inumbo-ID: 11f9e53a-f314-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1684150303; x=1686742303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGFm+3lAlf7VMEM6bIEf2GWuO0LeQWDDCKOo0efIzZY=;
        b=AHy1rhj9SasQX0lJ1QL/RiJIXJGBHFGVG/UiFpfgd2tjoZkUHfxFX6SFoXS335ZQk4
         h1e1T7aYEDW4t3XxVbmtToVEEnUeG6iornHXOgphCQJYIYhUoIOvbmnC4pMLK7DVRVkM
         2BjAmrcDTkWVCLAVuKoVSSedzSF1EHgDYqjsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150303; x=1686742303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGFm+3lAlf7VMEM6bIEf2GWuO0LeQWDDCKOo0efIzZY=;
        b=OwUddQVQyqgwR399qnf9TyfzOYsu2A+0/BU1foTaIicgklY8+Glzn6DVnAcn/j4LBJ
         47hIiMVdlkUdFjKLtTtJzXsnO+bGrHpQIg3gRB907mhK74pC4sYXvObk0Vnol/6C1mkp
         IwuWI+F9XjZ+4q7n29aZw9Mvj+dV/9P3/Dkj9Wk0VwO/zKKYtYZn4g8hdEVVSaD/Z/dX
         Osjadew8GkHC5/QQ0K4q2kn0g7v0wPehHDPrIo160v056kIbnZ96MiDmp/i66In86+LN
         f0Kot0c/wTKrTUBV6tQcnkvskIgX69oQ2kJ28/YD4myGIoy3MEaMojxkVlWWUXRek31Y
         fdpg==
X-Gm-Message-State: AC+VfDyonaheOEf0xQZfGjOYySmXhzo9TzL9RZW+3u6rM/cYGpTwqoCF
	mgzqZGvtEpQgjfHYTPaSJTlV9adAIHGJe4ZeXpo=
X-Google-Smtp-Source: ACHHUZ6rVekaauOji+qzfUyxp3ydiH/CIVyARgmQhoLqpMouNJpruA4b7lIfCJHSHroYfgYGX3ENww==
X-Received: by 2002:adf:f990:0:b0:307:c0c4:109a with SMTP id f16-20020adff990000000b00307c0c4109amr11096133wrr.6.1684150303524;
        Mon, 15 May 2023 04:31:43 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] x86: Refactor conditional guard in probe_cpuid_faulting()
Date: Mon, 15 May 2023 12:31:35 +0100
Message-Id: <20230515113136.2465-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
References: <20230515113136.2465-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move vendor-specific checks to the vendor-specific callers. While at it
move the synth cap setters to the callers too, as it's needed for a later
patch and it's not a functional change either.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3:
  * Moved the setting of LCAP_* bits to intel.c and amd.c
---
 xen/arch/x86/cpu/amd.c    | 13 ++++++++++++-
 xen/arch/x86/cpu/common.c | 13 -------------
 xen/arch/x86/cpu/intel.c  | 12 +++++++++++-
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index caafe44740..440af59670 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -271,8 +271,19 @@ static void __init noinline amd_init_levelling(void)
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
+	if (cpu_has_hypervisor && probe_cpuid_faulting()) {
+		expected_levelling_cap |= LCAP_faulting;
+		levelling_caps |= LCAP_faulting;
 		return;
+	}
 
 	probe_masking_msrs();
 
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index edc4db1335..52646f7dfb 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -131,17 +131,6 @@ bool __init probe_cpuid_faulting(void)
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
@@ -155,8 +144,6 @@ bool __init probe_cpuid_faulting(void)
 		return false;
 	}
 
-	expected_levelling_cap |= LCAP_faulting;
-	levelling_caps |=  LCAP_faulting;
 	setup_force_cpu_cap(X86_FEATURE_CPUID_FAULTING);
 
 	return true;
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 71fc1a1e18..168cd58f36 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -226,8 +226,18 @@ static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
  */
 static void __init noinline intel_init_levelling(void)
 {
-	if (probe_cpuid_faulting())
+	/*
+	 * Intel Fam0f is old enough that probing for CPUID faulting support
+	 * introduces spurious #GP(0) when the appropriate MSRs are read,
+	 * so skip it altogether. In the case where Xen is virtualized these
+	 * MSRs may be emulated though, so we allow it in that case.
+	 */
+	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
+	    probe_cpuid_faulting()) {
+		expected_levelling_cap |= LCAP_faulting;
+		levelling_caps |= LCAP_faulting;
 		return;
+	}
 
 	probe_masking_msrs();
 
-- 
2.34.1


