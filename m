Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D567A491058
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 19:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258225.444483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqA-000556-RO; Mon, 17 Jan 2022 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258225.444483; Mon, 17 Jan 2022 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqA-0004yq-LE; Mon, 17 Jan 2022 18:34:50 +0000
Received: by outflank-mailman (input) for mailman id 258225;
 Mon, 17 Jan 2022 18:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Wq8-0004g9-Sm
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 18:34:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25648e86-77c4-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 19:34:46 +0100 (CET)
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
X-Inumbo-ID: 25648e86-77c4-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642444486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4/0GjuH2o/J2ZSoMPlStwoA5JUecXOYK7NCYxrZUco=;
  b=iWQ/pIZvOn+HQ5TtafsfgWdEjHJSHSb5gUPXsoLs3iGcxNO7U+eh0F+S
   vLJLIxpb+J2vFc7JLBykYucSYK+b4unt5yv+MNIGrnROXKEdptVU9vE+5
   c0gQ5bQeAbeJnBderxQihu5UikhyTgoQAvjLTy7z8uwNqexUMbf0CJOBv
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T8QlsTVmL9kjo6GaLrZ5PSdU3VOhmVi+vWpIQZ+Gh8Kp1Bk+LukNK+QqADKd6YN6jz92hEHp1t
 8e9yC/PnIa0+57Ar/7SheJ8QEmM1VR3YuHcad1+oh8tTelfzjUcwX9pqIU0vBSZElkx7wOvPoC
 xjzIiMltUH90aigvBPBAPozXtPTEwl5GAdhZb9fbJ9EfUtUu5/SmygM1H8aWItZ0N/FDkuMs+T
 711Jv7UD9MsuwVbs4F5M+/FMWbzKuAEnxD/KELcA0yEO3ow6eqKMrTeRipK1zgvosM+UUmX03M
 4ue3iVD01AH32zNj35O16uvh
X-SBRS: 5.2
X-MesageID: 62573948
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4ysvdqwmiFV1hQB3ltt6t+eywSrEfRIJ4+MujC+fZmUNrF6WrkUHn
 DAWDW+PaPmMYWX9LtB0PIqxphwP65+GydY3SgY5qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4BQ7
 /N/7cyyckBzG43lo94MbB1JTD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JoTQq2PO
 5pxhTxHVR3qOR1/NVwsUpMZzfy1giavSG1hkQfAzUYwyzeKl1EguFT3C/LXZ9rMQ8xWl0SZo
 2vu/mLlDxVcP9uaoRKG/2ytgKnTnCr9cIMUCLC8sPVthTW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1ppaziwHqaSouajUnRQY/dxo658i8v9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNf9P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsNJG9eFoSfLkWVsDNdWfh0B3iEsI26BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtLlTarHo+ORLOjwgBdXTAd4llZ
 P93lu72XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNNcTgicCZqbbir+50/XrPSeWJORTB+Y8I9NJt8IeSJaYwPyLeRl
 px8M2cFoGfCaYrvclTVOis9OeK2Df6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:SD2w7K1wG9UwmsdJUNHAqgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62573948"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 3/4] x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Date: Mon, 17 Jan 2022 18:34:14 +0000
Message-ID: <20220117183415.11150-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220117183415.11150-1-andrew.cooper3@citrix.com>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These were written before Spectre/Meltdown went public, and there was large
uncertainty in how the protections would evolve.  As it turns out, they're
very specific to Intel hardware, and not very suitable for AMD.

Drop the macros, opencoding the relevant subset of functionality, and leaving
grep-fodder to locate the logic.  No change at all for VT-x.

For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.

This has a marginal improvement of removing an unconditional pile of long-nops
from the vmentry/exit path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

v2:
 * Tweak text.
---
 xen/arch/x86/hvm/svm/entry.S             |  5 +++--
 xen/arch/x86/hvm/vmx/entry.S             |  8 ++++++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 19 ++++---------------
 3 files changed, 13 insertions(+), 19 deletions(-)

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
index cb34299a865b..2b3f123cb501 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -68,14 +68,16 @@
  *
  * The following ASM fragments implement this algorithm.  See their local
  * comments for further details.
- *  - SPEC_CTRL_ENTRY_FROM_HVM
  *  - SPEC_CTRL_ENTRY_FROM_PV
  *  - SPEC_CTRL_ENTRY_FROM_INTR
  *  - SPEC_CTRL_ENTRY_FROM_INTR_IST
  *  - SPEC_CTRL_EXIT_TO_XEN_IST
  *  - SPEC_CTRL_EXIT_TO_XEN
  *  - SPEC_CTRL_EXIT_TO_PV
- *  - SPEC_CTRL_EXIT_TO_HVM
+ *
+ * Additionally, the following grep-fodder exists to find the HVM logic.
+ *  - SPEC_CTRL_ENTRY_FROM_{SVM,VMX}
+ *  - SPEC_CTRL_EXIT_TO_{SVM,VMX}
  */
 
 .macro DO_OVERWRITE_RSB tmp=rax
@@ -225,12 +227,6 @@
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
@@ -255,13 +251,6 @@
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


