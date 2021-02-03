Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7F30E142
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81001.148845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M7M-0000i2-FA; Wed, 03 Feb 2021 17:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81001.148845; Wed, 03 Feb 2021 17:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M7M-0000hd-C2; Wed, 03 Feb 2021 17:39:04 +0000
Received: by outflank-mailman (input) for mailman id 81001;
 Wed, 03 Feb 2021 17:39:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M7L-0000gg-1A
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:39:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M7K-000522-VO
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:39:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M7K-0001UW-Tm
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:39:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7M7H-0005cJ-Mc; Wed, 03 Feb 2021 17:38:59 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=auFCto3O62Vvvpe0SQoM+WERRBM/Mb/CReAMXBAiD7U=; b=asbFQMrN6XSwRB0acKuiu1Yciw
	xIL2ShJnEwbqGMH0MnUtjTixWPRXKQSgb9PpQ5F/+pzQa/yS2JhFmKIwsAZqyOV9EX5aBb/tm3Rt/
	ZIeTKhueIjRAW0rfIW01H0W2Gtivz66TrEApDNiixieJZdkaQsTpTRi4k8ApcmhgJLRw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.57267.471477.281218@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:38:59 +0000
To: Manuel Bouyer <bouyer@netbsd.org>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenstored: close socket connections on error
In-Reply-To: <24602.56402.42441.687037@mariner.uk.xensource.com>
References: <20210203165421.1550-1-bouyer@netbsd.org>
	<20210203165421.1550-2-bouyer@netbsd.org>
	<24602.56402.42441.687037@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH] xenstored: close socket connections on error"):
> Manuel Bouyer writes ("[PATCH] xenstored: close socket connections on error"):
> > On error, don't keep socket connection in ignored state but close them.
> > When the remote end of a socket is closed, xenstored will flag it as an
> > error and switch the connection to ignored. But on some OSes (e.g.
> > NetBSD), poll(2) will return only POLLIN in this case, so sockets in ignored
> > state will stay open forever in xenstored (and it will loop with CPU 100%
> > busy).
> 
> Juergen, I think you probably know this code the best.  Would you be
> able to review this ?
> 
> I'm not sure I understand what the specific behaviour on NetBSD is
> that is upsetting xenstored.  Or rather, what it is that xenstored is
> using to tell when the socket should be closed.
> 
> I grepped for POLLERR and nothing came up.
> 
> Or to put it another way, is this commit
> 
> > Fixes: d2fa370d3ef9cbe22d7256c608671cdcdf6e0083
> 
> broken on Linux too ?

Andy pointed me to the recent thread "xenstored file descriptor leak"
which answers all these questions.  I think it would have been nice if
some tools maintainer(s) had been CC'd on that :-).

Juergen, I guess I will get a formal R-b from you ?

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


Manuel, in response to this:

> When I started, I looked at the wiki for instructions about
> patches, but didn't find any ...

Earlier I offered you help with git, in private email.  I agree that
git is confusing and sometimes impenetrable.  But it seems that what
you are doing now is worse!  Please take me up on my offer of help.

Our wiki doesn't give instructions on how to use git to maintain a
patch series.  Those instructions would not be Xen-specific.  Perhaps
we could have a pointer or two, but everyone has their own pet methods
and tooling so the result would perhaps be more confusing than
helpful.

Regards,
Ian.

