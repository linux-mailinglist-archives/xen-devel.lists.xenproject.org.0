Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EF58469D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 21:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377070.610156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH9Na-00036X-99; Thu, 28 Jul 2022 19:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377070.610156; Thu, 28 Jul 2022 19:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH9Na-00034G-66; Thu, 28 Jul 2022 19:41:06 +0000
Received: by outflank-mailman (input) for mailman id 377070;
 Thu, 28 Jul 2022 19:41:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH9NY-00034A-Eq
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 19:41:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH9NY-0000Gc-3x; Thu, 28 Jul 2022 19:41:04 +0000
Received: from [54.239.6.189] (helo=[192.168.25.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH9NX-0003RB-Tc; Thu, 28 Jul 2022 19:41:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YWYNBbIOvApdZ6sjCCeZTSPgbgncP8nHDwNGQ/Ukemg=; b=c+2RWHZcMEvKCnwGx2SRZwJaDJ
	6NlPLhqe/rFIn6BJCYvG3lXm+IYQQDMkC+Q7e9oDS6SCo6tZpVNn7juX+G+zZpxXOUrxir+UQ64yq
	E0b5mnVwL8PMM3QkPiw6hUEuQtONLL4ZHEcxjyk4HAQkDWOo0nAMsFlzMlTc+q1KjB5A=;
Message-ID: <2444aee6-13b6-a208-d6ba-89c42b43315e@xen.org>
Date: Thu, 28 Jul 2022 20:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org>
 <a6610563-38b2-bb66-feab-df2ea29a9bb8@xen.org>
 <CAHUa44GLbbnxrKWQP2ZLGJO_rDUukdiO4_jOs8Ai55iLFh5YmQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44GLbbnxrKWQP2ZLGJO_rDUukdiO4_jOs8Ai55iLFh5YmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/07/2022 07:33, Jens Wiklander wrote:
> On Fri, Jul 8, 2022 at 9:54 PM Julien Grall <julien@xen.org> wrote:
>>> +    unsigned int n;
>>> +    unsigned int m;
>>> +    p2m_type_t t;
>>> +    uint64_t addr;
>>> +
>>> +    for ( n = 0; n < range_count; n++ )
>>> +    {
>>> +        for ( m = 0; m < range[n].page_count; m++ )
>>> +        {
>>> +            if ( pg_idx >= shm->page_count )
>>> +                return FFA_RET_INVALID_PARAMETERS;
>>
>> Shouldn't we call put_page() to drop the references taken by
>> get_page_from_gfn()?
> 
> Yes, and that's done by put_shm_pages(). One would normally expect
> get_shm_pages() to do this on error, but that's not needed here since
> we're always calling put_shm_pages() just before freeing the shm. I
> can change to let get_shm_pages() do the cleanup on error instead if
> you prefer that.

I am fine with the current approach. I would suggest to document it on 
top of get_shm_pages().

Also, if you expect put_shm_pages() to always be called before freeing 
shm, then I think it would be worth adding an helper that is doing the 
two. So the requirement is clearer.

[...]

>>
>> How do you guarantee that both Xen and the domain agree on the page size?
> 
> For now, I'll add a BUILD_BUG_ON() to check that the hypervisor page
> size is 4K  to simplify the initial implementation. We can update to
> support a larger minimal memory granule later on.

I am fine with that. FWIW, this is also what we did in the OP-TEE case.

>>> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
>>> +    {
>>> +        pa = page_to_maddr(shm->pages[n]);
>>> +        if ( last_pa + PAGE_SIZE == pa )
>>> +        {
>>
>> Coding style: We usually avoid {} for single line.
> 
> OK
> 
>>
>>> +            continue;
>>> +        }
>>> +        region_descr->address_range_count++;
>>> +    }
>>> +
>>> +    tot_len = sizeof(*descr) + sizeof(*mem_access_array) +
>>> +              sizeof(*region_descr) +
>>> +              region_descr->address_range_count * sizeof(*addr_range);
>>
>> How do you make sure that you will not write past the end of ffa_tx?
>>
>> I think it would be worth to consider adding an helper that would allow
>> you to allocate space in ffa_tx and zero it. This would return an error
>> if there is not enough space.
> 
> That's what I'm doing with frag_len. If the descriptor cannot fit it's
> divided into fragments that will fit.

Oh, so this is what the loop below is for, am I correct? If so, I would 
suggest to document a bit the code because this function is fairly 
confusing to understand.

[...]

>>> +    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
>>> +    {
>>> +        ret = FFA_RET_NOT_SUPPORTED;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    region_offs = read_atomic(&mem_access->region_offs);
>>> +    if ( sizeof(*region_descr) + region_offs > frag_len )
>>> +    {
>>> +        ret = FFA_RET_NOT_SUPPORTED;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    region_descr = (void *)((vaddr_t)ctx->tx + region_offs);
>>> +    range_count = read_atomic(&region_descr->address_range_count);
>>> +    page_count = read_atomic(&region_descr->total_page_count);
>>> +
>>> +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count)
>> This will allow a guest to allocate an arbitrarily large array in Xen.
>> So please sanitize page_count before using it.
> 
> This is tricky, what is a reasonable limit? 

Indeed. We need a limit that will prevent an untrusted domain to DoS Xen 
and at the same doesn't prevent the majority of well-behave domain to 
function.

How is this call going to be used?

> If we do set a limit the
> guest can still share many separate memory ranges.

This would also need to be limited if there is a desire to support 
untrusted domain.

[...]

>>> +    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
>>> +                        0, &last_page_idx);
>>> +    if ( ret )
>>> +        goto out;
>>> +    if ( last_page_idx != shm->page_count )
>>> +    {
>>> +        ret = FFA_RET_INVALID_PARAMETERS;
>>> +        goto out;
>>> +    }
>>> +
>>> +    /* Note that share_shm() uses our tx buffer */
>>> +    spin_lock(&ffa_buffer_lock);
>>> +    ret = share_shm(shm);
>>> +    spin_unlock(&ffa_buffer_lock);
>>> +    if ( ret )
>>> +        goto out;
>>> +
>>> +    spin_lock(&ffa_mem_list_lock);
>>> +    list_add_tail(&shm->list, &ffa_mem_list);
>>
>> A couple of questions:
>>     - What is the maximum size of the list?
> 
> Currently, there is no limit. I'm not sure what is a reasonable limit
> more than five for sure, but depending on the use case more than 100
> might be excessive.
This is fine to be excessive so long it doesn't allow a guest to drive 
Xen out of memory or allow long running operations.

As I wrote above, the idea is we need limits that protect Xen but at the 
same time doesn't prevent the majority well-behave guest to function.

As this is a tech preview, the limits can be low. We can raise the 
limits as we get a better understanding how this will be used.

Cheers,

-- 
Julien Grall

