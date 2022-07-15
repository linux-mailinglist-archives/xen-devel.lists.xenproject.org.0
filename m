Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520C57668D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368460.599753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPm5-0003DP-T4; Fri, 15 Jul 2022 18:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368460.599753; Fri, 15 Jul 2022 18:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPm5-00039O-Pj; Fri, 15 Jul 2022 18:10:49 +0000
Received: by outflank-mailman (input) for mailman id 368460;
 Fri, 15 Jul 2022 18:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCPm3-0002tM-KJ
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:10:47 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72fa110e-0469-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 20:10:46 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id r9so9068896lfp.10
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 11:10:46 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 27-20020ac25f5b000000b0047255d210e4sm1020202lfz.19.2022.07.15.11.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 11:10:45 -0700 (PDT)
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
X-Inumbo-ID: 72fa110e-0469-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=teXKXVfnpcIU6qZcVOyu3M10ANHzL0rBlLTcp7zPbgc=;
        b=XJTQXedxrhKxUSKN3WA/lLU+NvAYlbqZtBVDUx9kQPos1f8CtGTp6Ui0aCO5hAMXtR
         F/UG+BP0W10cfMyeh4UeIYxd6BZtwL0Bx86LpXpfD3GNV4PZ1uRNLJxvyzCu6Y2BpC/G
         wKNJSNuXjp6p30uk3P9SHovldO5LWORpN9Ik9y4SxYvyMaM0zHK4wH/z3Qh2ms0U35qG
         EiisFNqKWD18US4YyYvwcbHD0CuVDT//eKxMQvligmCD93UUMFWPmuC+34CXsdKE5Mom
         TesbJfd1HtWWoyd8PcsA/yY3/7Eq9GO6oPpOYzdSUVSPhZE+YjDISusIBjw1uWK6DBEi
         7m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=teXKXVfnpcIU6qZcVOyu3M10ANHzL0rBlLTcp7zPbgc=;
        b=Zc5Xx0FxvOPOzV0biA695dp6OUkEvy2/VIxRBUlZxmdJtvxR7kigc8fZLQK1Q1PG5K
         7B/04byInKpoQqUDHU3meEFVSrqgp81RdemcGwziH9F90iNRmKUk/vZuJGqMT495Oxmr
         IS5qxZCNs/k9/PDPFHgT83v4ahM/bpocxlpefvcmm/kyXCf2bB1NTVW8OHMxIv58/pME
         S34FDaIg58Dcj4AmtwEBlMBIFbxkhVuBH2o2JhS9CnW/yo4jRaYDHS+KoaGMFcYusn5e
         XLIUFy17f+Gi7kuz+xqV+N027NP0VRyBVGycSwA5WcwESorOfTDzgLf6KBfkP7cn46hc
         rFjg==
X-Gm-Message-State: AJIora8fGeWyFD1ZyDIITtjHw6Dlzr6Jvc30Xy+qU73+WH3Ov+rryik1
	mROQg8c6UkosKYiVnKKMw48=
X-Google-Smtp-Source: AGRyM1sRxrwM7eMr5tysW4dMwYRRYPFJW/KY6eSv1Odzh/eQD02xikaASkfSgD9+fl4QULbKKlZ1KQ==
X-Received: by 2002:a19:4f4e:0:b0:48a:11f0:26c7 with SMTP id a14-20020a194f4e000000b0048a11f026c7mr7095935lfk.394.1657908646154;
        Fri, 15 Jul 2022 11:10:46 -0700 (PDT)
Message-ID: <04d4ebbb-8437-0d92-da97-eabf5c6f206b@gmail.com>
Date: Fri, 15 Jul 2022 21:10:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
 <834ed066-9e5f-f440-f6b5-78746c0d4163@gmail.com>
 <dfd7657e-bbb9-3d96-2650-063561a00b9b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <dfd7657e-bbb9-3d96-2650-063561a00b9b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15.07.22 20:49, Julien Grall wrote:
> Hi Oleksandr,


Hello Julien



>
> On 24/06/2022 12:47, Oleksandr wrote:
>>
>> On 23.06.22 20:50, Julien Grall wrote:
>>> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>>> b/xen/arch/arm/include/asm/mm.h
>>>> +/*
>>>> + * All accesses to the GFN portion of type_info field should 
>>>> always be
>>>> + * protected by the P2M lock. In case when it is not feasible to 
>>>> satisfy
>>>> + * that requirement (risk of deadlock, lock inversion, etc) it is 
>>>> important
>>>> + * to make sure that all non-protected updates to this field are 
>>>> atomic.
>>>
>>> Here you say the non-protected updates should be atomic but...
>>>
>>> [...]
>>>
>>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>>> index 7b1f2f4..c94bdaf 100644
>>>> --- a/xen/arch/arm/mm.c
>>>> +++ b/xen/arch/arm/mm.c
>>>> @@ -1400,8 +1400,10 @@ void share_xen_page_with_guest(struct 
>>>> page_info *page, struct domain *d,
>>>>       spin_lock(&d->page_alloc_lock);
>>>>         /* The incremented type count pins as writable or 
>>>> read-only. */
>>>> -    page->u.inuse.type_info =
>>>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>>>> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
>>>> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
>>>> +                                                  : 
>>>> PGT_writable_page) |
>>>> +                                MASK_INSR(1, PGT_count_mask);
>>>
>>> ... this is not going to be atomic. So I would suggest to add a 
>>> comment explaining why this is fine.
>>
>>
>> Yes, I should have added your explanation given in V5 why this is fine.
>>
>> So I propose the following text, do you agree with that being added?
>>
>> /*
>>   * Please note, the update of type_info field here is not atomic as 
>> we use
>>   * Read-Modify-Write operation on it. But currently it is fine because
>>   * the caller of page_set_xenheap_gfn() (which is another place where
>>   * type_info is updated) would need to acquire a reference on the page.
>>   * This is only possible after the count_info is updated *and* there a 
>
> Missing word: there *is* a.


ok


>
>> barrier
>>   * between the type_info and count_info. So there is no immediate 
>> need to use
>>   * cmpxchg() here.
>>   */
>>
>>
>>>
>>>
>>>>         page_set_owner(page, d);
>>>>       smp_wmb(); /* install valid domain ptr before updating 
>>>> refcnt. */
>>>> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>>>>       }
>>>>         /* Map at new location. */
>>>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>>
>>>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>>>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>>
>>> I would expand the comment above to explain why you need a different 
>>> path for xenheap mapped as RAM. AFAICT, this is because we need to 
>>> call page_set_xenheap_gfn().
>>
>>
>> agree, I propose the following text, do you agree with that?
>>
>> /*
>>   * Map at new location. Here we need to map xenheap RAM page 
>> differently
>>   * because we need to store the valid GFN and make sure that nothing 
>> was
>>   * mapped before (the stored GFN is invalid).
>>   */
>
> So I think the key point here is the p2m_set_xenheap_gfn() needs to 
> happen with the P2M lock held.
>
> That said, looking at the code again this is a bit confusing to use 
> guest_physmap_add_entry() in one place and p2m_set_entry() in the other.
>
> The only way I can think to avoid the confusion is than open-coding 
> guest_physmap_add_entry() (i.e. p2m_write_lock(); p2m_set_entry(); 
> p2m_write_unlock()) or try to merge the two paths.
>
> However, I am aware this is already at version 6 and your code should 
> work. So I would be OK with a comment explaining that 
> guest_physmap_add_entry() is just a wrapper on top of p2m_set_entry().


ok, thanks


>
>>>> +    else
>>>> +    {
>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +        p2m_write_lock(p2m);
>>>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), 
>>>> INVALID_GFN) )
>>>
>>> Sorry to only notice it now. This check will also change the 
>>> behavior for XENMAPSPACE_shared_info. Now, we are only allowed to 
>>> map the shared info once.
>>>
>>> I believe this is fine because AFAICT x86 already prevents it. But 
>>> this is probably something that ought to be explained in the already 
>>> long commit message.
>
> So I was wrong thinking that x86 would prevent it (see Jan's answer). 
> However, I think this is a mistake to allow it because it can result 
> to weird issues.
>
> In fact, you mentioned on IRC that there is already an example on how 
> this hypercall could be misused in U-boot [1]. At the moment, U-boot 
> will steal a RAM page to map the shared info page but not unmap it.
>
> The OS will not be aware where the shared info page is mapped. As this 
> is part of the RAM region, the OS may end up to allocate for other 
> purpose and corrupt the page.
>
> If Xen were going to unmap it, then we would create a hole and the OS 
> will crash when accessing the page. In some way, it is better than 
> corruption but still a good user experience (the RAM page may only be 
> accessed a long time after boot).
>
> So I think it is much better to return -EBUSY here at least we can 
> catch misuse in the firmware code earlier.
>
> In the case of U-boot, as discussed on IRC, the code should:
>   1) Unmap the page
>   2) Populate the area with memory using XENMEM_populate_physmap
>
> An optimization would be to use the extended regions. But this was 
> only recently introduced so U-boot cannot always rely on it.


you are right, I have nothing to add


>
>>
>>
>> agree, I propose the following text, do you agree with that?
>>
>> Please note, this patch changes the behavior how the shared_info page
>> (which is xenheap RAM page) is mapped in xenmem_add_to_physmap_one().
>> Now, we only allow to map the shared_info at once. The subsequent 
>> attempts
>> to map it will result in -EBUSY, if there is a legitimate use case
>> we will be able to relax that behavior.
>
> I would suggest to summarize what I wrote above in the commit message. 
> I think this is a strong reason to return -EBUSY and push other 
> projects (e.g. U-boot) to fix there code.


agree, will do


>
>
> Cheers,
>
> [1] 
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/xen/hypervisor.c
>
-- 
Regards,

Oleksandr Tyshchenko


