Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A948DBFF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257286.442089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837l-0001kz-Ss; Thu, 13 Jan 2022 16:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257286.442089; Thu, 13 Jan 2022 16:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837l-0001ht-O3; Thu, 13 Jan 2022 16:38:53 +0000
Received: by outflank-mailman (input) for mailman id 257286;
 Thu, 13 Jan 2022 16:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n837j-0001gG-Mk
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:38:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4862c5d8-748f-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 17:38:50 +0100 (CET)
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
X-Inumbo-ID: 4862c5d8-748f-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642091930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsZqCwP/9e30gFHgjSlmMePARuttaiZ9/gTqptDuKYQ=;
  b=bNl0Yy7giZpd+MsVTLhPOS5h9vO+JcA/3TeHifQT6E7OiCOi/SCXt1tR
   nDSsT1V/MXUWqzSvjGNPAmwSfUD9259RvLlWe1/ZolcPEYmaE4TZgJR7i
   CBccs4ToexZR0cid2OKE8F04OFhO3+RNBKwAS/7eFOhR57bonplZ4HXO0
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YM7XPkVGIo6D+Bx1k+vpFCmlqh1HFHaqi2ijNLGCIKfZJsf7H4GlvtM68h/enzq1JJVzHjfqNf
 WomRlwuNISemojJXghp/YNBWUMs7j/XOQzlAGEj65amylmBSxXkWsqejfvk9JZC0XovI0pq/Fa
 Ge6aZ6bYpn5nvuLKrPR7n/3o6iHvpIkaP1B6bs5tffM1KDj8ECKQkvSM0bmQAX6R6Q6eMaTUoS
 iJ451hVY2ll0y48zfWwk8cIRWqPLp5S7C+8d3vfJtTJ2ezlIuYLI+HL0zr+wkXx2ptk5DMKx1k
 EG4Ggh4d4TTBMnoG4NjsG4ii
X-SBRS: 5.2
X-MesageID: 61937667
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ApJpAq+LuP0MzLQ8ycV4DrUDenmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jQXC2rXOPiDZTanLYtxbIi+pxkE65TTmNJnHQFt+X08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhox
 vdxqZ63azsFO42LuOdeXQdDIRtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4XTK2BO
 ZRGAdZpRATAbCBEAVAJNLxk26SPvVfAd2Vjgk3A8MLb5ECMlVcsgdABKuH9eMGMA8NcnU+ap
 2fP12X/HhwecteYzFKt8X+yh+mJgSLyXqoTEqG18rhhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3q6ajw+uOy83EUMHRWgkTkgL/cLRmqhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab4P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQ8hJG9eFoSfLkWVsDNdWfhcB3iEsI26BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtLlfep3kwOR7LhQgBdXTAd4lla
 f93lu72XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNNcTgicCZqbbir+50/XrPSeWJORTB+Y8I9NJt8IeSJaYwPyLeRl
 px8M2cFoGfCaYrvclTVOis9OeK2Df6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:t7fHo6w0a6hoOs87rFdiKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61937667"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 2/3] x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Date: Thu, 13 Jan 2022 16:38:32 +0000
Message-ID: <20220113163833.3831-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220113163833.3831-1-andrew.cooper3@citrix.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These were written before Spectre/Meltdown went public, and there was large
uncertainty in how the protections would evolve.  As it turns out, they're
very specific to Intel hardware, and not very suitable for AMD.

Expand and drop the macros.  No change at all for VT-x.

For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.

This has a marginal improvement of removing an unconditional pile of long-nops
from the vmentry/exit path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/svm/entry.S             |  5 +++--
 xen/arch/x86/hvm/vmx/entry.S             |  8 ++++++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 17 ++---------------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index e208a4b32ae7..276215d36aff 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,7 +59,7 @@ __UNLIKELY_END(nsvm_hap)
         mov VCPUMSR_spec_ctrl_raw(%rax), %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_HVM   /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
 
         pop  %r15
         pop  %r14
@@ -86,7 +86,8 @@ __UNLIKELY_END(nsvm_hap)
 
         GET_CURRENT(bx)
 
-        SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
+        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
+        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         stgi
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 27c8c5ca4943..30139ae58e9d 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -33,7 +33,9 @@ ENTRY(vmx_asm_vmexit_handler)
         movb $1,VCPU_vmx_launched(%rbx)
         mov  %rax,VCPU_hvm_guest_cr2(%rbx)
 
-        SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
+        /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
+        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
+        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
@@ -80,7 +82,9 @@ UNLIKELY_END(realmode)
         mov VCPUMSR_spec_ctrl_raw(%rax), %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_HVM   /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
+        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM
 
         mov  VCPU_hvm_guest_cr2(%rbx),%rax
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index cb34299a865b..18ecfcd70375 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -68,14 +68,14 @@
  *
  * The following ASM fragments implement this algorithm.  See their local
  * comments for further details.
- *  - SPEC_CTRL_ENTRY_FROM_HVM
+ *  - SPEC_CTRL_ENTRY_FROM_{SVM,VMX} (See appropriate entry.S files)
  *  - SPEC_CTRL_ENTRY_FROM_PV
  *  - SPEC_CTRL_ENTRY_FROM_INTR
  *  - SPEC_CTRL_ENTRY_FROM_INTR_IST
  *  - SPEC_CTRL_EXIT_TO_XEN_IST
  *  - SPEC_CTRL_EXIT_TO_XEN
  *  - SPEC_CTRL_EXIT_TO_PV
- *  - SPEC_CTRL_EXIT_TO_HVM
+ *  - SPEC_CTRL_EXIT_TO_{SVM,VMX}
  */
 
 .macro DO_OVERWRITE_RSB tmp=rax
@@ -225,12 +225,6 @@
     wrmsr
 .endm
 
-/* Use after a VMEXIT from an HVM guest. */
-#define SPEC_CTRL_ENTRY_FROM_HVM                                        \
-    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM;           \
-    ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM,                        \
-        X86_FEATURE_SC_MSR_HVM
-
 /* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
 #define SPEC_CTRL_ENTRY_FROM_PV                                         \
     ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
@@ -255,13 +249,6 @@
     ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),           \
         X86_FEATURE_SC_VERW_PV
 
-/* Use when exiting to HVM guest context. */
-#define SPEC_CTRL_EXIT_TO_HVM                                           \
-    ALTERNATIVE "",                                                     \
-        DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM;             \
-    ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)),           \
-        X86_FEATURE_SC_VERW_HVM
-
 /*
  * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
  * Fine grain control of SCF_ist_wrmsr is needed for safety in the S3 resume
-- 
2.11.0


