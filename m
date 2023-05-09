Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF26FC5D3
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532139.828173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwM7q-0003MP-6s; Tue, 09 May 2023 12:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532139.828173; Tue, 09 May 2023 12:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwM7q-0003KJ-49; Tue, 09 May 2023 12:07:26 +0000
Received: by outflank-mailman (input) for mailman id 532139;
 Tue, 09 May 2023 12:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwM7o-0003KA-EB
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:07:24 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d69057c-ee62-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 14:07:22 +0200 (CEST)
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
X-Inumbo-ID: 0d69057c-ee62-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8MCFM0FDR2P5xT6w7iIAowrB6rGKJkA6dzl9HivHWk=;
	b=WQKf9JTpFPSQGT0uFg5INijnVR8R5fqcikzHfuS5DVBLQGQ7GwJQT+EVszHAmjT/3/UBuz
	qVYnARbWYomJ6gliEb43t5la/h6VifzuO+zL/GRl0NjzHXmgK5N/FGwqL06FgLMkljqBFm
	XyfTJfmksGnqa6BjZhyerBbGE6iuFhkjn27fQrUXAQ1QApceQPW64uUNRla+fMpap+pUkk
	SWZ9l1mk0piAcuHN5EvFC700NqxfjfjIo2TZ35Uf44N6qz9M7DRMymepQA2ZWVsdTMQEJG
	ZopQRoGBKBzZCgD4GsYTMKx5vSxJBSs3/zJnl8HdNjGWI5X3/Fou00r0/4324g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8MCFM0FDR2P5xT6w7iIAowrB6rGKJkA6dzl9HivHWk=;
	b=HEbhRwUpE3y701WVF4If5EM5F8H8s6m0+F3iRYhv9+fKfUn3XmN66AS4uimVHFaZrmTvUY
	YoYD1EwiDwf+ofDQ==
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
Date: Tue, 09 May 2023 14:07:20 +0200
Message-ID: <87pm791zev.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> +	/*
>> +	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
>> +	 * but just sets the bit to let the controlling CPU (BSP) know that
>> +	 * it's got this far.
>> +	 */
>>  	smp_callin();
>>  
>> -	/* otherwise gcc will move up smp_processor_id before the cpu_init */
>> +	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
>>  	barrier();
>
> Not to the detriment of this patch, but this barrier() and it's comment
> seem weird vs smp_callin(). That function ends with an atomic bitop (it
> has to, at the very least it must not be weaker than store-release) but
> also has an explicit wmb() to order setup vs CPU_STARTING.
>
> (arguably that should be a full fence *AND* get a comment)
>
> There is no way the smp_processor_id() referred to in this comment can
> land before cpu_init() even without the barrier().

Right. Let me clean that up.

Thanks,

        tglx

