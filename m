Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F1F322390
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 02:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88452.166338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMPg-0004s4-O5; Tue, 23 Feb 2021 01:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88452.166338; Tue, 23 Feb 2021 01:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMPg-0004rb-Ks; Tue, 23 Feb 2021 01:22:56 +0000
Received: by outflank-mailman (input) for mailman id 88452;
 Tue, 23 Feb 2021 01:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEMPf-0004pt-5Q
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 01:22:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee9dcbaf-0da7-473b-9b72-ecbc66cb8e8e;
 Tue, 23 Feb 2021 01:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C01764E57;
 Tue, 23 Feb 2021 01:22:49 +0000 (UTC)
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
X-Inumbo-ID: ee9dcbaf-0da7-473b-9b72-ecbc66cb8e8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614043369;
	bh=nepRcKS9LxIOYl82o+Qvw+H790U1zk0VxTswYbcPC/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ja3ltW8qHGcHkizFaHa85IPNwJ2/s1lfiDcHKpeluidLkjqCGpgG2AxMW3j7tQKPK
	 9URC5TR3NlLsgrUnUor72ogtq+SbTLedBSS5lgqI402w6sKl6D+jahKIrP/ak8J9/k
	 VELr1XPTObOc1NS1btmle2quIGqkIDlQsTCirhAGqqLX6jMWsMySTs2Ss9PgPGxP8/
	 4V7nIgcRb/EGbl32tuRnxs4rLfOLjmaxfHskllLL/Qhta3c1jnKrzc3mYUcXx5ilwp
	 3lIytZ1+2p3B6JJ8G89nl9wnSFz+NqFHLZgedBiNnBZCFx+y45eo1DOJnl40KK0XS3
	 GlTTQeMy7eTSQ==
Date: Mon, 22 Feb 2021 17:22:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
In-Reply-To: <ec608001-7663-961b-667c-bcf6397f1864@xen.org>
Message-ID: <alpine.DEB.2.21.2102221344200.3234@sstabellini-ThinkPad-T480s>
References: <20210220175413.14640-1-julien@xen.org> <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com> <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org> <alpine.DEB.2.21.2102221220000.3234@sstabellini-ThinkPad-T480s> <ec608001-7663-961b-667c-bcf6397f1864@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Feb 2021, Julien Grall wrote:
> On 22/02/2021 20:35, Stefano Stabellini wrote:
> > On Mon, 22 Feb 2021, Julien Grall wrote:
> > > On 22/02/2021 11:58, Bertrand Marquis wrote:
> > > > Hi Julien,
> > > > 
> > > > > On 20 Feb 2021, at 17:54, Julien Grall <julien@xen.org> wrote:
> > > > > 
> > > > > From: Julien Grall <jgrall@amazon.com>
> > > > > 
> > > > > At the moment, flush_page_to_ram() is both cleaning and invalidate to
> > > > > PoC the page. However, the cache line can be speculated and pull in
> > > > > the
> > > > > cache right after as it is part of the direct map.
> > > > 
> > > > If we go further through this logic maybe all calls to
> > > > clean_and_invalidate_dcache_va_range could be transformed in a
> > > > clean_dcache_va_range.
> > > 
> > > Likely yes. But I need to go through them one by one to confirm this is
> > > fine
> > > to do it (it also depends on the caching attributes used). I have sent
> > > this
> > > one in advance because this was discussed as part of XSA-364.
> > > 
> > > > 
> > > > > 
> > > > > So it is pointless to try to invalidate the line in the data cache.
> > > > > 
> > > > 
> > > > But what about processors which would not speculate ?
> > > > 
> > > > Do you expect any performance optimization here ?
> > > 
> > > When invalidating a line, you effectively remove it from the cache. If the
> > > page is going to be access a bit after, then you will have to load from
> > > the
> > > memory (or another cache).
> > > 
> > > With this change, you would only need to re-fetch the line if it wasn't
> > > evicted by the time it is accessed.
> > > 
> > > The line would be clean, so I would expect the eviction to have less an
> > > impact
> > > over re-fetching the memory.
> > > 
> > > > 
> > > > If so it might be good to explain it as I am not quite sure I get it.
> > > 
> > > This change is less about performance and more about unnecessary work.
> > > 
> > > The processor is likely going to be more clever than the developper and
> > > the
> > > exact numbers will vary depending on how the processor decide to manage
> > > the
> > > cache.
> > > 
> > > In general, we should avoid interferring too much with the cache without a
> > > good reason to do it.
> > > 
> > > How about the following commit message:
> > > 
> > > "
> > > At the moment, flush_page_to_ram() is both cleaning and invalidate to
> > > PoC the page.
> > > 
> > > The goal of flush_page_to_ram() is to prevent corruption when the guest
> > > has
> > > disabled the cache (the cache line may be dirty) and read the guest to
> > > read
> > > previous content.
> > > 
> > > Per this defintion, the invalidating the line is not necessary. So
> > > invalidating the cache is unnecessary. In fact, it may be
> > > counter-productive
> > > as the line may be (speculatively) accessed a bit after. So this will
> > > incurr
> > > an expensive access to the memory.
> > > 
> > > More generally, we should avoid interferring too much with cache.
> > > Therefore,
> > > flush_page_to_ram() is updated to only clean to PoC the page.
> > > 
> > > The performance impact of this change will depend on your
> > > workload/processor.
> > > "
> >    From a correctness and functionality perspective, we don't need the
> > invalidate. If the line is dirty we are writing it back to memory (point
> > of coherence) thanks to the clean operations anyway. If somebody writes
> > to that location, the processor should evict the old line anyway.
> 
> Location as in same physical address or the same set?
> 
> For the former, the line is usually bigger than any write. So it is unlikely
> to get evicted.
> 
> For the later, it will depend on the content of the other ways in the set.
> 
> > The only reason I can think of for doing a "clean and invalidate" rather
> > than just a "clean" would be that we are trying to give a hint to the
> > processor that the cacheline is soon to be evicted. Assuming that the
> > hint even leads to some sort of performance optimization.
> 
> This may change which lines get evict as there will be an unused way. But we
> are now down to the territory of micro-optimization.
> 
> If that's a problem for someone, then that user should better switch to cache
> coloring because the impact of flush_page_to_ram() will pretty small compare
> to the damage that another domain can do if it shares the same set.
> 
> > In any case, on the grounds that it is unnecessary, I am OK with this.
> > I agree with Julien's proposal of applying this patch "for-next".
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks! I am thinking to create a branch next again for queuing 4.15+ patches.
> Would that be fine with you?

yes good idea

