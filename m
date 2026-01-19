Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0FD3B76C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 20:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208290.1520491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhv5h-0007M9-AV; Mon, 19 Jan 2026 19:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208290.1520491; Mon, 19 Jan 2026 19:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhv5h-0007Ki-7L; Mon, 19 Jan 2026 19:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1208290;
 Mon, 19 Jan 2026 19:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSbG=7Y=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vhv5f-0007Kc-EW
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 19:39:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83408502-f56e-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 20:39:04 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-432da746749so2389517f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 11:39:04 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569922032sm26146475f8f.8.2026.01.19.11.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 11:39:02 -0800 (PST)
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
X-Inumbo-ID: 83408502-f56e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1768851544; x=1769456344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LuowZkM4E9Dk4HGNIH/SL9OY7qq6DsAGVlOw3BlToQ=;
        b=TIxt/hCbTz2KFP14YddU6D17dXpHD/vtYMaGmkv9WnDCeQ121r5OAyMI76QmnXeD8c
         Hu9gnftzSX0YlWJe5W0dfjuOQoukE/R14bhwDrTIDhU5VHkrFN6IB2quYF//PnUDRFn1
         0z/qHu40goZalhW5Yrqso8tSswSJc3DSKliSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851544; x=1769456344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LuowZkM4E9Dk4HGNIH/SL9OY7qq6DsAGVlOw3BlToQ=;
        b=l4mKDf6PR5PsNU8EhQo3UQZtZg3qhf31YXcIL46gxGy/44VOvWQqMUezQIdOk/f3On
         uMnQCiOwosJIsMamPkExGzbtaDZpVpEwtMF2wyIZK/9eKLdJwrggFYTBbeO3fu4rmzS0
         Q8xTCsgtcmJ+EKvmRv3YV8F1kUIbf7NzgICwEYOSbSGDVyjPrNtokOxr1pLD5dpshRio
         f6H5V6HXooSZpYJ7gFSdpXVMzDI5i/5CVNdFwmrjiGE5mvZ+zblv42deVF6LQyGa2em2
         1fHYxAYlpqnDg8w0qNm2Yl3z/uCUi/JmUht7aq3yiPteHMYmI9ZIbpNM0Ua3mUb1dRzx
         BGjA==
X-Gm-Message-State: AOJu0YzJZZ1OgerzDKgTr8iXaDXql/lZIBMZ8cP9McM4mqeAni7xj0Zp
	RYydAr6ZOopGZDaezE4ye2AoNnRLGdz02EI5jj1miZMZ+yCvhzr0NQzKipfqB64a6R/9Al0W5s+
	lffb4
X-Gm-Gg: AZuq6aJ5uaK2SDj2UU8GrlDzPivoeOMuZG9BXpeOrOH7SXGJ8SBQDzpC5+FtNO8Vt12
	Z2gHauxg3pdgM+Cijv/X2+mOUDyUVYZM9T37+Ka7reyKInvYd3QgX5HPbePwS3gmMDL+2bVbHBZ
	v6lh3RZ5LTmFb5m3Ndqx63eXpcAH+Fnr0p7tLcTNNHMUrZ+6nDrwqEeOWKZCQEdb613/1rx091H
	brZQWyQskEBgc+HeUMV8qOlKeMHGCfUqKXrKPIznBFTXaTlStYuDRAV4FNfqoM6/f+qv23G0c6S
	JUJ+2gqBKjXv+ZlyTXyqsIBjK6s/Nfkohuk8kA8Hne6Qzwq39I2TbfpsdWD55bfsmb4zW+gzG2s
	m3fEeniow3Sm1By8P2H/keo98tqkclQDJXEBNZaQu47uqE0m/hqzYyoAGiVRUZC75b1thjwiNX4
	f+56VK7B7sZNbKtCKHwiCL5UYyI8rlZMNH62iFq2txeG8YopvqigKzcXXQNwwF6Q==
X-Received: by 2002:a05:6000:1789:b0:430:f7ae:af3c with SMTP id ffacd0b85a97d-43569bc1801mr16921908f8f.31.1768851543093;
        Mon, 19 Jan 2026 11:39:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/intel: Drop more cpuid_mask_* infrastructure
Date: Mon, 19 Jan 2026 19:39:01 +0000
Message-Id: <20260119193901.1354905-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Despite removing references from the documentation, the Intel parts of CPUID
Masking were accidentally left behind and still active.

Intel CPUID Masking is even more niche than AMD masking, as the MSRs only
exist between Nehalem and SandyBridge, being fully replaced with CPUID
Faulting from IvyBridge onwards.

Fixes: 317051c2f032 ("x86/amd: Drop the cpuid_mask_* command line options")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c | 13 -------------
 xen/arch/x86/cpu/cpu.h    |  3 ---
 xen/arch/x86/cpu/intel.c  | 18 ++----------------
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 37820a3a08ab..79573384ea38 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -31,19 +31,6 @@ bool __read_mostly opt_dom0_cpuid_faulting = true;
 bool opt_arat = true;
 boolean_param("arat", opt_arat);
 
-unsigned int opt_cpuid_mask_ecx = ~0u;
-integer_param("cpuid_mask_ecx", opt_cpuid_mask_ecx);
-unsigned int opt_cpuid_mask_edx = ~0u;
-integer_param("cpuid_mask_edx", opt_cpuid_mask_edx);
-
-unsigned int opt_cpuid_mask_xsave_eax = ~0u;
-integer_param("cpuid_mask_xsave_eax", opt_cpuid_mask_xsave_eax);
-
-unsigned int opt_cpuid_mask_ext_ecx = ~0u;
-integer_param("cpuid_mask_ext_ecx", opt_cpuid_mask_ext_ecx);
-unsigned int opt_cpuid_mask_ext_edx = ~0u;
-integer_param("cpuid_mask_ext_edx", opt_cpuid_mask_ext_edx);
-
 unsigned int __initdata expected_levelling_cap;
 unsigned int __read_mostly levelling_caps;
 
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 8bed3f52490f..bbede57ab00d 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -12,9 +12,6 @@ extern const struct cpu_dev intel_cpu_dev, amd_cpu_dev, centaur_cpu_dev,
     shanghai_cpu_dev, hygon_cpu_dev;
 
 extern bool opt_arat;
-extern unsigned int opt_cpuid_mask_ecx, opt_cpuid_mask_edx;
-extern unsigned int opt_cpuid_mask_xsave_eax;
-extern unsigned int opt_cpuid_mask_ext_ecx, opt_cpuid_mask_ext_edx;
 
 extern int get_model_name(struct cpuinfo_x86 *c);
 extern void display_cacheinfo(struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index b76797cb9a4a..284101e4ea4c 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -259,6 +259,8 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
  */
 static void __init noinline intel_init_levelling(void)
 {
+	uint32_t eax, ecx, edx, tmp;
+
 	/*
 	 * Intel Fam0f is old enough that probing for CPUID faulting support
 	 * introduces spurious #GP(0) when the appropriate MSRs are read,
@@ -275,13 +277,8 @@ static void __init noinline intel_init_levelling(void)
 	probe_masking_msrs();
 
 	if (msr_basic) {
-		uint32_t ecx, edx, tmp;
-
 		cpuid(0x00000001, &tmp, &tmp, &ecx, &edx);
 
-		ecx &= opt_cpuid_mask_ecx;
-		edx &= opt_cpuid_mask_edx;
-
 		/* Fast-forward bits - Must be set. */
 		if (ecx & cpufeat_mask(X86_FEATURE_XSAVE))
 			ecx |= cpufeat_mask(X86_FEATURE_OSXSAVE);
@@ -291,23 +288,12 @@ static void __init noinline intel_init_levelling(void)
 	}
 
 	if (msr_ext) {
-		uint32_t ecx, edx, tmp;
-
 		cpuid(0x80000001, &tmp, &tmp, &ecx, &edx);
-
-		ecx &= opt_cpuid_mask_ext_ecx;
-		edx &= opt_cpuid_mask_ext_edx;
-
 		cpuidmask_defaults.e1cd &= ((u64)edx << 32) | ecx;
 	}
 
 	if (msr_xsave) {
-		uint32_t eax, tmp;
-
 		cpuid_count(0x0000000d, 1, &eax, &tmp, &tmp, &tmp);
-
-		eax &= opt_cpuid_mask_xsave_eax;
-
 		cpuidmask_defaults.Da1 &= (~0ULL << 32) | eax;
 	}
 

base-commit: e80f4da85b29f888c0644749b0a4ab29a9f2f6ca
-- 
2.39.5


