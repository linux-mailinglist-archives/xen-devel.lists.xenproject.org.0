Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B617010D7
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533977.831162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa95-0001z0-2D; Fri, 12 May 2023 21:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533977.831162; Fri, 12 May 2023 21:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa94-0001w1-TR; Fri, 12 May 2023 21:17:46 +0000
Received: by outflank-mailman (input) for mailman id 533977;
 Fri, 12 May 2023 21:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZzZ-0004FP-Uk
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:57 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d3fdfc-f109-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:55 +0200 (CEST)
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
X-Inumbo-ID: 10d3fdfc-f109-11ed-b229-6b7b168915f2
Message-ID: <20230512205257.411554373@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HkbpL+B1Y6r1JdpJDFTNU1fkEbASEBEddrD3eS3vI9k=;
	b=qLhT9a5D6K6oU7T99IYHlQkEvakwR6lIzOFnJv/yHhn0sXuNpKkFhbOEKcvGXbBBQxIQWP
	Zf3GuVmh5j6E3zElkNNJjQKqASeg/zWDd8fBpcu5LZISPQ7gZXK+2XzuY0b7uXFSzVdssS
	ubfYflaKL2WZjOF6uBlRON47j5VgCv6b0jI7mNVtPxb1SGRa/FMQcvzdBiYEyvlbYIQ8tv
	16yQasf7F+i15KtF6TRUm+d4L8HwozBtts+ZN7Ind33VzLLSvWtDvzzBY1m5FdkgHeB5+5
	8FI3U3zhrRrAgsdFhRlZ5sy7Xx+ZEuxItTCmvBR1r6Ei6I0X7x5XCS9e2r5S2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HkbpL+B1Y6r1JdpJDFTNU1fkEbASEBEddrD3eS3vI9k=;
	b=3w7vG4iZWK+8aTvHpH0DZweTvPHFb4xkzDRr36AwYtst0DBORILo5kXlVqsA7w+2XpnmoK
	IzhkrrZIhSP2ASDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject:
 [patch V4 36/37] x86/smpboot: Support parallel startup of secondary CPUs
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:55 +0200 (CEST)

From: David Woodhouse <dwmw@amazon.co.uk>

In parallel startup mode the APs are kicked alive by the control CPU
quickly after each other and run through the early startup code in
parallel. The real-mode startup code is already serialized with a
bit-spinlock to protect the real-mode stack.

In parallel startup mode the smpboot_control variable obviously cannot
contain the Linux CPU number so the APs have to determine their Linux CPU
number on their own. This is required to find the CPUs per CPU offset in
order to find the idle task stack and other per CPU data.

To achieve this, export the cpuid_to_apicid[] array so that each AP can
find its own CPU number by searching therein based on its APIC ID.

Introduce a flag in the top bits of smpboot_control which indicates that
the AP should find its CPU number by reading the APIC ID from the APIC.

This is required because CPUID based APIC ID retrieval can only provide the
initial APIC ID, which might have been overruled by the firmware. Some AMD
APUs come up with APIC ID = initial APIC ID + 0x10, so the APIC ID to CPU
number lookup would fail miserably if based on CPUID. Also virtualization
can make its own APIC ID assignements. The only requirement is that the
APIC IDs are consistent with the APCI/MADT table.

For the boot CPU or in case parallel bringup is disabled the control bits
are empty and the CPU number is directly available in bit 0-23 of
smpboot_control.

[ tglx: Initial proof of concept patch with bitlock and APIC ID lookup ]
[ dwmw2: Rework and testing, commit message, CPUID 0x1 and CPU0 support ]
[ seanc: Fix stray override of initial_gs in common_cpu_up() ]
[ Oleksandr Natalenko: reported suspend/resume issue fixed in
  x86_acpi_suspend_lowlevel ]
[ tglx: Make it read the APIC ID from the APIC instead of using CPUID,
  	split the bitlock part out ]

Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
Co-developed-by: Brian Gerst <brgerst@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Brian Gerst <brgerst@gmail.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
V4: Remove the lock prefix in the error path - Peter Z.
---
 arch/x86/include/asm/apic.h    |    2 +
 arch/x86/include/asm/apicdef.h |    5 ++-
 arch/x86/include/asm/smp.h     |    6 ++++
 arch/x86/kernel/acpi/sleep.c   |    9 +++++-
 arch/x86/kernel/apic/apic.c    |    2 -
 arch/x86/kernel/head_64.S      |   61 +++++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/smpboot.c      |    2 -
 7 files changed, 83 insertions(+), 4 deletions(-)
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -55,6 +55,8 @@ extern int local_apic_timer_c2_ok;
 extern int disable_apic;
 extern unsigned int lapic_timer_period;
 
+extern int cpuid_to_apicid[];
+
 extern enum apic_intr_mode_id apic_intr_mode;
 enum apic_intr_mode_id {
 	APIC_PIC,
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -138,7 +138,8 @@
 #define		APIC_EILVT_MASKED	(1 << 16)
 
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
-#define APIC_BASE_MSR	0x800
+#define APIC_BASE_MSR		0x800
+#define APIC_X2APIC_ID_MSR	0x802
 #define XAPIC_ENABLE	(1UL << 11)
 #define X2APIC_ENABLE	(1UL << 10)
 
@@ -162,6 +163,7 @@
 #define APIC_CPUID(apicid)	((apicid) & XAPIC_DEST_CPUS_MASK)
 #define NUM_APIC_CLUSTERS	((BAD_APICID + 1) >> XAPIC_DEST_CPUS_SHIFT)
 
+#ifndef __ASSEMBLY__
 /*
  * the local APIC register structure, memory mapped. Not terribly well
  * tested, but we might eventually use this one in the future - the
@@ -435,4 +437,5 @@ enum apic_delivery_modes {
 	APIC_DELIVERY_MODE_EXTINT	= 7,
 };
 
+#endif /* !__ASSEMBLY__ */
 #endif /* _ASM_X86_APICDEF_H */
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -200,4 +200,10 @@ extern unsigned long apic_mmio_base;
 
 #endif /* !__ASSEMBLY__ */
 
+/* Control bits for startup_64 */
+#define STARTUP_READ_APICID	0x80000000
+
+/* Top 8 bits are reserved for control */
+#define STARTUP_PARALLEL_MASK	0xFF000000
+
 #endif /* _ASM_X86_SMP_H */
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -16,6 +16,7 @@
 #include <asm/cacheflush.h>
 #include <asm/realmode.h>
 #include <asm/hypervisor.h>
+#include <asm/smp.h>
 
 #include <linux/ftrace.h>
 #include "../../realmode/rm/wakeup.h"
@@ -127,7 +128,13 @@ int x86_acpi_suspend_lowlevel(void)
 	 * value is in the actual %rsp register.
 	 */
 	current->thread.sp = (unsigned long)temp_stack + sizeof(temp_stack);
-	smpboot_control = smp_processor_id();
+	/*
+	 * Ensure the CPU knows which one it is when it comes back, if
+	 * it isn't in parallel mode and expected to work that out for
+	 * itself.
+	 */
+	if (!(smpboot_control & STARTUP_PARALLEL_MASK))
+		smpboot_control = smp_processor_id();
 #endif
 	initial_code = (unsigned long)wakeup_long64;
 	saved_magic = 0x123456789abcdef0L;
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2380,7 +2380,7 @@ static int nr_logical_cpuids = 1;
 /*
  * Used to store mapping between logical CPU IDs and APIC IDs.
  */
-static int cpuid_to_apicid[] = {
+int cpuid_to_apicid[] = {
 	[0 ... NR_CPUS - 1] = -1,
 };
 
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -24,7 +24,9 @@
 #include "../entry/calling.h"
 #include <asm/export.h>
 #include <asm/nospec-branch.h>
+#include <asm/apicdef.h>
 #include <asm/fixmap.h>
+#include <asm/smp.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -234,8 +236,67 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	ANNOTATE_NOENDBR // above
 
 #ifdef CONFIG_SMP
+	/*
+	 * For parallel boot, the APIC ID is read from the APIC, and then
+	 * used to look up the CPU number.  For booting a single CPU, the
+	 * CPU number is encoded in smpboot_control.
+	 *
+	 * Bit 31	STARTUP_READ_APICID (Read APICID from APIC)
+	 * Bit 0-23	CPU# if STARTUP_xx flags are not set
+	 */
 	movl	smpboot_control(%rip), %ecx
+	testl	$STARTUP_READ_APICID, %ecx
+	jnz	.Lread_apicid
+	/*
+	 * No control bit set, single CPU bringup. CPU number is provided
+	 * in bit 0-23. This is also the boot CPU case (CPU number 0).
+	 */
+	andl	$(~STARTUP_PARALLEL_MASK), %ecx
+	jmp	.Lsetup_cpu
+
+.Lread_apicid:
+	/* Check whether X2APIC mode is already enabled */
+	mov	$MSR_IA32_APICBASE, %ecx
+	rdmsr
+	testl	$X2APIC_ENABLE, %eax
+	jnz	.Lread_apicid_msr
+
+	/* Read the APIC ID from the fix-mapped MMIO space. */
+	movq	apic_mmio_base(%rip), %rcx
+	addq	$APIC_ID, %rcx
+	movl	(%rcx), %eax
+	shr	$24, %eax
+	jmp	.Llookup_AP
+
+.Lread_apicid_msr:
+	mov	$APIC_X2APIC_ID_MSR, %ecx
+	rdmsr
+
+.Llookup_AP:
+	/* EAX contains the APIC ID of the current CPU */
+	xorq	%rcx, %rcx
+	leaq	cpuid_to_apicid(%rip), %rbx
+
+.Lfind_cpunr:
+	cmpl	(%rbx,%rcx,4), %eax
+	jz	.Lsetup_cpu
+	inc	%ecx
+#ifdef CONFIG_FORCE_NR_CPUS
+	cmpl	$NR_CPUS, %ecx
+#else
+	cmpl	nr_cpu_ids(%rip), %ecx
+#endif
+	jb	.Lfind_cpunr
+
+	/*  APIC ID not found in the table. Drop the trampoline lock and bail. */
+	movq	trampoline_lock(%rip), %rax
+	movl	$0, (%rax)
+
+1:	cli
+	hlt
+	jmp	1b
 
+.Lsetup_cpu:
 	/* Get the per cpu offset for the given CPU# which is in ECX */
 	movq	__per_cpu_offset(,%rcx,8), %rdx
 #else
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -996,7 +996,7 @@ static int do_boot_cpu(int apicid, int c
 	if (IS_ENABLED(CONFIG_X86_32)) {
 		early_gdt_descr.address = (unsigned long)get_cpu_gdt_rw(cpu);
 		initial_stack  = idle->thread.sp;
-	} else {
+	} else if (!(smpboot_control & STARTUP_PARALLEL_MASK)) {
 		smpboot_control = cpu;
 	}
 


