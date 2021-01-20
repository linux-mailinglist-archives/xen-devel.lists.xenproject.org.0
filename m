Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164772FD6C4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71659.128501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HA8-0002xq-IV; Wed, 20 Jan 2021 17:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71659.128501; Wed, 20 Jan 2021 17:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HA8-0002xQ-FN; Wed, 20 Jan 2021 17:20:56 +0000
Received: by outflank-mailman (input) for mailman id 71659;
 Wed, 20 Jan 2021 17:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvzb=GX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l2HA7-0002xK-0W
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:20:55 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6566d5fd-a53c-4bc5-a56c-7ba87a9e4066;
 Wed, 20 Jan 2021 17:20:53 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10KHKk2H026027;
 Wed, 20 Jan 2021 18:20:46 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id B6C6A281D; Wed, 20 Jan 2021 18:20:46 +0100 (CET)
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
X-Inumbo-ID: 6566d5fd-a53c-4bc5-a56c-7ba87a9e4066
Date: Wed, 20 Jan 2021 18:20:46 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210120172046.GA5772@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-16-bouyer@antioche.eu.org>
 <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
 <24584.17302.958286.788145@mariner.uk.xensource.com>
 <20210120151321.GB4175@antioche.eu.org>
 <24584.19725.745755.464840@mariner.uk.xensource.com>
 <20210120165615.GB5035@antioche.eu.org>
 <24584.25612.523093.188718@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24584.25612.523093.188718@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 20 Jan 2021 18:20:47 +0100 (MET)

On Wed, Jan 20, 2021 at 05:10:36PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > On Wed, Jan 20, 2021 at 03:32:29PM +0000, Ian Jackson wrote:
> > > Yes, the dm is qemu.  If qemu restriction is not supported, that makes
> > > a big difference.  The complex situation here is to do with trying to
> > > kill a possibly hostile qemu.
> > 
> > Hum, I'll have to check this (how to check, BTW ?).
> > I assumed qemu was running as root but it may not be completely true.
> > Especially as I notice, now that I'm re-reading the patch, that
> > we're doing a kill to -1. If we were doing so as root, user processes
> > would be killed.
> 
> It may well be that this whole piece of code won't be executed on
> NetBSD becauwe dm restriction will be off.
> 
> The background: dm restriction is a set of arrangements for trying to
> run qemu without given it any more privilege than it needs, and
> certainly not ultimate privilege over the host.  This is quite
> complicated and includes running it as a non-root user, chroot, and so
> on.
> 
> On Linux it's run in its own network namespace, so that a qemu
> compromised by the guest cannot access host daemons.  IDK what
> facilities one might want to use on NetBSD to try to contain qemu.
> 
> This seems to me all a matter for future work.  I'm sorry that code
> for a feature you're not going to be benefiting from is getting in
> your way.

On NetBSD we could start with a different uid and a chroot. This would
limit damages.

> > > right answer.)
> > 
> > This would have to be checked, but I don't think a non-root process
> > can ptrace a process whose saved-user-id is root.
> 
> If I remember rightly the saved-set-id is reset by setuid.  But I
> could be wrong.  This stuff is all quite complex :-/.

yes, setuid() resets the saved-user-id

> 
> > Actually I think I could mimic the setresuid() with setreuid() and seteuid().
> 
> My last mail had in it a thing that claims to be a proof that this is
> not possible.

This code:
        if (setreuid(375,0) < 0) {
                err(1, "setreuid");
        }
        if (seteuid(374) < 0) {
                err(1, "seteuid");
        }
        if (kill(-1, 9)) {
                err(1, "kill");
        }
        printf("kill done\n");
        if (seteuid(0) < 0) {
                err(1, "setreuid2");
        }
        exit(0);

actually works on NetBSD. processes from 375 are killed, and the
seteuid(0) call succeeds (showing that the saved used id is still 0).

> > 
> > Actually I don't see how I could split this in a different file, without
> > lot of duplicate code (even in just kill_device_model_uid_child(),
> > we're talking of about 7 lines of code out of 75). So some guidance here
> > would be welcome.
> 
> I think splitting it out at precisely the function needed is probably
> better.
> 
> Can you try this experiment: what happens if you replace the call to
> setresuid with abort() ?  I think you may find it all works, because
> you're not using that code path.
> 
> If so then I suggest introducing
> 
>   int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
> 
> which would call setresuid on Linux and on NetBSD would do this
> 
>   assert(!"setresuid is not available on NetBSD, and dm restrction is not supported, so this code path should not have been reached")
> 
> What do you think ?

As this is supported by Xen, I hope I can make at last run qemu with a
non-zero uid.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

