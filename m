Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA202C48B6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 20:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38037.70645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki0mL-0001xn-1r; Wed, 25 Nov 2020 19:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38037.70645; Wed, 25 Nov 2020 19:48:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki0mK-0001xQ-Uu; Wed, 25 Nov 2020 19:48:36 +0000
Received: by outflank-mailman (input) for mailman id 38037;
 Wed, 25 Nov 2020 19:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ki0mJ-0001xL-AU
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 19:48:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 684b9eb1-8476-449e-b0e2-49126d638c05;
 Wed, 25 Nov 2020 19:48:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2F3C2083E;
 Wed, 25 Nov 2020 19:48:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ki0mJ-0001xL-AU
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 19:48:35 +0000
X-Inumbo-ID: 684b9eb1-8476-449e-b0e2-49126d638c05
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 684b9eb1-8476-449e-b0e2-49126d638c05;
	Wed, 25 Nov 2020 19:48:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C2F3C2083E;
	Wed, 25 Nov 2020 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606333713;
	bh=9nqklDmA0mEpAAPaL+Az3Xe+UfoaEq3uC3vSHgdwAwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pD1nuOWse+aHf5Aec5Aq/8ANi2xfhoiN9kQdYOqVPRz7NJVamS9bbr7l9GMefdd71
	 Q1X+5IOhbEK1BEO/1iFPCrNn+XVdOv1BNgbYg9zTq1ODtw+L1BFC+tNAJkcr0bTTMi
	 RdFKHpxHZXyQ+Aydt5IjrMpr2ecvh9imqCM2aHHg=
Date: Wed, 25 Nov 2020 11:48:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for
 grant table allocations
In-Reply-To: <a752cdb9-4609-2a61-b657-c17cbe4febb8@suse.com>
Message-ID: <alpine.DEB.2.21.2011251122200.7979@sstabellini-ThinkPad-T480s>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com> <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com> <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org> <a752cdb9-4609-2a61-b657-c17cbe4febb8@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Nov 2020, Jan Beulich wrote:
> On 25.11.2020 13:15, Julien Grall wrote:
> > On 23/11/2020 14:23, Jan Beulich wrote:
> >> All of the array allocations in grant_table_init() can exceed a page's
> >> worth of memory, which xmalloc()-based interfaces aren't really suitable
> >> for after boot. We also don't need any of these allocations to be
> >> physically contiguous.. Introduce interfaces dynamically switching
> >> between xmalloc() et al and vmalloc() et al, based on requested size,
> >> and use them instead.
> >>
> >> All the wrappers in the new header get cloned mostly verbatim from
> >> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> >> for sizes and to unsigned int for alignments.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
> >>      meant to be edited from the beginning.
> >> ---
> >> I'm unconvinced of the mentioning of "physically contiguous" in the
> >> comment at the top of the new header: I don't think xmalloc() provides
> >> such a guarantee. Any use assuming so would look (latently) broken to
> >> me.
> > 
> > I haven't had the chance to reply to the first version about this. So I 
> > will reply here to avoid confusion.
> > 
> > I can at least spot one user in Arm that would use xmalloc() that way 
> > (see the allocation of itt_addr in arch/arm/gic-v3-its.c).
> 
> And I surely wouldn't have spotted this, even if I had tried
> to find "offenders", i.e. as said before not wanting to alter
> the behavior of existing code (beyond the explicit changes
> done here) was ...
> 
> > AFAIK, the memory is for the sole purpose of the ITS and should not be 
> > accessed by Xen. So I think we can replace by a new version of 
> > alloc_domheap_pages().
> > 
> > However, I still question the usefulness of introducing yet another way 
> > to allocate memory (we already have alloc_xenheap_pages(), xmalloc(), 
> > alloc_domheap_pages(), vmap()) if you think users cannot rely on 
> > xmalloc() to allocate memory physically contiguous.
> 
> ... the reason to introduce a separate new interface. Plus of
> course this parallels what Linux has.
> 
> > It definitely makes more difficult to figure out when to use xmalloc() 
> > vs xvalloc().
> 
> I don't see the difficulty:
> - if you need physically contiguous memory, use alloc_xen*_pages(),
> - if you know the allocation size is always no more than a page,
>   use xmalloc(),

What if you need memory physically contiguous but not necessarily an
order of pages, such as for instance 5200 bytes?

If xmalloc can't do physically contiguous allocations, we need something
else that does physically contiguous allocations not only at page
granularity, right?

The other issue is semantics. If xmalloc is unable to allocate more than
a page of contiguous memory, then it is identical to vmalloc from the
caller's point of view: both xmalloc and vmalloc return a virtual
address for an allocation that might not be physically contiguous.

Maybe we should get rid of xmalloc entirely and improve the
implementation of vmalloc so that it falls back to xmalloc for
sub-page allocations. Which in fact is almost the same thing that you
did.


> - if you know the allocation size is always more than a page, use
>   vmalloc(),
> - otherwise use xvmalloc(). Exceptions may of course apply, i.e.
> this is just a rule of thumb.
> 
> > I would like to hear an opinion from the other maintainers.
> 
> Let's hope at least one will voice theirs.

If we take a step back, I think we only really need two memory
allocators:

1) one that allocates physically contiguous memory
2) one that allocates non-physically contiguous memory

That's it, right?

In addition to that, I understand it could be convient to have a little
wrapper that automatically chooses between 1) and 2) depending on
circumstances.

But if the circumstance is just size < PAGE_SIZE then I don't think we
need any convenience wrappers: we should just be able to call 2), which
is vmalloc, once we improve the vmalloc implementation.

Or do you see any reasons to keep the current vmalloc implementation as
is for sub-page allocations?

