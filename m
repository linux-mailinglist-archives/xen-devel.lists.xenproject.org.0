Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B22FD1F6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 14:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71381.127777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dxx-0000q8-9q; Wed, 20 Jan 2021 13:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71381.127777; Wed, 20 Jan 2021 13:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dxx-0000og-01; Wed, 20 Jan 2021 13:56:09 +0000
Received: by outflank-mailman (input) for mailman id 71381;
 Wed, 20 Jan 2021 13:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2Dxv-0000k6-9o
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 13:56:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99c67d64-172f-4ca5-90ff-2ef2ba3caa19;
 Wed, 20 Jan 2021 13:56:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BF9AAEE0;
 Wed, 20 Jan 2021 13:56:00 +0000 (UTC)
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
X-Inumbo-ID: 99c67d64-172f-4ca5-90ff-2ef2ba3caa19
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611150960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZVylN0TrlznWFey0UjP85iwRxueujMp7mhjZsmecT4=;
	b=MYswaDCB5fpzZeOaGqespPXJUzn8HebAYW0jo6f0m+i5goGiz4Xr4UQvUfD3Q+fMiguXKO
	DRxX9spAera3w9mkslanzNBCf/RidahtQLWlVnFbDOYhmjQnCrWgdh0cw8C4k6w6xPx4PR
	A18im91q3uTFq+KU5zPD1SICXwr26WA=
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
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>
Subject: [PATCH v4 04/15] x86/pv: switch SWAPGS to ALTERNATIVE
Date: Wed, 20 Jan 2021 14:55:44 +0100
Message-Id: <20210120135555.32594-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120135555.32594-1-jgross@suse.com>
References: <20210120135555.32594-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SWAPGS is used only for interrupts coming from user mode or for
returning to user mode. So there is no reason to use the PARAVIRT
framework, as it can easily be replaced by an ALTERNATIVE depending
on X86_FEATURE_XENPV.

There are several instances using the PV-aware SWAPGS macro in paths
which are never executed in a Xen PV guest. Replace those with the
plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andy Lutomirski <luto@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/entry/entry_64.S             | 10 +++++-----
 arch/x86/include/asm/irqflags.h       | 20 ++++++++------------
 arch/x86/include/asm/paravirt.h       | 20 --------------------
 arch/x86/include/asm/paravirt_types.h |  2 --
 arch/x86/kernel/asm-offsets_64.c      |  1 -
 arch/x86/kernel/paravirt.c            |  1 -
 arch/x86/kernel/paravirt_patch.c      |  3 ---
 arch/x86/xen/enlighten_pv.c           |  3 ---
 8 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index cad08703c4ad..a876204a73e0 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -669,7 +669,7 @@ native_irq_return_ldt:
 	 */
 
 	pushq	%rdi				/* Stash user RDI */
-	SWAPGS					/* to kernel GS */
+	swapgs					/* to kernel GS */
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rdi	/* to kernel CR3 */
 
 	movq	PER_CPU_VAR(espfix_waddr), %rdi
@@ -699,7 +699,7 @@ native_irq_return_ldt:
 	orq	PER_CPU_VAR(espfix_stack), %rax
 
 	SWITCH_TO_USER_CR3_STACK scratch_reg=%rdi
-	SWAPGS					/* to user GS */
+	swapgs					/* to user GS */
 	popq	%rdi				/* Restore user RDI */
 
 	movq	%rax, %rsp
@@ -943,7 +943,7 @@ SYM_CODE_START_LOCAL(paranoid_entry)
 	ret
 
 .Lparanoid_entry_swapgs:
-	SWAPGS
+	swapgs
 
 	/*
 	 * The above SAVE_AND_SWITCH_TO_KERNEL_CR3 macro doesn't do an
@@ -1001,7 +1001,7 @@ SYM_CODE_START_LOCAL(paranoid_exit)
 	jnz		restore_regs_and_return_to_kernel
 
 	/* We are returning to a context with user GSBASE */
-	SWAPGS_UNSAFE_STACK
+	swapgs
 	jmp		restore_regs_and_return_to_kernel
 SYM_CODE_END(paranoid_exit)
 
@@ -1426,7 +1426,7 @@ nmi_no_fsgsbase:
 	jnz	nmi_restore
 
 nmi_swapgs:
-	SWAPGS_UNSAFE_STACK
+	swapgs
 
 nmi_restore:
 	POP_REGS
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 2dfc8d380dab..8c86edefa115 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -131,18 +131,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 #define SAVE_FLAGS(x)		pushfq; popq %rax
 #endif
 
-#define SWAPGS	swapgs
-/*
- * Currently paravirt can't handle swapgs nicely when we
- * don't have a stack we can rely on (such as a user space
- * stack).  So we either find a way around these or just fault
- * and emulate if a guest tries to call swapgs directly.
- *
- * Either way, this is a good way to document that we don't
- * have a reliable stack. x86_64 only.
- */
-#define SWAPGS_UNSAFE_STACK	swapgs
-
 #define INTERRUPT_RETURN	jmp native_iret
 #define USERGS_SYSRET64				\
 	swapgs;					\
@@ -170,6 +158,14 @@ static __always_inline int arch_irqs_disabled(void)
 
 	return arch_irqs_disabled_flags(flags);
 }
+#else
+#ifdef CONFIG_X86_64
+#ifdef CONFIG_XEN_PV
+#define SWAPGS	ALTERNATIVE "swapgs", "", X86_FEATURE_XENPV
+#else
+#define SWAPGS	swapgs
+#endif
+#endif
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index f8dce11d2bc1..f2ebe109a37e 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -776,26 +776,6 @@ extern void default_banner(void);
 
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_PARAVIRT_XXL
-/*
- * If swapgs is used while the userspace stack is still current,
- * there's no way to call a pvop.  The PV replacement *must* be
- * inlined, or the swapgs instruction must be trapped and emulated.
- */
-#define SWAPGS_UNSAFE_STACK						\
-	PARA_SITE(PARA_PATCH(PV_CPU_swapgs), swapgs)
-
-/*
- * Note: swapgs is very special, and in practise is either going to be
- * implemented with a single "swapgs" instruction or something very
- * special.  Either way, we don't need to save any registers for
- * it.
- */
-#define SWAPGS								\
-	PARA_SITE(PARA_PATCH(PV_CPU_swapgs),				\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_CPU_swapgs);		\
-		 )
-
 #define USERGS_SYSRET64							\
 	PARA_SITE(PARA_PATCH(PV_CPU_usergs_sysret64),			\
 		  ANNOTATE_RETPOLINE_SAFE;				\
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index b6b02b7c19cc..130f428b0cc8 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -168,8 +168,6 @@ struct pv_cpu_ops {
 	   frame set up. */
 	void (*iret)(void);
 
-	void (*swapgs)(void);
-
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
 #endif
diff --git a/arch/x86/kernel/asm-offsets_64.c b/arch/x86/kernel/asm-offsets_64.c
index 828be792231e..1354bc30614d 100644
--- a/arch/x86/kernel/asm-offsets_64.c
+++ b/arch/x86/kernel/asm-offsets_64.c
@@ -15,7 +15,6 @@ int main(void)
 #ifdef CONFIG_PARAVIRT_XXL
 	OFFSET(PV_CPU_usergs_sysret64, paravirt_patch_template,
 	       cpu.usergs_sysret64);
-	OFFSET(PV_CPU_swapgs, paravirt_patch_template, cpu.swapgs);
 #ifdef CONFIG_DEBUG_ENTRY
 	OFFSET(PV_IRQ_save_fl, paravirt_patch_template, irq.save_fl);
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 6c3407ba6ee9..5e5fcf5c376d 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -312,7 +312,6 @@ struct paravirt_patch_template pv_ops = {
 
 	.cpu.usergs_sysret64	= native_usergs_sysret64,
 	.cpu.iret		= native_iret,
-	.cpu.swapgs		= native_swapgs,
 
 #ifdef CONFIG_X86_IOPL_IOPERM
 	.cpu.invalidate_io_bitmap	= native_tss_invalidate_io_bitmap,
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index ace6e334cb39..7c518b08aa3c 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -28,7 +28,6 @@ struct patch_xxl {
 	const unsigned char	irq_restore_fl[2];
 	const unsigned char	cpu_wbinvd[2];
 	const unsigned char	cpu_usergs_sysret64[6];
-	const unsigned char	cpu_swapgs[3];
 	const unsigned char	mov64[3];
 };
 
@@ -43,7 +42,6 @@ static const struct patch_xxl patch_data_xxl = {
 	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
 	.cpu_usergs_sysret64	= { 0x0f, 0x01, 0xf8,
 				    0x48, 0x0f, 0x07 },	// swapgs; sysretq
-	.cpu_swapgs		= { 0x0f, 0x01, 0xf8 },	// swapgs
 	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
 };
 
@@ -86,7 +84,6 @@ unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
 	PATCH_CASE(mmu, write_cr3, xxl, insn_buff, len);
 
 	PATCH_CASE(cpu, usergs_sysret64, xxl, insn_buff, len);
-	PATCH_CASE(cpu, swapgs, xxl, insn_buff, len);
 	PATCH_CASE(cpu, wbinvd, xxl, insn_buff, len);
 #endif
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 76616024129e..44bb18adfb51 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1085,9 +1085,6 @@ static const struct pv_cpu_ops xen_cpu_ops __initconst = {
 #endif
 	.io_delay = xen_io_delay,
 
-	/* Xen takes care of %gs when switching to usermode for us */
-	.swapgs = paravirt_nop,
-
 	.start_context_switch = paravirt_start_context_switch,
 	.end_context_switch = xen_end_context_switch,
 };
-- 
2.26.2


