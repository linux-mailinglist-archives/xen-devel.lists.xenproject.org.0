Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5BF27643F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 00:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLDhV-0003KL-5D; Wed, 23 Sep 2020 22:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDdr=DA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kLDhU-0003KG-Aw
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 22:57:24 +0000
X-Inumbo-ID: 0777d2c5-eda4-4ce9-95c1-59b8205f9cb9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0777d2c5-eda4-4ce9-95c1-59b8205f9cb9;
 Wed, 23 Sep 2020 22:57:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25B12221EB;
 Wed, 23 Sep 2020 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600901842;
 bh=ywFJpMGTv5jG5jbg33/I94cuq14ijF9WgxWFcU7XNv0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zsV8kbz65yCEw7i2g4+2OClrE0XiFvFrGmFiW4cVcrsAcho4eYxsFyt4OWVIyJ399
 sJvsTHs2NiSaend0kP6eDLdU81tl5Xv2E6yjIaMdJKdjP2s3xlhLHRvm1k2MqyLe5S
 O4pSEPqdT1uJZz/E/bmZT1vwtWSzJzaKi1cxqpY8=
Date: Wed, 23 Sep 2020 15:57:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, 
 "Xia, Hongyan" <hongyxia@amazon.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Memory ordering question in the shutdown deferral code
In-Reply-To: <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
Message-ID: <alpine.DEB.2.21.2009231541410.1495@sstabellini-ThinkPad-T480s>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
 <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 21 Sep 2020, Julien Grall wrote:
> On 21/09/2020 13:55, Durrant, Paul wrote:
> > > (+ Xen-devel)
> > > 
> > > Sorry I forgot to CC xen-devel.
> > > 
> > > On 21/09/2020 12:38, Julien Grall wrote:
> > > > Hi all,
> > > > 
> > > > I have started to look at the deferral code (see
> > > > vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and
> > > > Arm will soon use it.
> > > > 
> > > > The current implementation is using an smp_mb() to ensure ordering
> > > > between a write then a read. The code looks roughly (I have slightly
> > > > adapted it to make my question more obvious):
> > > > 
> > > > domain_shutdown()
> > > >       d->is_shutting_down = 1;
> > > >       smp_mb();
> > > >       if ( !vcpu0->defer_shutdown )
> > > >       {
> > > >         vcpu_pause_nosync(v);
> > > >         v->paused_for_shutdown = 1;
> > > >       }
> > > > 
> > > > vcpu_start_shutdown_deferral()
> > > >       vcpu0->defer_shutdown = 1;
> > > >       smp_mb();
> > > >       if ( unlikely(d->is_shutting_down) )
> > > >         vcpu_check_shutdown(v);
> > > > 
> > > >       return vcpu0->defer_shutdown;
> > > > 
> > > > smp_mb() should only guarantee ordering (this may be stronger on some
> > > > arch), so I think there is a race between the two functions.
> > > > 
> > > > It would be possible to pause the vCPU in domain_shutdown() because
> > > > vcpu0->defer_shutdown wasn't yet seen.
> > > > 
> > > > Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down
> > > > and therefore Xen may continue to send the I/O. Yet the vCPU will be
> > > > paused so the I/O will never complete.
> > > > 
> > 
> > The barrier enforces global order, right?
> 
> It is not clear to me what you mean by "global ordering". This seems to
> suggest a very expensive synchronization barrier between all the processors.
> 
> From an arch-agnostic PoV, smp_mb() will enforce an ordering between
> loads/stores but it doesn't guarantee *when* they will be observed.
> 
> > So, if domain_shutdown() pauses the vcpu then is_shutting_down must
> > necessarily be visible all cpus.
> 
> That's not the guarantee provided by smp_mb() (see above).


I simplified the code further to help us reason about it:


   thread#1 |  thread#2
            |
1) WRITE A  |  WRITE B
2) BARRIER  |  BARRIER
3) READ B   |  READ A


I think it is (theoretically) possible for thread#1 to be at 1) and
about to do 2), while thread#2 goes ahead and does 1) 2) 3). By the time
thread#1 does 2), thread#2 has already completed the entire sequence.

If thread#2 has already done 2), and thread#1 is about to do 3), then I
think we are guaranteed that thread#1 will see the new value of B. Or
is this the core of the issue we are discussing?

If it works the way I wrote, then it would confirm Paul's view.


For your information I went to check what the Linux memory model has to
say about this. It says:

"smp_mb() guarantees to restore sequential consistency among accesses that use READ_ONCE, WRITE_ONCE(), or stronger. For example, the following Linux-kernel code would forbid non-SC outcomes"

It is interesting that they chose the words "restore sequential
consistency". It would be difficult to come up with an example that has
"sequential consistency" but doesn't work the way described earlier.

