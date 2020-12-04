Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6212CF341
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 18:42:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44978.80436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klF4q-0005Sm-51; Fri, 04 Dec 2020 17:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44978.80436; Fri, 04 Dec 2020 17:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klF4q-0005SQ-1b; Fri, 04 Dec 2020 17:41:04 +0000
Received: by outflank-mailman (input) for mailman id 44978;
 Fri, 04 Dec 2020 17:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNFP=FI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klF4o-0005SL-Io
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 17:41:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26e5b9c1-2b49-481a-8dfe-bc3d0714334a;
 Fri, 04 Dec 2020 17:41:01 +0000 (UTC)
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
X-Inumbo-ID: 26e5b9c1-2b49-481a-8dfe-bc3d0714334a
Date: Fri, 4 Dec 2020 09:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607103661;
	bh=soSQUAHUNCHxwjkh9H4HP2n+rYHdvJAaJr0J2mAgohU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=hrAMXRUiyz4L+3KRwO91Xg+znFWUDkJpUWurqK4DOudjjZXuG6rXczqCT+eTc2ytn
	 ndJ+nXqiADAsczR7SmxPGL31l/p9kdvtiEkb+1EMwiFKSdt4HronBylar7UrQZhnFq
	 IJKpMOGmg85st1oAawBLbsvH4Ln0TLNEVixfvb3TZaTIoi7u6q3t0JBh7fcLS0bdfO
	 zXweQ3RD1C6Ejbs1KeyqdpNQVI23ENGcAFzxgiU66xsT/PAy9o83WmRbHqO8ZQNCFq
	 XnAYXkNAec+56GnzPS2gHTh5wUrszGy+1ckNj++27E7xuzBtsFBib4hAjyVdwEtZ7I
	 krXimMCncX1Zw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    paul@xen.org, 'Paul Durrant' <pdurrant@amazon.com>, 
    'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>, 
    'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>, 
    'George Dunlap' <george.dunlap@citrix.com>, 
    'Stefano Stabellini' <sstabellini@kernel.org>, 
    'Christian Lindig' <christian.lindig@citrix.com>, 
    'David Scott' <dave@recoil.org>, 
    'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
In-Reply-To: <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
Message-ID: <alpine.DEB.2.21.2012040940160.32240@sstabellini-ThinkPad-T480s>
References: <20201203124159.3688-1-paul@xen.org> <20201203124159.3688-2-paul@xen.org> <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com> <00ee01d6c98b$507af1c0$f170d540$@xen.org> <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com> <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com> <011201d6ca16$ae14ac50$0a3e04f0$@xen.org> <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com> <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org> <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1843504570-1607103661=:32240"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1843504570-1607103661=:32240
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 4 Dec 2020, Andrew Cooper wrote:
> On 04/12/2020 11:45, Julien Grall wrote:
> > Hi,
> >
> > I haven't looked at the series yet. Just adding some thoughts on why
> > one would want such option.
> >
> > On 04/12/2020 09:43, Jan Beulich wrote:
> >> On 04.12.2020 09:22, Paul Durrant wrote:
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 04 December 2020 07:53
> >>>>
> >>>> On 03.12.2020 18:07, Paul Durrant wrote:
> >>>>>> From: Jan Beulich <jbeulich@suse.com>
> >>>>>> Sent: 03 December 2020 15:57
> >>>>>>
> >>>>>> ... this sound to me more like workarounds for buggy guests than
> >>>>>> functionality the hypervisor _needs_ to have. (I can appreciate
> >>>>>> the specific case here for the specific scenario you provide as
> >>>>>> an exception.)
> >>>>>
> >>>>> If we want to have a hypervisor that can be used in a cloud
> >>>>> environment
> >>>>> then Xen absolutely needs this capability.
> >>>>
> >>>> As per above you can conclude that I'm still struggling to see the
> >>>> "why" part here.
> >>>>
> >>>
> >>> Imagine you are a customer. You boot your OS and everything is just
> >>> fine... you run your workload and all is good. You then shut down
> >>> your VM and re-start it. Now it starts to crash. Who are you going
> >>> to blame? You did nothing to your OS or application s/w, so you are
> >>> going to blame the cloud provider of course.
> >>
> >> That's a situation OSes are in all the time. Buggy applications may
> >> stop working on newer OS versions. It's still the application that's
> >> in need of updating then. I guess OSes may choose to work around
> >> some very common applications' bugs, but I'd then wonder on what
> >> basis "very common" gets established. I dislike the underlying
> >> asymmetry / inconsistency (if not unfairness) of such a model,
> >> despite seeing that there may be business reasons leading people to
> >> think they want something like this.
> >
> > The discussion seems to be geared towards buggy guest so far. However,
> > this is not the only reason that one my want to avoid exposing some
> > features:
> >
> >    1) From the recent security issues (such as XSA-343), a knob to
> > disable FIFO would be quite beneficials for vendors that don't need
> > the feature.
> >
> >    2) Fleet management purpose. You may have a fleet with multiple
> > versions of Xen. You don't want your customer to start relying on
> > features that may not be available on all the hosts otherwise it
> > complicates the guest placement.
> >
> > FAOD, I am sure there might be other features that need to be
> > disabled. But we have to start somewhere :).
> 
> Absolutely top of the list, importance wise, is so we can test different
> configurations, without needing to rebuild the hypervisor (and to a
> lesser extent, without having to reboot).
> 
> It is a mistake that events/grants/etc were ever available unilaterally
> in HVM guests.  This is definitely a step in the right direction (but I
> thought it would be too rude to ask Paul to make all of those CDF flags
> at once).

+1

For FuSa we'll need to be able to disable them at some point soon.
--8323329-1843504570-1607103661=:32240--

