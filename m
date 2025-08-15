Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECFDB2767E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 05:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082688.1442447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umkmU-0005LY-M6; Fri, 15 Aug 2025 03:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082688.1442447; Fri, 15 Aug 2025 03:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umkmU-00059Q-Ds; Fri, 15 Aug 2025 03:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1082688;
 Fri, 15 Aug 2025 03:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxBA=23=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1umkmS-00052A-B9
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 03:07:00 +0000
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14b0b92-7984-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 05:06:52 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c36VY1xNyz2dMNB;
 Fri, 15 Aug 2025 11:07:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id DD9C81800B2;
 Fri, 15 Aug 2025 11:06:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 Aug
 2025 11:06:43 +0800
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
X-Inumbo-ID: e14b0b92-7984-11f0-b898-0df219b8e170
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<mbenes@suse.cz>, <broonie@kernel.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>, <liaochang1@huawei.com>,
	<kristina.martsenko@arm.com>, <leitao@debian.org>, <ardb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 1/8] arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
Date: Fri, 15 Aug 2025 11:06:26 +0800
Message-ID: <20250815030633.448613-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)

The generic entry code expects architecture code to provide
regs_irqs_disabled(regs) function, but arm64 does not have this and
provides interrupts_enabled(regs), which has the opposite polarity.

In preparation for moving arm64 over to the generic entry code,
relace arm64's interrupts_enabled() with regs_irqs_disabled() and
update its callers under arch/arm64.

For the moment, a definition of interrupts_enabled() is provided for
the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
can be removed.

Delete the fast_interrupts_enabled() macro as it is unused and we
don't want any new users to show up.

No functional changes.

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/daifflags.h  | 2 +-
 arch/arm64/include/asm/ptrace.h     | 9 +++++----
 arch/arm64/include/asm/xen/events.h | 2 +-
 arch/arm64/kernel/acpi.c            | 2 +-
 arch/arm64/kernel/debug-monitors.c  | 2 +-
 arch/arm64/kernel/entry-common.c    | 4 ++--
 arch/arm64/kernel/sdei.c            | 2 +-
 7 files changed, 12 insertions(+), 11 deletions(-)

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
index 47ff8654c5ec..8b915d4a9d4b 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -214,11 +214,12 @@ static inline void forget_syscall(struct pt_regs *regs)
 		(regs)->pmr == GIC_PRIO_IRQON :				\
 		true)
 
-#define interrupts_enabled(regs)			\
-	(!((regs)->pstate & PSR_I_BIT) && irqs_priority_unmasked(regs))
+static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
+{
+	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
+}
 
-#define fast_interrupts_enabled(regs) \
-	(!((regs)->pstate & PSR_F_BIT))
+#define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
 
 static inline unsigned long user_stack_pointer(struct pt_regs *regs)
 {
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
index 4d529ff7ba51..3fbce0a9a0fe 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -407,7 +407,7 @@ int apei_claim_sea(struct pt_regs *regs)
 	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
 
 	if (regs)
-		return_to_irqs_enabled = interrupts_enabled(regs);
+		return_to_irqs_enabled = !regs_irqs_disabled(regs);
 
 	/*
 	 * SEA can interrupt SError, mask it and describe this as an NMI so
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 110d9ff54174..85fc162a6f9b 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -167,7 +167,7 @@ static void send_user_sigtrap(int si_code)
 	if (WARN_ON(!user_mode(regs)))
 		return;
 
-	if (interrupts_enabled(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 
 	arm64_force_sig_fault(SIGTRAP, si_code, instruction_pointer(regs),
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 2b0c5925502e..8e798f46ad28 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -74,7 +74,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
 {
 	lockdep_assert_irqs_disabled();
 
-	if (interrupts_enabled(regs)) {
+	if (!regs_irqs_disabled(regs)) {
 		if (regs->exit_rcu) {
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
@@ -662,7 +662,7 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
 {
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
-	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
+	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
 		__el1_pnmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 6f24a0251e18..95169f7b6531 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -243,7 +243,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * If we interrupted the kernel with interrupts masked, we always go
 	 * back to wherever we came from.
 	 */
-	if (mode == kernel_mode && !interrupts_enabled(regs))
+	if (mode == kernel_mode && regs_irqs_disabled(regs))
 		return SDEI_EV_HANDLED;
 
 	/*
-- 
2.34.1


