Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60444678B1F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483321.749421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5k5-0002sE-AW; Mon, 23 Jan 2023 22:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483321.749421; Mon, 23 Jan 2023 22:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5k5-0002qK-7m; Mon, 23 Jan 2023 22:56:45 +0000
Received: by outflank-mailman (input) for mailman id 483321;
 Mon, 23 Jan 2023 22:56:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK5k3-0002qE-Ou
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:56:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33109475-9b71-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 23:56:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5156D61031;
 Mon, 23 Jan 2023 22:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1AFC433EF;
 Mon, 23 Jan 2023 22:56:38 +0000 (UTC)
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
X-Inumbo-ID: 33109475-9b71-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674514599;
	bh=fOJEyuWIKOYhXZe6fFrfsTDgt7D07/pRaa2AARrhRk8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SYFryKR43dT8AQIjAus0HxaZohLMcsJSV7ugmtr8FqINDsslpCSJpqmCffcYulomK
	 hWvnSzULgpsoLfhpgZiJpeBCM3F3GEIl4Bp1XFfr3g3TiGqfym6ZdlOevDCqmZoNUw
	 Z7wRWKqLD3VJIHtsoIq9VZe9a1mVZjrv2L+hC2lOFmG2gkhy9E4Xlpzyep0br2eB/W
	 glIg5wZal/iPlEHiwQq6exzYzRxphoeNMQLhCR4k+MIBJXWmNYnzzT8m/1o6I/nBKz
	 jzckwmquRnsbZz8Tf13iibxDe1o7keo8W6CMEY1WRD16ou5zeliCwfaNZNlLdeUL7i
	 pbEoxUrGsQofQ==
Date: Mon, 23 Jan 2023 14:56:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH 17/22] x86/setup: vmap heap nodes when they are outside
 the direct map
In-Reply-To: <ea6c03f4-13ad-e312-1827-8e1c5ea1363e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231452470.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-18-julien@xen.org> <alpine.DEB.2.22.394.2301231358440.1978264@ubuntu-linux-20-04-desktop> <ea6c03f4-13ad-e312-1827-8e1c5ea1363e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jan 2023, Julien Grall wrote:
> On 23/01/2023 22:03, Stefano Stabellini wrote:
> > On Fri, 16 Dec 2022, Julien Grall wrote:
> > > From: Hongyan Xia <hongyxia@amazon.com>
> > > 
> > > When we do not have a direct map, archs_mfn_in_direct_map() will always
> > > return false, thus init_node_heap() will allocate xenheap pages from an
> > > existing node for the metadata of a new node. This means that the
> > > metadata of a new node is in a different node, slowing down heap
> > > allocation.
> > > 
> > > Since we now have early vmap, vmap the metadata locally in the new node.
> > > 
> > > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ----
> > > 
> > >      Changes from Hongyan's version:
> > >          * arch_mfn_in_direct_map() was renamed to
> > >            arch_mfns_in_direct_map()
> > >          * Use vmap_contig_pages() rather than __vmap(...).
> > >          * Add missing include (xen/vmap.h) so it compiles on Arm
> > > ---
> > >   xen/common/page_alloc.c | 42 +++++++++++++++++++++++++++++++----------
> > >   1 file changed, 32 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> > > index 0c4af5a71407..581c15d74dfb 100644
> > > --- a/xen/common/page_alloc.c
> > > +++ b/xen/common/page_alloc.c
> > > @@ -136,6 +136,7 @@
> > >   #include <xen/sched.h>
> > >   #include <xen/softirq.h>
> > >   #include <xen/spinlock.h>
> > > +#include <xen/vmap.h>
> > >     #include <asm/flushtlb.h>
> > >   #include <asm/numa.h>
> > > @@ -597,22 +598,43 @@ static unsigned long init_node_heap(int node,
> > > unsigned long mfn,
> > >           needed = 0;
> > >       }
> > >       else if ( *use_tail && nr >= needed &&
> > > -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
> > >                 (!xenheap_bits ||
> > >                  !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> > >       {
> > > -        _heap[node] = mfn_to_virt(mfn + nr - needed);
> > > -        avail[node] = mfn_to_virt(mfn + nr - 1) +
> > > -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> > > -    }
> > > -    else if ( nr >= needed &&
> > > -              arch_mfns_in_directmap(mfn, needed) &&
> > > +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> > > +        {
> > > +            _heap[node] = mfn_to_virt(mfn + nr - needed);
> > > +            avail[node] = mfn_to_virt(mfn + nr - 1) +
> > > +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> > > +        }
> > > +        else
> > > +        {
> > > +            mfn_t needed_start = _mfn(mfn + nr - needed);
> > > +
> > > +            _heap[node] = vmap_contig_pages(needed_start, needed);
> > > +            BUG_ON(!_heap[node]);
> > 
> > I see a BUG_ON here but init_node_heap is not __init.
> 
> FWIW, this is not the first introducing the first BUG_ON() in this function.
> 
>  Asking because
> > BUG_ON is only a good idea during init time. Should init_node_heap be
> > __init (not necessarely in this patch, but still)?
> AFAIK, there are two uses outside of __init:
>   1) Free the init sections
>   2) Memory hotplug
> 
> In the first case, we will likely need to panic() in case of an error. For
> ther second case, I am not entirely sure.
> 
> But there would be a fair bit of plumbing and thinking (how do you deal with
> the case where part of the memory were already added?).
> 
> Anyway, I don't think I am making the function worse, so I would rather no
> open that can of worms (yet).

I am only trying to check that we are not introducing any BUG_ONs that
could be triggered at runtime. We don't have a rule that requires the
function with a BUG_ON to be __init, however that is a simple and nice
way to check that the BUG_ON is appropriate.

In this specific case, you are right that there are already 2 BUG_ONs
in this function so you are not making things worse.

Aside from Jan's code style comment:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

