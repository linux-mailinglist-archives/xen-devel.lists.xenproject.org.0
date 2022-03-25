Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF484E6B8B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 01:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294531.500856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXXqZ-0006vY-Lx; Fri, 25 Mar 2022 00:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294531.500856; Fri, 25 Mar 2022 00:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXXqZ-0006tS-Ij; Fri, 25 Mar 2022 00:30:31 +0000
Received: by outflank-mailman (input) for mailman id 294531;
 Fri, 25 Mar 2022 00:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYjy=UE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXXqX-0006t3-LR
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 00:30:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c44ad2bf-abd2-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 01:30:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60196B826A1;
 Fri, 25 Mar 2022 00:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808A0C340EC;
 Fri, 25 Mar 2022 00:30:24 +0000 (UTC)
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
X-Inumbo-ID: c44ad2bf-abd2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648168225;
	bh=pnFplBmMuU5vSfbBCuDaxtUzyDeh4Bumraknw9VjJkE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hd5AJ1/O2xXyNi8zzESUo/2ZxEGJ5dGV/s2DCASnfAtiNtys8LCLymueFb/EnBB3g
	 tE666p1+XGzPv3Y1x65SNrOZ3oDWgzVoUu4bjDa7fGxd7eGwb5hm6+a8f3cXz1Ajiw
	 Lnr/TI9uTwR51ph/hkymG9ldsRkXdx1eHZR7Py/oMqC1V/n8vHEoNSmNILwmu3TlU0
	 VvXZGy1YT8xJG8p4WhPHHYcgsC2/6Tg5SsRYW2v3wHf0i49ysM2wo+fLU+MODGh9L7
	 Y9+42Xo3DlZXcJ/jskLPI9iwxQ+zH+PA0qmx/qpua2EURtnbCV4hddjZn6ux3JALKo
	 GNmyp2UOUqmvQ==
Date: Thu, 24 Mar 2022 17:30:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    "Daniel P. Smith" <dpsmith.dev@gmail.com>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
In-Reply-To: <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-2-sstabellini@kernel.org> <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com> <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Mar 2022, Jan Beulich wrote:
> On 23.03.2022 01:22, Stefano Stabellini wrote:
> > On Tue, 15 Mar 2022, Daniel P. Smith wrote:
> >> On 1/28/22 16:33, Stefano Stabellini wrote:
> >>> From: Luca Miccio <lucmiccio@gmail.com>
> >>>
> >>> The xenstore event channel will be allocated for dom0less domains. It is
> >>> necessary to have access to the evtchn_alloc_unbound function to do
> >>> that, so make evtchn_alloc_unbound public.
> >>>
> >>> Add a skip_xsm parameter to allow disabling the XSM check in
> >>> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
> >>> originated from Xen before running any domains.)
> >>>
> >>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>> CC: Julien Grall <julien@xen.org>
> >>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> CC: George Dunlap <george.dunlap@citrix.com>
> >>> CC: Jan Beulich <jbeulich@suse.com>
> >>> CC: Wei Liu <wl@xen.org>
> >>> ---
> >>> Changes v3:
> >>> - expose evtchn_alloc_unbound, assing a skip_xsm parameter
> >>> ---
> >>>  xen/common/event_channel.c | 13 ++++++++-----
> >>>  xen/include/xen/event.h    |  3 +++
> >>>  2 files changed, 11 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> >>> index da88ad141a..be57d00a15 100644
> >>> --- a/xen/common/event_channel.c
> >>> +++ b/xen/common/event_channel.c
> >>> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
> >>>      xsm_evtchn_close_post(chn);
> >>>  }
> >>>  
> >>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> >>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
> >>>  {
> >>>      struct evtchn *chn;
> >>>      struct domain *d;
> >>> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> >>>          ERROR_EXIT_DOM(port, d);
> >>>      chn = evtchn_from_port(d, port);
> >>>  
> >>> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> >>> -    if ( rc )
> >>> -        goto out;
> >>> +    if ( !skip_xsm )
> >>> +    {
> >>> +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> >>> +        if ( rc )
> >>> +            goto out;
> >>> +    }
> >>
> >> Please do not subvert the security framework because it causes an
> >> inconvenience. As Jan recommended, work within the XSM check to allow
> >> your access so that we may ensure it is done safely. If you need any
> >> help making modifications to XSM, please do not hesitate to reach out as
> >> I will gladly help.
> > 
> > Thank you!
> > 
> > First let me reply to Jan: this series is only introducing 1 more call
> > to evtchn_alloc_unbound, which is to allocate the special xenstore event
> > channel, the one configured via
> > d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN].
> > 
> > It is not meant to be a generic function, and it is not meant to be
> > called more than once. It could (should?) be __init.
> 
> How that? Its pre-existing use doesn't disappear, and requires it to be
> non-__init.

Sorry I meant the new function (calling get_free_port) for the new
use-case could be __init. The new function could be added to
xen/common/event_channel.c or to xen/arch/arm/domain_build.c.


> > The existing XSM check in evtchn_alloc_unbound cannot work and should
> > not work: it is based on the current domain having enough privileges to
> > create the event channel. In this case, we have no current domain at
> > all. The current domain is Xen itself.
> 
> And DOM_XEN cannot be given the appropriate permission, perhaps
> explicitly when using a real policy and by default in dummy and SILO
> modes?

The issue is that the check is based on "current", not one of the
domains passed as an argument to evtchn_alloc_unbound. Otherwise,
passing DOMID_XEN would be straightforward.

We would need to use a hack (like Daniel wrote in the other email) to
set the idle_domain temporarily as a privileged domain only for the sake
of passing an irrelevant (irrelevant as in "not relevant to this case")
XSM check. That cannot be an improvement. Also, setting current to a
"fake" domain is not great either.

In the specific case of dom0less and this patch, this is the only
instance of this issue and could be solved very straightforwardly by
calling get_free_port directly as we discussed [1].

I know Julien had some reservations about that. Let's try to find a
technical solution that makes everyone happy.

Maybe, instead of exporting get_free_port, we could create a new
function in xen/common/event_channel.c and mark it as __init? This way:
- we don't need to expose get_free_port
- the new function would only be __init anyway, so no risk of runtime
  misuse

What do you think?

[1] https://marc.info/?l=xen-devel&m=164197327305903

