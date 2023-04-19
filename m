Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB066E767C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 11:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523283.813181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4Gj-0002P5-1M; Wed, 19 Apr 2023 09:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523283.813181; Wed, 19 Apr 2023 09:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4Gi-0002ML-Ug; Wed, 19 Apr 2023 09:38:28 +0000
Received: by outflank-mailman (input) for mailman id 523283;
 Wed, 19 Apr 2023 09:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNGQ=AK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pp4Gh-0002MF-1A
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 09:38:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eda8cb58-de95-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 11:38:24 +0200 (CEST)
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
X-Inumbo-ID: eda8cb58-de95-11ed-b21f-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681897102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ahWW2+Q3S/RvB6qR72sS8HIsTdCuAt1S9bqdH2z+7w=;
	b=qc5CvobL2r3hZWvSzSJqNdvsc3YOVQi05uwUK7zoWReiby465BIJI/zuxMUu5qXpSXXyVJ
	vzTv9ILxgQrJkJR8zzEJpve7BFlEE6OioXHOKbuuQuiRK8FoLk871pSTksNqCCIxl8ucz5
	wmXiG7xJVjNb7Bo6RoRV9J4Lz7UUc8BPgbwLe4YNDPdH4DGHf7Ptnhs3DupHwgSPtRAHBW
	rOKHJXmOZJEWGQe1t29Q6HPEqx9hwBtb4vRyuoV7kVeWG6zEx76YqS0yoDbWMbvMs5WCQW
	MFgUf5iaArW/mcuy/Cw2R/4IofuuCDjuJoLMyvJOsnpRGsf+HQwI40VP2uCO1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681897102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ahWW2+Q3S/RvB6qR72sS8HIsTdCuAt1S9bqdH2z+7w=;
	b=h9kGxEZF0/449e5pzKL8RjkYF5PGK7O3l0s7czECIEu7mvAFDvboALol8fOrjIlj6I4Yg9
	stFZXVlGYGrqZrAQ==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
In-Reply-To: <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
Date: Wed, 19 Apr 2023 11:38:21 +0200
Message-ID: <87a5z443g2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Paul!

On Tue, Apr 18 2023 at 22:10, Paul Menzel wrote:
> Am 18.04.23 um 10:40 schrieb Thomas Gleixner:
>> Can you please provide the output of cpuid?
>
> Of course. Here the top, and the whole output is attached.

Thanks for the data. Can you please apply the debug patch below and
provide the dmesg output? Just the line which is added by the patch is
enough. You can boot with cpuhp.parallel=off so you don't have wait for
10 seconds.

Thanks,

        tglx
---
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -814,6 +814,7 @@ static int wakeup_secondary_cpu_via_init
 	unsigned long send_status = 0, accept_status = 0;
 	int maxlvt, num_starts, j;
 
+	pr_info("Kicking AP alive: %d\n", phys_apicid);
 	preempt_disable();
 	maxlvt = lapic_get_maxlvt();
 

