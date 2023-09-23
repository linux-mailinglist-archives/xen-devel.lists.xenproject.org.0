Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2C7AC05D
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607192.945559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzhu-0001iw-HT; Sat, 23 Sep 2023 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607192.945559; Sat, 23 Sep 2023 10:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzhu-0001fp-CA; Sat, 23 Sep 2023 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 607192;
 Sat, 23 Sep 2023 10:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzch-0000Pn-AS
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:12:27 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5879c0e-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:12:05 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:54 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:53 -0700
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
X-Inumbo-ID: a5879c0e-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463925; x=1726999925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sp0+AV8Wk0Fbo8OC2qcHvn3gACkXfZEMeDhitLz3FOw=;
  b=eexZbvYzgeEI1kJF1EefXC/WEZvV3HWAcw9j6ijiVuIc6qBlauVzyPYS
   gi44VfAzUGJHSfnlQ81rB0Ws54sNf4qtFbXz5NU3EpkH4rnu0BjUKVLtM
   OuPilPip8bpPSGOnLu3lNu0xbZV/nD17w1h4hEElYGAQPrmfhY3NybarZ
   LeHhc31IeDJPXVu7dj58PxJaPVExHcGZ25QSni5ekEhXphQAkg6tdGeDh
   sd9IgJWRZDr/LJRoFpDVfWDrAOYF3EYR4+qHQxICxVVFqPu227Y93tgk8
   Wr5KEGJF0rYnAZnNtjcaF9qXRPDJN60h/9ht6m7hWAZkJZaiwsgiTvvYI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492510"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492510"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388245"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388245"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: [PATCH v11 36/37] x86/fred: Add FRED initialization functions
Date: Sat, 23 Sep 2023 02:42:11 -0700
Message-Id: <20230923094212.26520-37-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add cpu_init_fred_exceptions() to:
  - Set FRED entrypoints for events happening in ring 0 and 3.
  - Specify the stack level for IRQs occurred ring 0.
  - Specify dedicated event stacks for #DB/NMI/#MCE/#DF.
  - Enable FRED and invalidtes IDT.
  - Force 32-bit system calls to use "int $0x80" only.

Add fred_complete_exception_setup() to:
  - Initialize system_vectors as done for IDT systems.
  - Set unused sysvec_table entries to fred_handle_spurious_interrupt().

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Co-developed-by: Xin Li <xin3.li@intel.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v9:
* Set unused sysvec table entries to fred_handle_spurious_interrupt()
  in fred_complete_exception_setup() (Thomas Gleixner).

Changes since v5:
* Add a comment for FRED stack level settings (Lai Jiangshan).
* Define NMI/#DB/#MCE/#DF stack levels using macros.
---
 arch/x86/entry/entry_fred.c | 21 +++++++++++++
 arch/x86/include/asm/fred.h |  5 ++++
 arch/x86/kernel/Makefile    |  1 +
 arch/x86/kernel/fred.c      | 59 +++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 arch/x86/kernel/fred.c

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index 4c0398010e04..e77429683240 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -140,6 +140,27 @@ void __init fred_install_sysvec(unsigned int sysvec, idtentry_t handler)
 		 sysvec_table[sysvec - FIRST_SYSTEM_VECTOR] = handler;
 }
 
+static noinstr void fred_handle_spurious_interrupt(struct pt_regs *regs)
+{
+	spurious_interrupt(regs, regs->fred_ss.vector);
+}
+
+void __init fred_complete_exception_setup(void)
+{
+	unsigned int vector;
+
+	for (vector = 0; vector < FIRST_EXTERNAL_VECTOR; vector++)
+		set_bit(vector, system_vectors);
+
+	for (vector = 0; vector < NR_SYSTEM_VECTORS; vector++) {
+		if (sysvec_table[vector])
+			set_bit(vector + FIRST_SYSTEM_VECTOR, system_vectors);
+		else
+			sysvec_table[vector] = fred_handle_spurious_interrupt;
+	}
+	fred_setup_done = true;
+}
+
 static noinstr void fred_extint(struct pt_regs *regs)
 {
 	unsigned int vector = regs->fred_ss.vector;
diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index 2fa9f34e5c95..e86c7ba32435 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -83,8 +83,13 @@ static __always_inline void fred_entry_from_kvm(unsigned int type, unsigned int
 	asm_fred_entry_from_kvm(ss);
 }
 
+void cpu_init_fred_exceptions(void);
+void fred_complete_exception_setup(void);
+
 #else /* CONFIG_X86_FRED */
 static __always_inline unsigned long fred_event_data(struct pt_regs *regs) { return 0; }
+static inline void cpu_init_fred_exceptions(void) { }
+static inline void fred_complete_exception_setup(void) { }
 static __always_inline void fred_entry_from_kvm(unsigned int type, unsigned int vector) { }
 #endif /* CONFIG_X86_FRED */
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 3269a0e23d3a..8dfdae4111bb 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -47,6 +47,7 @@ obj-y			+= platform-quirks.o
 obj-y			+= process_$(BITS).o signal.o signal_$(BITS).o
 obj-y			+= traps.o idt.o irq.o irq_$(BITS).o dumpstack_$(BITS).o
 obj-y			+= time.o ioport.o dumpstack.o nmi.o
+obj-$(CONFIG_X86_FRED)	+= fred.o
 obj-$(CONFIG_MODIFY_LDT_SYSCALL)	+= ldt.o
 obj-$(CONFIG_X86_KERNEL_IBT)		+= ibt_selftest.o
 obj-y			+= setup.o x86_init.o i8259.o irqinit.o
diff --git a/arch/x86/kernel/fred.c b/arch/x86/kernel/fred.c
new file mode 100644
index 000000000000..4bcd8791ad96
--- /dev/null
+++ b/arch/x86/kernel/fred.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/kernel.h>
+
+#include <asm/desc.h>
+#include <asm/fred.h>
+#include <asm/tlbflush.h>
+#include <asm/traps.h>
+
+/* #DB in the kernel would imply the use of a kernel debugger. */
+#define FRED_DB_STACK_LEVEL		1UL
+#define FRED_NMI_STACK_LEVEL		2UL
+#define FRED_MC_STACK_LEVEL		2UL
+/*
+ * #DF is the highest level because a #DF means "something went wrong
+ * *while delivering an exception*." The number of cases for which that
+ * can happen with FRED is drastically reduced and basically amounts to
+ * "the stack you pointed me to is broken." Thus, always change stacks
+ * on #DF, which means it should be at the highest level.
+ */
+#define FRED_DF_STACK_LEVEL		3UL
+
+#define FRED_STKLVL(vector, lvl)	((lvl) << (2 * (vector)))
+
+void cpu_init_fred_exceptions(void)
+{
+	/* When FRED is enabled by default, remove this log message */
+	pr_info("Initialize FRED on CPU%d\n", smp_processor_id());
+
+	wrmsrl(MSR_IA32_FRED_CONFIG,
+	       /* Reserve for CALL emulation */
+	       FRED_CONFIG_REDZONE |
+	       FRED_CONFIG_INT_STKLVL(0) |
+	       FRED_CONFIG_ENTRYPOINT(asm_fred_entrypoint_user));
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
+	/* Enable FRED */
+	cr4_set_bits(X86_CR4_FRED);
+	/* Any further IDT use is a bug */
+	idt_invalidate();
+
+	/* Use int $0x80 for 32-bit system calls in FRED mode */
+	setup_clear_cpu_cap(X86_FEATURE_SYSENTER32);
+	setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
+}
-- 
2.34.1


