Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54968306422
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76373.137785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qaP-0003Mo-Ti; Wed, 27 Jan 2021 19:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76373.137785; Wed, 27 Jan 2021 19:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qaP-0003MR-QE; Wed, 27 Jan 2021 19:34:41 +0000
Received: by outflank-mailman (input) for mailman id 76373;
 Wed, 27 Jan 2021 19:34:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOO2=G6=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4qaO-0003ML-Ln
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:34:40 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5802fbd6-d604-475c-a113-a82ea9bb14d4;
 Wed, 27 Jan 2021 19:34:38 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10RJYUfZ010134;
 Wed, 27 Jan 2021 20:34:30 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10RJYUuP027831;
 Wed, 27 Jan 2021 20:34:30 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 82B2F7218; Wed, 27 Jan 2021 20:34:30 +0100 (MET)
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
X-Inumbo-ID: 5802fbd6-d604-475c-a113-a82ea9bb14d4
Date: Wed, 27 Jan 2021 20:34:30 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210127193430.GB26055@mail.soc.lip6.fr>
References: <20210112181242.1570-16-bouyer@antioche.eu.org>
 <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
 <24584.17302.958286.788145@mariner.uk.xensource.com>
 <20210120151321.GB4175@antioche.eu.org>
 <24584.19725.745755.464840@mariner.uk.xensource.com>
 <20210120165615.GB5035@antioche.eu.org>
 <24584.25612.523093.188718@mariner.uk.xensource.com>
 <20210120172046.GA5772@antioche.eu.org>
 <24584.26722.347244.50758@mariner.uk.xensource.com>
 <24593.36536.770883.890760@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24593.36536.770883.890760@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 20:34:31 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Jan 27, 2021 at 04:03:04PM +0000, Ian Jackson wrote:
> Ian Jackson writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > > On Wed, Jan 20, 2021 at 05:10:36PM +0000, Ian Jackson wrote:
> > > > My last mail had in it a thing that claims to be a proof that this is
> > > > not possible.
> > > 
> > > This code:
> ...
> > > actually works on NetBSD. processes from 375 are killed, and the
> > > seteuid(0) call succeeds (showing that the saved used id is still 0).
> > 
> > I guess I must have been wrong.
> > 
> > > > What do you think ?
> > > 
> > > As this is supported by Xen, I hope I can make at last run qemu with a
> > > non-zero uid.
> > 
> > The logic for deciding what user to run qemu as, and whether to kill
> > by uid or by pid, is in libxl_dm.c, in the function
> > libxl__domain_get_device_model_uid.
> > 
> > The dm_restrict flag turns on various other things too.
> 
> I think I have lost track of where we are with this patch.  I would
> like to see all this properly sorted in Xen 4.15.
> 
> How about I write a patch splitting the relevant part up into a
> version for systems with setresuid and systems without ?  Then you
> could fill in the missing part.

Yesterday I sent a v2 with the rewriting you suggested. But I'm fine
with you doing the rewrite.

> 
> Should I expect the non-setresuid OS to provide effectively the whole
> orf kill_device_model_uid_child, or just a replacement for the
> setresuid call and surrounding logging, something like
>   kill_device_model_uid_child_setresuid

As far as I'm concerned, kill_device_model_uid_child_setresuid() is enough.

Unfortunably I don't think I'll have time to work on dm restriction
for NetBSD before 4.15

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

