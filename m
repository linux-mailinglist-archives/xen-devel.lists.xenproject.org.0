Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299CD9AFF94
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825839.1240160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFQ-00011X-3n; Fri, 25 Oct 2024 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825839.1240160; Fri, 25 Oct 2024 10:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFP-0000vj-Ue; Fri, 25 Oct 2024 10:08:47 +0000
Received: by outflank-mailman (input) for mailman id 825839;
 Fri, 25 Oct 2024 10:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFO-0000tn-FB
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:46 +0000
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 189920a6-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:42 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XZdlr5qryz1yndH;
 Fri, 25 Oct 2024 18:08:40 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 21B291402E1;
 Fri, 25 Oct 2024 18:08:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:31 +0800
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
X-Inumbo-ID: 189920a6-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 00/19] arm64: entry: Convert to generic entry
Date: Fri, 25 Oct 2024 18:06:41 +0800
Message-ID: <20241025100700.3714552-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
to use the generic entry infrastructure from kernel/entry/*. The generic
entry makes maintainers' work easier and codes more elegant, which aslo
removed a lot of duplicate code.

The patch 1 ~ 5 try to make arm64 easier to use irqentry_enter/exit().
The patch 6 ~ 13 and patch 15 try to make it closer to the PREEMPT_DYNAMIC
code of generic entry. And the patch 16 split the generic entry into
generic irq entry and generic syscall to make the single patch more
concentrated in switching to one thing.

Changes in v4:
- Rework/cleanup split into a few patches as Mark suggested.
- Replace interrupts_enabled() macro with regs_irqs_disabled(), instead
  of left it here.
- Remove rcu and lockdep state in pt_regs by using temporary
  irqentry_state_t as Mark suggested.
- Remove some unnecessary intermediate functions to make it clear.
- Rework preempt irq and PREEMPT_DYNAMIC code
  to make the switch more clear.
- arch_prepare_*_entry/exit() -> arch_pre_*_entry/exit().
- Expand the arch functions comment.
- Make arch functions closer to its caller.
- Declare saved_reg in for block.
- Remove arch_exit_to_kernel_mode_prepare(), arch_enter_from_kernel_mode().
- Adjust "Add few arch functions to use generic entry" patch to be
  the penultimate.
- Update the commit message.
- Add suggested-by.

Changes in v3:
- Test the MTE test cases.
- Handle forget_syscall() in arch_post_report_syscall_entry()
- Make the arch funcs not use __weak as Thomas suggested, so move
  the arch funcs to entry-common.h, and make arch_forget_syscall() folded
  in arch_post_report_syscall_entry() as suggested.
- Move report_single_step() to thread_info.h for arm64
- Change __always_inline() to inline, add inline for the other arch funcs.
- Remove unused signal.h for entry-common.h.
- Add Suggested-by.
- Update the commit message.

Changes in v2:
- Add tested-by.
- Fix a bug that not call arch_post_report_syscall_entry() in
  syscall_trace_enter() if ptrace_report_syscall_entry() return not zero.
- Refactor report_syscall().
- Add comment for arch_prepare_report_syscall_exit().
- Adjust entry-common.h header file inclusion to alphabetical order.
- Update the commit message.

Jinjie Ruan (19):
  arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
  arm64: entry: Refactor the entry and exit for exceptions from EL1
  arm64: entry: Remove __enter_from_user_mode()
  arm64: entry: Remove __enter_from_kernel_mode()
  arm64: entry: Remove __exit_to_kernel_mode()
  arm64: entry: Move arm64_preempt_schedule_irq() into
    exit_to_kernel_mode()
  arm64: entry: Call arm64_preempt_schedule_irq() only if irqs enabled
  arm64: entry: Rework arm64_preempt_schedule_irq()
  arm64: entry: Use preempt_count() and need_resched() helper
  arm64: entry: preempt_schedule_irq() only if PREEMPTION enabled
  arm64: entry: Extract raw_irqentry_exit_cond_resched() function
  arm64: entry: Check dynamic key ahead
  arm64: entry: Check dynamic resched when PREEMPT_DYNAMIC enabled
  entry: Split into irq entry and syscall
  entry: Add arch irqentry_exit_need_resched() for arm64
  arm64: entry: Switch to generic IRQ entry
  entry: Add syscall arch functions to use generic syscall for arm64
  arm64/ptrace: Split report_syscall() into separate enter and exit
    functions
  arm64: entry: Convert to generic entry

 MAINTAINERS                           |   1 +
 arch/Kconfig                          |   8 +
 arch/arm/include/asm/ptrace.h         |   4 +-
 arch/arm/kernel/hw_breakpoint.c       |   2 +-
 arch/arm/kernel/process.c             |   2 +-
 arch/arm/mm/alignment.c               |   2 +-
 arch/arm/mm/fault.c                   |   2 +-
 arch/arm64/Kconfig                    |   1 +
 arch/arm64/include/asm/daifflags.h    |   2 +-
 arch/arm64/include/asm/entry-common.h | 149 ++++++++++
 arch/arm64/include/asm/preempt.h      |   2 -
 arch/arm64/include/asm/ptrace.h       |   8 +-
 arch/arm64/include/asm/syscall.h      |   6 +-
 arch/arm64/include/asm/thread_info.h  |  23 +-
 arch/arm64/include/asm/xen/events.h   |   2 +-
 arch/arm64/kernel/acpi.c              |   2 +-
 arch/arm64/kernel/debug-monitors.c    |   2 +-
 arch/arm64/kernel/entry-common.c      | 381 +++++++------------------
 arch/arm64/kernel/ptrace.c            |  90 ------
 arch/arm64/kernel/sdei.c              |   2 +-
 arch/arm64/kernel/signal.c            |   3 +-
 arch/arm64/kernel/syscall.c           |  18 +-
 drivers/irqchip/irq-gic-v3.c          |   2 +-
 include/linux/entry-common.h          | 377 +-----------------------
 include/linux/irq-entry-common.h      | 393 ++++++++++++++++++++++++++
 include/linux/thread_info.h           |  13 +
 kernel/entry/Makefile                 |   3 +-
 kernel/entry/common.c                 | 175 ++----------
 kernel/entry/syscall-common.c         | 237 ++++++++++++++++
 29 files changed, 962 insertions(+), 950 deletions(-)
 create mode 100644 arch/arm64/include/asm/entry-common.h
 create mode 100644 include/linux/irq-entry-common.h
 create mode 100644 kernel/entry/syscall-common.c

-- 
2.34.1


