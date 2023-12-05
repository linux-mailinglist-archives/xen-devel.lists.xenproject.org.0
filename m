Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2E68052F0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647648.1011112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATfq-0006p4-EG; Tue, 05 Dec 2023 11:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647648.1011112; Tue, 05 Dec 2023 11:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATfq-0006nS-BX; Tue, 05 Dec 2023 11:33:10 +0000
Received: by outflank-mailman (input) for mailman id 647648;
 Tue, 05 Dec 2023 11:33:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUr-0003dP-VP
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:49 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74bba901-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:38 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:27 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:25 -0800
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
X-Inumbo-ID: 74bba901-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775299; x=1733311299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+DpQXfFjluhEPpBgGqFegRQUmj2AdYX7lnZ9lGR9vg=;
  b=TI+bMRht9g89dUAdmHviwWlrkw4v/mjOpYCuCmid7+QnETIhps+bgRqL
   KuxU4xl1ONqRMoJCXvxCDY5DyCT2k8PzJyReL5hP4C6q7xIo4c1uyByk6
   I1cJFT00UNeKTtHuv/yKCmT3H8ZJKp52BbYontaKQd606P8M9as2oIYfl
   gNGQBuO1hQx+G0oQAU9it/UR049Jvs6dWTEDtmz6BHKpV5fkkJBdRoTUJ
   PSJNCF7MRgMlYYEPpdCJFMK5uloQQ9VeQXDIV5rYHGZ0xIbrYhOgP4AzF
   LnrZHOGkXZ/UxAz0TQ/mn1xrNpz13V7AqXzs5yD7+TKKNigxq5jkvju92
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942682"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942682"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018193009"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018193009"
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
Subject: [PATCH v13 31/35] x86/entry: Add fred_entry_from_kvm() for VMX to handle IRQ/NMI
Date: Tue,  5 Dec 2023 02:50:20 -0800
Message-ID: <20231205105030.8698-32-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In IRQ/NMI induced VM exits, KVM VMX needs to execute the respective
handlers, which requires the software to create a FRED stack frame,
and use it to invoke the handlers. Add fred_irq_entry_from_kvm() for
this job.

Export fred_entry_from_kvm() because VMX can be compiled as a module.

Suggested-by: Sean Christopherson <seanjc@google.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v10:
* Better explain the reason why no need to check current stack level
  (Paolo Bonzini).

Changes since v9:
* Shove the whole thing into arch/x86/entry/entry_64_fred.S for invoking
  external_interrupt() and fred_exc_nmi() (Sean Christopherson).
* Correct and improve a few comments (Sean Christopherson).
* Merge the two IRQ/NMI asm entries into one as it's fine to invoke
  noinstr code from regular code (Thomas Gleixner).
* Setup the long mode and NMI flags in the augmented SS field of FRED
  stack frame in C instead of asm (Thomas Gleixner).
* Add UNWIND_HINT_{SAVE,RESTORE} to get rid of the warning: "objtool:
  asm_fred_entry_from_kvm+0x0: unreachable instruction" (Peter Zijlstra).

Changes since v8:
* Add a new macro VMX_DO_FRED_EVENT_IRQOFF for FRED instead of
  refactoring VMX_DO_EVENT_IRQOFF (Sean Christopherson).
* Do NOT use a trampoline, just LEA+PUSH the return RIP, PUSH the error
  code, and jump to the FRED kernel entry point for NMI or call
  external_interrupt() for IRQs (Sean Christopherson).
* Call external_interrupt() only when FRED is enabled, and convert the
  non-FRED handling to external_interrupt() after FRED lands (Sean
  Christopherson).
---
 arch/x86/entry/entry_64_fred.S | 77 ++++++++++++++++++++++++++++++++++
 arch/x86/entry/entry_fred.c    | 14 +++++++
 arch/x86/include/asm/fred.h    | 18 ++++++++
 3 files changed, 109 insertions(+)

diff --git a/arch/x86/entry/entry_64_fred.S b/arch/x86/entry/entry_64_fred.S
index d1c2fc4af8ae..eedf98de7538 100644
--- a/arch/x86/entry/entry_64_fred.S
+++ b/arch/x86/entry/entry_64_fred.S
@@ -3,8 +3,11 @@
  * The actual FRED entry points.
  */
 
+#include <linux/export.h>
+
 #include <asm/asm.h>
 #include <asm/fred.h>
+#include <asm/segment.h>
 
 #include "calling.h"
 
@@ -54,3 +57,77 @@ SYM_CODE_START_NOALIGN(asm_fred_entrypoint_kernel)
 	FRED_EXIT
 	ERETS
 SYM_CODE_END(asm_fred_entrypoint_kernel)
+
+#if IS_ENABLED(CONFIG_KVM_INTEL)
+SYM_FUNC_START(asm_fred_entry_from_kvm)
+	push %rbp
+	mov %rsp, %rbp
+
+	UNWIND_HINT_SAVE
+
+	/*
+	 * Both IRQ and NMI from VMX can be handled on current task stack
+	 * because there is no need to protect from reentrancy and the call
+	 * stack leading to this helper is effectively constant and shallow
+	 * (relatively speaking). Do the same when FRED is active, i.e., no
+	 * need to check current stack level for a stack switch.
+	 *
+	 * Emulate the FRED-defined redzone and stack alignment.
+	 */
+	sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
+	and $FRED_STACK_FRAME_RSP_MASK, %rsp
+
+	/*
+	 * Start to push a FRED stack frame, which is always 64 bytes:
+	 *
+	 * +--------+-----------------+
+	 * | Bytes  | Usage           |
+	 * +--------+-----------------+
+	 * | 63:56  | Reserved        |
+	 * | 55:48  | Event Data      |
+	 * | 47:40  | SS + Event Info |
+	 * | 39:32  | RSP             |
+	 * | 31:24  | RFLAGS          |
+	 * | 23:16  | CS + Aux Info   |
+	 * |  15:8  | RIP             |
+	 * |   7:0  | Error Code      |
+	 * +--------+-----------------+
+	 */
+	push $0				/* Reserved, must be 0 */
+	push $0				/* Event data, 0 for IRQ/NMI */
+	push %rdi			/* fred_ss handed in by the caller */
+	push %rbp
+	pushf
+	mov $__KERNEL_CS, %rax
+	push %rax
+
+	/*
+	 * Unlike the IDT event delivery, FRED _always_ pushes an error code
+	 * after pushing the return RIP, thus the CALL instruction CANNOT be
+	 * used here to push the return RIP, otherwise there is no chance to
+	 * push an error code before invoking the IRQ/NMI handler.
+	 *
+	 * Use LEA to get the return RIP and push it, then push an error code.
+	 */
+	lea 1f(%rip), %rax
+	push %rax				/* Return RIP */
+	push $0					/* Error code, 0 for IRQ/NMI */
+
+	PUSH_AND_CLEAR_REGS clear_bp=0 unwind_hint=0
+	movq %rsp, %rdi				/* %rdi -> pt_regs */
+	call __fred_entry_from_kvm		/* Call the C entry point */
+	POP_REGS
+	ERETS
+1:
+	/*
+	 * Objtool doesn't understand what ERETS does, this hint tells it that
+	 * yes, we'll reach here and with what stack state. A save/restore pair
+	 * isn't strictly needed, but it's the simplest form.
+	 */
+	UNWIND_HINT_RESTORE
+	pop %rbp
+	RET
+
+SYM_FUNC_END(asm_fred_entry_from_kvm)
+EXPORT_SYMBOL_GPL(asm_fred_entry_from_kvm);
+#endif
diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index e80e3efbc057..3e33a4ab4624 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -242,3 +242,17 @@ __visible noinstr void fred_entry_from_kernel(struct pt_regs *regs)
 		return fred_bad_type(regs, error_code);
 	}
 }
+
+#if IS_ENABLED(CONFIG_KVM_INTEL)
+__visible noinstr void __fred_entry_from_kvm(struct pt_regs *regs)
+{
+	switch (regs->fred_ss.type) {
+	case EVENT_TYPE_EXTINT:
+		return fred_extint(regs);
+	case EVENT_TYPE_NMI:
+		return fred_exc_nmi(regs);
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+#endif
diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
index 16a64ffecbf8..2fa9f34e5c95 100644
--- a/arch/x86/include/asm/fred.h
+++ b/arch/x86/include/asm/fred.h
@@ -9,6 +9,7 @@
 #include <linux/const.h>
 
 #include <asm/asm.h>
+#include <asm/trapnr.h>
 
 /*
  * FRED event return instruction opcodes for ERET{S,U}; supported in
@@ -62,12 +63,29 @@ static __always_inline unsigned long fred_event_data(struct pt_regs *regs)
 
 void asm_fred_entrypoint_user(void);
 void asm_fred_entrypoint_kernel(void);
+void asm_fred_entry_from_kvm(struct fred_ss);
 
 __visible void fred_entry_from_user(struct pt_regs *regs);
 __visible void fred_entry_from_kernel(struct pt_regs *regs);
+__visible void __fred_entry_from_kvm(struct pt_regs *regs);
+
+/* Can be called from noinstr code, thus __always_inline */
+static __always_inline void fred_entry_from_kvm(unsigned int type, unsigned int vector)
+{
+	struct fred_ss ss = {
+		.ss     =__KERNEL_DS,
+		.type   = type,
+		.vector = vector,
+		.nmi    = type == EVENT_TYPE_NMI,
+		.lm     = 1,
+	};
+
+	asm_fred_entry_from_kvm(ss);
+}
 
 #else /* CONFIG_X86_FRED */
 static __always_inline unsigned long fred_event_data(struct pt_regs *regs) { return 0; }
+static __always_inline void fred_entry_from_kvm(unsigned int type, unsigned int vector) { }
 #endif /* CONFIG_X86_FRED */
 #endif /* !__ASSEMBLY__ */
 
-- 
2.43.0


