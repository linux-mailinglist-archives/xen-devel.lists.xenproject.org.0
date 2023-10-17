Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077047CB7E3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617987.961183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYek-0000oV-Du; Tue, 17 Oct 2023 01:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617987.961183; Tue, 17 Oct 2023 01:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYek-0000l7-BA; Tue, 17 Oct 2023 01:13:58 +0000
Received: by outflank-mailman (input) for mailman id 617987;
 Tue, 17 Oct 2023 01:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFgi=F7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsYej-0000ji-40
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:13:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 709bd737-6c8a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 03:13:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 458EFB81ADA;
 Tue, 17 Oct 2023 01:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A869C433C8;
 Tue, 17 Oct 2023 01:13:50 +0000 (UTC)
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
X-Inumbo-ID: 709bd737-6c8a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697505231;
	bh=V/Ng7ucBmPhpwpbJgTU+w5kM8Pn5PEutAqugiGXSP4A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ql3zXJN6iRW2cOUdIKyLa5PDw2ZsZfEHsGKX3zKHclOCrada85p7eyruHaWVUN3cc
	 +L46G6LhN+9DbbCJzQYcRT95pLkAzQM4gSWf+Kom4jUZYx4C9jKMZTtWOW99FlS48s
	 GcR1g/VpWAAfRGd6vpnbuBsTeRfa92ewaG5UbvPo8t+tFqe09DWoYECeB/N+lxIz11
	 ErcBSD1iFauC0xbE7PfvKVO1p0L7w+7RdE2UhrkrPi+3TUoZgqLjTfDQ34bKzQU9QL
	 GC7XmaVfr9r1EvvAN7ptfFMG55paPj6pCNxiIn1pee6/uohhPjmWWw59lKy0wIrim/
	 8AeefKfu2tJRA==
Date: Mon, 16 Oct 2023 18:13:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: SAF-x-safe rename
In-Reply-To: <71abd99d-7ef9-09db-9c1e-6b1c55188a6b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310161813010.965337@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop> <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com> <75d160be-4a8c-48c7-a972-201d78f0bdf0@citrix.com> <50198a73-2f0c-4cf1-9173-86a8158b425b@citrix.com>
 <71abd99d-7ef9-09db-9c1e-6b1c55188a6b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1145807480-1697505231=:965337"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1145807480-1697505231=:965337
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 16 Oct 2023, Jan Beulich wrote:
> On 06.10.2023 00:01, Andrew Cooper wrote:
> > On 05/10/2023 10:38 pm, andrew.cooper3@citrix.com wrote:
> >> On 05/10/2023 8:43 am, Luca Fancellu wrote:
> >>>> On 5 Oct 2023, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>
> >>>> Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)
> >>>>
> >>>> in a recent thread Andrew pointed out that the SAF-2-safe tag is
> >>>> confusing and requested a rename:
> >>>> https://marc.info/?l=xen-devel&m=169634970821202
> >>>>
> >>>> As documented by docs/misra/documenting-violations.rst:
> >>>>
> >>>> - SAF-X-safe: This tag means that the next line of code contains a finding, but
> >>>>   the non compliance to the checker is analysed and demonstrated to be safe.
> >>>> - SAF-X-false-positive-<tool>: This tag means that the next line of code
> >>>>   contains a finding, but the finding is a bug of the tool.
> >>>>
> >>>>
> >>>> Today we have already 28 instances of SAF tags in the Xen codebase.
> >>>>
> >>>>
> >>>> Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
> >>>> - ANALYSIS-X-safe
> >>>> - ANALYSIS-X-false-positive-<tool>
> >>>>
> >>>> If we really want a rename I suggest to rename SAF to SAFE:
> >>>> - SAFE-X-safe
> >>>> - SAFE-X-false-positive-<tool>
> >>>>
> >>>> Or maybe MISRA:
> >>>> - MISRA-X-safe
> >>>> - MISRA-X-false-positive-<tool>
> >>>>
> >>>> But I actually prefer to keep the tag as it is today.
> >>> We chose a generic name instead of MISRA because the tag can potentially suppress findings
> >>> of any checker, including MISRA checker.
> >>>
> >>> If SAF-* is confusing, what about FUSA-* ?
> >>>
> >>> Anyway I’m thinking that every name we could come up will be confusing at first, improving the
> >>> documentation would mitigate it (by improving I mean to improve the fruition of it, for example a
> >>> Read the docs documentation has the search bar, a quick copy paste of SAF- would make the
> >>> documenting-violations page visible.)
> >>
> >> No - this is a problem *because* changing the documentation doesn't
> >> help.   (To be clear, updating the documentation is fine, but irrelevant
> >> here.)
> >>
> >>
> >> These are annotations in code.  They need to be:
> >>
> >> 1) Short (obviously)
> >> 2) Clear to someone who isn't you (the collective us of this group)
> >> reading the code.
> >> 3) Non-intrusive, so as not to get in the way of the code.
> >>
> >> and they must be all three.  This was even a principle given at the
> >> start of the MISRA work that we would not be deteriorating the quality
> >> of the code just to comply.
> >>
> >> Point 3 is other thread about end-of-line, or block regions.  Lets leave
> >> that there because it's really a metadata transformation problem
> >> constrained by where the comments can acceptably go.
> >>
> >>
> >> Point 2 is the issue here, and "SAF-$N-safe" scores very highly on the
> >> WTF-o-meter *even* for people who know that it's something related to MISRA.
> >>
> >> Seriously it looks like someone couldn't spell, and everyone else went
> >> with it (reflects poorly on everyone else).
> >>
> >> And yes, I know it's an initialisation for something, but it's not even
> >> an industry standard term - it's a contraction of an intentionally
> >> generic phrase, with substantial irony on an early MISRA call where
> >> there was uncertainly between people as to what it even stood for.
> >>
> >> These are the thoughts running through the minds of people reading the
> >> code when they don't understand what they're looking at.
> >>
> >>
> >> Annotations for other static analysers intentionally use their own name
> >> so they're googleable.
> >>
> >> Guess what SAF googles for?  Sustainable Aviation Fuel, or Specialist
> >> Automotive Finance.
> >>
> >> Fine, lets be more specific.  How about "Xen SAF" ?  Nope...
> >>
> >> "Did you mean to search for:
> >> Xen SAVE Xen SAN Xen VIF Xenstaff"
> >>
> >>
> >> Despite many of the search results referencing patches, or rendered
> >> documents out of docs/, not a single one of them gets
> >> documenting-violations.rst in any form, where the single definition of
> >> this term is hiding in a paragraph which spends 90% of it's volume
> >> describing a monotonically increasing number.
> >>
> >> Seriously, ChatGPT would struggle to make shit this good up.
> >>
> >>
> >> The thing we tag with *must* be trivially recognisable as an analysis
> >> tag in order for others to be able to read the code.  Therefore, it
> >> needs to be an actual full world (hence the ANALYSIS suggestion), or an
> >> industry standard term (where MISRA does qualify).
> 
> ANALYSIS imo gets in conflict with 1) above, considering that permitting
> line length violations was already brought up with the shorter SAF-*.
> 
> >> I don't exactly what it is - something else might turn out to be even
> >> better, but it is very important to be not this, for everyone else to
> >> have an easy time reading the code.
> >>
> >>
> >> And reasoning along that line...  What's wrong with just /* octal-ok */
> >> or /* womble-permitted */ so it's also apparent in context what the
> >> contentious issue might be and why it might be mitigated?
> 
> When the numbering scheme was discussed, I was asking why a shorthand
> for the issue to deal with (kind of a tag) can't be used. I don't
> recall any arguments, but here we are. One issue with something like
> just /* octal-ok */ is that it's not sufficiently reliably machine-
> parseable; that's aiui where the desire of the SAF (or whatever else)
> prefix came from.
> 
> >> The mechanics behind the scenes is just a trivial text replacement, and
> >> the tagging scheme does not have to uniform obfuscated identifier for
> >> that to work.
> > 
> > Or, as has been pointed out to me in private, even
> > 
> > /* RULE-$N-safe */
> > 
> > would be an improvement because it's clearly related to some set of
> > guidelines.
> 
> Both MISRA and RULE are Misra-specific; RULE, if you mean it to be
> followed by the rule number, would even be Misra version specific.

Please everyone fill in your preference here in advance of tomorrow's
MISRA C meeting so we can discuss the results live:
https://cryptpad.fr/form/#/2/form/view/kwflzAkvxhxF5U5Kv9O6QiQ5LEuCmHZlJhnNda7jk2g/
--8323329-1145807480-1697505231=:965337--

