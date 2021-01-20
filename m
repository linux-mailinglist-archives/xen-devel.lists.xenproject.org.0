Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665612FD411
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71570.128245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FTJ-0006cn-O1; Wed, 20 Jan 2021 15:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71570.128245; Wed, 20 Jan 2021 15:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FTJ-0006cQ-Kh; Wed, 20 Jan 2021 15:32:37 +0000
Received: by outflank-mailman (input) for mailman id 71570;
 Wed, 20 Jan 2021 15:32:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FTI-0006cL-CT
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:32:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FTI-0003P2-6t
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:32:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FTI-0003q1-4H
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:32:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2FTB-0006HV-Vs; Wed, 20 Jan 2021 15:32:30 +0000
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
	bh=jno+kZoJdqqTIyrMhy+bC1RJCmOH67NIWmICx+fp/cA=; b=Tnijve3Le9nwZo0wZu9QwYDLHz
	pe1ro1m7vvZOb7RlDbpMTBJKEQ4bKwvVeUCstl+tRmFIbMzHQphonCyfyD/Pwz1jK7D9wtnfQGpAE
	4yBlABnJo4AUjs52nFntE/43hzJrJfLgjAH5L/OxP0zzGWBG+7XloWvN9QsyZj+jdQLk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.19725.745755.464840@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 15:32:29 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <20210120151321.GB4175@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-16-bouyer@antioche.eu.org>
	<20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
	<24584.17302.958286.788145@mariner.uk.xensource.com>
	<20210120151321.GB4175@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> On Wed, Jan 20, 2021 at 02:52:06PM +0000, Ian Jackson wrote:
> > I don't think setuid is safe - at least, if we are trying to restrict
> > the dm.  Since I think after the libxl child is forked, and has called
> 
> What is the dm in this case ? qemu ? On NetBSD qemu runs as root AFAIK,
> so there isn't much to protect.

Yes, the dm is qemu.  If qemu restriction is not supported, that makes
a big difference.  The complex situation here is to do with trying to
kill a possibly hostile qemu.

> > setuid, it might be traceable (by NetBSD's equivalent of ptrace) by
> > the dm.  The dm could puppet it into pretending it had succeeded, but
> > then hang around until the domid is reused.
> 
> I don't understand. We're talking about a simple kill(2) syscall here.

If we're not trying to restrict qemu's privilege at all, then I think
the setuid is fine.  There are then only two remaining concerns I have
with this patch:

Firstly, we try to avoid #ifdefs like this.  It tends to make the code
rather tangled, especially over time.  Instead we prefer to move the
non-portable code into its own file, eg *_linux.c.

Secondly, I think we should check that dm_restrict is not enabled.
I think an assert would do since I think we believe this is already
prevented elsewhere ?

(One option for making this work would be to simply disable the
killing by uid on NetBSD.  But I don't think that's a good answer
because killing by uid after eg setuid is more reliable even if it is
not 100% bulletproof.  So switching to setuid or maybe setreuid is the
right answer.)

> OK so if I understand properly, you say Xen should not be used on NetBSD ?

I'm sorry to have offended and discouraged you.  That was not my
intention.  My apologies for sending an off-putting message.  For the
avoidance of any doubt, definitely don't think that.  We should make
this work properly.

Would you be willing to look into the two points I mention above and
send a revised version of the patch ?  If you find the refactoring
awkward I or Roger can help.

Regards,
Ian.

