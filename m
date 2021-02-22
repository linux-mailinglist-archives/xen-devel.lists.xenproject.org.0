Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574C3220A1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 21:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88370.166139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHW2-0005FF-5Z; Mon, 22 Feb 2021 20:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88370.166139; Mon, 22 Feb 2021 20:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHW2-0005Eq-2N; Mon, 22 Feb 2021 20:09:10 +0000
Received: by outflank-mailman (input) for mailman id 88370;
 Mon, 22 Feb 2021 20:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zptr=HY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEHW0-0005El-E1
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 20:09:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 421d96f0-4ecb-4103-9c0a-bcebd22fd0b9;
 Mon, 22 Feb 2021 20:09:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666B164DF2;
 Mon, 22 Feb 2021 20:09:06 +0000 (UTC)
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
X-Inumbo-ID: 421d96f0-4ecb-4103-9c0a-bcebd22fd0b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614024546;
	bh=xin9vc9mBGli/0hU6z+Gj/4wKbJmYC+lxAce91Trq14=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IR8CXf9aGGSILZYntATZyKIlTYx56VHSTaNmtr58uefn8uvjs9+H3mv4o5zjlTaBE
	 vj7BngMt2RwZ4R/06YkGxZmITU1m1++4SFJmTkAegGueZhFJSksvhenr9BzUz0RzWz
	 ffdGdGhRXE2QajGiJ0FWKiUaJUU6QUMr+AT+tvjG0irynnKm68qzDTVL05nU+KO/ia
	 lNLC17vfnhOY7Uz7zjow+Sn8lP+aq0SU6IRrAvzS7nUBVifZzC9lpKCc6WpOwceZ9n
	 JsxBi5dPEsk+IVLbABxm5QpnYi27/nwWd4nma1Hgb/KXUdUyUY7uG2kkN1/KeHdNni
	 cOAVtt9IoU3rQ==
Date: Mon, 22 Feb 2021 12:09:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, iwj@xenproject.org, sstabellini@kernel.org, 
    ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
In-Reply-To: <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com>
Message-ID: <alpine.DEB.2.21.2102221208050.3234@sstabellini-ThinkPad-T480s>
References: <20210220194701.24202-1-julien@xen.org> <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1133757694-1614024546=:3234"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1133757694-1614024546=:3234
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Feb 2021, Jan Beulich wrote:
> On 20.02.2021 20:47, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > The comment in vcpu_block() states that the events should be checked
> > /after/ blocking to avoids wakeup waiting race. However, from a generic
> > perspective, set_bit() doesn't prevent re-ordering. So the following
> > could happen:
> > 
> > CPU0  (blocking vCPU A)         |   CPU1 ( unblock vCPU A)
> >                                 |
> > A <- read local events          |
> >                                 |   set local events
> >                                 |   test_and_clear_bit(_VPF_blocked)
> >                                 |       -> Bail out as the bit if not set
> >                                 |
> > set_bit(_VFP_blocked)           |
> >                                 |
> > check A                         |
> > 
> > The variable A will be 0 and therefore the vCPU will be blocked when it
> > should continue running.
> > 
> > vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the CPU
> > to read any information about local events before the flag _VPF_blocked
> > is set.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> > This is a follow-up of the discussion that started in 2019 (see [1])
> > regarding a possible race between do_poll()/vcpu_unblock() and the wake
> > up path.
> > 
> > I haven't yet fully thought about the potential race in do_poll(). If
> > there is, then this would likely want to be fixed in a separate patch.
> > 
> > On x86, the current code is safe because set_bit() is fully ordered. SO
> > the problem is Arm (and potentially any new architectures).
> > 
> > I couldn't convince myself whether the Arm implementation of
> > local_events_need_delivery() contains enough barrier to prevent the
> > re-ordering. However, I don't think we want to play with devil here as
> > the function may be optimized in the future.
> 
> In fact I think this ...
> 
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -1418,6 +1418,8 @@ void vcpu_block(void)
> >  
> >      set_bit(_VPF_blocked, &v->pause_flags);
> >  
> > +    smp_mb__after_atomic();
> > +
> 
> ... pattern should be looked for throughout the codebase, and barriers
> be added unless it can be proven none is needed.

And in that case it would be best to add an in-code comment to explain
why the barrier is not needed
--8323329-1133757694-1614024546=:3234--

