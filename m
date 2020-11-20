Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E62BA97C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 12:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32020.62957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4sh-00053M-LQ; Fri, 20 Nov 2020 11:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32020.62957; Fri, 20 Nov 2020 11:47:11 +0000
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
	id 1kg4sh-00052N-HD; Fri, 20 Nov 2020 11:47:11 +0000
Received: by outflank-mailman (input) for mailman id 32020;
 Fri, 20 Nov 2020 11:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4sg-00048T-6s
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:47:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a84e2d65-5ee0-4c43-8545-5a201f8e134f;
 Fri, 20 Nov 2020 11:46:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC0F6ADCD;
 Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4sg-00048T-6s
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:47:10 +0000
X-Inumbo-ID: a84e2d65-5ee0-4c43-8545-5a201f8e134f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a84e2d65-5ee0-4c43-8545-5a201f8e134f;
	Fri, 20 Nov 2020 11:46:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDc33xEnygoFQchTLdLhL9JFXlNStMFG7ljURXXS5PI=;
	b=fmZ+YORWKumSs0M7SYUSpoE2kob7jkjo2CI7xPYb72keOEp+3+4UqS5DGug8VSeshYX+B/
	+GTiGGo/+kIyd3BrYoEzZcK0ttLuoe4gbs5CRgs4BrqkkxkSJRAOvByCRVcaU0bLRG/8h1
	pO6X8uFaPWJJsO8e294G7o8aYZLc5sk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CC0F6ADCD;
	Fri, 20 Nov 2020 11:46:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 11/12] x86/paravirt: switch functions with custom code to ALTERNATIVE
Date: Fri, 20 Nov 2020 12:46:29 +0100
Message-Id: <20201120114630.13552-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using paravirt patching for custom code sequences use
ALTERNATIVE for the functions with custom code replacements.

Instead of patching an ud2 instruction for unpopulated vector entries
into the caller site, use a simple function just calling BUG() as a
replacement.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h       | 73 ++++++++++++++--------
 arch/x86/include/asm/paravirt_types.h |  1 -
 arch/x86/kernel/paravirt.c            | 16 ++---
 arch/x86/kernel/paravirt_patch.c      | 88 ---------------------------
 4 files changed, 54 insertions(+), 124 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 62fbcd899539..500c64d0cfcb 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -108,7 +108,8 @@ static inline void write_cr0(unsigned long x)
 
 static inline unsigned long read_cr2(void)
 {
-	return PVOP_CALLEE0(unsigned long, mmu.read_cr2);
+	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
+				"mov %%cr2, %%rax;", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void write_cr2(unsigned long x)
@@ -118,12 +119,14 @@ static inline void write_cr2(unsigned long x)
 
 static inline unsigned long __read_cr3(void)
 {
-	return PVOP_CALL0(unsigned long, mmu.read_cr3);
+	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
+			      "mov %%cr3, %%rax;", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void write_cr3(unsigned long x)
 {
-	PVOP_VCALL1(mmu.write_cr3, x);
+	PVOP_ALT_VCALL1(mmu.write_cr3, x,
+			"mov %%rdi, %%cr3", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void __write_cr4(unsigned long x)
@@ -143,7 +146,7 @@ static inline void halt(void)
 
 static inline void wbinvd(void)
 {
-	PVOP_VCALL0(cpu.wbinvd);
+	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", X86_FEATURE_NOT_XENPV);
 }
 
 static inline u64 paravirt_read_msr(unsigned msr)
@@ -357,22 +360,28 @@ static inline void paravirt_release_p4d(unsigned long pfn)
 
 static inline pte_t __pte(pteval_t val)
 {
-	return (pte_t) { PVOP_CALLEE1(pteval_t, mmu.make_pte, val) };
+	return (pte_t) { PVOP_ALT_CALLEE1(pteval_t, mmu.make_pte, val,
+					  "mov %%rdi, %%rax",
+					  X86_FEATURE_NOT_XENPV) };
 }
 
 static inline pteval_t pte_val(pte_t pte)
 {
-	return PVOP_CALLEE1(pteval_t, mmu.pte_val, pte.pte);
+	return PVOP_ALT_CALLEE1(pteval_t, mmu.pte_val, pte.pte,
+				"mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 }
 
 static inline pgd_t __pgd(pgdval_t val)
 {
-	return (pgd_t) { PVOP_CALLEE1(pgdval_t, mmu.make_pgd, val) };
+	return (pgd_t) { PVOP_ALT_CALLEE1(pgdval_t, mmu.make_pgd, val,
+					  "mov %%rdi, %%rax",
+					  X86_FEATURE_NOT_XENPV) };
 }
 
 static inline pgdval_t pgd_val(pgd_t pgd)
 {
-	return PVOP_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd);
+	return PVOP_ALT_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd,
+				"mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 }
 
 #define  __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
@@ -405,12 +414,15 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 static inline pmd_t __pmd(pmdval_t val)
 {
-	return (pmd_t) { PVOP_CALLEE1(pmdval_t, mmu.make_pmd, val) };
+	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, mmu.make_pmd, val,
+					  "mov %%rdi, %%rax",
+					  X86_FEATURE_NOT_XENPV) };
 }
 
 static inline pmdval_t pmd_val(pmd_t pmd)
 {
-	return PVOP_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd);
+	return PVOP_ALT_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd,
+				"mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
@@ -422,14 +434,16 @@ static inline pud_t __pud(pudval_t val)
 {
 	pudval_t ret;
 
-	ret = PVOP_CALLEE1(pudval_t, mmu.make_pud, val);
+	ret = PVOP_ALT_CALLEE1(pudval_t, mmu.make_pud, val,
+			       "mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 
 	return (pud_t) { ret };
 }
 
 static inline pudval_t pud_val(pud_t pud)
 {
-	return PVOP_CALLEE1(pudval_t, mmu.pud_val, pud.pud);
+	return PVOP_ALT_CALLEE1(pudval_t, mmu.pud_val, pud.pud,
+				"mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -448,14 +462,17 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 static inline p4d_t __p4d(p4dval_t val)
 {
-	p4dval_t ret = PVOP_CALLEE1(p4dval_t, mmu.make_p4d, val);
+	p4dval_t ret = PVOP_ALT_CALLEE1(p4dval_t, mmu.make_p4d, val,
+					"mov %%rdi, %%rax",
+					X86_FEATURE_NOT_XENPV);
 
 	return (p4d_t) { ret };
 }
 
 static inline p4dval_t p4d_val(p4d_t p4d)
 {
-	return PVOP_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d);
+	return PVOP_ALT_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d,
+				"mov %%rdi, %%rax", X86_FEATURE_NOT_XENPV);
 }
 
 static inline void __set_pgd(pgd_t *pgdp, pgd_t pgd)
@@ -542,7 +559,9 @@ static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
 
 static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
 {
-	PVOP_VCALLEE1(lock.queued_spin_unlock, lock);
+	PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
+			  "movb $0, (%%" _ASM_ARG1 ");",
+			  X86_FEATURE_NO_PVUNLOCK);
 }
 
 static __always_inline void pv_wait(u8 *ptr, u8 val)
@@ -557,7 +576,9 @@ static __always_inline void pv_kick(int cpu)
 
 static __always_inline bool pv_vcpu_is_preempted(long cpu)
 {
-	return PVOP_CALLEE1(bool, lock.vcpu_is_preempted, cpu);
+	return PVOP_ALT_CALLEE1(bool, lock.vcpu_is_preempted, cpu,
+				"xor %%" _ASM_AX ", %%" _ASM_AX ";",
+				X86_FEATURE_NO_VCPUPREEMPT);
 }
 
 void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
@@ -631,17 +652,18 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #ifdef CONFIG_PARAVIRT_XXL
 static inline notrace unsigned long arch_local_save_flags(void)
 {
-	return PVOP_CALLEE0(unsigned long, irq.save_fl);
+	return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl,
+				"pushf; pop %%rax;", X86_FEATURE_NOT_XENPV);
 }
 
 static inline notrace void arch_local_irq_disable(void)
 {
-	PVOP_VCALLEE0(irq.irq_disable);
+	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", X86_FEATURE_NOT_XENPV);
 }
 
 static inline notrace void arch_local_irq_enable(void)
 {
-	PVOP_VCALLEE0(irq.irq_enable);
+	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", X86_FEATURE_NOT_XENPV);
 }
 
 static inline notrace unsigned long arch_local_irq_save(void)
@@ -726,12 +748,13 @@ extern void default_banner(void);
 		      "jmp xen_iret;", X86_FEATURE_XENPV
 
 #ifdef CONFIG_DEBUG_ENTRY
-#define SAVE_FLAGS(clobbers)                                        \
-	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);        \
-		  ANNOTATE_RETPOLINE_SAFE;			    \
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);	    \
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
+#define SAVE_FLAGS(clobbers)						      \
+	ALTERNATIVE(PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),		      \
+			      PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);      \
+			      ANNOTATE_RETPOLINE_SAFE;			      \
+			      call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);      \
+			      PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);), \
+		    "pushf; pop %rax;", X86_FEATURE_NOT_XENPV)
 #endif
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 1f8e1b76e78b..481d3b667005 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -323,7 +323,6 @@ extern void (*paravirt_iret)(void);
 /* Simple instruction patching code. */
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
-unsigned paravirt_patch_ident_64(void *insn_buff, unsigned len);
 unsigned paravirt_patch_default(u8 type, void *insn_buff, unsigned long addr, unsigned len);
 unsigned paravirt_patch_insns(void *insn_buff, unsigned len, const char *start, const char *end);
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 2ab547dd66c3..db6ae7f7c14e 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -53,7 +53,10 @@ void __init default_banner(void)
 }
 
 /* Undefined instruction for dealing with missing ops pointers. */
-static const unsigned char ud2a[] = { 0x0f, 0x0b };
+static void paravirt_BUG(void)
+{
+	BUG();
+}
 
 struct branch {
 	unsigned char opcode;
@@ -107,17 +110,10 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	unsigned ret;
 
 	if (opfunc == NULL)
-		/* If there's no function, patch it with a ud2a (BUG) */
-		ret = paravirt_patch_insns(insn_buff, len, ud2a, ud2a+sizeof(ud2a));
+		/* If there's no function, patch it with paravirt_BUG() */
+		ret = paravirt_patch_call(insn_buff, paravirt_BUG, addr, len);
 	else if (opfunc == _paravirt_nop)
 		ret = 0;
-
-#ifdef CONFIG_PARAVIRT_XXL
-	/* identity functions just return their single argument */
-	else if (opfunc == _paravirt_ident_64)
-		ret = paravirt_patch_ident_64(insn_buff, len);
-
-#endif
 	else
 		/* Otherwise call the function. */
 		ret = paravirt_patch_call(insn_buff, opfunc, addr, len);
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index abd27ec67397..10543dcc8211 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -4,96 +4,8 @@
 #include <asm/paravirt.h>
 #include <asm/asm-offsets.h>
 
-#define PSTART(d, m)							\
-	patch_data_##d.m
-
-#define PEND(d, m)							\
-	(PSTART(d, m) + sizeof(patch_data_##d.m))
-
-#define PATCH(d, m, insn_buff, len)						\
-	paravirt_patch_insns(insn_buff, len, PSTART(d, m), PEND(d, m))
-
-#define PATCH_CASE(ops, m, data, insn_buff, len)				\
-	case PARAVIRT_PATCH(ops.m):					\
-		return PATCH(data, ops##_##m, insn_buff, len)
-
-#ifdef CONFIG_PARAVIRT_XXL
-struct patch_xxl {
-	const unsigned char	irq_irq_disable[1];
-	const unsigned char	irq_irq_enable[1];
-	const unsigned char	irq_save_fl[2];
-	const unsigned char	mmu_read_cr2[3];
-	const unsigned char	mmu_read_cr3[3];
-	const unsigned char	mmu_write_cr3[3];
-	const unsigned char	cpu_wbinvd[2];
-	const unsigned char	mov64[3];
-};
-
-static const struct patch_xxl patch_data_xxl = {
-	.irq_irq_disable	= { 0xfa },		// cli
-	.irq_irq_enable		= { 0xfb },		// sti
-	.irq_save_fl		= { 0x9c, 0x58 },	// pushf; pop %[re]ax
-	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
-	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
-	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
-	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
-	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
-};
-
-unsigned int paravirt_patch_ident_64(void *insn_buff, unsigned int len)
-{
-	return PATCH(xxl, mov64, insn_buff, len);
-}
-# endif /* CONFIG_PARAVIRT_XXL */
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-struct patch_lock {
-	unsigned char queued_spin_unlock[3];
-	unsigned char vcpu_is_preempted[2];
-};
-
-static const struct patch_lock patch_data_lock = {
-	.vcpu_is_preempted	= { 0x31, 0xc0 },	// xor %eax, %eax
-
-# ifdef CONFIG_X86_64
-	.queued_spin_unlock	= { 0xc6, 0x07, 0x00 },	// movb $0, (%rdi)
-# else
-	.queued_spin_unlock	= { 0xc6, 0x00, 0x00 },	// movb $0, (%eax)
-# endif
-};
-#endif /* CONFIG_PARAVIRT_SPINLOCKS */
-
 unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
 			  unsigned int len)
 {
-	switch (type) {
-
-#ifdef CONFIG_PARAVIRT_XXL
-	PATCH_CASE(irq, save_fl, xxl, insn_buff, len);
-	PATCH_CASE(irq, irq_enable, xxl, insn_buff, len);
-	PATCH_CASE(irq, irq_disable, xxl, insn_buff, len);
-
-	PATCH_CASE(mmu, read_cr2, xxl, insn_buff, len);
-	PATCH_CASE(mmu, read_cr3, xxl, insn_buff, len);
-	PATCH_CASE(mmu, write_cr3, xxl, insn_buff, len);
-
-	PATCH_CASE(cpu, wbinvd, xxl, insn_buff, len);
-#endif
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-	case PARAVIRT_PATCH(lock.queued_spin_unlock):
-		if (pv_is_native_spin_unlock())
-			return PATCH(lock, queued_spin_unlock, insn_buff, len);
-		break;
-
-	case PARAVIRT_PATCH(lock.vcpu_is_preempted):
-		if (pv_is_native_vcpu_is_preempted())
-			return PATCH(lock, vcpu_is_preempted, insn_buff, len);
-		break;
-#endif
-	default:
-		break;
-	}
-
 	return paravirt_patch_default(type, insn_buff, addr, len);
 }
-- 
2.26.2


