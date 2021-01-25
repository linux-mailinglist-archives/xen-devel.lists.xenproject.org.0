Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E523028E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74226.133371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45h9-0007XY-3X; Mon, 25 Jan 2021 17:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74226.133371; Mon, 25 Jan 2021 17:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45h8-0007X9-Ul; Mon, 25 Jan 2021 17:30:30 +0000
Received: by outflank-mailman (input) for mailman id 74226;
 Mon, 25 Jan 2021 17:30:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l45h7-0007X4-17
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:30:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l45h6-0001Cn-TR
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:30:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l45h6-000568-SZ
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:30:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l45h3-0004HN-HR; Mon, 25 Jan 2021 17:30:25 +0000
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
	bh=Lc0C8IWNKpMjkpd/4whW0H5yvf6tll/G6UcAdZsWh68=; b=xQcHtZ/3eyji2D9C2VDL9T9czf
	scs9hw25iMFOJG9IXn+BJyw6+OyTuRGx9h/WeXejwPP9e02sC+Ai4WTIbO+fNJTHA4v002G8Q+lSa
	qbPyGUQHf7mnV1TZI2nPo5PwxDsN2RWQ/Tue5R6P1qUxYiI0ghGFe0iIBm5g4WjStI2E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24591.49.238509.216726@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 17:30:25 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <cd06d04f-f1c4-0087-b46e-34648585fb5a@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
	<24590.44019.51460.33930@mariner.uk.xensource.com>
	<d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
	<24590.52459.194044.857442@mariner.uk.xensource.com>
	<6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
	<24590.56183.458644.60628@mariner.uk.xensource.com>
	<6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
	<24590.61205.393750.544294@mariner.uk.xensource.com>
	<cd06d04f-f1c4-0087-b46e-34648585fb5a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

The quoted-reply part of this message may be going off into the weeds.
Feel free to ignore it, or parts of it, if you think you can make
progress without disabusing me of what I think are my
misunderstandings...

Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
> On 25.01.2021 17:17, Ian Jackson wrote:
> >  I don't understand why this
> > situation should be handled differently for zstd than for any of the
> > other calls to *PKG* (glib, pixman, libnl).
> 
> The difference is that glib and pixman aren't optional (if
> building qemu), i.e. we want configure to fail if they can't
> be found or are too old.

Yes, but I think that just means adding the [true] fourth argument, to
make failure to find the library a no-op.  I don't think it needs any
more complex handling.  At least, I have not yet understood a need for
more complex handling...

> > Perhaps you experienced some issue which would have been fixed by the
> > addition of the missing PKG_PROG_PKG_CONFIG ?
> 
> I don't think so, no, as I've not tried configuring in a way
> where the earlier PKG_CHECK_MODULES() would be bypassed.

I guess I should take care of this then, since I think it's probably
an accident waiting to happen.

> >> I can, but it feels wrong, in particular if I gave it a
> >> generic looking name (get_unaligned_le32() or some such,
> > 
> > That would seem perfect to me.  I don't know what would be wrong
> > with it.
> 
> Using this (most?) natural name has two issues in my view:
> For one, it'll likely cause conflicts with how other code
> (using hypervisor files) gets built. And then I consider it
> odd to have just one out of a larger set of functions, but
> I would consider it odd as well if I had to introduce them
> all right here.

If you put this new definition in xg_private.h for now then it ought
not to conflict with anyone else.  (Assuming it's a static inline, or
a macro.  If it will have external linkage then it will need a name
prefix which I would prefer to avoid.)

I think it best to add this one macro/inline now.  When someone wants
more of these, they can add them.  If someone want them elsewhere they
can do the work of finding or making a suitably central place.  If it
weren't for the release timing I might think it better to add more,
but my general rule is that steps towards the best possible situation
are better than steps that go away from the best possible situation,
even if the former are not complete.

I think a reasonable alternative would be to arrange to import a
comprehensive set from somewhere.

> > I think we had concluded not to print a warning ?
> 
> Yes. Even in the projected new form of using the construct I
> don't intend to change the description's wording, as the
> intended use of [true] still looks like that can't be intended
> usage. IOW my remark extended beyond the warning; I'm sorry if
> this did end up confusing because you were referring to just
> the warning.

I'm afraid I don't understand what you mean.  In particular, what you
mean by "the intended use of [true] still looks like that can't be
intended usage".

  the intended {by whom for what puropose?} use of [true] still looks
  like that {what?} can't be intended {by whom?} usage

I have the feeling that I have totally failed to grasp your mental
model, which naturally underlies your comments.

Do you mean that with "true" for the 4th argument, the printed output
is not correct, in the failure case ?  Maybe it needs a call to AC_MSG
or something (but AIUI most of these PKG_* macros ought to do that for
us).  I'm just guessing at your meaing here...

> >>>>> I mean the inclusion of $libzstd_PKG_ERRORS in the output.
> >>>>
> >>>> I see no point in the warning without including this. In fact
> >>>> I added the AC_MSG_WARN() just so that the contents of this
> >>>> variable (and hence an indication to the user of what to do)
> >>>> was easily accessible.
> >>>
> >>> This is not usual autoconf practice.  The usual approach is to
> >>> consider that missing features are just to be dealt with with a
> >>> minimum of fuss.
> >>
> >> Which is why I made the description say what it says. Just
> >> that - as per above - I don't see viable alternatives (yet).

Quoting this because I think it may still be relevant for
understanding the foregoing...

Ian.

