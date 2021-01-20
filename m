Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4362FD4AF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71595.128317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ft1-0000x9-CF; Wed, 20 Jan 2021 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71595.128317; Wed, 20 Jan 2021 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ft1-0000wm-9A; Wed, 20 Jan 2021 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 71595;
 Wed, 20 Jan 2021 15:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvzb=GX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l2Fsz-0000wg-GK
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:59:09 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3131f024-2714-4d40-827a-71ff75d48b48;
 Wed, 20 Jan 2021 15:59:07 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10KFx0vV029363;
 Wed, 20 Jan 2021 16:59:00 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 396B0281D; Wed, 20 Jan 2021 16:59:00 +0100 (CET)
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
X-Inumbo-ID: 3131f024-2714-4d40-827a-71ff75d48b48
Date: Wed, 20 Jan 2021 16:59:00 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
Message-ID: <20210120155900.GA5035@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-6-bouyer@netbsd.org>
 <20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
 <20210104102037.GA2005@antioche.eu.org>
 <24584.18578.623201.789017@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24584.18578.623201.789017@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Wed, 20 Jan 2021 16:59:00 +0100 (MET)

On Wed, Jan 20, 2021 at 03:13:22PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> > On Tue, Dec 29, 2020 at 12:29:09PM +0100, Roger Pau Monné wrote:
> > > I think you want tot CC the tools dev on this one, specially Ian who
> > > knows how the Linux one is implemented and can likely give valuable
> > > input.
> ...
> > > Seeing the file itself, I don't think there's any NetBSD specific
> > > stuff, so we might want to consider putting it in BSD/ instead, so it
> > > can be used by FreeBSD also?
> > 
> > I'm not sure if FreeBSD needs the locking stuff.
> > Also, there are certainly differences in block device handling between
> > FreeBSD and NetBSD. Both OSes have diverged in this area.
> 
> I think most operating systems will want some kind of locking here.
> 
> I loooked at the code in the new tools/hotplug/NetBSD/locking.sh.
> Unfortunately this area is complex and the available APIs and tools
> are awkard, and the field is troubled by broken "traditional"
> approaches involving O_EXCL or the moral equivalent, which cannot be
> made reliable (if you think reliability implies never being broken due
> to stale lock).
> 
> I doubt that the code in this patch is correct.  It uses shlock(1)
> which is based on link(2) and kill(2) and so on, which I think is
> basically an O_EXCL-based approach as I discuss above.  (I don't have
> a formal proof of this contention.)  The presence of an invocation of
> the "trap" shell builtin in the new NetBSD script is a bad sign - a
> reliable locking protocol would need that.

Actually this patch is old - since Xen 4.8 at last.

> 
> I see from https://man.netbsd.org that NetBSD has flock(1) and
> stat(1).  I think this means we could reuse the code in
> tools/hotplug/Linux/locking.sh.  Maybe it will need to be lightly
> adapted, to NetBSD's flock(1) and stat(1).  Perhaps via some kind of
> substitution to avoid all the clone-and-hack.

Yes, at last the stat call will need to be patched.
But it seems to rely on a linux-specific behavoir, which is that
/dev/stdin points to the real file on redirection:
>ls -l /dev/stdin /proc/self/fd/0 < /etc/passwd
lrwxrwxrwx 1 root   root      15 Apr 30  2019 /dev/stdin -> /proc/self/fd/0
lr-x------ 1 bouyer ita-iatos 64 Jan 20 16:54 /proc/self/fd/0 -> /etc/passwd

On NetBSD (and I guess other BSDs) this won't work, as /dev/stdin is a
specific device:
>ls -l /dev/stdin 
crw-rw-rw-  1 root  wheel  22, 0 Nov 15  2007 /dev/stdin

so stat -L will always return the same data. We can't use the same protocol.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

