Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6B30D474
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 08:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80833.148109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7D2U-0004fK-IQ; Wed, 03 Feb 2021 07:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80833.148109; Wed, 03 Feb 2021 07:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7D2U-0004ev-FH; Wed, 03 Feb 2021 07:57:26 +0000
Received: by outflank-mailman (input) for mailman id 80833;
 Wed, 03 Feb 2021 07:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7D2T-0004ep-6L
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 07:57:25 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7feda2ca-62a1-42d6-a67d-0c2e9bff1dd0;
 Wed, 03 Feb 2021 07:57:23 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 1137vLQg013493;
 Wed, 3 Feb 2021 08:57:21 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 9FC62281D; Wed,  3 Feb 2021 08:57:21 +0100 (CET)
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
X-Inumbo-ID: 7feda2ca-62a1-42d6-a67d-0c2e9bff1dd0
Date: Wed, 3 Feb 2021 08:57:21 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203075721.GB445@antioche.eu.org>
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 03 Feb 2021 08:57:21 +0100 (MET)

On Wed, Feb 03, 2021 at 07:18:51AM +0100, Jürgen Groß wrote:
> On 02.02.21 19:37, Manuel Bouyer wrote:
> > Hello,
> > on NetBSD I'm tracking down an issue where xenstored never closes its
> > file descriptor to /var/run/xenstored/socket and instead loops at 100%
> > CPU on these descriptors.
> > 
> > xenstored loops because poll(2) returns a POLLIN event for these
> > descriptors but they are marked is_ignored = true.
> > 
> > I'm seeing this with xen 4.15, 4.13 and has also been reported with 4.11
> > with latest security patches.
> > It seems to have started with patches for XSA-115 (A user reported this
> > for 4.11)
> > 
> > I've tracked it down to a difference in poll(2) implementation; it seems
> > that linux will return something that is not (POLLIN|POLLOUT) when a
> > socket if closed; while NetBSD returns POLLIN (this matches the NetBSD's
> > man page).
> 
> Yeah, Linux seems to return POLLHUP additionally.

Overall, it seems that the poll(2) behavior with non-regular files
is highly OS-dependant when it comes to border cases (like a remote
close of a socket)

> 
> > 
> > First I think there may be a security issue here, as, even on linux it should
> > be possible for a client to cause a socket to go to the is_ignored state,
> > while still sending data and cause xenstored to go to a 100% CPU loop.
> 
> No security issue, as sockets are restricted to dom0 and user root.
> 
> In case you are suspecting a security issue, please don't send such
> mails to xen-devel in future, but to security@lists.xenproject.org.

Yes, sorry. Will do next time.

> 
> > I think this is needed anyway:
> > 
> > --- xenstored_core.c.orig	2021-02-02 18:06:33.389316841 +0100
> > +++ xenstored_core.c	2021-02-02 19:27:43.761877371 +0100
> > @@ -397,9 +397,12 @@
> >   			     !list_empty(&conn->out_list)))
> >   				*ptimeout = 0;
> >   		} else {
> > -			short events = POLLIN|POLLPRI;
> > -			if (!list_empty(&conn->out_list))
> > -				events |= POLLOUT;
> > +			short events = 0;
> > +			if (!conn->is_ignored) {
> > +				events |= POLLIN|POLLPRI;
> > +			        if (!list_empty(&conn->out_list))
> > +				        events |= POLLOUT;
> > +			}
> >   			conn->pollfd_idx = set_fd(conn->fd, events);
> >   		}
> >   	}
> 
> Yes, I think this is a good idea.

Well, after some sleep I don't think it is. We should always keep at last
POLLIN or we will never notice a socket close otherwise.

> 
> > 
> > Now I wonder if, on NetBSD at last, a read error or short read shouldn't
> > cause the socket to be closed, as with:
> > 
> > @@ -1561,6 +1565,8 @@
> >   bad_client:
> >   	ignore_connection(conn);
> > +	/* we don't want to keep this connection alive */
> > +	talloc_free(conn);
> >   }
> 
> This is wrong for non-socket connections, as we want to keep the domain
> in question to be known to xenstored.
> 
> For socket connections this should be okay, though.

What are "non-socket connections" BTW ? I don't think I've seen one
in my test.

Is there a way to know if a connection is socket or non-socket ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

