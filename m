Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503992DCE5F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55783.97287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdo-0006wg-R4; Thu, 17 Dec 2020 09:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55783.97287; Thu, 17 Dec 2020 09:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdo-0006vP-M4; Thu, 17 Dec 2020 09:32:08 +0000
Received: by outflank-mailman (input) for mailman id 55783;
 Thu, 17 Dec 2020 09:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdn-0006R7-Lf
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:32:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08e1002c-1486-4f12-b99a-9b02559b8b30;
 Thu, 17 Dec 2020 09:31:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B99DAB71D;
 Thu, 17 Dec 2020 09:31:48 +0000 (UTC)
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
X-Inumbo-ID: 08e1002c-1486-4f12-b99a-9b02559b8b30
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tw17vw9qDinK072Gqjp0wECv525qejhJlbKr8xzx2Nk=;
	b=IkLEuniFx1QPiIU+XZSiMA+xhU+PYa4LNmxqu+d0Dp3gONeD422EIm3Ft/rSuD2mziVA/x
	556GbUzg7wqElUMLCzOAT8wUbuVLzbSWRxd9ELZLwU0jivC1i/u1pKz9Sk/nDa5SIXfd/L
	8yMmfCHhZP8HlRN/e/oQ2E3/wRBr62I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH v3 09/15] x86/paravirt: remove no longer needed 32-bit pvops cruft
Date: Thu, 17 Dec 2020 10:31:27 +0100
Message-Id: <20201217093133.1507-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
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

ENABLE_INTERRUPTS is used nowhere, so it can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_32.S             |   4 +-
 arch/x86/include/asm/irqflags.h       |   5 --
 arch/x86/include/asm/paravirt.h       |  35 +-------
 arch/x86/include/asm/paravirt_types.h | 112 ++++++++------------------
 arch/x86/kernel/asm-offsets.c         |   2 -
 5 files changed, 35 insertions(+), 123 deletions(-)

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
index 0785a9686e32..1dd30c95505d 100644
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
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 1fff349e4792..42f9eef84131 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -470,55 +470,34 @@ int paravirt_disable_iospace(void);
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
@@ -526,84 +505,57 @@ int paravirt_disable_iospace(void);
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
index 60b9f42ce3c1..736508004b30 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -63,8 +63,6 @@ static void __used common(void)
 
 #ifdef CONFIG_PARAVIRT_XXL
 	BLANK();
-	OFFSET(PV_IRQ_irq_disable, paravirt_patch_template, irq.irq_disable);
-	OFFSET(PV_IRQ_irq_enable, paravirt_patch_template, irq.irq_enable);
 	OFFSET(PV_CPU_iret, paravirt_patch_template, cpu.iret);
 #endif
 
-- 
2.26.2


