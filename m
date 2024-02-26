Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A562D8675B6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685527.1066398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVg-0005f3-D9; Mon, 26 Feb 2024 12:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685527.1066398; Mon, 26 Feb 2024 12:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVg-0005Z4-8G; Mon, 26 Feb 2024 12:55:08 +0000
Received: by outflank-mailman (input) for mailman id 685527;
 Mon, 26 Feb 2024 12:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reaVf-0004hn-2l
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:55:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430a8b83-d4a6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:55:05 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so399551066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:55:05 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a42e4b5ab00sm2379645ejc.41.2024.02.26.04.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 04:55:04 -0800 (PST)
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
X-Inumbo-ID: 430a8b83-d4a6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708952104; x=1709556904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwdL6fju3yL7qCFHqrnxqIG6VGZd2rsCO2B5E1ELuco=;
        b=FPXCLop5y5Fmug6EbeIqryKW/Hwk+uVDYAeSGE2Z5XAEsg6ni+Jdq3zMAHUv2UXqDf
         5g7rJ+j8PvxD+io7l2r32Y6bG0Q+GD0sks2HXvEbPaWK8ccT0yTnuEw4S3XoOnYocv0n
         FiKSZxDDtPMBL38gR3P+ebg5TBygJ4R80yVFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952104; x=1709556904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwdL6fju3yL7qCFHqrnxqIG6VGZd2rsCO2B5E1ELuco=;
        b=OuEzg6hUpp8eDrSfnltJcr6oy5cq3GDWCgIO5dn+Kfw8KCFjIMAnOK6AGzgC6/hmDH
         DXvmhuzt62Js1lvwTIsoXiP0zPYKdAL8Sxt6qfHcHMzl5xt7Z5b905hpOYJ9PKqQEJcH
         29DDOx1UtU7WndN1Q12YoaEhiwuSl7OK0TAcisy82S77iKUvn+0KYu2MPDY/q/hU52mp
         a1dYLFdKrZnKBWqAefxdtW5sBqhluNX8m0phkr1OF+P2Iobh4uRuzGbfjH0jJ/kp0n5i
         7KNiP0+XlOO74JDqijV3NnKTrMC2R7Coget9XqEBT537C0nurPA9T0NHGJe/kiySMO+D
         lsjQ==
X-Gm-Message-State: AOJu0Ywohu4KyGCYDFFkiLYCj3Ce6E87uYPkJbj/0nnNewhKaHQUtFs6
	21dSPKTETW1MkG96a49MN6/gwjJnt1iT56TuWkUUMk9tcvzWmhLaFYtN4WYyEJE1DLzhcMNmBG3
	S
X-Google-Smtp-Source: AGHT+IEiO4/3u92iuWSWX1XLK6tyUrg8vJ3vqcOHRIZXVtosNyOvF+7YKfdvK7IrnDxa4yULQuLlIg==
X-Received: by 2002:a17:906:57d3:b0:a43:239c:3d0d with SMTP id u19-20020a17090657d300b00a43239c3d0dmr2556694ejr.37.1708952104635;
        Mon, 26 Feb 2024 04:55:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/entry: Introduce EFRAME_* constants
Date: Mon, 26 Feb 2024 12:55:01 +0000
Message-Id: <20240226125501.1233599-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

restore_all_guest() does a lot of manipulation of the stack after popping the
GPRs, and uses raw %rsp displacements to do so.  Also, almost all entrypaths
use raw %rsp displacements prior to pushing GPRs.

Provide better mnemonics, to aid readability and reduce the chance of errors
when editing.

No functional change.  The resulting binary is identical.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/asm-offsets.c  | 17 ++++++++
 xen/arch/x86/x86_64/compat/entry.S |  2 +-
 xen/arch/x86/x86_64/entry.S        | 68 +++++++++++++++---------------
 3 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index fee0edc61abb..4cc23cd032c1 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -51,6 +51,23 @@ void __dummy__(void)
     OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
     BLANK();
 
+    /*
+     * EFRAME_* is for the entry/exit logic where %rsp is pointing at
+     * UREGS_error_code and GPRs are still guest values.
+     */
+#define OFFSET_EF(sym, mem)                                             \
+    DEFINE(sym, offsetof(struct cpu_user_regs, mem) -                   \
+                offsetof(struct cpu_user_regs, error_code))
+
+    OFFSET_EF(EFRAME_entry_vector,    entry_vector);
+    OFFSET_EF(EFRAME_rip,             rip);
+    OFFSET_EF(EFRAME_cs,              cs);
+    OFFSET_EF(EFRAME_eflags,          eflags);
+    OFFSET_EF(EFRAME_rsp,             rsp);
+    BLANK();
+
+#undef OFFSET_EF
+
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
     OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 727ab65290de..2f8fe5ebfbe4 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -15,7 +15,7 @@ FUNC(entry_int82)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-        movb  $HYPERCALL_VECTOR, 4(%rsp)
+        movb  $HYPERCALL_VECTOR, EFRAME_entry_vector(%rsp)
         SAVE_ALL compat=1 /* DPL1 gate, restricted to 32bit PV guests only. */
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index f8938b0b42fd..1b846f3aaff0 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -188,15 +188,15 @@ FUNC_LOCAL(restore_all_guest)
 
         RESTORE_ALL
         BUILD_BUG_ON(TRAP_syscall & 0xff)
-        testb $TRAP_syscall >> 8, 4+1(%rsp)
+        testb $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         jz    iret_exit_to_guest
 
-        movq  24(%rsp),%r11           # RFLAGS
+        mov   EFRAME_eflags(%rsp), %r11
         andq  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11
         orq   $X86_EFLAGS_IF,%r11
 
         /* Don't use SYSRET path if the return address is not canonical. */
-        movq  8(%rsp),%rcx
+        mov   EFRAME_rip(%rsp), %rcx
         sarq  $47,%rcx
         incl  %ecx
         cmpl  $1,%ecx
@@ -211,19 +211,19 @@ FUNC_LOCAL(restore_all_guest)
         ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
 #endif
 
-        movq  8(%rsp), %rcx           # RIP
-        cmpw  $FLAT_USER_CS32,16(%rsp)# CS
-        movq  32(%rsp),%rsp           # RSP
+        mov   EFRAME_rip(%rsp), %rcx
+        cmpw  $FLAT_USER_CS32, EFRAME_cs(%rsp)
+        mov   EFRAME_rsp(%rsp), %rsp
         je    1f
         sysretq
 1:      sysretl
 
 LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
-        movq  8(%rsp), %rcx           # RIP
+        mov   EFRAME_rip(%rsp), %rcx
 /* No special register assumptions. */
 iret_exit_to_guest:
-        andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), 24(%rsp)
-        orl   $X86_EFLAGS_IF,24(%rsp)
+        andl  $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), EFRAME_eflags(%rsp)
+        orl   $X86_EFLAGS_IF, EFRAME_eflags(%rsp)
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
@@ -256,7 +256,7 @@ FUNC(lstar_enter)
         pushq %rcx
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
-        movb  $TRAP_syscall >> 8, 4+1(%rsp)
+        movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -295,7 +295,7 @@ FUNC(cstar_enter)
         pushq %rcx
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
-        movb  $TRAP_syscall >> 8, 4+1(%rsp)
+        movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -338,7 +338,7 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $0 /* null rip */
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
-        movb  $TRAP_syscall >> 8, 4+1(%rsp)
+        movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -393,7 +393,7 @@ FUNC(entry_int80)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-        movb  $0x80, 4(%rsp)
+        movb  $0x80, EFRAME_entry_vector(%rsp)
         SAVE_ALL
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
@@ -658,7 +658,7 @@ END(ret_from_intr)
         .section .init.text, "ax", @progbits
 FUNC(early_page_fault)
         ENDBR64
-        movb  $X86_EXC_PF, 4(%rsp)
+        movb  $X86_EXC_PF, EFRAME_entry_vector(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
@@ -727,7 +727,7 @@ END(common_interrupt)
 
 FUNC(entry_PF)
         ENDBR64
-        movb  $X86_EXC_PF, 4(%rsp)
+        movb  $X86_EXC_PF, EFRAME_entry_vector(%rsp)
 END(entry_PF)
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
@@ -911,98 +911,98 @@ END(entry_DE)
 FUNC(entry_MF)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_MF, 4(%rsp)
+        movb  $X86_EXC_MF, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_MF)
 
 FUNC(entry_XM)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_XM, 4(%rsp)
+        movb  $X86_EXC_XM, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_XM)
 
 FUNC(entry_NM)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_NM, 4(%rsp)
+        movb  $X86_EXC_NM, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_NM)
 
 FUNC(entry_DB)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_DB, 4(%rsp)
+        movb  $X86_EXC_DB, EFRAME_entry_vector(%rsp)
         jmp   handle_ist_exception
 END(entry_DB)
 
 FUNC(entry_BP)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_BP, 4(%rsp)
+        movb  $X86_EXC_BP, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_BP)
 
 FUNC(entry_OF)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_OF, 4(%rsp)
+        movb  $X86_EXC_OF, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_OF)
 
 FUNC(entry_BR)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_BR, 4(%rsp)
+        movb  $X86_EXC_BR, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_BR)
 
 FUNC(entry_UD)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_UD, 4(%rsp)
+        movb  $X86_EXC_UD, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_UD)
 
 FUNC(entry_TS)
         ENDBR64
-        movb  $X86_EXC_TS, 4(%rsp)
+        movb  $X86_EXC_TS, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_TS)
 
 FUNC(entry_NP)
         ENDBR64
-        movb  $X86_EXC_NP, 4(%rsp)
+        movb  $X86_EXC_NP, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_NP)
 
 FUNC(entry_SS)
         ENDBR64
-        movb  $X86_EXC_SS, 4(%rsp)
+        movb  $X86_EXC_SS, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_SS)
 
 FUNC(entry_GP)
         ENDBR64
-        movb  $X86_EXC_GP, 4(%rsp)
+        movb  $X86_EXC_GP, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_GP)
 
 FUNC(entry_AC)
         ENDBR64
-        movb  $X86_EXC_AC, 4(%rsp)
+        movb  $X86_EXC_AC, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_AC)
 
 FUNC(entry_CP)
         ENDBR64
-        movb  $X86_EXC_CP, 4(%rsp)
+        movb  $X86_EXC_CP, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 END(entry_CP)
 
 FUNC(entry_DF)
         ENDBR64
-        movb  $X86_EXC_DF, 4(%rsp)
+        movb  $X86_EXC_DF, EFRAME_entry_vector(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
@@ -1028,7 +1028,7 @@ END(entry_DF)
 FUNC(entry_NMI)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_NMI, 4(%rsp)
+        movb  $X86_EXC_NMI, EFRAME_entry_vector(%rsp)
 END(entry_NMI)
 
 FUNC(handle_ist_exception)
@@ -1164,7 +1164,7 @@ END(handle_ist_exception)
 FUNC(entry_MC)
         ENDBR64
         pushq $0
-        movb  $X86_EXC_MC, 4(%rsp)
+        movb  $X86_EXC_MC, EFRAME_entry_vector(%rsp)
         jmp   handle_ist_exception
 END(entry_MC)
 
@@ -1203,7 +1203,7 @@ FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
 1:
         ENDBR64
         pushq $0
-        movb  $vec,4(%rsp)
+        movb  $vec, EFRAME_entry_vector(%rsp)
         jmp   common_interrupt
 
         entrypoint 1b
@@ -1217,7 +1217,7 @@ FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
         test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
         jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
         pushq $0             /* error code, and insert an empty one if not.              */
-2:      movb  $vec,4(%rsp)
+2:      movb  $vec, EFRAME_entry_vector(%rsp)
         jmp   handle_exception
 
         entrypoint 1b
-- 
2.30.2


