Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4029E027E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846695.1261846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5te-0002OR-8A; Mon, 02 Dec 2024 12:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846695.1261846; Mon, 02 Dec 2024 12:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5te-0002M1-4Q; Mon, 02 Dec 2024 12:51:26 +0000
Received: by outflank-mailman (input) for mailman id 846695;
 Mon, 02 Dec 2024 12:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WwIx=S3=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1tI5tc-0002Lv-Vp
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:51:25 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f5a2f11-b0ac-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 13:51:17 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53de7321675so4307023e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:51:18 -0800 (PST)
Received: from [192.168.1.21] ([95.91.249.175])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59991f1d2sm502605366b.170.2024.12.02.04.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:51:17 -0800 (PST)
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
X-Inumbo-ID: 1f5a2f11-b0ac-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmQiLCJoZWxvIjoibWFpbC1sZjEteDEyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmNWEyZjExLWIwYWMtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTQzODc3LjkzOTA2Mywic2VuZGVyIjoiYW5kcmVhLmJhc3RvbmlAbWluZXJ2YXN5cy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733143878; x=1733748678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=evlHODTqQpDD23xlCiQJnJFL4S3np0fQpFLj1pSZ6z8=;
        b=jEbz3h/cQMACO4p/BrEH0IBtc23wuTdFH1c1uJE3ojZe3m/ILSr/3jJhaopWG3kpWu
         +YL7oq5hu+ZNfAkIQ8F0Feltr4gr+lEGN8KOo6nTYjbElDUdEBtPRiAcuOgoGBUxdkF3
         BF6D2vPQlCFNsy1GmcivIjpyYh4oY99jiY2B3l1m+6m7Kcj0kUA5wYxftLyCF5XY2Wfx
         r/fCEpkwYP+cLUaAHq118wj6AxklxET2EzAk0FQpk4XKsvF4SodnYwfklwxpmhzhHiEr
         6a2wEgmAOTDHaEj+b1ULEHPPkhmEKne1JME2tDcpXx00lTNdjrq8pUZq/PyEUqOVruJ3
         LBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143878; x=1733748678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evlHODTqQpDD23xlCiQJnJFL4S3np0fQpFLj1pSZ6z8=;
        b=E096oZ2/aUBaUAVoUDu+GaFM9CYvrAS/VYho3inZNBg0uK83x1pqU0feuioU8HcL/C
         uhcN0PLirN169WkADq3oRDcM1q2ExfweuQfcgS75JCeAj/CmcKkrSCRrQRIMCaZN8VNM
         mrnB1YkABJVjSWqKNC6JuYKD5IaS0n0/eNX3kFczsLfb/I+jwIWTv2Qr3VIN6/k9SwHJ
         w1dVw2C2dim8deXL8maoBUCUO6uB7f7ApZKM2UvxGKo4PZTv16uLCfpmwRbRxlcuAwcY
         hbe05pKBWgnBcCpQfDmoa0luAtuh4xaj6Bn0M95AYbYlp7ZmATFpt5FPd2ogB/LlJHAd
         6JPw==
X-Forwarded-Encrypted: i=1; AJvYcCXRgI/4OBWN8ywWJaoPCzEyyJU0SiyzvaWgFfc/2M/zObzoYCfsYGMg+xBb1WFp7lYSyJFJKxzR+2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8vR4dV1TEHK/GllryN98au7H7zSJDA537fPkGdQd0Zlv9Kr67
	MYlb3BlMJsYZHt9B5E8MKjUdfQ/wNaApyktM0HMVdEdynd5kWUy6SiFyDiBvsPc=
X-Gm-Gg: ASbGncsXf8PXgDuCyVmplQHK9q1G2JofepQQAk/KOqJ7giDBiuRVnkN1ULdoY4AzR+b
	XLry2IZpT1u68M+OTPufZX15S12zdzpPFmsQcVScIcKA6sB4DHbJksKmj8cKC0JkxpUMVfuPpQh
	526hjz6LebF3PlDf7BA/SZb9GMPEyv4skEOklpeRgma4pvoN0WNOdUOnZyAoVb4ODz2fj7/y7+u
	jBbWLIh2yYr5utFhjADUYaIoEUwTOnn+EVtMwBdWH+KRdLG6MtzgWPos+AxBRo9VKA=
X-Google-Smtp-Source: AGHT+IEp1hHPLS3l1a6XvhlOwnxeNnj717z4jeqoPXpTISFsrS7xARGlnshRcSbLLqopISvah17QeA==
X-Received: by 2002:ac2:4199:0:b0:53d:f1cb:624c with SMTP id 2adb3069b0e04-53df1cb63a0mr9738004e87.34.1733143877720;
        Mon, 02 Dec 2024 04:51:17 -0800 (PST)
Message-ID: <b380b2a8-0d12-42ca-8bae-e7dfa0724572@minervasys.tech>
Date: Mon, 2 Dec 2024 13:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-9-carlo.nonato@minervasys.tech>
 <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
 <CAG+AhRWWK6e3KJ66v5wvowTzOvyJRaECpkXYpSzMa9+83ea0eA@mail.gmail.com>
 <ce9c6a08-f1d5-4755-8dc4-737f147b2b22@suse.com>
Content-Language: en-US
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
Autocrypt: addr=andrea.bastoni@minervasys.tech; keydata=
 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
 Id5SuAU=
In-Reply-To: <ce9c6a08-f1d5-4755-8dc4-737f147b2b22@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 29/11/2024 12:09, Jan Beulich wrote:
> On 29.11.2024 10:32, Carlo Nonato wrote:
>> Hi Jan,
>>
>> On Thu, Nov 28, 2024 at 12:05 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 19.11.2024 15:13, Carlo Nonato wrote:
>>>> PGC_static, PGC_extra and PGC_broken need to be preserved when assigning a
>>>> page. Define a new macro that groups those flags and use it instead of or'ing
>>>> every time.
>>>>
>>>> To make preserved flags even more meaningful, they are kept also when
>>>> switching state in mark_page_free().
>>>> Enforce the removal of PGC_extra before freeing domain pages as this is
>>>> considered an error and can cause ASSERT violations.
>>>>
>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>> ---
>>>> v10:
>>>> - fixed commit message
>>>> v9:
>>>> - add PGC_broken to PGC_preserved
>>>> - clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
>>>> v8:
>>>> - fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
>>>>   before freeing
>>>> v7:
>>>> - PGC_preserved used also in mark_page_free()
>>>> v6:
>>>> - preserved_flags renamed to PGC_preserved
>>>> - PGC_preserved is used only in assign_pages()
>>>> v5:
>>>> - new patch
>>>> ---
>>>>  xen/common/page_alloc.c | 19 ++++++++++++++-----
>>>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>>>> index 7b911b5ed9..34cd473150 100644
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -160,6 +160,7 @@
>>>>  #endif
>>>>
>>>>  #define PGC_no_buddy_merge PGC_static
>>>> +#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)
>>>>
>>>>  #ifndef PGT_TYPE_INFO_INITIALIZER
>>>>  #define PGT_TYPE_INFO_INITIALIZER 0
>>>> @@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>>      {
>>>>      case PGC_state_inuse:
>>>>          BUG_ON(pg->count_info & PGC_broken);
>>>> -        pg->count_info = PGC_state_free;
>>>> +        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
>>>>          break;
>>>
>>> PGC_extra doesn't want preserving here. Since it's mark_page_free(), and
>>> since PGC_extra is removed before freeing, the state change is apparently
>>> fine. But an assertion may want adding, for documentation purposes if
>>> nothing else.
>>>
>>> Alternatively it may make sense to indeed exclude PGC_extra here. In fact
>>> PGC_static doesn't need using here either, as unprepare_staticmem_pages()
>>> will explicitly set it again anyway.
>>>
>>> Hence I wonder whether the change here really is necessary (one will then
>>> be needed in the next patch aiui, when PGC_colored is introduced). Which
>>> would then eliminate the need for the final two hunks of the patch, I
>>> think.
>>>
>>>>      case PGC_state_offlining:
>>>> -        pg->count_info = (pg->count_info & PGC_broken) |
>>>> -                         PGC_state_offlined;
>>>> +        pg->count_info = (pg->count_info & PGC_preserved) | PGC_state_offlined;
>>>>          pg_offlined = true;
>>>>          break;
>>>
>>> I'm similarly unconvinced that anything other than PGC_broken (and
>>> subsequently perhaps PGC_colored) would need preserving here.
>>
>> Yes, we (re)checked the code and also believe that the introduction of
>> PGC_preserved is generating more confusion (and code) then the actual logical
>> help it provides.
>>
>> We'll remove this patch and integrate PGC_colored explicitly in the flags to
>> be preserved. This avoid the clumsy logic of preserving something (extra)
>> when it's not needed and then handling the special case to remove it
>> explicitly.
>> Basically my goal is to go back to v4 where this patch didn't exist.
> 
> Hmm, no, I don't think I said anything in the direction of removing PGC_preserved
> again. I merely think you went too far in where it actually wants using.

Let me try to better detail the intention of what we have in mind.
Here again parts of this patch:

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 7b911b5ed9..34cd473150 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -160,6 +160,7 @@
>  #endif
> 
>  #define PGC_no_buddy_merge PGC_static
> +#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)

The granularity of preserved as implemented by v10 is different than what you require...

> 
>  #ifndef PGT_TYPE_INFO_INITIALIZER
>  #define PGT_TYPE_INFO_INITIALIZER 0
> @@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>      {
>      case PGC_state_inuse:
>          BUG_ON(pg->count_info & PGC_broken);
> -        pg->count_info = PGC_state_free;
> +        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);

here (no need),

>          break;
> 
>      case PGC_state_offlining:
> -        pg->count_info = (pg->count_info & PGC_broken) |
> -                         PGC_state_offlined;
> +        pg->count_info = (pg->count_info & PGC_preserved) | PGC_state_offlined;

here (only broken),

>          pg_offlined = true;
>          break;
> 
> @@ -2366,7 +2366,7 @@ int assign_pages(
> 
>          for ( i = 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> +            ASSERT(!(pg[i].count_info & ~PGC_preserved));

here (no broken),

>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2426,7 +2426,7 @@ int assign_pages(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>          pg[i].count_info =
> -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
> +            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;

here (no broken).

And it also leads (as noted) to the special management of extra...

> 
>          page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>      }
> @@ -2485,6 +2485,14 @@ struct page_info *alloc_domheap_pages(
>          }
>          if ( assign_page(pg, order, d, memflags) )
>          {
> +            if ( memflags & MEMF_no_refcount )
> +            {
> +                unsigned long i;
> +
> +                for ( i = 0; i < (1UL << order); i++ )
> +                    pg[i].count_info &= ~PGC_extra;
> +            }

here (likely not need, should be impossible to trigger),

> +
>              free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>              return NULL;
>          }
> @@ -2539,6 +2547,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>                  {
>                      ASSERT(d->extra_pages);
>                      d->extra_pages--;
> +                    pg[i].count_info &= ~PGC_extra;

and here.

The proposal would be to go back to v9, which reduces (for the PGC)
the management to colored only:

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
...
> @@ -2382,7 +2556,7 @@ int assign_pages(
> 
>          for ( i = 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static | PGC_colored)));
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2442,7 +2616,8 @@ int assign_pages(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>          pg[i].count_info =
> -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
> +            (pg[i].count_info & (PGC_extra | PGC_static | PGC_colored)) |
> +            PGC_allocated | 1;
> 
>          page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));

Thanks,
Andrea


