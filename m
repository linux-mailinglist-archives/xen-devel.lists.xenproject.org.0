Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26C6E4BD8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522233.811447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQ9o-000581-AH; Mon, 17 Apr 2023 14:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522233.811447; Mon, 17 Apr 2023 14:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQ9o-000556-75; Mon, 17 Apr 2023 14:48:40 +0000
Received: by outflank-mailman (input) for mailman id 522233;
 Mon, 17 Apr 2023 14:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMc7=AI=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1poQ9n-000550-AE
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 14:48:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eecc48c1-dd2e-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 16:48:36 +0200 (CEST)
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
X-Inumbo-ID: eecc48c1-dd2e-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681742915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuH57htx4HoqqPTADyv5r/MQySPN8DmRQYMrJ+PpUgg=;
	b=INb5SzlK5MX/Bq/m0881zfdrzueVbPX5Prz3Xgz2rxss/IDiXaObMBisydQEAC3xunlQOs
	5FoThs8SU4xHlYkNvPHTdHnazGH9MZS0yGJQJLAmwI5D7ZTNc7jYm5HqGNYCHs198vO4Fx
	Z3OtiE3BTc9mB860bA+Z0kx73U3myYwxpdggsQfQrNtW2MsIXh6QqGIKR6eyMV4JP0dPex
	ACDhdDGRvp6HxbcrUCAsTApHuoenv4J1gKFxU7NBHTucKvq6LHYcjtnHCUSe1Q33mLsYAb
	M+FB63wZmlbcOfZKg7GIVobNBFuqhpFRD3yr6B///q6aRnAMLX/Vy4rZO5+ycQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681742915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuH57htx4HoqqPTADyv5r/MQySPN8DmRQYMrJ+PpUgg=;
	b=PyXMLWfIzV3JqDuBaEC9RZdvFmc5btxtvXPM95519mxDIYGaw5KC7da7PccMR5S1yjqMpt
	wr1a07P8ngNdz3AA==
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
In-Reply-To: <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
Date: Mon, 17 Apr 2023 16:48:34 +0200
Message-ID: <87wn2a4la5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paul!

On Mon, Apr 17 2023 at 13:19, Paul Menzel wrote:
> Am 15.04.23 um 01:44 schrieb Thomas Gleixner:
> [    0.258193] smpboot: CPU0: AMD A6-6400K APU with Radeon(tm) HD=20
> Graphics (family: 0x15, model: 0x13, stepping: 0x1)
> [=E2=80=A6]
> [    0.259329] smp: Bringing up secondary CPUs ...
> [    0.259527] x86: Booting SMP configuration:
> [    0.259528] .... node  #0, CPUs:      #1
> [    0.261007] After schedule_preempt_disabled
> [   10.260990] CPU1 failed to report alive state

Weird. CPU1 fails to come up and report that it has reached the
synchronization point.

Does it work when you add cpuhp.parallel=3Doff on the kernel command line?

Thanks,

        tglx

