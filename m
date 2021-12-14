Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF74747F7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 17:27:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246890.425799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAdh-0003hK-DA; Tue, 14 Dec 2021 16:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246890.425799; Tue, 14 Dec 2021 16:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAdh-0003f6-9q; Tue, 14 Dec 2021 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 246890;
 Tue, 14 Dec 2021 16:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYVb=Q7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxAdg-0003f0-3Q
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:26:52 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4317001-5cfa-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 17:26:51 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id b1so37747048lfs.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 08:26:50 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b12sm31629lfb.146.2021.12.14.08.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 08:26:50 -0800 (PST)
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
X-Inumbo-ID: a4317001-5cfa-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DprBb2HHkk6EbP3eN9JugbZna4UuXU1A8PcH+AUxVjY=;
        b=UjioMSsyc11laKt3otEung5PFsP+d9sQo7AZnD6z/FVW4iwGGfg0Wxdg/02M6F5/tF
         2xKiLG9CE++/vPlp+EYDnbBfXbfSTjwjxYHWRgzrUT0sgYu7rxsIOvR0mha/tVCGZs5x
         rj6/+L3Lr7+LHCnXl64DFSq7VeDqM4GajRv/x3Tp78eW5pFnMp6JanY/E9VayzHxHI60
         P+l0tJl/glWJJzhLs5BJycR3VqCMKhf8MHNBaGNcLk5XSv9A57Rfng/d1vkHXPBxwgRy
         FyuUn0Uzlxm/81z72XU+TIlDy+YRDfn7tpfM+bqaG+7xPcJVXgCAPr65wPQeuUn8HH7X
         zNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DprBb2HHkk6EbP3eN9JugbZna4UuXU1A8PcH+AUxVjY=;
        b=SfDfAwrVJhgl6KMzmkuQIje7WD1jOGhpGQ3tVXGpGyqeGs2oguTsAI/jr0N1aJB7yx
         uc7/cyuZQWLP7TZP2pT4A1IzWp77qvYgfCkfQbBtvglgIVjMgFmAWA+BYtcMbEJS3FFD
         WPtxTrtnY5gnlxHfEcWvjuLLKTvL7PJnhNcAxqq2ocHX5xa8VZE5Akh+30MghgsDy5mi
         CO8NCzryvaw+JY9eo5mI2JcV5++bjGubi4of6eA+6Mi9GAh7ySfqgtmqopLPymHMr/ZB
         m8oF6kxE2PFmLxnQalQVHxsehiiho5kDqPmtvPHqI5dlaWuziTV5J8aTob1HyQ2eJtXs
         xrwQ==
X-Gm-Message-State: AOAM530esp5EANBEc6bu/EYhvHap2bOe60PTJeOEzkQ4+T0bssk+VzIs
	f/6Rz3rZYrge6Rioj6MJxsBsxFIKf5g=
X-Google-Smtp-Source: ABdhPJxT91TfWjOQlICHfLdPuY595OGKYEiXc7q8AGWYh/XPV04shdbJiFsdkxE9NAnD2JKu+Qcx8g==
X-Received: by 2002:a05:6512:2386:: with SMTP id c6mr5707542lfv.166.1639499210321;
        Tue, 14 Dec 2021 08:26:50 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
Date: Tue, 14 Dec 2021 18:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 15:37, Jan Beulich wrote:

Hi Jan, Julien.

> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1382,8 +1382,10 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>>       spin_lock(&d->page_alloc_lock);
>>   
>>       /* The incremented type count pins as writable or read-only. */
>> -    page->u.inuse.type_info =
>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
>> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
>> +                                                  : PGT_writable_page) |
>> +                                MASK_INSR(1, PGT_count_mask);
> It's certainly up to the Arm maintainers to judge, but I would have
> deemed it better (less risky going forward) if PGT_count_mask
> continued to use the bottom bits. (I guess I may have said so before.)

If I am not mistaken the request was to make sure (re-check) that moving 
the count portion up
was compatible with all present uses. The code above is only a single 
place on Arm
which needs updating.


>
>> @@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
>>       }
>>   
>>       /* Map at new location. */
>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>> +    else
>> +    {
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        p2m_write_lock(p2m);
>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
>> +        {
>> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
>> +            if ( !rc )
>> +                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
>> +        }
>> +        else
>> +            rc = -EBUSY;
> May I suggest to avoid failing here when page_get_xenheap_gfn(mfn_to_page(mfn))
> matches the passed in GFN?


Good question...
There was an explicit request to fail here if page_get_xenheap_gfn() 
returns a valid GFN.
 From the other side, if old GFN matches new GFN we do not remove the 
mapping in gnttab_set_frame_gfn(),
so probably we could avoid failing here in that particular case. 
@Julien, what do you think?


>
>> @@ -2169,6 +2170,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>       if ( unlikely(pg == NULL) )
>>           return NULL;
>>   
>> +    for ( i = 0; i < (1u << order); i++ )
>> +        arch_alloc_xenheap_page(&pg[i]);
>> +
>>       memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
> I think this and ...
>
>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>   
>>   void free_xenheap_pages(void *v, unsigned int order)
>>   {
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>>       ASSERT(!in_irq());
>>   
>>       if ( v == NULL )
>>           return;
>>   
>> +    pg = virt_to_page(v);
>> +
>>       memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
> ... this really want to (logically) move into the new arch hooks.
> That'll effectively mean to simply drop the Arm stubs afaict (and I
> notice there's some dead code there on x86, which I guess I'll make
> a patch to clean up). But first of all this suggests that you want
> to call the hooks with base page and order, putting the loops there.

I see your point and agree ... However I see the on-list patches that 
remove common memguard_* invocations and x86 bits.
So I assume, this request is not actual anymore, or I still need to pass 
an order to new arch hooks? Please clarify.


>
>> @@ -166,6 +173,32 @@ extern unsigned long xenheap_base_pdx;
>>   
>>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>>   
>> +static inline gfn_t page_get_xenheap_gfn(struct page_info *p)
> const please wherever possible.

ok, will do.


Thank you.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


