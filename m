Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A882BA978
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 12:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31996.62908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sP-0004XZ-M4; Fri, 20 Nov 2020 11:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31996.62908; Fri, 20 Nov 2020 11:46:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sP-0004W1-Ga; Fri, 20 Nov 2020 11:46:53 +0000
Received: by outflank-mailman (input) for mailman id 31996;
 Fri, 20 Nov 2020 11:46:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4sN-00049L-SW
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cddb6a84-2b34-4457-ba77-fccafcf6d3da;
 Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A72A5ADAA;
 Fri, 20 Nov 2020 11:46:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4sN-00049L-SW
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:51 +0000
X-Inumbo-ID: cddb6a84-2b34-4457-ba77-fccafcf6d3da
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cddb6a84-2b34-4457-ba77-fccafcf6d3da;
	Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUMrirDSxnra8Oma+gri0UEDo4d8qyXqhA5nloZ6vbU=;
	b=gUIrbTY9TW4PtgOvIXmi3Kinifx9I/MC/3Bm5fu/2nYpCQbcNhtCPe+olR5OMdkTDqCBSe
	YNppQla2QC8CZ4kW3bSq9kEZGLxurWenNCQXFT87CWxa/mYVwLiGE+4/QkoBJ+uPuZhRG9
	dPHk/vNhjv5xh4NOOfar3awwKshGFsU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A72A5ADAA;
	Fri, 20 Nov 2020 11:46:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit pvops cruft
Date: Fri, 20 Nov 2020 12:46:26 +0100
Message-Id: <20201120114630.13552-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PVOP_VCALL4() is only used for Xen PV, while PVOP_CALL4() isn't used
at all. Keep PVOP_CALL4() for 64 bits due to symmetry reasons.

This allows to remove the 32-bit definitions of those macros leading
to a substantial simplification of the paravirt macros, as those were
the only ones needing non-empty "pre" and "post" parameters.

PVOP_CALLEE2() and PVOP_VCALLEE2() are used nowhere, so remove them.

Another no longer needed case is special handling of return types
larger than unsigned long. Replace that with a BUILD_BUG_ON().

DISABLE_INTERRUPTS() is used in 32-bit code only, so it can just be
replaced by cli.

INTERRUPT_RETURN in 32-bit code can be replaced by iret.

GET_CR2_INTO_AX and ENABLE_INTERRUPTS are used nowhere, so they can
be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_32.S             |   4 +-
 arch/x86/include/asm/irqflags.h       |   5 --
 arch/x86/include/asm/paravirt.h       |  46 +----------
 arch/x86/include/asm/paravirt_types.h | 112 ++++++++------------------
 arch/x86/kernel/asm-offsets.c         |   3 -
 arch/x86/kernel/head_64.S             |   2 -
 6 files changed, 35 insertions(+), 137 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index df8c017e6161..765487e57d6e 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -430,7 +430,7 @@
 	 * will soon execute iret and the tracer was already set to
 	 * the irqstate after the IRET:
 	 */
-	DISABLE_INTERRUPTS(CLBR_ANY)
+	cli
 	lss	(%esp), %esp			/* switch to espfix segment */
 .Lend_\@:
 #endif /* CONFIG_X86_ESPFIX32 */
@@ -1077,7 +1077,7 @@ restore_all_switch_stack:
 	 * when returning from IPI handler and when returning from
 	 * scheduler to user-space.
 	 */
-	INTERRUPT_RETURN
+	iret
 
 .section .fixup, "ax"
 SYM_CODE_START(asm_iret_error)
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 144d70ea4393..a0efbcd24b86 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -109,9 +109,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 }
 #else
 
-#define ENABLE_INTERRUPTS(x)	sti
-#define DISABLE_INTERRUPTS(x)	cli
-
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(x)		pushfq; popq %rax
@@ -119,8 +116,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 
 #define INTERRUPT_RETURN	jmp native_iret
 
-#else
-#define INTERRUPT_RETURN		iret
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 01b3e36462c3..1dd30c95505d 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -692,6 +692,7 @@ extern void default_banner(void);
 	.if ((~(set)) & mask); pop %reg; .endif
 
 #ifdef CONFIG_X86_64
+#ifdef CONFIG_PARAVIRT_XXL
 
 #define PV_SAVE_REGS(set)			\
 	COND_PUSH(set, CLBR_RAX, rax);		\
@@ -717,46 +718,12 @@ extern void default_banner(void);
 #define PARA_PATCH(off)		((off) / 8)
 #define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .quad, 8)
 #define PARA_INDIRECT(addr)	*addr(%rip)
-#else
-#define PV_SAVE_REGS(set)			\
-	COND_PUSH(set, CLBR_EAX, eax);		\
-	COND_PUSH(set, CLBR_EDI, edi);		\
-	COND_PUSH(set, CLBR_ECX, ecx);		\
-	COND_PUSH(set, CLBR_EDX, edx)
-#define PV_RESTORE_REGS(set)			\
-	COND_POP(set, CLBR_EDX, edx);		\
-	COND_POP(set, CLBR_ECX, ecx);		\
-	COND_POP(set, CLBR_EDI, edi);		\
-	COND_POP(set, CLBR_EAX, eax)
-
-#define PARA_PATCH(off)		((off) / 4)
-#define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .long, 4)
-#define PARA_INDIRECT(addr)	*%cs:addr
-#endif
 
-#ifdef CONFIG_PARAVIRT_XXL
 #define INTERRUPT_RETURN						\
 	PARA_SITE(PARA_PATCH(PV_CPU_iret),				\
 		  ANNOTATE_RETPOLINE_SAFE;				\
 		  jmp PARA_INDIRECT(pv_ops+PV_CPU_iret);)
 
-#define DISABLE_INTERRUPTS(clobbers)					\
-	PARA_SITE(PARA_PATCH(PV_IRQ_irq_disable),			\
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);		\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_irq_disable);	\
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
-
-#define ENABLE_INTERRUPTS(clobbers)					\
-	PARA_SITE(PARA_PATCH(PV_IRQ_irq_enable),			\
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);		\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_irq_enable);		\
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
-#endif
-
-#ifdef CONFIG_X86_64
-#ifdef CONFIG_PARAVIRT_XXL
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(clobbers)                                        \
 	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
@@ -768,17 +735,6 @@ extern void default_banner(void);
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
 
-#ifdef CONFIG_PARAVIRT_XXL
-
-#define GET_CR2_INTO_AX							\
-	PARA_SITE(PARA_PATCH(PV_MMU_read_cr2),				\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_MMU_read_cr2);		\
-		 )
-
-#endif /* CONFIG_PARAVIRT_XXL */
-
-
 #endif /* __ASSEMBLY__ */
 #else  /* CONFIG_PARAVIRT */
 # define default_banner x86_init_noop
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 01af7b944224..b86acbb6449f 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -471,55 +471,34 @@ int paravirt_disable_iospace(void);
 	})
 
 
-#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr,		\
-		      pre, post, ...)					\
+#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	\
 	({								\
-		rettype __ret;						\
 		PVOP_CALL_ARGS;						\
 		PVOP_TEST_NULL(op);					\
-		/* This is 32-bit specific, but is okay in 64-bit */	\
-		/* since this condition will never hold */		\
-		if (sizeof(rettype) > sizeof(unsigned long)) {		\
-			asm volatile(pre				\
-				     paravirt_alt(PARAVIRT_CALL)	\
-				     post				\
-				     : call_clbr, ASM_CALL_CONSTRAINT	\
-				     : paravirt_type(op),		\
-				       paravirt_clobber(clbr),		\
-				       ##__VA_ARGS__			\
-				     : "memory", "cc" extra_clbr);	\
-			__ret = (rettype)((((u64)__edx) << 32) | __eax); \
-		} else {						\
-			asm volatile(pre				\
-				     paravirt_alt(PARAVIRT_CALL)	\
-				     post				\
-				     : call_clbr, ASM_CALL_CONSTRAINT	\
-				     : paravirt_type(op),		\
-				       paravirt_clobber(clbr),		\
-				       ##__VA_ARGS__			\
-				     : "memory", "cc" extra_clbr);	\
-			__ret = (rettype)(__eax & PVOP_RETMASK(rettype));	\
-		}							\
-		__ret;							\
+		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
+		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
+			     : call_clbr, ASM_CALL_CONSTRAINT		\
+			     : paravirt_type(op),			\
+			       paravirt_clobber(clbr),			\
+			       ##__VA_ARGS__				\
+			     : "memory", "cc" extra_clbr);		\
+		(rettype)(__eax & PVOP_RETMASK(rettype));		\
 	})
 
-#define __PVOP_CALL(rettype, op, pre, post, ...)			\
+#define __PVOP_CALL(rettype, op, ...)					\
 	____PVOP_CALL(rettype, op, CLBR_ANY, PVOP_CALL_CLOBBERS,	\
-		      EXTRA_CLOBBERS, pre, post, ##__VA_ARGS__)
+		      EXTRA_CLOBBERS, ##__VA_ARGS__)
 
-#define __PVOP_CALLEESAVE(rettype, op, pre, post, ...)			\
+#define __PVOP_CALLEESAVE(rettype, op, ...)				\
 	____PVOP_CALL(rettype, op.func, CLBR_RET_REG,			\
-		      PVOP_CALLEE_CLOBBERS, ,				\
-		      pre, post, ##__VA_ARGS__)
+		      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
-#define ____PVOP_VCALL(op, clbr, call_clbr, extra_clbr, pre, post, ...)	\
+#define ____PVOP_VCALL(op, clbr, call_clbr, extra_clbr, ...)		\
 	({								\
 		PVOP_VCALL_ARGS;					\
 		PVOP_TEST_NULL(op);					\
-		asm volatile(pre					\
-			     paravirt_alt(PARAVIRT_CALL)		\
-			     post					\
+		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
 			     : call_clbr, ASM_CALL_CONSTRAINT		\
 			     : paravirt_type(op),			\
 			       paravirt_clobber(clbr),			\
@@ -527,84 +506,57 @@ int paravirt_disable_iospace(void);
 			     : "memory", "cc" extra_clbr);		\
 	})
 
-#define __PVOP_VCALL(op, pre, post, ...)				\
+#define __PVOP_VCALL(op, ...)						\
 	____PVOP_VCALL(op, CLBR_ANY, PVOP_VCALL_CLOBBERS,		\
-		       VEXTRA_CLOBBERS,					\
-		       pre, post, ##__VA_ARGS__)
+		       VEXTRA_CLOBBERS, ##__VA_ARGS__)
 
-#define __PVOP_VCALLEESAVE(op, pre, post, ...)				\
+#define __PVOP_VCALLEESAVE(op, ...)					\
 	____PVOP_VCALL(op.func, CLBR_RET_REG,				\
-		      PVOP_VCALLEE_CLOBBERS, ,				\
-		      pre, post, ##__VA_ARGS__)
+		      PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
 
 #define PVOP_CALL0(rettype, op)						\
-	__PVOP_CALL(rettype, op, "", "")
+	__PVOP_CALL(rettype, op)
 #define PVOP_VCALL0(op)							\
-	__PVOP_VCALL(op, "", "")
+	__PVOP_VCALL(op)
 
 #define PVOP_CALLEE0(rettype, op)					\
-	__PVOP_CALLEESAVE(rettype, op, "", "")
+	__PVOP_CALLEESAVE(rettype, op)
 #define PVOP_VCALLEE0(op)						\
-	__PVOP_VCALLEESAVE(op, "", "")
+	__PVOP_VCALLEESAVE(op)
 
 
 #define PVOP_CALL1(rettype, op, arg1)					\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALL1(op, arg1)						\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
 
 #define PVOP_CALLEE1(rettype, op, arg1)					\
-	__PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_CALLEESAVE(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALLEE1(op, arg1)						\
-	__PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_VCALLEESAVE(op, PVOP_CALL_ARG1(arg1))
 
 
 #define PVOP_CALL2(rettype, op, arg1, arg2)				\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1),		\
-		    PVOP_CALL_ARG2(arg2))
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
 #define PVOP_VCALL2(op, arg1, arg2)					\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1),			\
-		     PVOP_CALL_ARG2(arg2))
-
-#define PVOP_CALLEE2(rettype, op, arg1, arg2)				\
-	__PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1),	\
-			  PVOP_CALL_ARG2(arg2))
-#define PVOP_VCALLEE2(op, arg1, arg2)					\
-	__PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1),		\
-			   PVOP_CALL_ARG2(arg2))
-
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
 
 #define PVOP_CALL3(rettype, op, arg1, arg2, arg3)			\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1),		\
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1),			\
 		    PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
 #define PVOP_VCALL3(op, arg1, arg2, arg3)				\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1),			\
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1),				\
 		     PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
 
-/* This is the only difference in x86_64. We can make it much simpler */
-#ifdef CONFIG_X86_32
 #define PVOP_CALL4(rettype, op, arg1, arg2, arg3, arg4)			\
 	__PVOP_CALL(rettype, op,					\
-		    "push %[_arg4];", "lea 4(%%esp),%%esp;",		\
-		    PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),		\
-		    PVOP_CALL_ARG3(arg3), [_arg4] "mr" ((u32)(arg4)))
-#define PVOP_VCALL4(op, arg1, arg2, arg3, arg4)				\
-	__PVOP_VCALL(op,						\
-		    "push %[_arg4];", "lea 4(%%esp),%%esp;",		\
-		    "0" ((u32)(arg1)), "1" ((u32)(arg2)),		\
-		    "2" ((u32)(arg3)), [_arg4] "mr" ((u32)(arg4)))
-#else
-#define PVOP_CALL4(rettype, op, arg1, arg2, arg3, arg4)			\
-	__PVOP_CALL(rettype, op, "", "",				\
 		    PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),		\
 		    PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
 #define PVOP_VCALL4(op, arg1, arg2, arg3, arg4)				\
-	__PVOP_VCALL(op, "", "",					\
-		     PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),	\
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),	\
 		     PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
-#endif
 
 /* Lazy mode for batching updates / context switch */
 enum paravirt_lazy_mode {
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 70b7154f4bdd..736508004b30 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -63,10 +63,7 @@ static void __used common(void)
 
 #ifdef CONFIG_PARAVIRT_XXL
 	BLANK();
-	OFFSET(PV_IRQ_irq_disable, paravirt_patch_template, irq.irq_disable);
-	OFFSET(PV_IRQ_irq_enable, paravirt_patch_template, irq.irq_enable);
 	OFFSET(PV_CPU_iret, paravirt_patch_template, cpu.iret);
-	OFFSET(PV_MMU_read_cr2, paravirt_patch_template, mmu.read_cr2);
 #endif
 
 #ifdef CONFIG_XEN
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 3c417734790f..ccb3a16ae6d0 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -29,10 +29,8 @@
 #ifdef CONFIG_PARAVIRT_XXL
 #include <asm/asm-offsets.h>
 #include <asm/paravirt.h>
-#define GET_CR2_INTO(reg) GET_CR2_INTO_AX ; _ASM_MOV %_ASM_AX, reg
 #else
 #define INTERRUPT_RETURN iretq
-#define GET_CR2_INTO(reg) _ASM_MOV %cr2, reg
 #endif
 
 /*
-- 
2.26.2


