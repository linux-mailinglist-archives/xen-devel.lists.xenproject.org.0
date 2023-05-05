Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A256F833A
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 14:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530322.825866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puuoY-0001Z4-Bn; Fri, 05 May 2023 12:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530322.825866; Fri, 05 May 2023 12:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puuoY-0001XN-91; Fri, 05 May 2023 12:45:34 +0000
Received: by outflank-mailman (input) for mailman id 530322;
 Fri, 05 May 2023 12:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWC1=A2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1puuoV-0001XH-N8
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 12:45:32 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7505a15-eb42-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 14:45:29 +0200 (CEST)
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
X-Inumbo-ID: b7505a15-eb42-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683290728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro/VOFl72UDWFwy8gwNK93pOtDrJEFznvt3NXDl6cF8=;
	b=NEssImE7oVj95z4/FBIZJnxzphr31CeA4k7oJeJinz1r5r1l9dXN1gppKxrfH844UqDO9z
	4QSvSZ+MCzWy04loOUdVFWsJabtUy+6xAHaZOnUP3kDamwQqqChUVjh6yxS90kqh/3foQl
	BxPnqXdK0mEFhXKLhgXSM8yu090mNdF9FRSITtHjxNfxijznNsQsOy0jITHZ9ajNCFSUr7
	ixcpybMXO0+Tte9hyNa1D9uPISenZGZ0GM57Wg5ua9BDE6mitsB+qwg3eCN369M6O0Jwe5
	/MuZBe8FpjmVO3WPvPxa64u3KW+r1rcVtivlIiAVpuzcTFgSsngi+McsE/7vlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683290728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro/VOFl72UDWFwy8gwNK93pOtDrJEFznvt3NXDl6cF8=;
	b=65zpCtdzuEaRqOzhfQTeNfeiCJfu8TviFjuPm0aorQPKM8pLdEAQ4DrGamxrKih4/79CxI
	kPU4Ye7GnkFx6vAA==
To: Andrew Cooper <andrew.cooper3@citrix.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Gerst
 <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>
Subject: Re: [patch V2 34/38] x86/cpu/amd; Invoke
 detect_extended_topology_early() on boot CPU
In-Reply-To: <38b259bb-050b-023e-4f43-212f95f022ac@citrix.com>
References: <20230504185733.126511787@linutronix.de>
 <20230504185938.179661118@linutronix.de>
 <38b259bb-050b-023e-4f43-212f95f022ac@citrix.com>
Date: Fri, 05 May 2023 14:45:28 +0200
Message-ID: <87354b3q1j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 05 2023 at 00:04, Andrew Cooper wrote:
> On 04/05/2023 8:02 pm, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>>
>> The early detection stores the extended topology leaf number which is
>> required for parallel hotplug.
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> It occurs to me that this and the previous patch are stale given that we
> no longer look at CPUID in the trampoline.
>
> They're probably useful changes in isolation, but the commit messages
> want adjusting to remove the association with parallel boot.

Duh. Indeed. Completely forgot about that.

