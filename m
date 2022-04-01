Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6B4EE567
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297143.506068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Fn-0006Vi-Kl; Fri, 01 Apr 2022 00:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297143.506068; Fri, 01 Apr 2022 00:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Fn-0006So-HC; Fri, 01 Apr 2022 00:35:03 +0000
Received: by outflank-mailman (input) for mailman id 297143;
 Fri, 01 Apr 2022 00:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5Fl-0006Sa-OR
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:35:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900e8736-b153-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:35:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99ACBB8227A;
 Fri,  1 Apr 2022 00:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB51BC340EE;
 Fri,  1 Apr 2022 00:34:57 +0000 (UTC)
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
X-Inumbo-ID: 900e8736-b153-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773298;
	bh=jnr3ygKO8CAVdT+15YHoss+zHbMtAIEXiyHmYDI2Myg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qQQQkVRlcS8S6GDR6IK/2XRgepiKTYrFuTBLOzRripm6ka9/RuKDiCf5Zblyrx9cd
	 HByiOF9K+0B+9P/4I+MlOy7564zjLhR0IfygGGAK9K9TcEI0MQcC+5x9eSOsY5sYE6
	 5r9Bq4jrJyoc2+t0yjPom0WlC9GE+dgE/83JShEHa7Ie3GwGIUgJ0gOaH2BZkmkejj
	 drtp+0zyQDu+9TPOsljO5oUXXcOvRng7oMFUK1PIsvOEtACrva4EWL7s9heeiMhWCq
	 zMbdQlOhIgskW/A6xyu5U0fNjRfLPJ0hRH/p3hHh6wezq2AfmepDFeC2H1OWXp3c1J
	 TRU5qxKeEOZfQ==
Date: Thu, 31 Mar 2022 17:34:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <799f69b2-f581-9f5f-004a-8f9f790aba2a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203311341220.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-3-sstabellini@kernel.org> <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org> <alpine.DEB.2.22.394.2203221722430.2910984@ubuntu-linux-20-04-desktop>
 <799f69b2-f581-9f5f-004a-8f9f790aba2a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Mar 2022, Julien Grall wrote:
> On 23/03/2022 01:18, Stefano Stabellini wrote:
> > On Sat, 29 Jan 2022, Julien Grall wrote:
> > > On 28/01/2022 21:33, Stefano Stabellini wrote:
> > > > +    rc = evtchn_alloc_unbound(&alloc, true);
> > > > +    if ( rc )
> > > > +    {
> > > > +        printk("Failed allocating event channel for domain\n");
> > > > +        return rc;
> > > > +    }
> > > > +
> > > > +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >    static int __init construct_domU(struct domain *d,
> > > >                                     const struct dt_device_node *node)
> > > >    {
> > > > @@ -3014,7 +3043,19 @@ static int __init construct_domU(struct domain
> > > > *d,
> > > >            return rc;
> > > >          if ( kinfo.vpl011 )
> > > > +    {
> > > >            rc = domain_vpl011_init(d, NULL);
> > > > +        if ( rc < 0 )
> > > > +            return rc;
> > > > +    }
> > > > +
> > > > +    if ( kinfo.dom0less_enhanced )
> > > > +    {
> > > > +        rc = alloc_xenstore_evtchn(d);
> > > > +        if ( rc < 0 )
> > > > +            return rc;
> > > > +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> > > 
> > > I think it would be easy to allocate the page right now. So what prevent
> > > us to
> > > do it right now?
> > 
> > Because (as you noted as a comment to the following patch) as soon as
> > d->arch.hvm.params[HVM_PARAM_STORE_PFN] is set the guest can continue
> > with the initialization and will expect the right data to be set on the
> > page.
> 
> I think you misunderstood my question. From my understanding, at the moment,
> Linux would break with your proposal. So you need to modify the kernel in
> order to support what you are doing.

Linux does not break with this proposal. I wrote a longer explanation
[1] some time ago.

In short: the master branch and any supported versions of Linux boots
fine with this proposal without changes, however it wouldn't be able to
use PV drivers when started as dom0less kernel.

To be able to use the new feature, this patch is required [2].

Old unsupported and not updated Linux is the only one to break. You gave
an excellent suggestion on thread [1], which resulted in me writing
patch #1 "xen: introduce xen,enhanced dom0less property" to retain
compatibility with older unpatched and unsupported kernels.

[1] https://marc.info/?l=xen-devel&m=164142956915469
[2] https://marc.info/?l=xen-devel&m=164203595315414


> IOW, we have room to decide the approach here.
> 
> Xenstore protocol has a way to allow (re)connection (see
> docs/mics/xenstore-ring.txt). This feature looks quite suited to what you are
> trying to do here (we want to delay the connection).
> 
> The main advantage with this approach is the resources allocation for Xenstore
> will be done in the place and the work in Linux could be re-used for
> non-dom0less domain.
> 
> Have you explored it?

Luca (CCed) is the original author. I don't know if he explored that
approach. I have not looked into it in any details but I think there
might be challenges: in this case there is nothing on the shared page.
There are no feature bits as it has not been initialized (xenstored is
the one initializating it).

Keep in mind that Luca and I have done many tests on this approach, both
the Xen side, the Linux side (very many different kernel versions) and
complex configurations (both network and block PV drivers, DMA mastering
devices, etc.) If we changed approach now we would lose some of the
value of the past efforts. But if required, I'll try to schedule time to
do a proper research of your suggestion.


> > In other words: it is not enough to have the pfn allocated, we
> > also need xenstore to initialize it. At that point, it is better to do
> > both later from init-dom0less.c.
> See above. My main concern with your proposal is the allocation is split and
> this making more difficult to understand the initialization. Could you write
> some documentation how everything is meant to work?

I can document it a lot better for sure. I'll do that.

