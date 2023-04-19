Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C86E79D9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523416.813440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp74p-000051-Nw; Wed, 19 Apr 2023 12:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523416.813440; Wed, 19 Apr 2023 12:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp74p-0008U0-LA; Wed, 19 Apr 2023 12:38:23 +0000
Received: by outflank-mailman (input) for mailman id 523416;
 Wed, 19 Apr 2023 12:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNGQ=AK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pp74o-0008Tu-Ls
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:38:22 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f979a1-deaf-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:38:20 +0200 (CEST)
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
X-Inumbo-ID: 10f979a1-deaf-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681907899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzrbFJX0mLRnVyg6gK50wjW8gAdRTyt3eKsS6bO2Ho8=;
	b=UQOJzBaZIKBAqIIp2iqE9MqaQt4o5jf4X54iENF8PIgb3XVSKHeAToYhSAetn/VDc3XDSc
	vbXK6VM/E7725N29s2FSKaatj7nI1wyCTjA86cgr2JkrX8DxeEun3hjlUqogLtb5s5zfSa
	SywUUUueeIYsZNv4w36kFnEjVOxY/DSPPwkyq+kebzFI7z2gYg0r9CnlmtgFv9TqDyfAlD
	YKid0ziPPcge9cOBT8GWWTc95C+prcMhIbymQfHwn03mi0EsBFOddKVOKY2XMi3tesk7+V
	TiCAx54bzs6ELiLXkmKcxWv4fFnjWSoKaHB0PW1kBv0yCnbUWTFXcy/RdtQ2bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681907899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzrbFJX0mLRnVyg6gK50wjW8gAdRTyt3eKsS6bO2Ho8=;
	b=G/PDlG02+awXAj/Znv2ir94TrCNuE4soVJYG72z/i6F9KUyMxTR0qJUk/z9cfxNZH98BUp
	FAdnV9eglXscn1DA==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87a5z443g2.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx>
Date: Wed, 19 Apr 2023 14:38:18 +0200
Message-ID: <877cu83v45.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 19 2023 at 11:38, Thomas Gleixner wrote:
> On Tue, Apr 18 2023 at 22:10, Paul Menzel wrote:
>> Am 18.04.23 um 10:40 schrieb Thomas Gleixner:
>>> Can you please provide the output of cpuid?
>>
>> Of course. Here the top, and the whole output is attached.
>
> Thanks for the data. Can you please apply the debug patch below and
> provide the dmesg output? Just the line which is added by the patch is
> enough. You can boot with cpuhp.parallel=off so you don't have wait for
> 10 seconds.

Borislav found some a machine which also refuses to boot. It turns of
the debug patch was spot on:

[    0.462724] .... node  #0, CPUs:      #1
[    0.462731] smpboot: Kicking AP alive: 17
[    0.465723]  #2
[    0.465732] smpboot: Kicking AP alive: 18
[    0.467641]  #3
[    0.467641] smpboot: Kicking AP alive: 19

So the kernel gets APICID 17, 18, 19 from ACPI but CPUID leaf 0x1
ebx[31:24], which is the initial APICID has:

CPU1		0x01
CPU2		0x02
CPU3		0x03

Which means the APICID to Linux CPU number lookup based on CPUID 0x01
fails for all of them and stops them dead in the low level startup code.

IOW, the BIOS assignes random numbers to the AP APICs for whatever
raisins, which leaves the parallel startup low level code up a creek
without a paddle, except for actually reading the APICID back from the
APIC. *SHUDDER*

I'm leaning towards disabling the CPUID lead 0x01 based discovery and be
done with it.

Thanks,

        tglx

