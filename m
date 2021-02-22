Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C23220DB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 21:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88385.166181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHvB-0008C5-0Z; Mon, 22 Feb 2021 20:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88385.166181; Mon, 22 Feb 2021 20:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHvA-0008Bg-T6; Mon, 22 Feb 2021 20:35:08 +0000
Received: by outflank-mailman (input) for mailman id 88385;
 Mon, 22 Feb 2021 20:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zptr=HY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEHv8-0008Bb-TP
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 20:35:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f1ff0bb-c2c7-4c11-87df-b747571a6764;
 Mon, 22 Feb 2021 20:35:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 231F864E05;
 Mon, 22 Feb 2021 20:35:05 +0000 (UTC)
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
X-Inumbo-ID: 9f1ff0bb-c2c7-4c11-87df-b747571a6764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614026105;
	bh=tnL3z2looJ3vk2lLI/WaSNlC0mRPUEjmHywP8Ef6kS0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aCBmEjtYlXlkuVdxsN0tsad3334No51kAm/EqkWggf9nML/roBnXQz9i+/q5wCgwf
	 hINTCRrl0JQCKXzonXvFyrDuLRKOk3r+noqAHgQlFKe64DJxNCCbsjiRAWXXtmoTyo
	 +7T3WNrExANqGImOAs5BaDtO5rwIWvXyEOL0SA2Xg1+9gzkGSxA3H2uuiWUhhCOmUn
	 1CcbQVl7OY2xzod3yRanE8VoOKOZyhCRbdgQzrSfPFp64nj403/PxTirOh4xJ2X0At
	 r/zO5WQTDj9s7ztmyvRIhjowzl3vM1dtA+e8zH3KijpAIEZuSPY+e51LLk+xLF+72E
	 qrh7xsCflXYpw==
Date: Mon, 22 Feb 2021 12:35:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
In-Reply-To: <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
Message-ID: <alpine.DEB.2.21.2102221220000.3234@sstabellini-ThinkPad-T480s>
References: <20210220175413.14640-1-julien@xen.org> <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com> <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Feb 2021, Julien Grall wrote:
> On 22/02/2021 11:58, Bertrand Marquis wrote:
> > Hi Julien,
> > 
> > > On 20 Feb 2021, at 17:54, Julien Grall <julien@xen.org> wrote:
> > > 
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > At the moment, flush_page_to_ram() is both cleaning and invalidate to
> > > PoC the page. However, the cache line can be speculated and pull in the
> > > cache right after as it is part of the direct map.
> > 
> > If we go further through this logic maybe all calls to
> > clean_and_invalidate_dcache_va_range could be transformed in a
> > clean_dcache_va_range.
> 
> Likely yes. But I need to go through them one by one to confirm this is fine
> to do it (it also depends on the caching attributes used). I have sent this
> one in advance because this was discussed as part of XSA-364.
> 
> > 
> > > 
> > > So it is pointless to try to invalidate the line in the data cache.
> > > 
> > 
> > But what about processors which would not speculate ?
> > 
> > Do you expect any performance optimization here ?
> 
> When invalidating a line, you effectively remove it from the cache. If the
> page is going to be access a bit after, then you will have to load from the
> memory (or another cache).
> 
> With this change, you would only need to re-fetch the line if it wasn't
> evicted by the time it is accessed.
> 
> The line would be clean, so I would expect the eviction to have less an impact
> over re-fetching the memory.
> 
> > 
> > If so it might be good to explain it as I am not quite sure I get it.
> 
> This change is less about performance and more about unnecessary work.
> 
> The processor is likely going to be more clever than the developper and the
> exact numbers will vary depending on how the processor decide to manage the
> cache.
> 
> In general, we should avoid interferring too much with the cache without a
> good reason to do it.
> 
> How about the following commit message:
> 
> "
> At the moment, flush_page_to_ram() is both cleaning and invalidate to
> PoC the page.
> 
> The goal of flush_page_to_ram() is to prevent corruption when the guest has
> disabled the cache (the cache line may be dirty) and read the guest to read
> previous content.
> 
> Per this defintion, the invalidating the line is not necessary. So
> invalidating the cache is unnecessary. In fact, it may be counter-productive
> as the line may be (speculatively) accessed a bit after. So this will incurr
> an expensive access to the memory.
> 
> More generally, we should avoid interferring too much with cache. Therefore,
> flush_page_to_ram() is updated to only clean to PoC the page.
> 
> The performance impact of this change will depend on your workload/processor.
> "
 
From a correctness and functionality perspective, we don't need the
invalidate. If the line is dirty we are writing it back to memory (point
of coherence) thanks to the clean operations anyway. If somebody writes
to that location, the processor should evict the old line anyway.

The only reason I can think of for doing a "clean and invalidate" rather
than just a "clean" would be that we are trying to give a hint to the
processor that the cacheline is soon to be evicted. Assuming that the
hint even leads to some sort of performance optimization.

In practice, aside from being CPU specific, we don't know if it is even
a optimization or a pessimization.

In any case, on the grounds that it is unnecessary, I am OK with this.
I agree with Julien's proposal of applying this patch "for-next".

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

