Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2C2FD2FF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71473.128018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EqF-0000dF-Su; Wed, 20 Jan 2021 14:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71473.128018; Wed, 20 Jan 2021 14:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EqF-0000ct-PC; Wed, 20 Jan 2021 14:52:15 +0000
Received: by outflank-mailman (input) for mailman id 71473;
 Wed, 20 Jan 2021 14:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2EqE-0000co-P7
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2EqE-0002dl-Ku
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:52:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2EqE-0001W8-JV
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:52:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2Eq7-0006Aa-8q; Wed, 20 Jan 2021 14:52:07 +0000
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
	bh=afOWdXx+VGz1pNkA6HFUcEbPiS9lbnsmIGVr033YdRk=; b=Tsgmg8PyvOcXQuO9c7ySklcZ7t
	V3+Nsdo2uy3a6IODYa+fPw4ri86Cca56UZ1jH9JRLkuHQ9lY6yN6+i8F8UoGtquwkbwC4LvIu6vtE
	/uTkSoJgtaiGO2kLYOe1DxBmhAnZ9qgUKCbD2hbtSYrUWAu+CIuKyEO+ADi3+ywi38Y4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24584.17302.958286.788145@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 14:52:06 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
    Manuel Bouyer <bouyer@antioche.eu.org>,
    <xen-devel@lists.xenproject.org>,
    Manuel Bouyer <bouyer@netbsd.org>,
    Wei  Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-16-bouyer@antioche.eu.org>
	<20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> On Tue, Jan 12, 2021 at 07:12:36PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > NetBSD doesn't have setresuid(). Add a configure check for it,
> > and use plain setuid() if !HAVE_SETRESUID
...
> LGTM from a code PoV, but I think George/Ian should take a look, since
> they know exactly what this is supposed to do, and I would bet there
> are some reasons why setresuid is used instead of setuid, which should
> likely be taken into account in the commit message to justify why
> using setuid in it's place it's fine.

There is indeed a reason for using setresuid here.  See the comments
at the top of kill_device_model_uid_child and the commit messages for
87f9458e3400 and 0c653574d39c.  This is all quite complex:

https://xenproject.org/2018/08/01/killing-processes-that-dont-want-to-be-killed/

https://marc.info/?l=xen-devel&m=152215770803468
 (search in that message for "libxl UID cleanup")

I wrote a message to George in 2018 proving that the desired set of
IDs cannot be made without setresuid.  I'll c&p the relevant part below.

I don't think setuid is safe - at least, if we are trying to restrict
the dm.  Since I think after the libxl child is forked, and has called
setuid, it might be traceable (by NetBSD's equivalent of ptrace) by
the dm.  The dm could puppet it into pretending it had succeeded, but
then hang around until the domid is reused.

At the very least, this patch needs an argument, in detail, why this
is OK.

Also, why oh why does NetBSD not have setresuid ??  It's at least 20
years old !

Sorry,
Ian.

PS there is a long discussion of the history of saved set-ids, real vs
effective uids, etc., here
  https://pubs.opengroup.org/onlinepubs/9699919799/functions/setuid.html
but sadly it does not discuss setresuid.


From me to George etc. in 2018.

George emailed me a draft post:
> # No POSIX-compliant mousetraps?
> 
> Although `setresuid` is implemented by both Linux and FreeBSD, it is
> not in the [current POSIX
> specification](http://pubs.opengroup.org/onlinepubs/9699919799/).
> Looking at the official list of POSIX system interfaces, it's not
> clear how to get a process to have the required tuple using only POSIX
> interfaces (namely `setuid` and `setreuid`, without recourse to
> `setresuid` or Linux's `CAP_SETUID`); the assumption seems to be that
> `euid` must always be set to either `ruid` or `suid`.

Proof that this can't be simulated by proper use of setuid, seteuid
and setreuid:

					ruid	euid	suid

The desired state is:			reaper	target	reaper

If the final call is seteuid:

   seteuid(target);			reaper	target	reaper

For this to be permitted, and nontrivial, euid was 0:
   
Penultimate status			reaper	0	reaper

This state cannot be generated by setuid either euid==0 previously and
setuid would have set all of the ids; or the old euid was not 0, in
which case setuid() would have set only the euid, and required that
one of the other ids was 0, which can see that it can't have been.

This penultimate state cannot be generated by seteuid from any
different state.

So it must have been generated by setreuid.  We must avoid setreuid
setting the suid to the same as the new euid (0), which means that our
setreuid call did not change the ruid either.  That form of setreuid
is just like euid for our purposes, and not useful.

So the desired state could not be made by seteuid.

Let's consider setreuid.  Well, either setreuid sets the suid to the
same as the new euid, or it only changes the euid.  Ie, it would only
do something we could have done with seteuid and the argument above
applies.

What abouit setuid ?  Well, either setuid sets all three uids to the
same thing, or it, again, sets only the euid.

Ian.

