Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBF4652AE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236123.409557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSN8-0000w8-P3; Wed, 01 Dec 2021 16:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236123.409557; Wed, 01 Dec 2021 16:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSN8-0000sh-M0; Wed, 01 Dec 2021 16:22:18 +0000
Received: by outflank-mailman (input) for mailman id 236123;
 Wed, 01 Dec 2021 16:22:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msSN7-0000sb-3z
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:22:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSN5-00083m-LC; Wed, 01 Dec 2021 16:22:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSN5-0000lp-CL; Wed, 01 Dec 2021 16:22:15 +0000
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
	bh=VFQVubdJcVarI3a8Jxa2tWhAoVXZdOKbQMmcgnIGP6Y=; b=HbQD5w7wbwQLa+L6A1cQobtx8x
	kusB9h952dE6O6mLNdn+pnMZHU2dkqSWBdLHZXgPX6KEQbxiMoydHT1aFFavIjGkE0K36aZrv1P3m
	ian8XfCKP09Syfc7XZp69SJAiaM4PnYIkx3i2sQNL1UopjBdIb8hosPrBzKwFZiSUPu8=;
Message-ID: <a5aa0a6a-3765-9395-026f-3bfd88bba354@xen.org>
Date: Wed, 1 Dec 2021 16:22:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <863c9a06-f0af-eac1-fb04-e059e4ce0a09@xen.org>
 <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
 <15a507c7-17e3-6e48-152d-32f54b362889@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15a507c7-17e3-6e48-152d-32f54b362889@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/11/2021 15:58, Oleksandr wrote:
> 
> Hi Julien

Hi,

> 
> 
> [snip]
> 
> 
>>
>>>>
>>>> ! Please note, there is still unresolved locking question here for 
>>>> which
>>>> I failed to find a suitable solution. So, it is still an RFC !
>>>>
>>>> According to the internal conversation:
>>>> Now the GFN field in the struct page_info is accessed from
>>>> gnttab_set_frame_gfn() in the grant table code and from 
>>>> page_set_frame_gfn()
>>>> in the P2M code (the former uses the latter).
>>>>
>>>> We need to prevent the concurrent access to this field. But, we 
>>>> cannot grab
>>>> the grant lock from the P2M code because we will introduce a lock 
>>>> inversion.
>>>> The page_set_frame_gfn() will be called from the P2M code with the 
>>>> p2m lock held
>>>> and then acquire the grant table lock. The gnttab_map_frame() will 
>>>> do the inverse.
>>>
>>> This is a tricky one. I think, we will:
>>>
>>>   1) Need to use the P2M lock to protect the access to the GFN in the 
>>> struct page_info *.
>>>   2) Defer the call to page_set_frame_gfn() from gnttab_map_frame() 
>>> to xenmem_add_to_physmap_one()
>>>   3) In xenmem_add_to_physmap_one() hold the P2M lock while checking 
>>> the page was not already mapped (e.g. page_get_frame_gfn() == 
>>> INVALID_GFN) and do the mapping. Call page_set_frame_gfn() on success.
>>>
>>> This would still allow the guest to shot itself in the foot (e.g. 
>>> potentially removing the wrong mapping) if it tries concurrent 
>>> hypercall but I believe we would not introduce issue like XSA-380.
>>>
>>> At the end this would look quite similar to how x86 deal with the M2P 
>>> update.
>>
>> Thank you for the suggestion, I need to analyze the code to better 
>> understand your idea and technical possibility to implement it, I will 
>> come up with questions if any.
> 
> I experimented a bit... Could you please clarify, is the code snippet 
> below is close to what you meant?

It is close to what I had in my mind. A few comments below.

> 
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b594db4..dba9258 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1488,8 +1488,27 @@ int xenmem_add_to_physmap_one(
>           return -ENOSYS;
>       }
> 
> -    /* Map at new location. */
> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    if ( space != XENMAPSPACE_grant_table )

I would consider to use this approach for any xenheap pages.

> +        /* Map at new location. */
> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> +    else
> +    {
> +#ifdef CONFIG_GRANT_TABLE
> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        p2m_write_lock(p2m);
> +        if ( gfn_eq(page_get_frame_gfn(page), INVALID_GFN) )

I think we want to return an error if page_get_frame_gfn() return a 
valid GFN.

> +        {
> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
> +            if ( !rc )
> +                page_set_frame_gfn(page, gfn);
> +        }
> +        p2m_write_unlock(p2m);
> +#else
> +        ASSERT_UNREACHABLE();
> +        rc = -EINVAL;
> +#endif
> +    }
> 
>       /*
>        * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, 
> we need
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 59604b1..64e9e77 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4167,10 +4167,8 @@ int gnttab_map_frame(struct domain *d, unsigned 
> long idx, gfn_t gfn, mfn_t *mfn)
>            * Make sure gnttab_unpopulate_status_frames() won't 
> (successfully)
>            * free the page until our caller has completed its operation.
>            */
> -        if ( get_page(mfn_to_page(*mfn), d) )
> -            gnttab_set_frame_gfn(gt, status, idx, gfn);
> -        else
> -            rc = -EBUSY;
> +        if ( !get_page(mfn_to_page(*mfn), d) )
> +           rc = -EBUSY;
>       }
> 
>       grant_write_unlock(gt);
> (END)
> 
> If yes *and* I correctly understand the code, then looks like 
> gnttab_set_frame_gfn becomes useless on Arm and can be dropped globally 
> (x86's variant is already dummy).

It will not be a dummy version soon see [1].

Cheers,

[1] 
https://lore.kernel.org/xen-devel/8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com/

-- 
Julien Grall

