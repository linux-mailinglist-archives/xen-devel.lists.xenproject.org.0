Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11B28144A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2144.6390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLJS-0003JR-Vy; Fri, 02 Oct 2020 13:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2144.6390; Fri, 02 Oct 2020 13:41:30 +0000
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
	id 1kOLJS-0003Il-Qn; Fri, 02 Oct 2020 13:41:30 +0000
Received: by outflank-mailman (input) for mailman id 2144;
 Fri, 02 Oct 2020 13:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOZ3=DJ=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kOLJQ-0003Hu-1W
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:41:29 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d7d1c44-1feb-4b6b-afa1-a9ecb2f100f8;
 Fri, 02 Oct 2020 13:41:25 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kOLJG-0008Pc-Cw; Fri, 02 Oct 2020 13:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QOZ3=DJ=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kOLJQ-0003Hu-1W
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:41:29 +0000
X-Inumbo-ID: 1d7d1c44-1feb-4b6b-afa1-a9ecb2f100f8
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d7d1c44-1feb-4b6b-afa1-a9ecb2f100f8;
	Fri, 02 Oct 2020 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YAy0v19KwKZlKr9ru/zVpzMUsVTEeJ2e3pekJyodo14=; b=iexghG7snc7QxKkez1o5os1/3C
	VMsVigSDzAim81w0WG62063q1/2M6oleyQVttaq/DwGZpvUko1TAcHMiTc7Y71fOc776brlCHNpL9
	TF/rDja+6ZlYfSRQyLAmdcF816yQQD7Gh4cjTtX9zkHPhiQblkCbSro/WbJRcAl55o/FbkG8U4+cK
	ODEbYlsH/oL9/v8WuT6CkyJmXG3JPi8Quc8roDPCf51ax85lpPy9eX0zXlMe9YyE+ArPm6I6HfE9l
	/uwdBF13nEBfPVG49VpiveihT4b0xj7wbQ3rHDVvRI8ViBmr5WRPZYCia8pMZ2UvYjRxjqdaMXw/s
	NITHbeMw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOLJG-0008Pc-Cw; Fri, 02 Oct 2020 13:41:18 +0000
Date: Fri, 2 Oct 2020 14:41:18 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v1 1/5] mm/page_alloc: convert "report" flag of
 __free_one_page() to a proper flag
Message-ID: <20201002134118.GA20115@casper.infradead.org>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928182110.7050-2-david@redhat.com>

On Mon, Sep 28, 2020 at 08:21:06PM +0200, David Hildenbrand wrote:
> Let's prepare for additional flags and avoid long parameter lists of bools.
> Follow-up patches will also make use of the flags in __free_pages_ok(),
> however, I wasn't able to come up with a better name for the type - should
> be good enough for internal purposes.

> +/* Free One Page flags: for internal, non-pcp variants of free_pages(). */
> +typedef int __bitwise fop_t;

That invites confusion with f_op.  There's no reason to use _t as a suffix
here ... why not free_f?

> +/*
> + * Skip free page reporting notification for the (possibly merged) page. (will
> + * *not* mark the page reported, only skip the notification).

... Don't you mean "will not skip marking the page as reported, only
skip the notification"?

*reads code*

No, I'm still confused.  What does this sentence mean?

Would it help to have a FOP_DEFAULT that has FOP_REPORT_NOTIFY set and
then a FOP_SKIP_REPORT_NOTIFY define that is 0?

> -static inline void __free_one_page(struct page *page,
> -		unsigned long pfn,
> -		struct zone *zone, unsigned int order,
> -		int migratetype, bool report)
> +static inline void __free_one_page(struct page *page, unsigned long pfn,
> +				   struct zone *zone, unsigned int order,
> +				   int migratetype, fop_t fop_flags)

Please don't over-indent like this.

static inline void __free_one_page(struct page *page, unsigned long pfn,
		struct zone *zone, unsigned int order, int migratetype,
		fop_t fop_flags)

reads just as well and then if someone needs to delete the 'static'
later, they don't need to fiddle around with subsequent lines getting
the whitespace to line up again.


