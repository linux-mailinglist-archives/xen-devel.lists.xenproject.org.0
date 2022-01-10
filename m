Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9848A32F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 23:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255560.437948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73SV-0004kr-Bw; Mon, 10 Jan 2022 22:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255560.437948; Mon, 10 Jan 2022 22:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73SV-0004iO-7p; Mon, 10 Jan 2022 22:48:11 +0000
Received: by outflank-mailman (input) for mailman id 255560;
 Mon, 10 Jan 2022 22:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O59d=R2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n73ST-0004iI-5m
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 22:48:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb11bf7-7267-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 23:48:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36D6D6143D;
 Mon, 10 Jan 2022 22:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3EFC36AE9;
 Mon, 10 Jan 2022 22:48:04 +0000 (UTC)
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
X-Inumbo-ID: 5fb11bf7-7267-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641854884;
	bh=8Zg+lf1qfqSTVk4gnxv28YH0Na43cYYknZnFeZjNVdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QLeCIZRwsej/RVZgMOqEDUaRdl7YRRkVp6yjkvnq8VeRWhB4VQUJWwY9yTV7mHu5e
	 zjbHaQs8BWMpQIhSg8ceXyeOAxNywlIyCImHaz6l/hMR/9r4zWTg8S9Qe5PQmbxXQb
	 Q1AO3wfjVe8jzyq2nbxGz4QeAcMZJJ8/skbhLjFOpOX6mxYl1UJjFs0GQWarYQOQDs
	 37kt+WLwj70OMpq9jcz3ojSo7Rs/DquKs+vXIf71Xt0YxD+82Dfp1pf0/Kf3aMGjpI
	 TvBxDrLy/E6Fi8wi4MFl+hYg2epZ5neo9oKEBiLwUK6vYc2TUYhxU8b4vhS6RK70qd
	 uDiGrNfxPC2XQ==
Date: Mon, 10 Jan 2022 14:48:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init
 case
In-Reply-To: <3c2bb1e9-16d7-0329-9396-db7705f84ae6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201101444250.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-6-sstabellini@kernel.org> <3c2bb1e9-16d7-0329-9396-db7705f84ae6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Jan 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 08/01/2022 00:49, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > If the function is called with late_init set then also notify the domain
> > using the xenstore event channel.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: wl@xen.org
> > CC: Anthony PERARD <anthony.perard@citrix.com>
> > CC: Juergen Gross <jgross@suse.com>
> > CC: julien@xen.org
> > ---
> >   tools/xenstore/xenstored_domain.c | 15 ++++++++++-----
> 
> All the changes to the protocol should be reflected in docs/misc/xenstore.txt.
> However...
> 
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tools/xenstore/xenstored_domain.c
> > b/tools/xenstore/xenstored_domain.c
> > index d03c7d93a9..17b8021ca8 100644
> > --- a/tools/xenstore/xenstored_domain.c
> > +++ b/tools/xenstore/xenstored_domain.c
> > @@ -429,7 +429,7 @@ static void domain_conn_reset(struct domain *domain)
> >     static struct domain *introduce_domain(const void *ctx,
> >   				       unsigned int domid,
> > -				       evtchn_port_t port, bool restore)
> > +				       evtchn_port_t port, bool restore, bool
> > late_init)
> >   {
> >   	struct domain *domain;
> >   	int rc;
> > @@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ctx,
> >   		/* Now domain belongs to its connection. */
> >   		talloc_steal(domain->conn, domain);
> >   +		if (late_init)
> > +			xenevtchn_notify(xce_handle, domain->port);
> 
> ... I am not convinced the parameter late_init is necessary. I believe it
> would be safe to always raise an event channel because a domain should be
> resilient (event channel are just to say "Please check the status", there are
> no data carried).

This is a fantastic idea. I gave it a quick try and it seems to work
fine. If everything checks out I'll make the change in the next version
and drop late_init (the new parameter to xs_introduce_domain) completely.


> If you really need late_init, then it should be made optional to avoid
> breaking existing user of Xenstore (IHMO the protocol is stable and should be
> backward compatible).

