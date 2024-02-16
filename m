Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E6857AAB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 11:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682126.1061172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravnv-0006fY-6q; Fri, 16 Feb 2024 10:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682126.1061172; Fri, 16 Feb 2024 10:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravnv-0006e0-1N; Fri, 16 Feb 2024 10:50:51 +0000
Received: by outflank-mailman (input) for mailman id 682126;
 Fri, 16 Feb 2024 10:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EzDv=JZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ravnu-0006cp-9G
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 10:50:50 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f112af2-ccb9-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 11:50:49 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3dfb2e03e7so6644266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 02:50:49 -0800 (PST)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ne8-20020a1709077b8800b00a3d7bcfb9a1sm1433960ejc.128.2024.02.16.02.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:50:48 -0800 (PST)
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
X-Inumbo-ID: 3f112af2-ccb9-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708080649; x=1708685449; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cD+nRRn5234Rjd+cd7IoO2ec6BbGHAkowqpgkrzy5XA=;
        b=iH5vs59wCTgMByxeGjJ2AqG4Vfj9si4BPsFytm88B3DE3S5hC2niScNgYK/xmyngGT
         kGZAmZMeVlZoz1TM6YjPTMN8nSp294AMZcnSHRumxfAF05bvTRgOU4GSVH8rriBhILVH
         nZM8H7CQ3FU+7Xb4/f/JxTB4rd19OQLJ2/CZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708080649; x=1708685449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD+nRRn5234Rjd+cd7IoO2ec6BbGHAkowqpgkrzy5XA=;
        b=jaenvzPlb3EU5FdrAEPCq/RQM/Q73shIMRrxhd2qcV+Lx/0UD1Lyu3RCC11HaEdq1y
         NAs1vLaoljHOOSMQ3ER9XfEtpScd8G65+Z94SlCf2JllTypbUI4LprSvMHc8feUJFTnf
         XzbjARS5dkzjof+ZfM6H96c7VBzYmber66wbJh1oWUyiRgNmOwxP87IYf5yTNiEOrdi2
         TMTCOHvDhFjFyRldg0us6mtxrZlkSWE1XT3H96W8a+BqIVgVALc1x0LgGI+5637JblX+
         /DHttZy86wCaRU6y5h28oTwqTFL/wtFMZAlrt+w1a62/U9+/OdDZjuaiHgwLrgVUbQr6
         CYEw==
X-Gm-Message-State: AOJu0YwNEWylU1vVOKo0ekigFOfH7W9zJFW7ZnRsW+1V/JKDLn7xA7Ij
	NB7A6iyNAEHd8ZKCFYPMOfxI0MMenIJ3F+fhTwkTy9W4npJPDMukG+eP362iba4I9GFb4646Kd9
	lpn4isg==
X-Google-Smtp-Source: AGHT+IHfXNgrj41aCXJ+QeCVM4Q1TrEtxbYkdGXnPKuwRqTi4lpf3U5XaH+rziCS1kmzkbp1o53D4g==
X-Received: by 2002:a17:906:ad96:b0:a3d:eb78:c552 with SMTP id la22-20020a170906ad9600b00a3deb78c552mr658238ejb.13.1708080648723;
        Fri, 16 Feb 2024 02:50:48 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] Reduce assembly code size of exception entry points
Date: Fri, 16 Feb 2024 10:50:28 +0000
Message-Id: <20240216105028.9517-1-frediano.ziglio@cloud.com>
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
--
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
index ecdd6e5b47..f07e7ed3ac 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -22,6 +22,14 @@
 #endif
 .endm
 
+.macro BUILD_BUG_ON condstr cond:vararg
+        .if \cond
+        .error "Condition \condstr not satisfied"
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
+        testb $TRAP_syscall >> 8,4+1(%rsp)
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
+        orb   $TRAP_syscall >> 8,UREGS_entry_vector+8+1(%rsp)
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


