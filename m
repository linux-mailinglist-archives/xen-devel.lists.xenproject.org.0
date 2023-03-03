Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA96A9C40
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 17:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506120.779142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8cm-0007LT-Ph; Fri, 03 Mar 2023 16:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506120.779142; Fri, 03 Mar 2023 16:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8cm-0007Jl-Lp; Fri, 03 Mar 2023 16:51:16 +0000
Received: by outflank-mailman (input) for mailman id 506120;
 Fri, 03 Mar 2023 16:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sLK=63=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pY8ck-0007JZ-La
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 16:51:14 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f0ddf6-b9e3-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 17:51:10 +0100 (CET)
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
X-Inumbo-ID: 98f0ddf6-b9e3-11ed-a550-8520e6686977
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1677862268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCS5hIdhQ/pAZpFIVJv+pjgtuwW4Rx08qL2IpzATkGM=;
	b=KaMNsXup67ZJ5L6cfCqybYJIkRPMKpTUyWXciNoKSm6kS+hVZcXJYvJPOCaYt1ToRd40n0
	gZSYGr0NY1qHHUhu44gQuK3FVrpugn15w6bvKAA307IX1PY/1YUuE11xcPy0RATnUs6764
	QBet9XTmyu6+HoZwkqTPRrgc1hSqpgSbUFuGX1SJc1uciKJ8SNVMy6d4vd6bnyDM4ehWnA
	+YIzt0DfUoeY6cWvLps0OXSiJ6C8oWyxuSHUWQiJBLp2akwlNDJA+OmzfJS8WsvyXZTyAF
	b+Zcm7RD80raqOBvNDwJSIMHr2y4HFnbGHgG/DhA9KbNMiibjbi8JXpEYryg5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1677862268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCS5hIdhQ/pAZpFIVJv+pjgtuwW4Rx08qL2IpzATkGM=;
	b=tZJ7DqGRn2+9ZabE+VBU8JCaMcvdWQW8bIJ1AoDS7Wq9p+yJNEbnCc/v5pEVf8h9SQAgRo
	K0wp09n9IH3vYnAg==
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IRQ affinity not working on Xen pci-platform device
In-Reply-To: <07866eaf6354dd43d87cffb6eebf101716845b66.camel@infradead.org>
References: <07866eaf6354dd43d87cffb6eebf101716845b66.camel@infradead.org>
Date: Fri, 03 Mar 2023 17:51:07 +0100
Message-ID: <87fsalkcck.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

David!

On Fri, Mar 03 2023 at 15:16, David Woodhouse wrote:
> I added the 'xen_no_vector_callback' kernel parameter a while back
> (commit b36b0fe96af) to ensure we could test that more for Linux
> guests.
>
> Most of my testing at the time was done with just two CPUs, and I
> happened to just test it with four. It fails, because the IRQ isn't
> actually affine to CPU0.
>
> I tried making it work anyway (in line with the comment in platform-
> pci.c which says that it shouldn't matter if it *runs* on CPU0 as long
> as it processes events *for* CPU0). That didn't seem to work.
>
> If I put the irq_set_affinity() call *before* the request_irq() that
> does actually work. But it's setting affinity on an IRQ it doesn't even
> own yet.

The core allows it for raisins. See below... :)

> Test hacks below; this is testable with today's QEMU master (yay!) and:
>
>   qemu-system-x86_64 -display none -serial mon:stdio -smp 4 \
>      -accel kvm,xen-version=0x4000a,kernel-irqchip=split \
>      -kernel ~/git/linux/arch/x86/boot//bzImage \
>      -append "console=ttyS0,115200 xen_no_vector_callback"
>
> ...
>
> [    0.577173] ACPI: \_SB_.LNKC: Enabled at IRQ 11
> [    0.578149] The affinity mask was 0-3
> [    0.579081] The affinity mask is 0-3 and the handler is on 2
> [    0.580288] The affinity mask is 0 and the handler is on 2

What happens is that once the interrupt is requested, the affinity
setting is deferred to the first interrupt. See the marvelous dance in
arch/x86/kernel/apic/msi.c::msi_set_affinity().

If you do the setting before request_irq() then the startup will assign
it to the target mask right away.

Btw, you are using irq_get_affinity_mask(), which gives you the desired
target mask. irq_get_effective_affinity_mask() gives you the real one.

Can you verify that the thing moves over after the first interrupt or is
that too late already?

Thanks,

        tglx

