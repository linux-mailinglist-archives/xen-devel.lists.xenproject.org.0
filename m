Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60886FCB8F
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532377.828561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRI-0002OA-V4; Tue, 09 May 2023 16:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532377.828561; Tue, 09 May 2023 16:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRI-0002Lv-RW; Tue, 09 May 2023 16:43:48 +0000
Received: by outflank-mailman (input) for mailman id 532377;
 Tue, 09 May 2023 16:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwQRH-0002Ky-BX
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:43:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d017aa-ee88-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:43:45 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so2934622f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:43:45 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002ffbf2213d4sm14754606wrt.75.2023.05.09.09.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:43:42 -0700 (PDT)
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
X-Inumbo-ID: a9d017aa-ee88-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683650624; x=1686242624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQyCUxTpPixPBVFBdSiN0k/YI9aqhLZJQE2OAMb3ZSg=;
        b=XKh1o0IgXOTR8pP6xG5QopyY1l3y18i6SbkyqgaYeApyoLGSwmQqskMhCdfK8PiKlx
         hZsFMYdruCgUuqpKvRiOHLxtzSm7F6qfb92tbMj9hM/rf5Dg3lGcdNBbPmOqlN87lNNX
         esDFxd4EnbwvdY1XizIi7/oaISq0xuXxA9EM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650624; x=1686242624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQyCUxTpPixPBVFBdSiN0k/YI9aqhLZJQE2OAMb3ZSg=;
        b=Yq7+wJ8TLQdz8yR4jjPX/5m+pzg9xShn4d9VRWlBPlN3WTov1LVtDWh1av7vHqPQ4/
         OU7ElZe2dwRcOBwxQiV3o2PM7cuJhOm+cZjhg6sxxd5kQXgENCVURtpblbtJtIRr9Fcp
         27MSbE9PiIHAsT1GJ9K7iboODimQtQ2YmZ9cHpZs3VVpeLqIpMPEJer4m/DkbaMqGy6L
         FXNcvcBS99W1l1id79uYCSFBNWvKFF/gQEPq+K1YGO4onu9qOWLw9VJ6fS5kI2E6anlp
         Utr594ffQ5DqtET5Olm3WTzuAKbhP810X9IpxTtVa0bJheqAtEAYB0/xelj2V/oZHo2F
         q79g==
X-Gm-Message-State: AC+VfDyLlfxcdVFu7QWw61WIt95gR4LVUYQzhJf0M4E4ZfPEnR1mzUaS
	iyvhGADQYwcZk9Wf8zf4ElyV4vY5ddp5OSQ+lkQ=
X-Google-Smtp-Source: ACHHUZ66heKHNtZecnybWt7F3Z5YP/uYyRzYh7uooIzmomVHTOppE0QrYKMEGi9+Efhd8qFzR3KEag==
X-Received: by 2002:adf:fa06:0:b0:2fb:600e:55bd with SMTP id m6-20020adffa06000000b002fb600e55bdmr10065258wrr.39.1683650623951;
        Tue, 09 May 2023 09:43:43 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86: Refactor conditional guard in probe_cpuid_faulting()
Date: Tue,  9 May 2023 17:43:35 +0100
Message-Id: <20230509164336.12523-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move vendor-specific checks to the vendor-specific callers.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Patch factored out from patch2 of v1
---
 xen/arch/x86/cpu/amd.c    | 10 +++++++++-
 xen/arch/x86/cpu/common.c | 11 -----------
 xen/arch/x86/cpu/intel.c  |  9 ++++++++-
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index caafe44740..899bae7a10 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -271,7 +271,15 @@ static void __init noinline amd_init_levelling(void)
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
+	if (cpu_has_hypervisor && probe_cpuid_faulting())
 		return;
 
 	probe_masking_msrs();
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index edc4db1335..4bfaac4590 100644
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
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 71fc1a1e18..a04414ba1d 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -226,7 +226,14 @@ static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
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
+	    probe_cpuid_faulting())
 		return;
 
 	probe_masking_msrs();
-- 
2.34.1


