Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF929B4C00
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827448.1242053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5n4Y-0006YA-HF; Tue, 29 Oct 2024 14:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827448.1242053; Tue, 29 Oct 2024 14:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5n4Y-0006WL-Ef; Tue, 29 Oct 2024 14:19:50 +0000
Received: by outflank-mailman (input) for mailman id 827448;
 Tue, 29 Oct 2024 14:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fT=RZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1t5n4X-0006W1-MX
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:19:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d8747fc6-9600-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 15:19:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10CF016A3;
 Tue, 29 Oct 2024 07:20:14 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6EF73F528;
 Tue, 29 Oct 2024 07:19:35 -0700 (PDT)
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
X-Inumbo-ID: d8747fc6-9600-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ4NzQ3ZmM2LTk2MDAtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjExNTg1LjUyOTM3NSwic2VuZGVyIjoibWFyay5ydXRsYW5kQGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
Date: Tue, 29 Oct 2024 14:19:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, linux@armlinux.org.uk, will@kernel.org,
	catalin.marinas@arm.com, sstabellini@kernel.org, maz@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	kees@kernel.org, wad@chromium.org, akpm@linux-foundation.org,
	samitolvanen@google.com, arnd@arndb.de, ojeda@kernel.org,
	rppt@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	samuel.holland@sifive.com, paulmck@kernel.org, aquini@redhat.com,
	petr.pavlu@suse.com, viro@zeniv.linux.org.uk,
	rmk+kernel@armlinux.org.uk, ardb@kernel.org,
	wangkefeng.wang@huawei.com, surenb@google.com,
	linus.walleij@linaro.org, yangyj.ee@gmail.com, broonie@kernel.org,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	Jonathan.Cameron@huawei.com, prarit@redhat.com, liuwei09@cestc.cn,
	dwmw@amazon.co.uk, oliver.upton@linux.dev,
	kristina.martsenko@arm.com, ptosi@google.com, frederic@kernel.org,
	vschneid@redhat.com, thiago.bauermann@linaro.org,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v4 01/19] arm64: ptrace: Replace
 interrupts_enabled() with regs_irqs_disabled()
Message-ID: <ZyDu9XHNmxMHBMSI@J2N7QTR9R3.cambridge.arm.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-2-ruanjinjie@huawei.com>

On Fri, Oct 25, 2024 at 06:06:42PM +0800, Jinjie Ruan wrote:
> Implement regs_irqs_disabled(), and replace interrupts_enabled() macro
> with regs_irqs_disabled() all over the place.
> 
> No functional changes.
> 

Please say why, e.g.

| The generic entry code expects architecture code to provide
| regs_irqs_disabled(regs), but arm64 does not have this and provides
| interrupts_enabled(regs), which has the opposite polarity.
| 
| In preparation for moving arm64 over to the generic entry code,
| replace arm64's interrupts_enabled() with regs_irqs_disabled() and
| update its callers under arch/arm64.
|
| For the moment, a definition of interrupts_enabled() is provided for
| the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
| can be removed.

> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

[...]

>  arch/arm/include/asm/ptrace.h       | 4 ++--
>  arch/arm/kernel/hw_breakpoint.c     | 2 +-
>  arch/arm/kernel/process.c           | 2 +-
>  arch/arm/mm/alignment.c             | 2 +-
>  arch/arm/mm/fault.c                 | 2 +-

>  drivers/irqchip/irq-gic-v3.c        | 2 +-

I hadn't realised that the GICv3 driver was using this and hence we'd
need to update a few places in arch/arm at the same time. Please update
just the arch/arm64 bits, and add:

| /* 
|  * Used by the GICv3 driver, can be removed once arch/arm implements
|  * regs_irqs_disabled() directly.
|  */
| #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))

... and then once 32-bit arm implements this we can update the GIC
driver and remove the architecture definitions.

That way we avoid the risk of conflicts with 32-bit arm.

Mark.

