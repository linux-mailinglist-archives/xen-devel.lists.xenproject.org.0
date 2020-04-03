Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D819DB4B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:19:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKP1u-0008EE-0a; Fri, 03 Apr 2020 16:18:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NL/P=5T=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jKP1s-0008E8-0R
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:18:48 +0000
X-Inumbo-ID: cbe02006-75c6-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbe02006-75c6-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 16:18:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAD8020721;
 Fri,  3 Apr 2020 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585930727;
 bh=1Z1tLPwdMmtEsVeNe7Zs+sOCeoJdr2OoNTpNXrY1DNw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eiggfE5BQnwHebtHB+ygrxNM/p4sEv+qJG/4TvCCYBYroYwcZDC2zX8U0oFuVQffl
 5M6nbuDM6TOWS+GBzNROnL6B8edPbxt5NT/ytQ66soPlufV4iH968dPdWOovZas8Pk
 uMaHzJMntCyh0Mw/qZna9RBJyegaqjSe605ZAWfQ=
Date: Fri, 3 Apr 2020 09:18:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
Message-ID: <alpine.DEB.2.21.2004030809300.23034@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, George.Dunlap@citrix.com,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 3 Apr 2020, Marc Zyngier wrote:
> > > Yeah I missed to highlight it, also because I look at it from a slightly
> > > different perspective: I think IRQ latency is part of correctness.
> 
> No. Low latency is a very desirable thing, but it doesn't matter at all when
> you don't even have functional correctness.

Hi Marc,

It is good to hear from you. Functional correctness can still lead to
breakage. I wrote more details in last part of this email to explain in
details, it is long but please read it all!

[...]

> Please find anything that specifies latency in the GIC spec. Oh wait,
> there is none. Because that's a quality of implementation thing, and
> not a correctness issue.

The goal of being faithful to the spec is not compliance for the sake of
it. I take neither you nor me actually care about labels with compliance
logos to attach anywhere. The goal is to run guests correctly when
virtualized. Do you agree with me so far?

The difficult question is: what happens when the hypervisor is faithful
to the spec, but guests still break?


> > In all honesty, writing and testing the implementation would have
> > likely took you less than trying to push for "creative" ideas or your
> > patch.
> > 
> > > In terms of other "creative" ideas, here are some:
> > 
> > "creative" ideas should really be the last resort. Correct me if I am
> > wrong, but I don't think we are there yet.
> > 
> > > 
> > > One idea, as George suggested, would be to document the interface
> > > deviation. The intention is still to remove any deviation but at least
> > > we would be clear about what we have. Ideally in a single place together
> > > with other hypervisors. This is my preference.
> > 
> > It is not without saying that deviation from specification should not
> > be taken lightly and has risks.
> > 
> > The main risk is you are never going to be able to reliably run an OS
> > on Xen unless you manage to get the deviation accepted by the wider
> > community and Arm.
> 
> There is just no way I'll ever accept a change to the GIC interrupt state
> machine for Linux. Feel free to try and convince other OS maintainers.
> 
> If you want to be creative, be really creative. Implement a fully PV interrupt
> controller that gives you simple enough semantics so that you can actually be
> deterministic. Don't pretend you implement the GIC architecture.

Last time we looked at KVM, KVM was actually doing what my patch here
does, not what Julien suggested. (In short, my patch is implementing
ISACTIVER accurately only for the current vcpu and not the others;
Julien is suggesting to send an IPI to other pcpus running vcpus so that
the implementation becomes accurate for other vcpus too.)


> > > Another idea is that we could crash the guest if GICD_ISACTIVER is read
> > > from a multi-vcpu guest. It is similar to what we already do today but
> > > better because we would do it purposely (not because of a typo) and
> > > because it will work for single vcpu guests at least.
> > > 
> > > We could also leave it as is (crash all the time) but it implies that
> > > vendors that are seeing issues with Linux today will have to keep
> > > maintaining patches in their private trees until a better solution is
> > > found. This would also be the case if we crash multi-vcpus guests as
> > > previously suggested.
> 
> OK, that's just insane. Suggesting that guests should be left crashing
> because the are doing *the right thing* is just barking mad. I'm all for
> exposing guest bugs when they take shortcuts with the architecture, but
> blaming the guest for what is just a bug in Xen?
> 
> If I was someone developing a product using Xen/ARM, I'd be very worried
> about what you have written above. Because it really reads "we don't care
> about reliability as long as we can show amazing numbers". I really hope
> it isn't what you mean.

It is not what I am saying, and I am glad I have an opportunity to
explain it.

Don't think about low latency numbers as: "great it runs faster!" I
don't care about that. Well, I care, but not that much, certainly not at
the expense of being faithful to the spec.

Customers here are running guests and workloads that fail spectacularly
if they don't get IRQ latency within low deterministic ranges. A latency
spike can cause a severe failure, as bad a failure as a total system
crash.

Today, these guests don't use ISACTIVER at all AFAIK, but let's imagine
that in the future they will. Being latency sensitive guests, I doubt
they'll ever loop over ISACTIVER, but maybe they could call it once at
initialization time or during shutdown of something? Also, let's say
implementing ISACTIVER faithfully with an IPI to another vcpus might
cause a latency spikes (note that we don't have numbers on this).

Does this scenario make sense to you so far?

If we implement ISACTIVER using an IPI we introduce a significant source
of non-determinism. We yank the other vcpu into hypervisor mode when it
could have been running the critical section. It can very well cause one
of those spectacular failures. It might take the engineers putting the
system together a very significant amount of time to figure out the
problem.

Doing what my patch here does might be OK until one of these guests
start to rely on ISACTIVER to be accurate. So far I have not seen any
examples of it, but I agree it could happen, hence, it is risky.
Frankly, I thought that KVM was already behaving the way of my patch and
it was making me feel more confident about this solution.

Finally the last option is to just crash early. It is not blaming the
guest -- it would serve as an early warning that something is not right
and needs to be done about the system. Typically, it is better to fail
early and clearly rather than at some point later more subtly.

