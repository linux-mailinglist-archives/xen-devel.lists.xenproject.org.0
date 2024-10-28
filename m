Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C79B3D95
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 23:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826993.1241461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Y1X-0005nk-1W; Mon, 28 Oct 2024 22:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826993.1241461; Mon, 28 Oct 2024 22:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Y1W-0005kh-V5; Mon, 28 Oct 2024 22:15:42 +0000
Received: by outflank-mailman (input) for mailman id 826993;
 Mon, 28 Oct 2024 22:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAPk=RY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1t5Y1W-0005kZ-49
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 22:15:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 299bf50b-957a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 23:15:39 +0100 (CET)
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
X-Inumbo-ID: 299bf50b-957a-11ef-99a3-01e77a169b0f
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730153737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CID8ZNB+XW4905MFNNwwhdwsOvxIuKrRJow3yEUZR2M=;
	b=QY4vNt4iAGCUZRzWovAdCiui7vsoPYwi/xZKv7PXv4v0XCP8Qnx4vxs7KJ3HFoecIxn1CW
	NUKDA5eSAmqBAR0o8vLKp2+2tWJgZKjJkTulj1cYCkfZ6hRNsc/q8PLM14lRs34A4FgJ6o
	OBCP63Vnd3kIazzewtdGd3C7ujM2Jsewo4JBu26qiCNUjbvkPnWTFRvtI7aYgnkboto8oN
	wO0NYpPGQF4YYSvKp5R7iJD8kTsyKahmx+NPQyHMlKJBAismayUFBKPvS6bk4GJbpkgzGO
	3+PsGddte9PQh2d3m4tuuAZ+D2IbCraEdMith0qbujFqEy3EHrjDu54yp1XEvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730153737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CID8ZNB+XW4905MFNNwwhdwsOvxIuKrRJow3yEUZR2M=;
	b=qQQ6M7hLkM2YLw5YbR1J9vnrJIbphOprh2UrWttSDz0CQ2QvICqD7YtI6DbSvB7utjHNDt
	B/aXNiWb5CLThFDg==
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
In-Reply-To: <878qu82je2.ffs@tglx>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-16-ruanjinjie@huawei.com> <878qu82je2.ffs@tglx>
Date: Mon, 28 Oct 2024 23:15:37 +0100
Message-ID: <87ldy727sm.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 28 2024 at 19:05, Thomas Gleixner wrote:

> On Fri, Oct 25 2024 at 18:06, Jinjie Ruan wrote:
>
>> As the front patch 6 ~ 13 did, the arm64_preempt_schedule_irq() is
>
> Once this series is applied nobody knows what 'front patch 6 ~ 13' did.
>
>> same with the irq preempt schedule code of generic entry besides those
>> architecture-related logic called arm64_irqentry_exit_need_resched().
>>
>> So add arch irqentry_exit_need_resched() to support architecture-related
>> need_resched() check logic, which do not affect existing architectures
>> that use generic entry, but support arm64 to use generic irq entry.
>
> Simply say:
>
>  ARM64 requires an additional whether to reschedule on return from

  ARM64 requires an additional check whether to reschedule on return from

obviously...

>  interrupt.
>
>  Add arch_irqentry_exit_need_resched() as the default NOOP
>  implementation and hook it up into the need_resched() condition in
>  raw_irqentry_exit_cond_resched().
>
>  This allows ARM64 to implement the architecture specific version for
>  switchting over to the generic entry code.
>
> That explains things completely independently. Hmm?
>
> Thanks,
>
>         tglx

