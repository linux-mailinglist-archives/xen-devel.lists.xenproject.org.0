Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76C46D1EB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242186.418928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuwY-0004Vn-CH; Wed, 08 Dec 2021 11:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242186.418928; Wed, 08 Dec 2021 11:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuwY-0004TQ-9F; Wed, 08 Dec 2021 11:17:02 +0000
Received: by outflank-mailman (input) for mailman id 242186;
 Wed, 08 Dec 2021 11:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muup1-0006Yt-6J
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:15 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 468925f5-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:09:14 +0100 (CET)
Received: by mail-pf1-x435.google.com with SMTP id z6so2145783pfe.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:14 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id q10sm3232415pfk.180.2021.12.08.03.09.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:09:12 -0800 (PST)
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
X-Inumbo-ID: 468925f5-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OSMT+TQw2RUHxNW8atVbB9ZMIOeuqyP7ER0LvB+dp8=;
        b=p9amC8ioLdWqBeAJ4CjkDRZ1SNu2S6IWtNPrQgya84oZpDa9clfN6COADE//h/Kczz
         kQ+fmFgTFQoLYUpO3SxmFlpuPVleUj1yU37SK/cIZ0B+1mzWQP1bXTdmwTYJqBqgidym
         s3Qnw3+ezN8X07/YBXDOFJMTCWVdRYuXNtqsZb9MYstubPgHdxVejo3WZ/+NjwbHXH2U
         8tjQd71AvCYyeR33oziwHtkT65rxg9yzijXFTi0+rKnlPvNRCFSokL+RsxQRBvOrVIrU
         w/GkvVUeb2F4qxGFfEyZK3vg73sGRS4uXqjhQZh5lj5xic5xJsV2YQ+0E79kCZaZeBK8
         qj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OSMT+TQw2RUHxNW8atVbB9ZMIOeuqyP7ER0LvB+dp8=;
        b=sLtDYEapG9TOyv52Jjozb9YXPNWpHknkGvwfvv1A0wZ1cP5tuixjH3pDIOpY58yP0n
         nYrYTZkH4IBT9/TO4z+PVxx4T4iy97Agsgsx9dVJVHR4ndOmD1zmLT4+QDs+rQ14UlUT
         zabPop6ORuqpg8surRWM0+6eUdBuw7C4evKFYr2SEA/FqCZf/v7y0NpmG5Rm+60GR7ec
         h7RTMIIYgnoLCy7zOPbB55aad94j0YWu4Blq59dgaVxgQhVPuT8TJWwETsaBLe0eEYfF
         R7Pvime0zRVylUicmKz2SFYUkyqamoc3IILrDiqb2OFqFDUxomqb/OXKTfsRmx3CKg04
         VGog==
X-Gm-Message-State: AOAM5335gThepBertzopR7foo9NJRHRrsm0tCGeISj8R0cRMk78vfoui
	7F/RSNt8jYStAK4etYh8iSU=
X-Google-Smtp-Source: ABdhPJyXGPiRK3kSpyhR6KL61u0teYkSKfkL2XAKTjzosU2gZ8Lz/nBoNiGVciQ2kf7/fPZtckPd8w==
X-Received: by 2002:a63:6a03:: with SMTP id f3mr28895124pgc.618.1638961752671;
        Wed, 08 Dec 2021 03:09:12 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Joerg Roedel <jroedel@suse.de>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 08/11] x86/entry: Use idtentry macro for entry_INT80_compat
Date: Wed,  8 Dec 2021 19:08:30 +0800
Message-Id: <20211208110833.65366-9-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

entry_INT80_compat is identical to idtentry macro except a special
handling for %rax in the prolog.

Add the prolog to idtentry and use idtentry for entry_INT80_compat.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S        |  18 ++++++
 arch/x86/entry/entry_64_compat.S | 102 -------------------------------
 arch/x86/include/asm/idtentry.h  |  47 ++++++++++++++
 arch/x86/include/asm/proto.h     |   4 --
 4 files changed, 65 insertions(+), 106 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 6100007fd03f..1fd5efaa99b3 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -371,6 +371,24 @@ SYM_CODE_START(\asmsym)
 		pushq	$-1			/* ORIG_RAX: no syscall to restart */
 	.endif
 
+	.if \vector == IA32_SYSCALL_VECTOR
+		/*
+		 * User tracing code (ptrace or signal handlers) might assume
+		 * that the saved RAX contains a 32-bit number when we're
+		 * invoking a 32-bit syscall.  Just in case the high bits are
+		 * nonzero, zero-extend the syscall number.  (This could almost
+		 * certainly be deleted with no ill effects.)
+		 */
+		movl	%eax, %eax
+
+		/*
+		 * do_int80_syscall_32() expects regs->orig_ax to be user ax,
+		 * and regs->ax to be $-ENOSYS.
+		 */
+		movq	%rax, (%rsp)
+		movq	$-ENOSYS, %rax
+	.endif
+
 	.if \vector == X86_TRAP_BP
 		/*
 		 * If coming from kernel space, create a 6-word gap to allow the
diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index 0051cf5c792d..a4fcea0cab14 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -311,105 +311,3 @@ sysret32_from_system_call:
 	swapgs
 	sysretl
 SYM_CODE_END(entry_SYSCALL_compat)
-
-/*
- * 32-bit legacy system call entry.
- *
- * 32-bit x86 Linux system calls traditionally used the INT $0x80
- * instruction.  INT $0x80 lands here.
- *
- * This entry point can be used by 32-bit and 64-bit programs to perform
- * 32-bit system calls.  Instances of INT $0x80 can be found inline in
- * various programs and libraries.  It is also used by the vDSO's
- * __kernel_vsyscall fallback for hardware that doesn't support a faster
- * entry method.  Restarted 32-bit system calls also fall back to INT
- * $0x80 regardless of what instruction was originally used to do the
- * system call.
- *
- * This is considered a slow path.  It is not used by most libc
- * implementations on modern hardware except during process startup.
- *
- * Arguments:
- * eax  system call number
- * ebx  arg1
- * ecx  arg2
- * edx  arg3
- * esi  arg4
- * edi  arg5
- * ebp  arg6
- */
-SYM_CODE_START(entry_INT80_compat)
-	UNWIND_HINT_EMPTY
-	/*
-	 * Interrupts are off on entry.
-	 */
-	ASM_CLAC			/* Do this early to minimize exposure */
-	SWAPGS
-
-	/*
-	 * User tracing code (ptrace or signal handlers) might assume that
-	 * the saved RAX contains a 32-bit number when we're invoking a 32-bit
-	 * syscall.  Just in case the high bits are nonzero, zero-extend
-	 * the syscall number.  (This could almost certainly be deleted
-	 * with no ill effects.)
-	 */
-	movl	%eax, %eax
-
-	/* switch to thread stack expects orig_ax and rdi to be pushed */
-	pushq	%rax			/* pt_regs->orig_ax */
-	pushq	%rdi			/* pt_regs->di */
-
-	/* Need to switch before accessing the thread stack. */
-	SWITCH_TO_KERNEL_CR3 scratch_reg=%rdi
-
-	/* In the Xen PV case we already run on the thread stack. */
-	ALTERNATIVE "", "jmp .Lint80_keep_stack", X86_FEATURE_XENPV
-
-	movq	%rsp, %rdi
-	movq	PER_CPU_VAR(cpu_current_top_of_stack), %rsp
-
-	pushq	6*8(%rdi)		/* regs->ss */
-	pushq	5*8(%rdi)		/* regs->rsp */
-	pushq	4*8(%rdi)		/* regs->eflags */
-	pushq	3*8(%rdi)		/* regs->cs */
-	pushq	2*8(%rdi)		/* regs->ip */
-	pushq	1*8(%rdi)		/* regs->orig_ax */
-	pushq	(%rdi)			/* pt_regs->di */
-.Lint80_keep_stack:
-
-	pushq	%rsi			/* pt_regs->si */
-	xorl	%esi, %esi		/* nospec   si */
-	pushq	%rdx			/* pt_regs->dx */
-	xorl	%edx, %edx		/* nospec   dx */
-	pushq	%rcx			/* pt_regs->cx */
-	xorl	%ecx, %ecx		/* nospec   cx */
-	pushq	$-ENOSYS		/* pt_regs->ax */
-	pushq   %r8			/* pt_regs->r8 */
-	xorl	%r8d, %r8d		/* nospec   r8 */
-	pushq   %r9			/* pt_regs->r9 */
-	xorl	%r9d, %r9d		/* nospec   r9 */
-	pushq   %r10			/* pt_regs->r10*/
-	xorl	%r10d, %r10d		/* nospec   r10 */
-	pushq   %r11			/* pt_regs->r11 */
-	xorl	%r11d, %r11d		/* nospec   r11 */
-	pushq   %rbx                    /* pt_regs->rbx */
-	xorl	%ebx, %ebx		/* nospec   rbx */
-	pushq   %rbp                    /* pt_regs->rbp */
-	xorl	%ebp, %ebp		/* nospec   rbp */
-	pushq   %r12                    /* pt_regs->r12 */
-	xorl	%r12d, %r12d		/* nospec   r12 */
-	pushq   %r13                    /* pt_regs->r13 */
-	xorl	%r13d, %r13d		/* nospec   r13 */
-	pushq   %r14                    /* pt_regs->r14 */
-	xorl	%r14d, %r14d		/* nospec   r14 */
-	pushq   %r15                    /* pt_regs->r15 */
-	xorl	%r15d, %r15d		/* nospec   r15 */
-
-	UNWIND_HINT_REGS
-
-	cld
-
-	movq	%rsp, %rdi
-	call	do_int80_syscall_32
-	jmp	swapgs_restore_regs_and_return_to_usermode
-SYM_CODE_END(entry_INT80_compat)
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 1345088e9902..38cb2e0dc2c7 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -204,6 +204,20 @@ __visible noinstr void func(struct pt_regs *regs,			\
 									\
 static noinline void __##func(struct pt_regs *regs, u32 vector)
 
+/**
+ * DECLARE_IDTENTRY_IA32_EMULATION - Declare functions for int80
+ * @vector:	Vector number (ignored for C)
+ * @asm_func:	Function name of the entry point
+ * @cfunc:	The C handler called from the ASM entry point (ignored for C)
+ *
+ * Declares two functions:
+ * - The ASM entry point: asm_func
+ * - The XEN PV trap entry point: xen_##asm_func (maybe unused)
+ */
+#define DECLARE_IDTENTRY_IA32_EMULATION(vector, asm_func, cfunc)	\
+	asmlinkage void asm_func(void);					\
+	asmlinkage void xen_##asm_func(void)
+
 /**
  * DECLARE_IDTENTRY_SYSVEC - Declare functions for system vector entry points
  * @vector:	Vector number (ignored for C)
@@ -430,6 +444,35 @@ __visible noinstr void func(struct pt_regs *regs,			\
 #define DECLARE_IDTENTRY_ERRORCODE(vector, func)			\
 	idtentry vector asm_##func func has_error_code=1
 
+/*
+ * 32-bit legacy system call entry.
+ *
+ * 32-bit x86 Linux system calls traditionally used the INT $0x80
+ * instruction.  INT $0x80 lands here.
+ *
+ * This entry point can be used by 32-bit and 64-bit programs to perform
+ * 32-bit system calls.  Instances of INT $0x80 can be found inline in
+ * various programs and libraries.  It is also used by the vDSO's
+ * __kernel_vsyscall fallback for hardware that doesn't support a faster
+ * entry method.  Restarted 32-bit system calls also fall back to INT
+ * $0x80 regardless of what instruction was originally used to do the
+ * system call.
+ *
+ * This is considered a slow path.  It is not used by most libc
+ * implementations on modern hardware except during process startup.
+ *
+ * Arguments:
+ * eax  system call number
+ * ebx  arg1
+ * ecx  arg2
+ * edx  arg3
+ * esi  arg4
+ * edi  arg5
+ * ebp  arg6
+ */
+#define DECLARE_IDTENTRY_IA32_EMULATION(vector, asm_func, cfunc)	\
+	idtentry vector asm_func cfunc has_error_code=0
+
 /* Special case for 32bit IRET 'trap'. Do not emit ASM code */
 #define DECLARE_IDTENTRY_SW(vector, func)
 
@@ -631,6 +674,10 @@ DECLARE_IDTENTRY_IRQ(X86_TRAP_OTHER,	common_interrupt);
 DECLARE_IDTENTRY_IRQ(X86_TRAP_OTHER,	spurious_interrupt);
 #endif
 
+#ifdef CONFIG_IA32_EMULATION
+DECLARE_IDTENTRY_IA32_EMULATION(IA32_SYSCALL_VECTOR,	entry_INT80_compat, do_int80_syscall_32);
+#endif
+
 /* System vector entry points */
 #ifdef CONFIG_X86_LOCAL_APIC
 DECLARE_IDTENTRY_SYSVEC(ERROR_APIC_VECTOR,		sysvec_error_interrupt);
diff --git a/arch/x86/include/asm/proto.h b/arch/x86/include/asm/proto.h
index feed36d44d04..c4d331fe65ff 100644
--- a/arch/x86/include/asm/proto.h
+++ b/arch/x86/include/asm/proto.h
@@ -28,10 +28,6 @@ void entry_SYSENTER_compat(void);
 void __end_entry_SYSENTER_compat(void);
 void entry_SYSCALL_compat(void);
 void entry_SYSCALL_compat_safe_stack(void);
-void entry_INT80_compat(void);
-#ifdef CONFIG_XEN_PV
-void xen_entry_INT80_compat(void);
-#endif
 #endif
 
 void x86_configure_nx(void);
-- 
2.19.1.6.gb485710b


