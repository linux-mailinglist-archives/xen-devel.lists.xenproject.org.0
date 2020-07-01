Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48148210A12
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 13:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaaL-0006r2-Bm; Wed, 01 Jul 2020 11:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqaaK-0006nj-3O
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:07:24 +0000
X-Inumbo-ID: 049d6818-bb8b-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 049d6818-bb8b-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 11:07:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE069AD41;
 Wed,  1 Jul 2020 11:07:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] x86/xen: remove 32-bit Xen PV guest support
Date: Wed,  1 Jul 2020 13:06:47 +0200
Message-Id: <20200701110650.16172-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701110650.16172-1-jgross@suse.com>
References: <20200701110650.16172-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Xen is requiring 64-bit machines today and since Xen 4.14 it can be
built without 32-bit PV guest support. There is no need to carry the
burden of 32-bit PV guest support in the kernel any longer, as new
guests can be either HVM or PVH, or they can use a 64 bit kernel.

Remove the 32-bit Xen PV support from the kernel.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_32.S      | 109 +----------
 arch/x86/include/asm/proto.h   |   2 +-
 arch/x86/include/asm/segment.h |   2 +-
 arch/x86/kernel/head_32.S      |  31 ---
 arch/x86/xen/Kconfig           |   3 +-
 arch/x86/xen/Makefile          |   3 +-
 arch/x86/xen/apic.c            |  17 --
 arch/x86/xen/enlighten_pv.c    |  48 +----
 arch/x86/xen/mmu_pv.c          | 340 ++++-----------------------------
 arch/x86/xen/p2m.c             |   6 +-
 arch/x86/xen/setup.c           |  35 +---
 arch/x86/xen/smp_pv.c          |  18 --
 arch/x86/xen/xen-asm.S         | 182 ++++++++++++++++--
 arch/x86/xen/xen-asm_32.S      | 185 ------------------
 arch/x86/xen/xen-asm_64.S      | 181 ------------------
 arch/x86/xen/xen-head.S        |   6 -
 drivers/xen/Kconfig            |   4 +-
 17 files changed, 216 insertions(+), 956 deletions(-)
 delete mode 100644 arch/x86/xen/xen-asm_32.S
 delete mode 100644 arch/x86/xen/xen-asm_64.S

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 024d7d276cd4..70efe6d072f1 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -449,8 +449,6 @@
 
 .macro SWITCH_TO_KERNEL_STACK
 
-	ALTERNATIVE     "", "jmp .Lend_\@", X86_FEATURE_XENPV
-
 	BUG_IF_WRONG_CR3
 
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%eax
@@ -599,8 +597,6 @@
  */
 .macro SWITCH_TO_ENTRY_STACK
 
-	ALTERNATIVE     "", "jmp .Lend_\@", X86_FEATURE_XENPV
-
 	/* Bytes to copy */
 	movl	$PTREGS_SIZE, %ecx
 
@@ -872,17 +868,6 @@ SYM_ENTRY(__begin_SYSENTER_singlestep_region, SYM_L_GLOBAL, SYM_A_NONE)
  * will ignore all of the single-step traps generated in this range.
  */
 
-#ifdef CONFIG_XEN_PV
-/*
- * Xen doesn't set %esp to be precisely what the normal SYSENTER
- * entry point expects, so fix it up before using the normal path.
- */
-SYM_CODE_START(xen_sysenter_target)
-	addl	$5*4, %esp			/* remove xen-provided frame */
-	jmp	.Lsysenter_past_esp
-SYM_CODE_END(xen_sysenter_target)
-#endif
-
 /*
  * 32-bit SYSENTER entry.
  *
@@ -966,9 +951,8 @@ SYM_FUNC_START(entry_SYSENTER_32)
 
 	movl	%esp, %eax
 	call	do_fast_syscall_32
-	/* XEN PV guests always use IRET path */
-	ALTERNATIVE "testl %eax, %eax; jz .Lsyscall_32_done", \
-		    "jmp .Lsyscall_32_done", X86_FEATURE_XENPV
+	testl	%eax, %eax
+	jz	.Lsyscall_32_done
 
 	STACKLEAK_ERASE
 
@@ -1166,95 +1150,6 @@ SYM_FUNC_END(entry_INT80_32)
 #endif
 .endm
 
-#ifdef CONFIG_PARAVIRT
-SYM_CODE_START(native_iret)
-	iret
-	_ASM_EXTABLE(native_iret, asm_iret_error)
-SYM_CODE_END(native_iret)
-#endif
-
-#ifdef CONFIG_XEN_PV
-/*
- * See comment in entry_64.S for further explanation
- *
- * Note: This is not an actual IDT entry point. It's a XEN specific entry
- * point and therefore named to match the 64-bit trampoline counterpart.
- */
-SYM_FUNC_START(xen_asm_exc_xen_hypervisor_callback)
-	/*
-	 * Check to see if we got the event in the critical
-	 * region in xen_iret_direct, after we've reenabled
-	 * events and checked for pending events.  This simulates
-	 * iret instruction's behaviour where it delivers a
-	 * pending interrupt when enabling interrupts:
-	 */
-	cmpl	$xen_iret_start_crit, (%esp)
-	jb	1f
-	cmpl	$xen_iret_end_crit, (%esp)
-	jae	1f
-	call	xen_iret_crit_fixup
-1:
-	pushl	$-1				/* orig_ax = -1 => not a system call */
-	SAVE_ALL
-	ENCODE_FRAME_POINTER
-
-	mov	%esp, %eax
-	call	xen_pv_evtchn_do_upcall
-	jmp	handle_exception_return
-SYM_FUNC_END(xen_asm_exc_xen_hypervisor_callback)
-
-/*
- * Hypervisor uses this for application faults while it executes.
- * We get here for two reasons:
- *  1. Fault while reloading DS, ES, FS or GS
- *  2. Fault while executing IRET
- * Category 1 we fix up by reattempting the load, and zeroing the segment
- * register if the load fails.
- * Category 2 we fix up by jumping to do_iret_error. We cannot use the
- * normal Linux return path in this case because if we use the IRET hypercall
- * to pop the stack frame we end up in an infinite loop of failsafe callbacks.
- * We distinguish between categories by maintaining a status value in EAX.
- */
-SYM_FUNC_START(xen_failsafe_callback)
-	pushl	%eax
-	movl	$1, %eax
-1:	mov	4(%esp), %ds
-2:	mov	8(%esp), %es
-3:	mov	12(%esp), %fs
-4:	mov	16(%esp), %gs
-	/* EAX == 0 => Category 1 (Bad segment)
-	   EAX != 0 => Category 2 (Bad IRET) */
-	testl	%eax, %eax
-	popl	%eax
-	lea	16(%esp), %esp
-	jz	5f
-	jmp	asm_iret_error
-5:	pushl	$-1				/* orig_ax = -1 => not a system call */
-	SAVE_ALL
-	ENCODE_FRAME_POINTER
-	jmp	handle_exception_return
-
-.section .fixup, "ax"
-6:	xorl	%eax, %eax
-	movl	%eax, 4(%esp)
-	jmp	1b
-7:	xorl	%eax, %eax
-	movl	%eax, 8(%esp)
-	jmp	2b
-8:	xorl	%eax, %eax
-	movl	%eax, 12(%esp)
-	jmp	3b
-9:	xorl	%eax, %eax
-	movl	%eax, 16(%esp)
-	jmp	4b
-.previous
-	_ASM_EXTABLE(1b, 6b)
-	_ASM_EXTABLE(2b, 7b)
-	_ASM_EXTABLE(3b, 8b)
-	_ASM_EXTABLE(4b, 9b)
-SYM_FUNC_END(xen_failsafe_callback)
-#endif /* CONFIG_XEN_PV */
-
 SYM_CODE_START_LOCAL_NOALIGN(handle_exception)
 	/* the function address is in %gs's slot on the stack */
 	SAVE_ALL switch_stacks=1 skip_gs=1 unwind_espfix=1
diff --git a/arch/x86/include/asm/proto.h b/arch/x86/include/asm/proto.h
index 6e81788a30c1..28996fe19301 100644
--- a/arch/x86/include/asm/proto.h
+++ b/arch/x86/include/asm/proto.h
@@ -25,7 +25,7 @@ void entry_SYSENTER_compat(void);
 void __end_entry_SYSENTER_compat(void);
 void entry_SYSCALL_compat(void);
 void entry_INT80_compat(void);
-#if defined(CONFIG_X86_64) && defined(CONFIG_XEN_PV)
+#ifdef CONFIG_XEN_PV
 void xen_entry_INT80_compat(void);
 #endif
 #endif
diff --git a/arch/x86/include/asm/segment.h b/arch/x86/include/asm/segment.h
index 6669164abadc..9646c300f128 100644
--- a/arch/x86/include/asm/segment.h
+++ b/arch/x86/include/asm/segment.h
@@ -301,7 +301,7 @@ static inline void vdso_read_cpunode(unsigned *cpu, unsigned *node)
 extern const char early_idt_handler_array[NUM_EXCEPTION_VECTORS][EARLY_IDT_HANDLER_SIZE];
 extern void early_ignore_irq(void);
 
-#if defined(CONFIG_X86_64) && defined(CONFIG_XEN_PV)
+#ifdef CONFIG_XEN_PV
 extern const char xen_early_idt_handler_array[NUM_EXCEPTION_VECTORS][XEN_EARLY_IDT_HANDLER_SIZE];
 #endif
 
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index f66a6b90f954..7ed84c282233 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -134,38 +134,7 @@ SYM_CODE_START(startup_32)
 	movl %eax,pa(initial_page_table+0xffc)
 #endif
 
-#ifdef CONFIG_PARAVIRT
-	/* This is can only trip for a broken bootloader... */
-	cmpw $0x207, pa(boot_params + BP_version)
-	jb .Ldefault_entry
-
-	/* Paravirt-compatible boot parameters.  Look to see what architecture
-		we're booting under. */
-	movl pa(boot_params + BP_hardware_subarch), %eax
-	cmpl $num_subarch_entries, %eax
-	jae .Lbad_subarch
-
-	movl pa(subarch_entries)(,%eax,4), %eax
-	subl $__PAGE_OFFSET, %eax
-	jmp *%eax
-
-.Lbad_subarch:
-SYM_INNER_LABEL_ALIGN(xen_entry, SYM_L_WEAK)
-	/* Unknown implementation; there's really
-	   nothing we can do at this point. */
-	ud2a
-
-	__INITDATA
-
-subarch_entries:
-	.long .Ldefault_entry		/* normal x86/PC */
-	.long xen_entry			/* Xen hypervisor */
-	.long .Ldefault_entry		/* Moorestown MID */
-num_subarch_entries = (. - subarch_entries) / 4
-.previous
-#else
 	jmp .Ldefault_entry
-#endif /* CONFIG_PARAVIRT */
 SYM_CODE_END(startup_32)
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 1aded63a95cb..218acbd5c7a0 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -19,6 +19,7 @@ config XEN_PV
 	bool "Xen PV guest support"
 	default y
 	depends on XEN
+	depends on X86_64
 	select PARAVIRT_XXL
 	select XEN_HAVE_PVMMU
 	select XEN_HAVE_VPMU
@@ -50,7 +51,7 @@ config XEN_PVHVM_SMP
 
 config XEN_512GB
 	bool "Limit Xen pv-domain memory to 512GB"
-	depends on XEN_PV && X86_64
+	depends on XEN_PV
 	default y
 	help
 	  Limit paravirtualized user domains to 512GB of RAM.
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 084de77a109e..5de137d536cc 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-OBJECT_FILES_NON_STANDARD_xen-asm_$(BITS).o := y
+OBJECT_FILES_NON_STANDARD_xen-asm.o := y
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
@@ -34,7 +34,6 @@ obj-$(CONFIG_XEN_PV)		+= mmu_pv.o
 obj-$(CONFIG_XEN_PV)		+= irq.o
 obj-$(CONFIG_XEN_PV)		+= multicalls.o
 obj-$(CONFIG_XEN_PV)		+= xen-asm.o
-obj-$(CONFIG_XEN_PV)		+= xen-asm_$(BITS).o
 
 obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
 
diff --git a/arch/x86/xen/apic.c b/arch/x86/xen/apic.c
index 5e53bfbe5823..ea6e9c54da9d 100644
--- a/arch/x86/xen/apic.c
+++ b/arch/x86/xen/apic.c
@@ -58,10 +58,6 @@ static u32 xen_apic_read(u32 reg)
 
 	if (reg == APIC_LVR)
 		return 0x14;
-#ifdef CONFIG_X86_32
-	if (reg == APIC_LDR)
-		return SET_APIC_LOGICAL_ID(1UL << smp_processor_id());
-#endif
 	if (reg != APIC_ID)
 		return 0;
 
@@ -127,14 +123,6 @@ static int xen_phys_pkg_id(int initial_apic_id, int index_msb)
 	return initial_apic_id >> index_msb;
 }
 
-#ifdef CONFIG_X86_32
-static int xen_x86_32_early_logical_apicid(int cpu)
-{
-	/* Match with APIC_LDR read. Otherwise setup_local_APIC complains. */
-	return 1 << cpu;
-}
-#endif
-
 static void xen_noop(void)
 {
 }
@@ -197,11 +185,6 @@ static struct apic xen_pv_apic = {
 	.icr_write 			= xen_apic_icr_write,
 	.wait_icr_idle 			= xen_noop,
 	.safe_wait_icr_idle 		= xen_safe_apic_wait_icr_idle,
-
-#ifdef CONFIG_X86_32
-	/* generic_processor_info and setup_local_APIC. */
-	.x86_32_early_logical_apicid	= xen_x86_32_early_logical_apicid,
-#endif
 };
 
 static void __init xen_apic_check(void)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index acc49fa6a097..44562d30878c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -119,14 +119,6 @@ static void __init xen_banner(void)
 	printk(KERN_INFO "Xen version: %d.%d%s%s\n",
 	       version >> 16, version & 0xffff, extra.extraversion,
 	       xen_feature(XENFEAT_mmu_pt_update_preserve_ad) ? " (preserve-AD)" : "");
-
-#ifdef CONFIG_X86_32
-	pr_warn("WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!\n"
-		"Support for running as 32-bit PV-guest under Xen will soon be removed\n"
-		"from the Linux kernel!\n"
-		"Please use either a 64-bit kernel or switch to HVM or PVH mode!\n"
-		"WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!\n");
-#endif
 }
 
 static void __init xen_pv_init_platform(void)
@@ -555,13 +547,8 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 	 * exception between the new %fs descriptor being loaded and
 	 * %fs being effectively cleared at __switch_to().
 	 */
-	if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_CPU) {
-#ifdef CONFIG_X86_32
-		lazy_load_gs(0);
-#else
+	if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_CPU)
 		loadsegment(fs, 0);
-#endif
-	}
 
 	xen_mc_batch();
 
@@ -572,13 +559,11 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 	xen_mc_issue(PARAVIRT_LAZY_CPU);
 }
 
-#ifdef CONFIG_X86_64
 static void xen_load_gs_index(unsigned int idx)
 {
 	if (HYPERVISOR_set_segment_base(SEGBASE_GS_USER_SEL, idx))
 		BUG();
 }
-#endif
 
 static void xen_write_ldt_entry(struct desc_struct *dt, int entrynum,
 				const void *ptr)
@@ -597,7 +582,6 @@ static void xen_write_ldt_entry(struct desc_struct *dt, int entrynum,
 	preempt_enable();
 }
 
-#ifdef CONFIG_X86_64
 struct trap_array_entry {
 	void (*orig)(void);
 	void (*xen)(void);
@@ -677,7 +661,6 @@ static bool __ref get_trap_addr(void **addr, unsigned int ist)
 
 	return true;
 }
-#endif
 
 static int cvt_gate_to_trap(int vector, const gate_desc *val,
 			    struct trap_info *info)
@@ -690,10 +673,8 @@ static int cvt_gate_to_trap(int vector, const gate_desc *val,
 	info->vector = vector;
 
 	addr = gate_offset(val);
-#ifdef CONFIG_X86_64
 	if (!get_trap_addr((void **)&addr, val->bits.ist))
 		return 0;
-#endif	/* CONFIG_X86_64 */
 	info->address = addr;
 
 	info->cs = gate_segment(val);
@@ -927,15 +908,12 @@ static u64 xen_read_msr_safe(unsigned int msr, int *err)
 static int xen_write_msr_safe(unsigned int msr, unsigned low, unsigned high)
 {
 	int ret;
-#ifdef CONFIG_X86_64
 	unsigned int which;
 	u64 base;
-#endif
 
 	ret = 0;
 
 	switch (msr) {
-#ifdef CONFIG_X86_64
 	case MSR_FS_BASE:		which = SEGBASE_FS; goto set;
 	case MSR_KERNEL_GS_BASE:	which = SEGBASE_GS_USER; goto set;
 	case MSR_GS_BASE:		which = SEGBASE_GS_KERNEL; goto set;
@@ -945,7 +923,6 @@ static int xen_write_msr_safe(unsigned int msr, unsigned low, unsigned high)
 		if (HYPERVISOR_set_segment_base(which, base) != 0)
 			ret = -EIO;
 		break;
-#endif
 
 	case MSR_STAR:
 	case MSR_CSTAR:
@@ -1027,9 +1004,7 @@ void __init xen_setup_vcpu_info_placement(void)
 static const struct pv_info xen_info __initconst = {
 	.shared_kernel_pmd = 0,
 
-#ifdef CONFIG_X86_64
 	.extra_user_64bit_cs = FLAT_USER_CS64,
-#endif
 	.name = "Xen",
 };
 
@@ -1055,18 +1030,14 @@ static const struct pv_cpu_ops xen_cpu_ops __initconst = {
 	.read_pmc = xen_read_pmc,
 
 	.iret = xen_iret,
-#ifdef CONFIG_X86_64
 	.usergs_sysret64 = xen_sysret64,
-#endif
 
 	.load_tr_desc = paravirt_nop,
 	.set_ldt = xen_set_ldt,
 	.load_gdt = xen_load_gdt,
 	.load_idt = xen_load_idt,
 	.load_tls = xen_load_tls,
-#ifdef CONFIG_X86_64
 	.load_gs_index = xen_load_gs_index,
-#endif
 
 	.alloc_ldt = xen_alloc_ldt,
 	.free_ldt = xen_free_ldt,
@@ -1332,13 +1303,8 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 	/* keep using Xen gdt for now; no urgent need to change it */
 
-#ifdef CONFIG_X86_32
-	pv_info.kernel_rpl = 1;
-	if (xen_feature(XENFEAT_supervisor_mode_kernel))
-		pv_info.kernel_rpl = 0;
-#else
 	pv_info.kernel_rpl = 0;
-#endif
+
 	/* set the limit of our address space */
 	xen_reserve_top();
 
@@ -1352,12 +1318,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	if (rc != 0)
 		xen_raw_printk("physdev_op failed %d\n", rc);
 
-#ifdef CONFIG_X86_32
-	/* set up basic CPUID stuff */
-	cpu_detect(&new_cpu_data);
-	set_cpu_cap(&new_cpu_data, X86_FEATURE_FPU);
-	new_cpu_data.x86_capability[CPUID_1_EDX] = cpuid_edx(1);
-#endif
 
 	if (xen_start_info->mod_start) {
 	    if (xen_start_info->flags & SIF_MOD_START_PFN)
@@ -1426,12 +1386,8 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	xen_efi_init(&boot_params);
 
 	/* Start the world */
-#ifdef CONFIG_X86_32
-	i386_start_kernel();
-#else
 	cr4_init_shadow(); /* 32b kernel does this in i386_start_kernel() */
 	x86_64_start_reservations((char *)__pa_symbol(&boot_params));
-#endif
 }
 
 static int xen_cpu_up_prepare_pv(unsigned int cpu)
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index a58d9c69807a..317aa8b78c07 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -86,19 +86,8 @@
 #include "mmu.h"
 #include "debugfs.h"
 
-#ifdef CONFIG_X86_32
-/*
- * Identity map, in addition to plain kernel map.  This needs to be
- * large enough to allocate page table pages to allocate the rest.
- * Each page can map 2MB.
- */
-#define LEVEL1_IDENT_ENTRIES	(PTRS_PER_PTE * 4)
-static RESERVE_BRK_ARRAY(pte_t, level1_ident_pgt, LEVEL1_IDENT_ENTRIES);
-#endif
-#ifdef CONFIG_X86_64
 /* l3 pud for userspace vsyscall mapping */
 static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
-#endif /* CONFIG_X86_64 */
 
 /*
  * Protects atomic reservation decrease/increase against concurrent increases.
@@ -439,26 +428,6 @@ static void xen_set_pud(pud_t *ptr, pud_t val)
 	xen_set_pud_hyper(ptr, val);
 }
 
-#ifdef CONFIG_X86_PAE
-static void xen_set_pte_atomic(pte_t *ptep, pte_t pte)
-{
-	trace_xen_mmu_set_pte_atomic(ptep, pte);
-	__xen_set_pte(ptep, pte);
-}
-
-static void xen_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
-{
-	trace_xen_mmu_pte_clear(mm, addr, ptep);
-	__xen_set_pte(ptep, native_make_pte(0));
-}
-
-static void xen_pmd_clear(pmd_t *pmdp)
-{
-	trace_xen_mmu_pmd_clear(pmdp);
-	set_pmd(pmdp, __pmd(0));
-}
-#endif	/* CONFIG_X86_PAE */
-
 __visible pmd_t xen_make_pmd(pmdval_t pmd)
 {
 	pmd = pte_pfn_to_mfn(pmd);
@@ -466,7 +435,6 @@ __visible pmd_t xen_make_pmd(pmdval_t pmd)
 }
 PV_CALLEE_SAVE_REGS_THUNK(xen_make_pmd);
 
-#ifdef CONFIG_X86_64
 __visible pudval_t xen_pud_val(pud_t pud)
 {
 	return pte_mfn_to_pfn(pud.pud);
@@ -571,7 +539,6 @@ __visible p4d_t xen_make_p4d(p4dval_t p4d)
 }
 PV_CALLEE_SAVE_REGS_THUNK(xen_make_p4d);
 #endif  /* CONFIG_PGTABLE_LEVELS >= 5 */
-#endif	/* CONFIG_X86_64 */
 
 static int xen_pmd_walk(struct mm_struct *mm, pmd_t *pmd,
 		int (*func)(struct mm_struct *mm, struct page *, enum pt_level),
@@ -654,14 +621,12 @@ static int __xen_pgd_walk(struct mm_struct *mm, pgd_t *pgd,
 	limit--;
 	BUG_ON(limit >= FIXADDR_TOP);
 
-#ifdef CONFIG_X86_64
 	/*
 	 * 64-bit has a great big hole in the middle of the address
 	 * space, which contains the Xen mappings.
 	 */
 	hole_low = pgd_index(GUARD_HOLE_BASE_ADDR);
 	hole_high = pgd_index(GUARD_HOLE_END_ADDR);
-#endif
 
 	nr = pgd_index(limit) + 1;
 	for (i = 0; i < nr; i++) {
@@ -787,6 +752,8 @@ static int xen_pin_page(struct mm_struct *mm, struct page *page,
    read-only, and can be pinned. */
 static void __xen_pgd_pin(struct mm_struct *mm, pgd_t *pgd)
 {
+	pgd_t *user_pgd = xen_get_user_pgd(pgd);
+
 	trace_xen_mmu_pgd_pin(mm, pgd);
 
 	xen_mc_batch();
@@ -800,26 +767,14 @@ static void __xen_pgd_pin(struct mm_struct *mm, pgd_t *pgd)
 		xen_mc_batch();
 	}
 
-#ifdef CONFIG_X86_64
-	{
-		pgd_t *user_pgd = xen_get_user_pgd(pgd);
-
-		xen_do_pin(MMUEXT_PIN_L4_TABLE, PFN_DOWN(__pa(pgd)));
+	xen_do_pin(MMUEXT_PIN_L4_TABLE, PFN_DOWN(__pa(pgd)));
 
-		if (user_pgd) {
-			xen_pin_page(mm, virt_to_page(user_pgd), PT_PGD);
-			xen_do_pin(MMUEXT_PIN_L4_TABLE,
-				   PFN_DOWN(__pa(user_pgd)));
-		}
+	if (user_pgd) {
+		xen_pin_page(mm, virt_to_page(user_pgd), PT_PGD);
+		xen_do_pin(MMUEXT_PIN_L4_TABLE,
+			   PFN_DOWN(__pa(user_pgd)));
 	}
-#else /* CONFIG_X86_32 */
-#ifdef CONFIG_X86_PAE
-	/* Need to make sure unshared kernel PMD is pinnable */
-	xen_pin_page(mm, pgd_page(pgd[pgd_index(TASK_SIZE)]),
-		     PT_PMD);
-#endif
-	xen_do_pin(MMUEXT_PIN_L3_TABLE, PFN_DOWN(__pa(pgd)));
-#endif /* CONFIG_X86_64 */
+
 	xen_mc_issue(0);
 }
 
@@ -870,9 +825,7 @@ static int __init xen_mark_pinned(struct mm_struct *mm, struct page *page,
 static void __init xen_after_bootmem(void)
 {
 	static_branch_enable(&xen_struct_pages_ready);
-#ifdef CONFIG_X86_64
 	SetPagePinned(virt_to_page(level3_user_vsyscall));
-#endif
 	xen_pgd_walk(&init_mm, xen_mark_pinned, FIXADDR_TOP);
 }
 
@@ -919,29 +872,19 @@ static int xen_unpin_page(struct mm_struct *mm, struct page *page,
 /* Release a pagetables pages back as normal RW */
 static void __xen_pgd_unpin(struct mm_struct *mm, pgd_t *pgd)
 {
+	pgd_t *user_pgd = xen_get_user_pgd(pgd);
+
 	trace_xen_mmu_pgd_unpin(mm, pgd);
 
 	xen_mc_batch();
 
 	xen_do_pin(MMUEXT_UNPIN_TABLE, PFN_DOWN(__pa(pgd)));
 
-#ifdef CONFIG_X86_64
-	{
-		pgd_t *user_pgd = xen_get_user_pgd(pgd);
-
-		if (user_pgd) {
-			xen_do_pin(MMUEXT_UNPIN_TABLE,
-				   PFN_DOWN(__pa(user_pgd)));
-			xen_unpin_page(mm, virt_to_page(user_pgd), PT_PGD);
-		}
+	if (user_pgd) {
+		xen_do_pin(MMUEXT_UNPIN_TABLE,
+			   PFN_DOWN(__pa(user_pgd)));
+		xen_unpin_page(mm, virt_to_page(user_pgd), PT_PGD);
 	}
-#endif
-
-#ifdef CONFIG_X86_PAE
-	/* Need to make sure unshared kernel PMD is unpinned */
-	xen_unpin_page(mm, pgd_page(pgd[pgd_index(TASK_SIZE)]),
-		       PT_PMD);
-#endif
 
 	__xen_pgd_walk(mm, pgd, xen_unpin_page, USER_LIMIT);
 
@@ -1089,7 +1032,6 @@ static void __init pin_pagetable_pfn(unsigned cmd, unsigned long pfn)
 		BUG();
 }
 
-#ifdef CONFIG_X86_64
 static void __init xen_cleanhighmap(unsigned long vaddr,
 				    unsigned long vaddr_end)
 {
@@ -1273,17 +1215,15 @@ static void __init xen_pagetable_cleanhighmap(void)
 	xen_cleanhighmap(addr, roundup(addr + size, PMD_SIZE * 2));
 	xen_start_info->pt_base = (unsigned long)__va(__pa(xen_start_info->pt_base));
 }
-#endif
 
 static void __init xen_pagetable_p2m_setup(void)
 {
 	xen_vmalloc_p2m_tree();
 
-#ifdef CONFIG_X86_64
 	xen_pagetable_p2m_free();
 
 	xen_pagetable_cleanhighmap();
-#endif
+
 	/* And revector! Bye bye old array */
 	xen_start_info->mfn_list = (unsigned long)xen_p2m_addr;
 }
@@ -1420,6 +1360,8 @@ static void __xen_write_cr3(bool kernel, unsigned long cr3)
 }
 static void xen_write_cr3(unsigned long cr3)
 {
+	pgd_t *user_pgd = xen_get_user_pgd(__va(cr3));
+
 	BUG_ON(preemptible());
 
 	xen_mc_batch();  /* disables interrupts */
@@ -1430,20 +1372,14 @@ static void xen_write_cr3(unsigned long cr3)
 
 	__xen_write_cr3(true, cr3);
 
-#ifdef CONFIG_X86_64
-	{
-		pgd_t *user_pgd = xen_get_user_pgd(__va(cr3));
-		if (user_pgd)
-			__xen_write_cr3(false, __pa(user_pgd));
-		else
-			__xen_write_cr3(false, 0);
-	}
-#endif
+	if (user_pgd)
+		__xen_write_cr3(false, __pa(user_pgd));
+	else
+		__xen_write_cr3(false, 0);
 
 	xen_mc_issue(PARAVIRT_LAZY_CPU);  /* interrupts restored */
 }
 
-#ifdef CONFIG_X86_64
 /*
  * At the start of the day - when Xen launches a guest, it has already
  * built pagetables for the guest. We diligently look over them
@@ -1478,49 +1414,39 @@ static void __init xen_write_cr3_init(unsigned long cr3)
 
 	xen_mc_issue(PARAVIRT_LAZY_CPU);  /* interrupts restored */
 }
-#endif
 
 static int xen_pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *pgd = mm->pgd;
-	int ret = 0;
+	struct page *page = virt_to_page(pgd);
+	pgd_t *user_pgd;
+	int ret = -ENOMEM;
 
 	BUG_ON(PagePinned(virt_to_page(pgd)));
+	BUG_ON(page->private != 0);
 
-#ifdef CONFIG_X86_64
-	{
-		struct page *page = virt_to_page(pgd);
-		pgd_t *user_pgd;
-
-		BUG_ON(page->private != 0);
-
-		ret = -ENOMEM;
-
-		user_pgd = (pgd_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
-		page->private = (unsigned long)user_pgd;
+	user_pgd = (pgd_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+	page->private = (unsigned long)user_pgd;
 
-		if (user_pgd != NULL) {
+	if (user_pgd != NULL) {
 #ifdef CONFIG_X86_VSYSCALL_EMULATION
-			user_pgd[pgd_index(VSYSCALL_ADDR)] =
-				__pgd(__pa(level3_user_vsyscall) | _PAGE_TABLE);
+		user_pgd[pgd_index(VSYSCALL_ADDR)] =
+			__pgd(__pa(level3_user_vsyscall) | _PAGE_TABLE);
 #endif
-			ret = 0;
-		}
-
-		BUG_ON(PagePinned(virt_to_page(xen_get_user_pgd(pgd))));
+		ret = 0;
 	}
-#endif
+
+	BUG_ON(PagePinned(virt_to_page(xen_get_user_pgd(pgd))));
+
 	return ret;
 }
 
 static void xen_pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-#ifdef CONFIG_X86_64
 	pgd_t *user_pgd = xen_get_user_pgd(pgd);
 
 	if (user_pgd)
 		free_page((unsigned long)user_pgd);
-#endif
 }
 
 /*
@@ -1539,7 +1465,6 @@ static void xen_pgd_free(struct mm_struct *mm, pgd_t *pgd)
  */
 __visible pte_t xen_make_pte_init(pteval_t pte)
 {
-#ifdef CONFIG_X86_64
 	unsigned long pfn;
 
 	/*
@@ -1553,7 +1478,7 @@ __visible pte_t xen_make_pte_init(pteval_t pte)
 	    pfn >= xen_start_info->first_p2m_pfn &&
 	    pfn < xen_start_info->first_p2m_pfn + xen_start_info->nr_p2m_frames)
 		pte &= ~_PAGE_RW;
-#endif
+
 	pte = pte_pfn_to_mfn(pte);
 	return native_make_pte(pte);
 }
@@ -1561,13 +1486,6 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_make_pte_init);
 
 static void __init xen_set_pte_init(pte_t *ptep, pte_t pte)
 {
-#ifdef CONFIG_X86_32
-	/* If there's an existing pte, then don't allow _PAGE_RW to be set */
-	if (pte_mfn(pte) != INVALID_P2M_ENTRY
-	    && pte_val_ma(*ptep) & _PAGE_PRESENT)
-		pte = __pte_ma(((pte_val_ma(*ptep) & _PAGE_RW) | ~_PAGE_RW) &
-			       pte_val_ma(pte));
-#endif
 	__xen_set_pte(ptep, pte);
 }
 
@@ -1702,7 +1620,6 @@ static void xen_release_pmd(unsigned long pfn)
 	xen_release_ptpage(pfn, PT_PMD);
 }
 
-#ifdef CONFIG_X86_64
 static void xen_alloc_pud(struct mm_struct *mm, unsigned long pfn)
 {
 	xen_alloc_ptpage(mm, pfn, PT_PUD);
@@ -1712,19 +1629,9 @@ static void xen_release_pud(unsigned long pfn)
 {
 	xen_release_ptpage(pfn, PT_PUD);
 }
-#endif
 
 void __init xen_reserve_top(void)
 {
-#ifdef CONFIG_X86_32
-	unsigned long top = HYPERVISOR_VIRT_START;
-	struct xen_platform_parameters pp;
-
-	if (HYPERVISOR_xen_version(XENVER_platform_parameters, &pp) == 0)
-		top = pp.virt_start;
-
-	reserve_top_address(-top);
-#endif	/* CONFIG_X86_32 */
 }
 
 /*
@@ -1733,11 +1640,7 @@ void __init xen_reserve_top(void)
  */
 static void * __init __ka(phys_addr_t paddr)
 {
-#ifdef CONFIG_X86_64
 	return (void *)(paddr + __START_KERNEL_map);
-#else
-	return __va(paddr);
-#endif
 }
 
 /* Convert a machine address to physical address */
@@ -1771,56 +1674,7 @@ static void __init set_page_prot(void *addr, pgprot_t prot)
 {
 	return set_page_prot_flags(addr, prot, UVMF_NONE);
 }
-#ifdef CONFIG_X86_32
-static void __init xen_map_identity_early(pmd_t *pmd, unsigned long max_pfn)
-{
-	unsigned pmdidx, pteidx;
-	unsigned ident_pte;
-	unsigned long pfn;
-
-	level1_ident_pgt = extend_brk(sizeof(pte_t) * LEVEL1_IDENT_ENTRIES,
-				      PAGE_SIZE);
 
-	ident_pte = 0;
-	pfn = 0;
-	for (pmdidx = 0; pmdidx < PTRS_PER_PMD && pfn < max_pfn; pmdidx++) {
-		pte_t *pte_page;
-
-		/* Reuse or allocate a page of ptes */
-		if (pmd_present(pmd[pmdidx]))
-			pte_page = m2v(pmd[pmdidx].pmd);
-		else {
-			/* Check for free pte pages */
-			if (ident_pte == LEVEL1_IDENT_ENTRIES)
-				break;
-
-			pte_page = &level1_ident_pgt[ident_pte];
-			ident_pte += PTRS_PER_PTE;
-
-			pmd[pmdidx] = __pmd(__pa(pte_page) | _PAGE_TABLE);
-		}
-
-		/* Install mappings */
-		for (pteidx = 0; pteidx < PTRS_PER_PTE; pteidx++, pfn++) {
-			pte_t pte;
-
-			if (pfn > max_pfn_mapped)
-				max_pfn_mapped = pfn;
-
-			if (!pte_none(pte_page[pteidx]))
-				continue;
-
-			pte = pfn_pte(pfn, PAGE_KERNEL_EXEC);
-			pte_page[pteidx] = pte;
-		}
-	}
-
-	for (pteidx = 0; pteidx < ident_pte; pteidx += PTRS_PER_PTE)
-		set_page_prot(&level1_ident_pgt[pteidx], PAGE_KERNEL_RO);
-
-	set_page_prot(pmd, PAGE_KERNEL_RO);
-}
-#endif
 void __init xen_setup_machphys_mapping(void)
 {
 	struct xen_machphys_mapping mapping;
@@ -1831,13 +1685,8 @@ void __init xen_setup_machphys_mapping(void)
 	} else {
 		machine_to_phys_nr = MACH2PHYS_NR_ENTRIES;
 	}
-#ifdef CONFIG_X86_32
-	WARN_ON((machine_to_phys_mapping + (machine_to_phys_nr - 1))
-		< machine_to_phys_mapping);
-#endif
 }
 
-#ifdef CONFIG_X86_64
 static void __init convert_pfn_mfn(void *v)
 {
 	pte_t *pte = v;
@@ -2168,105 +2017,6 @@ void __init xen_relocate_p2m(void)
 	xen_start_info->nr_p2m_frames = n_frames;
 }
 
-#else	/* !CONFIG_X86_64 */
-static RESERVE_BRK_ARRAY(pmd_t, initial_kernel_pmd, PTRS_PER_PMD);
-static RESERVE_BRK_ARRAY(pmd_t, swapper_kernel_pmd, PTRS_PER_PMD);
-RESERVE_BRK(fixup_kernel_pmd, PAGE_SIZE);
-RESERVE_BRK(fixup_kernel_pte, PAGE_SIZE);
-
-static void __init xen_write_cr3_init(unsigned long cr3)
-{
-	unsigned long pfn = PFN_DOWN(__pa(swapper_pg_dir));
-
-	BUG_ON(read_cr3_pa() != __pa(initial_page_table));
-	BUG_ON(cr3 != __pa(swapper_pg_dir));
-
-	/*
-	 * We are switching to swapper_pg_dir for the first time (from
-	 * initial_page_table) and therefore need to mark that page
-	 * read-only and then pin it.
-	 *
-	 * Xen disallows sharing of kernel PMDs for PAE
-	 * guests. Therefore we must copy the kernel PMD from
-	 * initial_page_table into a new kernel PMD to be used in
-	 * swapper_pg_dir.
-	 */
-	swapper_kernel_pmd =
-		extend_brk(sizeof(pmd_t) * PTRS_PER_PMD, PAGE_SIZE);
-	copy_page(swapper_kernel_pmd, initial_kernel_pmd);
-	swapper_pg_dir[KERNEL_PGD_BOUNDARY] =
-		__pgd(__pa(swapper_kernel_pmd) | _PAGE_PRESENT);
-	set_page_prot(swapper_kernel_pmd, PAGE_KERNEL_RO);
-
-	set_page_prot(swapper_pg_dir, PAGE_KERNEL_RO);
-	xen_write_cr3(cr3);
-	pin_pagetable_pfn(MMUEXT_PIN_L3_TABLE, pfn);
-
-	pin_pagetable_pfn(MMUEXT_UNPIN_TABLE,
-			  PFN_DOWN(__pa(initial_page_table)));
-	set_page_prot(initial_page_table, PAGE_KERNEL);
-	set_page_prot(initial_kernel_pmd, PAGE_KERNEL);
-
-	pv_ops.mmu.write_cr3 = &xen_write_cr3;
-}
-
-/*
- * For 32 bit domains xen_start_info->pt_base is the pgd address which might be
- * not the first page table in the page table pool.
- * Iterate through the initial page tables to find the real page table base.
- */
-static phys_addr_t __init xen_find_pt_base(pmd_t *pmd)
-{
-	phys_addr_t pt_base, paddr;
-	unsigned pmdidx;
-
-	pt_base = min(__pa(xen_start_info->pt_base), __pa(pmd));
-
-	for (pmdidx = 0; pmdidx < PTRS_PER_PMD; pmdidx++)
-		if (pmd_present(pmd[pmdidx]) && !pmd_large(pmd[pmdidx])) {
-			paddr = m2p(pmd[pmdidx].pmd);
-			pt_base = min(pt_base, paddr);
-		}
-
-	return pt_base;
-}
-
-void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
-{
-	pmd_t *kernel_pmd;
-
-	kernel_pmd = m2v(pgd[KERNEL_PGD_BOUNDARY].pgd);
-
-	xen_pt_base = xen_find_pt_base(kernel_pmd);
-	xen_pt_size = xen_start_info->nr_pt_frames * PAGE_SIZE;
-
-	initial_kernel_pmd =
-		extend_brk(sizeof(pmd_t) * PTRS_PER_PMD, PAGE_SIZE);
-
-	max_pfn_mapped = PFN_DOWN(xen_pt_base + xen_pt_size + 512 * 1024);
-
-	copy_page(initial_kernel_pmd, kernel_pmd);
-
-	xen_map_identity_early(initial_kernel_pmd, max_pfn);
-
-	copy_page(initial_page_table, pgd);
-	initial_page_table[KERNEL_PGD_BOUNDARY] =
-		__pgd(__pa(initial_kernel_pmd) | _PAGE_PRESENT);
-
-	set_page_prot(initial_kernel_pmd, PAGE_KERNEL_RO);
-	set_page_prot(initial_page_table, PAGE_KERNEL_RO);
-	set_page_prot(empty_zero_page, PAGE_KERNEL_RO);
-
-	pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, PFN_DOWN(__pa(pgd)));
-
-	pin_pagetable_pfn(MMUEXT_PIN_L3_TABLE,
-			  PFN_DOWN(__pa(initial_page_table)));
-	xen_write_cr3(__pa(initial_page_table));
-
-	memblock_reserve(xen_pt_base, xen_pt_size);
-}
-#endif	/* CONFIG_X86_64 */
-
 void __init xen_reserve_special_pages(void)
 {
 	phys_addr_t paddr;
@@ -2300,12 +2050,7 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 
 	switch (idx) {
 	case FIX_BTMAP_END ... FIX_BTMAP_BEGIN:
-#ifdef CONFIG_X86_32
-	case FIX_WP_TEST:
-# ifdef CONFIG_HIGHMEM
-	case FIX_KMAP_BEGIN ... FIX_KMAP_END:
-# endif
-#elif defined(CONFIG_X86_VSYSCALL_EMULATION)
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
 	case VSYSCALL_PAGE:
 #endif
 		/* All local page mappings */
@@ -2357,9 +2102,7 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.set_pte = xen_set_pte;
 	pv_ops.mmu.set_pmd = xen_set_pmd;
 	pv_ops.mmu.set_pud = xen_set_pud;
-#ifdef CONFIG_X86_64
 	pv_ops.mmu.set_p4d = xen_set_p4d;
-#endif
 
 	/* This will work as long as patching hasn't happened yet
 	   (which it hasn't) */
@@ -2367,15 +2110,11 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.alloc_pmd = xen_alloc_pmd;
 	pv_ops.mmu.release_pte = xen_release_pte;
 	pv_ops.mmu.release_pmd = xen_release_pmd;
-#ifdef CONFIG_X86_64
 	pv_ops.mmu.alloc_pud = xen_alloc_pud;
 	pv_ops.mmu.release_pud = xen_release_pud;
-#endif
 	pv_ops.mmu.make_pte = PV_CALLEE_SAVE(xen_make_pte);
 
-#ifdef CONFIG_X86_64
 	pv_ops.mmu.write_cr3 = &xen_write_cr3;
-#endif
 }
 
 static void xen_leave_lazy_mmu(void)
@@ -2420,17 +2159,11 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
 	.make_pte = PV_CALLEE_SAVE(xen_make_pte_init),
 	.make_pgd = PV_CALLEE_SAVE(xen_make_pgd),
 
-#ifdef CONFIG_X86_PAE
-	.set_pte_atomic = xen_set_pte_atomic,
-	.pte_clear = xen_pte_clear,
-	.pmd_clear = xen_pmd_clear,
-#endif	/* CONFIG_X86_PAE */
 	.set_pud = xen_set_pud_hyper,
 
 	.make_pmd = PV_CALLEE_SAVE(xen_make_pmd),
 	.pmd_val = PV_CALLEE_SAVE(xen_pmd_val),
 
-#ifdef CONFIG_X86_64
 	.pud_val = PV_CALLEE_SAVE(xen_pud_val),
 	.make_pud = PV_CALLEE_SAVE(xen_make_pud),
 	.set_p4d = xen_set_p4d_hyper,
@@ -2442,7 +2175,6 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
 	.p4d_val = PV_CALLEE_SAVE(xen_p4d_val),
 	.make_p4d = PV_CALLEE_SAVE(xen_make_p4d),
 #endif
-#endif	/* CONFIG_X86_64 */
 
 	.activate_mm = xen_activate_mm,
 	.dup_mmap = xen_dup_mmap,
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 0acba2c712ab..be4151f42611 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -379,12 +379,8 @@ static void __init xen_rebuild_p2m_list(unsigned long *p2m)
 
 		if (type == P2M_TYPE_PFN || i < chunk) {
 			/* Use initial p2m page contents. */
-#ifdef CONFIG_X86_64
 			mfns = alloc_p2m_page();
 			copy_page(mfns, xen_p2m_addr + pfn);
-#else
-			mfns = xen_p2m_addr + pfn;
-#endif
 			ptep = populate_extra_pte((unsigned long)(p2m + pfn));
 			set_pte(ptep,
 				pfn_pte(PFN_DOWN(__pa(mfns)), PAGE_KERNEL));
@@ -467,7 +463,7 @@ EXPORT_SYMBOL_GPL(get_phys_to_machine);
  * Allocate new pmd(s). It is checked whether the old pmd is still in place.
  * If not, nothing is changed. This is okay as the only reason for allocating
  * a new pmd is to replace p2m_missing_pte or p2m_identity_pte by a individual
- * pmd. In case of PAE/x86-32 there are multiple pmds to allocate!
+ * pmd.
  */
 static pte_t *alloc_p2m_pmd(unsigned long addr, pte_t *pte_pg)
 {
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 3566e37241d7..3fd1d2ff8b5d 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -545,13 +545,10 @@ static unsigned long __init xen_get_pages_limit(void)
 {
 	unsigned long limit;
 
-#ifdef CONFIG_X86_32
-	limit = GB(64) / PAGE_SIZE;
-#else
 	limit = MAXMEM / PAGE_SIZE;
 	if (!xen_initial_domain() && xen_512gb_limit)
 		limit = GB(512) / PAGE_SIZE;
-#endif
+
 	return limit;
 }
 
@@ -722,17 +719,8 @@ static void __init xen_reserve_xen_mfnlist(void)
 	if (!xen_is_e820_reserved(start, size))
 		return;
 
-#ifdef CONFIG_X86_32
-	/*
-	 * Relocating the p2m on 32 bit system to an arbitrary virtual address
-	 * is not supported, so just give up.
-	 */
-	xen_raw_console_write("Xen hypervisor allocated p2m list conflicts with E820 map\n");
-	BUG();
-#else
 	xen_relocate_p2m();
 	memblock_free(start, size);
-#endif
 }
 
 /**
@@ -921,20 +909,6 @@ char * __init xen_memory_setup(void)
 	return "Xen";
 }
 
-/*
- * Set the bit indicating "nosegneg" library variants should be used.
- * We only need to bother in pure 32-bit mode; compat 32-bit processes
- * can have un-truncated segments, so wrapping around is allowed.
- */
-static void __init fiddle_vdso(void)
-{
-#ifdef CONFIG_X86_32
-	u32 *mask = vdso_image_32.data +
-		vdso_image_32.sym_VDSO32_NOTE_MASK;
-	*mask |= 1 << VDSO_NOTE_NONEGSEG_BIT;
-#endif
-}
-
 static int register_callback(unsigned type, const void *func)
 {
 	struct callback_register callback = {
@@ -951,11 +925,7 @@ void xen_enable_sysenter(void)
 	int ret;
 	unsigned sysenter_feature;
 
-#ifdef CONFIG_X86_32
-	sysenter_feature = X86_FEATURE_SEP;
-#else
 	sysenter_feature = X86_FEATURE_SYSENTER32;
-#endif
 
 	if (!boot_cpu_has(sysenter_feature))
 		return;
@@ -967,7 +937,6 @@ void xen_enable_sysenter(void)
 
 void xen_enable_syscall(void)
 {
-#ifdef CONFIG_X86_64
 	int ret;
 
 	ret = register_callback(CALLBACKTYPE_syscall, xen_syscall_target);
@@ -983,7 +952,6 @@ void xen_enable_syscall(void)
 		if (ret != 0)
 			setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
 	}
-#endif /* CONFIG_X86_64 */
 }
 
 static void __init xen_pvmmu_arch_setup(void)
@@ -1024,7 +992,6 @@ void __init xen_arch_setup(void)
 	disable_cpuidle();
 	disable_cpufreq();
 	WARN_ON(xen_set_default_idle());
-	fiddle_vdso();
 #ifdef CONFIG_NUMA
 	numa_off = 1;
 #endif
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 171aff1b11f2..9218aa6ab28e 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -212,15 +212,6 @@ static void __init xen_pv_smp_prepare_boot_cpu(void)
 		 * sure the old memory can be recycled. */
 		make_lowmem_page_readwrite(xen_initial_gdt);
 
-#ifdef CONFIG_X86_32
-	/*
-	 * Xen starts us with XEN_FLAT_RING1_DS, but linux code
-	 * expects __USER_DS
-	 */
-	loadsegment(ds, __USER_DS);
-	loadsegment(es, __USER_DS);
-#endif
-
 	xen_filter_cpu_maps();
 	xen_setup_vcpu_info_placement();
 
@@ -301,10 +292,6 @@ cpu_initialize_context(unsigned int cpu, struct task_struct *idle)
 
 	gdt = get_cpu_gdt_rw(cpu);
 
-#ifdef CONFIG_X86_32
-	ctxt->user_regs.fs = __KERNEL_PERCPU;
-	ctxt->user_regs.gs = __KERNEL_STACK_CANARY;
-#endif
 	memset(&ctxt->fpu_ctxt, 0, sizeof(ctxt->fpu_ctxt));
 
 	/*
@@ -342,12 +329,7 @@ cpu_initialize_context(unsigned int cpu, struct task_struct *idle)
 	ctxt->kernel_ss = __KERNEL_DS;
 	ctxt->kernel_sp = task_top_of_stack(idle);
 
-#ifdef CONFIG_X86_32
-	ctxt->event_callback_cs     = __KERNEL_CS;
-	ctxt->failsafe_callback_cs  = __KERNEL_CS;
-#else
 	ctxt->gs_base_kernel = per_cpu_offset(cpu);
-#endif
 	ctxt->event_callback_eip    =
 		(unsigned long)xen_asm_exc_xen_hypervisor_callback;
 	ctxt->failsafe_callback_eip =
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 508fe204520b..aaac3ff313a9 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -6,12 +6,19 @@
  * operations here; the indirect forms are better handled in C.
  */
 
+#include <asm/errno.h>
 #include <asm/asm-offsets.h>
 #include <asm/percpu.h>
 #include <asm/processor-flags.h>
+#include <asm/segment.h>
+#include <asm/thread_info.h>
+#include <asm/asm.h>
 #include <asm/frame.h>
 #include <asm/asm.h>
 
+#include <xen/interface/xen.h>
+
+#include <linux/init.h>
 #include <linux/linkage.h>
 
 /*
@@ -76,11 +83,7 @@ SYM_FUNC_END(xen_save_fl_direct)
  */
 SYM_FUNC_START(xen_restore_fl_direct)
 	FRAME_BEGIN
-#ifdef CONFIG_X86_64
 	testw $X86_EFLAGS_IF, %di
-#else
-	testb $X86_EFLAGS_IF>>8, %ah
-#endif
 	setz PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
 	/*
 	 * Preempt here doesn't matter because that will deal with any
@@ -104,15 +107,6 @@ SYM_FUNC_END(xen_restore_fl_direct)
  */
 SYM_FUNC_START(check_events)
 	FRAME_BEGIN
-#ifdef CONFIG_X86_32
-	push %eax
-	push %ecx
-	push %edx
-	call xen_force_evtchn_callback
-	pop %edx
-	pop %ecx
-	pop %eax
-#else
 	push %rax
 	push %rcx
 	push %rdx
@@ -132,7 +126,6 @@ SYM_FUNC_START(check_events)
 	pop %rdx
 	pop %rcx
 	pop %rax
-#endif
 	FRAME_END
 	ret
 SYM_FUNC_END(check_events)
@@ -151,3 +144,164 @@ SYM_FUNC_START(xen_read_cr2_direct)
 	FRAME_END
 	ret
 SYM_FUNC_END(xen_read_cr2_direct);
+
+.macro xen_pv_trap name
+SYM_CODE_START(xen_\name)
+	pop %rcx
+	pop %r11
+	jmp  \name
+SYM_CODE_END(xen_\name)
+_ASM_NOKPROBE(xen_\name)
+.endm
+
+xen_pv_trap asm_exc_divide_error
+xen_pv_trap asm_exc_debug
+xen_pv_trap asm_exc_xendebug
+xen_pv_trap asm_exc_int3
+xen_pv_trap asm_exc_xennmi
+xen_pv_trap asm_exc_overflow
+xen_pv_trap asm_exc_bounds
+xen_pv_trap asm_exc_invalid_op
+xen_pv_trap asm_exc_device_not_available
+xen_pv_trap asm_exc_double_fault
+xen_pv_trap asm_exc_coproc_segment_overrun
+xen_pv_trap asm_exc_invalid_tss
+xen_pv_trap asm_exc_segment_not_present
+xen_pv_trap asm_exc_stack_segment
+xen_pv_trap asm_exc_general_protection
+xen_pv_trap asm_exc_page_fault
+xen_pv_trap asm_exc_spurious_interrupt_bug
+xen_pv_trap asm_exc_coprocessor_error
+xen_pv_trap asm_exc_alignment_check
+#ifdef CONFIG_X86_MCE
+xen_pv_trap asm_exc_machine_check
+#endif /* CONFIG_X86_MCE */
+xen_pv_trap asm_exc_simd_coprocessor_error
+#ifdef CONFIG_IA32_EMULATION
+xen_pv_trap entry_INT80_compat
+#endif
+xen_pv_trap asm_exc_xen_hypervisor_callback
+
+	__INIT
+SYM_CODE_START(xen_early_idt_handler_array)
+	i = 0
+	.rept NUM_EXCEPTION_VECTORS
+	pop %rcx
+	pop %r11
+	jmp early_idt_handler_array + i*EARLY_IDT_HANDLER_SIZE
+	i = i + 1
+	.fill xen_early_idt_handler_array + i*XEN_EARLY_IDT_HANDLER_SIZE - ., 1, 0xcc
+	.endr
+SYM_CODE_END(xen_early_idt_handler_array)
+	__FINIT
+
+hypercall_iret = hypercall_page + __HYPERVISOR_iret * 32
+/*
+ * Xen64 iret frame:
+ *
+ *	ss
+ *	rsp
+ *	rflags
+ *	cs
+ *	rip		<-- standard iret frame
+ *
+ *	flags
+ *
+ *	rcx		}
+ *	r11		}<-- pushed by hypercall page
+ * rsp->rax		}
+ */
+SYM_CODE_START(xen_iret)
+	pushq $0
+	jmp hypercall_iret
+SYM_CODE_END(xen_iret)
+
+SYM_CODE_START(xen_sysret64)
+	/*
+	 * We're already on the usermode stack at this point, but
+	 * still with the kernel gs, so we can easily switch back.
+	 *
+	 * tss.sp2 is scratch space.
+	 */
+	movq %rsp, PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
+	movq PER_CPU_VAR(cpu_current_top_of_stack), %rsp
+
+	pushq $__USER_DS
+	pushq PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
+	pushq %r11
+	pushq $__USER_CS
+	pushq %rcx
+
+	pushq $VGCF_in_syscall
+	jmp hypercall_iret
+SYM_CODE_END(xen_sysret64)
+
+/*
+ * Xen handles syscall callbacks much like ordinary exceptions, which
+ * means we have:
+ * - kernel gs
+ * - kernel rsp
+ * - an iret-like stack frame on the stack (including rcx and r11):
+ *	ss
+ *	rsp
+ *	rflags
+ *	cs
+ *	rip
+ *	r11
+ * rsp->rcx
+ */
+
+/* Normal 64-bit system call target */
+SYM_FUNC_START(xen_syscall_target)
+	popq %rcx
+	popq %r11
+
+	/*
+	 * Neither Xen nor the kernel really knows what the old SS and
+	 * CS were.  The kernel expects __USER_DS and __USER_CS, so
+	 * report those values even though Xen will guess its own values.
+	 */
+	movq $__USER_DS, 4*8(%rsp)
+	movq $__USER_CS, 1*8(%rsp)
+
+	jmp entry_SYSCALL_64_after_hwframe
+SYM_FUNC_END(xen_syscall_target)
+
+#ifdef CONFIG_IA32_EMULATION
+
+/* 32-bit compat syscall target */
+SYM_FUNC_START(xen_syscall32_target)
+	popq %rcx
+	popq %r11
+
+	/*
+	 * Neither Xen nor the kernel really knows what the old SS and
+	 * CS were.  The kernel expects __USER32_DS and __USER32_CS, so
+	 * report those values even though Xen will guess its own values.
+	 */
+	movq $__USER32_DS, 4*8(%rsp)
+	movq $__USER32_CS, 1*8(%rsp)
+
+	jmp entry_SYSCALL_compat_after_hwframe
+SYM_FUNC_END(xen_syscall32_target)
+
+/* 32-bit compat sysenter target */
+SYM_FUNC_START(xen_sysenter_target)
+	mov 0*8(%rsp), %rcx
+	mov 1*8(%rsp), %r11
+	mov 5*8(%rsp), %rsp
+	jmp entry_SYSENTER_compat
+SYM_FUNC_END(xen_sysenter_target)
+
+#else /* !CONFIG_IA32_EMULATION */
+
+SYM_FUNC_START_ALIAS(xen_syscall32_target)
+SYM_FUNC_START(xen_sysenter_target)
+	lea 16(%rsp), %rsp	/* strip %rcx, %r11 */
+	mov $-ENOSYS, %rax
+	pushq $0
+	jmp hypercall_iret
+SYM_FUNC_END(xen_sysenter_target)
+SYM_FUNC_END_ALIAS(xen_syscall32_target)
+
+#endif	/* CONFIG_IA32_EMULATION */
diff --git a/arch/x86/xen/xen-asm_32.S b/arch/x86/xen/xen-asm_32.S
deleted file mode 100644
index 4757cec33abe..000000000000
--- a/arch/x86/xen/xen-asm_32.S
+++ /dev/null
@@ -1,185 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Asm versions of Xen pv-ops, suitable for direct use.
- *
- * We only bother with direct forms (ie, vcpu in pda) of the
- * operations here; the indirect forms are better handled in C.
- */
-
-#include <asm/thread_info.h>
-#include <asm/processor-flags.h>
-#include <asm/segment.h>
-#include <asm/asm.h>
-
-#include <xen/interface/xen.h>
-
-#include <linux/linkage.h>
-
-/* Pseudo-flag used for virtual NMI, which we don't implement yet */
-#define XEN_EFLAGS_NMI  0x80000000
-
-/*
- * This is run where a normal iret would be run, with the same stack setup:
- *	8: eflags
- *	4: cs
- *	esp-> 0: eip
- *
- * This attempts to make sure that any pending events are dealt with
- * on return to usermode, but there is a small window in which an
- * event can happen just before entering usermode.  If the nested
- * interrupt ends up setting one of the TIF_WORK_MASK pending work
- * flags, they will not be tested again before returning to
- * usermode. This means that a process can end up with pending work,
- * which will be unprocessed until the process enters and leaves the
- * kernel again, which could be an unbounded amount of time.  This
- * means that a pending signal or reschedule event could be
- * indefinitely delayed.
- *
- * The fix is to notice a nested interrupt in the critical window, and
- * if one occurs, then fold the nested interrupt into the current
- * interrupt stack frame, and re-process it iteratively rather than
- * recursively.  This means that it will exit via the normal path, and
- * all pending work will be dealt with appropriately.
- *
- * Because the nested interrupt handler needs to deal with the current
- * stack state in whatever form its in, we keep things simple by only
- * using a single register which is pushed/popped on the stack.
- */
-
-.macro POP_FS
-1:
-	popw %fs
-.pushsection .fixup, "ax"
-2:	movw $0, (%esp)
-	jmp 1b
-.popsection
-	_ASM_EXTABLE(1b,2b)
-.endm
-
-SYM_CODE_START(xen_iret)
-	/* test eflags for special cases */
-	testl $(X86_EFLAGS_VM | XEN_EFLAGS_NMI), 8(%esp)
-	jnz hyper_iret
-
-	push %eax
-	ESP_OFFSET=4	# bytes pushed onto stack
-
-	/* Store vcpu_info pointer for easy access */
-#ifdef CONFIG_SMP
-	pushw %fs
-	movl $(__KERNEL_PERCPU), %eax
-	movl %eax, %fs
-	movl %fs:xen_vcpu, %eax
-	POP_FS
-#else
-	movl %ss:xen_vcpu, %eax
-#endif
-
-	/* check IF state we're restoring */
-	testb $X86_EFLAGS_IF>>8, 8+1+ESP_OFFSET(%esp)
-
-	/*
-	 * Maybe enable events.  Once this happens we could get a
-	 * recursive event, so the critical region starts immediately
-	 * afterwards.  However, if that happens we don't end up
-	 * resuming the code, so we don't have to be worried about
-	 * being preempted to another CPU.
-	 */
-	setz %ss:XEN_vcpu_info_mask(%eax)
-xen_iret_start_crit:
-
-	/* check for unmasked and pending */
-	cmpw $0x0001, %ss:XEN_vcpu_info_pending(%eax)
-
-	/*
-	 * If there's something pending, mask events again so we can
-	 * jump back into exc_xen_hypervisor_callback. Otherwise do not
-	 * touch XEN_vcpu_info_mask.
-	 */
-	jne 1f
-	movb $1, %ss:XEN_vcpu_info_mask(%eax)
-
-1:	popl %eax
-
-	/*
-	 * From this point on the registers are restored and the stack
-	 * updated, so we don't need to worry about it if we're
-	 * preempted
-	 */
-iret_restore_end:
-
-	/*
-	 * Jump to hypervisor_callback after fixing up the stack.
-	 * Events are masked, so jumping out of the critical region is
-	 * OK.
-	 */
-	je xen_asm_exc_xen_hypervisor_callback
-
-1:	iret
-xen_iret_end_crit:
-	_ASM_EXTABLE(1b, asm_iret_error)
-
-hyper_iret:
-	/* put this out of line since its very rarely used */
-	jmp hypercall_page + __HYPERVISOR_iret * 32
-SYM_CODE_END(xen_iret)
-
-	.globl xen_iret_start_crit, xen_iret_end_crit
-
-/*
- * This is called by xen_asm_exc_xen_hypervisor_callback in entry_32.S when it sees
- * that the EIP at the time of interrupt was between
- * xen_iret_start_crit and xen_iret_end_crit.
- *
- * The stack format at this point is:
- *	----------------
- *	 ss		: (ss/esp may be present if we came from usermode)
- *	 esp		:
- *	 eflags		}  outer exception info
- *	 cs		}
- *	 eip		}
- *	----------------
- *	 eax		:  outer eax if it hasn't been restored
- *	----------------
- *	 eflags		}
- *	 cs		}  nested exception info
- *	 eip		}
- *	 return address	: (into xen_asm_exc_xen_hypervisor_callback)
- *
- * In order to deliver the nested exception properly, we need to discard the
- * nested exception frame such that when we handle the exception, we do it
- * in the context of the outer exception rather than starting a new one.
- *
- * The only caveat is that if the outer eax hasn't been restored yet (i.e.
- * it's still on stack), we need to restore its value here.
-*/
-.pushsection .noinstr.text, "ax"
-SYM_CODE_START(xen_iret_crit_fixup)
-	/*
-	 * Paranoia: Make sure we're really coming from kernel space.
-	 * One could imagine a case where userspace jumps into the
-	 * critical range address, but just before the CPU delivers a
-	 * PF, it decides to deliver an interrupt instead.  Unlikely?
-	 * Definitely.  Easy to avoid?  Yes.
-	 */
-	testb $2, 2*4(%esp)		/* nested CS */
-	jnz 2f
-
-	/*
-	 * If eip is before iret_restore_end then stack
-	 * hasn't been restored yet.
-	 */
-	cmpl $iret_restore_end, 1*4(%esp)
-	jae 1f
-
-	movl 4*4(%esp), %eax		/* load outer EAX */
-	ret $4*4			/* discard nested EIP, CS, and EFLAGS as
-					 * well as the just restored EAX */
-
-1:
-	ret $3*4			/* discard nested EIP, CS, and EFLAGS */
-
-2:
-	ret
-SYM_CODE_END(xen_iret_crit_fixup)
-.popsection
diff --git a/arch/x86/xen/xen-asm_64.S b/arch/x86/xen/xen-asm_64.S
deleted file mode 100644
index 5d252aaeade8..000000000000
--- a/arch/x86/xen/xen-asm_64.S
+++ /dev/null
@@ -1,181 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Asm versions of Xen pv-ops, suitable for direct use.
- *
- * We only bother with direct forms (ie, vcpu in pda) of the
- * operations here; the indirect forms are better handled in C.
- */
-
-#include <asm/errno.h>
-#include <asm/percpu.h>
-#include <asm/processor-flags.h>
-#include <asm/segment.h>
-#include <asm/asm-offsets.h>
-#include <asm/thread_info.h>
-#include <asm/asm.h>
-
-#include <xen/interface/xen.h>
-
-#include <linux/init.h>
-#include <linux/linkage.h>
-
-.macro xen_pv_trap name
-SYM_CODE_START(xen_\name)
-	pop %rcx
-	pop %r11
-	jmp  \name
-SYM_CODE_END(xen_\name)
-_ASM_NOKPROBE(xen_\name)
-.endm
-
-xen_pv_trap asm_exc_divide_error
-xen_pv_trap asm_exc_debug
-xen_pv_trap asm_exc_xendebug
-xen_pv_trap asm_exc_int3
-xen_pv_trap asm_exc_xennmi
-xen_pv_trap asm_exc_overflow
-xen_pv_trap asm_exc_bounds
-xen_pv_trap asm_exc_invalid_op
-xen_pv_trap asm_exc_device_not_available
-xen_pv_trap asm_exc_double_fault
-xen_pv_trap asm_exc_coproc_segment_overrun
-xen_pv_trap asm_exc_invalid_tss
-xen_pv_trap asm_exc_segment_not_present
-xen_pv_trap asm_exc_stack_segment
-xen_pv_trap asm_exc_general_protection
-xen_pv_trap asm_exc_page_fault
-xen_pv_trap asm_exc_spurious_interrupt_bug
-xen_pv_trap asm_exc_coprocessor_error
-xen_pv_trap asm_exc_alignment_check
-#ifdef CONFIG_X86_MCE
-xen_pv_trap asm_exc_machine_check
-#endif /* CONFIG_X86_MCE */
-xen_pv_trap asm_exc_simd_coprocessor_error
-#ifdef CONFIG_IA32_EMULATION
-xen_pv_trap entry_INT80_compat
-#endif
-xen_pv_trap asm_exc_xen_hypervisor_callback
-
-	__INIT
-SYM_CODE_START(xen_early_idt_handler_array)
-	i = 0
-	.rept NUM_EXCEPTION_VECTORS
-	pop %rcx
-	pop %r11
-	jmp early_idt_handler_array + i*EARLY_IDT_HANDLER_SIZE
-	i = i + 1
-	.fill xen_early_idt_handler_array + i*XEN_EARLY_IDT_HANDLER_SIZE - ., 1, 0xcc
-	.endr
-SYM_CODE_END(xen_early_idt_handler_array)
-	__FINIT
-
-hypercall_iret = hypercall_page + __HYPERVISOR_iret * 32
-/*
- * Xen64 iret frame:
- *
- *	ss
- *	rsp
- *	rflags
- *	cs
- *	rip		<-- standard iret frame
- *
- *	flags
- *
- *	rcx		}
- *	r11		}<-- pushed by hypercall page
- * rsp->rax		}
- */
-SYM_CODE_START(xen_iret)
-	pushq $0
-	jmp hypercall_iret
-SYM_CODE_END(xen_iret)
-
-SYM_CODE_START(xen_sysret64)
-	/*
-	 * We're already on the usermode stack at this point, but
-	 * still with the kernel gs, so we can easily switch back.
-	 *
-	 * tss.sp2 is scratch space.
-	 */
-	movq %rsp, PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
-	movq PER_CPU_VAR(cpu_current_top_of_stack), %rsp
-
-	pushq $__USER_DS
-	pushq PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
-	pushq %r11
-	pushq $__USER_CS
-	pushq %rcx
-
-	pushq $VGCF_in_syscall
-	jmp hypercall_iret
-SYM_CODE_END(xen_sysret64)
-
-/*
- * Xen handles syscall callbacks much like ordinary exceptions, which
- * means we have:
- * - kernel gs
- * - kernel rsp
- * - an iret-like stack frame on the stack (including rcx and r11):
- *	ss
- *	rsp
- *	rflags
- *	cs
- *	rip
- *	r11
- * rsp->rcx
- */
-
-/* Normal 64-bit system call target */
-SYM_FUNC_START(xen_syscall_target)
-	popq %rcx
-	popq %r11
-
-	/*
-	 * Neither Xen nor the kernel really knows what the old SS and
-	 * CS were.  The kernel expects __USER_DS and __USER_CS, so
-	 * report those values even though Xen will guess its own values.
-	 */
-	movq $__USER_DS, 4*8(%rsp)
-	movq $__USER_CS, 1*8(%rsp)
-
-	jmp entry_SYSCALL_64_after_hwframe
-SYM_FUNC_END(xen_syscall_target)
-
-#ifdef CONFIG_IA32_EMULATION
-
-/* 32-bit compat syscall target */
-SYM_FUNC_START(xen_syscall32_target)
-	popq %rcx
-	popq %r11
-
-	/*
-	 * Neither Xen nor the kernel really knows what the old SS and
-	 * CS were.  The kernel expects __USER32_DS and __USER32_CS, so
-	 * report those values even though Xen will guess its own values.
-	 */
-	movq $__USER32_DS, 4*8(%rsp)
-	movq $__USER32_CS, 1*8(%rsp)
-
-	jmp entry_SYSCALL_compat_after_hwframe
-SYM_FUNC_END(xen_syscall32_target)
-
-/* 32-bit compat sysenter target */
-SYM_FUNC_START(xen_sysenter_target)
-	mov 0*8(%rsp), %rcx
-	mov 1*8(%rsp), %r11
-	mov 5*8(%rsp), %rsp
-	jmp entry_SYSENTER_compat
-SYM_FUNC_END(xen_sysenter_target)
-
-#else /* !CONFIG_IA32_EMULATION */
-
-SYM_FUNC_START_ALIAS(xen_syscall32_target)
-SYM_FUNC_START(xen_sysenter_target)
-	lea 16(%rsp), %rsp	/* strip %rcx, %r11 */
-	mov $-ENOSYS, %rax
-	pushq $0
-	jmp hypercall_iret
-SYM_FUNC_END(xen_sysenter_target)
-SYM_FUNC_END_ALIAS(xen_syscall32_target)
-
-#endif	/* CONFIG_IA32_EMULATION */
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 1ba601df3a37..2d7c8f34f56c 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -35,13 +35,8 @@ SYM_CODE_START(startup_xen)
 	rep __ASM_SIZE(stos)
 
 	mov %_ASM_SI, xen_start_info
-#ifdef CONFIG_X86_64
 	mov initial_stack(%rip), %rsp
-#else
-	mov initial_stack, %esp
-#endif
 
-#ifdef CONFIG_X86_64
 	/* Set up %gs.
 	 *
 	 * The base of %gs always points to fixed_percpu_data.  If the
@@ -53,7 +48,6 @@ SYM_CODE_START(startup_xen)
 	movq	$INIT_PER_CPU_VAR(fixed_percpu_data),%rax
 	cdq
 	wrmsr
-#endif
 
 	call xen_start_kernel
 SYM_CODE_END(startup_xen)
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 727f11eb46b2..46e7fd099904 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -52,9 +52,7 @@ config XEN_BALLOON_MEMORY_HOTPLUG
 
 config XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
 	int "Hotplugged memory limit (in GiB) for a PV guest"
-	default 512 if X86_64
-	default 4 if X86_32
-	range 0 64 if X86_32
+	default 512
 	depends on XEN_HAVE_PVMMU
 	depends on XEN_BALLOON_MEMORY_HOTPLUG
 	help
-- 
2.26.2


