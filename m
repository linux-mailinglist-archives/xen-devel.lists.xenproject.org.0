Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A44E4A07
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 01:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293704.499043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWolT-0007tL-EI; Wed, 23 Mar 2022 00:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293704.499043; Wed, 23 Mar 2022 00:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWolT-0007qX-Ao; Wed, 23 Mar 2022 00:22:15 +0000
Received: by outflank-mailman (input) for mailman id 293704;
 Wed, 23 Mar 2022 00:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWolR-0007qR-OX
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 00:22:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48560d39-aa3f-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 01:22:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A4E061241;
 Wed, 23 Mar 2022 00:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C41C340EC;
 Wed, 23 Mar 2022 00:22:09 +0000 (UTC)
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
X-Inumbo-ID: 48560d39-aa3f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647994930;
	bh=vEmttIlR7Y89tTfj0Rz5EHjzjN/FACrOLSKV0h7xYfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=diua1idBbZxoN3khLNMi/t4RLJiFTk58zLcVXYAWkgXXHseEfGd+Is3yQE4o9JPKq
	 auRK+KtHvNtIHH46k9SyN7aUybQ1VwIdNT7yM07XSVKtOKMdh7dsdZUAAPZKdtjr5i
	 TGvP7SSB1FCZKwGxwlXIhqxJIGLpLf0hbMYQlYbGz4/m6Bk6I5tcMVROhn+zw0vFwk
	 3b5jVnDIfSuEVxwygxHHvL1Jcvby5EK+b0203A3NcBrHhNsyAlbwJQnul3tpKkRRSw
	 gjsCulxDD4pM7eLnZHdevFKpQxCeR3f7qPizPhASHnKcQ/sktpqB3PV4vQEDHHd0OH
	 vkGrFDg4Yg/aA==
Date: Tue, 22 Mar 2022 17:22:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith.dev@gmail.com>, jbeulich@suse.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
In-Reply-To: <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-2-sstabellini@kernel.org> <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Mar 2022, Daniel P. Smith wrote:
> On 1/28/22 16:33, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > The xenstore event channel will be allocated for dom0less domains. It is
> > necessary to have access to the evtchn_alloc_unbound function to do
> > that, so make evtchn_alloc_unbound public.
> > 
> > Add a skip_xsm parameter to allow disabling the XSM check in
> > evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
> > originated from Xen before running any domains.)
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: Andrew Cooper <andrew.cooper3@citrix.com>
> > CC: George Dunlap <george.dunlap@citrix.com>
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Wei Liu <wl@xen.org>
> > ---
> > Changes v3:
> > - expose evtchn_alloc_unbound, assing a skip_xsm parameter
> > ---
> >  xen/common/event_channel.c | 13 ++++++++-----
> >  xen/include/xen/event.h    |  3 +++
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > index da88ad141a..be57d00a15 100644
> > --- a/xen/common/event_channel.c
> > +++ b/xen/common/event_channel.c
> > @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
> >      xsm_evtchn_close_post(chn);
> >  }
> >  
> > -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
> >  {
> >      struct evtchn *chn;
> >      struct domain *d;
> > @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> >          ERROR_EXIT_DOM(port, d);
> >      chn = evtchn_from_port(d, port);
> >  
> > -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> > -    if ( rc )
> > -        goto out;
> > +    if ( !skip_xsm )
> > +    {
> > +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> > +        if ( rc )
> > +            goto out;
> > +    }
> 
> Please do not subvert the security framework because it causes an
> inconvenience. As Jan recommended, work within the XSM check to allow
> your access so that we may ensure it is done safely. If you need any
> help making modifications to XSM, please do not hesitate to reach out as
> I will gladly help.

Thank you!

First let me reply to Jan: this series is only introducing 1 more call
to evtchn_alloc_unbound, which is to allocate the special xenstore event
channel, the one configured via
d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN].

It is not meant to be a generic function, and it is not meant to be
called more than once. It could (should?) be __init.

The existing XSM check in evtchn_alloc_unbound cannot work and should
not work: it is based on the current domain having enough privileges to
create the event channel. In this case, we have no current domain at
all. The current domain is Xen itself.

For these reasons, given [1], also not to subvert the security
framework as Daniel pointed out, I think I should go back to my own
implementation [2][3] based on get_free_port. That is my preference
because:

- the Xen codebase doesn't gain much by reusing evtchn_alloc_unbound
- adding skip_xsm introduces a component of risk (unless we make it
  __init maybe?)
- using get_free_port is trivial and doesn't pose the same issues


Let's find all an agreement on how to move forward on this.


[1] https://marc.info/?l=xen-devel&m=164194128922838
[2] https://marc.info/?l=xen-devel&m=164203543615114
[3] https://marc.info/?l=xen-devel&m=164203544615129 

