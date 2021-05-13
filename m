Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BC38005A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 00:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127091.238778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhJsy-0006Wa-NB; Thu, 13 May 2021 22:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127091.238778; Thu, 13 May 2021 22:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhJsy-0006Tn-J5; Thu, 13 May 2021 22:32:52 +0000
Received: by outflank-mailman (input) for mailman id 127091;
 Thu, 13 May 2021 22:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhJsx-0006Th-RB
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 22:32:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77993eda-fc7d-41be-87b8-1cc155dd68d9;
 Thu, 13 May 2021 22:32:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 093ED61354;
 Thu, 13 May 2021 22:32:49 +0000 (UTC)
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
X-Inumbo-ID: 77993eda-fc7d-41be-87b8-1cc155dd68d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620945170;
	bh=JobBn5ClyiCaU5MqM2+6SS0+A3r7udsmTCc7WW9sszU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eL477i+/7fLUyGfUrES/7dhqEaGnmpYfxoLW9aDL7PTPqT/p5jMLMuGGe1XK6+J7a
	 nsxOJGtXF/wW1OKHHE3BQNtnc7tTGRNsRjlURbaXYhoOjQngTzT1u69457lMNVNu9D
	 70aaF2Ii7OktVIzxxKDTto0YYOE/bKURD1xXueDVMmaHNEZJH9k6O5g/i9FMoxwCj6
	 hVRDgnW+LIZh5F5LwDhairfgeClxC+EKzqCf/wWL4VIQEi99FAww/Jg0CQyPVh0lgI
	 WMqw8qf9Wy/TAAziRJJoajTD59DwTsx2+lNayTqLu8KRP5iC+Pt7swI3KFpP9JtxUx
	 7FVreKHG4EvnA==
Date: Thu, 13 May 2021 15:32:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address
 is shared before updating it
In-Reply-To: <caec9741-8c0e-b80a-1020-c985beb1e100@xen.org>
Message-ID: <alpine.DEB.2.21.2105131528230.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-9-julien@xen.org> <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s> <caec9741-8c0e-b80a-1020-c985beb1e100@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 12/05/2021 23:00, Stefano Stabellini wrote:
> > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Only the first 2GB of the virtual address space is shared between all
> > > the page-tables on Arm32.
> > > 
> > > There is a long outstanding TODO in xen_pt_update() stating that the
> > > function is can only work with shared mapping. Nobody has ever called
> >             ^ remove
> > 
> > > the function with private mapping, however as we add more callers
> > > there is a risk to mess things up.
> > > 
> > > Introduce a new define to mark the ened of the shared mappings and use
> >                                       ^end
> > 
> > > it in xen_pt_update() to verify if the address is correct.
> > > 
> > > Note that on Arm64, all the mappings are shared. Some compiler may
> > > complain about an always true check, so the new define is not introduced
> > > for arm64 and the code is protected with an #ifdef.
> >   On arm64 we could maybe define SHARED_VIRT_END to an arbitrarely large
> > value, such as:
> > 
> > #define SHARED_VIRT_END (1UL<<48)
> > 
> > or:
> > 
> > #define SHARED_VIRT_END DIRECTMAP_VIRT_END
> > 
> > ?
> 
> I thought about it but I didn't want to define to a random value... I felt not
> define it was better.

Yeah, I see your point: any restrictions in addressing (e.g. 48bits)
are physical address restrictions. Here we are talking about virtual
address restriction, and I don't think there are actually any
restrictions there?  We could validly map something at
0xffff_ffff_ffff_ffff. So even (1<<48) which makes sense at the physical
level, doesn't make sense in terms of virtual addresses.


> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ---
> > >      Changes in v2:
> > >          - New patch
> > > ---
> > >   xen/arch/arm/mm.c            | 11 +++++++++--
> > >   xen/include/asm-arm/config.h |  4 ++++
> > >   2 files changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > index 8fac24d80086..5c17cafff847 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
> > >        * For arm32, page-tables are different on each CPUs. Yet, they
> > > share
> > >        * some common mappings. It is assumed that only common mappings
> > >        * will be modified with this function.
> > > -     *
> > > -     * XXX: Add a check.
> > >        */
> > >       const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
> > >   +#ifdef SHARED_VIRT_END
> > > +    if ( virt > SHARED_VIRT_END ||
> > > +         (SHARED_VIRT_END - virt) < nr_mfns )
> > 
> > The following would be sufficient, right?
> > 
> >      if ( virt + nr_mfns > SHARED_VIRT_END )
> 
> This would not protect against an overflow. So I think it is best if we keep
> my version.

But there can be no overflow with the way SHARED_VIRT_END is defined.
Even if SHARED_VIRT_END was defined at (1<<48) there can be no overflow.
Only if we defined SHARED_VIRT_END as 0xffff_ffff_ffff_ffff we would
have an overflow, but you wrote above that your preference is not to do
that.

