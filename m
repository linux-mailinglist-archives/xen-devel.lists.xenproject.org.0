Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9845598DA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 13:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355473.583149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hmP-0004mG-5x; Fri, 24 Jun 2022 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355473.583149; Fri, 24 Jun 2022 11:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hmP-0004ji-2y; Fri, 24 Jun 2022 11:47:17 +0000
Received: by outflank-mailman (input) for mailman id 355473;
 Fri, 24 Jun 2022 11:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IMW=W7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o4hmO-0004jc-C7
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 11:47:16 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646fc56a-f3b3-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 13:47:15 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id g4so3994240lfv.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jun 2022 04:47:15 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a056512200e00b004790b051822sm335325lfb.90.2022.06.24.04.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 04:47:13 -0700 (PDT)
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
X-Inumbo-ID: 646fc56a-f3b3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kmh0ENdASuzPwvNnlicIKQ5TBNpp7RzwJFZQseGlMJM=;
        b=KAsbqYjUfSjDI+JwFiJ2h9nLoByatH7zPnUIWNSKHA7knN6fw21oRYO6JLl2U198M2
         oA9pY+fy5htTDzA1Z4TpGYBB2Elxcpmvxw7ZfhLjEOwevyVlVTdkGSYAZ7yr/lxnP79/
         4F/Q9ZBDDJG+m3yAhYgRV8daUjDw4hS+HdAMfBA+cs+RWjVkKBTS32AwSC2jvWpYMW+4
         r5BIAWyMZKYqaq2jvibeVpm1XLSjuGPx7tvvVrsrJ2rDu8c8xXjL5rNblV8vdPMstA/B
         wHtoo3OEjdcaYXn/D1L1sk1SQ67zpRNDsQPnZeUgir4nenVeDCOCi7ddME63sU8iJFEI
         tiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kmh0ENdASuzPwvNnlicIKQ5TBNpp7RzwJFZQseGlMJM=;
        b=myUAnkpzEKyMMFg9S4RFRsiToK91Wd9ELqP65YuHVvX1/Dolccj3mKmRU9MWi/J4zZ
         WnCO9m1RWYRb10KbsuUbTL4i3RZwnBjMeTMIJc85sttzgGa410Eke2ZWpeFKzcgN834S
         ZETaJPxQl9iLqeLt7Q2j5xKuh8LWeUBuI01lrqhy2DUeDnMs7L3E4YmoGCRRIgfa3zx3
         t5gEoUS6PUeFa05709RqbIlwbW1OlvnigCdUzFzdmm1sEPkHtXXvFsgwiLXwL8EdlJS0
         QRGPqdkoJrmUONvB9bOWVE4D1v3w14rIpu4vRPBIud0m4drodyyxYFS2E7Uusx/Gckfv
         qxXg==
X-Gm-Message-State: AJIora8mOTguF2VL2fQKHkgM41XQn8H3p6zaKZowCbcxcyfqwPfcKg+A
	lN0o1PWwF2Fu3itlzNtKTY8=
X-Google-Smtp-Source: AGRyM1sropTVtnTKfdklaDJvAT2RxLisCuu0kXmcmeJUOpd0YTy9+lrwIs3iEOKPDLaG0yO2tCl++w==
X-Received: by 2002:a05:6512:b8d:b0:47f:74f0:729b with SMTP id b13-20020a0565120b8d00b0047f74f0729bmr8358007lfv.403.1656071234589;
        Fri, 24 Jun 2022 04:47:14 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <834ed066-9e5f-f440-f6b5-78746c0d4163@gmail.com>
Date: Fri, 24 Jun 2022 14:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.06.22 20:50, Julien Grall wrote:
> Hi Oleksandr,


Hello Julien


>
> Sorry for the late reply.


no problem)


>
> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> +/*
>> + * All accesses to the GFN portion of type_info field should always be
>> + * protected by the P2M lock. In case when it is not feasible to 
>> satisfy
>> + * that requirement (risk of deadlock, lock inversion, etc) it is 
>> important
>> + * to make sure that all non-protected updates to this field are 
>> atomic.
>
> Here you say the non-protected updates should be atomic but...
>
> [...]
>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 7b1f2f4..c94bdaf 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1400,8 +1400,10 @@ void share_xen_page_with_guest(struct 
>> page_info *page, struct domain *d,
>>       spin_lock(&d->page_alloc_lock);
>>         /* The incremented type count pins as writable or read-only. */
>> -    page->u.inuse.type_info =
>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
>> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
>> +                                                  : 
>> PGT_writable_page) |
>> +                                MASK_INSR(1, PGT_count_mask);
>
> ... this is not going to be atomic. So I would suggest to add a 
> comment explaining why this is fine.


Yes, I should have added your explanation given in V5 why this is fine.

So I propose the following text, do you agree with that being added?

/*
  * Please note, the update of type_info field here is not atomic as we use
  * Read-Modify-Write operation on it. But currently it is fine because
  * the caller of page_set_xenheap_gfn() (which is another place where
  * type_info is updated) would need to acquire a reference on the page.
  * This is only possible after the count_info is updated *and* there a 
barrier
  * between the type_info and count_info. So there is no immediate need 
to use
  * cmpxchg() here.
  */


>
>
>>         page_set_owner(page, d);
>>       smp_wmb(); /* install valid domain ptr before updating refcnt. */
>> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>>       }
>>         /* Map at new location. */
>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>
>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>
> I would expand the comment above to explain why you need a different 
> path for xenheap mapped as RAM. AFAICT, this is because we need to 
> call page_set_xenheap_gfn().


agree, I propose the following text, do you agree with that?

/*
  * Map at new location. Here we need to map xenheap RAM page differently
  * because we need to store the valid GFN and make sure that nothing was
  * mapped before (the stored GFN is invalid).
  */


>
>
>> +    else
>> +    {
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        p2m_write_lock(p2m);
>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), 
>> INVALID_GFN) )
>
> Sorry to only notice it now. This check will also change the behavior 
> for XENMAPSPACE_shared_info. Now, we are only allowed to map the 
> shared info once.
>
> I believe this is fine because AFAICT x86 already prevents it. But 
> this is probably something that ought to be explained in the already 
> long commit message.


agree, I propose the following text, do you agree with that?

Please note, this patch changes the behavior how the shared_info page
(which is xenheap RAM page) is mapped in xenmem_add_to_physmap_one().
Now, we only allow to map the shared_info at once. The subsequent attempts
to map it will result in -EBUSY, if there is a legitimate use case
we will be able to relax that behavior.


>
>
> My comments are mainly seeking for clarifications. The code itself 
> looks correct to me. I can handle the comments on commit to save you a 
> round trip once we agree on them.


Thank you, that would be much appreciated.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


