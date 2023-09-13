Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24379F2D4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601586.937659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTL-0005xr-T5; Wed, 13 Sep 2023 20:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601586.937659; Wed, 13 Sep 2023 20:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTL-0005v5-Mi; Wed, 13 Sep 2023 20:28:27 +0000
Received: by outflank-mailman (input) for mailman id 601586;
 Wed, 13 Sep 2023 20:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTJ-0004yg-UM
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15412c50-5274-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 22:28:23 +0200 (CEST)
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
X-Inumbo-ID: 15412c50-5274-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Uh1DvjUFaFWcf8oaS6mdJk87ZcViax08R9IgITT/VU=;
  b=XMNdKkEffjgAfXJXib7+MVRpcYUavQSHTykGpCrmuBYLRRXLZjzQuws6
   cvgXZu/Yh7Nhl198BMuuwNPgp7wgTkbXWUMnvzw0GnS3QzFGKVligb7Wu
   b09MTW+PJb9cToefyXNRhmOLTRfL60tZtMNc5r64qOoG5hjWvBaxkaTx5
   A=;
X-CSE-ConnectionGUID: OTY/1Nd8T/+vvQCCeXLd1A==
X-CSE-MsgGUID: C11+nIAcQkOzLcw8YJc38g==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213282
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:mbX+UKxiLCk3CFAANtF6t+chxirEfRIJ4+MujC+fZmUNrF6WrkVUz
 GdNDG2Ab/mIMGWjfdt1atm2oE5VscfTnd81GgE5rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKsT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUZyx
 LtBDjxdUlfAmfyP65m2es1g3+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPxxzB/
 TiWpQwVBDkxbYXczxus+Uuvof3rljyraaAZT+23o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0clWR5DFC0Js+Wk458ttznkQ+ZHHPec24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9A4DNJWfh0B3iM4ldjBO
 RW7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHWoH81PRbMgT2zwSDAdJ3T3
 r/BLa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmrflY5QDx4W6+JqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:aArYoqFfQ+SCHEtQpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AKoX2Y2kUoehyM3vgS5IWtFX+hyHXOVrh/TCJBUP?=
 =?us-ascii?q?oNSEqVqOsYnSdyIdoyuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ArPcumw8rV7iMmZ8qEZUM9OiQf+wxuueoKWkGqJY?=
 =?us-ascii?q?hqe2PKnxBGTzG3DviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213282"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Date: Wed, 13 Sep 2023 21:27:58 +0100
Message-ID: <20230913202758.508225-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In the Zen1 microarchitecure, there is one divider in the pipeline which
services uops from both threads.  In the case of #DE, the latched result from
the previous DIV to execute will be forwarded speculatively.

This is an interesting covert channel that allows two threads to communicate
without any system calls.  In also allows userspace to obtain the result of
the most recent DIV instruction executed (even speculatively) in the core,
which can be from a higher privilege context.

Scrub the buffers in the divider unit by executing a non-faulting divide.
This needs performing on the exit-to-guest paths, and ist_exit-to-Xen.

This is XSA-439 / CVE-2023-20588.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

No embargo - this is already public.  XSA paperwork to follow.
---
 docs/misc/xen-command-line.pandoc        |  6 +++-
 xen/arch/x86/hvm/svm/entry.S             |  1 +
 xen/arch/x86/include/asm/cpufeatures.h   |  2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 16 +++++++++
 xen/arch/x86/spec_ctrl.c                 | 45 ++++++++++++++++++++++--
 5 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f88e6a70aed6..7acd68885656 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2353,7 +2353,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {msr-sc,rsb,md-clear,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
->              unpriv-mmio,gds-mit}=<bool> ]`
+>              unpriv-mmio,gds-mit,div-scrub}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2475,6 +2475,10 @@ has elected not to lock the configuration, Xen will use GDS_CTRL to mitigate
 GDS with.  Otherwise, Xen will mitigate by disabling AVX, which blocks the use
 of the AVX2 Gather instructions.
 
+On all hardware, the `div-scrub=` option can be used to force or prevent Xen
+from mitigating the DIV-leakage vulnerability.  By default, Xen will mitigate
+DIV-leakage on hardware believed to be vulnerable.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 9effd2199ba0..c52528fed4cf 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -72,6 +72,7 @@ __UNLIKELY_END(nsvm_hap)
 1:          /* No Spectre v1 concerns.  Execution will hit VMRUN imminently. */
         .endm
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 
         pop  %r15
         pop  %r14
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index da0593de8542..724de2e11db4 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -35,7 +35,7 @@ XEN_CPUFEATURE(SC_RSB_HVM,        X86_SYNTH(19)) /* RSB overwrite needed for HVM
 XEN_CPUFEATURE(XEN_SELFSNOOP,     X86_SYNTH(20)) /* SELFSNOOP gets used by Xen itself */
 XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* Clear MSR_SPEC_CTRL on idle */
 XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL.LBR */
-/* Bits 23 unused. */
+XEN_CPUFEATURE(SC_DIV,            X86_SYNTH(25)) /* DIV scrub needed */
 XEN_CPUFEATURE(SC_RSB_IDLE,       X86_SYNTH(24)) /* RSB overwrite needed for idle. */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 9740697114ad..10e57780f08b 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -165,6 +165,18 @@
 .L\@_verw_skip:
 .endm
 
+.macro DO_SPEC_CTRL_DIV
+/*
+ * Requires nothing
+ * Clobbers %rax
+ *
+ * Issue a DIV for its flushing side effect (Zen1 uarch specific).  Any
+ * non-faulting DIV will do, and a byte DIV has least latency.
+ */
+    mov $1, %eax
+    div %al
+.endm
+
 .macro DO_SPEC_CTRL_ENTRY maybexen:req
 /*
  * Requires %rsp=regs (also cpuinfo if !maybexen)
@@ -267,6 +279,8 @@
     ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV
 
     DO_SPEC_CTRL_COND_VERW
+
+    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 .endm
 
 /*
@@ -378,6 +392,8 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
 .L\@_verw_skip:
 
+    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
+
 .L\@_skip_ist_exit:
 .endm
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 9b8fdb5303ad..5332dba3f659 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -67,6 +67,7 @@ static int8_t __initdata opt_srb_lock = -1;
 static bool __initdata opt_unpriv_mmio;
 static bool __ro_after_init opt_fb_clear_mmio;
 static int8_t __initdata opt_gds_mit = -1;
+static int8_t __initdata opt_div_scrub = -1;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -121,6 +122,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_srb_lock = 0;
             opt_unpriv_mmio = false;
             opt_gds_mit = 0;
+            opt_div_scrub = 0;
         }
         else if ( val > 0 )
             rc = -EINVAL;
@@ -273,6 +275,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_unpriv_mmio = val;
         else if ( (val = parse_boolean("gds-mit", s, ss)) >= 0 )
             opt_gds_mit = val;
+        else if ( (val = parse_boolean("div-scrub", s, ss)) >= 0 )
+            opt_div_scrub = val;
         else
             rc = -EINVAL;
 
@@ -473,7 +477,7 @@ static void __init print_details(enum ind_thunk thunk)
                "\n");
 
     /* Settings for Xen's protection, irrespective of guests. */
-    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s\n",
+    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s%s\n",
            thunk == THUNK_NONE      ? "N/A" :
            thunk == THUNK_RETPOLINE ? "RETPOLINE" :
            thunk == THUNK_LFENCE    ? "LFENCE" :
@@ -498,7 +502,8 @@ static void __init print_details(enum ind_thunk thunk)
            opt_l1d_flush                             ? " L1D_FLUSH" : "",
            opt_md_clear_pv || opt_md_clear_hvm ||
            opt_fb_clear_mmio                         ? " VERW"  : "",
-           opt_branch_harden                         ? " BRANCH_HARDEN" : "");
+           opt_branch_harden                         ? " BRANCH_HARDEN" : "",
+           opt_div_scrub                             ? " DIV" : "");
 
     /* L1TF diagnostics, printed if vulnerable or PV shadowing is in use. */
     if ( cpu_has_bug_l1tf || opt_pv_l1tf_hwdom || opt_pv_l1tf_domu )
@@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_enabled)
         setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
 }
 
+/*
+ * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP as a
+ * heuristic to select between Zen1 and Zen2 uarches.
+ */
+static bool __init has_div_vuln(void)
+{
+    if ( !(boot_cpu_data.x86_vendor &
+           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        return false;
+
+    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
+        return false;
+
+    return true;
+}
+
+static void __init div_calculations(bool hw_smt_enabled)
+{
+    bool cpu_bug_div = has_div_vuln();
+
+    if ( opt_div_scrub == -1 )
+        opt_div_scrub = cpu_bug_div;
+
+    if ( opt_div_scrub )
+        setup_force_cpu_cap(X86_FEATURE_SC_DIV);
+
+    if ( opt_smt == -1 && cpu_bug_div && hw_smt_enabled )
+        warning_add(
+            "Booted on leaky-DIV hardware with SMT/Hyperthreading\n"
+            "enabled.  Please assess your configuration and choose an\n"
+            "explicit 'smt=<bool>' setting.  See XSA-439.\n");
+}
+
 static void __init ibpb_calculations(void)
 {
     bool def_ibpb_entry = false;
@@ -1714,6 +1753,8 @@ void __init init_speculation_mitigations(void)
 
     ibpb_calculations();
 
+    div_calculations(hw_smt_enabled);
+
     /* Check whether Eager FPU should be enabled by default. */
     if ( opt_eager_fpu == -1 )
         opt_eager_fpu = should_use_eager_fpu();
-- 
2.30.2


