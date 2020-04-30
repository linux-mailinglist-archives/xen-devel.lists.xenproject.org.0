Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDF1BF04D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 08:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU2hW-0000Jj-Ov; Thu, 30 Apr 2020 06:29:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU2hV-0000Je-9p
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 06:29:37 +0000
X-Inumbo-ID: f5894f5a-8aab-11ea-9a02-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5894f5a-8aab-11ea-9a02-12813bfff9fa;
 Thu, 30 Apr 2020 06:29:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43A4EAB76;
 Thu, 30 Apr 2020 06:29:33 +0000 (UTC)
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a517cbc-9ff7-5b9e-f2c9-08c411703d5d@suse.com>
Date: Thu, 30 Apr 2020 08:29:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
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

On 30.04.2020 00:46, Stefano Stabellini wrote:
> On Fri, 17 Apr 2020, Jan Beulich wrote:
>> On 15.04.2020 03:02, Stefano Stabellini wrote:
>>> Introduce a function named reserve_heap_pages (similar to
>>> alloc_heap_pages) that allocates a requested memory range. Call
>>> __alloc_heap_pages for the implementation.
>>>
>>> Change __alloc_heap_pages so that the original page doesn't get
>>> modified, giving back unneeded memory top to bottom rather than bottom
>>> to top.
>>
>> While it may be less of a problem within a zone, doing so is
>> against our general "return high pages first" policy.
> 
> Is this something you'd be OK with anyway?

As a last resort, maybe. But it really depends on why it needs to be
this way.

> If not, do you have a suggestion on how to do it better? I couldn't find
> a nice way to do it without code duplication, or a big nasty 'if' in the
> middle of the function.

I'd first need to understand the problem to solve.

>>> +    pg = maddr_to_page(start);
>>> +    node = phys_to_nid(start);
>>> +    zone = page_to_zone(pg);
>>> +    page_list_del(pg, &heap(node, zone, order));
>>> +
>>> +    __alloc_heap_pages(pg, order, memflags, d);
>>
>> I agree with Julien in not seeing how this can be safe / correct.
> 
> I haven't seen any issues so far in my testing -- I imagine it is
> because there aren't many memory allocations after setup_mm() and before
> create_domUs()  (which on ARM is called just before
> domain_unpause_by_systemcontroller at the end of start_xen.)
> 
> 
> I gave a quick look at David's series. Is the idea that I should add a
> patch to do the following:
> 
> - avoiding adding these ranges to xenheap in setup_mm, wait for later
>   (a bit like reserved_mem regions)
> 
> - in construct_domU, add the range to xenheap and reserve it with reserve_heap_pages
> 
> Is that right?

This may be one way, but it may also be not the only possible one.
The main thing to arrange for is that there is either a guarantee
for these ranges to be free (which I think you want to check in
any event, rather than risking to give out something that's already
in use elsewhere), or that you skip ranges which are already in use
(potentially altering [decreasing?] what the specific domain gets
allocated).

Jan

