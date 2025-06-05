Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8BFACF19D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006931.1386192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBR9-0001ZY-Vy; Thu, 05 Jun 2025 14:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006931.1386192; Thu, 05 Jun 2025 14:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBR9-0001XJ-TG; Thu, 05 Jun 2025 14:19:19 +0000
Received: by outflank-mailman (input) for mailman id 1006931;
 Thu, 05 Jun 2025 14:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNBR7-0001Wx-Og
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:19:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ffdc22c-4218-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:19:16 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60461fc88d7so2011159a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:19:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82d75bsm1270928466b.56.2025.06.05.07.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:19:15 -0700 (PDT)
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
X-Inumbo-ID: 0ffdc22c-4218-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749133156; x=1749737956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rBsXLH+5x3o6U0TQhEf+zYxaUMXg/2xL2PPFdOR1Y9U=;
        b=dR15qdgIX7onL9rnT4WbvBhjaQncbDV43u3W4TqRA1PO960ID2pDgC+geexhWvbVNa
         DFaySsZ/F9M9Jr81MOypMgaj6brEaCRJnKpWWPVhk3Zhnql944RSmpAyONrZjudEy2gM
         aic56wT9+3xp+96mWAOBmF5J1gksWVnnQjPCYfB0I9UsKUGl2Q5GHvUTdmcqesfnuzjx
         5+cEbMOa95zjbrIpp4ISPrAkxVLJhGsuZRv8wp7HHiGS71fCNXxwIdoYnjcdQwSMV+MS
         EX093KDGOK8MKFL9GF/+uGn/mxkoajrsdbUNQUSoS11pjgIjr+6zVMCd0fMWH3pHHMyA
         RjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133156; x=1749737956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBsXLH+5x3o6U0TQhEf+zYxaUMXg/2xL2PPFdOR1Y9U=;
        b=aVBHQA/4zF5/d4xEabo62LB83sc8cdCLMTprztTFDut5znl+BZNgncn9wk8I6iAvLe
         rtDzwI0vW70Z01V8ULF6FRfkaemH/c38bLCXxCqH6s/d25VAICXPvdIm4X8aSIS68xjI
         3mbiBKoA8vjW2pEF3MkIVgnxx+ZV5SSK86EDhFoDxsY6+WOSivfQs7imQ1jPBhHiKKWv
         Abnx9Tfhxb/qCeHpHD3MNl+bjhAqsJ1284evz1Kv1K5vt3AtoD2sjCEXihemyBwi4id3
         vx9Rr6BEDPSUxEIZBui1qX+yOT1mk5+Lct89gNPav5sAb4+TCEu8LC62ihOfxOQlUTkV
         OirA==
X-Forwarded-Encrypted: i=1; AJvYcCVlDPOy4ZNs7eU4MBgT1XhvhxBDoH02OCVP96/bfZT1tiXKH8AkYftwtcOnw7eFC2UlziHwjZuHyZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtYCbFmLN+DhV28U3L7HPt++LN8rCGE6M4+Tljjmrsmx8R1QrJ
	HQ71xsUDT1rVdcVWwlMFCgtYz4MO39Web5ZbyWWeIMm+64g1i+mtpZ58NYMxEImOoQ==
X-Gm-Gg: ASbGncvSAc/9OAwwClWhyfhBbaMLI8E04RNMUAuBA6QWwNMvOIlrq1WMssFgvvJXtLl
	OI6xBWvNNplwDOt5Kt8QwOyqDYo0srMAF2sBaiRFTPL2n1Ant428CnRDOgzsobanWcit2yd7lPk
	KJX3s3wpj6+1PWU3OEh5kZz4JlWdKOOt4mAJoJ7AT+LHtQsu6ELhtOYtsTVo4RjMI9fx8ieIGA4
	BJPaWz6gAUFnE1IyccYWzNZYEbXOMb08x/ziIvB+CN4SH8svI9OaAIsPj11fqMsMSuI/q2EJTCo
	hD8JM/EWWcjnKTZ3ZhZF/Atxvc//UwkKbrKFG+nIqmWnLCd7ptDx1DFCX1YiGdkWybrj2vwavV0
	jE84gMVFapUFa1uHR2/0v1IRUqOtv/8qAPLu9nn2aYpbLAf4=
X-Google-Smtp-Source: AGHT+IEB3xsj7VvRIyLNXs3qZ2sTZSe7gjgv3W7r/WH5Wt68voCsNpsc0FYQLL6DfaR5/7imeQfung==
X-Received: by 2002:a17:906:6a16:b0:ad5:72d4:85ee with SMTP id a640c23a62f3a-addf8fb22e8mr681591766b.53.1749133155699;
        Thu, 05 Jun 2025 07:19:15 -0700 (PDT)
Message-ID: <c06d8833-dafb-430e-a9d5-f9baedecea40@suse.com>
Date: Thu, 5 Jun 2025 16:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
 <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
 <ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com>
 <b9ea4b4c-c21d-4414-8c37-9447821ece8d@gmail.com>
 <0175c281-b669-4412-971a-545e29077b34@suse.com>
 <a91e8f71-5793-4c27-92fe-a4c1707ea6dc@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a91e8f71-5793-4c27-92fe-a4c1707ea6dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 16:10, Oleksii Kurochko wrote:
> 
> On 6/2/25 1:04 PM, Jan Beulich wrote:
>> On 23.05.2025 11:44, Oleksii Kurochko wrote:
>>> On 5/22/25 6:09 PM, Jan Beulich wrote:
>>>> On 22.05.2025 17:53, Oleksii Kurochko wrote:
>>>>> On 5/20/25 3:37 PM, Jan Beulich wrote:
>>>>>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>>>>>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>>>>>>> +{
>>>>>>> +    struct page_info *page;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>>>>>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>>>>>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>>>>>> +     * and must be aligned to a 16-KiB boundary.
>>>>>>> +     */
>>>>>>> +    page = alloc_domheap_pages(NULL, 2, 0);
>>>>>> Shouldn't this allocation come from the domain's P2M pool (which is yet
>>>>>> to be introduced)?
>>>>> First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
>>>>> table allocation.
>>>>>
>>>>> p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
>>>>> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].
>>>>>
>>>>> When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
>>>>> is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
>>>>> using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
>>>>> so domain should be created first.
>>>> Yet that is part of my point: This allocation should be against the domain,
>>>> so it is properly accounted. What's the problem with allocating the root
>>>> table when the pools is being created / filled?
>>> I can't use pages from pool for root table as they aren't properly aligned.
>>>
>>> At the moment, creation of p2m pool looks like:
>>>    int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>    {
>>>        struct page_info *pg;
>>>
>>>        ASSERT(spin_is_locked(&d->arch.paging.lock));
>>>
>>>        for ( ; ; )
>>>        {
>>>            if ( d->arch.paging.p2m_total_pages < pages )
>>>            {
>>>                /* Need to allocate more memory from domheap */
>>>                pg = alloc_domheap_page(d, MEMF_no_owner);
>>>                if ( pg == NULL )
>>>                {
>>>                    printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>>                    return -ENOMEM;
>>>                }
>>>                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>>                    d->arch.paging.p2m_total_pages + 1;
>>>                page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>>            }
>>>            ...
>>>        }
>>>
>>>        return 0;
>>>    }
>>> alloc_domheap_page(d, MEMF_no_owner) allocates page table with order 0, so 4k-aligned page table.
>>> But if I needed 16k for root table and it should be 16k-aligned then I still have to use
>>> alloc_domheap_pages(NULL, 2, 0);
>>>
>>> Or do you mean that I have to something like:
>>>    int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>    {
>>>        struct page_info *pg;
>>>    
>>>        ASSERT(spin_is_locked(&d->arch.paging.lock));
>>>    
>>> +    if ( !d->arch.p2m.root )
>>> +    {
>>> +        unsigned int order = get_order_from_bytes(KB(16));
>>> +        unsigned int nr_pages = _AC(1,U) << order;
>>> +        /*
>>> +        * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>> +        * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>> +        * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>> +        * and must be aligned to a 16-KiB boundary.
>>> +        */
>>> +        d->arch.p2m.root = alloc_domheap_pages(d, order, MEMF_no_owner);
>>> +        if ( d->arch.p2m.root == NULL )
>>> +            panic("root page table hasn't been allocated\n");
>>> +
>>> +        clear_and_clean_page(d->arch.p2m.root);
>>> +
>>> +        /* TODO: do I need TLB flush here? */
>>> +
>>> +        ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>> +            d->arch.paging.p2m_total_pages + nr_pages;
>>> +    }
>>> +
>>> ...
>>> }
>> Neither. I was thinking of you taking 4 pages off the pool in exchange for the
>> order-2 allocation. Primarily to get the memory accounting right (or at least
>> closer to reality).
> 
> Do you mean that I have to call 4 times page_list_remove_head(), something like
> that:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -215,6 +215,44 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>           }
>       }
>   
> +    if ( !d->arch.p2m.root )
> +    {
> +        unsigned int order = get_order_from_bytes(KB(16));
> +        unsigned int nr_pages = _AC(1,U) << order;
> +
> +        if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
> +            panic("Specify more xen,domain-p2m-mem-mb\n");
> +
> +        /*
> +         * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +         * As explained in Section 18.5.1, for the paged virtual-memory schemes
> +         * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
> +         * and must be aligned to a 16-KiB boundary.
> +         */
> +        d->arch.p2m.root = alloc_domheap_pages(NULL, order, 0);

Imo you'd better not use NULL here, but instead pass MEMF_no_owner. See
respective x86 code. I also think you want to do the freeing first, and
only then do this allocation, such that ...

> +        if (  d->arch.p2m.root == NULL )
> +            panic("failed to allocate p2m root page table\n");
> +
> +        for ( unsigned int i = 0; i < nr_pages; i++ )
> +        {
> +            clear_and_clean_page(d->arch.p2m.root + i);
> +
> +            /* Return memory to domheap */
> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> +            if( pg )
> +            {
> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
> +                free_domheap_page(pg);
> +            }
> +            else
> +            {
> +                printk(XENLOG_ERR
> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
> +                return -ENOMEM;

... this path will not have eaten more memory than was given back.

>>>>>>> +static int p2m_alloc_table(struct domain *d)
>>>>>>> +{
>>>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>>>> +
>>>>>>> +    p2m->root = p2m_allocate_root(d);
>>>>>>> +    if ( !p2m->root )
>>>>>>> +        return -ENOMEM;
>>>>>>> +
>>>>>>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>>>>>>> +     * before using it.
>>>>>>> +     */
>>>>>>> +    p2m_write_lock(p2m);
>>>>>>> +    p2m_force_tlb_flush_sync(p2m);
>>>>>>> +    p2m_write_unlock(p2m);
>>>>>> While Andrew directed you towards a better model in general, it won't be
>>>>>> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
>>>>>> want to do a single global flush e.g. when VMIDs wrap around. That'll be
>>>>>> fewer global flushes than one per VM creation.
>>>>> I am not sure that I get a phrase 'VMIDs wrap around'.
>>>> You have to allocate them somehow. Typically you'll use the next one available.
>>>> At some point you will need to start over, searching from the beginning. Prior
>>>> to that now allocation of a new one will require any flush, as none of them
>>>> had be in use before (after boot or the last such flush).
>>> Thanks. Now I get your point.
>>>
>>> Won't be better to do TLB flushing during destroying of a domain so then we will
>>> be sure that TLBs connected to freed VMID aren't present in TLB anymore?
>> That's an option, but will result in more flushes. Furthermore there may be
>> reasons to change the VMID for a domain while it's running.
>>
>>> IIUC, it will work only if VMID is used, right?
>> Well, anything VMID related is of course only relevant when VMIDs are in use.
>>
>>> In case if VMID isn't used, probably we can drop flushing here and do a flush
>>> during booting, right?
>> That'll be too little flushing?
> 
> I meant that instead of having TLB flush in p2m_alloc_table() we could have a one flush
> during booting. And of course, we still should have flush on each context switch.

Yet as said - context switches are likely too frequent for having an
unconditional flush there (if it can be avoided).

>>> Won't be enough to flushing of guest TLB only during context switch?
>> "only" is interesting here. Context switches are a relatively frequent
>> operation, which in addition you want to be fast. If a flush is necessary
>> there for correctness (e.g. when VMIDs aren't in use), you have to do it
>> there. But if you can flush less frequently without violating correctness,
>> you'd almost always want to use such an opportunity.
> 
> Then it is better to introduce VMID now, it seems it's only one place where
> it should be set, when hgatp is initialized.
> 
> Does Xen have some framework to work with VMID?

That's all arch-specific, I think.

>>>>> I am going to implement, p2m_force_tlb_flush_sync() as:
>>>>>     static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>>>>     {
>>>>>       ...
>>>>>         sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>>>>>       ...
>>>>>     }
>>>>>
>>>>> With such implementation if the guest didn't run on any pCPU(s) yet
>>>>> then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
>>>>> as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
>>>>> I am not sure that it is a good idea as I can't find a guarantee in the spec
>>>>> that TLB will be empty during boot time.
>>>> If in doubt, do one global flush while booting.
>>> By booting you mean somewhere in continue_new_vcpu()?
>> I don't particularly mean any specific place. However, continue_new_vcpu()
>> (by its name) isn't involved in bringing up Xen, is it?
>>
> No, it isn't. By booting here I meant a boot of a guest domain, not Xen itself.

Please don't call this "booting", but "starting of a guest" (or "launching" or
some such). When you originally said "booting" I thought RISC-V wouldn't
guarantee clean TLBs when being booted, and hence suggested to cover for this
by doing a single flush during (Xen) boot. Looks like this may not be needed
then, simply because of the misunderstanding.

Jan

