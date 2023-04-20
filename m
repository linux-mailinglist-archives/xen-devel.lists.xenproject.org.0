Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6026E8CD1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523954.814408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPiK-000629-Hk; Thu, 20 Apr 2023 08:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523954.814408; Thu, 20 Apr 2023 08:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPiK-0005za-Dq; Thu, 20 Apr 2023 08:32:24 +0000
Received: by outflank-mailman (input) for mailman id 523954;
 Thu, 20 Apr 2023 08:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J46Y=AL=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1ppPiJ-0005zQ-6x
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:32:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb4d0fa-df55-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 10:32:22 +0200 (CEST)
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
X-Inumbo-ID: deb4d0fa-df55-11ed-b21f-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681979541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+ebiUykc2oGiW9xPV9ZKUG/P8FsTezy0HSUaGX7/pY=;
	b=Jz/cXv5/DHLlLjV0z8BL66SPZKoeNMGD449tum189TN4LYaNtkzbsEgLqCXxeR5D2x4DmB
	AiiH4E3wu4mBGTwiuHyl8BJq1iKIMjEryKHI4Rwh2aIdHQXjHwgf71hZZEbZyP9aBjU6fv
	3zXpJo+I3lE6AOTbjLnufJBUwJfr8usMbNL18Mci5Spg10fimG4h36b3KXVFHqqEKIS4NL
	6O/vuWFYSqyD35wd+FaTjGBiDpyu2BeCfT9L9YjBMhEbpDoYxV0wuRUxlhwDe39bW/c/BG
	Fut9OwTjPUuzPGtLKQMIt2adUOVPSweDTmlzV8g0EUacW9ueX1QxUKw2lpWF0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681979541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+ebiUykc2oGiW9xPV9ZKUG/P8FsTezy0HSUaGX7/pY=;
	b=fiV2/prU9cb5dhmyq+s9y7Q+ypTlDxy8b3yL8uPmb2zNIq4Xu7UguxKO2bu7hAd0D1st/s
	PIPzYABPo+6ab0BQ==
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, Arjan van de Veen
 <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
Date: Thu, 20 Apr 2023 10:32:19 +0200
Message-ID: <871qkf3qek.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19 2023 at 17:21, Andrew Cooper wrote:
> On 19/04/2023 2:50 pm, Andrew Cooper wrote:
>> What I'm confused by is why this system boots in the first place.=C2=A0 =
I can
>> only think that's is a system which only has 4-bit APIC IDs, and happens
>> to function when bit 4 gets truncated off the top of the SIPI destinatio=
n...
>
> https://www.amd.com/system/files/TechDocs/42300_15h_Mod_10h-1Fh_BKDG.pdf
>
> This system does still require the IO-APICs to be at 0, and the LAPICs
> to start at some offset, which is clearly 16 in this case.=C2=A0 Also, th=
is
> system has configurable 4-bit or 8-bit wide APIC IDs, and I can't tell
> which mode is active just from the manual.

That document contradicts itself:

  "The ApicId of core j must be enumerated/assigned as:
   ApicId[core=3Dj] =3D (OFFSET_IDX) * MNC + j

   Where OFFSET_IDX is an integer offset (0 to N) used to shift up the
   core ApicId values to allow room for IOAPIC devices.

   It is recommended that BIOS use the following APIC ID assignments for
   the broadest operating system sup- port. Given N =3D MNC and M =3D
   Number_Of_IOAPICs:

   =E2=80=A2 Assign the core ApicId=E2=80=99s first from 0 to N-1, and the =
IOAPIC IDs
     from N to N+(M-1)."

Oh well. If the rest of these docs is of the same quality then it's not
a surprise that BIOSes are trainwrecks.

> But, it does mean that the BIOS has genuinely modified the APIC IDs of
> the logic processors.=C2=A0 This does highlight an error in reasoning with
> the parallel bringup code.

Yes.

> For xAPIC, the APIC_ID register is writeable (at least, model
> specifically), and CPUID is only the value it would have had at reset.=C2=
=A0
> So the AP bringup logic can't actually use CPUID reliably.
>
> This was changed in x2APIC, which made the x2APIC_ID immutable.
>
> I don't see an option other than the AP bringup code query for xAPIC vs
> x2APIC mode, and either looking at the real APIC_ID register, or falling
> back to CPUID.

I'm pondering to simply deny parallel mode if x2APIC is not there.

Thanks,

        tglx

