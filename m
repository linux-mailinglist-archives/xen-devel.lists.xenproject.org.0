Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B070A413029
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191563.341643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSb8s-0006y7-7t; Tue, 21 Sep 2021 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191563.341643; Tue, 21 Sep 2021 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSb8s-0006wJ-4X; Tue, 21 Sep 2021 08:28:42 +0000
Received: by outflank-mailman (input) for mailman id 191563;
 Tue, 21 Sep 2021 08:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6EE=OL=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mSb8q-0006wD-Ew
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:28:41 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e1b11eb-0899-4a09-b328-2efbc863dc62;
 Tue, 21 Sep 2021 08:28:37 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSb7l-003dSV-QU; Tue, 21 Sep 2021 08:27:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EFA53300252;
 Tue, 21 Sep 2021 10:27:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C97CD213969B1; Tue, 21 Sep 2021 10:27:32 +0200 (CEST)
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
X-Inumbo-ID: 0e1b11eb-0899-4a09-b328-2efbc863dc62
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3pGj8C8pWUiQBpKJtGVzknsFdRDfba8Mc0AV+KNc0rs=; b=lj3fL5TA/SHrtjjBNRJLFNmF+r
	ApEI0NEfHknyBJuuqWRBOpq3IUCjYhRNG1iMmW4H9+KeW1m+2T7sIPbkGQY5y7Nz23k74qcp62ezp
	E4ILAOwxrDfVl0C88TY4pOY2hpzbWDUjNt1UqdViBmSMyCa0pTXr4SVD7jeAMKZTxWJs1+UK6TnX/
	3Xk0DGp8rheZZ1w7uFMACeKPdrqynr5hwUjL1A4svkkgPKpNa8u1Qpm1uj6GwgkcB0t29T9OSjUd9
	QCK/yhOpoevqRgJvBfe5PzdJQ1BKgc3mvum6RljFYCF3T30fHkgfYdC6Yl2G7VVWKFtJ/uO4E1zsG
	z1kNBDuQ==;
Date: Tue, 21 Sep 2021 10:27:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
Message-ID: <YUmXdEGhgEoukk80@hirez.programming.kicks-ass.net>
References: <20210921070226.32021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921070226.32021-1-jgross@suse.com>

On Tue, Sep 21, 2021 at 09:02:26AM +0200, Juergen Gross wrote:
> Disabling preemption in xen_irq_enable() is not needed. There is no
> risk of missing events due to preemption, as preemption can happen
> only in case an event is being received, which is just the opposite
> of missing an event.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/irq.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
> index dfa091d79c2e..ba9b14a97109 100644
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
>  {
>  	struct vcpu_info *vcpu;
>  
> -	/*
> -	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
> -	 * cleared, so disable preemption to ensure we check for
> -	 * events on the VCPU we are still running on.
> -	 */
> -	preempt_disable();
> -
>  	vcpu = this_cpu_read(xen_vcpu);
>  	vcpu->evtchn_upcall_mask = 0;
>  
> -	/* Doesn't matter if we get preempted here, because any
> -	   pending event will get dealt with anyway. */
> +	/*
> +	 * Now preemption could happen, but this is only possible if an event
> +	 * was handled, so missing an event due to preemption is not
> +	 * possible at all.
> +	 * The worst possible case is to be preempted and then check events
> +	 * pending on the old vcpu, but this is not problematic.
> +	 */
>  
>  	barrier(); /* unmask then check (avoid races) */
>  	if (unlikely(vcpu->evtchn_upcall_pending))
>  		xen_force_evtchn_callback();
> -
> -	preempt_enable();
>  }
>  PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable);
>  
> -- 
> 2.26.2
> 

So the reason I asked about this is:

  vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count_add() leaves .noinstr.text section
  vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_add() leaves .noinstr.text section

as reported by sfr here:

  https://lkml.kernel.org/r/20210920113809.18b9b70c@canb.auug.org.au

(I'm still not entirely sure why I didn't see them in my build, or why
0day didn't either)

Anyway, I can 'fix' xen_irq_disable(), see below, but I'm worried about
that still having a hole vs the preempt model. Consider:

xen_irq_disable()
  preempt_disable();
  <IRQ>
    set_tif_need_resched()
  </IRQ no preemption because preempt_count!=0>
  this_cpu_read(xen_vcpu)->evtchn_upcall_mask = 1; // IRQs are actually disabled
  preempt_enable_no_resched(); // can't resched because IRQs are disabled 

  ...

xen_irq_enable()
  preempt_disable();
  vcpu->evtch_upcall_mask = 0; // IRQs are on
  preempt_enable() // catches the resched from above


Now your patch removes that preempt_enable() and we'll have a missing
preemption.

Trouble is, because this is noinstr, we can't do schedule().. catch-22

---
Subject: x86/xen: Fixup noinstr in xen_irq_{en,dis}able()
From: Peter Zijlstra <peterz@infradead.org>
Date: Mon Sep 20 13:46:19 CEST 2021

  vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count_add() leaves .noinstr.text section
  vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_add() leaves .noinstr.text section

XXX, trades it for:

  vmlinux.o: warning: objtool: xen_irq_enable()+0x5c: call to __SCT__preempt_schedule_notrace() leaves .noinstr.text section

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/xen/irq.c |   24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -44,12 +44,18 @@ __PV_CALLEE_SAVE_REGS_THUNK(xen_save_fl,
 
 asmlinkage __visible noinstr void xen_irq_disable(void)
 {
-	/* There's a one instruction preempt window here.  We need to
-	   make sure we're don't switch CPUs between getting the vcpu
-	   pointer and updating the mask. */
-	preempt_disable();
+	/*
+	 * There's a one instruction preempt window here.  We need to
+	 * make sure we're don't switch CPUs between getting the vcpu
+	 * pointer and updating the mask.
+	 */
+	preempt_disable_notrace();
 	this_cpu_read(xen_vcpu)->evtchn_upcall_mask = 1;
-	preempt_enable_no_resched();
+	/*
+	 * We have IRQs disabled at this point, rescheduling isn't going to
+	 * happen, so no point calling into the scheduler for it.
+	 */
+	preempt_enable_no_resched_notrace();
 }
 __PV_CALLEE_SAVE_REGS_THUNK(xen_irq_disable, ".noinstr.text");
 
@@ -62,7 +68,7 @@ asmlinkage __visible noinstr void xen_ir
 	 * cleared, so disable preemption to ensure we check for
 	 * events on the VCPU we are still running on.
 	 */
-	preempt_disable();
+	preempt_disable_notrace();
 
 	vcpu = this_cpu_read(xen_vcpu);
 	vcpu->evtchn_upcall_mask = 0;
@@ -74,7 +80,11 @@ asmlinkage __visible noinstr void xen_ir
 	if (unlikely(vcpu->evtchn_upcall_pending))
 		xen_force_evtchn_callback();
 
-	preempt_enable();
+	/*
+	 * XXX if we noinstr we shouldn't be calling schedule(), OTOH we also
+	 * cannot not schedule() as that would violate PREEMPT.
+	 */
+	preempt_enable_notrace();
 }
 __PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable, ".noinstr.text");
 

