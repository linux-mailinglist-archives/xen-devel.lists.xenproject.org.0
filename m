Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08490F6BD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 21:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743999.1151012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK0i0-0005pf-F4; Wed, 19 Jun 2024 19:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743999.1151012; Wed, 19 Jun 2024 19:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK0i0-0005nd-C1; Wed, 19 Jun 2024 19:11:04 +0000
Received: by outflank-mailman (input) for mailman id 743999;
 Wed, 19 Jun 2024 19:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXUT=NV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sK0hy-0005mQ-CH
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 19:11:02 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa128d28-2e6f-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 21:11:00 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52bc274f438so185839e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 12:11:00 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f99774sm691492166b.203.2024.06.19.12.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 12:10:58 -0700 (PDT)
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
X-Inumbo-ID: aa128d28-2e6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718824259; x=1719429059; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVqgK+Gsjfrd6Xlaw9wBeTvUFp2FnlECp4adM+DnPBY=;
        b=UG+Ty89dX/EOOX3dkYHOpcO8mT85JqPtc/Qca/RiAXiC+5udSlK+S/IH+6Oj+KVHpc
         cEQ4f8k0TrL3cKqaXWBb3MUZmggwgOlVQauKtt7O87kCiSZHWHAHKBJSzmtN9xAF4/oR
         GLpxX3hQ+Yw4WQKROw/VjyegN5+dqyj/xTG1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718824259; x=1719429059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVqgK+Gsjfrd6Xlaw9wBeTvUFp2FnlECp4adM+DnPBY=;
        b=pCTLpVUIlaI7lM3EZMPlMMe/S1IQaqaAFjTMBBsOeiZUNiNj+PVqARqxA/jS5Yv9tw
         InXKKyndrvULQTEleUgA/UgjVukn7UVt/ag2JIWy/rkPgGGUyiSD4SLvx4HL8aPi7GPW
         vwQJwSp7WRN+zKgQnhyNTNK+ANX6EbHNHDA3ufUoHJUsUDGXIDLa5c7AX1t8BXQyjbeM
         29T8rO46152gyqJ/fpSOs4475L3ln1+mQ3laGH3IYvGDUIgQNP2f9YlSRtkq3wsahuiY
         snpfb4j40QTqo6lPda98+2apOFCyeSKPk/exKOGivtfFByCc1LPiZOVtME8Kx9xunO5e
         rzVQ==
X-Gm-Message-State: AOJu0Ywt67wYN7bWwjAnAsSobPzcIuJDyJXU3MC1ihJnao2ejSuvLxEo
	NZAEPx+uGuj5+mvnEBHOJqjlgxgJtcp4wzKNqc+pt8GrjAKoxWHCLa+qfAMOK2xAkE1jtM5XcWp
	mYfU=
X-Google-Smtp-Source: AGHT+IHt18fgs/Ory06X+WGbDJjlVz2q4bgmxXq0/Xj8XMdGvLtWnNxubHbyAdiphZFRsUarEjt1mA==
X-Received: by 2002:a05:6512:3f0e:b0:52c:9fd6:1b8a with SMTP id 2adb3069b0e04-52ccaa595c8mr3089490e87.8.1718824258866;
        Wed, 19 Jun 2024 12:10:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v2] x86/spec-ctrl: Support for SRSO_US_NO and SRSO_MSR_FIX
Date: Wed, 19 Jun 2024 20:10:57 +0100
Message-Id: <20240619191057.2588693-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AMD have updated the SRSO whitepaper[1] with further information.

There's a new SRSO_U/S_NO enumeration saying that SRSO attacks can't cross the
user/supervisor boundary.  i.e. Xen don't need to use IBPB-on-entry for PV.

There's also a new SRSO_MSR_FIX identifying that the BP_SPEC_REDUCE bit is
available in MSR_BP_CFG.  When set, SRSO attacks can't cross the host/guest
boundary.  i.e. Xen don't need to use IBPB-on-entry for HVM.

Extend ibpb_calculations() to account for these when calculating
opt_ibpb_entry_{pv,hvm} defaults.  Add a bp-spec-reduce option to control the
use of BP_SPEC_REDUCE, but activate it by default.

Because MSR_BP_CFG is core-scoped with a race condition updating it, repurpose
amd_check_erratum_1485() into amd_check_bp_cfg() and calculate all updates at
once.

Advertise SRSO_U/S_NO to guests whenever possible, as it allows the guest
kernel to skip SRSO protections too.  This is easy for HVM guests, but hard
for PV guests, as both the guest userspace and kernel operate in CPL3.  After
discussing with AMD, it is believed to be safe to advertise SRSO_U/S_NO to PV
guests when BP_SPEC_REDUCE is active.

Fix a typo in the SRSO_NO's comment.

[1] https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Add "for HVM guests" to xen-command-line.pandoc
 * Print details on boot
 * Don't advertise SRSO_US_NO to PV guests if BP_SPEC_REDUCE isn't active.

For 4.19.  This should be no functional change on current hardware.  On
forthcoming hardware, it avoids the substantial perf hits which were necessary
to protect against the SRSO speculative vulnerability.
---
 docs/misc/xen-command-line.pandoc           |  9 +++-
 xen/arch/x86/cpu-policy.c                   | 19 ++++++++
 xen/arch/x86/cpu/amd.c                      | 29 +++++++++---
 xen/arch/x86/include/asm/msr-index.h        |  1 +
 xen/arch/x86/include/asm/spec_ctrl.h        |  1 +
 xen/arch/x86/spec_ctrl.c                    | 49 ++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  4 +-
 7 files changed, 92 insertions(+), 20 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dea7431fab6..88beb64525d5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2390,7 +2390,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
->              bhi-dis-s}=<bool> ]`
+>              bhi-dis-s,bp-spec-reduce}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2539,6 +2539,13 @@ boolean can be used to force or prevent Xen from using speculation barriers to
 protect lock critical regions.  This mitigation won't be engaged by default,
 and needs to be explicitly enabled on the command line.
 
+On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
+to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
+SRSO (Speculative Return Stack Overflow) vulnerability.  Xen will use
+bp-spec-reduce when available, as it is preferable to using `ibpb-entry=hvm`
+to mitigate SRSO for HVM guests, and because it is a necessary prerequisite in
+order to advertise SRSO_U/S_NO to PV guests.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 304dc20cfab8..fd32fe333384 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -14,6 +14,7 @@
 #include <asm/msr-index.h>
 #include <asm/paging.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 #include <asm/xstate.h>
 
 struct cpu_policy __read_mostly       raw_cpu_policy;
@@ -605,6 +606,24 @@ static void __init calculate_pv_max_policy(void)
         __clear_bit(X86_FEATURE_IBRS, fs);
     }
 
+    /*
+     * SRSO_U/S_NO means that the CPU is not vulnerable to SRSO attacks across
+     * the User (CPL3)/Supervisor (CPL<3) boundary.  However the PV64
+     * user/kernel boundary is CPL3 on both sides, so it won't convey the
+     * meaning that a PV kernel expects.
+     *
+     * PV32 guests are explicitly unsupported WRT speculative safety, so are
+     * ignored to avoid complicating the logic.
+     *
+     * After discussions with AMD, it is believed to be safe to offer
+     * SRSO_US_NO to PV guests when BP_SPEC_REDUCE is active.
+     *
+     * If BP_SPEC_REDUCE isn't active, remove SRSO_U/S_NO from the PV max
+     * policy, which will cause it to filter out of PV default too.
+     */
+    if ( !boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) || !opt_bp_spec_reduce )
+        __clear_bit(X86_FEATURE_SRSO_US_NO, fs);
+
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ab92333673b9..5213dfff601d 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1009,16 +1009,33 @@ static void cf_check fam17_disable_c6(void *arg)
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
+	 * On hardware supporting SRSO_MSR_FIX, activate BP_SPEC_REDUCE by
+	 * default.  This lets us do two things:
+         *
+         * 1) Avoid IBPB-on-entry to mitigate SRSO attacks from HVM guests.
+         * 2) Lets us advertise SRSO_US_NO to PV guests.
+	 */
+	if (boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) && opt_bp_spec_reduce)
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
@@ -1027,7 +1044,7 @@ static void amd_check_erratum_1485(void)
 	 * same time before the chickenbit is set. It's benign because the
 	 * value being written is the same on both.
 	 */
-	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
+	wrmsrl(MSR_AMD64_BP_CFG, val | new);
 }
 
 static void cf_check init_amd(struct cpuinfo_x86 *c)
@@ -1297,7 +1314,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		disable_c1_ramping();
 
 	amd_check_zenbleed();
-	amd_check_erratum_1485();
+	amd_check_bp_cfg();
 
 	if (fam17_c6_disabled)
 		fam17_disable_c6(NULL);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b262566..83fbf4135c6b 100644
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
index 72347ef2b959..077225418956 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -90,6 +90,7 @@ extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
+extern bool opt_bp_spec_reduce;
 
 /*
  * The L1D address mask, which might be wider than reported in CPUID, and the
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 40f6ae017010..7aabb65ba028 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -83,6 +83,7 @@ static bool __initdata opt_unpriv_mmio;
 static bool __ro_after_init opt_verw_mmio;
 static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
+bool __ro_after_init opt_bp_spec_reduce = true;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -143,6 +144,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_unpriv_mmio = false;
             opt_gds_mit = 0;
             opt_div_scrub = 0;
+            opt_bp_spec_reduce = false;
         }
         else if ( val > 0 )
             rc = -EINVAL;
@@ -363,6 +365,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_gds_mit = val;
         else if ( (val = parse_boolean("div-scrub", s, ss)) >= 0 )
             opt_div_scrub = val;
+        else if ( (val = parse_boolean("bp-spec-reduce", s, ss)) >= 0 )
+            opt_bp_spec_reduce = val;
         else
             rc = -EINVAL;
 
@@ -505,7 +509,7 @@ static void __init print_details(enum ind_thunk thunk)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
            (caps & ARCH_CAPS_EIBRS)                          ? " EIBRS"          : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
@@ -529,10 +533,11 @@ static void __init print_details(enum ind_thunk thunk)
            (e8b  & cpufeat_mask(X86_FEATURE_BTC_NO))         ? " BTC_NO"         : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB_RET))       ? " IBPB_RET"       : "",
            (e21a & cpufeat_mask(X86_FEATURE_IBPB_BRTYPE))    ? " IBPB_BRTYPE"    : "",
-           (e21a & cpufeat_mask(X86_FEATURE_SRSO_NO))        ? " SRSO_NO"        : "");
+           (e21a & cpufeat_mask(X86_FEATURE_SRSO_NO))        ? " SRSO_NO"        : "",
+           (e21a & cpufeat_mask(X86_FEATURE_SRSO_US_NO))     ? " SRSO_US_NO"     : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS)) ||
@@ -551,7 +556,8 @@ static void __init print_details(enum ind_thunk thunk)
            (caps & ARCH_CAPS_FB_CLEAR_CTRL)                  ? " FB_CLEAR_CTRL"  : "",
            (caps & ARCH_CAPS_GDS_CTRL)                       ? " GDS_CTRL"       : "",
            (caps & ARCH_CAPS_RFDS_CLEAR)                     ? " RFDS_CLEAR"     : "",
-           (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "");
+           (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "",
+           (e21a & cpufeat_mask(X86_FEATURE_SRSO_MSR_FIX))   ? " SRSO_MSR_FIX"   : "");
 
     /* Compiled-in support which pertains to mitigations. */
     if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) ||
@@ -1120,7 +1126,7 @@ static void __init div_calculations(bool hw_smt_enabled)
 
 static void __init ibpb_calculations(void)
 {
-    bool def_ibpb_entry = false;
+    bool def_ibpb_entry_pv = false, def_ibpb_entry_hvm = false;
 
     /* Check we have hardware IBPB support before using it... */
     if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
@@ -1145,22 +1151,41 @@ static void __init ibpb_calculations(void)
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
index d9eba5e9a714..9c98e4992861 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -312,7 +312,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
 XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
 XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
-XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A! Hardware not vulnerable to SRSO across the User/Supervisor boundary */
+XEN_CPUFEATURE(SRSO_MSR_FIX,       11*32+31) /*   MSR_BP_CFG.BP_SPEC_REDUCE available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */

base-commit: 43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e
-- 
2.39.2


