Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8364DB21A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 15:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291206.494114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUUCw-0004BK-QR; Wed, 16 Mar 2022 14:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291206.494114; Wed, 16 Mar 2022 14:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUUCw-00049J-NS; Wed, 16 Mar 2022 14:00:58 +0000
Received: by outflank-mailman (input) for mailman id 291206;
 Wed, 16 Mar 2022 14:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUUCv-00049D-Rf
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 14:00:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e743842-a531-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 15:00:55 +0100 (CET)
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
X-Inumbo-ID: 7e743842-a531-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647439255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TVpTXaf+woNqce4s8oOkHm8+irO56d3CPGK/X51t9WA=;
  b=SWZidK3WBazgQbbNHyPVTyz6tTUvQKzQ4RMQwefn2zS0xQ3+WKBV4eu0
   Lt5InZHhvAHyEfxAc+1YLRz/BB+JbGDFUPcBslGOIciAlbCszA4JdJ9UC
   lOMMsoN4mfToGnnSJU8J87yf6doB+pxy0ffN/7Wi6vtITPgLOTD7Qe8zN
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65858839
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Tk6c2qmHenlXD82VfxQECXzo5gyEJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaC2vVbKrbYzf8Kdh+YIy0phlX78XWztFiSAdrrXtmESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWl3V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRQACYoeUt+onSxhfMQJjFLVUoZPmCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGoyPESbMnWjPH9PGJsburihoUXlahMbqUm7lY4l4lrqmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHP61xCeB83msrvTShi69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwA2K4fb+uymXPHAFSRxidfU+ppYaZBV/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmqm
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDFtIji6rnXyESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpbI26zO
 RWD4FkLjHO2AJdMRfQuC25WI552pZUM6Py/DqyEBjawSsUZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVKfA5QciRjW8yeRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:TVSLvKpoau7gmc8JFqODGlEaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.90,186,1643691600"; 
   d="scan'208";a="65858839"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Knobs for STIBP and PSFD, and follow hardware STIBP hint
Date: Wed, 16 Mar 2022 14:00:35 +0000
Message-ID: <20220316140035.32057-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

STIBP and PSFD are slightly weird bits, because they're both implied by other
bits in MSR_SPEC_CTRL.  Add fine grain controls for them, and take the
implications into account when setting IBRS/SSBD.

Rearrange the IBPB text/variables/logic to keep all the MSR_SPEC_CTRL bits
together, for consistency.

However, AMD have a hardware hint CPUID bit recommending that STIBP be set
uniaterally.  This is advertised on Zen3, so follow the recommendation.  This
is the only default change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc | 20 +++++++++----
 xen/arch/x86/spec_ctrl.c          | 59 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca0706..6fa1fe97aeeb 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2254,8 +2254,8 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm,msr-sc,rsb,md-clear}=<bool>,
->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,eager-fpu,
->              l1d-flush,branch-harden,srb-lock}=<bool> ]`
+>              bti-thunk=retpoline|lfence|jmp, {ibrs,stibp,ssbd,psfd,ibpb,
+>              eager-fpu,l1d-flush,branch-harden,srb-lock}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2306,9 +2306,10 @@ On hardware supporting IBRS (Indirect Branch Restricted Speculation), the
 If Xen is not using IBRS itself, functionality is still set up so IBRS can be
 virtualised for guests.
 
-On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
-option can be used to force (the default) or prevent Xen from issuing branch
-prediction barriers on vcpu context switches.
+On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
+`stibp=` option can be used to force or prevent Xen using the feature itself.
+By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
+when hardware hints recommend using it as a blanket setting.
 
 On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
 option can be used to force or prevent Xen using the feature itself.  On AMD
@@ -2316,6 +2317,15 @@ hardware, this is a global option applied at boot, and not virtualised for
 guest use.  On Intel hardware, the feature is virtualised for guests,
 independently of Xen's choice of setting.
 
+On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
+option can be used to force or prevent Xen using the feature itself.  By
+default, Xen will not use PSFD.  PSFD is implied by SSBD, and SSBD is off by
+default.
+
+On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
+option can be used to force (the default) or prevent Xen from issuing branch
+prediction barriers on vcpu context switches.
+
 On all hardware, the `eager-fpu=` option can be used to force or prevent Xen
 from using fully eager FPU context switches.  This is currently implemented as
 a global control.  By default, Xen will choose to use fully eager context
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7abd0..446b62486447 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -48,9 +48,13 @@ static enum ind_thunk {
     THUNK_LFENCE,
     THUNK_JMP,
 } opt_thunk __initdata = THUNK_DEFAULT;
+
 static int8_t __initdata opt_ibrs = -1;
+int8_t __initdata opt_stibp = -1;
+bool __read_mostly opt_ssbd;
+int8_t __initdata opt_psfd = -1;
+
 bool __read_mostly opt_ibpb = true;
-bool __read_mostly opt_ssbd = false;
 int8_t __read_mostly opt_eager_fpu = -1;
 int8_t __read_mostly opt_l1d_flush = -1;
 static bool __initdata opt_branch_harden = true;
@@ -170,12 +174,18 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             else
                 rc = -EINVAL;
         }
+
         else if ( (val = parse_boolean("ibrs", s, ss)) >= 0 )
             opt_ibrs = val;
-        else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
-            opt_ibpb = val;
+        else if ( (val = parse_boolean("stibp", s, ss)) >= 0 )
+            opt_stibp = val;
         else if ( (val = parse_boolean("ssbd", s, ss)) >= 0 )
             opt_ssbd = val;
+        else if ( (val = parse_boolean("psfd", s, ss)) >= 0 )
+            opt_psfd = val;
+
+        else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
+            opt_ibpb = val;
         else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
             opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
@@ -367,7 +377,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
                "\n");
 
     /* Settings for Xen's protection, irrespective of guests. */
-    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s, Other:%s%s%s%s%s\n",
+    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s\n",
            thunk == THUNK_NONE      ? "N/A" :
            thunk == THUNK_RETPOLINE ? "RETPOLINE" :
            thunk == THUNK_LFENCE    ? "LFENCE" :
@@ -381,6 +391,9 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (!boot_cpu_has(X86_FEATURE_SSBD) &&
             !boot_cpu_has(X86_FEATURE_AMD_SSBD))     ? "" :
            (default_xen_spec_ctrl & SPEC_CTRL_SSBD)  ? " SSBD+" : " SSBD-",
+           (!boot_cpu_has(X86_FEATURE_PSFD) &&
+            !boot_cpu_has(X86_FEATURE_INTEL_PSFD))   ? "" :
+           (default_xen_spec_ctrl & SPEC_CTRL_PSFD)  ? " PSFD+" : " PSFD-",
            !(caps & ARCH_CAPS_TSX_CTRL)              ? "" :
            (opt_tsx & 1)                             ? " TSX+" : " TSX-",
            !cpu_has_srbds_ctrl                       ? "" :
@@ -1070,12 +1083,50 @@ void __init init_speculation_mitigations(void)
 
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
+    {
+        /* IBRS implies STIBP.  */
+        if ( opt_stibp == -1 )
+            opt_stibp = 1;
+
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
+    }
+
+    /* Use STIBP by default if the hardware hint is set. */
+    if ( opt_stibp == -1 && boot_cpu_has(X86_FEATURE_STIBP_ALWAYS) )
+        opt_stibp = 1;
+
+    /*
+     * Otherwise, don't use STIBP by default.  It has some severe performance
+     * implications on older hardware.
+     */
+    if ( opt_stibp == -1 )
+        opt_stibp = 0;
+
+    if ( opt_stibp && (boot_cpu_has(X86_FEATURE_STIBP) ||
+                       boot_cpu_has(X86_FEATURE_AMD_STIBP)) )
+        default_xen_spec_ctrl |= SPEC_CTRL_STIBP;
 
     /* If we have SSBD available, see whether we should use it. */
     if ( opt_ssbd && (boot_cpu_has(X86_FEATURE_SSBD) ||
                       boot_cpu_has(X86_FEATURE_AMD_SSBD)) )
+    {
+        /* SSBD implies PSFD */
+        if ( opt_psfd == -1 )
+            opt_psfd = 1;
+
         default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
+    }
+
+    /*
+     * Don't use PSFD by default.  AMD designed the predictor to auto-clear on
+     * privilege change.  PSFD is implied by SSBD, which is off by default.
+     */
+    if ( opt_psfd == -1 )
+        opt_psfd = 0;
+
+    if ( opt_psfd && (boot_cpu_has(X86_FEATURE_PSFD) ||
+                      boot_cpu_has(X86_FEATURE_INTEL_PSFD)) )
+        default_xen_spec_ctrl |= SPEC_CTRL_PSFD;
 
     /*
      * PV guests can create RSB entries for any linear address they control,
-- 
2.11.0


