Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB774EA397
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 01:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295610.503136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYyhr-0006Uw-Lk; Mon, 28 Mar 2022 23:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295610.503136; Mon, 28 Mar 2022 23:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYyhr-0006Sx-IS; Mon, 28 Mar 2022 23:23:27 +0000
Received: by outflank-mailman (input) for mailman id 295610;
 Mon, 28 Mar 2022 23:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nYyhq-0006Sl-E7
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 23:23:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 107a244f-aeee-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 01:23:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DE3460E65;
 Mon, 28 Mar 2022 23:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64263C340ED;
 Mon, 28 Mar 2022 23:23:22 +0000 (UTC)
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
X-Inumbo-ID: 107a244f-aeee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648509803;
	bh=glcSDVK6qklPeLspum9Sl2AkohV1hm1plc9IOPlYaL0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fWQV3qUZupve9O7A5PV05eFBP+P8AAzNOX0MeTq5p6nmm+oFRTKEQQEivr9oTQcHv
	 X89xp37nxZ/o/ZQ4Psv0gTXQF8IooE5/90nfrvSXm8JUCZmIkkcy+fQEL195V3AUE7
	 Db0VbGp8xrmUj728S64C6KRqxkIszelpz6+i5ORd4N4GxFN4NLXbiDjx+Lg/B3DCJq
	 Ox5IgL6GEgiDaA5ftHO5lOBQ25NlQrLdU9rcJ4d+yQzzzMt8BAqXL93rYwfRIuG76g
	 mvQ5/CCIwmE0Yx0Y7o8jw9xln8YAv+yEHTrYWhREHWMuLd8dPL8usBNzsz395k2053
	 sgpbRuHGvD6oQ==
Date: Mon, 28 Mar 2022 16:23:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith.dev@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
In-Reply-To: <efb76b14-59a1-0e26-d0ae-2e3ba7bd29f3@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203281621340.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-2-sstabellini@kernel.org> <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com> <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com> <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop> <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org> <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
 <efb76b14-59a1-0e26-d0ae-2e3ba7bd29f3@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Mar 2022, Daniel P. Smith wrote:
> On 3/25/22 17:05, Stefano Stabellini wrote:
> > On Fri, 25 Mar 2022, Julien Grall wrote:
> >> So to me, the idea of switching to a "fake" domain or bypassing the check is
> >> more appealing. I have a preference for the "fake" domain here.
> > 
> > As a maintainer, I am not opposed to the "fake"/"contructor" domain
> > concept.  It all depends on how many instances of this issue we are
> > going to have.  This is the only one on xen-devel so far. I don't think
> > it is worth adding a constructor domain for one instance only.  But I
> > agree with you and Daniel that if we end up with several instances, then
> > the constructor domain approach is probably the best option overall.
> > 
> > 
> > As a contributor, sadly I won't be able to spend a lot of time on this
> > in the following months. If a significant rework is required, I don't
> > think I'll be able to do it, at least not for this Xen release (and it
> > would be nice to have dom0less PV drivers in the coming release.) If
> > Daniel is willing, I could add his "idle_domain is_priv" patch to this
> > series.  Not as clean as a proper constructor domain but it would work
> > and it would be simple. It could be evolved into a nicer constructor
> > domain later.
> > 
> > This is not my preference but I could do that if Julien and Jan prefer
> > this approach and if Daniel is happy to share his patch.
> > 
> > 
> >> AFAIU, your proposal is to duplicate code. This brings other risks such as
> >> duplicated bug and more code to maintain.
> > 
> > Got it. I'll make one last attempt at a proposal that doesn't involve
> > the fake constructor domain. The goal is to avoid code duplication while
> > providing a safe way forward to make progress with only a small amount
> > of changes. What if we:
> > 
> > - rename evtchn_alloc_unbound to _evtchn_alloc_unbound (still static)
> > - add a skip_xsm parameter to _evtchn_alloc_unbound
> > - introduce a wrapper evtchn_alloc_unbound that always set skip_xsm to
> >   false (same interface as today's evtchn_alloc_unbound)
> > - introduce an __init early_evtchn_alloc_unbound public function that
> >   sets skip_xsm to true
> > 
> > This way:
> > - we have a single implementation in _evtchn_alloc_unbound (no code
> >   duplication)
> > - the only function exposed that skips the XSM check is __init
> > - evtchn_alloc_unbound continue to have the XSM check same as today
> > 
> > 
> > E.g.:
> > static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
> > {
> >     ...
> > }
> > 
> > static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > {
> >     return _evtchn_alloc_unbound(alloc, false);    
> > }
> > 
> > int __init early_evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > {
> >     return _evtchn_alloc_unbound(alloc, true);
> > }
> > 
> > 
> > Would this be good enough for now?
> 
> Please see the RFC patch I just posted[1], IMHO I think this is a safer
> approach for this specific instance.
> 
> [1]
> https://lore.kernel.org/xen-devel/20220328203622.30961-1-dpsmith@apertussolutions.com/T/#t

I read it, the patch looks fine. I also tested it together with my
series and it solves the problem. With [1], it is just a matter of
making evtchn_alloc_unbound as is non-static.

If the other maintainers also agree with [1], then I'll just rebase on
it and limit my changes to exporting evtchn_alloc_unbound.

