Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C9D79F2D6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601585.937649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTK-0005gw-H0; Wed, 13 Sep 2023 20:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601585.937649; Wed, 13 Sep 2023 20:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTK-0005eY-Dd; Wed, 13 Sep 2023 20:28:26 +0000
Received: by outflank-mailman (input) for mailman id 601585;
 Wed, 13 Sep 2023 20:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTJ-0004dA-06
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15e34a42-5274-11ee-8787-cb3800f73035;
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
X-Inumbo-ID: 15e34a42-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZLU7yqbhnu8RFdttdE7JP+JDv6CudSB/eLutF8Nbbo=;
  b=Q34pzGydG57qG0EdZqqvWKl0k9W3sRafNLAljV5QNJocfPhg/RrlWNnM
   5D3AbrGqa6cfuQ/xTYgEkY5xZDys22KkjpEkLz6MLyeQnIIogcHYGtQdN
   dA6zMg4TURrpDDH15PJFHf4CwfnqHFU7lAtHa1w2JvIyD2+sH1jNlqsyU
   g=;
X-CSE-ConnectionGUID: OTY/1Nd8T/+vvQCCeXLd1A==
X-CSE-MsgGUID: xmbwu7F0R1OtFqblUXH+wQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213281
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:mSAOkq3qv5C9ipOMt/bD5cVxkn2cJEfYwER7XKvMYLTBsI5bpzEAz
 GsfXDvUaKmIZ2umeYhybtjn9UMAv5bdxoVmSAVtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nPqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJl1/s
 qU+JGAxKVOdmdud67+LbuU1r5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8MxB/D/
 DKfl4j/KgEfPsOClhTdyCuLmsHWlyfGaKJRC4Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBUg+VGhdawdV356gvp8KpTnCfvJvSYfg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Lei8Axkkfi+F1/ronhewO
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl7bono2PRLOgj68+KTJrU3YE
 c3HGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbfflU+RThxW6e5LHFIU9UNopm5X9zgp
 hmVMnK0AnKj7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:6EGM1KAi2/IDXCTlHemN55DYdb4zR+YMi2TDtnoBMiC9F/bzqy
 nApoV+6faZskd1ZJhCo6HiBEDjewK7yXcd2+B4VtbDYODIghrLEGgI1/qa/9SPIVyHygef78
 tdmmpFZeHYPBxVi8D15QX9KdomzdWdtIi1mOa29QYLceinUc5dBs5CZDqmLg==
X-Talos-CUID: 9a23:fEtew2HGnyiNxZmIqmJAyH9TQ+YpIkGaj2nOGmSTBFZNROS8HAo=
X-Talos-MUID: 9a23:/rN/EAgN4R/qTlJ2BfMVXMMpJMJi/LnxJhg3yLIaldCOMRFAG3SCtWHi
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213281"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] x86/entry: Track the IST-ness of an entry for the exit paths
Date: Wed, 13 Sep 2023 21:27:56 +0100
Message-ID: <20230913202758.508225-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
entry/exit asm, so it only needs setting in the IST path.

As this is subtle and fragile, add check_ist_exit() to be used in debugging
builds to cross-check that the ist_exit boolean matches the entry vector.

Write check_ist_exit() it in C, because it's debug only and the logic more
complicated than I care about maintaining in asm.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/traps.c               | 13 +++++++++++++
 xen/arch/x86/x86_64/compat/entry.S |  9 ++++++++-
 xen/arch/x86/x86_64/entry.S        | 23 ++++++++++++++++++++---
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dead728ce329..0a005f088bca 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2259,6 +2259,19 @@ void asm_domain_crash_synchronous(unsigned long addr)
         do_softirq();
 }
 
+#ifdef CONFIG_DEBUG
+void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
+{
+    const unsigned int ist_mask =
+        (1U << X86_EXC_NMI) | (1U << X86_EXC_DB) |
+        (1U << X86_EXC_DF)  | (1U << X86_EXC_MC);
+    uint8_t ev = regs->entry_vector;
+    bool is_ist = (ev < X86_EXC_NUM) && ((1U << ev) & ist_mask);
+
+    ASSERT(is_ist == ist_exit);
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index bd5abd8040bd..7504bfb4f326 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -117,8 +117,15 @@ compat_process_trap:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-/* %rbx: struct vcpu, interrupts disabled */
+/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
 ENTRY(compat_restore_all_guest)
+
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 525877e97330..da084a7e8e54 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -142,10 +142,16 @@ process_trap:
 
         .section .text.entry, "ax", @progbits
 
-/* %rbx: struct vcpu, interrupts disabled */
+/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
 restore_all_guest:
-        ASSERT_INTERRUPTS_DISABLED
 
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
+        ASSERT_INTERRUPTS_DISABLED
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
         mov VCPU_arch_msrs(%rbx), %rdx
         mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
@@ -659,8 +665,15 @@ ENTRY(early_page_fault)
         .section .text.entry, "ax", @progbits
 
         ALIGN
-/* No special register assumptions. */
+/* %r12=ist_exit */
 restore_all_xen:
+
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -1087,6 +1100,10 @@ handle_ist_exception:
 .L_ist_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
+
+        /* This is an IST exit */
+        mov   $1, %r12
+
         cmpb  $X86_EXC_NMI, UREGS_entry_vector(%rsp)
         jne   ret_from_intr
 
-- 
2.30.2


