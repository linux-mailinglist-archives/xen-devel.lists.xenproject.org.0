Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE33074F0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76948.139117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55do-0003iE-9W; Thu, 28 Jan 2021 11:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76948.139117; Thu, 28 Jan 2021 11:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55do-0003hp-6I; Thu, 28 Jan 2021 11:39:12 +0000
Received: by outflank-mailman (input) for mailman id 76948;
 Thu, 28 Jan 2021 11:39:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l55dm-0003gd-Ak
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:39:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l55dm-0004Wt-58
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:39:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l55dm-0001RI-4D
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:39:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l55df-00047v-B2; Thu, 28 Jan 2021 11:39:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2xsUwPNTtlshm2WMqw1F75iopXm4+mjHsjBFpQNrVBc=; b=K/tCnlKTtZkea1Kfuax5uyOkOm
	cAJxekuL/kCbFd8Oj077PCV9EomgDJFQWzXZats6NZzyXgSFmkUH4d8RU7+GmyCBUU1y/5fp3Oj3w
	+ojrfH5xJ0rTfiOcSz9QL5HFoktVo5ZLExuf/11dZmHeI+PyqCIfc4LvgQPog6ZTlH7I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.41559.85184.745760@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 11:39:03 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <20210127193430.GB26055@mail.soc.lip6.fr>
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
	<20210127193430.GB26055@mail.soc.lip6.fr>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> On Wed, Jan 27, 2021 at 04:03:04PM +0000, Ian Jackson wrote:
> > How about I write a patch splitting the relevant part up into a
> > version for systems with setresuid and systems without ?  Then you
> > could fill in the missing part.
> 
> Yesterday I sent a v2 with the rewriting you suggested. But I'm fine
> with you doing the rewrite.

OK.

> > Should I expect the non-setresuid OS to provide effectively the whole
> > orf kill_device_model_uid_child, or just a replacement for the
> > setresuid call and surrounding logging, something like
> >   kill_device_model_uid_child_setresuid
> 
> As far as I'm concerned, kill_device_model_uid_child_setresuid() is enough.
> 
> Unfortunably I don't think I'll have time to work on dm restriction
> for NetBSD before 4.15

No problem.


Taking a step back, I think this series is very close to going in, if
not actually ready.  Do you have a git branch version of this ?

I find the series of un-numbered patches you have posted make it hard
to see the wood for the trees, and collect all the relevant pieces.  A
git branch version would make the life of the committer considerably
easier.

If you don't have a favourite public git server you can post me a link
to, you could use gitlab.com where we have a mirror of xen.git.
   https://gitlab.com/xen-project/xen

(If you need instructions mail me privately.)

Regards,
Ian.

