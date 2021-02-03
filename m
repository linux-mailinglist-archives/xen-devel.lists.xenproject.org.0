Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C70F30D506
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 09:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80851.148180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7DKs-0007c7-AR; Wed, 03 Feb 2021 08:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80851.148180; Wed, 03 Feb 2021 08:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7DKs-0007bi-7Q; Wed, 03 Feb 2021 08:16:26 +0000
Received: by outflank-mailman (input) for mailman id 80851;
 Wed, 03 Feb 2021 08:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7DKq-0007bd-Pc
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 08:16:24 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b95fc45-8c51-4bcc-89ea-9ced71b9ffb5;
 Wed, 03 Feb 2021 08:16:23 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 1138GM8f010307;
 Wed, 3 Feb 2021 09:16:22 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 0342D281D; Wed,  3 Feb 2021 09:16:21 +0100 (CET)
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
X-Inumbo-ID: 1b95fc45-8c51-4bcc-89ea-9ced71b9ffb5
Date: Wed, 3 Feb 2021 09:16:21 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203081621.GD445@antioche.eu.org>
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Wed, 03 Feb 2021 09:16:22 +0100 (MET)

On Wed, Feb 03, 2021 at 09:05:27AM +0100, Jürgen Groß wrote:
> > > [...]
> > > Yes, I think this is a good idea.
> > 
> > Well, after some sleep I don't think it is. We should always keep at last
> > POLLIN or we will never notice a socket close otherwise.
> 
> Adding the fd of an ignored socket connection to the list is the real
> problem here. Why should that be done?

If we don't do it, we never notice when the socket is closed and the file
descriptor will stay forever. When I tried it, I had about 50 zombie
file descriptors open in xenstored, after starting only 2 domains.

> > > > 
> > > > Now I wonder if, on NetBSD at last, a read error or short read shouldn't
> > > > cause the socket to be closed, as with:
> > > > 
> > > > @@ -1561,6 +1565,8 @@
> > > >    bad_client:
> > > >    	ignore_connection(conn);
> > > > +	/* we don't want to keep this connection alive */
> > > > +	talloc_free(conn);
> > > >    }
> > > 
> > > This is wrong for non-socket connections, as we want to keep the domain
> > > in question to be known to xenstored.
> > > 
> > > For socket connections this should be okay, though.
> > 
> > What are "non-socket connections" BTW ? I don't think I've seen one
> > in my test.
> 
> Every connection to another domain.
> 
> > Is there a way to know if a connection is socket or non-socket ?
> 
> Active socket connections have conn->fd >= 0.

OK, I'll rework my patch. Thanks 

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

