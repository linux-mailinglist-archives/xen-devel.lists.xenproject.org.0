Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC8836F8C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 19:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670057.1042685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrZ-0003ny-2T; Mon, 22 Jan 2024 18:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670057.1042685; Mon, 22 Jan 2024 18:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrY-0003kQ-Vf; Mon, 22 Jan 2024 18:17:36 +0000
Received: by outflank-mailman (input) for mailman id 670057;
 Mon, 22 Jan 2024 18:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdLN=JA=citrix.com=prvs=74474809d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rRyrW-0003Bi-Rj
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 18:17:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80b7c7d1-b952-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 19:17:30 +0100 (CET)
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
X-Inumbo-ID: 80b7c7d1-b952-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705947450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PoQrTCXbOLESqrnXnnL2uPe7qZz7/Q2HWhe4ECuWOno=;
  b=QeIdA7wgpzUxQTTBPOvQYdMPnskButplDIWg8Q2WOQT/cr8PSl5yjWqZ
   6IRwQ21/JfrjpepLTrw47XPZItGuN1U5sVDAD4Xgn5sgTfZgZLYd8RAGh
   lL5l76HoUF0tC95PMMXk0dxvku7K+pdSON1a9PEtB3AhgnBTrl9RS5/T1
   Q=;
X-CSE-ConnectionGUID: FCbAE902SjqaC0PT4u4YkQ==
X-CSE-MsgGUID: 0jxmyDTtRTqlzcsjeZYdkw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132366783
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:a45696nEah+gXt7H5Ld8+KDo5gzcJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXWjQaarbMWrzKdAjOY2xp0wCsZPTmIBhTgdu/yE9FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KmaVA8w5ARkOagS5gaGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dIzIhkgP0jZvOCvyZnjctUwm5gSL/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx3C/
 TyYoDSiav0cHISd2T+U3k6wvNPWmTHwQ4AfJoy09eE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 TehnNTvHzVj9qKUTXG18a2dpje/fyMSKAc/iTQsFFVfpYO5+cdq00OJEY4L/LOJYsPdNxr66
 h3b9HIFhawappYz6/mmoWHEumf5znTWdTLZ9jk7T0r8sVskNdT1OdT1gWU3+8qsO2pwc7Vgg
 JTns5LHhAz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN8IvWEgfh05bJ5YKVcFh
 XM/XisIuvdu0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSat4owZq2B1yftXE
 c7CIa6R4YMyVfwPIMyeG71MjtfGB0kWmQvueHwM50j/jOfDPi/EF9/o8jKmN4gE0U9Nmy2Nm
 /43CidA40w3vDHWCsUPzbMuEA==
IronPort-HdrOrdr: A9a23:6GCv0ahsAl2TqCEToexWZ5ZtyXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-Talos-CUID: 9a23:ycT7bm8dkfWH7lol9hKVv2A/EOkIIyWH93XJKmTgMVo1VeGkSmbFrQ==
X-Talos-MUID: 9a23:2NxdFgk/P7LI6LDiIXu/dno6Ntdt8oiSFHoxiJEUsNKGOB5BNzSC2WE=
X-IronPort-AV: E=Sophos;i="6.05,211,1701147600"; 
   d="scan'208";a="132366783"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/3] x86/entry: Make intra-funciton symbols properly local
Date: Mon, 22 Jan 2024 18:17:14 +0000
Message-ID: <20240122181714.1543738-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Each of these symbols are local to their main function.  By not having them
globally visible, livepatch's binary diffing logic can reason about the
functions properly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

sysenter_eflags_saved() is an open question.  This does need to be globally
visible, and I think any livepatch modifying sysenter_entry() will need a
manual adjustment to do_debug() to update the reference there.
---
 xen/arch/x86/x86_64/compat/entry.S | 20 ++++++++++----------
 xen/arch/x86/x86_64/entry.S        | 22 +++++++++++-----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 4fbd89cea1a9..1e9e0455eaf3 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -41,7 +41,7 @@ FUNC(compat_test_all_events)
         shll  $IRQSTAT_shift,%eax
         leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
         cmpl  $0,(%rcx,%rax,1)
-        jne   compat_process_softirqs
+        jne   .L_compat_process_softirqs
 
         /* Inject exception if pending. */
         lea   VCPU_trap_bounce(%rbx), %rdx
@@ -49,11 +49,11 @@ FUNC(compat_test_all_events)
         jnz   .Lcompat_process_trapbounce
 
         cmpb  $0, VCPU_mce_pending(%rbx)
-        jne   compat_process_mce
+        jne   .L_compat_process_mce
 .Lcompat_test_guest_nmi:
         cmpb  $0, VCPU_nmi_pending(%rbx)
-        jne   compat_process_nmi
-compat_test_guest_events:
+        jne   .L_compat_process_nmi
+.L_compat_test_guest_events:
         movq  VCPU_vcpu_info(%rbx),%rax
         movzwl COMPAT_VCPUINFO_upcall_pending(%rax),%eax
         decl  %eax
@@ -71,7 +71,7 @@ compat_test_guest_events:
         jmp   compat_test_all_events
 
 /* %rbx: struct vcpu */
-LABEL_LOCAL(compat_process_softirqs)
+LABEL_LOCAL(.L_compat_process_softirqs)
         sti
         call  do_softirq
         jmp   compat_test_all_events
@@ -84,7 +84,7 @@ LABEL_LOCAL(.Lcompat_process_trapbounce)
         jmp   compat_test_all_events
 
 /* %rbx: struct vcpu */
-LABEL_LOCAL(compat_process_mce)
+LABEL_LOCAL(.L_compat_process_mce)
         testb $1 << VCPU_TRAP_MCE,VCPU_async_exception_mask(%rbx)
         jnz   .Lcompat_test_guest_nmi
         sti
@@ -96,12 +96,12 @@ LABEL_LOCAL(compat_process_mce)
         movb %dl,VCPU_mce_old_mask(%rbx)            # iret hypercall
         orl  $1 << VCPU_TRAP_MCE,%edx
         movb %dl,VCPU_async_exception_mask(%rbx)
-        jmp   compat_process_trap
+        jmp   .L_compat_process_trap
 
 /* %rbx: struct vcpu */
-LABEL_LOCAL(compat_process_nmi)
+LABEL_LOCAL(.L_compat_process_nmi)
         testb $1 << VCPU_TRAP_NMI,VCPU_async_exception_mask(%rbx)
-        jnz   compat_test_guest_events
+        jnz   .L_compat_test_guest_events
         sti
         movb  $0, VCPU_nmi_pending(%rbx)
         call  set_guest_nmi_trapbounce
@@ -112,7 +112,7 @@ LABEL_LOCAL(compat_process_nmi)
         orl  $1 << VCPU_TRAP_NMI,%edx
         movb %dl,VCPU_async_exception_mask(%rbx)
         /* FALLTHROUGH */
-compat_process_trap:
+.L_compat_process_trap:
         leaq  VCPU_trap_bounce(%rbx),%rdx
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index fc64ef1fd460..130462ba0e1a 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -188,7 +188,7 @@ FUNC_LOCAL(restore_all_guest)
 
         RESTORE_ALL
         testw $TRAP_syscall,4(%rsp)
-        jz    iret_exit_to_guest
+        jz    .L_iret_exit_to_guest
 
         movq  24(%rsp),%r11           # RFLAGS
         andq  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11
@@ -220,7 +220,7 @@ FUNC_LOCAL(restore_all_guest)
 LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
         movq  8(%rsp), %rcx           # RIP
 /* No special register assumptions. */
-iret_exit_to_guest:
+.L_iret_exit_to_guest:
         andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), 24(%rsp)
         orl   $X86_EFLAGS_IF,24(%rsp)
         addq  $8,%rsp
@@ -432,10 +432,10 @@ UNLIKELY_END(msi_check)
         cmove %rdi, %rdx
 
         test  %rdx, %rdx
-        jz    int80_slow_path
+        jz    .L_int80_slow_path
 #else
         test  %rdi, %rdi
-        jz    int80_slow_path
+        jz    .L_int80_slow_path
 #endif
 
         /* Construct trap_bounce from trap_ctxt[0x80]. */
@@ -457,7 +457,7 @@ UNLIKELY_END(msi_check)
         call  create_bounce_frame
         jmp   test_all_events
 
-int80_slow_path:
+.L_int80_slow_path:
         /* 
          * Setup entry vector and error code as if this was a GPF caused by an
          * IDT entry with DPL==0.
@@ -472,7 +472,7 @@ int80_slow_path:
          * need to set up %r14 here, while %r15 is required to still be zero.
          */
         GET_STACK_END(14)
-        jmp   handle_exception_saved
+        jmp   .L_handle_exception_saved
 END(entry_int80)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
@@ -750,10 +750,10 @@ FUNC(handle_exception, 0)
         cmovnz %r12d, %r13d
 .Lxcpt_cr3_okay:
 
-handle_exception_saved:
+.L_handle_exception_saved:
         GET_CURRENT(bx)
         testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
-        jz    exception_with_ints_disabled
+        jz    .L_exception_with_ints_disabled
 
 #if defined(CONFIG_PV32)
         ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
@@ -859,9 +859,9 @@ handle_exception_saved:
 #endif
 
 /* No special register assumptions. */
-exception_with_ints_disabled:
+.L_exception_with_ints_disabled:
         testb $3,UREGS_cs(%rsp)         # interrupts disabled outside Xen?
-        jnz   FATAL_exception_with_ints_disabled
+        jnz   .L_FATAL_exception_with_ints_disabled
         movq  %rsp,%rdi
         call  search_pre_exception_table
         testq %rax,%rax                 # no fixup code for faulting EIP?
@@ -891,7 +891,7 @@ exception_with_ints_disabled:
         jmp   restore_all_xen           # return to fixup code
 
 /* No special register assumptions. */
-FATAL_exception_with_ints_disabled:
+.L_FATAL_exception_with_ints_disabled:
         xorl  %esi,%esi
         movq  %rsp,%rdi
         tailcall fatal_trap
-- 
2.30.2


