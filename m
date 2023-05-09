Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66C6FCD2D
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532415.828610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwRgX-0005Uo-ND; Tue, 09 May 2023 18:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532415.828610; Tue, 09 May 2023 18:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwRgX-0005S6-KL; Tue, 09 May 2023 18:03:37 +0000
Received: by outflank-mailman (input) for mailman id 532415;
 Tue, 09 May 2023 18:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwRgW-0005S0-0n
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:03:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d017b748-ee93-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 20:03:33 +0200 (CEST)
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
X-Inumbo-ID: d017b748-ee93-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683655413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8lMKg/Pl8bB6qnYC08+nBqTm61HWmUyuaLIaj1gFuQ=;
	b=p/DT4GAI2EtIvZG/E48g6Y7O0PSW6I7fXi+Elpt8is0SHczyNHYG4WQo1p8SYYocLErxKG
	tmvgrxjIF+UxfScN840YPnkbKctQmYUakhWVsbINnsqgaMlRICOjt3Qfc6Up2X1bjDtoAO
	ar+k+iD6nwCsxY3BjhAFgFJUIEJHTt1PrRE8rbODQZgYjBKNgq6ykZLI1Uu1z7pabrzvU3
	BwVO+gXxHyh4uHTSjhXVxYRN+IF1E8Jy0qeflsgMafTVMfAIUm1oLIOiNDcRtX6ADo3QXJ
	K1YoDfr+wSZLKitYMptlFZ4BJxPZWh1AEKhWq/8P8VH08qDCjiggV3Xig5/J1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683655413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8lMKg/Pl8bB6qnYC08+nBqTm61HWmUyuaLIaj1gFuQ=;
	b=o/GeRRk5OesDmJnkkrzpp/P4MfatYoS6Fv9RucWpaz9lKWhE91kzNOmkETuNZ878NLl+Jz
	nDab+Y4hdtD/OPAA==
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
In-Reply-To: <20230509101902.GV83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509101902.GV83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 20:03:32 +0200
Message-ID: <87lehxz8jv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 12:19, Peter Zijlstra wrote:
> Again, not really this patch, but since I had to look at this code ....
>
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> @@ -1048,60 +1066,89 @@ static int do_boot_cpu(int apicid, int c
>
> 	/*
> 	 * AP might wait on cpu_callout_mask in cpu_init() with
> 	 * cpu_initialized_mask set if previous attempt to online
> 	 * it timed-out. Clear cpu_initialized_mask so that after
> 	 * INIT/SIPI it could start with a clean state.
> 	 */
> 	cpumask_clear_cpu(cpu, cpu_initialized_mask);
> 	smp_mb();
>
> ^^^ that barrier is weird too, cpumask_clear_cpu() is an atomic op and
> implies much the same (this is x86 after all). If you want to be super
> explicit about it write:
>
> 	smp_mb__after_atomic();
>
> (which is a no-op) but then it still very much requires a comment as to
> what exactly it orders against what.

Won't bother either as that mask is gone a few patches later.

