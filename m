Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640556EE8D1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 22:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526335.818032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOx6-00079K-Jm; Tue, 25 Apr 2023 20:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526335.818032; Tue, 25 Apr 2023 20:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOx6-00077V-Gu; Tue, 25 Apr 2023 20:07:52 +0000
Received: by outflank-mailman (input) for mailman id 526335;
 Tue, 25 Apr 2023 20:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQ8d=AQ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1prOx5-00077P-C3
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 20:07:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0433af-e3a4-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 22:07:49 +0200 (CEST)
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
X-Inumbo-ID: da0433af-e3a4-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682453268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4O15691mL3gwOERb5M8WwZ/BXXDNqH0+MWC0TCs50QE=;
	b=Bwuzz8Nz/BV6G/VL2bb+kha7mVj8/IRkuvbsjwjzk4USnPr2OW7n7gum3YLTay29fSKm4l
	VIaAVviF4DxNGn2wYM6o0v57oY64CRe+VgXsYQv76pd/utkcrBMIA+Hlh315Cm54VqTo7K
	atpyanHwbqEDa1wx0+1kk6JnSgmhiayROO89bvR9xqhG5h5fXOyJHuELCWZOaAN84arMeq
	GGcJ4Ir8foJBLeP8ch9gHIy9jvOiKYJ4asV3QtfyaAgXR2pzDWC3evufPz0x9jkOlulsT0
	C2Q9I3DEe4BIAOmlzxJr0oVN2tLwYUOfQk+hTo1aBm1XqujojvIZxEYvbxiQIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682453268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4O15691mL3gwOERb5M8WwZ/BXXDNqH0+MWC0TCs50QE=;
	b=RrFYGWkb9+Sr7TGoFVSkR/dCgulbRZuvJgUFeQBLzx1gsWc2Iv3HT6T4XcF1FLb33wIMzq
	mCdHr2bCd+lRBoCA==
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom Lendacky
 <thomas.lendacky@amd.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
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
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87v8hq35sk.ffs@tglx>
References: <87r0sh4m7a.ffs@tglx>
 <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de> <87a5z443g2.ffs@tglx>
 <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
 <ZEFRhXua6Jxvit1R@google.com> <87v8hq35sk.ffs@tglx>
Date: Tue, 25 Apr 2023 22:07:47 +0200
Message-ID: <87r0s7zpws.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 20 2023 at 17:57, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 07:51, Sean Christopherson wrote:
> Something like the completely untested below should just work whatever
> APIC ID the BIOS decided to dice.
>
> That might just work on SEV too without that GHCB muck, but what do I
> know.

It does not.

RDMSR(X2APIC_ID) is trapped via #VC which cannot be handled at that
point. Unfortunately the GHCB protocol does not provide a RDMSR
mechanism similar to the CPUID mechanism. Neither does the secure
firmware enforce CPUID(0xb):APICID to real APIC ID consistency.

So the hypervisor can dice the APIC IDs as long as they are consistent
with the provided ACPI/MADT table.

So no parallel startup for SEV for now.

Thanks,

        tglx

