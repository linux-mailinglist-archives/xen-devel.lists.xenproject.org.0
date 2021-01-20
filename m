Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56CF2FD634
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71631.128417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GmN-0007qg-Uz; Wed, 20 Jan 2021 16:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71631.128417; Wed, 20 Jan 2021 16:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GmN-0007qH-RL; Wed, 20 Jan 2021 16:56:23 +0000
Received: by outflank-mailman (input) for mailman id 71631;
 Wed, 20 Jan 2021 16:56:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvzb=GX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l2GmM-0007qC-DZ
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:56:22 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f65b1b35-b2e3-491b-9669-0bf54e521eac;
 Wed, 20 Jan 2021 16:56:21 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10KGuFGh003196;
 Wed, 20 Jan 2021 17:56:15 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 49029281D; Wed, 20 Jan 2021 17:56:15 +0100 (CET)
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
X-Inumbo-ID: f65b1b35-b2e3-491b-9669-0bf54e521eac
Date: Wed, 20 Jan 2021 17:56:15 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210120165615.GB5035@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-16-bouyer@antioche.eu.org>
 <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
 <24584.17302.958286.788145@mariner.uk.xensource.com>
 <20210120151321.GB4175@antioche.eu.org>
 <24584.19725.745755.464840@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24584.19725.745755.464840@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Wed, 20 Jan 2021 17:56:15 +0100 (MET)

On Wed, Jan 20, 2021 at 03:32:29PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > On Wed, Jan 20, 2021 at 02:52:06PM +0000, Ian Jackson wrote:
> > > I don't think setuid is safe - at least, if we are trying to restrict
> > > the dm.  Since I think after the libxl child is forked, and has called
> > 
> > What is the dm in this case ? qemu ? On NetBSD qemu runs as root AFAIK,
> > so there isn't much to protect.
> 
> Yes, the dm is qemu.  If qemu restriction is not supported, that makes
> a big difference.  The complex situation here is to do with trying to
> kill a possibly hostile qemu.

Hum, I'll have to check this (how to check, BTW ?).
I assumed qemu was running as root but it may not be completely true.
Especially as I notice, now that I'm re-reading the patch, that
we're doing a kill to -1. If we were doing so as root, user processes
would be killed.

> 
> > > setuid, it might be traceable (by NetBSD's equivalent of ptrace) by
> > > the dm.  The dm could puppet it into pretending it had succeeded, but
> > > then hang around until the domid is reused.
> > 
> > I don't understand. We're talking about a simple kill(2) syscall here.
> 
> If we're not trying to restrict qemu's privilege at all, then I think
> the setuid is fine.
> There are then only two remaining concerns I have
> with this patch:
> 
> Firstly, we try to avoid #ifdefs like this.  It tends to make the code
> rather tangled, especially over time.  Instead we prefer to move the
> non-portable code into its own file, eg *_linux.c.
> 
> Secondly, I think we should check that dm_restrict is not enabled.
> I think an assert would do since I think we believe this is already
> prevented elsewhere ?
> 
> (One option for making this work would be to simply disable the
> killing by uid on NetBSD.  But I don't think that's a good answer
> because killing by uid after eg setuid is more reliable even if it is
> not 100% bulletproof.  So switching to setuid or maybe setreuid is the
> right answer.)

This would have to be checked, but I don't think a non-root process
can ptrace a process whose saved-user-id is root.

Actually I think I could mimic the setresuid() with setreuid() and seteuid().

> 
> > OK so if I understand properly, you say Xen should not be used on NetBSD ?
> 
> I'm sorry to have offended and discouraged you.  That was not my
> intention.  My apologies for sending an off-putting message.  For the
> avoidance of any doubt, definitely don't think that.  We should make
> this work properly.
> 
> Would you be willing to look into the two points I mention above and
> send a revised version of the patch ?  If you find the refactoring
> awkward I or Roger can help.

Actually I don't see how I could split this in a different file, without
lot of duplicate code (even in just kill_device_model_uid_child(),
we're talking of about 7 lines of code out of 75). So some guidance here
would be welcome.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

