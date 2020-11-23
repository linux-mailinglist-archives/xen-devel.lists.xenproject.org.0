Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA12C195E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 00:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35258.66694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLBi-000671-4y; Mon, 23 Nov 2020 23:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35258.66694; Mon, 23 Nov 2020 23:24:02 +0000
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
	id 1khLBi-00066c-1c; Mon, 23 Nov 2020 23:24:02 +0000
Received: by outflank-mailman (input) for mailman id 35258;
 Mon, 23 Nov 2020 23:24:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khLBh-00066X-5Q
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 23:24:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khLBf-0005HI-NX; Mon, 23 Nov 2020 23:23:59 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khLBf-0008Fz-DU; Mon, 23 Nov 2020 23:23:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khLBh-00066X-5Q
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 23:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qfsA+1qWKMzMEUrAFmz6oH4DoGmUhg+nVT9wBBuQga8=; b=B8n3TbqfUSI0qJRel7k4ozlAuX
	qe0JhidJEktDCkmf1zxmwesiGasfYrTkEuoiM6QjQH1SiH0uQ+WO/hlEutyOnTtmCcr6E9c5syII5
	pIZYDxkLPG30cRPKbZxj5VqBr+akOhELcbaRWSWscg9d+5UlKk2okh+VyVklSadY7w0o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khLBf-0005HI-NX; Mon, 23 Nov 2020 23:23:59 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khLBf-0008Fz-DU; Mon, 23 Nov 2020 23:23:59 +0000
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
 <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
 <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
 <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org>
Date: Mon, 23 Nov 2020 23:23:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/11/2020 22:27, Stefano Stabellini wrote:
> On Fri, 20 Nov 2020, Julien Grall wrote:
>>>>        /*
>>>>         * For arm32, page-tables are different on each CPUs. Yet, they
>>>> share
>>>> @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
>>>>          spin_lock(&xen_pt_lock);
>>>>    -    for ( ; addr < addr_end; addr += PAGE_SIZE )
>>>> +    while ( left )
>>>>        {
>>>> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
>>>> +        unsigned int order;
>>>> +        unsigned long mask;
>>>> +
>>>> +        /*
>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>> +         *
>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>> +         * superpage size.
>>>
>>> It would be good to add another sentence to explain that the checks
>>> below are simply based on masks and rely on the mfn, vfn, and also
>>> nr_mfn to be superpage aligned. (It took me some time to figure it out.)
>>
>> I am not sure to understand what you wrote here. Could you suggest a sentence?
> 
> Something like the following:
> 
> /*
>   * Don't take into account the MFN when removing mapping (i.e
>   * MFN_INVALID) to calculate the correct target order.
>   *
>   * This loop relies on mfn, vfn, and nr_mfn, to be all superpage
>   * aligned, and it uses `mask' to check for that.

Unfortunately, I am still not sure to understand this comment.
The loop can deal with any (super)page size (4KB, 2MB, 1GB). There are 
no assumption on any alignment for mfn, vfn and nr_mfn.

By OR-ing the 3 components together, we can use it to find out the 
maximum size that can be used for the mapping.

So can you clarify what you mean?

>   *
>   * XXX: Support superpage mappings if nr_mfn is not aligned to a
>   * superpage size.
>   */
> 
> 
>> Regarding the TODO itself, we have the exact same one in the P2M code. I
>> couldn't find a clever way to deal with it yet. Any idea how this could be
>> solved?
>   
> I was thinking of a loop that start with the highest possible superpage
> size that virt and mfn are aligned to, and also smaller or equal to
> nr_mfn. So rather than using the mask to also make sure nr_mfns is
> aligned, I would only use the mask to check that mfn and virt are
> aligned. Then, we only need to check that superpage_size <= left.
> 
> Concrete example: virt and mfn are 2MB aligned, nr_mfn is 5MB / 1280 4K
> pages. We allocate 2MB superpages until onlt 1MB is left. At that point
> superpage_size <= left fails and we go down to 4K allocations.
> 
> Would that work?

Unfortunately no, AFAICT, your assumption is that vfn/mfn are originally 
aligned to higest possible superpage size. There are situation where 
this is not the case.

To give a concrete example, at the moment the RAM is mapped using 1GB 
superpage in Xen. But in the future, we will only want to map RAM 
regions in the directmap that haven't been marked as reserved [1].

Those reserved regions don't have architectural alignment or placement.

I will use an over-exegerated example (or maybe not :)).

Imagine you have 4GB of RAM starting at 0. The HW/Software engineer 
decided to place a 2MB reserved region start at 512MB.

As a result we would want to map two RAM regions:
    1) 0 to 512MB
    2) 514MB to 4GB

I will only focus on 2). In the ideal situation, we would want to map
    a) 514MB to 1GB using 2MB superpage
    b) 1GB to 4GB using 1GB superpage

We don't want be to use 2MB superpage because this will increase TLB 
pressure (we want to avoid Xen using too much TLB entries) and also 
increase the size of the page-tables.

Therefore, we want to select the best size for each iteration. For now, 
the only solution I can come up with is to OR vfn/mfn and then use a 
series of check to compare the mask and nr_mfn.

In addition to the "classic" mappings (i.e. 4KB, 2MB, 1GB). I would like 
to explore contiguous mapping (e.g. 64KB, 32MB) to further reduce the 
TLBs pressure. Note that a processor may or may not take advantage of 
contiguous mapping to reduce the number of TLBs used.

This will unfortunately increase the numbers of check. I will try to 
come up with a patch and we can discuss from there.

Cheers,

[1] Reserved region may be marked as uncacheable and therefore we 
shouldn't map them in Xen address space to avoid break cache coherency.

-- 
Julien Grall

