Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C320585A209
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682784.1061944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1ur-0003wH-9Z; Mon, 19 Feb 2024 11:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682784.1061944; Mon, 19 Feb 2024 11:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1ur-0003tF-6Q; Mon, 19 Feb 2024 11:34:33 +0000
Received: by outflank-mailman (input) for mailman id 682784;
 Mon, 19 Feb 2024 11:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdXM=J4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rc1uq-0003t9-F1
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:34:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91a7079-cf1a-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 12:34:31 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so2515426e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 03:34:31 -0800 (PST)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i23-20020a05640200d700b005648745b23bsm567412edu.90.2024.02.19.03.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 03:34:30 -0800 (PST)
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
X-Inumbo-ID: d91a7079-cf1a-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708342470; x=1708947270; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuFdWH4GCSkQ1e+xmjUr9ZfgaI6pfJr2DHBQlULfx2w=;
        b=V0uAc++GCSwHPKGF5ef/vBDKcl4eZo4E6JXnPx6nJSnMES8sCMU+z3Dgvh6VfFrAQ1
         YR54+K3AdrZ0cViSzo9x8RMz9q9UWamsSeDnOgOw3CxFXBj16wL78KgrLNtYVRQMg9zi
         wdPiKNSzHZTjVGmi/V6/qHHU2ZSW/9IOGiyBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342470; x=1708947270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuFdWH4GCSkQ1e+xmjUr9ZfgaI6pfJr2DHBQlULfx2w=;
        b=P2mmpAIj12YoTcuPyLhdefykALvAkZCuz66mngQ287nZ52KzTsXOgvLaVLc5IizPhy
         CFNkw6E6dlaZYYRjfu9DRvXPc1FUNraWRQqva8Ijl3PCAl4f5B4U4PCQoExvwpREaXhG
         dqqepzfzL7OoZZPJEss88AQqJbMKn2dbnOb1H0jxkigp6ZY7tecSMT0v5NNdbbNBQpur
         NwRpsGxeDdc6xnsgoXH0mgBOhpqQjWp9zJyAI1Ripnpp7M1LIid9/N+6hr8dppXRu2Xe
         I+ISP7ZHGyYpW3nLTTsL/plvXLTvMiBjA64g2om69wnkoAwqlE8ttjfxBlZflNHFsGuM
         BRhQ==
X-Gm-Message-State: AOJu0Yw7cvWYMaZeANVBfLDS7nLdHdMWFnmb/zptclnjBb+tdV2cCEdq
	71cdB5hxxCQbeBq3OtuQRM3rjdqglvwfqzoSb7TzOrs65DgnSbYu74prQChJq4n6KAgFnGqOPIt
	v9Ug=
X-Google-Smtp-Source: AGHT+IHuumVYhHP5Ydeb8lviwRaB+4jWX8EqYpu+eD4O2eYJUrhz2LHSDjOONQlrHzrcY63Og9Clqg==
X-Received: by 2002:ac2:55a7:0:b0:512:ac0c:2f81 with SMTP id y7-20020ac255a7000000b00512ac0c2f81mr2194870lfg.40.1708342470555;
        Mon, 19 Feb 2024 03:34:30 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] Reduce assembly code size of entry points
Date: Mon, 19 Feb 2024 11:34:12 +0000
Message-Id: <20240219113412.18445-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many entries we push 8-bytes zero and exception constants are
small so we can just write a single byte saving 3 bytes for
instruction.
With ENDBR64 this reduces the size of many entry points from 32 to
16 bytes (due to alignment).
The push and the mov are overlapping stores either way.  Swapping
between movl and movb will make no difference at all on performance.
Similar code is already used in autogen_stubs.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
--
v4:
- minor space adjustments;
- quoted possible error message;
- update commit subject removing "exception";
- added "Reviewed-by", I hope to got everything asked for.

v3:
- add other missing entries;
- reduce code when TRAP_syscall is used;
- improved commit message.

v2:
- added missing entry points;
- add mention to autogen_stubs code, as suggested.
---
 xen/arch/x86/x86_64/entry.S | 66 ++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ecdd6e5b47..a7bd8f0ca5 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -22,6 +22,14 @@
 #endif
 .endm
 
+.macro BUILD_BUG_ON condstr cond:vararg
+        .if \cond
+        .error "Condition \"\condstr\" not satisfied"
+        .endif
+.endm
+/* preprocessor macro to make error message more user friendly */
+#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond cond
+
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
 FUNC_LOCAL(switch_to_kernel)
@@ -187,7 +195,8 @@ FUNC_LOCAL(restore_all_guest)
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
         RESTORE_ALL
-        testw $TRAP_syscall,4(%rsp)
+        BUILD_BUG_ON(TRAP_syscall & 0xff)
+        testb $TRAP_syscall >> 8, 4+1(%rsp)
         jz    iret_exit_to_guest
 
         movq  24(%rsp),%r11           # RFLAGS
@@ -254,7 +263,8 @@ FUNC(lstar_enter)
         pushq $FLAT_KERNEL_CS64
         pushq %rcx
         pushq $0
-        movl  $TRAP_syscall, 4(%rsp)
+        BUILD_BUG_ON(TRAP_syscall & 0xff)
+        movb  $TRAP_syscall >> 8, 4+1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -292,7 +302,8 @@ FUNC(cstar_enter)
         pushq $FLAT_USER_CS32
         pushq %rcx
         pushq $0
-        movl  $TRAP_syscall, 4(%rsp)
+        BUILD_BUG_ON(TRAP_syscall & 0xff)
+        movb  $TRAP_syscall >> 8, 4+1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -334,7 +345,8 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
         pushq $0
-        movl  $TRAP_syscall, 4(%rsp)
+        BUILD_BUG_ON(TRAP_syscall & 0xff)
+        movb  $TRAP_syscall >> 8, 4+1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -389,7 +401,7 @@ FUNC(entry_int80)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-        movl  $0x80, 4(%rsp)
+        movb  $0x80, 4(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -561,7 +573,8 @@ __UNLIKELY_END(create_bounce_frame_bad_sp)
         /* Rewrite our stack frame and return to guest-OS mode. */
         /* IA32 Ref. Vol. 3: TF, VM, RF and NT flags are cleared on trap. */
         /* Also clear AC: alignment checks shouldn't trigger in kernel mode. */
-        orl   $TRAP_syscall,UREGS_entry_vector+8(%rsp)
+        BUILD_BUG_ON(TRAP_syscall & 0xff)
+        orb   $TRAP_syscall >> 8, UREGS_entry_vector+8+1(%rsp)
         andl  $~(X86_EFLAGS_AC|X86_EFLAGS_VM|X86_EFLAGS_RF|\
                  X86_EFLAGS_NT|X86_EFLAGS_TF),UREGS_eflags+8(%rsp)
         movq  $FLAT_KERNEL_SS,UREGS_ss+8(%rsp)
@@ -653,7 +666,7 @@ END(ret_from_intr)
         .section .init.text, "ax", @progbits
 FUNC(early_page_fault)
         ENDBR64
-        movl  $X86_EXC_PF, 4(%rsp)
+        movb  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
@@ -722,7 +735,7 @@ END(common_interrupt)
 
 FUNC(entry_PF)
         ENDBR64
-        movl  $X86_EXC_PF, 4(%rsp)
+        movb  $X86_EXC_PF, 4(%rsp)
 END(entry_PF)
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
@@ -898,105 +911,106 @@ END(handle_exception)
 FUNC(entry_DE)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_DE, 4(%rsp)
+        /* no need to update exception type, already 0 */
+        BUILD_BUG_ON(X86_EXC_DE)
         jmp   handle_exception
 END(entry_DE)
 
 FUNC(entry_MF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_MF, 4(%rsp)
+        movb  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
 END(entry_MF)
 
 FUNC(entry_XM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_XM, 4(%rsp)
+        movb  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
 END(entry_XM)
 
 FUNC(entry_NM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_NM, 4(%rsp)
+        movb  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
 END(entry_NM)
 
 FUNC(entry_DB)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_DB, 4(%rsp)
+        movb  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
 END(entry_DB)
 
 FUNC(entry_BP)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BP, 4(%rsp)
+        movb  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
 END(entry_BP)
 
 FUNC(entry_OF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_OF, 4(%rsp)
+        movb  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
 END(entry_OF)
 
 FUNC(entry_BR)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BR, 4(%rsp)
+        movb  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
 END(entry_BR)
 
 FUNC(entry_UD)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_UD, 4(%rsp)
+        movb  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
 END(entry_UD)
 
 FUNC(entry_TS)
         ENDBR64
-        movl  $X86_EXC_TS, 4(%rsp)
+        movb  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
 END(entry_TS)
 
 FUNC(entry_NP)
         ENDBR64
-        movl  $X86_EXC_NP, 4(%rsp)
+        movb  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
 END(entry_NP)
 
 FUNC(entry_SS)
         ENDBR64
-        movl  $X86_EXC_SS, 4(%rsp)
+        movb  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
 END(entry_SS)
 
 FUNC(entry_GP)
         ENDBR64
-        movl  $X86_EXC_GP, 4(%rsp)
+        movb  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
 END(entry_GP)
 
 FUNC(entry_AC)
         ENDBR64
-        movl  $X86_EXC_AC, 4(%rsp)
+        movb  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
 END(entry_AC)
 
 FUNC(entry_CP)
         ENDBR64
-        movl  $X86_EXC_CP, 4(%rsp)
+        movb  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
 END(entry_CP)
 
 FUNC(entry_DF)
         ENDBR64
-        movl  $X86_EXC_DF, 4(%rsp)
+        movb  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
@@ -1022,7 +1036,7 @@ END(entry_DF)
 FUNC(entry_NMI)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_NMI, 4(%rsp)
+        movb  $X86_EXC_NMI, 4(%rsp)
 END(entry_NMI)
 
 FUNC(handle_ist_exception)
@@ -1158,7 +1172,7 @@ END(handle_ist_exception)
 FUNC(entry_MC)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_MC, 4(%rsp)
+        movb  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
 END(entry_MC)
 
-- 
2.34.1


