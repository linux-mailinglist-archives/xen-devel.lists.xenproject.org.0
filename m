Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC69B38B5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 19:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826933.1241392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5U78-0004Lp-PH; Mon, 28 Oct 2024 18:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826933.1241392; Mon, 28 Oct 2024 18:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5U78-0004KL-LY; Mon, 28 Oct 2024 18:05:14 +0000
Received: by outflank-mailman (input) for mailman id 826933;
 Mon, 28 Oct 2024 18:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAPk=RY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1t5U77-0004Jn-7O
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 18:05:13 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c6f61c9-9557-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 19:05:11 +0100 (CET)
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
X-Inumbo-ID: 2c6f61c9-9557-11ef-a0c2-8be0dac302b0
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730138709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3IDfOXFVv8kBd1AWaPkUULk3ghdxFNcDz4iKI1BeRtc=;
	b=Wqnz5mGb7wOtrf9nVF/4H2cqx3QmYeROhop48+HP4GxGtvpocb2uj7sdq2yFVnZ0q9F29U
	S+JlT7AO5CpAf2L5/XQgWa7vy8CwvL2ez68664dVHWmz4p7h1OIzQH4PD6qiHCm6sYppXq
	uFWFycKuH4BjHl0raEvghxhP6NtizoqCpMKn44SzdcZdUHk1XYSwf2zXtP5r7hBBPW/liA
	3yST+e+jmLJ17SHvFHgwCqTjCO7bPf5tLX1ThjGlRpTdbHRqI0m3IbHEEHTjE6YLUkOXyp
	4nPqYOMVhjxyoEe4OcupaaxSruikYjaCRWn+RiUUeaKIB81qxZ6PcG/HqJqZBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730138709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3IDfOXFVv8kBd1AWaPkUULk3ghdxFNcDz4iKI1BeRtc=;
	b=ILAs6NsCraYSC6mSWPKyHlbMSkWOol2nsWAsk/dQyIBpFI0D369S7UBifZ1p1UghPbvNKc
	Xvv8KS2I+za31LBg==
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
Subject: Re: [PATCH -next v4 15/19] entry: Add arch
 irqentry_exit_need_resched() for arm64
In-Reply-To: <20241025100700.3714552-16-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-16-ruanjinjie@huawei.com>
Date: Mon, 28 Oct 2024 19:05:09 +0100
Message-ID: <878qu82je2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 25 2024 at 18:06, Jinjie Ruan wrote:

> As the front patch 6 ~ 13 did, the arm64_preempt_schedule_irq() is

Once this series is applied nobody knows what 'front patch 6 ~ 13' did.

> same with the irq preempt schedule code of generic entry besides those
> architecture-related logic called arm64_irqentry_exit_need_resched().
>
> So add arch irqentry_exit_need_resched() to support architecture-related
> need_resched() check logic, which do not affect existing architectures
> that use generic entry, but support arm64 to use generic irq entry.

Simply say:

 ARM64 requires an additional whether to reschedule on return from
 interrupt.

 Add arch_irqentry_exit_need_resched() as the default NOOP
 implementation and hook it up into the need_resched() condition in
 raw_irqentry_exit_cond_resched().

 This allows ARM64 to implement the architecture specific version for
 switchting over to the generic entry code.

That explains things completely independently. Hmm?

Thanks,

        tglx


