Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F169F9A92
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 20:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861979.1273986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOila-0005iI-8p; Fri, 20 Dec 2024 19:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861979.1273986; Fri, 20 Dec 2024 19:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOila-0005gC-6F; Fri, 20 Dec 2024 19:34:30 +0000
Received: by outflank-mailman (input) for mailman id 861979;
 Fri, 20 Dec 2024 19:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tu4b=TN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tOilZ-0005fx-14
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 19:34:29 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4507cf-bf09-11ef-a0d9-8be0dac302b0;
 Fri, 20 Dec 2024 20:34:28 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4367239aa86so1165105e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 11:34:28 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847714sm4781098f8f.54.2024.12.20.11.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:34:26 -0800 (PST)
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
X-Inumbo-ID: 6d4507cf-bf09-11ef-a0d9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734723267; x=1735328067; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mky7eLb3n5mZ2068+P/iwev5K4JT9Bq7pfyqahXFqws=;
        b=KUv60qPea2g/ZajgkDr8ibLWxSB7uRB4iw7qoS5WaBwcs+wLJ+5/2tycSuVEQxCU9P
         L7ZfOns43bqkcp8APRcNXB1b2n6dsHU9oolflsxMOnNSNOo9XmtnFlaHrBufXhJsoHyJ
         LyfDgjoW4F3vmQ75zGdYtzf7HHJnFPNz2+/wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734723267; x=1735328067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mky7eLb3n5mZ2068+P/iwev5K4JT9Bq7pfyqahXFqws=;
        b=XyAIfxcavUmVWzWzQp+GRR/EHYMc1b/6d7lg7u+xXgbQJKVLSs2R7F9+PFI8JGLNiu
         rVFavlSFnfT5VHDkcMv+DczoRMCOESL4LKQ5pFNINkan8DGpn7IsGttEgdPshrfFFaJx
         k64eHXpAGn4UrDWhfsSlaQC/C0enIfBYs8SkxK4DHuu0sqScGX1XIEQZMHdQv4K8cPCO
         6RgLvIkI6/jubuyIm1Of+NQJHbyF06PBp4g5Bh++MdA8ES1D5s4vkanAT/7UiEkoA2Vc
         qYir5cUeyEotJ+qapqV2xxdoLi9LfnHXwYhuU5i7PvOmwu1x2+uVxknTFaN5n1lCdYf7
         /oDw==
X-Gm-Message-State: AOJu0Yw1tfiChsREOLPDFgl1IVofU55/Tts7XmksSBxnGopX89GGwaL0
	rTQZcVe1qwRXOvzue5T4oHws6DQJY9RVqKOr6/MBl9PFexTmJjjhNmskCHCbHkHk2JA4RnS+fb3
	48dp4aA==
X-Gm-Gg: ASbGnctc7n+55Pk0drPvw9jKTcwH2VROoGEFgIYElZv88zRuc7KhCaOPdtGyBnhzSgW
	E4xZJTdUNfYAWrfANLJkdFU9kwGto6cOb1814cYZlB7/EpRVZmELg8M0RYmB9JHC3UDj4rZaGlC
	Hk2HkGUBVt7znwdP9F4P/cOntqFXMWByweubRq7mXZSfPGOJs7CigAbOg5qCrW7szfqT/0Z64/0
	7UVjzei7Zz7Q3Y04Pgkanb6JDuScTt+3Mz2K//87AwKk1ernWxveE447DfIWFOAF+/2hdoiaUJF
	3wIIlqL/5DiOcgBtns4fKD3EoC7AuqKqCG4E
X-Google-Smtp-Source: AGHT+IGB9M9mglklY9PuZn5OXTekzNIUwwTZ41byV4I7Qdfq/Jx4fWH+yX9uO2RDhBNixj9alu5DPQ==
X-Received: by 2002:a5d:584d:0:b0:386:3918:16cd with SMTP id ffacd0b85a97d-38a224034d2mr3994827f8f.59.1734723267011;
        Fri, 20 Dec 2024 11:34:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3] x86/spec-ctrl: Support for SRSO_U/S_NO and SRSO_MSR_FIX
Date: Fri, 20 Dec 2024 19:34:24 +0000
Message-Id: <20241220193424.470994-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AMD have updated the SRSO whitepaper[1] with further information.  These
features exist on AMD Zen5 CPUs and are necessary for Xen to use.

The two features are in principle unrelated:

 * SRSO_U/S_NO is an enumeration saying that SRSO attacks can't cross the
   User(CPL3) / Supervisor(CPL<3) boundary.  i.e. Xen don't need to use
   IBPB-on-entry for PV64.  PV32 guests are explicitly unsupported for
   speculative issues, and excluded from consideration for simplicity.

 * SRSO_MSR_FIX is an enumeration identifying that the BP_SPEC_REDUCE bit is
   available in MSR_BP_CFG.  When set, SRSO attacks can't cross the host/guest
   boundary.  i.e. Xen don't need to use IBPB-on-entry for HVM.

Extend ibpb_calculations() to account for these when calculating
opt_ibpb_entry_{pv,hvm} defaults.  Add a `bp-spec-reduce=<bool>` option to
control the use of BP_SPEC_REDUCE, with it active by default.

Because MSR_BP_CFG is core-scoped with a race condition updating it, repurpose
amd_check_erratum_1485() into amd_check_bp_cfg() and calculate all updates at
once.

Xen also needs to to advertise SRSO_U/S_NO to guests to allow the guest kernel
to skip SRSO mitigations too:

 * This is trivial for HVM guests.  It is also is accurate for PV32 guests
   too, but we have already excluded them from consideration, and do so again
   here to simplify the policy logic.

 * As written, SRSO_U/S_NO does not help for the PV64 user->kernel boundary.
   However, after discussing with AMD, an implementation detail of having
   BP_SPEC_REDUCE active causes the PV64 user->kernel boundary to have the
   property described by SRSO_U/S_NO, so we can advertise SRSO_U/S_NO to
   guests when the BP_SPEC_REDUCE precondition is met.

Finally, fix a typo in the SRSO_NO's comment.

[1] https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I cannot say anything more about the SRSO_U/S_NO vs SRSO_MSR_FIX interactions
in public.  The safety for PV guests depends on details not covered in the
whitepaper.

v3:
 * Rewrite commit message and comments quite a lot.

This patch was originally for-4.19.  Zen5 CPUs are now in the world and Xen is
unsafe on them without this patch.

I technically have enough tags to commit it, and it's long overdue, but I
think it would be wise to see if the new wording is clearer to others.
---
 docs/misc/xen-command-line.pandoc           |  9 +++-
 xen/arch/x86/cpu-policy.c                   | 21 +++++++++
 xen/arch/x86/cpu/amd.c                      | 29 +++++++++---
 xen/arch/x86/include/asm/msr-index.h        |  1 +
 xen/arch/x86/include/asm/spec_ctrl.h        |  1 +
 xen/arch/x86/spec_ctrl.c                    | 51 ++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  4 +-
 7 files changed, 96 insertions(+), 20 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dd8f714d3a2..08b0053f9ced 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2456,7 +2456,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
->              bhi-dis-s}=<bool> ]`
+>              bhi-dis-s,bp-spec-reduce}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2605,6 +2605,13 @@ boolean can be used to force or prevent Xen from using speculation barriers to
 protect lock critical regions.  This mitigation won't be engaged by default,
 and needs to be explicitly enabled on the command line.
 
+On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
+to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
+SRSO (Speculative Return Stack Overflow) vulnerability.  Xen will use
+bp-spec-reduce when available, as it is preferable to using `ibpb-entry=hvm`
+to mitigate SRSO for HVM guests, and because it is a prerequisite to advertise
+SRSO_U/S_NO to PV guests.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 78bc9872b09a..2e8a5ecb5e7b 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -14,6 +14,7 @@
 #include <asm/msr-index.h>
 #include <asm/paging.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 #include <asm/xstate.h>
 
 struct cpu_policy __read_mostly       raw_cpu_policy;
@@ -625,6 +626,26 @@ static void __init calculate_pv_max_policy(void)
         __clear_bit(X86_FEATURE_IBRS, fs);
     }
 
+    /*
+     * SRSO_U/S_NO means that the CPU is not vulnerable to SRSO attacks across
+     * the User (CPL3)/Supervisor (CPL<3) boundary.
+     *
+     * PV32 guests are unsupported for speculative issues, and excluded from
+     * consideration for simplicity.
+     *
+     * The PV64 user/kernel boundary is CPL3 on both sides, so SRSO_U/S_NO
+     * won't convey the meaning that a PV kernel expects.
+     *
+     * After discussions with AMD, an implementation detail of having
+     * BP_SPEC_REDUCE active causes the PV64 user/kernel boundary to have a
+     * property compatible with the meaning of SRSO_U/S_NO.
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
index 7da04230393a..597b0f073d55 100644
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
+	 *
+	 * 1) Avoid IBPB-on-entry to mitigate SRSO attacks from HVM guests.
+	 * 2) Advertise SRSO_US_NO to PV guests.
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
index 9cdb5b262566..22d9e76e5521 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -412,6 +412,7 @@
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
 #define MSR_AMD64_EX_CFG		0xc001102cU
 #define MSR_AMD64_BP_CFG		0xc001102eU
+#define  BP_CFG_SPEC_REDUCE		(_AC(1, ULL) <<  4)
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
index 75a4177a75d2..ced84750015c 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -83,6 +83,7 @@ static bool __initdata opt_unpriv_mmio;
 static bool __ro_after_init opt_verw_mmio;
 static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
+bool __ro_after_init opt_bp_spec_reduce = true;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -145,6 +146,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_unpriv_mmio = false;
             opt_gds_mit = 0;
             opt_div_scrub = 0;
+            opt_bp_spec_reduce = false;
         }
         else if ( val > 0 )
             rc = -EINVAL;
@@ -365,6 +367,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_gds_mit = val;
         else if ( (val = parse_boolean("div-scrub", s, ss)) >= 0 )
             opt_div_scrub = val;
+        else if ( (val = parse_boolean("bp-spec-reduce", s, ss)) >= 0 )
+            opt_bp_spec_reduce = val;
         else
             rc = -EINVAL;
 
@@ -507,7 +511,7 @@ static void __init print_details(enum ind_thunk thunk)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
            (caps & ARCH_CAPS_EIBRS)                          ? " EIBRS"          : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
@@ -531,10 +535,11 @@ static void __init print_details(enum ind_thunk thunk)
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
@@ -553,7 +558,8 @@ static void __init print_details(enum ind_thunk thunk)
            (caps & ARCH_CAPS_FB_CLEAR_CTRL)                  ? " FB_CLEAR_CTRL"  : "",
            (caps & ARCH_CAPS_GDS_CTRL)                       ? " GDS_CTRL"       : "",
            (caps & ARCH_CAPS_RFDS_CLEAR)                     ? " RFDS_CLEAR"     : "",
-           (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "");
+           (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "",
+           (e21a & cpufeat_mask(X86_FEATURE_SRSO_MSR_FIX))   ? " SRSO_MSR_FIX"   : "");
 
     /* Compiled-in support which pertains to mitigations. */
     if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) ||
@@ -1113,7 +1119,7 @@ static void __init div_calculations(bool hw_smt_enabled)
 
 static void __init ibpb_calculations(void)
 {
-    bool def_ibpb_entry = false;
+    bool def_ibpb_entry_pv = false, def_ibpb_entry_hvm = false;
 
     /* Check we have hardware IBPB support before using it... */
     if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
@@ -1138,22 +1144,43 @@ static void __init ibpb_calculations(void)
          * Confusion.  Mitigate with IBPB-on-entry.
          */
         if ( !boot_cpu_has(X86_FEATURE_BTC_NO) )
-            def_ibpb_entry = true;
+            def_ibpb_entry_pv = def_ibpb_entry_hvm = true;
 
         /*
-         * Further to BTC, Zen3/4 CPUs suffer from Speculative Return Stack
-         * Overflow in most configurations.  Mitigate with IBPB-on-entry if we
-         * have the microcode that makes this an effective option.
+         * In addition to BTC, Zen3 and later CPUs suffer from Speculative
+         * Return Stack Overflow in most configurations.  If we have microcode
+         * that makes IBPB-on-entry an effective mitigation, see about using
+         * it.
          */
         if ( !boot_cpu_has(X86_FEATURE_SRSO_NO) &&
              boot_cpu_has(X86_FEATURE_IBPB_BRTYPE) )
-            def_ibpb_entry = true;
+        {
+            /*
+             * SRSO_U/S_NO is a subset of SRSO_NO, identifying that SRSO isn't
+             * possible across the User (CPL3) / Supervisor (CPL<3) boundary.
+             *
+             * Ignoring PV32 (not security supported for speculative issues),
+             * this means we only need to use IBPB-on-entry for PV guests on
+             * hardware which doesn't enumerate SRSO_US_NO.
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
index 8fa3fb711a8d..16207e3817bb 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -325,7 +325,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
 XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
 XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
-XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
+XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A! Hardware not vulnerable to SRSO across the User/Supervisor boundary */
+XEN_CPUFEATURE(SRSO_MSR_FIX,       11*32+31) /*   MSR_BP_CFG.BP_SPEC_REDUCE available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
-- 
2.39.5


