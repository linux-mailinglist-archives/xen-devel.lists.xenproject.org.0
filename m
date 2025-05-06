Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D89AABF18
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976930.1364046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCETw-0003M3-Tg; Tue, 06 May 2025 09:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976930.1364046; Tue, 06 May 2025 09:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCETw-0003J3-PT; Tue, 06 May 2025 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 976930;
 Tue, 06 May 2025 09:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uCETu-0002Tc-ST
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:20:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6860900b-2a5b-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 11:20:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8A1D21270;
 Tue,  6 May 2025 09:20:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 473CC137CF;
 Tue,  6 May 2025 09:20:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ohjMD3TUGWgwbAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 May 2025 09:20:52 +0000
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
X-Inumbo-ID: 6860900b-2a5b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPlVcBnM9+OR95b5HV2hq0XADQ62f4TXKXOpPPlrJtg=;
	b=Qcv5A5+jJolUiYSL/xbYaKM+tOzQd2BWTuMC5vBF+z3e2BZ5SLmxUbej2VdyV00bfdPfq8
	DQbE20nPcxjIRw1Rcmaps6PZZYAH6DU/CtA/Dity53R6g6xD6JeYrH0qZOitbGgOjNBlC/
	x1eP+a5DMiPp9kuSpDjGSCFiA4VRbdE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPlVcBnM9+OR95b5HV2hq0XADQ62f4TXKXOpPPlrJtg=;
	b=Qcv5A5+jJolUiYSL/xbYaKM+tOzQd2BWTuMC5vBF+z3e2BZ5SLmxUbej2VdyV00bfdPfq8
	DQbE20nPcxjIRw1Rcmaps6PZZYAH6DU/CtA/Dity53R6g6xD6JeYrH0qZOitbGgOjNBlC/
	x1eP+a5DMiPp9kuSpDjGSCFiA4VRbdE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to instruction interfaces
Date: Tue,  6 May 2025 11:20:14 +0200
Message-ID: <20250506092015.1849-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506092015.1849-1-jgross@suse.com>
References: <20250506092015.1849-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Instead of having callback functions for rdmsr/wrmsr on native, switch
to inline the respective instructions directly in order to avoid
overhead with the call interface.

This requires to use the instruction interfaces for rdmsr/wrmsr
emulation when running as a Xen PV guest.

In order to prepare support for the immediate forms of RDMSR and WRMSR
when not running as a Xen PV guest, use the RDMSR and WRMSR
instructions as the fallback case instead of ALT_CALL_INSTR.

Note that in the Xen PV case the RDMSR/WRMSR patching must not happen
even as an intermediate step, as this would clobber the indirect call
information needed when patching in the direct call for the Xen case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h           | 114 +++++++++++++++++-----
 arch/x86/include/asm/paravirt_types.h     |  13 ++-
 arch/x86/include/asm/qspinlock_paravirt.h |   5 +-
 arch/x86/kernel/paravirt.c                |  26 ++++-
 arch/x86/xen/enlighten_pv.c               |  56 ++++++++---
 5 files changed, 167 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index a463c747c780..df10b0e4f7b8 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -175,24 +175,72 @@ static inline void __write_cr4(unsigned long x)
 	PVOP_VCALL1(cpu.write_cr4, x);
 }
 
-static inline u64 paravirt_read_msr(u32 msr)
+static __always_inline u64 paravirt_read_msr(u32 msr)
 {
-	return PVOP_CALL1(u64, cpu.read_msr, msr);
+	EAX_EDX_DECLARE_ARGS(val, low, high);
+
+	PVOP_TEST_NULL(cpu.read_msr);
+	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
+					"rdmsr", ALT_NOT_XEN,
+					ALT_CALL_INSTR, ALT_XENPV_CALL)
+		     "2:\n"
+		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
+		     : EAX_EDX_RET(val, low, high), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(cpu.read_msr), "c" (msr));
+
+	return EAX_EDX_VAL(val, low, high);
 }
 
-static inline void paravirt_write_msr(u32 msr, u64 val)
+static __always_inline void paravirt_write_msr(u32 msr, u64 val)
 {
-	PVOP_VCALL2(cpu.write_msr, msr, val);
+	PVOP_TEST_NULL(cpu.write_msr);
+	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
+					"wrmsr", ALT_NOT_XEN,
+					ALT_CALL_INSTR, ALT_XENPV_CALL)
+		      "2:\n"
+		      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
+		      : ASM_CALL_CONSTRAINT
+		      : paravirt_ptr(cpu.write_msr),
+			  "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32))
+		      : "memory");
 }
 
-static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
+static __always_inline int paravirt_read_msr_safe(u32 msr, u64 *p)
 {
-	return PVOP_CALL2(int, cpu.read_msr_safe, msr, val);
+	int err;
+	EAX_EDX_DECLARE_ARGS(val, low, high);
+
+	PVOP_TEST_NULL(cpu.read_msr_safe);
+	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
+					"rdmsr; xor %[err],%[err]", ALT_NOT_XEN,
+					ALT_CALL_INSTR, ALT_XENPV_CALL)
+		     "2:\n"
+		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
+		     : [err] "=c" (err), EAX_EDX_RET(val, low, high),
+		       ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(cpu.read_msr_safe), "0" (msr));
+
+	*p = EAX_EDX_VAL(val, low, high);
+
+	return err;
 }
 
-static inline int paravirt_write_msr_safe(u32 msr, u64 val)
+static __always_inline int paravirt_write_msr_safe(u32 msr, u64 val)
 {
-	return PVOP_CALL2(int, cpu.write_msr_safe, msr, val);
+	int err;
+
+	PVOP_TEST_NULL(cpu.write_msr_safe);
+	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
+					"wrmsr; xor %[err],%[err]", ALT_NOT_XEN,
+					ALT_CALL_INSTR, ALT_XENPV_CALL)
+		     "2:\n"
+		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %[err])
+		     : [err] "=a" (err), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(cpu.write_msr_safe),
+		       "c" (msr), "0" ((u32)val), "d" ((u32)(val >> 32))
+		     : "memory");
+
+	return err;
 }
 
 static __always_inline u64 read_msr(u32 msr)
@@ -573,27 +621,43 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
 #define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
 #else
+/* save and restore caller-save registers, except %rax, %rcx and %rdx. */
+#define PV_SAVE_COMMON_CALLER_REGS	\
+	"push %rsi;"			\
+	"push %rdi;"			\
+	"push %r8;"			\
+	"push %r9;"			\
+	"push %r10;"			\
+	"push %r11;"
+#define PV_RESTORE_COMMON_CALLER_REGS	\
+	"pop %r11;"			\
+	"pop %r10;"			\
+	"pop %r9;"			\
+	"pop %r8;"			\
+	"pop %rdi;"			\
+	"pop %rsi;"
+
+#define PV_PROLOGUE_MSR(func)		\
+	PV_SAVE_COMMON_CALLER_REGS	\
+	PV_PROLOGUE_MSR_##func
+#define PV_EPILOGUE_MSR(func)		\
+	PV_EPILOGUE_MSR_##func		\
+	PV_RESTORE_COMMON_CALLER_REGS
+
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS						\
 	"push %rcx;"							\
 	"push %rdx;"							\
-	"push %rsi;"							\
-	"push %rdi;"							\
-	"push %r8;"							\
-	"push %r9;"							\
-	"push %r10;"							\
-	"push %r11;"
+	PV_SAVE_COMMON_CALLER_REGS
 #define PV_RESTORE_ALL_CALLER_REGS					\
-	"pop %r11;"							\
-	"pop %r10;"							\
-	"pop %r9;"							\
-	"pop %r8;"							\
-	"pop %rdi;"							\
-	"pop %rsi;"							\
+	PV_RESTORE_COMMON_CALLER_REGS					\
 	"pop %rdx;"							\
 	"pop %rcx;"
 #endif
 
+#define PV_PROLOGUE_ALL(func)	PV_SAVE_ALL_CALLER_REGS
+#define PV_EPILOGUE_ALL(func)	PV_RESTORE_ALL_CALLER_REGS
+
 /*
  * Generate a thunk around a function which saves all caller-save
  * registers except for the return value.  This allows C functions to
@@ -607,7 +671,7 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
  * functions.
  */
 #define PV_THUNK_NAME(func) "__raw_callee_save_" #func
-#define __PV_CALLEE_SAVE_REGS_THUNK(func, section)			\
+#define __PV_CALLEE_SAVE_REGS_THUNK(func, section, helper)		\
 	extern typeof(func) __raw_callee_save_##func;			\
 									\
 	asm(".pushsection " section ", \"ax\";"				\
@@ -617,16 +681,18 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 	    PV_THUNK_NAME(func) ":"					\
 	    ASM_ENDBR							\
 	    FRAME_BEGIN							\
-	    PV_SAVE_ALL_CALLER_REGS					\
+	    PV_PROLOGUE_##helper(func)					\
 	    "call " #func ";"						\
-	    PV_RESTORE_ALL_CALLER_REGS					\
+	    PV_EPILOGUE_##helper(func)					\
 	    FRAME_END							\
 	    ASM_RET							\
 	    ".size " PV_THUNK_NAME(func) ", .-" PV_THUNK_NAME(func) ";"	\
 	    ".popsection")
 
 #define PV_CALLEE_SAVE_REGS_THUNK(func)			\
-	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text")
+	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", ALL)
+#define PV_CALLEE_SAVE_REGS_MSR_THUNK(func)		\
+	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", MSR)
 
 /* Get a reference to a callee-save function */
 #define PV_CALLEE_SAVE(func)						\
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index b08b9d3122d6..f7f879319e90 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -91,15 +91,15 @@ struct pv_cpu_ops {
 		      unsigned int *ecx, unsigned int *edx);
 
 	/* Unsafe MSR operations.  These will warn or panic on failure. */
-	u64 (*read_msr)(u32 msr);
-	void (*write_msr)(u32 msr, u64 val);
+	struct paravirt_callee_save read_msr;
+	struct paravirt_callee_save write_msr;
 
 	/*
 	 * Safe MSR operations.
 	 * Returns 0 or -EIO.
 	 */
-	int (*read_msr_safe)(u32 msr, u64 *val);
-	int (*write_msr_safe)(u32 msr, u64 val);
+	struct paravirt_callee_save read_msr_safe;
+	struct paravirt_callee_save write_msr_safe;
 
 	u64 (*read_pmc)(int counter);
 
@@ -520,6 +520,10 @@ unsigned long pv_native_save_fl(void);
 void pv_native_irq_disable(void);
 void pv_native_irq_enable(void);
 unsigned long pv_native_read_cr2(void);
+void pv_native_rdmsr(void);
+void pv_native_wrmsr(void);
+void pv_native_rdmsr_safe(void);
+void pv_native_wrmsr_safe(void);
 #endif
 
 #define paravirt_nop	((void *)nop_func)
@@ -527,6 +531,7 @@ unsigned long pv_native_read_cr2(void);
 #endif	/* __ASSEMBLER__ */
 
 #define ALT_NOT_XEN	ALT_NOT(X86_FEATURE_XENPV)
+#define ALT_XENPV_CALL	ALT_DIRECT_CALL(X86_FEATURE_XENPV)
 
 #endif  /* CONFIG_PARAVIRT */
 #endif	/* _ASM_X86_PARAVIRT_TYPES_H */
diff --git a/arch/x86/include/asm/qspinlock_paravirt.h b/arch/x86/include/asm/qspinlock_paravirt.h
index 0a985784be9b..0351acb5a143 100644
--- a/arch/x86/include/asm/qspinlock_paravirt.h
+++ b/arch/x86/include/asm/qspinlock_paravirt.h
@@ -14,7 +14,8 @@ void __lockfunc __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 lock
  */
 #ifdef CONFIG_64BIT
 
-__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text");
+__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath, ".spinlock.text",
+			    ALL);
 #define __pv_queued_spin_unlock	__pv_queued_spin_unlock
 
 /*
@@ -61,7 +62,7 @@ DEFINE_ASM_FUNC(__raw_callee_save___pv_queued_spin_unlock,
 #else /* CONFIG_64BIT */
 
 extern void __lockfunc __pv_queued_spin_unlock(struct qspinlock *lock);
-__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text");
+__PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock, ".spinlock.text", ALL);
 
 #endif /* CONFIG_64BIT */
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 015bf298434f..ff7d7fdae360 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -50,6 +50,24 @@ DEFINE_ASM_FUNC(pv_native_save_fl, "pushf; pop %rax", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_irq_disable, "cli", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_irq_enable, "sti", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_read_cr2, "mov %cr2, %rax", .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_rdmsr,
+		"1: rdmsr\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR), .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_wrmsr,
+		"1: wrmsr\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR), .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_rdmsr_safe,
+		"1: rdmsr; xor %ecx, %ecx\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %%ecx),
+		.noinstr.text);
+DEFINE_ASM_FUNC(pv_native_wrmsr_safe,
+		"1: wrmsr; xor %eax, %eax\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %%eax),
+		.noinstr.text);
 #endif
 
 DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
@@ -129,10 +147,10 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.read_cr0		= native_read_cr0,
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
-	.cpu.read_msr		= native_read_msr,
-	.cpu.write_msr		= native_write_msr,
-	.cpu.read_msr_safe	= native_read_msr_safe,
-	.cpu.write_msr_safe	= native_write_msr_safe,
+	.cpu.read_msr		= __PV_IS_CALLEE_SAVE(pv_native_rdmsr),
+	.cpu.write_msr		= __PV_IS_CALLEE_SAVE(pv_native_wrmsr),
+	.cpu.read_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_rdmsr_safe),
+	.cpu.write_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_wrmsr_safe),
 	.cpu.read_pmc		= native_read_pmc,
 	.cpu.load_tr_desc	= native_load_tr_desc,
 	.cpu.set_ldt		= native_set_ldt,
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 3be38350f044..c279b2bef7eb 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1160,36 +1160,66 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 	}
 }
 
-static int xen_read_msr_safe(u32 msr, u64 *val)
-{
+/*
+ * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
+ * to avoid warnings with "-Wmissing-prototypes".
+ */
+struct xen_rdmsr_safe_ret {
+	u64 val;
 	int err;
+};
+struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr);
+int xen_write_msr_safe(u32 msr, u32 low, u32 high);
+u64 xen_read_msr(u32 msr);
+void xen_write_msr(u32 msr, u32 low, u32 high);
 
-	*val = xen_do_read_msr(msr, &err);
-	return err;
+__visible struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr)
+{
+	struct xen_rdmsr_safe_ret ret;
+
+	ret.val = xen_do_read_msr(msr, &ret.err);
+	return ret;
 }
+#define PV_PROLOGUE_MSR_xen_read_msr_safe	"mov %ecx, %edi;"
+#define PV_EPILOGUE_MSR_xen_read_msr_safe	\
+	"mov %edx, %ecx; mov %rax, %rdx; mov %eax, %eax; shr $0x20, %rdx;"
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr_safe);
 
-static int xen_write_msr_safe(u32 msr, u64 val)
+__visible int xen_write_msr_safe(u32 msr, u32 low, u32 high)
 {
 	int err = 0;
 
-	xen_do_write_msr(msr, val, &err);
+	xen_do_write_msr(msr, (u64)high << 32 | low, &err);
 
 	return err;
 }
+#define PV_PROLOGUE_MSR_xen_write_msr_safe	\
+	"mov %ecx, %edi; mov %eax, %esi;"
+#define PV_EPILOGUE_MSR_xen_write_msr_safe
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr_safe);
 
-static u64 xen_read_msr(u32 msr)
+__visible u64 xen_read_msr(u32 msr)
 {
 	int err;
 
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
+#define PV_PROLOGUE_MSR_xen_read_msr	"mov %ecx, %edi;"
+#define PV_EPILOGUE_MSR_xen_read_msr	\
+	"mov %rax, %rdx; mov %eax, %eax; shr $0x20, %rdx;"
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr);
 
-static void xen_write_msr(u32 msr, u64 val)
+__visible void xen_write_msr(u32 msr, u32 low, u32 high)
 {
 	int err;
 
-	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
+	xen_do_write_msr(msr, (u64)high << 32 | low,
+			 xen_msr_safe ? &err : NULL);
 }
+#define PV_PROLOGUE_MSR_xen_write_msr	\
+	"mov %ecx, %edi; mov %eax, %esi;"
+#define PV_EPILOGUE_MSR_xen_write_msr
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr);
 
 /* This is called once we have the cpu_possible_mask */
 void __init xen_setup_vcpu_info_placement(void)
@@ -1225,11 +1255,11 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
 
 		.write_cr4 = xen_write_cr4,
 
-		.read_msr = xen_read_msr,
-		.write_msr = xen_write_msr,
+		.read_msr = PV_CALLEE_SAVE(xen_read_msr),
+		.write_msr = PV_CALLEE_SAVE(xen_write_msr),
 
-		.read_msr_safe = xen_read_msr_safe,
-		.write_msr_safe = xen_write_msr_safe,
+		.read_msr_safe = PV_CALLEE_SAVE(xen_read_msr_safe),
+		.write_msr_safe = PV_CALLEE_SAVE(xen_write_msr_safe),
 
 		.read_pmc = xen_read_pmc,
 
-- 
2.43.0


