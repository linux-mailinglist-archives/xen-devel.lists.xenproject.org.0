Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA89B3903
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 19:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826944.1241411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UMk-0008Qc-9I; Mon, 28 Oct 2024 18:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826944.1241411; Mon, 28 Oct 2024 18:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UMk-0008O9-6e; Mon, 28 Oct 2024 18:21:22 +0000
Received: by outflank-mailman (input) for mailman id 826944;
 Mon, 28 Oct 2024 18:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAPk=RY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1t5UMi-0008O3-Vw
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 18:21:20 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d972f53-9559-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 19:21:19 +0100 (CET)
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
X-Inumbo-ID: 6d972f53-9559-11ef-a0c2-8be0dac302b0
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730139678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NPZ/oE/jxd2dvWPtJO0B8LrMAkbDZ+sPnCIbA9yX4cA=;
	b=4LC+gBlWLRfuko+JhziqaBZ/VcVWCsQkVNJTMOq0loYqPV6nYyLqj6j+6qwD2iEQI0mw3/
	/ptTflJ4JI1HPJae2khCA0lJRFA/yPvA3Vlt27kdF23CJGZ0WoqHa5qMzJBtXSGi5nhQrI
	NlnM6XevoN9Ovus/n/d2i0EnI7Qr5peyFHk84qWXkv6KmhDMorQgaTeqiI+C+j/W24VmTR
	bosAmZ6gSyHxAGFJF/bsh7/xzLHsPrVnADZU6u/TPlAYI0BIuk24rh/7FwZoWt+tiC7N5h
	2G1mbmqdgCpyejLrhhzLzhIv0wxsHJMPIf7nW4chS0XIackJis3U88LeZVjcSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730139678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NPZ/oE/jxd2dvWPtJO0B8LrMAkbDZ+sPnCIbA9yX4cA=;
	b=x+PCIGk6KbxqRLchmf77kGxYSXBxero8zvfCc770ZFCeLxvoxmxl3om7Qr2zzc6fOqxGgR
	uTOGt2ecUuMH7uCw==
To: Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
 linux@armlinux.org.uk, will@kernel.org, mark.rutland@arm.com,
 catalin.marinas@arm.com, sstabellini@kernel.org, maz@kernel.org,
 peterz@infradead.org, luto@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, samitolvanen@google.com, arnd@arndb.de,
 ojeda@kernel.org, rppt@kernel.org, hca@linux.ibm.com,
 aliceryhl@google.com, samuel.holland@sifive.com, paulmck@kernel.org,
 aquini@redhat.com, petr.pavlu@suse.com, ruanjinjie@huawei.com,
 viro@zeniv.linux.org.uk, rmk+kernel@armlinux.org.uk, ardb@kernel.org,
 wangkefeng.wang@huawei.com, surenb@google.com, linus.walleij@linaro.org,
 yangyj.ee@gmail.com, broonie@kernel.org, mbenes@suse.cz,
 puranjay@kernel.org, pcc@google.com, guohanjun@huawei.com,
 sudeep.holla@arm.com, Jonathan.Cameron@huawei.com, prarit@redhat.com,
 liuwei09@cestc.cn, dwmw@amazon.co.uk, oliver.upton@linux.dev,
 kristina.martsenko@arm.com, ptosi@google.com, frederic@kernel.org,
 vschneid@redhat.com, thiago.bauermann@linaro.org, joey.gouly@arm.com,
 liuyuntao12@huawei.com, leobras@redhat.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v4 17/19] entry: Add syscall arch functions to use
 generic syscall for arm64
In-Reply-To: <20241025100700.3714552-18-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-18-ruanjinjie@huawei.com>
Date: Mon, 28 Oct 2024 19:21:18 +0100
Message-ID: <875xpc2in5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 25 2024 at 18:06, Jinjie Ruan wrote:

$Subject: Can you please make this simply:

    entry: Add arch_pre/post_report_syscall_entry/exit()

> Add some syscall arch functions to support arm64 to use generic syscall
> code, which do not affect existing architectures that use generic entry:
>
>  - arch_pre/post_report_syscall_entry/exit().

> Also make syscall_exit_work() not static and move report_single_step() to
> thread_info.h, which can be used by arm64 later.

This does way too many things which have nothing to do with the subject
line.

>  long syscall_trace_enter(struct pt_regs *regs, long syscall,
>  				unsigned long work)
>  {
> @@ -34,7 +77,9 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
>  
>  	/* Handle ptrace */
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
> +		unsigned long saved_reg = arch_pre_report_syscall_entry(regs);

Lacks a new line between declaration and code.

>  		ret = ptrace_report_syscall_entry(regs);
> +		arch_post_report_syscall_entry(regs, saved_reg, ret);

Though I'm not sure whether these pre/post hooks buy anything. It's
probably simpler to do:

-  		ret = ptrace_report_syscall_entry(regs);
+		ret = arch_ptrace_report_syscall_entry(regs);

And have the default implementation as

        return ptrace_report_syscall_entry(regs);

and let ARM64 implement it's magic around it in the architecture
header. The actual ptrace_report_syscall_entry() is simple enough to be
in both places. That reduces the inflation of architecture specific
helpers and keeps the code tidy.

Thanks,

        tglx





