Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642D9AFFA1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825845.1240223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFW-0002ir-Cl; Fri, 25 Oct 2024 10:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825845.1240223; Fri, 25 Oct 2024 10:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFW-0002gI-74; Fri, 25 Oct 2024 10:08:54 +0000
Received: by outflank-mailman (input) for mailman id 825845;
 Fri, 25 Oct 2024 10:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFU-0000tn-Hi
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:52 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 199213b7-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:49 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XZdjL03xBz10My6;
 Fri, 25 Oct 2024 18:06:30 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 7AEEB1800A5;
 Fri, 25 Oct 2024 18:08:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:32 +0800
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
X-Inumbo-ID: 199213b7-92b9-11ef-99a3-01e77a169b0f
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<mark.rutland@arm.com>, <catalin.marinas@arm.com>, <sstabellini@kernel.org>,
	<maz@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>, <arnd@arndb.de>,
	<ojeda@kernel.org>, <rppt@kernel.org>, <hca@linux.ibm.com>,
	<aliceryhl@google.com>, <samuel.holland@sifive.com>, <paulmck@kernel.org>,
	<aquini@redhat.com>, <petr.pavlu@suse.com>, <ruanjinjie@huawei.com>,
	<viro@zeniv.linux.org.uk>, <rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>,
	<linus.walleij@linaro.org>, <yangyj.ee@gmail.com>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>,
	<Jonathan.Cameron@huawei.com>, <prarit@redhat.com>, <liuwei09@cestc.cn>,
	<dwmw@amazon.co.uk>, <oliver.upton@linux.dev>, <kristina.martsenko@arm.com>,
	<ptosi@google.com>, <frederic@kernel.org>, <vschneid@redhat.com>,
	<thiago.bauermann@linaro.org>, <joey.gouly@arm.com>,
	<liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH -next v4 01/19] arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
Date: Fri, 25 Oct 2024 18:06:42 +0800
Message-ID: <20241025100700.3714552-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Implement regs_irqs_disabled(), and replace interrupts_enabled() macro
with regs_irqs_disabled() all over the place.

No functional changes.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm/include/asm/ptrace.h       | 4 ++--
 arch/arm/kernel/hw_breakpoint.c     | 2 +-
 arch/arm/kernel/process.c           | 2 +-
 arch/arm/mm/alignment.c             | 2 +-
 arch/arm/mm/fault.c                 | 2 +-
 arch/arm64/include/asm/daifflags.h  | 2 +-
 arch/arm64/include/asm/ptrace.h     | 4 ++--
 arch/arm64/include/asm/xen/events.h | 2 +-
 arch/arm64/kernel/acpi.c            | 2 +-
 arch/arm64/kernel/debug-monitors.c  | 2 +-
 arch/arm64/kernel/entry-common.c    | 4 ++--
 arch/arm64/kernel/sdei.c            | 2 +-
 drivers/irqchip/irq-gic-v3.c        | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da0..2054b17b3a69 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -46,8 +46,8 @@ struct svc_pt_regs {
 #define processor_mode(regs) \
 	((regs)->ARM_cpsr & MODE_MASK)
 
-#define interrupts_enabled(regs) \
-	(!((regs)->ARM_cpsr & PSR_I_BIT))
+#define regs_irqs_disabled(regs) \
+	((regs)->ARM_cpsr & PSR_I_BIT)
 
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
index a12efd0f43e8..bc7c9f5a2767 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -947,7 +947,7 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
 
 	preempt_disable();
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	/* We only handle watchpoints and hardware breakpoints. */
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index e16ed102960c..5979a5cec2d0 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -167,7 +167,7 @@ void __show_regs(struct pt_regs *regs)
 			segment = "user";
 
 		printk("Flags: %s  IRQs o%s  FIQs o%s  Mode %s  ISA %s  Segment %s\n",
-			buf, interrupts_enabled(regs) ? "n" : "ff",
+			buf, !regs_irqs_disabled(regs) ? "n" : "ff",
 			fast_interrupts_enabled(regs) ? "n" : "ff",
 			processor_modes[processor_mode(regs)],
 			isa_modes[isa_mode(regs)], segment);
diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index 3c6ddb1afdc4..642aae48a09e 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -809,7 +809,7 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	int thumb2_32b = 0;
 	int fault;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	instrptr = instruction_pointer(regs);
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..dd8e95fcce10 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -275,7 +275,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 
 	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	/*
diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index fbb5c99eb2f9..5fca48009043 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -128,7 +128,7 @@ static inline void local_daif_inherit(struct pt_regs *regs)
 {
 	unsigned long flags = regs->pstate & DAIF_MASK;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		trace_hardirqs_on();
 
 	if (system_uses_irq_prio_masking())
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 47ff8654c5ec..3e5372a98da4 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -214,8 +214,8 @@ static inline void forget_syscall(struct pt_regs *regs)
 		(regs)->pmr == GIC_PRIO_IRQON :				\
 		true)
 
-#define interrupts_enabled(regs)			\
-	(!((regs)->pstate & PSR_I_BIT) && irqs_priority_unmasked(regs))
+#define regs_irqs_disabled(regs)			\
+	(((regs)->pstate & PSR_I_BIT) || (!irqs_priority_unmasked(regs)))
 
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->pstate & PSR_F_BIT))
diff --git a/arch/arm64/include/asm/xen/events.h b/arch/arm64/include/asm/xen/events.h
index 2788e95d0ff0..2977b5fe068d 100644
--- a/arch/arm64/include/asm/xen/events.h
+++ b/arch/arm64/include/asm/xen/events.h
@@ -14,7 +14,7 @@ enum ipi_vector {
 
 static inline int xen_irqs_disabled(struct pt_regs *regs)
 {
-	return !interrupts_enabled(regs);
+	return regs_irqs_disabled(regs);
 }
 
 #define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index e6f66491fbe9..732f89daae23 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -403,7 +403,7 @@ int apei_claim_sea(struct pt_regs *regs)
 	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
 
 	if (regs)
-		return_to_irqs_enabled = interrupts_enabled(regs);
+		return_to_irqs_enabled = !regs_irqs_disabled(regs);
 
 	/*
 	 * SEA can interrupt SError, mask it and describe this as an NMI so
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index c60a4a90c6a5..5497df05dd1a 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -231,7 +231,7 @@ static void send_user_sigtrap(int si_code)
 	if (WARN_ON(!user_mode(regs)))
 		return;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	arm64_force_sig_fault(SIGTRAP, si_code, instruction_pointer(regs),
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..c547e70428d3 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -73,7 +73,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
 {
 	lockdep_assert_irqs_disabled();
 
-	if (interrupts_enabled(regs)) {
+	if (!regs_irqs_disabled(regs)) {
 		if (regs->exit_rcu) {
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
@@ -569,7 +569,7 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
 {
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
-	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
+	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
 		__el1_pnmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 255d12f881c2..27a17da635d8 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -247,7 +247,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * If we interrupted the kernel with interrupts masked, we always go
 	 * back to wherever we came from.
 	 */
-	if (mode == kernel_mode && !interrupts_enabled(regs))
+	if (mode == kernel_mode && regs_irqs_disabled(regs))
 		return SDEI_EV_HANDLED;
 
 	/*
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index ce87205e3e82..5c832c436bd8 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -932,7 +932,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
+	if (unlikely(gic_supports_nmi() && regs_irqs_disabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
-- 
2.34.1


