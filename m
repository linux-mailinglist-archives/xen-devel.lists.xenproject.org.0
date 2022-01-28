Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6A49FAB0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261998.453984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK8-0003ql-0i; Fri, 28 Jan 2022 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261998.453984; Fri, 28 Jan 2022 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK7-0003fK-QB; Fri, 28 Jan 2022 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 261998;
 Fri, 28 Jan 2022 13:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRK5-0003aP-OY
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:29:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc8ad07-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:29:50 +0100 (CET)
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
X-Inumbo-ID: 5dc8ad07-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V6G8Qskfbksu1pgqDoVMntLfKzcuPRpqZI8kWWn5Gi8=;
  b=gH5cF4t/s6bxCybfQHZrjBL8mmEJ/J0VF1fRodWNibKoaPiYkQZOj9RU
   PA18zf7QCl7xlhVA9r8Bv2Out41h3cnS4hG22BxpSPyaPrY1EvvCJdA+M
   ZxzX5HaKZekkoO1HzV6HbN9nQR5bjq672+rzehwZmc8m76H4JZiASyrZA
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: d1vRukRYYbMvGIDA2fMWC9/OlESx44bAjWolJZRrgA+NZpyErfz3LaO1tStT+CwFztxsVruWot
 lHqgE8Ye5ZwQCzPlabFNaRhK6z5iwlP3Vh8eDEvqS/+6pXu2DsCZzTTO7+l6s77wTMfmSYsrYI
 Wl4l8YrgP6s4gabOklu0Iytm3+x4GHeTD2lyRF4LhPt6caFd3RxMwu8jP12SbfSpG9dw07irB5
 lhCzaKDMefOvXoM1+X54B42/HF6DVVZ2QWWTTbwvz4A5ckmX8C5o6PRo/NMgxaszNC6wlrl/E+
 lU4dkpWaO5UUkfWN/ZBTtLGR
X-SBRS: 5.2
X-MesageID: 63388626
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E3rVN64UvcrxnMtU2+7+fwxRtOzAchMFZxGqfqrLsTDasY5as4F+v
 mAbCGqCO66La2r2fdwgbd7l9UlQsZ6Ez9Y2HAQ+ry02Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2N4w3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 vBRpJbzQxUSN/fhkfUTUT53Hw1BIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRq2ON
 5RDN1KDajzkXT1+YUxQOqgjhd+jm2LtKx9U9V2K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+R1D/wwqwuf8aOOzg+ICGojYTJtV8Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iVsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifx0yap1aJGe0M
 Sc/XD+9ArcJYhNGiocsO+qM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidChiWsuu+pUJL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:MuS/AamBkLchP1SKM2V7t1He+ibpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="63388626"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 9/9] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by default
Date: Fri, 28 Jan 2022 13:29:27 +0000
Message-ID: <20220128132927.14997-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all other pieces in place, MSR_SPEC_CTRL is fully working for HVM guests.

Update the CPUID derivation logic (both PV and HVM to avoid losing subtle
changes), drop the MSR intercept, and explicitly enable the CPUID bits for HVM
guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Drop the MSR intercept too
 * Rework the comment block in gen-cpuid.py
 * Fix typo in comment
---
 xen/arch/x86/cpuid.c                        | 16 ++++++++++++----
 xen/arch/x86/hvm/svm/svm.c                  |  4 ++++
 xen/include/public/arch-x86/cpufeatureset.h | 16 ++++++++--------
 xen/tools/gen-cpuid.py                      | 14 +++++++++-----
 4 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b5af48324aef..e24dd283e761 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -433,6 +433,8 @@ static void __init guest_common_feature_adjustments(uint32_t *fs)
      */
     if ( test_bit(X86_FEATURE_IBRSB, fs) )
         __set_bit(X86_FEATURE_STIBP, fs);
+    if ( test_bit(X86_FEATURE_IBRS, fs) )
+        __set_bit(X86_FEATURE_AMD_STIBP, fs);
 
     /*
      * On hardware which supports IBRS/IBPB, we can offer IBPB independently
@@ -456,11 +458,14 @@ static void __init calculate_pv_max_policy(void)
         pv_featureset[i] &= pv_max_featuremask[i];
 
     /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests because of
-     * administrator choice, hide the feature.
+     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests (functional
+     * availability, or admin choice), hide the feature.
      */
     if ( !boot_cpu_has(X86_FEATURE_SC_MSR_PV) )
+    {
         __clear_bit(X86_FEATURE_IBRSB, pv_featureset);
+        __clear_bit(X86_FEATURE_IBRS, pv_featureset);
+    }
 
     guest_common_feature_adjustments(pv_featureset);
 
@@ -530,11 +535,14 @@ static void __init calculate_hvm_max_policy(void)
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
     /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests because of
-     * administrator choice, hide the feature.
+     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
+     * availability, or admin choice), hide the feature.
      */
     if ( !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
+    {
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
+        __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
+    }
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index aa82fe29befb..01ce6c71b5f8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -606,6 +606,10 @@ static void svm_cpuid_policy_changed(struct vcpu *v)
 
     vmcb_set_exception_intercepts(vmcb, bitmap);
 
+    /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
+    svm_intercept_msr(v, MSR_SPEC_CTRL,
+                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index fd8ab2572304..957df23b65f2 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -256,18 +256,18 @@ XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
-XEN_CPUFEATURE(IBRS,          8*32+14) /*   MSR_SPEC_CTRL.IBRS */
-XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*   MSR_SPEC_CTRL.STIBP */
-XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*   IBRS preferred always on */
-XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*   STIBP preferred always on */
-XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*   IBRS preferred over software options */
-XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*   IBRS provides same-mode protection */
+XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
+XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */
+XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*S  IBRS preferred always on */
+XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*S  STIBP preferred always on */
+XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*S  IBRS preferred over software options */
+XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection */
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
-XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*   MSR_SPEC_CTRL.SSBD available */
+XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
-XEN_CPUFEATURE(PSFD,          8*32+28) /*   MSR_SPEC_CTRL.PSFD */
+XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 470cd76d1c52..39c8b0c77465 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -277,16 +277,20 @@ def crunch_numbers(state):
         # The features:
         #   * Single Thread Indirect Branch Predictors
         #   * Speculative Store Bypass Disable
+        #   * Predictive Store Forward Disable
         #
-        # enumerate new bits in MSR_SPEC_CTRL, which is enumerated by Indirect
-        # Branch Restricted Speculation/Indirect Branch Prediction Barrier.
+        # enumerate new bits in MSR_SPEC_CTRL, and technically enumerate
+        # MSR_SPEC_CTRL itself.  AMD further enumerates hints to guide OS
+        # behaviour.
         #
-        # In practice, these features also enumerate the presense of
-        # MSR_SPEC_CTRL.  However, no real hardware will exist with SSBD but
-        # not IBRSB, and we pass this MSR directly to guests.  Treating them
+        # However, no real hardware will exist with e.g. SSBD but not
+        # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
         IBRSB: [STIBP, SSBD],
+        IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
+               IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
+        AMD_STIBP: [STIBP_ALWAYS],
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
-- 
2.11.0


