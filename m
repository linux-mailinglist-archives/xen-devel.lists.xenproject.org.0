Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7897A21AB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603215.940206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJd-0006gY-N6; Fri, 15 Sep 2023 15:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603215.940206; Fri, 15 Sep 2023 15:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJd-0006Tc-EQ; Fri, 15 Sep 2023 15:01:05 +0000
Received: by outflank-mailman (input) for mailman id 603215;
 Fri, 15 Sep 2023 15:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJb-0004UV-8R
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:01:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6378ef-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:01:01 +0200 (CEST)
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
X-Inumbo-ID: ae6378ef-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G13uxDI+Vf2EUoeXWUQgkocQAX3E/eken8QVmw9pr80=;
  b=CtnVVfzePCFH5UK/W9icaPHtFN1rgv6w1SJwlnEZmaCX0AnVaPDsDo4j
   7aS8mS9HIH8MX2adzgG4shfC2dZFXdgDY5qcDYBeihzZtmruwmX+dPjLk
   yqjDvwS9+UI9V5Vn63esuhZMVtOgwlm+oVqceT7dO3z7S5bX43YTJqgdt
   k=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: 2jZM/k87SiyEhEWEqg5jag==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509281
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:H+M9LKlYZ4uTeowJepNbCnzo5gyeJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaXzuPbKnbZDD9KItwa47no0pVvJHSmN9kGgJsri0wECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqga5QKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cBGbx8NXhGEvdm7nomVS7V335h/D/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/C+
 z+erj6pW3n2MvTFywigtXH82dTOjA77db0/DbLl9Pdl1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewc4E0wq4+nip7sIg0z0YNc/C/fp0v7MTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umEWyKRBaJxsldrVj
 Kj74Fg52XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8/ORfJhjy9yBNwycnT3
 Kt3l+72XR727ow9kFKLqxo1i+d3lkjSO0uMLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 r5i2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5mu95IdY8zv4Exo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOiHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:mA6Q+KG1BoxfIOWopLqEx8eALOsnbusQ8zAXPiFKOH5om6mj/a
 2TdZsguSMc5Ax/ZJhYo6HkBEDYewK5yXcX2/hzAV7BZmjbUQKTRekI0WKF+UyHJ8SUzI5gPM
 lbHZSWR+eAamSTfqzBkXCF+q4bsaO6GVeT9JrjJ88Gd3AQV0jI1XYANjqm
X-Talos-CUID: 9a23:YP5kG24hxNP8CAXtA9ssyBBTNcAVc3rn93qOGGG5VX0wFOG2cArF
X-Talos-MUID: =?us-ascii?q?9a23=3A7hQ8sA1Wewob9y7Up/v59lNonzUjuaacLQcOwco?=
 =?us-ascii?q?9utipNQFPFi6S0Ta+Tdpy?=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509281"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 9/9] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Date: Fri, 15 Sep 2023 16:00:38 +0100
Message-ID: <20230915150038.602577-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
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

Scrub the result from the divider by executing a non-faulting divide.  This
needs performing on the exit-to-guest paths, and ist_exit-to-Xen.

This is XSA-439 / CVE-2023-20588.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

No embargo - this is already public.  XSA paperwork to follow.

v2:
 * Rebase over the introduction of is_zen1_uarch().
 * Fix the SC_DIV bit not to alias SC_VERW_IDLE.
 * Extend comments.
---
 docs/misc/xen-command-line.pandoc        |  6 ++-
 xen/arch/x86/hvm/svm/entry.S             |  1 +
 xen/arch/x86/include/asm/cpufeatures.h   |  2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 17 ++++++++
 xen/arch/x86/spec_ctrl.c                 | 49 +++++++++++++++++++++++-
 5 files changed, 72 insertions(+), 3 deletions(-)

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
index da0593de8542..c3aad21c3b43 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -35,7 +35,7 @@ XEN_CPUFEATURE(SC_RSB_HVM,        X86_SYNTH(19)) /* RSB overwrite needed for HVM
 XEN_CPUFEATURE(XEN_SELFSNOOP,     X86_SYNTH(20)) /* SELFSNOOP gets used by Xen itself */
 XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* Clear MSR_SPEC_CTRL on idle */
 XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL.LBR */
-/* Bits 23 unused. */
+XEN_CPUFEATURE(SC_DIV,            X86_SYNTH(23)) /* DIV scrub needed */
 XEN_CPUFEATURE(SC_RSB_IDLE,       X86_SYNTH(24)) /* RSB overwrite needed for idle. */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 9a27e3170347..5c5b3b6f5324 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -165,6 +165,19 @@
 .L\@_verw_skip:
 .endm
 
+.macro DO_SPEC_CTRL_DIV
+/*
+ * Requires nothing
+ * Clobbers %rax
+ *
+ * Issue a DIV for its flushing side effect (Zen1 uarch specific).  Any
+ * non-faulting DIV will do; a byte DIV has least latency, and doesn't clobber
+ * %rdx.
+ */
+    mov $1, %eax
+    div %al
+.endm
+
 .macro DO_SPEC_CTRL_ENTRY maybexen:req
 /*
  * Requires %rsp=regs (also cpuinfo if !maybexen)
@@ -267,6 +280,8 @@
     ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV
 
     DO_SPEC_CTRL_COND_VERW
+
+    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 .endm
 
 /*
@@ -379,6 +394,8 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
 .L\@_skip_verw:
 
+    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
+
 .L\@_skip_ist_exit:
 .endm
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 9b8fdb5303ad..4c510094498e 100644
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
@@ -498,6 +502,7 @@ static void __init print_details(enum ind_thunk thunk)
            opt_l1d_flush                             ? " L1D_FLUSH" : "",
            opt_md_clear_pv || opt_md_clear_hvm ||
            opt_fb_clear_mmio                         ? " VERW"  : "",
+           opt_div_scrub                             ? " DIV" : "",
            opt_branch_harden                         ? " BRANCH_HARDEN" : "");
 
     /* L1TF diagnostics, printed if vulnerable or PV shadowing is in use. */
@@ -955,6 +960,46 @@ static void __init srso_calculations(bool hw_smt_enabled)
         setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
 }
 
+/*
+ * The Div leakage issue is specific to the AMD Zen1 microarchitecure.
+ *
+ * However, there's no $FOO_NO bit defined, so if we're virtualised we have no
+ * hope of spotting the case where we might move to vulnerable hardware.  We
+ * also can't make any useful conclusion about SMT-ness.
+ *
+ * Don't check the hypervisor bit, so at least we do the safe thing when
+ * booting on something that looks like a Zen1 CPU.
+ */
+static bool __init has_div_vuln(void)
+{
+    if ( !(boot_cpu_data.x86_vendor &
+           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        return false;
+
+    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+         !is_zen1_uarch() )
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
+    if ( opt_smt == -1 && !cpu_has_hypervisor && cpu_bug_div && hw_smt_enabled )
+        warning_add(
+            "Booted on leaky-DIV hardware with SMT/Hyperthreading\n"
+            "enabled.  Please assess your configuration and choose an\n"
+            "explicit 'smt=<bool>' setting.  See XSA-439.\n");
+}
+
 static void __init ibpb_calculations(void)
 {
     bool def_ibpb_entry = false;
@@ -1714,6 +1759,8 @@ void __init init_speculation_mitigations(void)
 
     ibpb_calculations();
 
+    div_calculations(hw_smt_enabled);
+
     /* Check whether Eager FPU should be enabled by default. */
     if ( opt_eager_fpu == -1 )
         opt_eager_fpu = should_use_eager_fpu();
-- 
2.30.2


