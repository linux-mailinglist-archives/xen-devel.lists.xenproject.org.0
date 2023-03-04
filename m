Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EB6AA639
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 01:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506276.779427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFlA-00088f-Vj; Sat, 04 Mar 2023 00:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506276.779427; Sat, 04 Mar 2023 00:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFlA-000868-T0; Sat, 04 Mar 2023 00:28:24 +0000
Received: by outflank-mailman (input) for mailman id 506276;
 Sat, 04 Mar 2023 00:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j766=64=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pYFl9-000862-44
 for xen-devel@lists.xenproject.org; Sat, 04 Mar 2023 00:28:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7686a2e8-ba23-11ed-96b0-2f268f93b82a;
 Sat, 04 Mar 2023 01:28:21 +0100 (CET)
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
X-Inumbo-ID: 7686a2e8-ba23-11ed-96b0-2f268f93b82a
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1677889698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/FC/UQmlqseWhfDNlw3KINn/RGKWtZAvczLpBONhlE=;
	b=pqYwVhy7BgbDiw1L0yaduE3wKzUCMDsN3ZNX3OjSCcDgTdWF1FlK/m8o2fTWyWQAfh7Ezm
	JmKQDTxwomWXlxGtTY4iOR0Z1O/Vr7abL6htP88+P19OOVP/87b1IjD6V2PYnfFhTTncqV
	j0w5GRujKdtB78+LM4TweRIlk9grUx4KrNNP0h/uviy7M8461abD4ARDbJbjrbSmdrFg29
	1alYcODBvyvRn3xNXOFegwZWuDSe1LpzHFGidrAStEwc7vGdYJyNo0W1hIXGUQbO3+/hrs
	i3IkKQYOc45z1t/8izAOVRRkN4QBvma7YhzejbAhO3esQuYGaUE3s1xdSw7PHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1677889698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/FC/UQmlqseWhfDNlw3KINn/RGKWtZAvczLpBONhlE=;
	b=LgbePq1cFz/NWvRrP+tUOrjS9F3eJuadoBjO97vw6SoMX4FQw5ca5VrX6vzH2/u5WuA4TI
	36dFZMkmqrgGDIBA==
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IRQ affinity not working on Xen pci-platform device
In-Reply-To: <1060e7786498f384634b01c335bf7bf43365e1fe.camel@infradead.org>
References: <07866eaf6354dd43d87cffb6eebf101716845b66.camel@infradead.org>
 <87fsalkcck.ffs@tglx>
 <1060e7786498f384634b01c335bf7bf43365e1fe.camel@infradead.org>
Date: Sat, 04 Mar 2023 01:28:17 +0100
Message-ID: <87356ljr6m.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David!

On Fri, Mar 03 2023 at 16:54, David Woodhouse wrote:
> On Fri, 2023-03-03 at 17:51 +0100, Thomas Gleixner wrote:
>> >=20
>> > [=C2=A0=C2=A0=C2=A0 0.577173] ACPI: \_SB_.LNKC: Enabled at IRQ 11
>> > [=C2=A0=C2=A0=C2=A0 0.578149] The affinity mask was 0-3
>> > [=C2=A0=C2=A0=C2=A0 0.579081] The affinity mask is 0-3 and the handler=
 is on 2
>> > [=C2=A0=C2=A0=C2=A0 0.580288] The affinity mask is 0 and the handler i=
s on 2
>>=20
>> What happens is that once the interrupt is requested, the affinity
>> setting is deferred to the first interrupt. See the marvelous dance in
>> arch/x86/kernel/apic/msi.c::msi_set_affinity().
>>=20
>> If you do the setting before request_irq() then the startup will assign
>> it to the target mask right away.
>>=20
>> Btw, you are using irq_get_affinity_mask(), which gives you the desired
>> target mask. irq_get_effective_affinity_mask() gives you the real one.
>>=20
>> Can you verify that the thing moves over after the first interrupt or is
>> that too late already?
>
> It doesn't seem to move. The hack to just return IRQ_NONE if invoked on
> CPU !=3D 0 was intended to do just that. It's a level-triggered interrupt
> so when the handler does nothing on the "wrong" CPU, it ought to get
> invoked again on the *correct* CPU and actually=C2=A0work that time.

So much for the theory. This is virt after all so it does not
necessarily behave like real hardware.

> But no, as the above logs show, it gets invoked twice *both* on CPU2.

Duh. I missed that. Can you instrument whether this ends up in in the
actual irq affinity setter function of the underlying irq chip at all?

> If I do the setting before request_irq() then it should assign it right
> away (unless that IRQ was already in use?

Correct.

> It's theoretically a shared PCI INTx line). But even then, that would
> mean I'm messing with affinity on an IRQ I haven't even requested yet
> and don't own?

Well, that's not any different from userspace changing the affinity of
an interrupt.

Thanks,

        tglx

