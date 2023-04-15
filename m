Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A606E33BC
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 23:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521497.810218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnn4J-0000uo-5I; Sat, 15 Apr 2023 21:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521497.810218; Sat, 15 Apr 2023 21:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnn4J-0000sb-2S; Sat, 15 Apr 2023 21:04:23 +0000
Received: by outflank-mailman (input) for mailman id 521497;
 Sat, 15 Apr 2023 21:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ScAW=AG=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnn4H-0000sV-Jo
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 21:04:21 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16223bdf-dbd1-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 23:04:18 +0200 (CEST)
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
X-Inumbo-ID: 16223bdf-dbd1-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681592657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvzaDLok1TQ4UelYWBZG7isf5NmoEpMzY70xaWHq6tY=;
	b=fIS1RUsnFKdb9xABGYfFiZCU2J2QWZeug/pOhRzYO2SSFiN67M2BraQ6i1WFD37roLQsyb
	0Xo1pTWRYZ/WwMogkjjzj3I+bbwhVwR7hTC3ROy5wKT1EIYulJpr/cXNAdOvjkRz7uB3BI
	klyFr/vToH0lZCb+hb3VXX9pfB0N3D76XKagNMZKWitt63oRwb7aPaIvEhJSApLEK7ILRG
	Zkcr6A4WMIslSyduOboeP87v5gUiVRgVXC8mEjpP6oV0s0oxKgYk+mkzY1TMBc6xKWwYqj
	lHlMmqQccgQg7IW71Y5KizHByK/0ncSB7/Q2HObdyAE/q+s6MPivfs7vv6Bz9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681592657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvzaDLok1TQ4UelYWBZG7isf5NmoEpMzY70xaWHq6tY=;
	b=uGGpswhVFZB8lospVRZK/FCDeguM0Ticu2FJ7GXNrivH09zniqOSmq2BEICy2eBqNRVNGH
	0xJtAf6AVJyuuYBQ==
To: Brian Gerst <brgerst@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Arjan van
 de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>, Usama Arif
 <usama.arif@bytedance.com>, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 19/37] x86/smpboot: Switch to hotplug core state
 synchronization
In-Reply-To: <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.382005483@linutronix.de>
 <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
Date: Sat, 15 Apr 2023 23:04:16 +0200
Message-ID: <87pm84yi0f.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15 2023 at 08:58, Brian Gerst wrote:
> On Fri, Apr 14, 2023 at 7:44=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>>         pr_debug("Before bogomips\n");
>> -       for_each_possible_cpu(cpu)
>> -               if (cpumask_test_cpu(cpu, cpu_callout_mask))
>> +       for_each_possible_cpu(cpu) {
>> +               if (cpumask_test_cpu(cpu, cpu_online_mask))
>>                         bogosum +=3D cpu_data(cpu).loops_per_jiffy;
>
> This should be the same as for_each_online_cpu().

Duh, yes. Obviously...

