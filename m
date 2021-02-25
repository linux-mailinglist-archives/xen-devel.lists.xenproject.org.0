Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B973258B3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 22:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89983.170091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFOHt-0006Jv-NH; Thu, 25 Feb 2021 21:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89983.170091; Thu, 25 Feb 2021 21:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFOHt-0006JZ-Jo; Thu, 25 Feb 2021 21:35:09 +0000
Received: by outflank-mailman (input) for mailman id 89983;
 Thu, 25 Feb 2021 21:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjlP=H3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFOHr-0006JU-Po
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 21:35:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df0ee3b6-c943-4e55-9e4b-d15c57dc9984;
 Thu, 25 Feb 2021 21:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4A5E64EC4;
 Thu, 25 Feb 2021 21:35:05 +0000 (UTC)
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
X-Inumbo-ID: df0ee3b6-c943-4e55-9e4b-d15c57dc9984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614288906;
	bh=l47WobQyvLKVYH5ft90DfRxCmnuUHpzw5U2SngnPGNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iSzHVol3WShxCPNFl3fEWhORnyCBqDA7PlQ5HHggcLtafy/tAqtZWgN4d8brS5V63
	 nIL45jRMPLDDga4ESeeWRbbONSNzjLu7jqY4mwQNQQwoHEupHl2XlLrU3ZAwVinPZA
	 LT3kAZRc21xUnHtDHfK6DjyStzKzCEI9IgNA20cHch/3v5x7uSFet4mfKGvENwGtxs
	 3App47MbTg2b2iiplxE9r0kmyJig4DWbbrigvYV/JvcsNEyKtSCcNUxkVDRoXlIAlD
	 1Qahlzqqf8Mu2FpletGVp5dtEBfYyunaarTnVvEWQbfVZ4maD64J7QWaHu6nWNHr6k
	 XqVEkt8/fEmtw==
Date: Thu, 25 Feb 2021 13:35:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Ash Wilding <ash.j.wilding@gmail.com>, dfaggioli@suse.com, 
    george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com, 
    jgrall@amazon.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
In-Reply-To: <ee1d43f2-4c2c-66e0-8ad0-c32ca1c7969f@xen.org>
Message-ID: <alpine.DEB.2.21.2102251333200.3234@sstabellini-ThinkPad-T480s>
References: <20210220194701.24202-1-julien@xen.org> <20210223132408.10283-1-ash.j.wilding@gmail.com> <ee1d43f2-4c2c-66e0-8ad0-c32ca1c7969f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Feb 2021, Julien Grall wrote:
> On 23/02/2021 13:24, Ash Wilding wrote:
> > Hi Julien,
> 
> Hi Ash,
> 
> > Thanks for looking at this,
> > 
> > > vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the
> > > CPU to read any information about local events before the flag
> > > _VPF_blocked is set.
> > 
> > Reviewed-by: Ash Wilding <ash.j.wilding@gmail.com>
> 
> Thanks!
> 
> > 
> > 
> > As an aside,
> > 
> > > I couldn't convince myself whether the Arm implementation of
> > > local_events_need_delivery() contains enough barrier to prevent the
> > > re-ordering. However, I don't think we want to play with devil here
> > > as the function may be optimized in the future.
> > 
> > Agreed.
> > 
> > The vgic_vcpu_pending_irq() and vgic_evtchn_irq_pending() in the call
> > path of local_events_need_delivery() both call spin_lock_irqsave(),
> > which has an arch_lock_acquire_barrier() in its call path.
> > 
> > That just happens to map to a heavier smp_mb() on Arm right now, but
> > relying on this behaviour would be shaky; I can imagine a future update
> > to arch_lock_acquire_barrier() that relaxes it down to just acquire
> > semantics like its name implies (for example an LSE-based lock_acquire()
> > using LDUMAXA),in which case any code incorrectly relying on that full
> > barrier behaviour may break. I'm guessing this is what you meant by the
> > function may be optimized in future?
> 
> That's one of the optimization I had in mind. The other one is we may find a
> way to remove the spinlocks, so the barriers would disappear completely.
> 
> > 
> > Do we know whether there is an expectation for previous loads/stores
> > to have been observed before local_events_need_delivery()? I'm wondering
> > whether it would make sense to have an smb_mb() at the start of the
> > *_nomask() variant in local_events_need_delivery()'s call path.
> 
> That's a good question :). For Arm, there are 4 users of
> local_events_need_delivery():
>   1) do_poll()
>   2) vcpu_block()
>   3) hypercall_preempt_check()
>   4) general_preempt_check()
> 
> 3 and 4 are used for breaking down long running operations. I guess we would
> want to have an accurate view of the pending events and therefore we would
> need a memory barrier to prevent the loads happening too early.
> 
> In this case, I think the smp_mb() would want to be part of the
> hypercall_preempt_check() and general_preempt_check().
> 
> Therefore, I think we want to avoid the extra barrier in
> local_events_need_delivery(). Instead, we should require the caller to take
> care of the ordering if needed.
> 
> This would have benefits any new architecture as the common code would already
> contain the appropriate barriers.
> 
> @Stefano, what do you think?

I am thinking the same way as you. Also because it is cleaner if it is
the one who writes that also takes care of any barriers/flushes needed.

In this case it is vcpu_block that is writing _VPF_blocked and knows
that it has to be seen before local_events_need_delivery(). It is easier
to keep track of it if the barrier is in vcpu_block together with the
set_bit call.

