Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDACACACEE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003186.1382678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2xU-0007J1-Oz; Mon, 02 Jun 2025 11:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003186.1382678; Mon, 02 Jun 2025 11:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2xU-0007Gk-MO; Mon, 02 Jun 2025 11:04:00 +0000
Received: by outflank-mailman (input) for mailman id 1003186;
 Mon, 02 Jun 2025 11:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM2xT-0007Ge-Hc
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:03:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a45dca-3fa1-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:03:57 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so2864822f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 04:03:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bca137sm68383265ad.10.2025.06.02.04.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 04:03:56 -0700 (PDT)
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
X-Inumbo-ID: 47a45dca-3fa1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748862237; x=1749467037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HDubWYuEbvHQGmWWRtEXtgiOSnw2p0RAjEzB0Z6Oe+s=;
        b=QYBoyXPa3v2te2H6VNkly9UIu9MjHmEZDL/uLK7U2XX9cCdEODtWearxiydRmGhQfx
         4pigMfDcp0A4hsnsFGMtBE6d1B2rCYqB4o40Cte5bYEVk7cOmrEg18Iepo9IEOKKAZjm
         umhzV9MYUG1CeMkF2BE1JblAv5LJYEX8NJwYaF9eV9DNlbtmG4afCjFyZL8drSAkoopI
         ZEFcfJ2ZoDUM72Ukgm/CSkQJW/4DJT1KRY2bc9sIO9d+WecinNGJIraJGLuCuUlj0Gnw
         BmzGy6L/ULvrB57Wl88Dg5EhmQteeWOlqp1an7YOxcwklO3xqUxBHqTuUZv2u/MgB1M/
         gGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862237; x=1749467037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDubWYuEbvHQGmWWRtEXtgiOSnw2p0RAjEzB0Z6Oe+s=;
        b=Omwbd+fO+tpZ+wq/VxtjM8ZpexFJEWuDyVqeUD9bzsT3lzSoScaIJSaldg33+u6PD9
         mYvkzlXlk/z3eYazmglLOc+TLCsdPh7YFxCoMt0A27EgLJpxMaOpAuvHh0VIi+76LsNe
         c/kRSJtRN4tseaKW/L7auaR+fAoSH24v2bk2vAieMSkjd6diDMcDN2RQv9W+ALEmMAP6
         oNGGwh4DALvZozsCAEHiOJXrZ3n3WqU5ENOU71A0XUeSHawGYzAba+Ti7HmNP/NkDncm
         WYIdjaJcud4n2KynsceXbqB2ExJRYH9v8+WHRi+L6u0Oul3BDNXjTIKJn7WPKgBm4+YI
         +zoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgE68KFU3elUlm06wLg4yyCDZ6zJANEDR61OFhn+7q0NjXDo0uEywLKLlGqQwhV7tRJFxwwjPQ1DA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcxtPq4jI4LFFabxQjk52teNj03cPZua2zZVoiUXcmvNisZMmA
	sldlfd5w/rJXfTFpJb4vMB8SAnTpBuaKm8/yuNvF8B2IEDGc9eADsj1UJI4tY5Lcqw==
X-Gm-Gg: ASbGncuSVkvY8WsQd0KGxcuxwZf6U1br3e+Y52RaZy4L6vUdWgMrVAds5nZZIczA0zU
	HBq/CrsBPCXWRdn8zFuVHYShZREcE3fISpg3RJdoMP/iUGw2c6XEZzJETIA0h+K/diuuH45lzod
	wdQqi2MxhZgezy0YQLhwgYWhNa/es+JYfLp5xOEVcIli/2U4hlVkeZWfmiqRC+wr1+S1C1m9W3c
	qgR89g3xla4IssNCAyQ/GQsGO5BOp6RWrsNHkO3sAz7JQ8SyJEN5WmtmifdTopcEHTUy+Q9Xmoc
	QFvFyL/2OCGdOOzoLRSbQ1kbwpxpHttllKzqpYZFQVLY6d8yaWEL/czvV6+AfiYrLcdEs+J3nIt
	ZWhMNMq4CUXmZjXF0b39/kwUoQl+nLS8wWQNp
X-Google-Smtp-Source: AGHT+IHySj4/9gbl3tz1V30XW8H3qyLttno/0cmcwn26JHWmui6AzsEBIlr5QJv/RpuivyzivOrtrQ==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3a4f89a7e71mr9734639f8f.2.1748862236622;
        Mon, 02 Jun 2025 04:03:56 -0700 (PDT)
Message-ID: <0175c281-b669-4412-971a-545e29077b34@suse.com>
Date: Mon, 2 Jun 2025 13:04:00 +0200
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
In-Reply-To: <b9ea4b4c-c21d-4414-8c37-9447821ece8d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2025 11:44, Oleksii Kurochko wrote:
> On 5/22/25 6:09 PM, Jan Beulich wrote:
>> On 22.05.2025 17:53, Oleksii Kurochko wrote:
>>> On 5/20/25 3:37 PM, Jan Beulich wrote:
>>>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>>>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>>>>> +{
>>>>> +    struct page_info *page;
>>>>> +
>>>>> +    /*
>>>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>>>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>>>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>>>> +     * and must be aligned to a 16-KiB boundary.
>>>>> +     */
>>>>> +    page = alloc_domheap_pages(NULL, 2, 0);
>>>> Shouldn't this allocation come from the domain's P2M pool (which is yet
>>>> to be introduced)?
>>> First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
>>> table allocation.
>>>
>>> p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
>>> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].
>>>
>>> When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
>>> is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
>>> using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
>>> so domain should be created first.
>> Yet that is part of my point: This allocation should be against the domain,
>> so it is properly accounted. What's the problem with allocating the root
>> table when the pools is being created / filled?
> 
> I can't use pages from pool for root table as they aren't properly aligned.
> 
> At the moment, creation of p2m pool looks like:
>   int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>   {
>       struct page_info *pg;
> 
>       ASSERT(spin_is_locked(&d->arch.paging.lock));
> 
>       for ( ; ; )
>       {
>           if ( d->arch.paging.p2m_total_pages < pages )
>           {
>               /* Need to allocate more memory from domheap */
>               pg = alloc_domheap_page(d, MEMF_no_owner);
>               if ( pg == NULL )
>               {
>                   printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>                   return -ENOMEM;
>               }
>               ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>                   d->arch.paging.p2m_total_pages + 1;
>               page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>           }
>           ...
>       }
> 
>       return 0;
>   }
> alloc_domheap_page(d, MEMF_no_owner) allocates page table with order 0, so 4k-aligned page table.
> But if I needed 16k for root table and it should be 16k-aligned then I still have to use
> alloc_domheap_pages(NULL, 2, 0);
> 
> Or do you mean that I have to something like:
>   int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>   {
>       struct page_info *pg;
>   
>       ASSERT(spin_is_locked(&d->arch.paging.lock));
>   
> +    if ( !d->arch.p2m.root )
> +    {
> +        unsigned int order = get_order_from_bytes(KB(16));
> +        unsigned int nr_pages = _AC(1,U) << order;
> +        /*
> +        * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +        * As explained in Section 18.5.1, for the paged virtual-memory schemes
> +        * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
> +        * and must be aligned to a 16-KiB boundary.
> +        */
> +        d->arch.p2m.root = alloc_domheap_pages(d, order, MEMF_no_owner);
> +        if ( d->arch.p2m.root == NULL )
> +            panic("root page table hasn't been allocated\n");
> +
> +        clear_and_clean_page(d->arch.p2m.root);
> +
> +        /* TODO: do I need TLB flush here? */
> +
> +        ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
> +            d->arch.paging.p2m_total_pages + nr_pages;
> +    }
> +
> ...
> }

Neither. I was thinking of you taking 4 pages off the pool in exchange for the
order-2 allocation. Primarily to get the memory accounting right (or at least
closer to reality).

>>>>> +{
>>>>> +    unsigned long ppn;
>>>>> +    unsigned long hgatp_mode;
>>>>> +
>>>>> +    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
>>>>> +
>>>>> +    /* ASID (VMID) not supported yet */
>>>>> +
>>>>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>>>>> +    hgatp_mode = HGATP_MODE_SV39X4;
>>>>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>>>>> +    hgatp_mode = HGATP_MODE_SV48X4;
>>>>> +#else
>>>>> +    #error "add HGATP_MODE"
>>>> As before, please have the # of pre-processor directives in the first column.
>>>>
>>>>> +#endif
>>>>> +
>>>>> +    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);
>>>> Use MASK_INSR()?
>>> Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
>>> If yes, then I didn't get what is the point then?
>> The point is that generally ..._SHIFT is redundant when you also have
>> ..._MASK; that's what MASK_EXTR() and MASK_INSR() leverage.
> 
> At the moment, there is no mask for HGATP_MODE so if to use *_MASK then I
> have to introduce it if it better to have *_MASK instead of *_SHIFT.

Perhaps best to do so then.

>>>>> +static int p2m_alloc_table(struct domain *d)
>>>>> +{
>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>> +
>>>>> +    p2m->root = p2m_allocate_root(d);
>>>>> +    if ( !p2m->root )
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>>>>> +
>>>>> +    /*
>>>>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>>>>> +     * before using it.
>>>>> +     */
>>>>> +    p2m_write_lock(p2m);
>>>>> +    p2m_force_tlb_flush_sync(p2m);
>>>>> +    p2m_write_unlock(p2m);
>>>> While Andrew directed you towards a better model in general, it won't be
>>>> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
>>>> want to do a single global flush e.g. when VMIDs wrap around. That'll be
>>>> fewer global flushes than one per VM creation.
>>> I am not sure that I get a phrase 'VMIDs wrap around'.
>> You have to allocate them somehow. Typically you'll use the next one available.
>> At some point you will need to start over, searching from the beginning. Prior
>> to that now allocation of a new one will require any flush, as none of them
>> had be in use before (after boot or the last such flush).
> 
> Thanks. Now I get your point.
> 
> Won't be better to do TLB flushing during destroying of a domain so then we will
> be sure that TLBs connected to freed VMID aren't present in TLB anymore?

That's an option, but will result in more flushes. Furthermore there may be
reasons to change the VMID for a domain while it's running.

> IIUC, it will work only if VMID is used, right?

Well, anything VMID related is of course only relevant when VMIDs are in use.

> In case if VMID isn't used, probably we can drop flushing here and do a flush
> during booting, right?

That'll be too little flushing?

> Won't be enough to flushing of guest TLB only during context switch?

"only" is interesting here. Context switches are a relatively frequent
operation, which in addition you want to be fast. If a flush is necessary
there for correctness (e.g. when VMIDs aren't in use), you have to do it
there. But if you can flush less frequently without violating correctness,
you'd almost always want to use such an opportunity.

>>> I am going to implement, p2m_force_tlb_flush_sync() as:
>>>    static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>>    {
>>>      ...
>>>        sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>>>      ...
>>>    }
>>>
>>> With such implementation if the guest didn't run on any pCPU(s) yet
>>> then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
>>> as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
>>> I am not sure that it is a good idea as I can't find a guarantee in the spec
>>> that TLB will be empty during boot time.
>> If in doubt, do one global flush while booting.
> 
> By booting you mean somewhere in continue_new_vcpu()?

I don't particularly mean any specific place. However, continue_new_vcpu()
(by its name) isn't involved in bringing up Xen, is it?

Jan

