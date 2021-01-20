Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E52FD385
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71553.128210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAt-0004LH-EW; Wed, 20 Jan 2021 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71553.128210; Wed, 20 Jan 2021 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAt-0004Kc-AZ; Wed, 20 Jan 2021 15:13:35 +0000
Received: by outflank-mailman (input) for mailman id 71553;
 Wed, 20 Jan 2021 15:13:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvzb=GX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l2FAr-0004KD-Cm
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:33 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6e4596e-75f1-4945-a94f-2428cd1e5c45;
 Wed, 20 Jan 2021 15:13:29 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10KFDMxI002243;
 Wed, 20 Jan 2021 16:13:22 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id F3832281D; Wed, 20 Jan 2021 16:13:21 +0100 (CET)
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
X-Inumbo-ID: c6e4596e-75f1-4945-a94f-2428cd1e5c45
Date: Wed, 20 Jan 2021 16:13:21 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210120151321.GB4175@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-16-bouyer@antioche.eu.org>
 <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
 <24584.17302.958286.788145@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24584.17302.958286.788145@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 20 Jan 2021 16:13:22 +0100 (MET)

On Wed, Jan 20, 2021 at 02:52:06PM +0000, Ian Jackson wrote:
> Roger Pau Monné writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > On Tue, Jan 12, 2021 at 07:12:36PM +0100, Manuel Bouyer wrote:
> > > From: Manuel Bouyer <bouyer@netbsd.org>
> > > 
> > > NetBSD doesn't have setresuid(). Add a configure check for it,
> > > and use plain setuid() if !HAVE_SETRESUID
> ...
> > LGTM from a code PoV, but I think George/Ian should take a look, since
> > they know exactly what this is supposed to do, and I would bet there
> > are some reasons why setresuid is used instead of setuid, which should
> > likely be taken into account in the commit message to justify why
> > using setuid in it's place it's fine.
> 
> There is indeed a reason for using setresuid here.  See the comments
> at the top of kill_device_model_uid_child and the commit messages for
> 87f9458e3400 and 0c653574d39c.  This is all quite complex:
> 
> https://xenproject.org/2018/08/01/killing-processes-that-dont-want-to-be-killed/
> 
> https://marc.info/?l=xen-devel&m=152215770803468
>  (search in that message for "libxl UID cleanup")
> 
> I wrote a message to George in 2018 proving that the desired set of
> IDs cannot be made without setresuid.  I'll c&p the relevant part below.
> 
> I don't think setuid is safe - at least, if we are trying to restrict
> the dm.  Since I think after the libxl child is forked, and has called

What is the dm in this case ? qemu ? On NetBSD qemu runs as root AFAIK,
so there isn't much to protect.

> setuid, it might be traceable (by NetBSD's equivalent of ptrace) by
> the dm.  The dm could puppet it into pretending it had succeeded, but
> then hang around until the domid is reused.

I don't understand. We're talking about a simple kill(2) syscall here.

> 
> At the very least, this patch needs an argument, in detail, why this
> is OK.
> 
> Also, why oh why does NetBSD not have setresuid ??  It's at least 20
> years old !

It's not because it's old that it's good.



> 
> Sorry,

OK so if I understand properly, you say Xen should not be used on NetBSD ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

