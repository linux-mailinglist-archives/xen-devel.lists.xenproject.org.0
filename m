Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4571C355B
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 11:17:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVXDS-0005RP-I5; Mon, 04 May 2020 09:16:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVXDQ-0005RK-MF
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 09:16:44 +0000
X-Inumbo-ID: f8027fce-8de7-11ea-9d06-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8027fce-8de7-11ea-9d06-12813bfff9fa;
 Mon, 04 May 2020 09:16:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C528ACF1;
 Mon,  4 May 2020 09:16:43 +0000 (UTC)
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <8a517cbc-9ff7-5b9e-f2c9-08c411703d5d@suse.com>
 <alpine.DEB.2.21.2004300907060.28941@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <224e04ed-e790-d963-f74a-d600677c4413@suse.com>
Date: Mon, 4 May 2020 11:16:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004300907060.28941@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 18:21, Stefano Stabellini wrote:
> On Thu, 30 Apr 2020, Jan Beulich wrote:
>> On 30.04.2020 00:46, Stefano Stabellini wrote:
>>> On Fri, 17 Apr 2020, Jan Beulich wrote:
>>>> On 15.04.2020 03:02, Stefano Stabellini wrote:
>>>>> Introduce a function named reserve_heap_pages (similar to
>>>>> alloc_heap_pages) that allocates a requested memory range. Call
>>>>> __alloc_heap_pages for the implementation.
>>>>>
>>>>> Change __alloc_heap_pages so that the original page doesn't get
>>>>> modified, giving back unneeded memory top to bottom rather than bottom
>>>>> to top.
>>>>
>>>> While it may be less of a problem within a zone, doing so is
>>>> against our general "return high pages first" policy.
>>>
>>> Is this something you'd be OK with anyway?
>>
>> As a last resort, maybe. But it really depends on why it needs to be
>> this way.
>>
>>> If not, do you have a suggestion on how to do it better? I couldn't find
>>> a nice way to do it without code duplication, or a big nasty 'if' in the
>>> middle of the function.
>>
>> I'd first need to understand the problem to solve.
> 
> OK, I'll make an example.
> 
> reserve_heap_pages wants to reserve the range 0x10000000 - 0x20000000.
> 
> reserve_heap_pages get the struct page_info for 0x10000000 and calls
> alloc_pages_from_buddy to allocate an order of 28.
> 
> alloc_pages_from_buddy realizes that the free memory area starting from
> 0x10000000 is actually of order 30, even larger than the requested order
> of 28. The free area is 0x10000000 - 0x50000000.
> 
> alloc_pages_from_buddy instead of just allocating an order of 28
> starting from 0x10000000, it would allocate the "top" order of 28 in the
> free area. So it would allocate: 0x40000000 - 0x50000000, returning
> 0x40000000.
> 
> Of course, this doesn't work for reserve_heap_pages.
> 
> 
> This patch changes the behavior of alloc_pages_from_buddy so that in a
> situation like the above, it would return 0x10000000 - 0x20000000
> (leaving the rest of the free area unallocated.)

So what if then, for the same order-30 (really order-18 if I assume
you name addresses, not frame numbers), a reservation request came
in for the highest order-28 sub-region? You'd again be screwed if
you relied on which part of a larger buddy gets returned by the
lower level function you call. I can't help thinking that basing
reservation on allocation functions can't really be made work for
all possible cases. Instead reservation requests need to check that
the requested range is free _and_ split the potentially larger
range according to the request.

Jan

