Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB59827A20
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 22:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664118.1034289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMx3X-0001xZ-QB; Mon, 08 Jan 2024 21:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664118.1034289; Mon, 08 Jan 2024 21:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMx3X-0001vZ-Mx; Mon, 08 Jan 2024 21:21:11 +0000
Received: by outflank-mailman (input) for mailman id 664118;
 Mon, 08 Jan 2024 21:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFOe=IS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rMx3W-0001vQ-3l
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 21:21:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4c745ec-ae6b-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 22:21:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56A8C610A1;
 Mon,  8 Jan 2024 21:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86911C433C7;
 Mon,  8 Jan 2024 21:21:02 +0000 (UTC)
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
X-Inumbo-ID: d4c745ec-ae6b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704748864;
	bh=J8muup0wlglgrTz8MoYwTawipVGTqClNwBde2ultwdc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R0Vol6hL+Bc7XxvXvg5uBSD+GHRAHH6/TqgapYIdRiG7ie7R/Hdt5Rv9DXbT6oC5V
	 okG5FTPJkKaehT+Qw9SCZYvBLTu0IO8xvgo3buIrNA3ynL5VDy1G+JoEyyoupjzUA7
	 vUvn7AKzNjISmo6mlD72ac+tsdzI1S2EIFpn+/WgWveeX5NnGjIj8d6U8/mJ6qB0AH
	 zw/BmUzPDkwkTdUY2L5Pdbqkb4e8sjHr70UFSRsmRbWvx5/iB4cWWRYvnK4kZ86TB7
	 6/ng7B1TxZT7DANjJb24r7oJAZ+DGdNhmowVfza7CsUmmuOrFvXD2qbPC1JT9xYt6S
	 j1pkicvA/XKNQ==
Date: Mon, 8 Jan 2024 13:21:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Carlo Nonato <carlo.nonato@minervasys.tech>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache
 coloring
In-Reply-To: <CAG+AhRXAY1TX-z2Aw0F1oEOKY=pjU9dV+C+hu4aPjF8H2Uj=Ng@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2401081319130.3675@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org> <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org> <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com> <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org> <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com> <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
 <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com> <08b7535e-da40-4578-b865-9b350ace379c@suse.com> <CAG+AhRXAY1TX-z2Aw0F1oEOKY=pjU9dV+C+hu4aPjF8H2Uj=Ng@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-545452899-1704748863=:3675"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-545452899-1704748863=:3675
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 8 Jan 2024, Carlo Nonato wrote:
> Hi Jan,
> 
> On Mon, Jan 8, 2024 at 5:40 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 08.01.2024 17:31, Carlo Nonato wrote:
> > > On Mon, Jan 8, 2024 at 4:32 PM Julien Grall <julien@xen.org> wrote:
> > >> On 08/01/2024 15:18, Carlo Nonato wrote:
> > >>>> No. I am saying that that we should not be able to allow changing the
> > >>>> colors after the memory has been allocated. To give an example, your
> > >>>> current code would allow:
> > >>>>
> > >>>>     1) Setup the P2M pools or allocate RAM
> > >>>>     2) Set the color
> > >>>>
> > >>>> This would render the coloring configuration moot.
> > >>>>
> > >>>> Whether we want to allow changing the coloring before hand is a
> > >>>> different question and as I wrote earlier on, I don't mind if you want
> > >>>> to forbid that.
> > >>>
> > >>> At the moment I'm relying on the toolstack in the sense that I know that it
> > >>> will set colors right after domain creation and before memory allocation.
> > >>> Calling alloc_domheap_pages() without a coloring configuration makes Xen
> > >>> crash, so it's mandatory to have the configuration done before any allocation.
> > >>> I know that we shouldn't rely on the toolstack this much, but I didn't
> > >>> find a better way. Given this assumption, looking for an already existing
> > >>> color configuration of a domain is sufficient to avoid what you are saying.
> > >>>
> > >>> Is it possible to enforce such a constraint with domctl? > I mean to be sure that this domctl will be called at a precise time.
> > >>
> > >> Yes. You can...
> > >>
> > >>>
> > >>> Thanks.
> > >>>
> > >>>>> I don't know what to check that.
> > >>>>
> > >>>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
> > >>>> is still 0. I think for RAM, you can check d->tot_pages == 0.
> > >>
> > >> ... reject the call if either of the two fields are not zero.
> > >
> > > What I'm saying is that Xen would crash before even reaching this point if no
> > > colors were provided. Let's say that the toolstack or whatever hypercall user
> > > isn't calling this domctl at all (or not at the right time), then the domain
> > > colored allocator would always return null pages since there are no colors.
> > > We would have a crash and your if (or mine) would be useless.
> >
> > Why is it that you can't simply allocated arbitrary memory if coloring
> > information wasn't set up front? Aiui that'll be required anyway, as
> > there shouldn't be a restriction that all domains have to use coloring.
> 
> If coloring is enabled all domains are colored. It's one of our first
> assumptions. We haven't developed something that works hybridly and supporting
> that would require some rework.

I think that's a good assumption and I wouldn't go in the direction of
supporting a mix of colored and non-colored. To benefit from cache
coloring, all domains need to be colored, otherwise a single non-colored
domain could thrash the cache of everyone else.
--8323329-545452899-1704748863=:3675--

