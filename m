Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4743B3C6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 16:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216469.376092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfNDx-0005i7-0E; Tue, 26 Oct 2021 14:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216469.376092; Tue, 26 Oct 2021 14:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfNDw-0005gK-TE; Tue, 26 Oct 2021 14:14:44 +0000
Received: by outflank-mailman (input) for mailman id 216469;
 Tue, 26 Oct 2021 14:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pRP=PO=gmail.com=jiangshanlai@srs-us1.protection.inumbo.net>)
 id 1mfNDu-0005gE-H1
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 14:14:42 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 871d893b-93e4-4149-90ac-bf2689792f4a;
 Tue, 26 Oct 2021 14:14:41 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id np13so11036768pjb.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 Oct 2021 07:14:41 -0700 (PDT)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id h10sm926802pfc.104.2021.10.26.07.14.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 07:14:39 -0700 (PDT)
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
X-Inumbo-ID: 871d893b-93e4-4149-90ac-bf2689792f4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6cSF3siLASOQuNbVIvhuxpwn8ZXjL6+61RmHjLRG8c=;
        b=Ucl2O9k3psg2jnvS3J6hRGbgDOF4EIUioDWdfxkg4CnBvKahmPqj3OoydGkPn0NR72
         dfO1NR6Pigcnp1siQCVzfXLC4xemzs+NTfqDLwVmYoAdlfS/mW5jgHg7x30nrXEDQJ94
         LH6+pJE6+DfghqQTynIB2W3RuRb/ypGMTs7ydiEL+pxEO+o3mJmyc3QuZuWy+9abQ3Ka
         a5dJyalnHPqU65fL1zyqICOeX3uqNEVsNg9LOe9B95gfLrauPAju9rWKgbd+ipo7VPFV
         JrvaE5FDM46nTPOcyLdjFRE0OQhQCjzVpBy+c9F3gogMzuLtutIfNKsJO74uUGqgqRzw
         f51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6cSF3siLASOQuNbVIvhuxpwn8ZXjL6+61RmHjLRG8c=;
        b=AY5MRoEpfyE7k9F4YAeYBqSEwo6ETdqlowPU2baT+tnCUGl0T1IS7s5TiI4MGIuqBB
         /P/xif8yXw+QQ/ZxMC1i6ypMJ3NGyLNvgVSgWCebSr5yV7sjYNyQrJ1av+Q7fZXbx6ld
         I80nGjR7kcyRWVcVu97ZxqjQhMl0s6BmNjFck+iFcRKneSzA8PfIjQmCm/r/yOLajM4g
         gQltRGa5xEqK7o+Z/4VtdJGNwms0AYt+Acl5B2V50103O8wFE3xhSqiDzVoh+UYk6CIb
         cJI/TTBMP5jKvG+VktMohaJT7u4kKhblDfwI4oI37qrblX5dGwGP975PNp0sYLB4RvDB
         cxsw==
X-Gm-Message-State: AOAM532Ls13lR8u/wTRjyXHmwo28WcLVgWWXLcBE9JLZb6bsvp1YcsUG
	PMp5gj5ByW8QvgXk04hsZJg=
X-Google-Smtp-Source: ABdhPJzRIJnffX6e9BspyBRHQkB9rRnTeGr8WfylFBrSWNzrM2VJybqn73y0Kg3/38zUXZ2Nv+vcsQ==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id pi10mr29132607pjb.142.1635257680326;
        Tue, 26 Oct 2021 07:14:40 -0700 (PDT)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Peter Anvin <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V4 04/50] x86/xen: Add xenpv_restore_regs_and_return_to_usermode()
Date: Tue, 26 Oct 2021 22:13:34 +0800
Message-Id: <20211026141420.17138-5-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211026141420.17138-1-jiangshanlai@gmail.com>
References: <20211026141420.17138-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

While in the native case, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is the
trampoline stack.  But XEN pv doesn't use trampoline stack, so
PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is also the kernel stack.  Hence source
and destination stacks are identical in that case, which means reusing
swapgs_restore_regs_and_return_to_usermode() in XEN pv would cause %rsp
to move up to the top of the kernel stack and leave the IRET frame below
%rsp, which is dangerous to be corrupted if #NMI / #MC hit as either of
these events occurring in the middle of the stack pushing would clobber
data on the (original) stack.

And swapgs_restore_regs_and_return_to_usermode() pushing the IRET frame
on to the original address is useless and error-prone when there is any
future attempt to modify the code.

Fixes: 7f2590a110b8 ("x86/entry/64: Use a per-CPU trampoline stack for IDT entries")
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: Peter Anvin <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S        |  9 ++++++---
 arch/x86/entry/entry_64_compat.S |  7 ++++---
 arch/x86/xen/xen-asm.S           | 27 +++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 9d468c8877e2..0dde5a253dda 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -119,7 +119,7 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
 	 * In the Xen PV case we must use iret anyway.
 	 */
 
-	ALTERNATIVE "", "jmp	swapgs_restore_regs_and_return_to_usermode", \
+	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", \
 		X86_FEATURE_XENPV
 
 	movq	RCX(%rsp), %rcx
@@ -286,7 +286,8 @@ SYM_CODE_START(ret_from_fork)
 	UNWIND_HINT_REGS
 	movq	%rsp, %rdi
 	call	syscall_exit_to_user_mode	/* returns with IRQs disabled */
-	jmp	swapgs_restore_regs_and_return_to_usermode
+	ALTERNATIVE "jmp swapgs_restore_regs_and_return_to_usermode",	\
+		"jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 
 1:
 	/* kernel thread */
@@ -566,6 +567,7 @@ __irqentry_text_start:
 __irqentry_text_end:
 
 SYM_CODE_START_LOCAL(common_interrupt_return)
+SYM_INNER_LABEL(xenpv_restore_regs_and_return_to_usermode, SYM_L_WEAK) /* placeholder */
 SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
 #ifdef CONFIG_DEBUG_ENTRY
 	/* Assert that pt_regs indicates user mode. */
@@ -1055,7 +1057,8 @@ SYM_CODE_START_LOCAL(error_return)
 	DEBUG_ENTRY_ASSERT_IRQS_OFF
 	testb	$3, CS(%rsp)
 	jz	restore_regs_and_return_to_kernel
-	jmp	swapgs_restore_regs_and_return_to_usermode
+	ALTERNATIVE "jmp swapgs_restore_regs_and_return_to_usermode",	\
+		"jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 SYM_CODE_END(error_return)
 
 /*
diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index 0051cf5c792d..2a4d9532dfd5 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -139,7 +139,7 @@ SYM_INNER_LABEL(entry_SYSENTER_compat_after_hwframe, SYM_L_GLOBAL)
 	call	do_SYSENTER_32
 	/* XEN PV guests always use IRET path */
 	ALTERNATIVE "testl %eax, %eax; jz swapgs_restore_regs_and_return_to_usermode", \
-		    "jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
+		    "jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 	jmp	sysret32_from_system_call
 
 .Lsysenter_fix_flags:
@@ -256,7 +256,7 @@ SYM_INNER_LABEL(entry_SYSCALL_compat_after_hwframe, SYM_L_GLOBAL)
 	call	do_fast_syscall_32
 	/* XEN PV guests always use IRET path */
 	ALTERNATIVE "testl %eax, %eax; jz swapgs_restore_regs_and_return_to_usermode", \
-		    "jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
+		    "jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 
 	/* Opportunistic SYSRET */
 sysret32_from_system_call:
@@ -411,5 +411,6 @@ SYM_CODE_START(entry_INT80_compat)
 
 	movq	%rsp, %rdi
 	call	do_int80_syscall_32
-	jmp	swapgs_restore_regs_and_return_to_usermode
+	ALTERNATIVE "jmp swapgs_restore_regs_and_return_to_usermode",	\
+		"jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 SYM_CODE_END(entry_INT80_compat)
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 220dd9678494..032be1bab113 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -20,6 +20,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <../entry/calling.h>
 
 .pushsection .noinstr.text, "ax"
 /*
@@ -192,6 +193,32 @@ SYM_CODE_START(xen_iret)
 	jmp hypercall_iret
 SYM_CODE_END(xen_iret)
 
+/*
+ * XEN pv doesn't use trampoline stack, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is
+ * also the kernel stack.  Reusing swapgs_restore_regs_and_return_to_usermode()
+ * in XEN pv would cause %rsp to move up to the top of the kernel stack and
+ * leave the IRET frame below %rsp, which is dangerous to be corrupted if #NMI
+ * interrupts. And swapgs_restore_regs_and_return_to_usermode() pushing the IRET
+ * frame at the same address is useless.
+ */
+SYM_CODE_START(xenpv_restore_regs_and_return_to_usermode)
+	UNWIND_HINT_REGS
+#ifdef CONFIG_DEBUG_ENTRY
+	/* Assert that pt_regs indicates user mode. */
+	testb	$3, CS(%rsp)
+	jnz	1f
+	ud2
+1:
+#endif
+	POP_REGS
+
+	/* stackleak_erase() can work safely on the kernel stack. */
+	STACKLEAK_ERASE_NOCLOBBER
+
+	addq	$8, %rsp	/* skip regs->orig_ax */
+	jmp xen_iret
+SYM_CODE_END(xenpv_restore_regs_and_return_to_usermode)
+
 /*
  * Xen handles syscall callbacks much like ordinary exceptions, which
  * means we have:
-- 
2.19.1.6.gb485710b


