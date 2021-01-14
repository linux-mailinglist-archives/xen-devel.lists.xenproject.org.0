Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ECA2F62D9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 15:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67050.119352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03QL-0008W1-F0; Thu, 14 Jan 2021 14:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67050.119352; Thu, 14 Jan 2021 14:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03QL-0008Vc-Bq; Thu, 14 Jan 2021 14:16:29 +0000
Received: by outflank-mailman (input) for mailman id 67050;
 Thu, 14 Jan 2021 14:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1NRs=GR=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l03QJ-0008VX-Na
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 14:16:27 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c740c54-79b0-4295-b122-3f6b7319ee6d;
 Thu, 14 Jan 2021 14:16:26 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10EEGGRI011164;
 Thu, 14 Jan 2021 15:16:16 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10EEGFsN001909;
 Thu, 14 Jan 2021 15:16:15 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 357FE7218; Thu, 14 Jan 2021 15:16:15 +0100 (MET)
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
X-Inumbo-ID: 5c740c54-79b0-4295-b122-3f6b7319ee6d
Date: Thu, 14 Jan 2021 15:16:15 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
Message-ID: <20210114141615.GA9157@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
 <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 14 Jan 2021 15:16:16 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Thu, Jan 14, 2021 at 02:25:05PM +0100, Jan Beulich wrote:
> On 14.01.2021 13:29, Manuel Bouyer wrote:
> > On Thu, Jan 14, 2021 at 11:53:20AM +0100, Jan Beulich wrote:
> >> On 12.01.2021 19:12, Manuel Bouyer wrote:
> >>> From: Manuel Bouyer <bouyer@netbsd.org>
> >>>
> >>> Use unsigned char variable, or cast to (unsigned char), for
> >>> tolower()/islower() and friends. Fix compiler error
> >>> array subscript has type 'char' [-Werror=char-subscripts]
> >>
> >> Isn't this something that wants changing in your ctype.h instead?
> >> the functions (or macros), as per the C standard, ought to accept
> >> plain char aiui, and if they use the input as an array subscript,
> >> it should be their implementation suitably converting type first.
> > 
> > I asked for inputs from NetBSD developers familiar with this part.
> > 
> > Although the parameter is an int, only a subset of values is valid,
> > as stated in ISO C 2018 (Section 7.4 paragrah 1):
> >> In all cases the argument is an int, the value of which shall be
> >> representable as an unsigned char or shall equal the value of the
> >> macro EOF.  If the argument has any other value, the behavior is 
> >> undefined.                               
> 
> Which means you're shifting the undefined-ness from the implementation
> (using the value as array index) to the callers (truncating values, or
> converting value range). In particular I do not think that the
> intention behind the standard's wording is for every caller to need to
> cast to unsigned char, when e.g. character literals are of type char
> and string literals are of type const char[].

If you don't cast you fall into the undefined behavior case for non-ascii
characters. For example, "é" in iso-latin-1 is 0xe9. In a signed char, this is
-23 (decimal). without the cast, tolower() will see -23.
If it is casted to (unsigned char) first, tolower() will see 233, as expected.
The following test program illustrates this:
armandeche:/tmp>cat toto.c
#include <stdio.h>

int
main(int _c, const char *_v[])
{
        char c = 0xe9;
	printf("%d %d\n", (int)c, (int)(unsigned char)c);
}
armandeche:/tmp>./toto 
-23 233



> 
> > As stated by NetBSD's ctype(3) manual page, NetBSD and glibc took different
> > approach. NetBSD emits a compile-time warning if the input may lead to
> > undefined behavior. quoting the man page:
> >      Some implementations of libc, such as glibc as of 2018, attempt to avoid
> >      the worst of the undefined behavior by defining the functions to work for
> >      all integer inputs representable by either unsigned char or char, and
> >      suppress the warning.  However, this is not an excuse for avoiding
> >      conversion to unsigned char: if EOF coincides with any such value, as it
> >      does when it is -1 on platforms with signed char, programs that pass char
> >      will still necessarily confuse the classification and mapping of EOF with
> >      the classification and mapping of some non-EOF inputs.
> > 
> > 
> > So, although no warning is emmited on linux, it looks like to me that the
> > cast to unsigned char is needed anyway, and relying on glibc's behavior
> > is not portable.
> 
> I fully agree we shouldn't rely on glibc's behavior (I'm sure
> you've looked at xen/include/xen/ctype.h to see how we address
> this it Xen itself, but I will admit this is to a degree comparing
> apples and oranges, not the least because the lack of a need to
> consider EOF in Xen). At least in xen/tools/symbols.c I don't
> think we're at risk of running into "undefined" space. Casts are

as long as there's only ascii characters.

Anyway NetBSD won't change its ctype.h

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

