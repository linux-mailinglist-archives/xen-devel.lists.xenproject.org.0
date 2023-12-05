Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DC8052FB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647657.1011152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATh6-0000bR-HO; Tue, 05 Dec 2023 11:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647657.1011152; Tue, 05 Dec 2023 11:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATh6-0000Yz-EX; Tue, 05 Dec 2023 11:34:28 +0000
Received: by outflank-mailman (input) for mailman id 647657;
 Tue, 05 Dec 2023 11:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUk-0003dP-Ul
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:42 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71f72086-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:33 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:24 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:22 -0800
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
X-Inumbo-ID: 71f72086-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775294; x=1733311294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0d3DQGm/I5ml9Pn9RDXaRIVibuYwsK2Hzyh1Rbxiqo8=;
  b=f4ZcupoRpybK9ORpKfHT4iN/IRTwpbYpWh5zmmvRJsPENQlKK6Eo3d14
   tylWxPJxN6zqTkCTFuR9LuJdVyemMK1xe7U78bNomNzcLm0Np/egwLdCL
   ad+qJW8MLPZ9uynrCC7LaQS1LVhkv033cc9JJHOAYJXAUQmyq7ZLVh836
   VtqB7q851Wr2+tEZGsR4LT+wBKg9uVuteDE9b64a059aCkCD7xP2Vcfvd
   zLLxBrGuZaMZV+9yydiwbLfK4d4omntuUEQwMIHUwfVEHCPFuhX2VKGuI
   GFNkgRL2K/fj+Sg0Sr8xGeABqPB1p8AZpRjjlUjHNnCoEruazKlWpDyGB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942571"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942571"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018192976"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018192976"
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
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 22/35] x86/idtentry: Incorporate definitions/declarations of the FRED entries
Date: Tue,  5 Dec 2023 02:50:11 -0800
Message-ID: <20231205105030.8698-23-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FRED and IDT can share most of the definitions and declarations so
that in the majority of cases the actual handler implementation is the
same.

The differences are the exceptions where FRED stores exception related
information on the stack and the sysvec implementations as FRED can
handle irqentry/exit() in the dispatcher instead of having it in each
handler.

Also add stub defines for vectors which are not used due to Kconfig
decisions to spare the ifdeffery in the actual FRED dispatch code.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Change since v9:
* Except NMI/#DB/#MCE, FRED really should share the exception handlers
  with IDT (Thomas Gleixner).

Change since v8:
* Put IDTENTRY changes in a separate patch (Thomas Gleixner).
---
 arch/x86/include/asm/idtentry.h | 71 +++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index cfca68f6cb84..4f26ee9b8b74 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -13,15 +13,18 @@
 
 #include <asm/irq_stack.h>
 
+typedef void (*idtentry_t)(struct pt_regs *regs);
+
 /**
  * DECLARE_IDTENTRY - Declare functions for simple IDT entry points
  *		      No error code pushed by hardware
  * @vector:	Vector number (ignored for C)
  * @func:	Function name of the entry point
  *
- * Declares three functions:
+ * Declares four functions:
  * - The ASM entry point: asm_##func
  * - The XEN PV trap entry point: xen_##func (maybe unused)
+ * - The C handler called from the FRED event dispatcher (maybe unused)
  * - The C handler called from the ASM entry point
  *
  * Note: This is the C variant of DECLARE_IDTENTRY(). As the name says it
@@ -31,6 +34,7 @@
 #define DECLARE_IDTENTRY(vector, func)					\
 	asmlinkage void asm_##func(void);				\
 	asmlinkage void xen_asm_##func(void);				\
+	void fred_##func(struct pt_regs *regs);				\
 	__visible void func(struct pt_regs *regs)
 
 /**
@@ -137,6 +141,17 @@ static __always_inline void __##func(struct pt_regs *regs,		\
 #define DEFINE_IDTENTRY_RAW(func)					\
 __visible noinstr void func(struct pt_regs *regs)
 
+/**
+ * DEFINE_FREDENTRY_RAW - Emit code for raw FRED entry points
+ * @func:	Function name of the entry point
+ *
+ * @func is called from the FRED event dispatcher with interrupts disabled.
+ *
+ * See @DEFINE_IDTENTRY_RAW for further details.
+ */
+#define DEFINE_FREDENTRY_RAW(func)					\
+noinstr void fred_##func(struct pt_regs *regs)
+
 /**
  * DECLARE_IDTENTRY_RAW_ERRORCODE - Declare functions for raw IDT entry points
  *				    Error code pushed by hardware
@@ -233,17 +248,27 @@ static noinline void __##func(struct pt_regs *regs, u32 vector)
 #define DEFINE_IDTENTRY_SYSVEC(func)					\
 static void __##func(struct pt_regs *regs);				\
 									\
+static __always_inline void instr_##func(struct pt_regs *regs)		\
+{									\
+	kvm_set_cpu_l1tf_flush_l1d();					\
+	run_sysvec_on_irqstack_cond(__##func, regs);			\
+}									\
+									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
 	irqentry_state_t state = irqentry_enter(regs);			\
 									\
 	instrumentation_begin();					\
-	kvm_set_cpu_l1tf_flush_l1d();					\
-	run_sysvec_on_irqstack_cond(__##func, regs);			\
+	instr_##func (regs);						\
 	instrumentation_end();						\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+void fred_##func(struct pt_regs *regs)					\
+{									\
+	instr_##func (regs);						\
+}									\
+									\
 static noinline void __##func(struct pt_regs *regs)
 
 /**
@@ -260,19 +285,29 @@ static noinline void __##func(struct pt_regs *regs)
 #define DEFINE_IDTENTRY_SYSVEC_SIMPLE(func)				\
 static __always_inline void __##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+static __always_inline void instr_##func(struct pt_regs *regs)		\
 {									\
-	irqentry_state_t state = irqentry_enter(regs);			\
-									\
-	instrumentation_begin();					\
 	__irq_enter_raw();						\
 	kvm_set_cpu_l1tf_flush_l1d();					\
 	__##func (regs);						\
 	__irq_exit_raw();						\
+}									\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	irqentry_state_t state = irqentry_enter(regs);			\
+									\
+	instrumentation_begin();					\
+	instr_##func (regs);						\
 	instrumentation_end();						\
 	irqentry_exit(regs, state);					\
 }									\
 									\
+void fred_##func(struct pt_regs *regs)					\
+{									\
+	instr_##func (regs);						\
+}									\
+									\
 static __always_inline void __##func(struct pt_regs *regs)
 
 /**
@@ -410,15 +445,18 @@ __visible noinstr void func(struct pt_regs *regs,			\
 /* C-Code mapping */
 #define DECLARE_IDTENTRY_NMI		DECLARE_IDTENTRY_RAW
 #define DEFINE_IDTENTRY_NMI		DEFINE_IDTENTRY_RAW
+#define DEFINE_FREDENTRY_NMI		DEFINE_FREDENTRY_RAW
 
 #ifdef CONFIG_X86_64
 #define DECLARE_IDTENTRY_MCE		DECLARE_IDTENTRY_IST
 #define DEFINE_IDTENTRY_MCE		DEFINE_IDTENTRY_IST
 #define DEFINE_IDTENTRY_MCE_USER	DEFINE_IDTENTRY_NOIST
+#define DEFINE_FREDENTRY_MCE		DEFINE_FREDENTRY_RAW
 
 #define DECLARE_IDTENTRY_DEBUG		DECLARE_IDTENTRY_IST
 #define DEFINE_IDTENTRY_DEBUG		DEFINE_IDTENTRY_IST
 #define DEFINE_IDTENTRY_DEBUG_USER	DEFINE_IDTENTRY_NOIST
+#define DEFINE_FREDENTRY_DEBUG		DEFINE_FREDENTRY_RAW
 #endif
 
 #else /* !__ASSEMBLY__ */
@@ -651,23 +689,36 @@ DECLARE_IDTENTRY(RESCHEDULE_VECTOR,			sysvec_reschedule_ipi);
 DECLARE_IDTENTRY_SYSVEC(REBOOT_VECTOR,			sysvec_reboot);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	sysvec_call_function_single);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_VECTOR,		sysvec_call_function);
+#else
+# define fred_sysvec_reschedule_ipi			NULL
+# define fred_sysvec_reboot				NULL
+# define fred_sysvec_call_function_single		NULL
+# define fred_sysvec_call_function			NULL
 #endif
 
 #ifdef CONFIG_X86_LOCAL_APIC
 # ifdef CONFIG_X86_MCE_THRESHOLD
 DECLARE_IDTENTRY_SYSVEC(THRESHOLD_APIC_VECTOR,		sysvec_threshold);
+# else
+# define fred_sysvec_threshold				NULL
 # endif
 
 # ifdef CONFIG_X86_MCE_AMD
 DECLARE_IDTENTRY_SYSVEC(DEFERRED_ERROR_VECTOR,		sysvec_deferred_error);
+# else
+# define fred_sysvec_deferred_error			NULL
 # endif
 
 # ifdef CONFIG_X86_THERMAL_VECTOR
 DECLARE_IDTENTRY_SYSVEC(THERMAL_APIC_VECTOR,		sysvec_thermal);
+# else
+# define fred_sysvec_thermal				NULL
 # endif
 
 # ifdef CONFIG_IRQ_WORK
 DECLARE_IDTENTRY_SYSVEC(IRQ_WORK_VECTOR,		sysvec_irq_work);
+# else
+# define fred_sysvec_irq_work				NULL
 # endif
 #endif
 
@@ -675,12 +726,16 @@ DECLARE_IDTENTRY_SYSVEC(IRQ_WORK_VECTOR,		sysvec_irq_work);
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_VECTOR,		sysvec_kvm_posted_intr_ipi);
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_WAKEUP_VECTOR,	sysvec_kvm_posted_intr_wakeup_ipi);
 DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_NESTED_VECTOR,	sysvec_kvm_posted_intr_nested_ipi);
+#else
+# define fred_sysvec_kvm_posted_intr_ipi		NULL
+# define fred_sysvec_kvm_posted_intr_wakeup_ipi		NULL
+# define fred_sysvec_kvm_posted_intr_nested_ipi		NULL
 #endif
 
 #if IS_ENABLED(CONFIG_HYPERV)
 DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_hyperv_callback);
 DECLARE_IDTENTRY_SYSVEC(HYPERV_REENLIGHTENMENT_VECTOR,	sysvec_hyperv_reenlightenment);
-DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,	sysvec_hyperv_stimer0);
+DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,		sysvec_hyperv_stimer0);
 #endif
 
 #if IS_ENABLED(CONFIG_ACRN_GUEST)
-- 
2.43.0


