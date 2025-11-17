Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9556C62F06
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 09:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163471.1490582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKuqB-0000yl-65; Mon, 17 Nov 2025 08:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163471.1490582; Mon, 17 Nov 2025 08:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKuqB-0000wZ-3H; Mon, 17 Nov 2025 08:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1163471;
 Mon, 17 Nov 2025 08:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKuq8-0000w1-QL
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 08:44:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc6fc3c-c391-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 09:43:56 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso430364466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 00:43:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12d55sm1018331566b.33.2025.11.17.00.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 00:43:55 -0800 (PST)
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
X-Inumbo-ID: 8dc6fc3c-c391-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763369036; x=1763973836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=krcBBOXXNgmByuL+gQW4gFtN9O+xhncc8smKfCKnAKc=;
        b=axTdJm03LJw0gA10V7exy53v+gV9RBI/aNTc+dx2mh8m4x8ckCCtBOeeEu8AvvRtOh
         JSkih1c71ARnGqn6/7qm0lvD2V3pvE/Ti/dWXvwIBdfS2kh/em32+JCJTc7GHHfDcmrQ
         j+k1Onk/gvqzza44yci792YQGushF8d/JkjX0nCjVB04RBmjh0//cnWWB8cnydr2Bjvx
         7MCNlTPhuRkGOaFRVr4UNWDFZnxHpp8zjT4YP95Dm8ZedzornTcInSdmvmZxfd9XSvwI
         +vO8yBjgOOjD/sq9N9ja/HI5XBU4I0MuklnGnyKEQuTUd8OqVSwspIMqLFzXTYh1uCEu
         jgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369036; x=1763973836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krcBBOXXNgmByuL+gQW4gFtN9O+xhncc8smKfCKnAKc=;
        b=CbCA+B90gWLBKYv0UU0gdWjT3IrOoZ3/IRS0pI5ES2YlDTBV6uR+i8fGSU98pbOyfe
         YxJ8f67BdfbWayk6/zwN2NyzSkE/xqG6L3ALOoFWSUFsUTDamH/Em5vN+SRB3M4ZEXRW
         p3QaCeaJzuZtLFH96103OllkQGrcTGzd2qIqxOsyKqS5HJAYbQwaClY7cSHgqpXbr3h0
         9NgOU7C37n859dOQ/3MLnr7kmoYIfWl05K5lojDwYvJkXSy7rXi7UQUzOABaSF7mKezA
         AWOy3FPj+nH3+IxMG0NOb6z2MQXwy6LDUMtcv/vfggMH47sVr4+pOXhK2lkIKzatjD6k
         KSvA==
X-Forwarded-Encrypted: i=1; AJvYcCX+NiwMRWIxAK0nh4fo4cxqkaMZloaoI8FgPBcnN0GdX0+h3Ju1yitGqyx5+hUZrN9Ulrpn+yrospU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJR67MW6aenbPug6afsNf6sivZtQoSm3y/5eJNPI46Fm5o0eYz
	ViBvsirxrJqaJcaQ9gD93HwkT23e1fj1XKGqPbjw43Rm9Rmog1NpeQWd2oM4XeeD+Q==
X-Gm-Gg: ASbGncu3vLyNyftdjcroKQ1IjrDVqsj/Tyki5fbW4vn2WifGyLHUBrt0DqNDkemy2M1
	W7lOWhoWBZxrkj+tuoj+1L8idaajVtQRhXFVPb/hw0SmsV5rfFVHC8lydEy7RFz0j5aSCdurZTh
	MBacDHhitdK18qVealeLfuY3kVAnzpWMdvxXYthezECpLJzLsLMsmVYtPu86iD/f+Xepp2ihLgN
	ovN6E2iFLTOQnqm5jDlOWyO3cBCfur9LM9B36rUHd1uXpSQSBI3Pglvo1+Yi711xpNmPeV/A2Bp
	xN94IjpBzHWZq+bZi1lTqjKMRb3X1iQJGL2Sy51EFjiq9X+TEE8khUngvsZ9HKSvcGgZtL9l8C1
	yONQQyZBugXer2OwgU6H906BDD+Wy0cMKUqR37VLyV9F/drgtL2mq7RJ7HtzbrqCPTGftiulWZ9
	ap7hyWwqjAIIzxrGrKRoCXiJHUTSyJ5KXyRHULUXg/ih66p/TeLyoGZgngALIywz2KyBEHmhGVZ
	SMRXjZay8Rprw==
X-Google-Smtp-Source: AGHT+IF1EbPGYsfc/pxsJE4kDsmNcdC2LPwpTuUzYjlGAWZ1wwok3OkV+FoMDa4rA340G/cW12w9ug==
X-Received: by 2002:a17:906:3913:b0:b73:709b:c754 with SMTP id a640c23a62f3a-b73709bd3dbmr789698766b.35.1763369035997;
        Mon, 17 Nov 2025 00:43:55 -0800 (PST)
Message-ID: <7de75c50-56be-4a38-bfe9-fd0b73426be3@suse.com>
Date: Mon, 17 Nov 2025 09:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 05/18] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <81d36dc5277d4756442f3ad5d64f37148787394a.1760974017.git.oleksii.kurochko@gmail.com>
 <8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com>
 <d114e2ef-3f33-4c3b-8782-44fbddf7eaa9@gmail.com>
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
In-Reply-To: <d114e2ef-3f33-4c3b-8782-44fbddf7eaa9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 11:53, Oleksii Kurochko wrote:
> On 11/6/25 3:25 PM, Jan Beulich wrote:
>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -3,6 +3,7 @@
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/macros.h>
>>> +#include <xen/domain_page.h>
>>>   #include <xen/mm.h>
>>>   #include <xen/paging.h>
>>>   #include <xen/rwlock.h>
>>> @@ -103,6 +104,70 @@ void __init pre_gstage_init(void)
>>>       vmid_init();
>>>   }
>>>   
>>> +static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
>>> +{
>>> +    clear_domain_page(page_to_mfn(page));
>>> +
>>> +    /*
>>> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
>>> +     * shared between the CPU and IOMMU, it is necessary to clean the
>>> +     * d-cache.
>>> +     */
>>> +    if ( clean_dcache )
>>> +        clean_dcache_va_range(page, PAGE_SIZE);
>> This cleans part of frame_table[], but not the memory page in question.
> 
> Oh, right, we need to map the domain page first.
> 
> Would it make sense to avoid using|clear_domain_page()| in order to prevent
> calling|map_domain_page()| twice (once inside|clear_domain_page()| and once
> before|clean_dcache_va_range()|), and instead do it like this:
>      void *p = __map_domain_page(page);
> 
>      clear_page(p);
> 
>      /*
>       * If the IOMMU doesn't support coherent walks and the p2m tables are
>       * shared between the CPU and IOMMU, it is necessary to clean the
>       * d-cache.
>       */
>      if ( clean_dcache )
>          clean_dcache_va_range(p, PAGE_SIZE);
> 
>      unmap_domain_page(p);

Certainly.

>>> @@ -55,6 +76,39 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>>>       return 0;
>>>   }
>>>   
>>> +int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages)
>>> +{
>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>> +
>>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>>> +    {
>>> +        int rc = paging_add_page_to_freelist(d);
>> The anomaly is more pronounced here, with the other function name in context:
>> paging_refill_from_domheap() doesn't suggest there's a page (or several) being
>> handed to it. paging_add_page_to_freelist() suggests one of its parameter
>> would want to be struct page_info *. Within the naming model you chose, maybe
>> paging_refill_from_domheap_one() or paging_refill_one_from_domheap()? Or
>> simply _paging_refill_from_domheap()?
> 
> Thanks for suggestions. I like the option with "_*" as it is more clearly marks it
> as an internal helper without introducing "_one" suffix. I will use the same approach
> for paging_ret_page_to_domheap(): s/paging_ret_page_to_domheap/_paging_ret_to_domheap().
> 
> Shouldn't we use "__*" instead of "_*" or "__*" is reserved for something else? "__*" is
> used quite frequent in Xen code base.

And wrongly so. "__*" are reserved to the implementation (i.e. compiler / library).
Whereas "_*" (with the letter following the _ not being an upper-case one) is
dedicated to file scope identifiers. (That's mandated by the library part of the
spec, but imo we're well-advised to follow that, because even if we don't link to
any libraries, the compiler using certain symbols [e.g. __builtin_*()] is still
[potentially] getting in our way.)

Jan

