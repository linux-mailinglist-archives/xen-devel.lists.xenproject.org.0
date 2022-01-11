Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E8348BAF8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 23:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256168.439479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Pxd-0003tZ-K8; Tue, 11 Jan 2022 22:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256168.439479; Tue, 11 Jan 2022 22:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Pxd-0003rJ-HE; Tue, 11 Jan 2022 22:49:49 +0000
Received: by outflank-mailman (input) for mailman id 256168;
 Tue, 11 Jan 2022 22:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7Pxb-0003rD-Ga
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 22:49:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f9e7f1-7330-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 23:49:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9551361019;
 Tue, 11 Jan 2022 22:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9307BC36AE9;
 Tue, 11 Jan 2022 22:49:42 +0000 (UTC)
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
X-Inumbo-ID: c4f9e7f1-7330-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641941383;
	bh=jPgFclzDlCRo9KFwjaaKLl/zyTqFQZQX/6xTtixtQy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KutVUOTtJ47ins71LOvRcDNtp6LNT7xzmJ+20Lw/4AaXsHAl4N8hhAu0Spa9YMaIi
	 W4epp5R9sp+qQlMcCLYlyMWvrt0iBuXF5397hAgMQateHKqy/di7nW4zK129WEx8AE
	 IMVCq+zAHYU8dPPfvDSKENdymv9uhGM/C1sLktPNxxsVyqbgK6G0Uvx01bb0yOGpOV
	 fUAMwHGM0Ch7Ng+jXgqjbIQBEWrDvys3jLOvURr5fZ/nV3+eVtBHHid6wWv6DXhz7P
	 8eEfKlHTCIULDNlr47lVUQ4O6csdgUY5khSD3QSbevFW4+MNLx7gdUbd/FGLZOVLZo
	 XW61v8dYlXasw==
Date: Tue, 11 Jan 2022 14:49:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Miccio <lucmiccio@gmail.com>, julien@xen.org, 
    Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/7] xen: introduce _evtchn_alloc_unbound
In-Reply-To: <93887812-b9c1-af41-85ef-208cc114a1fc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201111432120.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-2-sstabellini@kernel.org> <93887812-b9c1-af41-85ef-208cc114a1fc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Jan 2022, Jan Beulich wrote:
> On 08.01.2022 01:49, Stefano Stabellini wrote:
> > @@ -284,11 +285,32 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
> >      xsm_evtchn_close_post(chn);
> >  }
> >  
> > -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > +struct evtchn *_evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
> 
> Function names want to be the other way around, to be in line with
> naming rules of the C spec: The static function may be underscore-
> prefixed, while the non-static one may not.

OK


> >  {
> >      struct evtchn *chn;
> > +    int port;
> > +
> > +    if ( (port = get_free_port(d)) < 0 )
> > +        return ERR_PTR(port);
> > +    chn = evtchn_from_port(d, port);
> > +
> > +    evtchn_write_lock(chn);
> > +
> > +    chn->state = ECS_UNBOUND;
> > +    if ( (chn->u.unbound.remote_domid = remote_dom) == DOMID_SELF )
> > +        chn->u.unbound.remote_domid = current->domain->domain_id;
> 
> I think the resolving of DOMID_SELF should remain in the caller, as I'm
> pretty sure your planned new user(s) can't sensibly pass that value.

Yep, no problem


> > +    evtchn_port_init(d, chn);
> > +
> > +    evtchn_write_unlock(chn);
> > +
> > +    return chn;
> > +}
> > +
> > +static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> > +{
> > +    struct evtchn *chn = NULL;
> 
> I don't think the initializer is needed.

OK


> > @@ -297,27 +319,22 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> >  
> >      spin_lock(&d->event_lock);
> >  
> > -    if ( (port = get_free_port(d)) < 0 )
> > -        ERROR_EXIT_DOM(port, d);
> > -    chn = evtchn_from_port(d, port);
> > +    chn = _evtchn_alloc_unbound(d, alloc->remote_dom);
> > +    if ( IS_ERR(chn) )
> > +    {
> > +        rc = PTR_ERR(chn);
> > +        ERROR_EXIT_DOM(rc, d);
> > +    }
> >  
> >      rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> >      if ( rc )
> >          goto out;
> >  
> > -    evtchn_write_lock(chn);
> > -
> > -    chn->state = ECS_UNBOUND;
> 
> This cannot be pulled ahead of the XSM check (or in general anything
> potentially resulting in an error), as check_free_port() relies on
> ->state remaining ECS_FREE until it is known that the calling function
> can't fail anymore.

OK, I didn't realize. Unfortunately it means we have to move setting
chn->state = ECS_UNBOUND to the caller.


> > -    if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
> > -        chn->u.unbound.remote_domid = current->domain->domain_id;
> > -    evtchn_port_init(d, chn);
> > -
> > -    evtchn_write_unlock(chn);
> > -
> > -    alloc->port = port;
> > +    alloc->port = chn->port;
> >  
> >   out:
> > -    check_free_port(d, port);
> > +    if ( chn != NULL )
> > +        check_free_port(d, chn->port);
> 
> Without the initializer above it'll then be more obvious that the
> condition here needs to be !IS_ERR(chn).
> 
> Also (nit) please prefer the shorter "if ( chn )".
> 
> Overall I wonder in how far it would be possible to instead re-use PV
> shim's "backdoor" into port allocation: evtchn_allocate_port() was
> specifically made available for it, iirc.

I don't see an obvious way to do it. These are the 4 things we need to
do:

1) call get_free_port/evtchn_allocate_port
2) set state = ECS_UNBOUND
3) set remote_domid
4) call evtchn_port_init

It doesn't look like we could enhance evtchn_allocate_port to do 2) and
3). And probably even 4) couldn't be added to evtchn_allocate_port.

So basically it is like calling get_free_port() and do 2,3,4 ourselves
from the caller in xen/arch/arm/domain_build.c. But that might be a good
idea actually. Maybe we should leave evtchn_alloc_unbound unmodified and
instead open-code what we need to do in xen/arch/arm/domain_build.c.
This is how it would look like as a new function in
xen/arch/arm/domain_build.c:

static int alloc_xenstore_evtchn(struct domain *d)
{
    struct evtchn *chn;
    int port;

    if ( (port = get_free_port(d)) < 0 )
        return ERR_PTR(port);
    chn = evtchn_from_port(d, port);

    chn->state = ECS_UNBOUND;
    chn->u.unbound.remote_domid = hardware_domain->domain_id;
    evtchn_port_init(d, chn);

    return chn->port;
}

What do you think? It might not be worth introducing
evtchn_alloc_unbound / _evtchn_alloc_unbound for this?

I am happy to follow what you think is best.

Cheers,

Stefano

