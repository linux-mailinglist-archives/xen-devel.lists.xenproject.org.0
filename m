Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0888AD96
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 19:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697854.1089037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roou5-0004SV-Om; Mon, 25 Mar 2024 18:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697854.1089037; Mon, 25 Mar 2024 18:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roou5-0004Qv-L1; Mon, 25 Mar 2024 18:18:37 +0000
Received: by outflank-mailman (input) for mailman id 697854;
 Mon, 25 Mar 2024 18:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Hjx=K7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1roou3-0004Nr-QK
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 18:18:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 171c0e48-ead4-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 19:18:33 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso5418197a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 11:18:33 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c36-20020a509fa7000000b0056bdec673c3sm3353969edf.38.2024.03.25.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 11:18:31 -0700 (PDT)
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
X-Inumbo-ID: 171c0e48-ead4-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711390712; x=1711995512; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCQaZ2vEVw3LDT3hBoi3CjYKe2i19cOeP080dPUKgzQ=;
        b=TmTvo0/jXZvjuJP5Et2/3vaZHUqa5r6wNcZsgAOCA+j6ijWfkVzsk4W4VnzvLeOBgH
         CWahUA+aYhnnIhVuextDZHgbxjJwx57/tZETz8cjT2MRFddRmS8zE0I1eK89cOA1BhNg
         oHUxL64Tsd8ojCDL7HoBrUkmVLA3CKeYWbZJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711390712; x=1711995512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCQaZ2vEVw3LDT3hBoi3CjYKe2i19cOeP080dPUKgzQ=;
        b=O2GvZ87a9ujObbQFRAsez2nKQUxvowVcrF5l+PnNkhNz0wvEcmRQHPMG4pa9qm5hSx
         sACahciacoINLy8MSGLbDMDygJ2Hte1XTRVA4TzUXUWkI2f5v5r1V67NZAt7AIhCar+x
         Ho1HoenGzRolYgTudPZfEabd7WItBKLzxFlAnm3Jiq/sQGldZ4K6DMKkbYHor3OTT0BE
         txCYMKnoP+zWgvzS3ffrjHEUf39nCIrVsKq6+Yti0kglETskDjvlHR4PCPR3HzpQkxTh
         TT3XpCBq1ag7htX1kaWCEMPnGOvmnQknk5k+ZxiTuiWvHwUQHo+qZYkZ/Zr7HZIUiPXr
         Dx8g==
X-Gm-Message-State: AOJu0YwYGap/leAn8v4ILfzy05ATkRby8nVBQcYhcNry7jbN0vVdEgpx
	PmUzIXxsrKxR2tH/etAy5jw1/9Xg9SmlTIbFE/PrLnA+E7CIXf/9vGEW6jwVChPo/HPSLlNHQ3b
	w
X-Google-Smtp-Source: AGHT+IG1rKPZ+DgNqS+fD/u8DIaVGb/O+3r9gcOk0odwEJqwnrNMVbAB1vJ+dlwm+FAkBQhflMOw+A==
X-Received: by 2002:a50:8e5d:0:b0:56b:a155:4b39 with SMTP id 29-20020a508e5d000000b0056ba1554b39mr5202593edx.28.1711390712366;
        Mon, 25 Mar 2024 11:18:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/spec-ctrl: Support for SRSO_US_NO and SRSO_MSR_FIX
Date: Mon, 25 Mar 2024 18:18:30 +0000
Message-Id: <20240325181830.638680-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AMD have updated the SRSO whitepaper[1] with further information.

There's a new SRSO_U/S_NO enumeration saying that SRSO attacks can't cross the
user/supervisor boundary.  i.e. we don't need to use IBPB-on-entry for PV.

There's also a new SRSO_MSR_FIX identifying that the BP_SPEC_REDUCE bit is
available in MSR_BP_CFG.  When set, SRSO attacks can't cross the host/guest
boundary.  i.e. we don't need to use IBPB-on-entry for HVM.

Extend ibpb_calculations() to account for these when calculating
opt_ibpb_entry_{pv,hvm} defaults.  Add a bp-spec-reduce option to control the
use of BP_SPEC_REDUCE, but activate it by default.

Because MSR_BP_CFG is core-scoped with a race condition updating it, repurpose
amd_check_erratum_1485() into amd_check_bp_cfg() and calculate all updates at
once.

Fix a typo in the SRSO_NO's comment.

[1] https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.  This is all speculative coding.
---
 docs/misc/xen-command-line.pandoc           |  9 ++++-
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/amd.c                      | 27 ++++++++++----
 xen/arch/x86/include/asm/msr-index.h        |  1 +
 xen/arch/x86/include/asm/spec_ctrl.h        |  1 +
 xen/arch/x86/spec_ctrl.c                    | 39 ++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++-
 7 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 14cafb462a9a..5d114514cc8f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2377,7 +2377,8 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {msr-sc,rsb,verw,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
->              unpriv-mmio,gds-mit,div-scrub,lock-harden}=<bool> ]`
+>              unpriv-mmio,gds-mit,div-scrub,lock-harden,
+>              bp-spec-reduce}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2509,6 +2510,12 @@ boolean can be used to force or prevent Xen from using speculation barriers to
 protect lock critical regions.  This mitigation won't be engaged by default,
 and needs to be explicitly enabled on the command line.
 
+On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
+to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
+SRSO (Speculative Return Stack Overflow) vulnerability.  By default, Xen will
+use bp-spec-reduce when available, as it preferable to using `ibpb-entry=hvm`
+to mitigate SRSO.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 8893547bebce..ec24a16086c6 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -212,6 +212,7 @@ static const char *const str_e21a[32] =
 
     /* 26 */                [27] = "sbpb",
     [28] = "ibpb-brtype",   [29] = "srso-no",
+    [30] = "srso-us-no",    [31] = "srso-msr-fix",
 };
 
 static const char *const str_7b1[32] =
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ab92333673b9..9247a4e65734 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1009,16 +1009,31 @@ static void cf_check fam17_disable_c6(void *arg)
 	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
 }
 
-static void amd_check_erratum_1485(void)
+static void amd_check_bp_cfg(void)
 {
-	uint64_t val, chickenbit = (1 << 5);
+	uint64_t val, new = 0;
 
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x19 || !is_zen4_uarch())
+	/*
+	 * AMD Erratum #1485.  Set bit 5, as instructed.
+	 */
+	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
+		new |= (1 << 5);
+
+	/*
+	 * On hardware supporting SRSO_MSR_FIX, we prefer BP_SPEC_REDUCE to
+	 * IBPB-on-entry to mitigate SRSO for HVM guests.
+	 */
+	if (IS_ENABLED(CONFIG_HVM) && boot_cpu_has(X86_FEATURE_SRSO_US_NO) &&
+            opt_bp_spec_reduce)
+		new |= BP_CFG_SPEC_REDUCE;
+
+	/* Avoid reading BP_CFG if we don't intend to change anything. */
+	if (!new)
 		return;
 
 	rdmsrl(MSR_AMD64_BP_CFG, val);
 
-	if (val & chickenbit)
+	if ((val & new) == new)
 		return;
 
 	/*
@@ -1027,7 +1042,7 @@ static void amd_check_erratum_1485(void)
 	 * same time before the chickenbit is set. It's benign because the
 	 * value being written is the same on both.
 	 */
-	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
+	wrmsrl(MSR_AMD64_BP_CFG, val | new);
 }
 
 static void cf_check init_amd(struct cpuinfo_x86 *c)
@@ -1297,7 +1312,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		disable_c1_ramping();
 
 	amd_check_zenbleed();
-	amd_check_erratum_1485();
+	amd_check_bp_cfg();
 
 	if (fam17_c6_disabled)
 		fam17_disable_c6(NULL);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 92dd9fa4962c..c6b11c8c96dc 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -412,6 +412,7 @@
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
 #define MSR_AMD64_EX_CFG		0xc001102cU
 #define MSR_AMD64_BP_CFG		0xc001102eU
+#define  BP_CFG_SPEC_REDUCE		(_AC(1, ULL) << 4)
 #define MSR_AMD64_DE_CFG2		0xc00110e3U
 
 #define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027U
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 011ab1db2709..58e47cac57db 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -88,6 +88,7 @@ extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
+extern bool opt_bp_spec_reduce;
 
 /*
  * The L1D address mask, which might be wider than reported in CPUID, and the
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0b670c3ca753..abd778e7f992 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -71,6 +71,7 @@ static bool __initdata opt_unpriv_mmio;
 static bool __ro_after_init opt_verw_mmio;
 static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
+bool __ro_after_init opt_bp_spec_reduce = true;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -127,6 +128,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_unpriv_mmio = false;
             opt_gds_mit = 0;
             opt_div_scrub = 0;
+            opt_bp_spec_reduce = false;
         }
         else if ( val > 0 )
             rc = -EINVAL;
@@ -306,6 +308,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_gds_mit = val;
         else if ( (val = parse_boolean("div-scrub", s, ss)) >= 0 )
             opt_div_scrub = val;
+        else if ( (val = parse_boolean("bp-spec-reduce", s, ss)) >= 0 )
+            opt_bp_spec_reduce = val;
         else
             rc = -EINVAL;
 
@@ -1053,7 +1057,7 @@ static void __init div_calculations(bool hw_smt_enabled)
 
 static void __init ibpb_calculations(void)
 {
-    bool def_ibpb_entry = false;
+    bool def_ibpb_entry_pv = false, def_ibpb_entry_hvm = false;
 
     /* Check we have hardware IBPB support before using it... */
     if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
@@ -1078,22 +1082,41 @@ static void __init ibpb_calculations(void)
          * Confusion.  Mitigate with IBPB-on-entry.
          */
         if ( !boot_cpu_has(X86_FEATURE_BTC_NO) )
-            def_ibpb_entry = true;
+            def_ibpb_entry_pv = def_ibpb_entry_hvm = true;
 
         /*
-         * Further to BTC, Zen3/4 CPUs suffer from Speculative Return Stack
-         * Overflow in most configurations.  Mitigate with IBPB-on-entry if we
-         * have the microcode that makes this an effective option.
+         * Further to BTC, Zen3 and later CPUs suffer from Speculative Return
+         * Stack Overflow in most configurations.  Mitigate with IBPB-on-entry
+         * if we have the microcode that makes this an effective option,
+         * except where there are other mitigating factors available.
          */
         if ( !boot_cpu_has(X86_FEATURE_SRSO_NO) &&
              boot_cpu_has(X86_FEATURE_IBPB_BRTYPE) )
-            def_ibpb_entry = true;
+        {
+            /*
+             * SRSO_U/S_NO is a subset of SRSO_NO, identifying that SRSO isn't
+             * possible across the user/supervisor boundary.  We only need to
+             * use IBPB-on-entry for PV guests on hardware which doesn't
+             * enumerate SRSO_US_NO.
+             */
+            if ( !boot_cpu_has(X86_FEATURE_SRSO_US_NO) )
+                def_ibpb_entry_pv = true;
+
+            /*
+             * SRSO_MSR_FIX enumerates that we can use MSR_BP_CFG.SPEC_REDUCE
+             * to mitigate SRSO across the host/guest boundary.  We only need
+             * to use IBPB-on-entry for HVM guests if we haven't enabled this
+             * control.
+             */
+            if ( !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) || !opt_bp_spec_reduce )
+                def_ibpb_entry_hvm = true;
+        }
     }
 
     if ( opt_ibpb_entry_pv == -1 )
-        opt_ibpb_entry_pv = IS_ENABLED(CONFIG_PV) && def_ibpb_entry;
+        opt_ibpb_entry_pv = IS_ENABLED(CONFIG_PV) && def_ibpb_entry_pv;
     if ( opt_ibpb_entry_hvm == -1 )
-        opt_ibpb_entry_hvm = IS_ENABLED(CONFIG_HVM) && def_ibpb_entry;
+        opt_ibpb_entry_hvm = IS_ENABLED(CONFIG_HVM) && def_ibpb_entry_hvm;
 
     if ( opt_ibpb_entry_pv )
     {
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 3de7c0383f0e..815fedc1a93e 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,7 +304,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
 XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
 XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
-XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A  Hardware not vulnerable to SRSO across the User/Supervisor boundary */
+XEN_CPUFEATURE(SRSO_MSR_FIX,       11*32+31) /*   MSR_BP_CFG.BP_SPEC_REDUCE available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */

base-commit: 6f6de10ade5ade907f9e3f3c72b7b18f7852d9ff
-- 
2.30.2


