Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE827A33FBF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887454.1296990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYqi-0002N5-DI; Thu, 13 Feb 2025 13:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887454.1296990; Thu, 13 Feb 2025 13:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYqi-0002ID-5a; Thu, 13 Feb 2025 13:01:48 +0000
Received: by outflank-mailman (input) for mailman id 887454;
 Thu, 13 Feb 2025 13:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLs0=VE=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1tiYqg-0000vx-VE
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:01:46 +0000
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac501482-ea0a-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 14:01:44 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YtwLq73fsz20qN4;
 Thu, 13 Feb 2025 21:02:11 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 4DDA01A016C;
 Thu, 13 Feb 2025 21:01:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Feb
 2025 21:01:40 +0800
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
X-Inumbo-ID: ac501482-ea0a-11ef-a075-877d107080fb
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <aliceryhl@google.com>,
	<ojeda@kernel.org>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mark.rutland@arm.com>, <puranjay@kernel.org>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <sudeep.holla@arm.com>, <guohanjun@huawei.com>,
	<prarit@redhat.com>, <liuwei09@cestc.cn>, <Jonathan.Cameron@huawei.com>,
	<dwmw@amazon.co.uk>, <kristina.martsenko@arm.com>, <liaochang1@huawei.com>,
	<ptosi@google.com>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<Dave.Martin@arm.com>, <joey.gouly@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 7/8] arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
Date: Thu, 13 Feb 2025 21:00:06 +0800
Message-ID: <20250213130007.1418890-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)

The arm64 entry code only preempts a kernel context upon a return from
a regular IRQ exception. The generic entry code may preempt a kernel
context for any exception return where irqentry_exit() is used, and so
may preempt other exceptions such as faults.

In preparation for moving arm64 over to the generic entry code, align
arm64 with the generic behaviour by calling
arm64_preempt_schedule_irq() from exit_to_kernel_mode(). To make this
possible, arm64_preempt_schedule_irq()
and dynamic/raw_irqentry_exit_cond_resched() are moved earlier in
the file, with no changes.

As Mark pointed out, this change will have the following 2 key impact:

- " We'll preempt even without taking a "real" interrupt. That
    shouldn't result in preemption that wasn't possible before,
    but it does change the probability of preempting at certain points,
    and might have a performance impact, so probably warrants a
    benchmark."

- " We will not preempt when taking interrupts from a region of kernel
    code where IRQs are enabled but RCU is not watching, matching the
    behaviour of the generic entry code.

    This has the potential to introduce livelock if we can ever have a
    screaming interrupt in such a region, so we'll need to go figure out
    whether that's actually a problem.

    Having this as a separate patch will make it easier to test/bisect
    for that specifically."

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- Update the commit message.
---
 arch/arm64/kernel/entry-common.c | 92 ++++++++++++++++----------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 1b4936d4cf6e..7056c584f59c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -75,6 +75,49 @@ static noinstr arm64_irqentry_state_t enter_from_kernel_mode(struct pt_regs *reg
 	return state;
 }
 
+static inline bool arm64_preempt_schedule_irq(void)
+{
+	/*
+	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * DAIF we must have handled an NMI, so skip preemption.
+	 */
+	if (system_uses_irq_prio_masking() && read_sysreg(daif))
+		return false;
+
+	/*
+	 * Preempting a task from an IRQ means we leave copies of PSTATE
+	 * on the stack. cpufeature's enable calls may modify PSTATE, but
+	 * resuming one of these preempted tasks would undo those changes.
+	 *
+	 * Only allow a task to be preempted once cpufeatures have been
+	 * enabled.
+	 */
+	if (!system_capabilities_finalized())
+		return false;
+
+	return true;
+}
+
+void raw_irqentry_exit_cond_resched(void)
+{
+	if (!preempt_count()) {
+		if (need_resched() && arm64_preempt_schedule_irq())
+			preempt_schedule_irq();
+	}
+}
+
+#ifdef CONFIG_PREEMPT_DYNAMIC
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+void dynamic_irqentry_exit_cond_resched(void)
+{
+	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
+		return;
+	raw_irqentry_exit_cond_resched();
+}
+#endif
+
 /*
  * Handle IRQ/context state management when exiting to kernel mode.
  * After this function returns it is not safe to call regular kernel code,
@@ -97,6 +140,9 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
 			return;
 		}
 
+		if (IS_ENABLED(CONFIG_PREEMPTION))
+			irqentry_exit_cond_resched();
+
 		trace_hardirqs_on();
 	} else {
 		if (state.exit_rcu)
@@ -281,31 +327,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
 		lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
-static inline bool arm64_preempt_schedule_irq(void)
-{
-	/*
-	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-	 * DAIF we must have handled an NMI, so skip preemption.
-	 */
-	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return false;
-
-	/*
-	 * Preempting a task from an IRQ means we leave copies of PSTATE
-	 * on the stack. cpufeature's enable calls may modify PSTATE, but
-	 * resuming one of these preempted tasks would undo those changes.
-	 *
-	 * Only allow a task to be preempted once cpufeatures have been
-	 * enabled.
-	 */
-	if (!system_capabilities_finalized())
-		return false;
-
-	return true;
-}
-
 static void do_interrupt_handler(struct pt_regs *regs,
 				 void (*handler)(struct pt_regs *))
 {
@@ -565,24 +586,6 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 	arm64_exit_nmi(regs, state);
 }
 
-void raw_irqentry_exit_cond_resched(void)
-{
-	if (!preempt_count()) {
-		if (need_resched() && arm64_preempt_schedule_irq())
-			preempt_schedule_irq();
-	}
-}
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-		return;
-	raw_irqentry_exit_cond_resched();
-}
-#endif
-
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
@@ -592,9 +595,6 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
-
 	exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
-- 
2.34.1


