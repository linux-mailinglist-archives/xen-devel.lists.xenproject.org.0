Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47F3043FA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75307.135548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RVa-0006jN-Lh; Tue, 26 Jan 2021 16:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75307.135548; Tue, 26 Jan 2021 16:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RVa-0006iy-IC; Tue, 26 Jan 2021 16:48:02 +0000
Received: by outflank-mailman (input) for mailman id 75307;
 Tue, 26 Jan 2021 16:48:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BegI=G5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l4RVY-0006it-IS
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:48:00 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd6039f1-a5f0-4b5f-9a6f-5e0f6b51c6a7;
 Tue, 26 Jan 2021 16:47:57 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10QGlnOJ007589;
 Tue, 26 Jan 2021 17:47:49 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 76466281D; Tue, 26 Jan 2021 17:47:49 +0100 (CET)
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
X-Inumbo-ID: cd6039f1-a5f0-4b5f-9a6f-5e0f6b51c6a7
Date: Tue, 26 Jan 2021 17:47:49 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <20210126164749.GA8309@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-4-bouyer@antioche.eu.org>
 <20210115152712.njzgo2zqpiwyhmds@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115152712.njzgo2zqpiwyhmds@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Tue, 26 Jan 2021 17:47:49 +0100 (MET)

On Fri, Jan 15, 2021 at 04:27:12PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:24PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > When a domain is destroyed, xparams may not be available any more when
> > the block script is called to unconfigure the vnd.
> > Check xparam only at configure time, and just unconfigure any vnd present
> > in the xenstore.
> 
> The patch itself seems fine to me, there's no need to fetch params
> for unplug, you can just reply on the vnd node.
> 
> I'm however not sure why params would be deleted from xenstore but not
> vnd, do you know why?

I'm not sure, it happens on xl destroy, when the kernel in the
domU is stuck (so it won't shutdown properly).

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

