Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB32FD203
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 14:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71384.127814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dy6-00015H-Ly; Wed, 20 Jan 2021 13:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71384.127814; Wed, 20 Jan 2021 13:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Dy6-00014B-Cz; Wed, 20 Jan 2021 13:56:18 +0000
Received: by outflank-mailman (input) for mailman id 71384;
 Wed, 20 Jan 2021 13:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2Dy4-0000k4-Uf
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 13:56:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a7d2bab-5c5c-4102-9b24-13dbe98fd003;
 Wed, 20 Jan 2021 13:56:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A9E9B337;
 Wed, 20 Jan 2021 13:56:01 +0000 (UTC)
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
X-Inumbo-ID: 3a7d2bab-5c5c-4102-9b24-13dbe98fd003
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611150961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWa8LXJtPmdrGF/SU7ngKGgWKwsy52HIQIMfyyd743k=;
	b=Xg8no/JBbk3eflu9N1q0mBzR8lVBSNRxun2+NPafUBEhjfJZrci9oPxLddYh0FgXyeNOHp
	Nl4dElu70VGe+b463UOobZyftI1HXTOl+d5z/G/YdpO71p/cuD53mksYqr8uSI+9JrEAbv
	pyUfTC/Jwo8/F/h6Z9X8kAeBK5+deTg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v4 06/15] x86: rework arch_local_irq_restore() to not use popf
Date: Wed, 20 Jan 2021 14:55:46 +0100
Message-Id: <20210120135555.32594-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120135555.32594-1-jgross@suse.com>
References: <20210120135555.32594-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"popf" is a rather expensive operation, so don't use it for restoring
irq flags. Instead test whether interrupts are enabled in the flags
parameter and enable interrupts via "sti" in that case.

This results in the restore_fl paravirt op to be no longer needed.

Suggested-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/irqflags.h       | 20 ++++++-------------
 arch/x86/include/asm/paravirt.h       |  5 -----
 arch/x86/include/asm/paravirt_types.h |  7 ++-----
 arch/x86/kernel/irqflags.S            | 11 -----------
 arch/x86/kernel/paravirt.c            |  1 -
 arch/x86/kernel/paravirt_patch.c      |  3 ---
 arch/x86/xen/enlighten_pv.c           |  2 --
 arch/x86/xen/irq.c                    | 23 ----------------------
 arch/x86/xen/xen-asm.S                | 28 ---------------------------
 arch/x86/xen/xen-ops.h                |  1 -
 10 files changed, 8 insertions(+), 93 deletions(-)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index e585a4705b8d..144d70ea4393 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -35,15 +35,6 @@ extern __always_inline unsigned long native_save_fl(void)
 	return flags;
 }
 
-extern inline void native_restore_fl(unsigned long flags);
-extern inline void native_restore_fl(unsigned long flags)
-{
-	asm volatile("push %0 ; popf"
-		     : /* no output */
-		     :"g" (flags)
-		     :"memory", "cc");
-}
-
 static __always_inline void native_irq_disable(void)
 {
 	asm volatile("cli": : :"memory");
@@ -79,11 +70,6 @@ static __always_inline unsigned long arch_local_save_flags(void)
 	return native_save_fl();
 }
 
-static __always_inline void arch_local_irq_restore(unsigned long flags)
-{
-	native_restore_fl(flags);
-}
-
 static __always_inline void arch_local_irq_disable(void)
 {
 	native_irq_disable();
@@ -152,6 +138,12 @@ static __always_inline int arch_irqs_disabled(void)
 
 	return arch_irqs_disabled_flags(flags);
 }
+
+static __always_inline void arch_local_irq_restore(unsigned long flags)
+{
+	if (!arch_irqs_disabled_flags(flags))
+		arch_local_irq_enable();
+}
 #else
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_XEN_PV
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dd43b1100a87..4abf110e2243 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -648,11 +648,6 @@ static inline notrace unsigned long arch_local_save_flags(void)
 	return PVOP_CALLEE0(unsigned long, irq.save_fl);
 }
 
-static inline notrace void arch_local_irq_restore(unsigned long f)
-{
-	PVOP_VCALLEE1(irq.restore_fl, f);
-}
-
 static inline notrace void arch_local_irq_disable(void)
 {
 	PVOP_VCALLEE0(irq.irq_disable);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 0169365f1403..de87087d3bde 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -168,16 +168,13 @@ struct pv_cpu_ops {
 struct pv_irq_ops {
 #ifdef CONFIG_PARAVIRT_XXL
 	/*
-	 * Get/set interrupt state.  save_fl and restore_fl are only
-	 * expected to use X86_EFLAGS_IF; all other bits
-	 * returned from save_fl are undefined, and may be ignored by
-	 * restore_fl.
+	 * Get/set interrupt state.  save_fl is expected to use X86_EFLAGS_IF;
+	 * all other bits returned from save_fl are undefined.
 	 *
 	 * NOTE: These functions callers expect the callee to preserve
 	 * more registers than the standard C calling convention.
 	 */
 	struct paravirt_callee_save save_fl;
-	struct paravirt_callee_save restore_fl;
 	struct paravirt_callee_save irq_disable;
 	struct paravirt_callee_save irq_enable;
 
diff --git a/arch/x86/kernel/irqflags.S b/arch/x86/kernel/irqflags.S
index 0db0375235b4..8ef35063964b 100644
--- a/arch/x86/kernel/irqflags.S
+++ b/arch/x86/kernel/irqflags.S
@@ -13,14 +13,3 @@ SYM_FUNC_START(native_save_fl)
 	ret
 SYM_FUNC_END(native_save_fl)
 EXPORT_SYMBOL(native_save_fl)
-
-/*
- * void native_restore_fl(unsigned long flags)
- * %eax/%rdi: flags
- */
-SYM_FUNC_START(native_restore_fl)
-	push %_ASM_ARG1
-	popf
-	ret
-SYM_FUNC_END(native_restore_fl)
-EXPORT_SYMBOL(native_restore_fl)
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 18560b71e717..c60222ab8ab9 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -320,7 +320,6 @@ struct paravirt_patch_template pv_ops = {
 
 	/* Irq ops. */
 	.irq.save_fl		= __PV_IS_CALLEE_SAVE(native_save_fl),
-	.irq.restore_fl		= __PV_IS_CALLEE_SAVE(native_restore_fl),
 	.irq.irq_disable	= __PV_IS_CALLEE_SAVE(native_irq_disable),
 	.irq.irq_enable		= __PV_IS_CALLEE_SAVE(native_irq_enable),
 	.irq.safe_halt		= native_safe_halt,
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index 2fada2c347c9..abd27ec67397 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -25,7 +25,6 @@ struct patch_xxl {
 	const unsigned char	mmu_read_cr2[3];
 	const unsigned char	mmu_read_cr3[3];
 	const unsigned char	mmu_write_cr3[3];
-	const unsigned char	irq_restore_fl[2];
 	const unsigned char	cpu_wbinvd[2];
 	const unsigned char	mov64[3];
 };
@@ -37,7 +36,6 @@ static const struct patch_xxl patch_data_xxl = {
 	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
 	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
 	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
-	.irq_restore_fl		= { 0x57, 0x9d },	// push %rdi; popfq
 	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
 	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
 };
@@ -71,7 +69,6 @@ unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
 	switch (type) {
 
 #ifdef CONFIG_PARAVIRT_XXL
-	PATCH_CASE(irq, restore_fl, xxl, insn_buff, len);
 	PATCH_CASE(irq, save_fl, xxl, insn_buff, len);
 	PATCH_CASE(irq, irq_enable, xxl, insn_buff, len);
 	PATCH_CASE(irq, irq_disable, xxl, insn_buff, len);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5476423fc6d0..32b295cc2716 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1022,8 +1022,6 @@ void __init xen_setup_vcpu_info_placement(void)
 	 */
 	if (xen_have_vcpu_info_placement) {
 		pv_ops.irq.save_fl = __PV_IS_CALLEE_SAVE(xen_save_fl_direct);
-		pv_ops.irq.restore_fl =
-			__PV_IS_CALLEE_SAVE(xen_restore_fl_direct);
 		pv_ops.irq.irq_disable =
 			__PV_IS_CALLEE_SAVE(xen_irq_disable_direct);
 		pv_ops.irq.irq_enable =
diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
index 850c93f346c7..dfa091d79c2e 100644
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -42,28 +42,6 @@ asmlinkage __visible unsigned long xen_save_fl(void)
 }
 PV_CALLEE_SAVE_REGS_THUNK(xen_save_fl);
 
-__visible void xen_restore_fl(unsigned long flags)
-{
-	struct vcpu_info *vcpu;
-
-	/* convert from IF type flag */
-	flags = !(flags & X86_EFLAGS_IF);
-
-	/* See xen_irq_enable() for why preemption must be disabled. */
-	preempt_disable();
-	vcpu = this_cpu_read(xen_vcpu);
-	vcpu->evtchn_upcall_mask = flags;
-
-	if (flags == 0) {
-		barrier(); /* unmask then check (avoid races) */
-		if (unlikely(vcpu->evtchn_upcall_pending))
-			xen_force_evtchn_callback();
-		preempt_enable();
-	} else
-		preempt_enable_no_resched();
-}
-PV_CALLEE_SAVE_REGS_THUNK(xen_restore_fl);
-
 asmlinkage __visible void xen_irq_disable(void)
 {
 	/* There's a one instruction preempt window here.  We need to
@@ -118,7 +96,6 @@ static void xen_halt(void)
 
 static const struct pv_irq_ops xen_irq_ops __initconst = {
 	.save_fl = PV_CALLEE_SAVE(xen_save_fl),
-	.restore_fl = PV_CALLEE_SAVE(xen_restore_fl),
 	.irq_disable = PV_CALLEE_SAVE(xen_irq_disable),
 	.irq_enable = PV_CALLEE_SAVE(xen_irq_enable),
 
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index c0630fd9f44e..1ea7e41044b5 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -72,34 +72,6 @@ SYM_FUNC_START(xen_save_fl_direct)
 	ret
 SYM_FUNC_END(xen_save_fl_direct)
 
-
-/*
- * In principle the caller should be passing us a value return from
- * xen_save_fl_direct, but for robustness sake we test only the
- * X86_EFLAGS_IF flag rather than the whole byte. After setting the
- * interrupt mask state, it checks for unmasked pending events and
- * enters the hypervisor to get them delivered if so.
- */
-SYM_FUNC_START(xen_restore_fl_direct)
-	FRAME_BEGIN
-	testw $X86_EFLAGS_IF, %di
-	setz PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
-	/*
-	 * Preempt here doesn't matter because that will deal with any
-	 * pending interrupts.  The pending check may end up being run
-	 * on the wrong CPU, but that doesn't hurt.
-	 */
-
-	/* check for unmasked and pending */
-	cmpw $0x0001, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_pending
-	jnz 1f
-	call check_events
-1:
-	FRAME_END
-	ret
-SYM_FUNC_END(xen_restore_fl_direct)
-
-
 /*
  * Force an event check by making a hypercall, but preserve regs
  * before making the call.
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index b2fd80a01a36..8d7ec49a35fb 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -131,7 +131,6 @@ static inline void __init xen_efi_init(struct boot_params *boot_params)
 __visible void xen_irq_enable_direct(void);
 __visible void xen_irq_disable_direct(void);
 __visible unsigned long xen_save_fl_direct(void);
-__visible void xen_restore_fl_direct(unsigned long);
 
 __visible unsigned long xen_read_cr2(void);
 __visible unsigned long xen_read_cr2_direct(void);
-- 
2.26.2


