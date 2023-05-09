Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38416FCF31
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 22:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532540.828760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwTg1-0001UX-6M; Tue, 09 May 2023 20:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532540.828760; Tue, 09 May 2023 20:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwTg1-0001Rz-3k; Tue, 09 May 2023 20:11:13 +0000
Received: by outflank-mailman (input) for mailman id 532540;
 Tue, 09 May 2023 20:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwTfz-0001Rt-PA
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 20:11:11 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1adf6fe-eea5-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 22:11:07 +0200 (CEST)
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
X-Inumbo-ID: a1adf6fe-eea5-11ed-b229-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683663065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDHRmjiERMZtAMWS8NswxcpsZgr8pqyf8cBJN0UwKq4=;
	b=qRz1Wt3JIbNYLISqAbJr1CMERh+G2fMl0sqNUINGFnuAglUDS20PR5mShGM7iQQQaOXzUO
	6p1nBmlJSh5FISuh/gxPpyFl5N/5lIcPzXiWCbOhc/BY9nLjejGZdozuMFQuDWHB0czbQ3
	N334596N1dIxTBUtYyzDiKqjfnYYlcCALsa05iyDdZ772j72RpkHn+oDxyP4ObL7l+piSu
	ZhZkepOsryy7f/3f8Xvt0ySi2CMPDVnx0tsF8XLS0QXVKSABEb0ZDeaHvlrFZfnZHg6sEY
	EkUkcA416BPYsfyNhOSk3xIjz0pEBaTy2eNw1t0P+tqJe8e17B+vC1YPI9z1/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683663065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDHRmjiERMZtAMWS8NswxcpsZgr8pqyf8cBJN0UwKq4=;
	b=Xlcesbr/mowxxv4d+xv21wM9Nh14MEM6CP2UULmrKClB0/ijd/XoMlkIURymgqxjfMwTM5
	2x4mgfol9jpnTzDw==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 08/36] x86/smpboot: Split up native_cpu_up() into
 separate phases and document them
In-Reply-To: <20230509100421.GU83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 22:11:05 +0200
Message-ID: <87fs85z2na.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> Not to the detriment of this patch, but this barrier() and it's comment
> seem weird vs smp_callin(). That function ends with an atomic bitop (it
> has to, at the very least it must not be weaker than store-release) but
> also has an explicit wmb() to order setup vs CPU_STARTING.
>
> (arguably that should be a full fence *AND* get a comment)

TBH: I'm grasping for something 'arguable': What's the point of this
wmb() or even a mb()?

Most of the [w]mb()'s in smpboot.c except those in mwait_play_dead()
have a very distinct voodoo programming smell.

Thanks,

        tglx

