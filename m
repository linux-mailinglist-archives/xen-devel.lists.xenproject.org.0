Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2C302798
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 17:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74190.133306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44YV-00006y-74; Mon, 25 Jan 2021 16:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74190.133306; Mon, 25 Jan 2021 16:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44YV-00006V-3u; Mon, 25 Jan 2021 16:17:31 +0000
Received: by outflank-mailman (input) for mailman id 74190;
 Mon, 25 Jan 2021 16:17:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l44YT-00006Q-MY
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 16:17:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l44YS-0008Q1-Pb
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 16:17:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l44YS-0005Ad-Nn
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 16:17:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l44YP-00048D-Ji; Mon, 25 Jan 2021 16:17:25 +0000
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
	bh=1aI9bTPPebZWaN5tVzPI7zqnxamWuLDel+uV/4/Tlfw=; b=A6Wf1KAgy+ZMzkrKfMXo8TCNyb
	S4KoVSPxAmmjY0igVhzqvRm7NO+u/K6K3puyxdGwu2AJ+6b+6zaw0Sm62Ve0mo0Xx6YmkMs8TAz31
	XSiArX2kq9ewtZPfj0oZKMViRyj0Bxjt5OPvG9dXxtmp6vSzqs84aJFnJ2B9KMe3Nxp8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.61205.393750.544294@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 16:17:25 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
	<24590.44019.51460.33930@mariner.uk.xensource.com>
	<d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
	<24590.52459.194044.857442@mariner.uk.xensource.com>
	<6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
	<24590.56183.458644.60628@mariner.uk.xensource.com>
	<6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I have a feeling we may be talking at cross purposes rather too much.

Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
> On 25.01.2021 15:53, Ian Jackson wrote:
> > Well how about passing "true" for the fourth argument then ?
> 
> That I did try intermediately, but didn't ever post. It'll
> screw up when libzstd_CFLAGS and libzstd_LIBS were provided
> to override pkg-config. When you look at the expanded code,
> this will end up with pkg_failed set to "untried" and still
> take the error path. I.e. we wouldn't get the overridden
> settings appended to $zlib.

I infer you're reading the autoonf output.  I think pkg_failed is
something to do with tracking whether pkg-config exists at all.  In
general, reading autoconf output is an act of desperation when RTFM
and so on fails.  The output is typically much more complicated than
the input and can be quite confusing.

I noticed that configure.ac fails to say PKG_PROG_PKG_CONFIG contrary
to the imprecations in the documentation.  For example, for
PKG_CHECK_MODULES we have:

 | # Note that if there is a possibility the first call to
 | # PKG_CHECK_MODULES might not happen, you should be sure to include
 | # an explicit call to PKG_PROG_PKG_CONFIG in your configure.ac
 
Indeed our first call to PKG_CHECK_* in the existing configure.ac is
within an if and there is no call to PKG_PROG_PKG_CONFIG.  I think one
should be added probably somewhere near the top (eg, just after
AX_XEN_EXPAND_CONFIG).

I'm not sure exactly what you mean in your paragraph I quote above.  I
think you mean that if the user supplies the options on the command
line bugt pkg-config is absent ?  I don't understand why this
situation should be handled differently for zstd than for any of the
other calls to *PKG* (glib, pixman, libnl).

Perhaps you experienced some issue which would have been fixed by the
addition of the missing PKG_PROG_PKG_CONFIG ?

(Also I note that the docs for PKG_CHECK_EXISTS contain a confusing
slip: there it says "you have to call PKG_CHECK_EXISTS manually" but
surely it must mean PKG_PROG_PKG_CONFIG.)

> >>> If you want a warning I think it should be a call to AC_MSG_WARN in
> >>> ACTION-IF-NOT-FOUND.
> >>
> >> I didn't to avoid the nesting of things yielding even harder
> >> to read code.
> > 
> > In your code it's nested too, just in an if rather than the in the
> > macro argument - but with a separate condition.  Please do it the
> > "usual autoconf way".
> 
> Pieces of shell code look to be permitted - a few lines down
> from the addition to configure.ac there is a shell case
> statement. Or are you telling me that's an abuse I shouldn't
> follow? But then I still don't see how to sensibly replace
> the construct, given the issue described further up.

I don't understand what you are getting at.  I think you must have
misunderstood me.

You explained that you preferred not to use the 4th argument,
ACTION-IF-NOT-FOUND, "to avoid nesting".  I was trying to say that I
didn't think this was a good reason and that instead putting the code
in a separate conditional is not warranted here (and not idiomatic).

There is nothing wrong[1] with including (cautious) shell code in
configure.ac, so that was not part of my argument.

> >>>     unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];
> >>
> >> Okay, I'll copy that then.
> > 
> > Could you make a macro or inline function in xg_private.h[1] rather
> > than open-coding a copy, please ?
> > 
> > [1] Or, if you prefer, a header with wider scope.
> 
> I can, but it feels wrong, in particular if I gave it a
> generic looking name (get_unaligned_le32() or some such,

That would seem perfect to me.  I don't know what would be wrong
with it.

> >>> I mean the inclusion of $libzstd_PKG_ERRORS in the output.
> >>
> >> I see no point in the warning without including this. In fact
> >> I added the AC_MSG_WARN() just so that the contents of this
> >> variable (and hence an indication to the user of what to do)
> >> was easily accessible.
> > 
> > This is not usual autoconf practice.  The usual approach is to
> > consider that missing features are just to be dealt with with a
> > minimum of fuss.
> 
> Which is why I made the description say what it says. Just
> that - as per above - I don't see viable alternatives (yet).

I think we had concluded not to print a warning ?

Ian.

[1] Contrary to the autoconf docs, which were written for a time when
even some very basic shell constructs such as "if" statements were not
always reliable.  In xen.git we can assume a vaguely posix shell.

