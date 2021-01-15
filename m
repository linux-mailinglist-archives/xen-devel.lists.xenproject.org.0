Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C62F81E5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 18:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68459.122588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Sfl-00079B-Lw; Fri, 15 Jan 2021 17:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68459.122588; Fri, 15 Jan 2021 17:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Sfl-00078m-Ii; Fri, 15 Jan 2021 17:14:05 +0000
Received: by outflank-mailman (input) for mailman id 68459;
 Fri, 15 Jan 2021 17:14:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Sfk-00078h-5h
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 17:14:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Sfg-0000VA-0f; Fri, 15 Jan 2021 17:14:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Sff-0006aZ-Gt; Fri, 15 Jan 2021 17:13:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=uY6H7s2rxCziv4urw5wiiNEUNDevc4dgCDZ96v9f178=; b=aC1qJzTQWUACz9NZOlLOQ1mIEx
	Yy7PkOwxwm3ZZxXXfi7BoC6ZPuVQTv+AeQSlrAbE6KDlVxM+QGA+ZswEITALJGfIcR5c8EjJXcDtr
	UZcfXSVPbphhxm+riAT/Z6i8OXEMdAtkuxUwIh3/e16bYSp8w2gz0DDMoydIpUkpDcgw=;
Subject: Re: IRQ latency measurements in hypervisor
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
Date: Fri, 15 Jan 2021 17:13:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87wnwe2ogp.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/01/2021 15:45, Volodymyr Babchuk wrote:
> 
> Hi Julien,
> 
> Julien Grall writes:
> 
>> Hi Volodymyr, Stefano,
>>
>> On 14/01/2021 23:33, Stefano Stabellini wrote:
>>> + Bertrand, Andrew (see comment on alloc_heap_pages())
>>
>> Long running hypercalls are usually considered security issues.
>>
>> In this case, only the control domain can issue large memory
>> allocation (2GB at a time). Guest, would only be able to allocate 2MB
>> at the time, so from the numbers below, it would only take 1ms max.
>>
>> So I think we are fine here. Next time, you find a large loop, please
>> provide an explanation why they are not security issues (e.g. cannot
>> be used by guests) or send an email to the Security Team in doubt.
> 
> Sure. In this case I took into account that only control domain can
> issue this call, I just didn't stated this explicitly. Next time will
> do.

I am afraid that's not correct. The guest can request to populate a 
region. This is used for instance in the ballooning case.

The main difference is a non-privileged guest will not be able to do 
allocation larger than 2MB.

[...]

>>> This is very interestingi too. Did you get any spikes with the
>>> period
>>> set to 100us? It would be fantastic if there were none.
>>>
>>>> 3. Huge latency spike during domain creation. I conducted some
>>>>      additional tests, including use of PV drivers, but this didn't
>>>>      affected the latency in my "real time" domain. But attempt to
>>>>      create another domain with relatively large memory size of 2GB led
>>>>      to huge spike in latency. Debugging led to this call path:
>>>>
>>>>      XENMEM_populate_physmap -> populate_physmap() ->
>>>>      alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>>>      "for ( i = 0; i < (1 << order); i++ )" loop.
>>
>> There are two for loops in alloc_heap_pages() using this syntax. Which
>> one are your referring to?
> 
> I did some tracing with Lautrebach. It pointed to the first loop and
> especially to flush_page_to_ram() call if I remember correctly.

Thanks, I am not entirely surprised because we are clean and 
invalidating the region line by line and across all the CPUs.

If we are assuming 128 bytes cacheline, we will need to issue 32 cache 
instructions per page. This going to involve quite a bit of traffic on 
the system.

One possibility would be to defer the cache flush when the domain is 
created and use the hypercall XEN_DOMCTL_cacheflush to issue the flush.

Note that XEN_DOMCTL_cacheflush would need some modification to be 
preemptible. But at least, it will work on a GFN which is easier to track.

>>>> I managed to overcome the issue #3 by commenting out all calls to
>>>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
>>>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
>>>> didn't experienced so big latency issues. Apparently all other
>>>> hypercalls which are used during domain creation are either fast or
>>>> preemptible. No doubts that my hack lead to page tables inflation and
>>>> overall performance drop.
>>> I think we need to follow this up and fix this. Maybe just by adding
>>> a hypercall continuation to the loop.
>>
>> When I read "hypercall continuation", I read we will return to the
>> guest context so it can process interrupts and potentially switch to
>> another task.
>>
>> This means that the guest could issue a second populate_physmap() from
>> the vCPU. Therefore any restart information should be part of the
>> hypercall parameters. So far, I don't see how this would be possible.
>>
>> Even if we overcome that part, this can be easily abuse by a guest as
>> the memory is not yet accounted to the domain. Imagine a guest that
>> never request the continuation of the populate_physmap(). So we would
>> need to block the vCPU until the allocation is finished.
> 
> Moreover, most of the alloc_heap_pages() sits under spinlock, so first
> step would be to split this function into smaller atomic parts.

Do you have any suggestion how to split it?

> 
>> I think the first step is we need to figure out which part of the
>> allocation is slow (see my question above). From there, we can figure
>> out if there is a way to reduce the impact.
> 
> I'll do more tracing and will return with more accurate numbers. 
> But as far as I can see, any loop on 262144 pages will take some time..
.

It really depends on the content of the loop. On any modern processors, 
you are very likely not going to notice a loop that update just a flag.

However, you are likely going to be see an impact if your loop is going 
to clean & invalidate the cache for each page.

Cheers,

-- 
Julien Grall

