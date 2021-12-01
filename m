Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CB4654A6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236159.409621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msTuJ-0005Hz-3A; Wed, 01 Dec 2021 18:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236159.409621; Wed, 01 Dec 2021 18:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msTuI-0005GC-W5; Wed, 01 Dec 2021 18:00:38 +0000
Received: by outflank-mailman (input) for mailman id 236159;
 Wed, 01 Dec 2021 18:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eN/C=QS=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1msTuH-0005G6-EK
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:00:37 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95afd662-52d0-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 19:00:36 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id d11so49789149ljg.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Dec 2021 10:00:36 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z37sm56722lfu.79.2021.12.01.10.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 10:00:35 -0800 (PST)
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
X-Inumbo-ID: 95afd662-52d0-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=smZlwKrD+zfYCO+VvIqhzp9zybnZOiwTsGLjKGUL0DI=;
        b=EfgVCGQp3K6+B1BiMRotM36ndTFpjmtPbNFra8DAV7MdkNB3CIWh0CAAqMmy6qGBf0
         59A+arQiXLW5LkvZ+7Et+qkosel0JHdXhXO0WOvk0M0q/+iFWexeKw92PsXDmHFwD6Ua
         FFxk0dk6SvanX9KfdpEZCmgDrp7PmaR/1RdgTtziZb4PRXXoKThi57UChfbp8vL4YldR
         AL1W26ZHBALQFUvEi9nCAWdhE+wPAMo3fRUmIMJoTJuUQOsQMAovtbOF6KkePFc33gLd
         fJ0D3/lSixCDNpL14Dl6nEoCLMxHd1mXJ5wENkIC5z2AFjI21Jw4r44eDZohqqSGwx7s
         qhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=smZlwKrD+zfYCO+VvIqhzp9zybnZOiwTsGLjKGUL0DI=;
        b=kr4M5I4/54rBxh0N4EBpLcuLCHB0a6U3mSmMq2OpizDrSKCFto+W5Vx6H94JWYUYjE
         2w0HfE4e5ORSxnkniDCLVnLICGOLUOL4vuhcsOA93C4IqZztBp0H9MuGg26EqJJDtFOe
         /k9srtHN9+3duiSxATihhz3TmUr2WGQp80hKh2DNsvbJTQDAvaa/JvPvxV97pc+rcG/h
         6LqyVuHFbBBFkfgsqFj0HWUiCPFASykTJLi1srfDGnmhibaSm26gaWwH8JKPW0zNs04T
         XyAfg/tEr/lMw2stmd2/2EMl76QQxwfFgQdX493fX8xsgP623qWxYdInUxzZCunrpM++
         QX6Q==
X-Gm-Message-State: AOAM531BEAXkhGVFSnvRCcK0AKwrvJV1HjWuQC5ezSNY6P0PvbMY1vRq
	BxiS19NbDDnF6Kg2871bHwI=
X-Google-Smtp-Source: ABdhPJzMUpXfR9omgeAWkNPQ4xSbG2XcMsOZstdYKGFaAZnf9YrOucaMnX00e2TGaCSseqhM8bptNg==
X-Received: by 2002:a05:651c:308:: with SMTP id a8mr7275381ljp.149.1638381635634;
        Wed, 01 Dec 2021 10:00:35 -0800 (PST)
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Julien Grall <julien@xen.org>
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
 <a5aa0a6a-3765-9395-026f-3bfd88bba354@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5caafe94-51d8-3d33-b42a-bef44a4470e6@gmail.com>
Date: Wed, 1 Dec 2021 20:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5aa0a6a-3765-9395-026f-3bfd88bba354@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.12.21 18:22, Julien Grall wrote:
>
>
> On 29/11/2021 15:58, Oleksandr wrote:
>>
>> Hi Julien
>
> Hi,


Hi Julien


>
>>
>>
>> [snip]
>>
>>
>>>
>>>>>
>>>>> ! Please note, there is still unresolved locking question here for 
>>>>> which
>>>>> I failed to find a suitable solution. So, it is still an RFC !
>>>>>
>>>>> According to the internal conversation:
>>>>> Now the GFN field in the struct page_info is accessed from
>>>>> gnttab_set_frame_gfn() in the grant table code and from 
>>>>> page_set_frame_gfn()
>>>>> in the P2M code (the former uses the latter).
>>>>>
>>>>> We need to prevent the concurrent access to this field. But, we 
>>>>> cannot grab
>>>>> the grant lock from the P2M code because we will introduce a lock 
>>>>> inversion.
>>>>> The page_set_frame_gfn() will be called from the P2M code with the 
>>>>> p2m lock held
>>>>> and then acquire the grant table lock. The gnttab_map_frame() will 
>>>>> do the inverse.
>>>>
>>>> This is a tricky one. I think, we will:
>>>>
>>>>   1) Need to use the P2M lock to protect the access to the GFN in 
>>>> the struct page_info *.
>>>>   2) Defer the call to page_set_frame_gfn() from gnttab_map_frame() 
>>>> to xenmem_add_to_physmap_one()
>>>>   3) In xenmem_add_to_physmap_one() hold the P2M lock while 
>>>> checking the page was not already mapped (e.g. page_get_frame_gfn() 
>>>> == INVALID_GFN) and do the mapping. Call page_set_frame_gfn() on 
>>>> success.
>>>>
>>>> This would still allow the guest to shot itself in the foot (e.g. 
>>>> potentially removing the wrong mapping) if it tries concurrent 
>>>> hypercall but I believe we would not introduce issue like XSA-380.
>>>>
>>>> At the end this would look quite similar to how x86 deal with the 
>>>> M2P update.
>>>
>>> Thank you for the suggestion, I need to analyze the code to better 
>>> understand your idea and technical possibility to implement it, I 
>>> will come up with questions if any.
>>
>> I experimented a bit... Could you please clarify, is the code snippet 
>> below is close to what you meant?
>
> It is close to what I had in my mind. 

Great, thank you for the clarifying.


> A few comments below.
>
>>
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index b594db4..dba9258 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1488,8 +1488,27 @@ int xenmem_add_to_physmap_one(
>>           return -ENOSYS;
>>       }
>>
>> -    /* Map at new location. */
>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>> +    if ( space != XENMAPSPACE_grant_table )
>
> I would consider to use this approach for any xenheap pages.


Well, I think (from the first look) we need to:

1. Drop #ifdef CONFIG_GRANT_TABLE down this function and in 
p2m_put_l3_page()

2. Replace "space != XENMAPSPACE_grant_table" with 
"!is_xen_heap_mfn(mfn)" above.

Is my understanding correct?


>
>
>> +        /* Map at new location. */
>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>> +    else
>> +    {
>> +#ifdef CONFIG_GRANT_TABLE
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        p2m_write_lock(p2m);
>> +        if ( gfn_eq(page_get_frame_gfn(page), INVALID_GFN) )
>
> I think we want to return an error if page_get_frame_gfn() return a 
> valid GFN.

ok, I assume -EBUSY would be appropriate


>
>
>> +        {
>> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, 
>> p2m->default_access);
>> +            if ( !rc )
>> +                page_set_frame_gfn(page, gfn);
>> +        }
>> +        p2m_write_unlock(p2m);
>> +#else
>> +        ASSERT_UNREACHABLE();
>> +        rc = -EINVAL;
>> +#endif
>> +    }
>>
>>       /*
>>        * For XENMAPSPACE_gmfn_foreign if we failed to add the 
>> mapping, we need
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index 59604b1..64e9e77 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4167,10 +4167,8 @@ int gnttab_map_frame(struct domain *d, 
>> unsigned long idx, gfn_t gfn, mfn_t *mfn)
>>            * Make sure gnttab_unpopulate_status_frames() won't 
>> (successfully)
>>            * free the page until our caller has completed its operation.
>>            */
>> -        if ( get_page(mfn_to_page(*mfn), d) )
>> -            gnttab_set_frame_gfn(gt, status, idx, gfn);
>> -        else
>> -            rc = -EBUSY;
>> +        if ( !get_page(mfn_to_page(*mfn), d) )
>> +           rc = -EBUSY;
>>       }
>>
>>       grant_write_unlock(gt);
>> (END)
>>
>> If yes *and* I correctly understand the code, then looks like 
>> gnttab_set_frame_gfn becomes useless on Arm and can be dropped 
>> globally (x86's variant is already dummy).
>
> It will not be a dummy version soon see [1].

Indeed, I just remembered about this patch, ok.


>
> Cheers,
>
> [1] 
> https://lore.kernel.org/xen-devel/8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com/
>
-- 
Regards,

Oleksandr Tyshchenko


