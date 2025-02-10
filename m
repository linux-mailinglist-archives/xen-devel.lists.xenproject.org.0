Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBBA2EC7B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 13:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884870.1294622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSvm-00028j-Sp; Mon, 10 Feb 2025 12:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884870.1294622; Mon, 10 Feb 2025 12:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSvm-00025T-Pp; Mon, 10 Feb 2025 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 884870;
 Mon, 10 Feb 2025 12:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thSvm-00025N-2U
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 12:30:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ce4a9b28-e7aa-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 13:30:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C461BA8;
 Mon, 10 Feb 2025 04:30:47 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A03C3F5A1;
 Mon, 10 Feb 2025 04:30:19 -0800 (PST)
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
X-Inumbo-ID: ce4a9b28-e7aa-11ef-b3ef-695165c68f79
Date: Mon, 10 Feb 2025 12:30:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Message-ID: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>

On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
> On 2024/12/6 18:17, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> > to use the generic entry infrastructure from kernel/entry/*. The generic
> > entry makes maintainers' work easier and codes more elegant, which aslo
> > removed a lot of duplicate code.
> > 
> > The main steps are as follows:
> > - Make arm64 easier to use irqentry_enter/exit().
> > - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> > - Split generic entry into generic irq entry and generic syscall to
> >   make the single patch more concentrated in switching to one thing.
> > - Switch to generic irq entry.
> > - Make arm64 closer to the generic syscall code.
> > - Switch to generic entry completely.
> > 
> > Changes in v5:
> > - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> > - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> > - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> > - Update "irqentry_state_t ret/irq_state" to "state"
> >   to keep it consistently.
> > - Use generic irq entry header for PREEMPT_DYNAMIC after split
> >   the generic entry.
> > - Also refactor the ARM64 syscall code.
> > - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
> >   arch_pre/post_report_syscall_entry/exit() to simplify code.
> > - Make the syscall patches clear separation.
> > - Update the commit message.
> 
> Gentle Ping.

I've left soem comments.

As I mentioned previously, I'd very much prefer that we do the syscall
entry logic changes *later* (i.e. as a follow-up patch series), after
we've got the irq/exception entry logic sorted.

I reckon we've got just enough time to get the irq/exception entry
changes ready this cycle, with another round or two of review. So can we
please put the syscall bits aside for now? ... that and run all the
tests you mention in patch 22 on the irq/exception entry changes alone.

Mark.

