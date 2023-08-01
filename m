Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9776AC00
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573866.899041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlJ5-0000R3-0F; Tue, 01 Aug 2023 09:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573866.899041; Tue, 01 Aug 2023 09:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlJ4-0000Mq-Mg; Tue, 01 Aug 2023 09:04:42 +0000
Received: by outflank-mailman (input) for mailman id 573866;
 Tue, 01 Aug 2023 09:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1iX=DS=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qQlJ2-0007Jn-Gc
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:04:40 +0000
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a4ac49-304a-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:04:39 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:04:38 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 02:04:36 -0700
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
X-Inumbo-ID: 70a4ac49-304a-11ee-b259-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880679; x=1722416679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRz3qqnddKXYmfF22m/o97+CO0o46xEgUK6odjAvUmY=;
  b=GJqjPjtzrFXwi1NuOogNWvXN5ohoTowUaLAMlflzvg/JuWon776u52o6
   fg9SO/FOWP2DhKs4QeY0SEEcljiLMK7a8Xgk+XJWQe+FtknTmrUVMByGh
   QW0tMiDR7oNlVE9XwZt3fxo5PqIjZgatmvE8G+2uvRi47nHUpLaQ/wtUZ
   UI8W1AOkK0iL9hPDI9EYmyfGo2nayMbv8AnoL40lseTNPv//dV66iknVg
   sPqDagpZ5jIzSOxo7hO5NDXeu09ArozgzDcVf7VOYOw4Ij59ThRteC1t9
   EfbGLhmQppBw3eFNvzUznhMVAcTuGlMxb5VC770AdSRVsz2Xh18sMxb1C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366713682"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="366713682"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722420749"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="722420749"
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
Subject: [PATCH RESEND v9 33/36] KVM: VMX: Add VMX_DO_FRED_EVENT_IRQOFF for IRQ/NMI handling
Date: Tue,  1 Aug 2023 01:35:50 -0700
Message-Id: <20230801083553.8468-7-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801083553.8468-1-xin3.li@intel.com>
References: <20230801083553.8468-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compared to an IDT stack frame, a FRED stack frame has extra 16 bytes of
information pushed at the regular stack top and 8 bytes of error code _always_
pushed at the regular stack bottom, add VMX_DO_FRED_EVENT_IRQOFF to generate
FRED stack frames with event type and vector properly set. Thus, IRQ/NMI can
be handled with the existing approach when FRED is enabled.

For IRQ handling, general purpose registers are pushed to the stack to form
a pt_regs structure, which is then used to call external_interrupt(). As a
result, IRQ handling no longer re-enters the noinstr code.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---

Changes since v8:
* Add a new macro VMX_DO_FRED_EVENT_IRQOFF for FRED instead of refactoring
  VMX_DO_EVENT_IRQOFF (Sean Christopherson).
* Do NOT use a trampoline, just LEA+PUSH the return RIP, PUSH the error code,
  and jump to the FRED kernel entry point for NMI or call external_interrupt()
  for IRQs (Sean Christopherson).
* Call external_interrupt() only when FRED is enabled, and convert the non-FRED
  handling to external_interrupt() after FRED lands (Sean Christopherson).
---
 arch/x86/kvm/vmx/vmenter.S | 88 ++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/vmx/vmx.c     | 19 ++++++--
 2 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
index 07e927d4d099..5ee6a57b59a5 100644
--- a/arch/x86/kvm/vmx/vmenter.S
+++ b/arch/x86/kvm/vmx/vmenter.S
@@ -2,12 +2,14 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm/bitsperlong.h>
+#include <asm/fred.h>
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/nospec-branch.h>
 #include <asm/percpu.h>
 #include <asm/segment.h>
 #include "kvm-asm-offsets.h"
 #include "run_flags.h"
+#include "../../entry/calling.h"
 
 #define WORD_SIZE (BITS_PER_LONG / 8)
 
@@ -31,6 +33,80 @@
 #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
 #endif
 
+#ifdef CONFIG_X86_FRED
+.macro VMX_DO_FRED_EVENT_IRQOFF branch_insn branch_target nmi=0
+	/*
+	 * Unconditionally create a stack frame, getting the correct RSP on the
+	 * stack (for x86-64) would take two instructions anyways, and RBP can
+	 * be used to restore RSP to make objtool happy (see below).
+	 */
+	push %_ASM_BP
+	mov %_ASM_SP, %_ASM_BP
+
+	/*
+	 * Don't check the FRED stack level, the call stack leading to this
+	 * helper is effectively constant and shallow (relatively speaking).
+	 *
+	 * Emulate the FRED-defined redzone and stack alignment.
+	 */
+	sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
+	and $FRED_STACK_FRAME_RSP_MASK, %rsp
+
+	/*
+	 * A FRED stack frame has extra 16 bytes of information pushed at the
+	 * regular stack top compared to an IDT stack frame.
+	 */
+	push $0		/* Reserved by FRED, must be 0 */
+	push $0		/* FRED event data, 0 for NMI and external interrupts */
+
+	shl $32, %rdi				/* FRED event type and vector */
+	.if \nmi
+	bts $FRED_SSX_NMI_BIT, %rdi		/* Set the NMI bit */
+	.endif
+	bts $FRED_SSX_64_BIT_MODE_BIT, %rdi	/* Set the 64-bit mode */
+	or $__KERNEL_DS, %rdi
+	push %rdi
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
+	push %rax
+	push $0		/* FRED error code, 0 for NMI and external interrupts */
+
+	.if \nmi == 0
+	PUSH_REGS
+	mov %rsp, %rdi
+	.endif
+
+	\branch_insn \branch_target
+
+	.if \nmi == 0
+	POP_REGS
+	.endif
+
+1:
+	/*
+	 * "Restore" RSP from RBP, even though IRET has already unwound RSP to
+	 * the correct value.  objtool doesn't know the callee will IRET and,
+	 * without the explicit restore, thinks the stack is getting walloped.
+	 * Using an unwind hint is problematic due to x86-64's dynamic alignment.
+	 */
+	mov %_ASM_BP, %_ASM_SP
+	pop %_ASM_BP
+	RET
+.endm
+#endif
+
 .macro VMX_DO_EVENT_IRQOFF call_insn call_target
 	/*
 	 * Unconditionally create a stack frame, getting the correct RSP on the
@@ -299,6 +375,12 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 
 SYM_FUNC_END(__vmx_vcpu_run)
 
+#ifdef CONFIG_X86_FRED
+SYM_FUNC_START(vmx_do_fred_nmi_irqoff)
+	VMX_DO_FRED_EVENT_IRQOFF jmp fred_entrypoint_kernel nmi=1
+SYM_FUNC_END(vmx_do_fred_nmi_irqoff)
+#endif
+
 SYM_FUNC_START(vmx_do_nmi_irqoff)
 	VMX_DO_EVENT_IRQOFF call asm_exc_nmi_kvm_vmx
 SYM_FUNC_END(vmx_do_nmi_irqoff)
@@ -357,6 +439,12 @@ SYM_FUNC_START(vmread_error_trampoline)
 SYM_FUNC_END(vmread_error_trampoline)
 #endif
 
+#ifdef CONFIG_X86_FRED
+SYM_FUNC_START(vmx_do_fred_interrupt_irqoff)
+	VMX_DO_FRED_EVENT_IRQOFF call external_interrupt
+SYM_FUNC_END(vmx_do_fred_interrupt_irqoff)
+#endif
+
 SYM_FUNC_START(vmx_do_interrupt_irqoff)
 	VMX_DO_EVENT_IRQOFF CALL_NOSPEC _ASM_ARG1
 SYM_FUNC_END(vmx_do_interrupt_irqoff)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 0ecf4be2c6af..4e90c69a92bf 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6890,6 +6890,14 @@ static void vmx_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	memset(vmx->pi_desc.pir, 0, sizeof(vmx->pi_desc.pir));
 }
 
+#ifdef CONFIG_X86_FRED
+void vmx_do_fred_interrupt_irqoff(unsigned int vector);
+void vmx_do_fred_nmi_irqoff(unsigned int vector);
+#else
+#define vmx_do_fred_interrupt_irqoff(x) BUG()
+#define vmx_do_fred_nmi_irqoff(x) BUG()
+#endif
+
 void vmx_do_interrupt_irqoff(unsigned long entry);
 void vmx_do_nmi_irqoff(void);
 
@@ -6932,14 +6940,16 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
 {
 	u32 intr_info = vmx_get_intr_info(vcpu);
 	unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
-	gate_desc *desc = (gate_desc *)host_idt_base + vector;
 
 	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
 	    "unexpected VM-Exit interrupt info: 0x%x", intr_info))
 		return;
 
 	kvm_before_interrupt(vcpu, KVM_HANDLING_IRQ);
-	vmx_do_interrupt_irqoff(gate_offset(desc));
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		vmx_do_fred_interrupt_irqoff(vector);	/* Event type is 0 */
+	else
+		vmx_do_interrupt_irqoff(gate_offset((gate_desc *)host_idt_base + vector));
 	kvm_after_interrupt(vcpu);
 
 	vcpu->arch.at_instruction_boundary = true;
@@ -7225,7 +7235,10 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
 	    is_nmi(vmx_get_intr_info(vcpu))) {
 		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
-		vmx_do_nmi_irqoff();
+		if (cpu_feature_enabled(X86_FEATURE_FRED))
+			vmx_do_fred_nmi_irqoff((EVENT_TYPE_NMI << 16) | NMI_VECTOR);
+		else
+			vmx_do_nmi_irqoff();
 		kvm_after_interrupt(vcpu);
 	}
 
-- 
2.34.1


