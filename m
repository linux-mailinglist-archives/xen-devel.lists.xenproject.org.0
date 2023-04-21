Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EAD6EAF44
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 18:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524651.815736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pptkA-0002x0-EK; Fri, 21 Apr 2023 16:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524651.815736; Fri, 21 Apr 2023 16:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pptkA-0002tk-Bc; Fri, 21 Apr 2023 16:36:18 +0000
Received: by outflank-mailman (input) for mailman id 524651;
 Fri, 21 Apr 2023 16:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W9w3=AM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pptk8-0002tM-RU
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 16:36:17 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a19eab0b-e062-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 18:36:14 +0200 (CEST)
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
X-Inumbo-ID: a19eab0b-e062-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682094973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMzOR95vay5pg0WrO+uJUGs+TLmecn0h01ht4y+YBW4=;
	b=o/TkSlykoJbZmwaCartOT04EgN5C+kODI7gZukI9DsIFy2Dgj3RH1WuWvwMvvYXkyiHIQk
	oxshpYHuRgHC8o/JYqoEGQ0sMgPeCIrVwZGLDjjKa0oD47tebLMPcc0kwKmrYNmhibL69p
	CuPI7WXBesGu+IQZaD33O9Vh8aqxpxbvEKmf8Inm6RIaaj7YSGPtkcXqQaDLBztSRLFiTD
	jAl7P2Gr2fqg2KdBtxFZJUc3m5xmd9qgJZ7OLjPxBmIrUzXSJ1uWPWJLXceKreW9vWpPl+
	SmWK7o2t1K1ok1OKIOZ0yX0u1SEvxXShW0sf3Kg6kxQp0c93gSDpceB1rVFESQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682094973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMzOR95vay5pg0WrO+uJUGs+TLmecn0h01ht4y+YBW4=;
	b=44dX9VJX+TMEmkgFv0MNfddpnQu4SMuQ4SBx4WdfdKvH1kS+zbYESmYQqIpwSH+YghznlV
	s1xiQKd/rkmpEKCg==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Sean Christopherson <seanjc@google.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
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
In-Reply-To: <87sfcu2wup.ffs@tglx>
References: <87r0sh4m7a.ffs@tglx>
 <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de> <87a5z443g2.ffs@tglx>
 <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
 <ZEFRhXua6Jxvit1R@google.com> <87v8hq35sk.ffs@tglx>
 <56e59a4d-a47f-4bfe-7db5-5f921062ad69@molgen.mpg.de> <87sfcu2wup.ffs@tglx>
Date: Fri, 21 Apr 2023 18:36:12 +0200
Message-ID: <87bkjh2nwj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 20 2023 at 21:10, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 18:47, Paul Menzel wrote:
>> Am 20.04.23 um 17:57 schrieb Thomas Gleixner:
>> I quickly applied it on top of your branch, but I am getting:
>
> As I said it was untested. I was traveling and did not have access to a
> machine to even build it completely. Fixed up and tested version below.

I've updated

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug

for your conveniance.

Thanks,

        tglx

