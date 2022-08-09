Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6448F58DCA9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 19:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383094.618206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSb8-000400-US; Tue, 09 Aug 2022 17:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383094.618206; Tue, 09 Aug 2022 17:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSb8-0003xF-RU; Tue, 09 Aug 2022 17:00:54 +0000
Received: by outflank-mailman (input) for mailman id 383094;
 Tue, 09 Aug 2022 17:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flEI=YN=citrix.com=prvs=213c446d4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLSb7-0003x4-3n
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 17:00:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d14c2803-1804-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 19:00:51 +0200 (CEST)
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
X-Inumbo-ID: d14c2803-1804-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660064450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kzV1NdfmDwjrGppyGg4tphySuRUYrZFiMHQBlfQ9nGk=;
  b=Biu9oyHUUShEUY33R3GAo2yfZIRqpF6PHXGeFPjw591N/tUfrKR2a7Oq
   9xtqmnCvZCWwzKhcNo+hcfITAb4+iyS1yNprs2aQX3L2pQxmTMdHcyC58
   XZVT+FqoKplg9dtCVYNNq565f1qQexnrQYM4FCOo1MylJ0q3YYkcan+wA
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77711799
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mu+MU6+20BbYGm+Ix/acDrUD736TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DAcWWuCOv6PZmH3edh3O4y19RwC6pbWmt43SQRl/Hs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM37ayo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGB0I3PqIX4vdMAkYf1
 +48GW0tbU2ZrrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQuj+e0aYWEK7RmQ+1UnEmFh
 UHDw13SGy0DM+6wxyqkolej07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXme97S7oiujAisyfE0QQR5ZbQhY+fC29enfkSnzosZf/L+d14OrQWmpm
 23U9UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK514Atc8IbCL1PPEvC25UNyjN5fmIKDgYfqqMMoomjmZZLWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL89AgOBD+8zL7TmMLXwN50j4jOH2ib/8YettDWZimchgt/za/VuJq
 4s32gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:ZY4hCKO1xvLVLcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.93,225,1654574400"; 
   d="scan'208";a="77711799"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where possible
Date: Tue, 9 Aug 2022 18:00:16 +0100
Message-ID: <20220809170016.25148-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220809170016.25148-1-andrew.cooper3@citrix.com>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The documentation for eIBRS has finally been clarified to state that it is
intended to flush the RSB on VMExit.  So in principle, we shouldn't have been
using opt_rsb_hvm on eIBRS hardware.

However, dropping the 32 entry RSB stuff makes us vulnerable to Post-Barrier
RSB speculation on affected Intel CPUs.

Introduce hvm_rsb_calculations() which selects between a 32-entry stuff, a
PBRSB specific workaround, or nothing, based on hardware details.

To mitigate PBRSB, put an LFENCE at the top of vmx_vmexit_handler().  This
forces the necessary safety property, without having to do a 1-entry RSB stuff
and fix up the stack(s) afterwards.

Update opt_rsb_hvm to be tristate.  On eIBRS-capable CPUs not susceptible to
PBRSB, this disables HVM RSB software protections entirely.  On eIBRS-capable
CPUs suceptible to to PBRSB, this reduces a 32-entry RSB stuff down to just
one LFENCE.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/vmx/entry.S           |   1 +
 xen/arch/x86/hvm/vmx/vmx.c             |  20 ++++++-
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/spec_ctrl.c               | 103 ++++++++++++++++++++++++++++++++-
 4 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 5f5de45a1309..222495aed19f 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -44,6 +44,7 @@ ENTRY(vmx_asm_vmexit_handler)
         .endm
         ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
+        /* On PBRSB-vulenrable hardware, `ret` not safe before the start of vmx_vmexit_handler() */
 
         /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
         .macro restore_lbr
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 17e103188a53..8a6a5cf20525 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3934,8 +3934,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
     unsigned int vector = 0, mode;
-    struct vcpu *v = current;
-    struct domain *currd = v->domain;
+    struct vcpu *v;
+    struct domain *currd;
+
+    /*
+     * To mitigate Post-Barrier RSB speculation, we must force one CALL
+     * instruction to retire before letting a RET instruction execute.
+     *
+     * On PBRSB-vulnerable CPUs, it is not safe for a RET to be executed
+     * before this point.
+     *
+     * Defer any non-trivial variable initialisation to avoid problems if the
+     * compiler decides to out-of-line any helpers.  This depends on
+     * alternative() being a full compiler barrier too.
+     */
+    alternative("", "lfence", X86_BUG_PBRSB);
+
+    v = current;
+    currd = v->domain;
 
     __vmread(GUEST_RIP,    &regs->rip);
     __vmread(GUEST_RSP,    &regs->rsp);
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 672c9ee22ba2..fdb9bff833c1 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -49,6 +49,7 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
 #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
 #define X86_BUG_CLFLUSH_MFENCE    X86_BUG( 2) /* MFENCE needed to serialise CLFLUSH */
+#define X86_BUG_PBRSB             X86_BUG( 3) /* CPU suffers from Post-Barrier RSB speculation */
 
 /* Total number of capability words, inc synth and bug words. */
 #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 160cc68086c6..ffad202200ad 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -35,7 +35,7 @@
 static bool __initdata opt_msr_sc_pv = true;
 static bool __initdata opt_msr_sc_hvm = true;
 static int8_t __initdata opt_rsb_pv = -1;
-static bool __initdata opt_rsb_hvm = true;
+static int8_t __initdata opt_rsb_hvm = -1;
 static int8_t __ro_after_init opt_md_clear_pv = -1;
 static int8_t __ro_after_init opt_md_clear_hvm = -1;
 
@@ -515,7 +515,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
             opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
+           boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           :
+           boot_cpu_has(X86_BUG_PBRSB)               ? " PBRSB"         : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "");
@@ -718,6 +719,77 @@ static bool __init rsb_is_full_width(void)
     return true;
 }
 
+/*
+ * HVM guests can create arbitrary RSB entries, including ones which point at
+ * Xen supervisor mappings.
+ *
+ * Traditionally, the RSB is not isolated on vmexit, so Xen needs to take
+ * safety precautions to prevent RSB speculation from consuming guest values.
+ *
+ * Intel eIBRS specifies that the RSB is flushed:
+ *   1) on VMExit when IBRS=1, or
+ *   2) shortly thereafter when Xen restores the host IBRS=1 setting.
+ * However, a subset of eIBRS-capable parts also suffer PBRSB and need
+ * software assistance to maintain RSB safety.
+ */
+static __init enum hvm_rsb {
+    hvm_rsb_none,
+    hvm_rsb_pbrsb,
+    hvm_rsb_stuff32,
+} hvm_rsb_calculations(uint64_t caps)
+{
+    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return hvm_rsb_stuff32;
+
+    if ( !(caps & ARCH_CAPS_IBRS_ALL) )
+        return hvm_rsb_stuff32;
+
+    if ( caps & ARCH_CAPS_PBRSB_NO )
+        return hvm_rsb_none;
+
+    /*
+     * We're choosing between the eIBRS-capable models which don't enumerate
+     * PBRSB_NO.  Earlier steppings of some models don't enumerate eIBRS and
+     * are excluded above.
+     */
+    switch ( boot_cpu_data.x86_model )
+    {
+        /*
+         * Core (inc Hybrid) CPUs to date (August 2022) are vulenrable.
+         */
+    case 0x55: /* Skylake X */
+    case 0x6a: /* Ice Lake SP */
+    case 0x6c: /* Ice Lake D */
+    case 0x7e: /* Ice Lake client */
+    case 0x8a: /* Lakefield (SNC/TMT) */
+    case 0x8c: /* Tiger Lake U */
+    case 0x8d: /* Tiger Lake H */
+    case 0x8e: /* Skylake-L */
+    case 0x97: /* Alder Lake S */
+    case 0x9a: /* Alder Lake H/P/U */
+    case 0x9e: /* Skylake */
+    case 0xa5: /* Comet Lake */
+    case 0xa6: /* Comet Lake U62 */
+    case 0xa7: /* Rocket Lake */
+        return hvm_rsb_pbrsb;
+
+        /*
+         * Atom CPUs are not vulnerable.
+         */
+    case 0x7a: /* Gemini Lake */
+    case 0x86: /* Snow Ridge (Tremont) */
+    case 0x96: /* Elkhart Lake (Tremont) */
+    case 0x9c: /* Jasper Lake (Tremont) */
+        return hvm_rsb_none;
+
+    default:
+        printk("Unrecognised CPU model %#x - using software HVM RSB mitigations\n",
+               boot_cpu_data.x86_model);
+        return hvm_rsb_stuff32;
+    }
+}
+
 /* Calculate whether this CPU speculates past #NM */
 static bool __init should_use_eager_fpu(void)
 {
@@ -1110,6 +1182,7 @@ void spec_ctrl_init_domain(struct domain *d)
 void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
+    enum hvm_rsb hvm_rsb;
     bool has_spec_ctrl, ibrs = false, hw_smt_enabled;
     bool cpu_has_bug_taa;
     uint64_t caps = 0;
@@ -1327,9 +1400,33 @@ void __init init_speculation_mitigations(void)
      * HVM guests can always poison the RSB to point at Xen supervisor
      * mappings.
      */
+    hvm_rsb = hvm_rsb_calculations(caps);
+    if ( opt_rsb_hvm == -1 )
+        opt_rsb_hvm = hvm_rsb != hvm_rsb_none;
+
     if ( opt_rsb_hvm )
     {
-        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
+        switch ( hvm_rsb )
+        {
+        case hvm_rsb_pbrsb:
+            setup_force_cpu_cap(X86_BUG_PBRSB);
+            break;
+
+        case hvm_rsb_none:
+            /*
+             * Somewhat arbitrary.  If something is wrong and the user has
+             * forced HVM RSB protections on a system where we think nothing
+             * is necessary, they they possibly know something we dont.
+             *
+             * Use stuff32 in this case, which is the most protection we can
+             * muster.
+             */
+            fallthrough;
+
+        case hvm_rsb_stuff32:
+            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
+            break;
+        }
 
         /*
          * For SVM, Xen's RSB safety actions are performed before STGI, so
-- 
2.11.0


