Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FF6FC600
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532162.828223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMCV-00070f-OL; Tue, 09 May 2023 12:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532162.828223; Tue, 09 May 2023 12:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMCV-0006xz-LV; Tue, 09 May 2023 12:12:15 +0000
Received: by outflank-mailman (input) for mailman id 532162;
 Tue, 09 May 2023 12:12:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwMCU-0006xp-7l
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:12:14 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb1754fc-ee62-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 14:12:13 +0200 (CEST)
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
X-Inumbo-ID: bb1754fc-ee62-11ed-b227-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeDWxrG4XUYobVqWgAe3O2JPVJDj89o+5jrCfskGJg8=;
	b=hl/TK4RBTejer0s1ss/VQWoTE3DJHIErNy5ObBMt3F35AuGijMu5SQIYqEXIyyWfguIJ74
	IuVIsOwOjI+DOYpi1oyZvtSrA4xy0VqeURht3o6yDrYLZd0dCj9sQmFOFO0ByR3FGuzx1X
	DX/4mqvZ8z2EcTfmL6YwZj0AheRNPYO2Sw/CFuIRodeNmQ9+fMov+UrbzmNB3mOPDT4LpP
	XixRF4zedTnImudhtqeC8vGLPe0PN84sIltm+fYhikFa7xWpApb8aT+EKAws94oS5Kw77W
	ZD3DPvNRfQa9kERCm1KsnYEOdLoCE866a9iJjH9pstUyHznEaCqcjcX+ulrAEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeDWxrG4XUYobVqWgAe3O2JPVJDj89o+5jrCfskGJg8=;
	b=C/RxUkGIvC1trkLde7ELOcrRJTFX/YyTBVeqxDPOcpgYwMXYyUXrtmmSUhQ5qz65ax/jQH
	CAvGiAfvhE+ZmGAQ==
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
 <mikelley@microsoft.com>
Subject: Re: [patch v3 18/36] [patch V2 18/38] cpu/hotplug: Add CPU state
 tracking and synchronization
In-Reply-To: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
 <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:12:12 +0200
Message-ID: <87bkit1z6r.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 13:07, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:
>
>> +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>> +{
>> +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
>> +	int sync = atomic_read(st);
>> +
>> +	while (!atomic_try_cmpxchg(st, &sync, state));
>> +}
>
> Why isn't:
>
> 	atomic_set(st, state);
>
> any good?

Good question. It's only the other side (control CPU) which needs to be
careful.

Thanks,

        tglx

