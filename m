Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5356098A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 20:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358037.587013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6chA-0001Ma-6i; Wed, 29 Jun 2022 18:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358037.587013; Wed, 29 Jun 2022 18:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6chA-0001Jq-3V; Wed, 29 Jun 2022 18:45:48 +0000
Received: by outflank-mailman (input) for mailman id 358037;
 Wed, 29 Jun 2022 18:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6b1=XE=citrix.com=prvs=172711fe8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o6ch8-0000mL-DY
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 18:45:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef34e82-f7db-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 20:45:45 +0200 (CEST)
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
X-Inumbo-ID: aef34e82-f7db-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656528344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qX8FoVKbQduGMZIO5wy6Y3hMntj7bH2XpUmWXTKnZfE=;
  b=Xl5F6iBj9dzNNlqAo6mdyWaT5evlDbIxLRVpzaw+u/5K0k5q0WInr4Ye
   RcCZVyDKhjnPdliG7nRvVIhlGfbHOnG6X/3Lm3goSVp6z2wh145cIXK9A
   QcHRnvfSR6dc1WX1lgGoddOpMQqcYv+8HDA9EwxorbDkKBrx/guRNbFKB
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74746993
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LnFTLKhXFEXqwBCtgDC0rNzsX161PxAKZh0ujC45NGQN5FlHY01je
 htvUTrQPKmDamf9fNx2YI+y90sEsZ7RzoJgTwJtpC03FCMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVnc4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT15MPDv3+IcajtBKCElMJJJypvoGEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xNmYwMEqRMkYn1lE/CMIlo8GYpkHDLQZBqljK9PoI42Hc5VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9im3mqSJwEGfB1EmVwVBM9EZu/0SagUTg
 wrhc8zSOdB/jFGEYSvDq+nJ9GLuZXF9wXwqPnFdE1ZcizX3iMRq10+UEI4+eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJGT9bxgbQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjYbmGA2AcxRMl8q1xBHkJPm6gJsVmSw285WvvohBezO
 BOD0e+vzMU70ISWgV9fPNvqVpVCIVnIHtX5TPHEBudzjmxKXFbfpklGPBfIt0i0yRREufxuY
 v+zLJfzZUv2/Iw6lVJasc9Gie91rs3/rEuOLa3GI+OPiuDOOC/FFe9YazNjrIkRtcu5nekcy
 P4HX+Pi9vmVeLSWjvX/mWLLEW03EA==
IronPort-HdrOrdr: A9a23:fA9MuajhUOLgsfO5aHKh7Ri6RHBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74746993"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] x86/spec-ctrl: Knobs for STIBP and PSFD, and follow hardware STIBP hint
Date: Wed, 29 Jun 2022 19:45:08 +0100
Message-ID: <20220629184508.15956-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220629184508.15956-1-andrew.cooper3@citrix.com>
References: <20220629184508.15956-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

STIBP and PSFD are slightly weird bits, because they're both implied by other
bits in MSR_SPEC_CTRL.  Add fine grain controls for them, and take the
implications into account when setting IBRS/SSBD.

Rearrange the IBPB text/variables/logic to keep all the MSR_SPEC_CTRL bits
together, for consistency.

However, AMD have a hardware hint CPUID bit recommending that STIBP be set
unilaterally.  This is advertised on Zen3, so follow the recommendation.
Furthermore, in such cases, set STIBP behind the guest's back for now.  This
has negligible overhead for the guest, but saves a WRMSR on vmentry.  This is
the only default change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Tweak comments/logic per suggestion.
 * Also set STIBP behind the guest's back to improve the vmentry path.
---
 docs/misc/xen-command-line.pandoc | 21 ++++++++++---
 xen/arch/x86/hvm/svm/vmcb.c       |  9 ++++++
 xen/arch/x86/spec_ctrl.c          | 65 +++++++++++++++++++++++++++++++++------
 3 files changed, 81 insertions(+), 14 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a92b7d228cae..da18172e50c5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2258,8 +2258,9 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm,msr-sc,rsb,md-clear}=<bool>,
->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,eager-fpu,
->              l1d-flush,branch-harden,srb-lock,unpriv-mmio}=<bool> ]`
+>              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
+>              eager-fpu,l1d-flush,branch-harden,srb-lock,
+>              unpriv-mmio}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2309,9 +2310,10 @@ On hardware supporting IBRS (Indirect Branch Restricted Speculation), the
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
@@ -2319,6 +2321,15 @@ hardware, this is a global option applied at boot, and not virtualised for
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
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 958309657799..0fc57dfd71cf 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -29,6 +29,7 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
+#include <asm/spec_ctrl.h>
 
 struct vmcb_struct *alloc_vmcb(void)
 {
@@ -176,6 +177,14 @@ static int construct_vmcb(struct vcpu *v)
             vmcb->_pause_filter_thresh = SVM_PAUSETHRESH_INIT;
     }
 
+    /*
+     * When default_xen_spec_ctrl simply SPEC_CTRL_STIBP, default this behind
+     * the back of the VM too.  Our SMT topology isn't accurate, the overhead
+     * is neglegable, and doing this saves a WRMSR on the vmentry path.
+     */
+    if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
+        v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 57f4fcb21398..efed24933d91 100644
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
@@ -172,12 +176,20 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             else
                 rc = -EINVAL;
         }
+
+        /* Bits in MSR_SPEC_CTRL. */
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
+        /* Misc settings. */
+        else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
+            opt_ibpb = val;
         else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
             opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
@@ -376,7 +388,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
                "\n");
 
     /* Settings for Xen's protection, irrespective of guests. */
-    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s, Other:%s%s%s%s%s\n",
+    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s\n",
            thunk == THUNK_NONE      ? "N/A" :
            thunk == THUNK_RETPOLINE ? "RETPOLINE" :
            thunk == THUNK_LFENCE    ? "LFENCE" :
@@ -390,6 +402,9 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (!boot_cpu_has(X86_FEATURE_SSBD) &&
             !boot_cpu_has(X86_FEATURE_AMD_SSBD))     ? "" :
            (default_xen_spec_ctrl & SPEC_CTRL_SSBD)  ? " SSBD+" : " SSBD-",
+           (!boot_cpu_has(X86_FEATURE_PSFD) &&
+            !boot_cpu_has(X86_FEATURE_INTEL_PSFD))   ? "" :
+           (default_xen_spec_ctrl & SPEC_CTRL_PSFD)  ? " PSFD+" : " PSFD-",
            !(caps & ARCH_CAPS_TSX_CTRL)              ? "" :
            (opt_tsx & 1)                             ? " TSX+" : " TSX-",
            !cpu_has_srbds_ctrl                       ? "" :
@@ -980,10 +995,7 @@ void __init init_speculation_mitigations(void)
         if ( !has_spec_ctrl )
             printk(XENLOG_WARNING "?!? CET active, but no MSR_SPEC_CTRL?\n");
         else if ( opt_ibrs == -1 )
-        {
             opt_ibrs = ibrs = true;
-            default_xen_spec_ctrl |= SPEC_CTRL_IBRS | SPEC_CTRL_STIBP;
-        }
 
         if ( opt_thunk == THUNK_DEFAULT || opt_thunk == THUNK_RETPOLINE )
             thunk = THUNK_JMP;
@@ -1087,14 +1099,49 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
-    /* If we have IBRS available, see whether we should use it. */
+    /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
+    {
+        /* IBRS implies STIBP.  */
+        if ( opt_stibp == -1 )
+            opt_stibp = 1;
+
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
+    }
+
+    /*
+     * Use STIBP by default if the hardware hint is set.  Otherwise, leave it
+     * off as it a severe performance pentalty on pre-eIBRS Intel hardware
+     * where it was retrofitted in microcode.
+     */
+    if ( opt_stibp == -1 )
+        opt_stibp = !!boot_cpu_has(X86_FEATURE_STIBP_ALWAYS);
+
+    if ( opt_stibp && (boot_cpu_has(X86_FEATURE_STIBP) ||
+                       boot_cpu_has(X86_FEATURE_AMD_STIBP)) )
+        default_xen_spec_ctrl |= SPEC_CTRL_STIBP;
 
-    /* If we have SSBD available, see whether we should use it. */
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
+     * Don't use PSFD by default.  AMD designed the predictor to
+     * auto-clear on privilege change.  PSFD is implied by SSBD, which is
+     * off by default.
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


