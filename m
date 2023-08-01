Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6376AC02
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573867.899055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlJ7-0000zf-GX; Tue, 01 Aug 2023 09:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573867.899055; Tue, 01 Aug 2023 09:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlJ7-0000vx-CG; Tue, 01 Aug 2023 09:04:45 +0000
Received: by outflank-mailman (input) for mailman id 573867;
 Tue, 01 Aug 2023 09:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlJ5-0007Jn-Ul
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:04:44 +0000
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72f4c373-304a-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:04:42 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:04:42 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 02:04:40 -0700
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
X-Inumbo-ID: 72f4c373-304a-11ee-b259-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880682; x=1722416682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lojZodI3hwQLsEtOWQ3jf2ThLdccjOvBbgNRJld8Dhw=;
  b=R9DkPACzIdK4HypBghr3yD7fZVKf36Z+6lRzlEkTjMNEJsT5SJ5WWV3v
   av0ExNEU3gLF94PWbHIj6dfFw52Buap335AMHMTS8xHLGCZH+/99PcmMV
   hQkCia5fYmtq95o5PvMJ7+hvXut/jxgXofml/L9LEfVApKtt9K4e4dYjN
   nYAMs4lx2vPYcyHvlMoOQ6kUr8kv9RUvF3bLjW71ywfAuyM1dMNELkRso
   u3B+EqWqYtQtyw/ZJjXcOZr8ddnUbUKceCheU7fSRLc+fuOXihUDIKfVS
   SafVaMpIZvqZcm1Jnz7JrEgGmtaqAYwmUoicxBm7eVf7m7jE55sF1DV6G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366713751"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="366713751"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722420766"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="722420766"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kim Phillips <kim.phillips@amd.com>,
	Xin Li <xin3.li@intel.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@Oracle.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Jim Mattson <jmattson@google.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Brian Gerst <brgerst@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ze Gao <zegao2021@gmail.com>,
	Fei Li <fei1.li@intel.com>,
	Conghui <conghui.chen@intel.com>,
	Ashok Raj <ashok.raj@intel.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Jane Malalane <jane.malalane@citrix.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Yantengsi <siyanteng@loongson.cn>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [PATCH RESEND v9 35/36] x86/fred: FRED initialization code
Date: Tue,  1 Aug 2023 01:35:52 -0700
Message-Id: <20230801083553.8468-9-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083553.8468-1-xin3.li@intel.com>
References: <20230801083553.8468-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

The code to initialize FRED when it's available and _not_ disabled.

cpu_init_fred_exceptions() is the core function to initialize FRED,
which
  1. Sets up FRED entrypoints for events happening in ring 0 and 3.
  2. Sets up a default stack for event handling.
  3. Sets up dedicated event stacks for DB/NMI/MC/DF, equivalent to
     the IDT IST stacks.
  4. Forces 32-bit system calls to use "int $0x80" only.
  5. Enables FRED and invalidtes IDT.

When the FRED is used, cpu_init_exception_handling() initializes FRED
through calling cpu_init_fred_exceptions(), otherwise it sets up TSS
IST and loads IDT.

As FRED uses the ring 3 FRED entrypoint for SYSCALL and SYSENTER,
it skips setting up SYSCALL/SYSENTER related MSRs, e.g., MSR_LSTAR.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Co-developed-by: Xin Li <xin3.li@intel.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Move this patch after all required changes are in place (Thomas
  Gleixner).

Changes since v5:
* Add a comment for FRED stack level settings (Lai Jiangshan).
* Define #DB/NMI/#MC/#DF stack levels using macros.
---
 arch/x86/include/asm/fred.h  | 28 ++++++++++++++++
 arch/x86/include/asm/traps.h |  4 ++-
 arch/x86/kernel/Makefile     |  1 +
 arch/x86/kernel/cpu/common.c | 28 +++++++++++++---
 arch/x86/kernel/fred.c       | 64 ++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/irqinit.c    |  7 +++-
 arch/x86/kernel/traps.c      | 11 ++++++-
 7 files changed, 135 insertions(+), 8 deletions(-)
 create mode 100644 arch/x86/kernel/fred.c

diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index 3c91f0eae62e..6031138b778c 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -68,6 +68,19 @@
 #define FRED_SSX_64_BIT_MODE_BIT	57
 #define FRED_SSX_64_BIT_MODE		_BITUL(FRED_SSX_64_BIT_MODE_BIT)
 
+/* #DB in the kernel would imply the use of a kernel debugger. */
+#define FRED_DB_STACK_LEVEL		1
+#define FRED_NMI_STACK_LEVEL		2
+#define FRED_MC_STACK_LEVEL		2
+/*
+ * #DF is the highest level because a #DF means "something went wrong
+ * *while delivering an exception*." The number of cases for which that
+ * can happen with FRED is drastically reduced and basically amounts to
+ * "the stack you pointed me to is broken." Thus, always change stacks
+ * on #DF, which means it should be at the highest level.
+ */
+#define FRED_DF_STACK_LEVEL		3
+
 /*
  * FRED event delivery establishes a full supervisor context by
  * saving the essential information about an event to a FRED
@@ -122,8 +135,23 @@ DECLARE_FRED_HANDLER(fred_exc_double_fault);
 extern asmlinkage __visible void fred_entrypoint_user(void);
 extern asmlinkage __visible void fred_entrypoint_kernel(void);
 
+void cpu_init_fred_exceptions(void);
+void fred_setup_apic(void);
+
 #endif /* __ASSEMBLY__ */
 
+#else
+#ifndef __ASSEMBLY__
+static inline void cpu_init_fred_exceptions(void)
+{
+	BUG();
+}
+
+static inline void fred_setup_apic(void)
+{
+	BUG();
+}
+#endif
 #endif /* CONFIG_X86_FRED */
 
 #endif /* ASM_X86_FRED_H */
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 48daa78ee88c..da7e8ab1d66d 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -49,6 +49,7 @@ void __noreturn handle_stack_overflow(struct pt_regs *regs,
 
 #ifdef CONFIG_X86_64
 inline void set_sysvec_handler(unsigned int i, system_interrupt_handler func);
+bool is_sysvec_used(unsigned int i);
 
 static inline void sysvec_setup_fred(unsigned int vector, system_interrupt_handler func)
 {
@@ -63,7 +64,8 @@ static inline void sysvec_setup_fred(unsigned int vector, system_interrupt_handl
 
 #define sysvec_install(vector, func) {					\
 	sysvec_setup_fred(vector, func);				\
-	alloc_intr_gate(vector, asm_##func);				\
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))			\
+		alloc_intr_gate(vector, asm_##func);			\
 }
 
 int external_interrupt(struct pt_regs *regs);
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 4070a01c11b7..46d8daa11c17 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -48,6 +48,7 @@ obj-y			+= platform-quirks.o
 obj-y			+= process_$(BITS).o signal.o signal_$(BITS).o
 obj-y			+= traps.o idt.o irq.o irq_$(BITS).o dumpstack_$(BITS).o
 obj-y			+= time.o ioport.o dumpstack.o nmi.o
+obj-$(CONFIG_X86_FRED)	+= fred.o
 obj-$(CONFIG_MODIFY_LDT_SYSCALL)	+= ldt.o
 obj-y			+= setup.o x86_init.o i8259.o irqinit.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index bb03dacc5fb8..b34a8a138755 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -62,6 +62,7 @@
 #include <asm/microcode_intel.h>
 #include <asm/intel-family.h>
 #include <asm/cpu_device_id.h>
+#include <asm/fred.h>
 #include <asm/uv/uv.h>
 #include <asm/set_memory.h>
 #include <asm/traps.h>
@@ -2062,13 +2063,24 @@ static inline void idt_syscall_init(void)
 	       X86_EFLAGS_AC|X86_EFLAGS_ID);
 }
 
+static inline void fred_syscall_init(void)
+{
+	/* Both sysexit and sysret cause #UD when FRED is enabled */
+	wrmsrl_safe(MSR_IA32_SYSENTER_CS, (u64)GDT_ENTRY_INVALID_SEG);
+	wrmsrl_safe(MSR_IA32_SYSENTER_ESP, 0ULL);
+	wrmsrl_safe(MSR_IA32_SYSENTER_EIP, 0ULL);
+}
+
 /* May not be marked __init: used by software suspend */
 void syscall_init(void)
 {
 	/* The default user and kernel segments */
 	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
 
-	idt_syscall_init();
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		fred_syscall_init();
+	else
+		idt_syscall_init();
 }
 
 #else	/* CONFIG_X86_64 */
@@ -2184,8 +2196,6 @@ void cpu_init_exception_handling(void)
 	/* paranoid_entry() gets the CPU number from the GDT */
 	setup_getcpu(cpu);
 
-	/* IST vectors need TSS to be set up. */
-	tss_setup_ist(tss);
 	tss_setup_io_bitmap(tss);
 	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
 
@@ -2194,8 +2204,16 @@ void cpu_init_exception_handling(void)
 	/* GHCB needs to be setup to handle #VC. */
 	setup_ghcb();
 
-	/* Finally load the IDT */
-	load_current_idt();
+	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
+		/* Set up FRED exception handling */
+		cpu_init_fred_exceptions();
+	} else {
+		/* IST vectors need TSS to be set up. */
+		tss_setup_ist(tss);
+
+		/* Finally load the IDT */
+		load_current_idt();
+	}
 }
 
 /*
diff --git a/arch/x86/kernel/fred.c b/arch/x86/kernel/fred.c
new file mode 100644
index 000000000000..7fdf79c964a8
--- /dev/null
+++ b/arch/x86/kernel/fred.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/kernel.h>
+
+#include <asm/desc.h>
+#include <asm/fred.h>
+#include <asm/tlbflush.h>
+#include <asm/traps.h>
+
+void cpu_init_fred_exceptions(void)
+{
+	wrmsrl(MSR_IA32_FRED_CONFIG,
+	       /* Reserve for CALL emulation */
+	       FRED_CONFIG_REDZONE |
+	       FRED_CONFIG_INT_STKLVL(0) |
+	       FRED_CONFIG_ENTRYPOINT(fred_entrypoint_user));
+
+	/*
+	 * The purpose of separate stacks for NMI, #DB and #MC *in the kernel*
+	 * (remember that user space faults are always taken on stack level 0)
+	 * is to avoid overflowing the kernel stack.
+	 */
+	wrmsrl(MSR_IA32_FRED_STKLVLS,
+	       FRED_STKLVL(X86_TRAP_DB,  FRED_DB_STACK_LEVEL) |
+	       FRED_STKLVL(X86_TRAP_NMI, FRED_NMI_STACK_LEVEL) |
+	       FRED_STKLVL(X86_TRAP_MC,  FRED_MC_STACK_LEVEL) |
+	       FRED_STKLVL(X86_TRAP_DF,  FRED_DF_STACK_LEVEL));
+
+	/* The FRED equivalents to IST stacks... */
+	wrmsrl(MSR_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
+	wrmsrl(MSR_IA32_FRED_RSP2, __this_cpu_ist_top_va(NMI));
+	wrmsrl(MSR_IA32_FRED_RSP3, __this_cpu_ist_top_va(DF));
+
+	/* Not used with FRED */
+	wrmsrl(MSR_LSTAR, 0ULL);
+	wrmsrl(MSR_CSTAR, 0ULL);
+	wrmsrl_safe(MSR_IA32_SYSENTER_CS,  (u64)GDT_ENTRY_INVALID_SEG);
+	wrmsrl_safe(MSR_IA32_SYSENTER_ESP, 0ULL);
+	wrmsrl_safe(MSR_IA32_SYSENTER_EIP, 0ULL);
+
+	/* Enable FRED */
+	cr4_set_bits(X86_CR4_FRED);
+	/* Any further IDT use is a bug */
+	idt_invalidate();
+
+	/* Use int $0x80 for 32-bit system calls in FRED mode */
+	setup_clear_cpu_cap(X86_FEATURE_SYSENTER32);
+	setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
+}
+
+/*
+ * Initialize system vectors from a FRED perspective, so
+ * lapic_assign_system_vectors() can do its job.
+ */
+void __init fred_setup_apic(void)
+{
+	int i;
+
+	for (i = 0; i < FIRST_EXTERNAL_VECTOR; i++)
+		set_bit(i, system_vectors);
+
+	for (i = 0; i < NR_SYSTEM_VECTORS; i++)
+		if (is_sysvec_used(i))
+			set_bit(i + FIRST_SYSTEM_VECTOR, system_vectors);
+}
diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
index c683666876f1..2a510f72dd11 100644
--- a/arch/x86/kernel/irqinit.c
+++ b/arch/x86/kernel/irqinit.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/i8259.h>
 #include <asm/traps.h>
+#include <asm/fred.h>
 #include <asm/prom.h>
 
 /*
@@ -96,7 +97,11 @@ void __init native_init_IRQ(void)
 	/* Execute any quirks before the call gates are initialised: */
 	x86_init.irqs.pre_vector_init();
 
-	idt_setup_apic_and_irq_gates();
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		fred_setup_apic();
+	else
+		idt_setup_apic_and_irq_gates();
+
 	lapic_assign_system_vectors();
 
 	if (!acpi_ioapic && !of_ioapic && nr_legacy_irqs()) {
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 6143ad56008e..21eeba7b188f 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1542,6 +1542,12 @@ void set_sysvec_handler(unsigned int i, system_interrupt_handler func)
 	system_interrupt_handlers[i] = func;
 }
 
+bool is_sysvec_used(unsigned int i)
+{
+	BUG_ON(i >= NR_SYSTEM_VECTORS);
+	return system_interrupt_handlers[i] != dispatch_table_spurious_interrupt;
+}
+
 int external_interrupt(struct pt_regs *regs)
 {
 	unsigned int vector = regs->vector;
@@ -1577,7 +1583,10 @@ void __init trap_init(void)
 
 	/* Initialize TSS before setting up traps so ISTs work */
 	cpu_init_exception_handling();
+
 	/* Setup traps as cpu_init() might #GP */
-	idt_setup_traps();
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		idt_setup_traps();
+
 	cpu_init();
 }
-- 
2.34.1


