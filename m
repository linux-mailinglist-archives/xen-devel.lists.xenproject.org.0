Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248C678A28
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483277.749342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4uv-0001oi-MZ; Mon, 23 Jan 2023 22:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483277.749342; Mon, 23 Jan 2023 22:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4uv-0001mz-Jl; Mon, 23 Jan 2023 22:03:53 +0000
Received: by outflank-mailman (input) for mailman id 483277;
 Mon, 23 Jan 2023 22:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4uu-0001mb-IL
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:03:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10673bf-9b69-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 23:03:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EC46B80DD4;
 Mon, 23 Jan 2023 22:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB72C433D2;
 Mon, 23 Jan 2023 22:03:47 +0000 (UTC)
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
X-Inumbo-ID: d10673bf-9b69-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674511428;
	bh=1sW3BkkqzetZkyypVgS7OGxzxKEd0zxhoJpCmMoJrjk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MLxGYK3V8qRGxFfUU7gfVIeAqyhosC8lZhVhNtmAQoasmUzn0g5Jtrx2StGyI39ff
	 Y8H0sIjGSNyJByxulABl7rEPfjV1Mku3/qJv1vo25dk1jveX752hobJjQNCcJYp10r
	 xnHUQAWlH2d2uA+yiWUvtWE9mnN00JjjO/VRELzwpvyDQq0HpBmzOT1ITkAN7Fg8P9
	 lXaxmXGDSxY0Fgw62sIIXMg6u7qyfnyHAfeIcWdksvRQgGsefDQrXkq0Lj/YTQWKfv
	 jy08GUFuPs3evxl89vvLZKISFmciR4tkBc8hbXNMDVWYqo5hadu27P7P0c813m2z4j
	 XBLRjtQvUtNTg==
Date: Mon, 23 Jan 2023 14:03:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH 17/22] x86/setup: vmap heap nodes when they are outside
 the direct map
In-Reply-To: <20221216114853.8227-18-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231358440.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-18-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When we do not have a direct map, archs_mfn_in_direct_map() will always
> return false, thus init_node_heap() will allocate xenheap pages from an
> existing node for the metadata of a new node. This means that the
> metadata of a new node is in a different node, slowing down heap
> allocation.
> 
> Since we now have early vmap, vmap the metadata locally in the new node.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
>     Changes from Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to
>           arch_mfns_in_direct_map()
>         * Use vmap_contig_pages() rather than __vmap(...).
>         * Add missing include (xen/vmap.h) so it compiles on Arm
> ---
>  xen/common/page_alloc.c | 42 +++++++++++++++++++++++++++++++----------
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 0c4af5a71407..581c15d74dfb 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -136,6 +136,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/spinlock.h>
> +#include <xen/vmap.h>
>  
>  #include <asm/flushtlb.h>
>  #include <asm/numa.h>
> @@ -597,22 +598,43 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>          needed = 0;
>      }
>      else if ( *use_tail && nr >= needed &&
> -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>                (!xenheap_bits ||
>                 !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> -    }
> -    else if ( nr >= needed &&
> -              arch_mfns_in_directmap(mfn, needed) &&
> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> +        {
> +            _heap[node] = mfn_to_virt(mfn + nr - needed);
> +            avail[node] = mfn_to_virt(mfn + nr - 1) +
> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        }
> +        else
> +        {
> +            mfn_t needed_start = _mfn(mfn + nr - needed);
> +
> +            _heap[node] = vmap_contig_pages(needed_start, needed);
> +            BUG_ON(!_heap[node]);

I see a BUG_ON here but init_node_heap is not __init. Asking because
BUG_ON is only a good idea during init time. Should init_node_heap be
__init (not necessarely in this patch, but still)?


> +            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                          sizeof(**avail) * NR_ZONES;
> +        }
> +    } else if ( nr >= needed &&
>                (!xenheap_bits ||
>                 !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] = mfn_to_virt(mfn);
> -        avail[node] = mfn_to_virt(mfn + needed - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        if ( arch_mfns_in_directmap(mfn, needed) )
> +        {
> +            _heap[node] = mfn_to_virt(mfn);
> +            avail[node] = mfn_to_virt(mfn + needed - 1) +
> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        }
> +        else
> +        {
> +            mfn_t needed_start = _mfn(mfn);
> +
> +            _heap[node] = vmap_contig_pages(needed_start, needed);
> +            BUG_ON(!_heap[node]);
> +            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                          sizeof(**avail) * NR_ZONES;
> +        }
>          *use_tail = false;
>      }
>      else if ( get_order_from_bytes(sizeof(**_heap)) ==
> -- 
> 2.38.1
> 

