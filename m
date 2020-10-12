Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE428B20F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 12:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5883.15277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRupw-0004Eq-PK; Mon, 12 Oct 2020 10:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5883.15277; Mon, 12 Oct 2020 10:13:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRupw-0004ER-Lz; Mon, 12 Oct 2020 10:13:48 +0000
Received: by outflank-mailman (input) for mailman id 5883;
 Mon, 12 Oct 2020 10:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwhd=DT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kRupu-0004EM-7H
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:13:47 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8580d5f3-3d6a-42fb-ad8d-f5bba176dd19;
 Mon, 12 Oct 2020 10:13:43 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRupj-0003tb-DR; Mon, 12 Oct 2020 10:13:35 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 485E3304B90;
 Mon, 12 Oct 2020 12:13:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9CFB320AEA645; Mon, 12 Oct 2020 12:13:30 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pwhd=DT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kRupu-0004EM-7H
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:13:47 +0000
X-Inumbo-ID: 8580d5f3-3d6a-42fb-ad8d-f5bba176dd19
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8580d5f3-3d6a-42fb-ad8d-f5bba176dd19;
	Mon, 12 Oct 2020 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dn/O7OmyBKPjXz4w+vIDufrUCX0e5WR00/QXRFI14Wc=; b=prmzH2eD4I4CqdlEZQDpN4SQCB
	jY2hODRzO7/iAF5kObY8UBFy/jzJZByMbwnxgYL7Awp/F8v/UtIH/41XK0DtskSN7qFUsa4aEWGAa
	z0aBhy7Uc8HbtB8CmIXh9bv0Wud7hj0/d1Gf01HcqAQ5U+owxFXsADpzgR03FPiKwARAjlehGjVDy
	CdMFxOwr1hJusThxWOFoA/TJ44MuKFI2IliDG515XKOVkqbOmm2wCYCzXJZw2U8FSTdRZBmqKZ7iS
	4SuHgk72HnWzgZdkcvtFKUKsAMT99+mCfVZqw2gKQyiWP8Nd/c9Y2IwIGdVoXniV36pcaRbiBb0+6
	GGFsM+uA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRupj-0003tb-DR; Mon, 12 Oct 2020 10:13:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 485E3304B90;
	Mon, 12 Oct 2020 12:13:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CFB320AEA645; Mon, 12 Oct 2020 12:13:30 +0200 (CEST)
Date: Mon, 12 Oct 2020 12:13:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] x86/alternative: don't call text_poke() in lazy TLB mode
Message-ID: <20201012101330.GR2628@hirez.programming.kicks-ass.net>
References: <20201009144225.12019-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009144225.12019-1-jgross@suse.com>

On Fri, Oct 09, 2020 at 04:42:25PM +0200, Juergen Gross wrote:
> When running in lazy TLB mode the currently active page tables might
> be the ones of a previous process, e.g. when running a kernel thread.
> 
> This can be problematic in case kernel code is being modified via
> text_poke() in a kernel thread, and on another processor exit_mmap()
> is active for the process which was running on the first cpu before
> the kernel thread.
> 
> As text_poke() is using a temporary address space and the former
> address space (obtained via cpu_tlbstate.loaded_mm) is restored
> afterwards, there is a race possible in case the cpu on which
> exit_mmap() is running wants to make sure there are no stale
> references to that address space on any cpu active (this e.g. is
> required when running as a Xen PV guest, where this problem has been
> observed and analyzed).
> 
> In order to avoid that, drop off TLB lazy mode before switching to the
> temporary address space.

Oh man, that must've been 'fun' :/

> Fixes: cefa929c034eb5d ("x86/mm: Introduce temporary mm structs")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/kernel/alternative.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index cdaab30880b9..cd6be6f143e8 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -807,6 +807,15 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
>  	temp_mm_state_t temp_state;
>  
>  	lockdep_assert_irqs_disabled();
> +
> +	/*
> +	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
> +	 * with a stale address space WITHOUT being in lazy mode after
> +	 * restoring the previous mm.
> +	 */
> +	if (this_cpu_read(cpu_tlbstate.is_lazy))
> +		leave_mm(smp_processor_id());
> +
>  	temp_state.mm = this_cpu_read(cpu_tlbstate.loaded_mm);
>  	switch_mm_irqs_off(NULL, mm, current);

Would it make sense to write it like:

	this_state.mm = this_cpu_read(cpu_tlbstate.is_lazy) ?
			&init_mm : this_cpu_read(cpu_tlbstate.loaded_mm);

Possibly with that wrapped in a conveniently named helper function.


