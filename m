Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD6323F2C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 15:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89376.168279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvEA-0000gS-Ca; Wed, 24 Feb 2021 14:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89376.168279; Wed, 24 Feb 2021 14:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvEA-0000g3-9B; Wed, 24 Feb 2021 14:33:22 +0000
Received: by outflank-mailman (input) for mailman id 89376;
 Wed, 24 Feb 2021 14:33:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEvE9-0000fy-8c
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:33:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEvE9-0007Jz-6o
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:33:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEvE9-0006fc-4l
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:33:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEvE0-00078h-Ug; Wed, 24 Feb 2021 14:33:13 +0000
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
	bh=syTlKFg7dYVBP+vpaduTzpE6UI63HkH0IDlCIHzIKiM=; b=Lp7eXWjxMUGioWb8UISLKREM8e
	qxHHnyTUBoxx6/n+nWbsiJAEw6ITRVbaW2wcT8m3KaJ7vJGY3jqBdzMp1cwxkWWjR66973Yzi4foJ
	NDKFf7unUeCiyuuaW1333OZsNZX0wWgzyDOwAHrD9JQLZ/dYcRa6S0/R+lEIZwKI1o/c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24630.25512.617137.512212@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 14:33:12 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations [and 1 more messages]
In-Reply-To: <9e64f1b3-fbb3-6561-cf7b-498ed3839020@suse.com>,
	<1b251bb0-fecf-e5ed-c6e5-a2cb7c612cf1@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
	<20210224102641.89455-3-roger.pau@citrix.com>
	<fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
	<24630.13192.874503.894268@mariner.uk.xensource.com>
	<1b251bb0-fecf-e5ed-c6e5-a2cb7c612cf1@citrix.com>
	<9e64f1b3-fbb3-6561-cf7b-498ed3839020@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
> At what point do we just declare Alpine broken?  These are all
> freestanding headers, an explicitly available for use, in the way we use
> them.

There is IMO nothing wrong with Alpine here.  Alpine amd64 simply does
not support compilation of 32-bit x86 userland binaries.

But that's OK for us.  Xen doe not require the execution of any 32-bit
userland binaries.  hvmloader is not a userland binary.

As Roger said on irc

13:35 <royger> but requiring a compiler that supports generating
               i386 code doens't imply that we also have a libc for it?
               
> There are substantial portability costs for making changes like this,
> which takes us from standards compliant C to GCC-isms-only.

Since we are defining our out standalone environment for hvmloader, we
are in the position of the C *implementor*.  Compilers have features
(like __builtin_va*) that are helpful for implementing standard C
features like stdarg.h and indeed stdint.h.

Or to put it another way, GCC does not, by itself, provide (in
Standard C terms) a "freestanding implementation".  Arguably GCC ought
to provide stdint.h et al but in practice it doing so causes more
trouble as it gets in the way of the implentors of hosted
implementations.

The conclusion is simply that we must provide for ourselves any
apsects of a "freestanding implementation" that we care about.  (And
then we get to decide for ourselves how much the internal API should
look like Standard C.  Defining the Standard C type names is
definitely IMO advisable as it makes the bulk of the code sensible to
read.)

Jan Beulich writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
> On 24.02.2021 12:07, Ian Jackson wrote:
> > This code is only ever going to be for 32-bit x86, so I think the way
> > Roger did it is fine.
> 
> It is technically correct at this point in time, from all we can
> tell. I can't see any reason though why a compiler might not
> support wider int or, in particular, long long.

Our requirement for hvmloader is that we have an ILP32 LL64 compiler
which generates 32-bit x86 machine code.  That is what "gcc -m32"
means.  Whether future compiler(s) might exist which can provide ILP32
LLP64 (and what type uint64_t is on such a compiler) is not relevant.

> > Doing it the other way, to cope with this file being used with
> > compiler settings where the above set of types is wrong, would also
> > imply more complex definitions of INT32_MIN et al.
> 
> Well, that's only as far as the use of number suffixes goes. The
> values used won't change, as these constants describe fixed width
> types.

So the definitions would need to contain casts.

> >> Like the hypervisor, we should prefer using __SIZE_TYPE__
> >> when available.
> > 
> > I disagree.
> 
> May I ask why? There is a reason providing of these types did get
> added to (at least) gcc.

__SIZE_TYPE__ is provided by the compiler to the libc implementor.  It
is one of those facilities like __builtin_va*.  The bulk of the code
in hvmloader should not use this kind of thing.  It should use plain
size_t.

As for the new header in hvmloader, it does not matter whether it uses
__SIZE_TYPE__ or some other type which is known to be 32-bit, since
this code is definitely only ever for 32-bit x86.

> One argument against this would be above mentioned independence
> on any ABI the compiler would be built for, but I'd buy that only
> if above we indeed used __attribute__((__mode__())), as that's
> the only way to achieve such independence.

We don't want or need to support building hvmloader with a differnet
ABI.

> >> Nit: Perhaps better omit the unnecessary inner parentheses?
> > 
> > We should definitely keep the inner parentheses.  I don't want to
> > start carefully reasoning about precisely which inner parentheses are
> > necesary for macro argument parsing correctness.
> 
> Can you give me an example of when the inner parentheses would be
> needed? I don't think they're needed no matter whether (taking the
> example here) __builtin_va_...() were functions or macros. They
> would of course be needed if the identifiers were part of
> expressions beyond the mere function invocation.

You mention the situation where the parentheses would be needed
yourself.

> We've been trying to eliminate such in the hypervisor part of the
> tree,

Really ?  Well I think that is in exceedingly poor taste.  I can't
claim that it's objectively wrong and this is a question of style so I
won't insist on it.

> The primary reason why I've been advocating to avoid them is that,
> as long as they're not needed for anything, they harm readability
> and increase the risk of mistakes like the one that had led to
> XSA-316.

I looked again at XSA-316.  I don't want to open another can of worms.
It will suffice to say that I don't share your view on the root cause.

Ian.

