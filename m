Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775886E7B27
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523491.813584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp85m-0006Nn-6p; Wed, 19 Apr 2023 13:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523491.813584; Wed, 19 Apr 2023 13:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp85m-0006L4-3q; Wed, 19 Apr 2023 13:43:26 +0000
Received: by outflank-mailman (input) for mailman id 523491;
 Wed, 19 Apr 2023 13:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNGQ=AK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pp85k-0006Ky-P6
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:43:24 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26cbe37b-deb8-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 15:43:22 +0200 (CEST)
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
X-Inumbo-ID: 26cbe37b-deb8-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681911801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFu1BiBIiZJxXn+1gDPlWVAOg5qQuCy99rAdIveUYFI=;
	b=GioJJVLP3xsJ8meXcrDWG5s5gdc8c0v+E+hPsGfax24KRpT161PXreAJ6xSi1/ffGHB7Ig
	QiBx1CCi33pppdwmwttJl7f18G3nqG0JMirkvI2B/KLs1tu2KE0oys4tguZIBjdpC698x5
	qJxDi+HpdhZXd4d+95gQdCA+EcnPYPHRun+2UdCS7FOBBh/HuWgOjO1wzT9vOvsEMfGXhZ
	Bp60sCQp4nsgLMYaR72tlHdyX8qr1HW2HBQ6txx5eUn8Q1HfGVvmcQX/+2gPF1pOlVbSvA
	J67MiipF05Kzmx+7IpQU6gIRKBAfRvBEfF5UQtkBc9rk1oQMLK4aT2yGkLma2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681911801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFu1BiBIiZJxXn+1gDPlWVAOg5qQuCy99rAdIveUYFI=;
	b=PpcgZgskhULkL7/jgakP7Wurg7G56yGaYp+uPBAUp/opltoRjM69gQ7OhILB+Kv0LHnaHA
	BEEUccjsOmhHz0CA==
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
In-Reply-To: <877cu83v45.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx>
Date: Wed, 19 Apr 2023 15:43:20 +0200
Message-ID: <874jpc3s3r.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 19 2023 at 14:38, Thomas Gleixner wrote:
> On Wed, Apr 19 2023 at 11:38, Thomas Gleixner wrote:
> IOW, the BIOS assignes random numbers to the AP APICs for whatever
> raisins, which leaves the parallel startup low level code up a creek
> without a paddle, except for actually reading the APICID back from the
> APIC. *SHUDDER*

So Andrew just pointed out on IRC that this might be related to the
ancient issue of the 3-wire APIC bus where IO/APIC and APIC shared the
ID space, but that system is definitely post 3-wire APIC :)

Thanks,

        tglx



