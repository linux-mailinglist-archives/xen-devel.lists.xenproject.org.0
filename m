Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6B2FD645
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71636.128428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GpP-00088k-DA; Wed, 20 Jan 2021 16:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71636.128428; Wed, 20 Jan 2021 16:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GpP-00088N-9t; Wed, 20 Jan 2021 16:59:31 +0000
Received: by outflank-mailman (input) for mailman id 71636;
 Wed, 20 Jan 2021 16:59:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvzb=GX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l2GpN-00088I-Nk
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:59:29 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe8252d-52b4-4520-97e3-544f206452a8;
 Wed, 20 Jan 2021 16:59:28 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10KGxNhW006531;
 Wed, 20 Jan 2021 17:59:23 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id C3B9E281D; Wed, 20 Jan 2021 17:59:23 +0100 (CET)
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
X-Inumbo-ID: 1fe8252d-52b4-4520-97e3-544f206452a8
Date: Wed, 20 Jan 2021 17:59:23 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
Message-ID: <20210120165923.GC5035@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-6-bouyer@netbsd.org>
 <20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
 <20210104102037.GA2005@antioche.eu.org>
 <24584.18578.623201.789017@mariner.uk.xensource.com>
 <20210120155900.GA5035@antioche.eu.org>
 <24584.22125.355284.48139@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24584.22125.355284.48139@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Wed, 20 Jan 2021 17:59:24 +0100 (MET)

On Wed, Jan 20, 2021 at 04:12:29PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> > Yes, at last the stat call will need to be patched.
> > But it seems to rely on a linux-specific behavoir, which is that
> > /dev/stdin points to the real file on redirection:
> > >ls -l /dev/stdin /proc/self/fd/0 < /etc/passwd
> > lrwxrwxrwx 1 root   root      15 Apr 30  2019 /dev/stdin -> /proc/self/fd/0
> > lr-x------ 1 bouyer ita-iatos 64 Jan 20 16:54 /proc/self/fd/0 -> /etc/passwd
> > 
> > On NetBSD (and I guess other BSDs) this won't work, as /dev/stdin is a
> > specific device:
> > >ls -l /dev/stdin 
> > crw-rw-rw-  1 root  wheel  22, 0 Nov 15  2007 /dev/stdin
> > 
> > so stat -L will always return the same data. We can't use the same
> > protocol.
> 
> Ah.
> 
> The manpage I am looking at says:
> 
>      If no argument is given, stat displays information about the
>      file descriptor for standard input.
> 
> Here NetBSD has a better command line API than Linux - Linux requires
> pratting about with /dev/stdin and NetBSD doesn't.  So I think
> where on Linux we have
>    stat .... /dev/stdin
> on NetBsd we can simply have
>    stat ....
> with no filename argument.

Right, thanks. Then it would need to be done with 2 different calls
but I don't think that's a problem (even with the linux version it would
not be atomic anyway).

> 
> I think NetBSD's stat(1) also takes different argumnts to specify the
> format.  NetBSD uses -f, whereas Linux uses -c.  So the exact rune
> will have to be different.

Yes, and NetBSD doens't have %D (only %d)

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

