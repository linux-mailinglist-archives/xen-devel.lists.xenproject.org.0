Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D1332799
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 14:49:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95427.180232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcjJ-0004ty-D0; Tue, 09 Mar 2021 13:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95427.180232; Tue, 09 Mar 2021 13:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJcjJ-0004t9-6h; Tue, 09 Mar 2021 13:48:57 +0000
Received: by outflank-mailman (input) for mailman id 95427;
 Tue, 09 Mar 2021 13:48:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jEQk=IH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJcjH-0003yx-Nx
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:48:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b730f95-bd8a-4a68-9970-cc52293042a1;
 Tue, 09 Mar 2021 13:48:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F848AE15;
 Tue,  9 Mar 2021 13:48:22 +0000 (UTC)
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
X-Inumbo-ID: 8b730f95-bd8a-4a68-9970-cc52293042a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615297702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4ExMZPJQhPpnv6x0LBUpMruJTxKVMDPDTTcOV0zzwM=;
	b=ijkz3iPh8dCqibcoZxTCFz3vwKvA0Yfny/egFKgPDoyJ0llIhby8i3vydZcsIK2asD+CdX
	aFgh87ABYNgE34nI2wUnypL2xCdjovhQkwXSYqdXL3v8BPyN6273kD5z+HYmP+AyWillpx
	lum4r6AOmEQZ8hTSxXbcqyFgRJ1cokM=
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
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v6 11/12] x86/paravirt: switch functions with custom code to ALTERNATIVE
Date: Tue,  9 Mar 2021 14:48:12 +0100
Message-Id: <20210309134813.23912-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using paravirt patching for custom code sequences use
ALTERNATIVE for the functions with custom code replacements.

Instead of patching an ud2 instruction for unpopulated vector entries
into the caller site, use a simple function just calling BUG() as a
replacement.

Simplify the register defines for assembler paravirt calling, as there
isn't much usage left.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V4:
- fixed SAVE_FLAGS() (kernel test robot)
- added assembler paravirt cleanup
---
 arch/x86/entry/entry_64.S             |   2 +-
 arch/x86/include/asm/irqflags.h       |   2 +-
 arch/x86/include/asm/paravirt.h       | 101 +++++++++++++-------------
 arch/x86/include/asm/paravirt_types.h |   6 --
 arch/x86/kernel/paravirt.c            |  16 ++--
 arch/x86/kernel/paravirt_patch.c      |  88 ----------------------
 6 files changed, 58 insertions(+), 157 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 400908dff42e..12e2e3cd58be 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -305,7 +305,7 @@ SYM_CODE_END(ret_from_fork)
 .macro DEBUG_ENTRY_ASSERT_IRQS_OFF
 #ifdef CONFIG_DEBUG_ENTRY
 	pushq %rax
-	SAVE_FLAGS(CLBR_RAX)
+	SAVE_FLAGS
 	testl $X86_EFLAGS_IF, %eax
 	jz .Lokay_\@
 	ud2
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index a0efbcd24b86..c5ce9845c999 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -111,7 +111,7 @@ static __always_inline unsigned long arch_local_irq_save(void)
 
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_DEBUG_ENTRY
-#define SAVE_FLAGS(x)		pushfq; popq %rax
+#define SAVE_FLAGS		pushfq; popq %rax
 #endif
 
 #define INTERRUPT_RETURN	jmp native_iret
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 36cd71fa097f..b32b408958e8 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -137,7 +137,9 @@ static inline void write_cr0(unsigned long x)
 
 static inline unsigned long read_cr2(void)
 {
-	return PVOP_CALLEE0(unsigned long, mmu.read_cr2);
+	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
+				"mov %%cr2, %%rax;",
+				ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void write_cr2(unsigned long x)
@@ -147,12 +149,14 @@ static inline void write_cr2(unsigned long x)
 
 static inline unsigned long __read_cr3(void)
 {
-	return PVOP_CALL0(unsigned long, mmu.read_cr3);
+	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
+			      "mov %%cr3, %%rax;", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void write_cr3(unsigned long x)
 {
-	PVOP_VCALL1(mmu.write_cr3, x);
+	PVOP_ALT_VCALL1(mmu.write_cr3, x,
+			"mov %%rdi, %%cr3", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void __write_cr4(unsigned long x)
@@ -172,7 +176,7 @@ static inline void halt(void)
 
 static inline void wbinvd(void)
 {
-	PVOP_VCALL0(cpu.wbinvd);
+	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline u64 paravirt_read_msr(unsigned msr)
@@ -386,22 +390,28 @@ static inline void paravirt_release_p4d(unsigned long pfn)
 
 static inline pte_t __pte(pteval_t val)
 {
-	return (pte_t) { PVOP_CALLEE1(pteval_t, mmu.make_pte, val) };
+	return (pte_t) { PVOP_ALT_CALLEE1(pteval_t, mmu.make_pte, val,
+					  "mov %%rdi, %%rax",
+					  ALT_NOT(X86_FEATURE_XENPV)) };
 }
 
 static inline pteval_t pte_val(pte_t pte)
 {
-	return PVOP_CALLEE1(pteval_t, mmu.pte_val, pte.pte);
+	return PVOP_ALT_CALLEE1(pteval_t, mmu.pte_val, pte.pte,
+				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline pgd_t __pgd(pgdval_t val)
 {
-	return (pgd_t) { PVOP_CALLEE1(pgdval_t, mmu.make_pgd, val) };
+	return (pgd_t) { PVOP_ALT_CALLEE1(pgdval_t, mmu.make_pgd, val,
+					  "mov %%rdi, %%rax",
+					  ALT_NOT(X86_FEATURE_XENPV)) };
 }
 
 static inline pgdval_t pgd_val(pgd_t pgd)
 {
-	return PVOP_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd);
+	return PVOP_ALT_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd,
+				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 #define  __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
@@ -434,12 +444,15 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 static inline pmd_t __pmd(pmdval_t val)
 {
-	return (pmd_t) { PVOP_CALLEE1(pmdval_t, mmu.make_pmd, val) };
+	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, mmu.make_pmd, val,
+					  "mov %%rdi, %%rax",
+					  ALT_NOT(X86_FEATURE_XENPV)) };
 }
 
 static inline pmdval_t pmd_val(pmd_t pmd)
 {
-	return PVOP_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd);
+	return PVOP_ALT_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd,
+				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
@@ -451,14 +464,16 @@ static inline pud_t __pud(pudval_t val)
 {
 	pudval_t ret;
 
-	ret = PVOP_CALLEE1(pudval_t, mmu.make_pud, val);
+	ret = PVOP_ALT_CALLEE1(pudval_t, mmu.make_pud, val,
+			       "mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 
 	return (pud_t) { ret };
 }
 
 static inline pudval_t pud_val(pud_t pud)
 {
-	return PVOP_CALLEE1(pudval_t, mmu.pud_val, pud.pud);
+	return PVOP_ALT_CALLEE1(pudval_t, mmu.pud_val, pud.pud,
+				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -477,14 +492,17 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 static inline p4d_t __p4d(p4dval_t val)
 {
-	p4dval_t ret = PVOP_CALLEE1(p4dval_t, mmu.make_p4d, val);
+	p4dval_t ret = PVOP_ALT_CALLEE1(p4dval_t, mmu.make_p4d, val,
+					"mov %%rdi, %%rax",
+					ALT_NOT(X86_FEATURE_XENPV));
 
 	return (p4d_t) { ret };
 }
 
 static inline p4dval_t p4d_val(p4d_t p4d)
 {
-	return PVOP_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d);
+	return PVOP_ALT_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d,
+				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline void __set_pgd(pgd_t *pgdp, pgd_t pgd)
@@ -571,7 +589,9 @@ static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
 
 static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
 {
-	PVOP_VCALLEE1(lock.queued_spin_unlock, lock);
+	PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
+			  "movb $0, (%%" _ASM_ARG1 ");",
+			  ALT_NOT(X86_FEATURE_PVUNLOCK));
 }
 
 static __always_inline void pv_wait(u8 *ptr, u8 val)
@@ -586,7 +606,9 @@ static __always_inline void pv_kick(int cpu)
 
 static __always_inline bool pv_vcpu_is_preempted(long cpu)
 {
-	return PVOP_CALLEE1(bool, lock.vcpu_is_preempted, cpu);
+	return PVOP_ALT_CALLEE1(bool, lock.vcpu_is_preempted, cpu,
+				"xor %%" _ASM_AX ", %%" _ASM_AX ";",
+				ALT_NOT(X86_FEATURE_VCPUPREEMPT));
 }
 
 void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
@@ -660,17 +682,18 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #ifdef CONFIG_PARAVIRT_XXL
 static inline notrace unsigned long arch_local_save_flags(void)
 {
-	return PVOP_CALLEE0(unsigned long, irq.save_fl);
+	return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl, "pushf; pop %%rax;",
+				ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline notrace void arch_local_irq_disable(void)
 {
-	PVOP_VCALLEE0(irq.irq_disable);
+	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline notrace void arch_local_irq_enable(void)
 {
-	PVOP_VCALLEE0(irq.irq_enable);
+	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT(X86_FEATURE_XENPV));
 }
 
 static inline notrace unsigned long arch_local_irq_save(void)
@@ -715,35 +738,9 @@ extern void default_banner(void);
 	.popsection
 
 
-#define COND_PUSH(set, mask, reg)			\
-	.if ((~(set)) & mask); push %reg; .endif
-#define COND_POP(set, mask, reg)			\
-	.if ((~(set)) & mask); pop %reg; .endif
-
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_PARAVIRT_XXL
 
-#define PV_SAVE_REGS(set)			\
-	COND_PUSH(set, CLBR_RAX, rax);		\
-	COND_PUSH(set, CLBR_RCX, rcx);		\
-	COND_PUSH(set, CLBR_RDX, rdx);		\
-	COND_PUSH(set, CLBR_RSI, rsi);		\
-	COND_PUSH(set, CLBR_RDI, rdi);		\
-	COND_PUSH(set, CLBR_R8, r8);		\
-	COND_PUSH(set, CLBR_R9, r9);		\
-	COND_PUSH(set, CLBR_R10, r10);		\
-	COND_PUSH(set, CLBR_R11, r11)
-#define PV_RESTORE_REGS(set)			\
-	COND_POP(set, CLBR_R11, r11);		\
-	COND_POP(set, CLBR_R10, r10);		\
-	COND_POP(set, CLBR_R9, r9);		\
-	COND_POP(set, CLBR_R8, r8);		\
-	COND_POP(set, CLBR_RDI, rdi);		\
-	COND_POP(set, CLBR_RSI, rsi);		\
-	COND_POP(set, CLBR_RDX, rdx);		\
-	COND_POP(set, CLBR_RCX, rcx);		\
-	COND_POP(set, CLBR_RAX, rax)
-
 #define PARA_PATCH(off)		((off) / 8)
 #define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .quad, 8)
 #define PARA_INDIRECT(addr)	*addr(%rip)
@@ -754,12 +751,14 @@ extern void default_banner(void);
 		X86_FEATURE_XENPV, "jmp xen_iret;", "jmp native_iret;")
 
 #ifdef CONFIG_DEBUG_ENTRY
-#define SAVE_FLAGS(clobbers)                                        \
-	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);        \
-		  ANNOTATE_RETPOLINE_SAFE;			    \
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);	    \
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
+.macro PARA_IRQ_save_fl
+	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),
+		  ANNOTATE_RETPOLINE_SAFE;
+		  call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);)
+.endm
+
+#define SAVE_FLAGS	ALTERNATIVE "PARA_IRQ_save_fl;", "pushf; pop %rax;", \
+				    ALT_NOT(X86_FEATURE_XENPV)
 #endif
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 0ed976286d49..588ff14ce969 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -3,7 +3,6 @@
 #define _ASM_X86_PARAVIRT_TYPES_H
 
 /* Bitmask of what can be clobbered: usually at least eax. */
-#define CLBR_NONE 0
 #define CLBR_EAX  (1 << 0)
 #define CLBR_ECX  (1 << 1)
 #define CLBR_EDX  (1 << 2)
@@ -15,7 +14,6 @@
 
 #define CLBR_ARG_REGS	(CLBR_EAX | CLBR_EDX | CLBR_ECX)
 #define CLBR_RET_REG	(CLBR_EAX | CLBR_EDX)
-#define CLBR_SCRATCH	(0)
 #else
 #define CLBR_RAX  CLBR_EAX
 #define CLBR_RCX  CLBR_ECX
@@ -32,12 +30,9 @@
 #define CLBR_ARG_REGS	(CLBR_RDI | CLBR_RSI | CLBR_RDX | \
 			 CLBR_RCX | CLBR_R8 | CLBR_R9)
 #define CLBR_RET_REG	(CLBR_RAX)
-#define CLBR_SCRATCH	(CLBR_R10 | CLBR_R11)
 
 #endif /* X86_64 */
 
-#define CLBR_CALLEE_SAVE ((CLBR_ARG_REGS | CLBR_SCRATCH) & ~CLBR_RET_REG)
-
 #ifndef __ASSEMBLY__
 
 #include <asm/desc_defs.h>
@@ -322,7 +317,6 @@ extern void (*paravirt_iret)(void);
 /* Simple instruction patching code. */
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
-unsigned paravirt_patch_ident_64(void *insn_buff, unsigned len);
 unsigned paravirt_patch_default(u8 type, void *insn_buff, unsigned long addr, unsigned len);
 unsigned paravirt_patch_insns(void *insn_buff, unsigned len, const char *start, const char *end);
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 0553a339d850..082954930809 100644
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


