Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB54A4AB6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 16:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263162.455774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYjh-0004Z9-Oh; Mon, 31 Jan 2022 15:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263162.455774; Mon, 31 Jan 2022 15:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYjh-0004Wm-L4; Mon, 31 Jan 2022 15:36:57 +0000
Received: by outflank-mailman (input) for mailman id 263162;
 Mon, 31 Jan 2022 15:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEYjf-0004Vo-Qt
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 15:36:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c024911-82ab-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 16:36:52 +0100 (CET)
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
X-Inumbo-ID: 9c024911-82ab-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643643412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5QdX11X1ReVJwn4hm33e8QUp/Ma5ql215YdyrwvYP2M=;
  b=TuQnvD3EL9x7mgUXxU51KJsd5Hf/X9TZBIcy8/RZvBDsRtFxGqn4jia+
   /VhdqsMIuKocZNGZ5zaR2hv4LeaOr1TS5PizHBrrhWOg7FTzwJIYkI/J3
   N7Tqjh4vPC2Gk3X8fUXjXAooggwxKvt354fhyBi1QYUHanVV4nieMnipU
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SWV0vNnR5vgKOU8axEmI6RWbzsxRY4mtNk+P97Ao6d34URic0QZ7mNKguqvr7FVajsEhiOOaCM
 WM29q+u6bWd5iz/lfI6y0GeTc+ZWa3Xzyn8j14LXnBfGopL6j0iP69KZ+8a74/F9TFsFw+G08U
 1c1D/cVYitl1wGWTQdkXLu5zO3B5jEoeD5qlOYTDhurHED+wAvpQZNwBn7cPK2gI0UN+CgsY3R
 nD/Nfho4G8/OCXlrGIbkP2y13P6vIV/2ORRPLTSOQr6/TgkLpG0hCyGfNtpHd7/X2jUvfnPIfJ
 6bLfrsYKX3C3pjeExy5QW5bD
X-SBRS: 5.2
X-MesageID: 63133548
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Zas2967eFol4VlROEOOAcwxRtOzAchMFZxGqfqrLsTDasY5as4F+v
 jQZCG6HP6neZTShKt13atjipEJTuMTcm4M1G1Q/qXo8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2dcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 e9V7ceXSx8TEu7+iOtedghFNChxFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRq+FP
 JdFOVKDajyROkFvAUs4Aq4agdykr1yvdWJGmnuK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+NqC7VhzwOV8IaX0RaWRU0VUxlIZ/Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtbABbvzt68owGOlor+p5
 iJsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifxo5bZ5UJ261M
 Sc/XD+9ArcJZhNGiocsO+qM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidCZjXc6u950IJ4Zu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:/mojnqNBL9GX2cBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63133548"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Date: Mon, 31 Jan 2022 15:36:21 +0000
Message-ID: <20220131153621.8863-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-8-andrew.cooper3@citrix.com>
References: <20220128132927.14997-8-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
run with the logical OR of both values.  Therefore, in principle we want to
clear Xen's value before entering the guest.  However, for migration
compatibility, and for performance reasons with SEV-SNP guests, we want the
ability to use a nonzero value behind the guest's back.  Use vcpu_msrs to hold
this value, with the guest value in the VMCB.

On the VMEntry path, adjusting MSR_SPEC_CTRL must be done after CLGI so as to
be atomic with respect to NMIs/etc.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Implement in asm
---
 xen/arch/x86/hvm/svm/entry.S             | 34 +++++++++++++++++++++++++++-----
 xen/arch/x86/include/asm/msr.h           |  9 +++++++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h |  3 +++
 xen/arch/x86/x86_64/asm-offsets.c        |  1 +
 4 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 276215d36aff..16b642c9e2de 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -55,11 +55,23 @@ __UNLIKELY_END(nsvm_hap)
         mov  %rsp, %rdi
         call svm_vmenter_helper
 
-        mov VCPU_arch_msrs(%rbx), %rax
-        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
+        clgi
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
+        /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
+        .macro svm_vmentry_spec_ctrl
+            mov    VCPU_arch_msrs(%rbx), %rax
+            movzbl CPUINFO_last_spec_ctrl(%rsp), %edx
+            mov    VCPUMSR_spec_ctrl_raw(%rax), %eax
+            cmp    %edx, %eax
+            je 1f  /* Skip write if value is correct. */
+            mov    $MSR_SPEC_CTRL, %ecx
+            xor    %edx, %edx
+            wrmsr
+            mov    %al, CPUINFO_last_spec_ctrl(%rsp)
+1:          /* No Spectre v1 concerns.  Execution will hit VMRUN imminently. */
+        .endm
+        ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
 
         pop  %r15
         pop  %r14
@@ -78,7 +90,6 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        clgi
         sti
         vmrun
 
@@ -86,8 +97,21 @@ __UNLIKELY_END(nsvm_hap)
 
         GET_CURRENT(bx)
 
-        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
+        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: %rsp=regs/cpuinfo         Clob: acd */
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
+
+        .macro svm_vmexit_spec_ctrl
+            /*
+             * Write to MSR_SPEC_CTRL unconditionally, for the RAS[:32]
+             * flushing side effect.
+             */
+            mov    $MSR_SPEC_CTRL, %ecx
+            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
+            xor    %edx, %edx
+            wrmsr
+            mov    %al, CPUINFO_last_spec_ctrl(%rsp)
+        .endm
+        ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         stgi
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 657a3295613d..ce4fe51afe54 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -297,6 +297,15 @@ struct vcpu_msrs
      *
      * For VT-x guests, the guest value is held in the MSR guest load/save
      * list.
+     *
+     * For SVM, the guest value lives in the VMCB, and hardware saves/restores
+     * the host value automatically.  However, guests run with the OR of the
+     * host and guest value, which allows Xen to set protections behind the
+     * guest's back.
+     *
+     * We must clear/restore Xen's value before/after VMRUN to avoid unduly
+     * influencing the guest.  In order to support "behind the guest's back"
+     * protections, we load this value (commonly 0) before VMRUN.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 9c0c7622c41f..02b3b18ce69f 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -46,6 +46,9 @@
  *   - On VMX by using MSR load/save lists to have vmentry/exit atomically
  *     load/save the guest value.  Xen's value is loaded in regular code, and
  *     there is no need to use the shadow logic (below).
+ *   - On SVM by altering MSR_SPEC_CTRL inside the CLGI/STGI region.  This
+ *     makes the changes atomic with respect to NMIs/etc, so no need for
+ *     shadowing logic.
  *
  * Factor 2 is harder.  We maintain a shadow_spec_ctrl value, and a use_shadow
  * boolean in the per cpu spec_ctrl_flags.  The synchronous use is:
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 649892643fe9..287dac101ad4 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -126,6 +126,7 @@ void __dummy__(void)
     OFFSET(CPUINFO_pv_cr3, struct cpu_info, pv_cr3);
     OFFSET(CPUINFO_shadow_spec_ctrl, struct cpu_info, shadow_spec_ctrl);
     OFFSET(CPUINFO_xen_spec_ctrl, struct cpu_info, xen_spec_ctrl);
+    OFFSET(CPUINFO_last_spec_ctrl, struct cpu_info, last_spec_ctrl);
     OFFSET(CPUINFO_spec_ctrl_flags, struct cpu_info, spec_ctrl_flags);
     OFFSET(CPUINFO_root_pgt_changed, struct cpu_info, root_pgt_changed);
     OFFSET(CPUINFO_use_pv_cr3, struct cpu_info, use_pv_cr3);
-- 
2.11.0


