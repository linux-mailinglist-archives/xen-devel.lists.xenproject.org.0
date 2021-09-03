Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A13FFB39
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 09:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177808.323512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM3pU-0007Tc-8y; Fri, 03 Sep 2021 07:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177808.323512; Fri, 03 Sep 2021 07:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM3pU-0007Qc-4M; Fri, 03 Sep 2021 07:41:40 +0000
Received: by outflank-mailman (input) for mailman id 177808;
 Fri, 03 Sep 2021 07:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mM3pS-0007QW-E1
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 07:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mM3pS-00075t-6C; Fri, 03 Sep 2021 07:41:38 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mM3pR-0002on-VM; Fri, 03 Sep 2021 07:41:38 +0000
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
	bh=ksqcf2jF0XIRZewBEItfZVaqUXtATCiTEIw7T76+bxM=; b=0225mFHrUzVqNYOkqlRquTHDE1
	Y62bkr4fGbW14yd6FQuHGaeGaNIRet0v/pY5CEX8dq9CPNLHEo4sBMfKfd5P0OyR/mvFVOjcHm47D
	nLNEDXwNhDKyuiwBcpoPRjGZtPE4rN7Q/UQvzoAuq//LAKqxXEhxMwqjmCLlvEj3hXUw=;
Subject: Re: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-8-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
 <ac3a9fbd-7598-e400-6c6c-1214df7acee7@xen.org>
 <alpine.DEB.2.21.2109021527330.26072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <034628a6-5461-f4a9-3339-a0d6f3d68f80@xen.org>
Date: Fri, 3 Sep 2021 08:41:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109021527330.26072@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 03/09/2021 01:39, Stefano Stabellini wrote:
> On Thu, 2 Sep 2021, Julien Grall wrote:
>>>> +    kinfo->mem.nr_banks = ++gbank;
>>>> +    kinfo->unassigned_mem -= tot_size;
>>>> +    if ( kinfo->unassigned_mem )
>>>> +    {
>>>> +        printk(XENLOG_ERR
>>>> +               "Size of \"memory\" property doesn't match up with the
>>>> sum-up of \"xen,static-mem\".\n");
>>>> +        goto fail;
>>>
>>> Do we need to make this a fatal failure?
>>>
>>> I am asking because unassigned_mem comes from the "memory" property of
>>> the domain in device tree which is kind of redundant with the
>>> introduction of xen,static-mem. In fact, I think it would be better to
>>> clarify the role of "memory" when "xen,static-mem" is also present.
>>> In that case, we could even make "memory" optional.
>>
>> I requested to make it mandatory. Imagine you have a domU that has 1GB and now
>> you want to switch to static memory. If we make the property optional, then
>> there is a risk for the admin to not correctly pass the amount of memory. This
>> may become unnoticed until late.
>>
>> So I think making it mandatory is cheap for us and an easy way to confirm you
>> properly sized the region. It also has the benefits to easily find out how
>> much memory you gave to the guest (but that's just because I am lazy :)).
>>
>>> In any case, even if we don't make "memory" optional, it might still be
>>> good to turn this error into a warning and ignore the remaining
>>> kinfo->unassigned_mem.
>>
>> The behavior is matching the existing function and I think this is a good
>> idea. If you ask 10MB of memory and we only give you 9MB, then at some point
>> your guest is not going to be happy.
>>
>> It is much better to know it in advance with a failure over discovering hours
>> later when you see an OOM from your domain.
> 
> OK, I didn't realize this was discussed already. Let's not revisit this
> then.
> 
> My preference is primarily to make the device tree easier to write, but
> nowadays nobody I know is writing the device tree by hand anymore (they
> all use ImageBuilder).So if the device tree is generated then we are
> fine either way as long as the binding is clear. So I am OK to drop my
> suggestion of making "memory" optional. Let's think of a way to make
> "memory" and "xen,static-mem" coexist instead.
> 
> 
> There are two sides of the issue:
> - the Xen implementation
> - the binding
> 
> 
> The Xen implementation is fine to panic if memory != xen,static-mem. In
> that regard, the current patch is OK.
> 
> 
>  From the binding perspective, I think it would be good to add a
> statement to clarify. The binding doesn't necessarily need to match
> exactly the implementation as the binding should be as future proof
> and as flexible as possible.

So I agree that the binding doesn't have to match the implementation. 
But... the binding always have be more restrictive than the 
implementation. Otherwise, someone following the binding may be not able 
to use it with Xen.

> 
>  From the binding perspective two properties should mean different
> things: memory the total memory amount and xen,static-mem the static
> memory. If one day we'll have more types of memory, memory will cover
> the total amount while xen,static-mem will cover a subset. So memory
> must be greater or equal to xen,static-mem (even if today Xen only
> supports memory == xen,static-mem).
> 
> So I would add:
> 
> """
> As the memory property represents the total memory of the domain, hence
> the amount of memory selected by the memory property must be greater or
> equal to the total amount specified by xen,static-mem. Other
> configurations (memory amount less than xen,static-mem amount) are
> invalid.
> """
> 
> This sentence has the purpose of clarifying that "memory" still need to
> be populated and have a valid value. Then, it is OK for Xen to error
> out if memory doesn't match xen,static-mem because that's the only
> configuration supported. 
How about writing something like "The property 'memory' should match the 
amount of memory given to the guest. Currently, it is only possible to 
either allocate static memory or let Xen chose. *Mixing* is not supported'.

Then if we add the mixing, we could say 'From Xen XX.YY, mixing will be 
allowed'.

Cheers,

-- 
Julien Grall

