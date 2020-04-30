Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39E1C0251
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 18:21:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUBwD-0006Fo-5T; Thu, 30 Apr 2020 16:21:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUBwB-0006Fj-1l
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 16:21:23 +0000
X-Inumbo-ID: a151c13a-8afe-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a151c13a-8afe-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 16:21:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6426820873;
 Thu, 30 Apr 2020 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588263681;
 bh=rNFtDOEbs8uAin7Ylu6G/jRCGahMOj0lxwRqASbytQk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rjGyc0rFFBnJGflR/bcpKkx/CqDvUDB3W2zATLipgHe/tPxpLQ0FSMJBpB7Gsdx+Y
 14I6xLu3qGzfunbzAvSZRxrZPe2w5BST+btYcXtBvCn09h+wixyxhzx70MdwA3y6bq
 yfJrdG3bjISNTTqFuh47AEZ8UriXISOs+szkuBHg=
Date: Thu, 30 Apr 2020 09:21:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
In-Reply-To: <8a517cbc-9ff7-5b9e-f2c9-08c411703d5d@suse.com>
Message-ID: <alpine.DEB.2.21.2004300907060.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <8a517cbc-9ff7-5b9e-f2c9-08c411703d5d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Apr 2020, Jan Beulich wrote:
> On 30.04.2020 00:46, Stefano Stabellini wrote:
> > On Fri, 17 Apr 2020, Jan Beulich wrote:
> >> On 15.04.2020 03:02, Stefano Stabellini wrote:
> >>> Introduce a function named reserve_heap_pages (similar to
> >>> alloc_heap_pages) that allocates a requested memory range. Call
> >>> __alloc_heap_pages for the implementation.
> >>>
> >>> Change __alloc_heap_pages so that the original page doesn't get
> >>> modified, giving back unneeded memory top to bottom rather than bottom
> >>> to top.
> >>
> >> While it may be less of a problem within a zone, doing so is
> >> against our general "return high pages first" policy.
> > 
> > Is this something you'd be OK with anyway?
> 
> As a last resort, maybe. But it really depends on why it needs to be
> this way.
> 
> > If not, do you have a suggestion on how to do it better? I couldn't find
> > a nice way to do it without code duplication, or a big nasty 'if' in the
> > middle of the function.
> 
> I'd first need to understand the problem to solve.

OK, I'll make an example.

reserve_heap_pages wants to reserve the range 0x10000000 - 0x20000000.

reserve_heap_pages get the struct page_info for 0x10000000 and calls
alloc_pages_from_buddy to allocate an order of 28.

alloc_pages_from_buddy realizes that the free memory area starting from
0x10000000 is actually of order 30, even larger than the requested order
of 28. The free area is 0x10000000 - 0x50000000.

alloc_pages_from_buddy instead of just allocating an order of 28
starting from 0x10000000, it would allocate the "top" order of 28 in the
free area. So it would allocate: 0x40000000 - 0x50000000, returning
0x40000000.

Of course, this doesn't work for reserve_heap_pages.


This patch changes the behavior of alloc_pages_from_buddy so that in a
situation like the above, it would return 0x10000000 - 0x20000000
(leaving the rest of the free area unallocated.)

