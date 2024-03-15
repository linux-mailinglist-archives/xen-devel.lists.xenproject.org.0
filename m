Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233CC87D778
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 00:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694097.1082955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHRk-0001j5-UQ; Fri, 15 Mar 2024 23:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694097.1082955; Fri, 15 Mar 2024 23:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHRk-0001gn-Rj; Fri, 15 Mar 2024 23:58:44 +0000
Received: by outflank-mailman (input) for mailman id 694097;
 Fri, 15 Mar 2024 23:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nznT=KV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlHRj-0001gh-Sq
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 23:58:43 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f54c84-e327-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 00:58:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B5A66CE2238;
 Fri, 15 Mar 2024 23:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAED7C433F1;
 Fri, 15 Mar 2024 23:58:36 +0000 (UTC)
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
X-Inumbo-ID: f1f54c84-e327-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710547118;
	bh=hch4Iq2kCOfE1Yr5gSemlDffouVi1ooMupgbzXdSvXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nyI10j7cGrybdAhwikdbqmd6R6/OZgYpME1w9fNfMN9qRtMN7CxKTt9YlGgHX9R1A
	 gNHp5DmfWMV0bZuzE3jKbKaj3LCtB5kqMd3nvMZRhA+yp+LEqTYSEWLCtXdcELYo6u
	 f/947NOc7nYygRbYDl5v5gB/IcsvnQSZ1b2W0mPP34fYBVIn4goJNxavxAmnXN5cDS
	 tLkRjLtFi8lOo7ggrg0d6ac3Mg39K3r5p9cgqj3jP36wIAbRQgnScrwoO6GFeMPLvl
	 HjXurFei/m2CL1e+RmVCDSeGjPkfaO6JfD2sAo/KkziC0wOKlJ+MmMdX9tSZSa8JVt
	 bx9Pczmh73TSw==
Date: Fri, 15 Mar 2024 16:58:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
In-Reply-To: <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403151650230.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop> <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop> <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop> <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com> <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com> <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com> <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com> <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org> <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
 <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-233457267-1710546788=:853156"
Content-ID: <alpine.DEB.2.22.394.2403151653250.853156@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-233457267-1710546788=:853156
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2403151653251.853156@ubuntu-linux-20-04-desktop>

On Fri, 15 Mar 2024, George Dunlap wrote:
> On Fri, Mar 15, 2024 at 2:13 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 15.03.2024 14:55, Julien Grall wrote:
> > > Hi Jan,
> > >
> > > On 15/03/2024 13:24, Jan Beulich wrote:
> > >> On 15.03.2024 13:17, George Dunlap wrote:
> > >>> On Fri, Mar 15, 2024 at 11:57 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>>>> It sounds like Andy and Stefano feel like this is a situation where "a
> > >>>>> fixed width quantity is meant"; absent any further guidance from the
> > >>>>> CODING_STYLE about when fixed widths should or should not be used, I
> > >>>>> don't think this change would be a violation of CODING_STYLE.
> [snip]
> > >>> Other than "it's in CODING_STYLE", and "it's not really necessary
> > >>> because it's ensured in the assembly code", you haven't advanced a
> > >>> single reason why "uint32_t" is problematic.
> > >>
> > >> And it isn't, I never said it would be. But if we set rules for
> > >> ourselves, why would we take the first opportunity to not respect them?
> > >
> > > I am a bit confused. Reading through the thread you seem to agree that
> > > the written rules are respected here. So what rules are you talking about?
> >
> > What was proposed is use of a fixed width type where according to my
> > reading ./CODING_STYLE says it shouldn't be used.
> 
> This conversation is starting to get frustrating.  That's simply not
> what it says, and I pointed that out just a few messages ago.
> 
> To reiterate:The text says fixed-width types are OK when a fixed-width
> quantity is "meant"; and that in this case, Stefano and Andy "mean" to
> use a fixed-width quantity.  The implied subtext of that sentence
> could be, "Don't use fixed width types unless there's a good reason to
> use a fixed width", and both Andy and Stefano think there's a good
> reason.  This argument you haven't really addressed at all, except
> with a specious "slippery slope" argument meant to nullify the
> exception; and now you attempt to simply ignore.
> 
> I venture to assert that for most people, the rules are a means to an
> end: That end being code which is correct, robust, fast, easy to
> write, maintain, debug, and review patches for.  What I agreed to,
> when I accepted this patch, was that *in general* we would avoid using
> fixed-width types; but that there were cases where doing so made
> sense.  Some of those were discussed in the thread above.
> 
> Andy and Stefano have already put forward reasons why they think a
> fixed-width type would be better here, which are related to "end
> goals": namely, more robust and easy to maintain code.  When I asked
> what "end goals" would be negatively impacted by using a fixed-width
> type, you explicitly said that there were none!  That the *only*
> reason you're continuing to argue is that we have a document somewhere
> that says we should -- a document which explicitly acknowledges that
> there will be exceptions!
> 
> The ideal response would have been to lay out a reasonably
> comprehensive set of criteria for when to use basic types, when to use
> fixed-width types, and how each criteria advanced the end goals of a
> better codebase.  A sufficient response would have been to lay out
> reasons why "better codebase", in this instance, tilts towards using a
> basic type rather than a fixed-width type.
> 
> Saying "That's what the rules say", without motivating it by
> explaining how it connects to a better codebase, is just not a helpful
> response; and making that argument after it's been pointed out that
> that is *not* what the rules say is even worse.

Thanks George for taking the time to write all of the above.

Let's please move forward with this patch.
--8323329-233457267-1710546788=:853156--

