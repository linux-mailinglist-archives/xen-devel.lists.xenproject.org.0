Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45036E9242
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524027.814560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSIO-0004le-0N; Thu, 20 Apr 2023 11:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524027.814560; Thu, 20 Apr 2023 11:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSIN-0004jZ-Tl; Thu, 20 Apr 2023 11:17:47 +0000
Received: by outflank-mailman (input) for mailman id 524027;
 Thu, 20 Apr 2023 11:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J46Y=AL=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1ppSIM-0004jT-DZ
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:17:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f830a07d-df6c-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:17:43 +0200 (CEST)
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
X-Inumbo-ID: f830a07d-df6c-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681989462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5XqcHn966UpzdXXi00/lSAzdYJUEVQOjSwT6u3WS8Y=;
	b=pAb6n5DzMyj9cPuaDVh1nEa4eMPTGWjlabRanF0gKYgC9Dt16bSxIF65k8A6Phxdd7b+m1
	8rtjGcomkGZGHPfqi5gCMDsNgIxkIz7fE3iWI1yVPEr7CzAxuLO52VMUjueL9yA1cignQ0
	2aZBXvrGK95/A3SZLIzR4CO2Gt6BjAJeGZFwZ0r5DeQJZY9f+42NHleeHSDTjxF+sNMncp
	Pj8zsu3xSjO1U4uiCaq79l7sMSO/XzBLws+gTsKxCyOwMVcTz52DRxt/Fl9qBPDScBZpAE
	EzRwxWNG9FQP9wQGTFVsN5ZBm94BxGBjsCTcRwuXnpgNipezItO8FzlRvwCjfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681989462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5XqcHn966UpzdXXi00/lSAzdYJUEVQOjSwT6u3WS8Y=;
	b=K7n7gkxobQSbdvGZErkz25VRgfZFGdff1cfdZxrOPRjWpL/QdasoOCujc47S1yFH9hOfDu
	jdhNH58O+gxzlPDw==
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
In-Reply-To: <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com>
Date: Thu, 20 Apr 2023 13:17:40 +0200
Message-ID: <87y1mm3iqz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20 2023 at 10:23, Andrew Cooper wrote:
> On 20/04/2023 9:32 am, Thomas Gleixner wrote:
>> I'm pondering to simply deny parallel mode if x2APIC is not there.
>
> I'm not sure if that will help much.

Spoilsport.

> Just because x2APIC is there doesn't mean it's in use.=C2=A0 There are
> several generations of Intel system which have x2APIC but also use the
> opt-out bit in ACPI tables.=C2=A0 There are some machines which have
> mismatched APIC-ness settings in the BIOS->OS handover.
>
> There's very little you can do on the BSP alone to know for certain that
> the APs come out of wait-for-SIPI already in x2APIC mode.

Yeah. Reading the APIC that early is going to be entertaining too :)

> One way is the =C3=86PIC Leak "locked into x2APIC mode" giant security
> bodge.=C2=A0

Bah.

> If the system really does have a CPU with an APIC ID above 0xfe, then
> chances are good that the APs come out consistently...

Anything else would be really magic :)

