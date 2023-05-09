Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB46FC5EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532149.828194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwM9l-0004Tj-Pz; Tue, 09 May 2023 12:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532149.828194; Tue, 09 May 2023 12:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwM9l-0004QP-NH; Tue, 09 May 2023 12:09:25 +0000
Received: by outflank-mailman (input) for mailman id 532149;
 Tue, 09 May 2023 12:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwM9l-0004Pg-0M
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:09:25 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5607d547-ee62-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 14:09:24 +0200 (CEST)
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
X-Inumbo-ID: 5607d547-ee62-11ed-b227-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JzzIG9diO0rBmRqXNA2vITQ7laniNDqcQjUI61xR0zc=;
	b=yGBgjZXX7JUQf9ai2BxNAcE40QqlbbCZvKDivZ8fc+Ky9mAI/0ueQdDzNtDVuilsrvxJJO
	lJ5mhaodIDGsYlQ0IXQvZ9tZytQody5uNCpERHh6I46d500WQf2vjLSAaSUonj1VM7S27k
	ijKtUP6m6oR8ZuUZRNmjosyunXeQRrX26+o4C4sXaWq1kq0u9zQ+mYZBmKYBPh+6Nuyz6J
	ha7BRefsXdcuOh0ABNgFpkVgNGLsV2g+kzTN5Fz65Tux9qtwNHNwfsc6BXGq7Rw/qb5o8h
	P5C95248r6aRH+rMJbxtb6dCXh+b7CBcpY6Wfvf0ny/k2Ev6eJ3Z3YSX7s1qRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JzzIG9diO0rBmRqXNA2vITQ7laniNDqcQjUI61xR0zc=;
	b=fUDzvynzHE21pHjVwgqzy6eWSyFgbVajRkQas+BUCgv8eUYACTe86SoKSEy94dBf+BbPut
	fM8AU/kPvb2mGGDg==
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
In-Reply-To: <20230509103146.GW83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509103146.GW83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:09:23 +0200
Message-ID: <87jzxh1zbg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 12:31, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> +	/*
>> +	 * Wait for the AP to mark itself online, so the core caller
>> +	 * can drop sparse_irq_lock.
>> +	 */
>> +	while (!cpu_online(cpu))
>> +		schedule();
>> +}
>
> These schedule() loops make me itch... this is basically Ye Olde yield()
> loop with all it's known 'benefits'.
>
> Now, I don't think it's horribly broken, we're explicitly waiting on
> another CPU and can't have priority inversions, but yuck!
>
> It could all be somewhat cleaned up with wait_var_event{_timeout}() and
> wake_up_var(), but I'm really not sure that's worth it. But at least it
> requires a comment to justify.

All of them are gone with the later patches and the control CPU will
just go straight to wait for the completion in the core code.


