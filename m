Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A994AA87B9B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949438.1345974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Fsk-00044r-T5; Mon, 14 Apr 2025 09:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949438.1345974; Mon, 14 Apr 2025 09:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Fsk-00042E-Q4; Mon, 14 Apr 2025 09:13:34 +0000
Received: by outflank-mailman (input) for mailman id 949438;
 Mon, 14 Apr 2025 09:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALkD=XA=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1u4Fsj-000428-DF
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:13:33 +0000
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f127c8-1910-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:13:28 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZbhR32MCFz1j5vR;
 Mon, 14 Apr 2025 17:13:19 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id CEA761A016C;
 Mon, 14 Apr 2025 17:13:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 14 Apr 2025 17:13:21 +0800
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
X-Inumbo-ID: b8f127c8-1910-11f0-9eae-5ba50f476ded
Message-ID: <f090fcbf-5593-2e37-efc7-3ec14990ab27@huawei.com>
Date: Mon, 14 Apr 2025 17:13:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v6 0/8] arm64: entry: Convert to generic irq entry
Content-Language: en-US
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
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2025/2/13 20:59, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*. The generic
> entry makes maintainers' work easier and codes more elegant, which will
> make PREEMPT_DYNAMIC and PREEMPT_LAZY available and remove a lot of
> duplicate code.
> 
> This patch series split the generic entry into generic irq entry and
> generic syscall entry first, and then convert arm64 to use the generic
> irq entry. arm64 will be completely converted to generic entry in another
> patch series.
> 
> The main convert steps are as follows:
> - Split generic entry into generic irq entry and generic syscall to
>   make the single patch more concentrated in switching to one thing.
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Switch to generic irq entry.

Gentle Ping.

> 
> Changes in v6:
> - Rebased on 6.14 rc2 next.
> - Put the syscall bits aside and split it out.
> - Have the split patch before the arm64 changes.
> - Merge some tightly coupled patches.
> - Adjust the order of some patches to make them more reasonable.
> - Define regs_irqs_disabled() by inline function.
> - Define interrupts_enabled() in terms of regs_irqs_disabled().
> - Delete the fast_interrupts_enabled() macro.
> - irqentry_state_t -> arm64_irqentry_state_t.
> - Remove arch_exit_to_user_mode_prepare() and pull local_daif_mask() later
>   in the arm64 exit sequence
> - Update the commit message.
> 
> Changes in v5:
> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> - Update "irqentry_state_t ret/irq_state" to "state"
>   to keep it consistently.
> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>   the generic entry.
> - Also refactor the ARM64 syscall code.
> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>   arch_pre/post_report_syscall_entry/exit() to simplify code.
> - Make the syscall patches clear separation.
> - Update the commit message.
> 
> Changes in v4:
> - Rework/cleanup split into a few patches as Mark suggested.
> - Replace interrupts_enabled() macro with regs_irqs_disabled(), instead
>   of left it here.
> - Remove rcu and lockdep state in pt_regs by using temporary
>   irqentry_state_t as Mark suggested.
> - Remove some unnecessary intermediate functions to make it clear.
> - Rework preempt irq and PREEMPT_DYNAMIC code
>   to make the switch more clear.
> - arch_prepare_*_entry/exit() -> arch_pre_*_entry/exit().
> - Expand the arch functions comment.
> - Make arch functions closer to its caller.
> - Declare saved_reg in for block.
> - Remove arch_exit_to_kernel_mode_prepare(), arch_enter_from_kernel_mode().
> - Adjust "Add few arch functions to use generic entry" patch to be
>   the penultimate.
> - Update the commit message.
> - Add suggested-by.
> 
> Changes in v3:
> - Test the MTE test cases.
> - Handle forget_syscall() in arch_post_report_syscall_entry()
> - Make the arch funcs not use __weak as Thomas suggested, so move
>   the arch funcs to entry-common.h, and make arch_forget_syscall() folded
>   in arch_post_report_syscall_entry() as suggested.
> - Move report_single_step() to thread_info.h for arm64
> - Change __always_inline() to inline, add inline for the other arch funcs.
> - Remove unused signal.h for entry-common.h.
> - Add Suggested-by.
> - Update the commit message.
> 
> Changes in v2:
> - Add tested-by.
> - Fix a bug that not call arch_post_report_syscall_entry() in
>   syscall_trace_enter() if ptrace_report_syscall_entry() return not zero.
> - Refactor report_syscall().
> - Add comment for arch_prepare_report_syscall_exit().
> - Adjust entry-common.h header file inclusion to alphabetical order.
> - Update the commit message.
> 
> Jinjie Ruan (8):
>   entry: Split generic entry into generic exception and syscall entry
>   arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
>   arm64: entry: Refactor the entry and exit for exceptions from EL1
>   arm64: entry: Rework arm64_preempt_schedule_irq()
>   arm64: entry: Use preempt_count() and need_resched() helper
>   arm64: entry: Refactor preempt_schedule_irq() check code
>   arm64: entry: Move arm64_preempt_schedule_irq() into
>     __exit_to_kernel_mode()
>   arm64: entry: Switch to generic IRQ entry
> 
>  MAINTAINERS                           |   1 +
>  arch/Kconfig                          |   9 +
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/include/asm/daifflags.h    |   2 +-
>  arch/arm64/include/asm/entry-common.h |  56 ++++
>  arch/arm64/include/asm/preempt.h      |   2 -
>  arch/arm64/include/asm/ptrace.h       |  13 +-
>  arch/arm64/include/asm/xen/events.h   |   2 +-
>  arch/arm64/kernel/acpi.c              |   2 +-
>  arch/arm64/kernel/debug-monitors.c    |   2 +-
>  arch/arm64/kernel/entry-common.c      | 378 ++++++++-----------------
>  arch/arm64/kernel/sdei.c              |   2 +-
>  arch/arm64/kernel/signal.c            |   3 +-
>  include/linux/entry-common.h          | 382 +------------------------
>  include/linux/irq-entry-common.h      | 389 ++++++++++++++++++++++++++
>  kernel/entry/Makefile                 |   3 +-
>  kernel/entry/common.c                 | 176 ++----------
>  kernel/entry/syscall-common.c         | 159 +++++++++++
>  kernel/sched/core.c                   |   8 +-
>  19 files changed, 766 insertions(+), 824 deletions(-)
>  create mode 100644 arch/arm64/include/asm/entry-common.h
>  create mode 100644 include/linux/irq-entry-common.h
>  create mode 100644 kernel/entry/syscall-common.c
> 

