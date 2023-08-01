Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE376AC4F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573946.899121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlMP-0005uF-SH; Tue, 01 Aug 2023 09:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573946.899121; Tue, 01 Aug 2023 09:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlMP-0005oC-Lr; Tue, 01 Aug 2023 09:08:09 +0000
Received: by outflank-mailman (input) for mailman id 573946;
 Tue, 01 Aug 2023 09:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlGp-0005E5-Vu
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:02:24 +0000
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f941154-304a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:02:21 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:02:13 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 02:02:12 -0700
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
X-Inumbo-ID: 1f941154-304a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880541; x=1722416541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=noUm+C4jbhw0mC8rdAqNdlrDhDQPWQ7nu1SRrIUqW1s=;
  b=cfcqHCV6MVt1dSSCeYpGuLuuVv1HiIuEpr8aALTGu5WTcSGfUa725rUq
   zpWaEN19WqIkIjqwtfFIkF8+Ggx+JFIqdlBR5GncXJedwX8Kcwdksy0mx
   h7y0gVCdIScXVIAfl5ewS1JNa75lpBPi+xyejc/hya0DBwhTdJ5wnjYKz
   S6absSKgKzqmRNAHTLFl48Fz+Doyv8+7robP1s1eGxDmlX0oZ2DqoIwu/
   GXVRY5oVuBWmwz3XJLD/pdUV+qFnJVqMS6IpAfOYCrP9LruFTMNlM1vY+
   sP+ppd9Q87KbNK3Va3UvRDNMnSHtlGVNN4Z1AkRaa0uPFysqmVZ9U7cxz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433082844"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433082844"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975217087"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="975217087"
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
Subject: [PATCH RESEND v9 24/36] x86/idtentry: Incorporate definitions/declarations of the FRED external interrupt handler type
Date: Tue,  1 Aug 2023 01:33:06 -0700
Message-Id: <20230801083318.8363-25-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083318.8363-1-xin3.li@intel.com>
References: <20230801083318.8363-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FRED operates differently from IDT in terms of interrupt handling.
Instead of directly dispatching an interrupt to its handler based
on the interrupt vector, FRED requires the software to dispatch
an event to its handler based on both the event's type and vector.
Therefore, an event dispatch framework must be implemented to
facilitate the event-to-handler dispatch process.

The FRED event dispatch framework assumes control once an event is
delivered, starting from two FRED entry points, after which several
event dispatch tables are introduced to facilitate the dispatching.
The first level dispatching is event type based, and two tables need
to be defined, one for ring 3 event dispatching, and the other for
ring 0. The second level dispatching is event vector based, and
several tables need to be defined, e.g., an exception handler table
for exception dispatching.

Handlers in these tables are typically noinstr. However for external
interrupt dispatching, irqentry_{enter,exit}() and
instrumentation_{begin,end}() can be extracted from respective interrupt
handler to the dispatch framework. As a result, FRED external interrupt
handlers don't need to be noinstr.

Incorporate definitions/declarations of FRED external interrupt handler
types into the IDT entry macros.

It is probably better to rename idtentry as event_entry.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Put IDTENTRY changes in a separate patch (Thomas Gleixner).
---
 arch/x86/include/asm/idtentry.h | 91 +++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 6817c0f8e323..e67d111bf932 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -167,17 +167,22 @@ __visible noinstr void func(struct pt_regs *regs, unsigned long error_code)
 
 /**
  * DECLARE_IDTENTRY_IRQ - Declare functions for device interrupt IDT entry
- *			  points (common/spurious)
+ *			  points (common/spurious) and their corresponding
+ *			  software based dispatch handlers in the non-noinstr
+ *			  text section
  * @vector:	Vector number (ignored for C)
  * @func:	Function name of the entry point
  *
- * Maps to DECLARE_IDTENTRY_ERRORCODE()
+ * Maps to DECLARE_IDTENTRY_ERRORCODE(), plus a dispatch function prototype
  */
 #define DECLARE_IDTENTRY_IRQ(vector, func)				\
-	DECLARE_IDTENTRY_ERRORCODE(vector, func)
+	DECLARE_IDTENTRY_ERRORCODE(vector, func);			\
+	void dispatch_##func(struct pt_regs *regs, unsigned long error_code)
 
 /**
  * DEFINE_IDTENTRY_IRQ - Emit code for device interrupt IDT entry points
+ *			 and their corresponding software based dispatch
+ *			 handlers in the non-noinstr text section
  * @func:	Function name of the entry point
  *
  * The vector number is pushed by the low level entry stub and handed
@@ -187,6 +192,11 @@ __visible noinstr void func(struct pt_regs *regs, unsigned long error_code)
  * irq_enter/exit_rcu() are invoked before the function body and the
  * KVM L1D flush request is set. Stack switching to the interrupt stack
  * has to be done in the function body if necessary.
+ *
+ * dispatch_func() is a software based dispatch handler in the non-noinstr
+ * text section, assuming the irqentry_{enter,exit}() and
+ * instrumentation_{begin,end}() helpers are invoked in the external
+ * interrupt dispatch framework before and after dispatch_func().
  */
 #define DEFINE_IDTENTRY_IRQ(func)					\
 static void __##func(struct pt_regs *regs, u32 vector);			\
@@ -204,31 +214,68 @@ __visible noinstr void func(struct pt_regs *regs,			\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+__visible void dispatch_##func(struct pt_regs *regs,			\
+			       unsigned long error_code)		\
+{									\
+	u32 vector = (u32)(u8)error_code;				\
+									\
+	kvm_set_cpu_l1tf_flush_l1d();					\
+	run_irq_on_irqstack_cond(__##func, regs, vector);		\
+}									\
+									\
 static noinline void __##func(struct pt_regs *regs, u32 vector)
 
+/*
+ * Define a function type system_interrupt_handler as the element type of
+ * the table system_interrupt_handlers.
+ *
+ * System interrupt handlers don't take any interrupt vector number, or
+ * any interrupt error code as arguments, as a system interrupt handler
+ * is defined to handle a specific interrupt vector, and no error code
+ * is defined for external interrupts. It takes only one argument of type
+ * struct pt_regs *.
+ */
+#define DECLARE_SYSTEM_INTERRUPT_HANDLER(f) \
+	void f (struct pt_regs *regs)
+#define DEFINE_SYSTEM_INTERRUPT_HANDLER(f) \
+	__visible DECLARE_SYSTEM_INTERRUPT_HANDLER(f)
+typedef DECLARE_SYSTEM_INTERRUPT_HANDLER((*system_interrupt_handler));
+
 /**
  * DECLARE_IDTENTRY_SYSVEC - Declare functions for system vector entry points
+ *			     and their corresponding software based dispatch
+ *			     handlers in the non-noinstr text section
  * @vector:	Vector number (ignored for C)
  * @func:	Function name of the entry point
  *
- * Declares three functions:
+ * Declares four functions:
  * - The ASM entry point: asm_##func
  * - The XEN PV trap entry point: xen_##func (maybe unused)
  * - The C handler called from the ASM entry point
+ * - The C handler used in the system interrupt handler table
  *
- * Maps to DECLARE_IDTENTRY().
+ * Maps to DECLARE_IDTENTRY(), plus a dispatch table function prototype
  */
 #define DECLARE_IDTENTRY_SYSVEC(vector, func)				\
-	DECLARE_IDTENTRY(vector, func)
+	DECLARE_IDTENTRY(vector, func);					\
+	DECLARE_SYSTEM_INTERRUPT_HANDLER(dispatch_table_##func)
 
 /**
  * DEFINE_IDTENTRY_SYSVEC - Emit code for system vector IDT entry points
+ *			    and their corresponding software based dispatch
+ *			    handlers in the non-noinstr text section
  * @func:	Function name of the entry point
  *
  * irqentry_enter/exit() and irq_enter/exit_rcu() are invoked before the
  * function body. KVM L1D flush request is set.
  *
- * Runs the function on the interrupt stack if the entry hit kernel mode
+ * Runs the function on the interrupt stack if the entry hit kernel mode.
+ *
+ * dispatch_table_func() is used to fill the system interrupt handler table
+ * for system interrupts dispatching, assuming the irqentry_{enter,exit}()
+ * and instrumentation_{begin,end}() helpers are invoked in the external
+ * interrupt dispatch framework before and after dispatch_table_func(),
+ * thus in the non-noinstr text section.
  */
 #define DEFINE_IDTENTRY_SYSVEC(func)					\
 static void __##func(struct pt_regs *regs);				\
@@ -244,11 +291,19 @@ __visible noinstr void func(struct pt_regs *regs)			\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+DEFINE_SYSTEM_INTERRUPT_HANDLER(dispatch_table_##func)			\
+{									\
+	kvm_set_cpu_l1tf_flush_l1d();					\
+	run_sysvec_on_irqstack_cond(__##func, regs);			\
+}									\
+									\
 static noinline void __##func(struct pt_regs *regs)
 
 /**
  * DEFINE_IDTENTRY_SYSVEC_SIMPLE - Emit code for simple system vector IDT
- *				   entry points
+ *				   entry points and their corresponding
+ *				   software based dispatch handlers in
+ *				   the non-noinstr text section
  * @func:	Function name of the entry point
  *
  * Runs the function on the interrupted stack. No switch to IRQ stack and
@@ -256,6 +311,12 @@ static noinline void __##func(struct pt_regs *regs)
  *
  * Only use for 'empty' vectors like reschedule IPI and KVM posted
  * interrupt vectors.
+ *
+ * dispatch_table_func() is used to fill the system interrupt handler table
+ * for system interrupts dispatching, assuming the irqentry_{enter,exit}()
+ * and instrumentation_{begin,end}() helpers are invoked in the external
+ * interrupt dispatch framework before and after dispatch_table_func(),
+ * thus in the non-noinstr text section.
  */
 #define DEFINE_IDTENTRY_SYSVEC_SIMPLE(func)				\
 static __always_inline void __##func(struct pt_regs *regs);		\
@@ -273,6 +334,14 @@ __visible noinstr void func(struct pt_regs *regs)			\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+DEFINE_SYSTEM_INTERRUPT_HANDLER(dispatch_table_##func)			\
+{									\
+	__irq_enter_raw();						\
+	kvm_set_cpu_l1tf_flush_l1d();					\
+	__##func (regs);						\
+	__irq_exit_raw();						\
+}									\
+									\
 static __always_inline void __##func(struct pt_regs *regs)
 
 /**
@@ -647,7 +716,11 @@ DECLARE_IDTENTRY_SYSVEC(X86_PLATFORM_IPI_VECTOR,	sysvec_x86_platform_ipi);
 #endif
 
 #ifdef CONFIG_SMP
-DECLARE_IDTENTRY(RESCHEDULE_VECTOR,			sysvec_reschedule_ipi);
+/*
+ * Use DECLARE_IDTENTRY_SYSVEC instead of DECLARE_IDTENTRY to add a
+ * software based dispatch handler declaration for RESCHEDULE_VECTOR.
+ */
+DECLARE_IDTENTRY_SYSVEC(RESCHEDULE_VECTOR,		sysvec_reschedule_ipi);
 DECLARE_IDTENTRY_SYSVEC(REBOOT_VECTOR,			sysvec_reboot);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	sysvec_call_function_single);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_VECTOR,		sysvec_call_function);
-- 
2.34.1


