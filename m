Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A62049C06B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 02:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260629.450455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWiY-0004dd-K3; Wed, 26 Jan 2022 01:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260629.450455; Wed, 26 Jan 2022 01:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWiY-0004b0-Fw; Wed, 26 Jan 2022 01:03:22 +0000
Received: by outflank-mailman (input) for mailman id 260629;
 Wed, 26 Jan 2022 01:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCWiX-000483-2m
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 01:03:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9b26a6-7e43-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 02:03:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B29F9B81B8E;
 Wed, 26 Jan 2022 01:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFC2C340E0;
 Wed, 26 Jan 2022 01:03:16 +0000 (UTC)
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
X-Inumbo-ID: bf9b26a6-7e43-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643158996;
	bh=TcSyfDxg5Xc774oyT9BRu16FwZmobC0ospPJaZQRiV0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ljzdtxroo7Cfppu/701M/7/JMW6FL293p2bkVnuY3tgea4CX064NQQoTbM/udehHs
	 Is9g+KRufnXt7iKBK+yEPzyP4ZbEO/ReuHrqhCk0Yeuz3XkLTO1E3Ho5HSqJUTK9dg
	 UjLIxH8IrgtBzkWQioMgyoCZ8hfs/iFKFbpiJFap2pFsDlResflhie3v39nRGGBBh7
	 mYkuaDO6NbZTC9fOJRQXibF9OAmfl32gUGrjIMXGcBTVch9gAZ7MearlYX0RGKNzGx
	 7yf47hCTABWDFfwMX3KlIozS4G00mtY8YurP2cLSRncOAfk/xnrWAeJbQM+/Dvz9ns
	 WXu4T4cF8o6fA==
Date: Tue, 25 Jan 2022 17:03:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
In-Reply-To: <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-2-sstabellini@kernel.org> <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org> <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com> <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop> <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jan 2022, Julien Grall wrote:
> On 25/01/2022 22:49, Stefano Stabellini wrote:
> > On Tue, 25 Jan 2022, Jan Beulich wrote:
> > > On 25.01.2022 02:10, Stefano Stabellini wrote:
> > > > On Sun, 23 Jan 2022, Julien Grall wrote:
> > > > > > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > > > > > index da88ad141a..5b0bcaaad4 100644
> > > > > > --- a/xen/common/event_channel.c
> > > > > > +++ b/xen/common/event_channel.c
> > > > > > @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d,
> > > > > > evtchn_port_t
> > > > > > port)
> > > > > >        return 0;
> > > > > >    }
> > > > > >    -static int get_free_port(struct domain *d)
> > > > > > +int get_free_port(struct domain *d)
> > > > > 
> > > > > I dislike the idea to expose get_free_port() (or whichever name we
> > > > > decide)
> > > > > because this can be easily misused.
> > > > > 
> > > > > In fact looking at your next patch (#3), you are misusing it as it is
> > > > > meant to
> > > > > be called with d->event_lock. I know this doesn't much matter
> > > > > in your situation because this is done at boot with no other domains
> > > > > running
> > > > > (or potentially any event channel allocation). However, I still think
> > > > > we
> > > > > should get the API right.
> > > > > 
> > > > > I am also not entirely happy of open-coding the allocation in
> > > > > domain_build.c.
> > > > > Instead, I would prefer if we provide a new helper to allocate an
> > > > > unbound
> > > > > event channel. This would be similar to your v1 (I still need to
> > > > > review the
> > > > > patch though).
> > > > 
> > > > I am happy to go back to v1 and address feedback on that patch. However,
> > > > I am having difficulties with the implementation. Jan pointed out:
> > > > 
> > > > 
> > > > > > -
> > > > > > -    chn->state = ECS_UNBOUND;
> > > > > 
> > > > > This cannot be pulled ahead of the XSM check (or in general anything
> > > > > potentially resulting in an error), as check_free_port() relies on
> > > > > ->state remaining ECS_FREE until it is known that the calling function
> > > > > can't fail anymore.
> > > > 
> > > > This makes it difficult to reuse _evtchn_alloc_unbound for the
> > > > implementation of evtchn_alloc_unbound. In fact, I couldn't find a way
> > > > to do it.
> > > > 
> > > > Instead, I just create a new public function called
> > > > "evtchn_alloc_unbound" and renamed the existing funtion to
> > > > "_evtchn_alloc_unbound" (this to addresses Jan's feedback that the
> > > > static function should be the one starting with "_"). So the function
> > > > names are inverted compared to v1.
> > > > 
> > > > Please let me know if you have any better suggestions.
> > > > 
> > > > 
> > > > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > > > index da88ad141a..c6b7dd7fbd 100644
> > > > --- a/xen/common/event_channel.c
> > > > +++ b/xen/common/event_channel.c
> > > > @@ -18,6 +18,7 @@
> > > >     #include <xen/init.h>
> > > >   #include <xen/lib.h>
> > > > +#include <xen/err.h>
> > > >   #include <xen/errno.h>
> > > >   #include <xen/sched.h>
> > > >   #include <xen/irq.h>
> > > > @@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn
> > > > *chn)
> > > >       xsm_evtchn_close_post(chn);
> > > >   }
> > > >   -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > > > +struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t
> > > > remote_dom)
> > > > +{
> > > > +    struct evtchn *chn;
> > > > +    int port;
> > > > +
> > > > +    if ( (port = get_free_port(d)) < 0 )
> > > > +        return ERR_PTR(port);
> > > > +    chn = evtchn_from_port(d, port);
> > > > +
> > > > +    evtchn_write_lock(chn);
> > > > +
> > > > +    chn->state = ECS_UNBOUND;
> > > > +    chn->u.unbound.remote_domid = remote_dom;
> > > > +    evtchn_port_init(d, chn);
> > > > +
> > > > +    evtchn_write_unlock(chn);
> > > > +
> > > > +    return chn;
> > > > +}
> > > > +
> > > > +static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > > >   {
> > > >       struct evtchn *chn;
> > > >       struct domain *d;
> > > 
> > > Instead of introducing a clone of this function (with, btw, still
> > > insufficient locking), did you consider simply using the existing
> > > evtchn_alloc_unbound() as-is, i.e. with the caller passing
> > > evtchn_alloc_unbound_t *?
> > 
> > Yes, we tried that first. Unfortunately the (dummy) XSM check cannot
> > work. This is how we would want to call the function:
> > 
> > 
> >      alloc.dom = d->domain_id;
> >      alloc.remote_dom = hardware_domain->domain_id;
> >      rc = evtchn_alloc_unbound(&alloc);
> > 
> > 
> > This is the implementation of the XSM check:
> > 
> > static XSM_INLINE int xsm_evtchn_unbound(
> >      XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
> > {
> >      XSM_ASSERT_ACTION(XSM_TARGET);
> >      return xsm_default_action(action, current->domain, d);
> > }
> > 
> > 
> > Note the usage of current->domain. If you have any suggestions on how to
> > fix it please let me know.
> 
> If I am not mistaken, current should still point to a domain (in this case
> idle).
> 
> So one alternative would be to ignore XSM if current->domain == idle and the
> system is booting (this could be part of xsm_default_action())
> 
> Another alternative would be to switch current to another domain. 'dom0'
> wouldn't be a solution because it doesn't exist for "true" dom0less. So a
> possibility would be to use dom_xen or create a fake build domain to be used
> for XSM check during boot.


Great suggestions! I went with the first suggestion above and confirmed
it solved the problem! With the appended patch I can just call the
current implementation of evtchn_alloc_unbound (made non-static) from
domain_build.c without any issues.

Are you guys OK with something like this?

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b024119896..99c63ea8c5 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
             return 0;
         /* fall through */
     case XSM_PRIV:
-        if ( is_control_domain(src) )
+        if ( is_control_domain(src) ||
+             src->domain_id == DOMID_IDLE ||
+             src->domain_id == DOMID_XEN )
             return 0;
         return -EPERM;
     default:

