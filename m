Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1AAF14B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 13:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030962.1404652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWw4y-0004RB-Se; Wed, 02 Jul 2025 11:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030962.1404652; Wed, 02 Jul 2025 11:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWw4y-0004OH-Oz; Wed, 02 Jul 2025 11:56:44 +0000
Received: by outflank-mailman (input) for mailman id 1030962;
 Wed, 02 Jul 2025 11:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWw4x-0004OB-P4
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 11:56:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e08f09b-573b-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 13:56:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so3164906f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 04:56:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3205b3dsm12675924a12.78.2025.07.02.04.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 04:56:40 -0700 (PDT)
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
X-Inumbo-ID: 9e08f09b-573b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751457401; x=1752062201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ySQxi4dmRpAvA1kBsZv6GQ9Fptc40M943Jpm7fFzHjA=;
        b=I+NtmSMa7+GmOTp4H7/bxIW2Poa+NyPA52iGMdHQUpRA9vagcI/KZ/VTOla0qWL/Hv
         U+5cldphIu9wJCNZ+fPf9m3JXyBRkd4vXxe7B9cprWi97jwZdi+cfpWHrKgzRGcOtMQP
         aGzOQtNShw+41qIXopM/ldq4IsUtrdFowI6M52gsAlxGOpGtauFogZRnSnYrKydCUEeN
         20PbdMUq5WKBvHRXVNA/zXKyEvzFqDpqexhAsbdqRT/NDC8QOMNI5HqU6HqMCn52AyMQ
         +p5L45hS82Lkqtg+TKYjj+R7QYGrWKDw9TC0TtrPih57+SMqQhRAvimsxtu2c2apFP8/
         f8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457401; x=1752062201;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySQxi4dmRpAvA1kBsZv6GQ9Fptc40M943Jpm7fFzHjA=;
        b=i1eCtTKdPB1YK/DPZtxvsxLTpMt+WSUS0fIFAl7ejyBtsB98uFkUERZBPyt4ECfNfx
         7V2uWfuhKL32J049RqhJRNNCZE+9ZXjpXB457NvYanDRWIkj7/J0aAuaCXJfld9I8HX9
         PnkP0iXWqTz5v7n7HHbFgAgF3qJOmiqMZSpOKnWoEjU050V3KDbfJ0xKlru64uHH870p
         FNNiZGLiZn/Tj3HXzHKEu0Le6Yi/BF9hezeGvR7GHiurRhUWhL7b1QBvt7oQUPjPzMk5
         MTLq7gvbRd1hXpUJS818XZsLhOu//gyTmNRi3g8ctfKXBGSlYzsaYCFHXHXU0Iy8Du2f
         MfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNhPpVihIVG32aN/slE2zVGlVSPDEaNxsD6SDlT0ThDypLWU2Ga7E8baCt48jwINzE7mGco1Dn7ik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjwpuFXCPZNpEVsBuj+sqNQzIAo4qvk9elS3t/0yplv44bn2wB
	7v8uoq6Kgb5OxjKV/QFgXo+12Rd38uOFLkqT2PmO7iQqXm+nCuifCb8RlGyaCwxPoQ==
X-Gm-Gg: ASbGnctSvr5XzdMCocCiPFg4G0YrHnH9WpAsSFPFsApUqeT0OoK8k7Af9o3oHfJreX+
	oGv/HBmy5rPn5v08/QvMtnpsyQJzJ8+r3/fgIwKO5IJhFlVUgKaX8T2qNH2FFLW//cakXaiypCI
	wrhQhfpMDCP150hyMeImru22iKeOEGxYk5tPZSbas0j1ZBqkoO+EKXkvzERRAvVEZFOJ+hGfr7U
	lHWwXh5mT5HFEqbfmdeiWVHcKomVJpRhiMOOcMIlwINk+oisFx64arXl0HYyGHTLYBMUzDiiH7n
	cgXabMXH45KxhReLup2zZ0iaVQj39KNasgmG1Nmsc/USCKKZzOXT85rfhdhVrso5LpguQnNOeRP
	YPrDAHRJwwOa791OYHvRq1mt4/Ucl0JNoFAJSw5ICU4fa6e0=
X-Google-Smtp-Source: AGHT+IETFex8FRWAZue29tWCZ+zZn15DIlyB79MtV5P2Fs52/LYaMXlzgSsThf+KRVZqiAfnNcpZRQ==
X-Received: by 2002:a05:6000:4024:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b2013ee9c5mr1890431f8f.45.1751457400911;
        Wed, 02 Jul 2025 04:56:40 -0700 (PDT)
Message-ID: <cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com>
Date: Wed, 2 Jul 2025 13:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
 <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>
 <564d3ea1-d79a-490f-a756-78a55b2befda@gmail.com>
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
In-Reply-To: <564d3ea1-d79a-490f-a756-78a55b2befda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 13:48, Oleksii Kurochko wrote:
> On 7/1/25 3:04 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
>>>   
>>>       return 0;
>>>   }
>>> +
>>> +/*
>>> + * Set the pool of pages to the required number of pages.
>>> + * Returns 0 for success, non-zero for failure.
>>> + * Call with d->arch.paging.lock held.
>>> + */
>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>> +{
>>> +    struct page_info *pg;
>>> +
>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>> +
>>> +    for ( ; ; )
>>> +    {
>>> +        if ( d->arch.paging.p2m_total_pages < pages )
>>> +        {
>>> +            /* Need to allocate more memory from domheap */
>>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>>> +            if ( pg == NULL )
>>> +            {
>>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>> +        }
>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>> +        {
>>> +            /* Need to return memory to domheap */
>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>> +            if( pg )
>>> +            {
>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>> +                free_domheap_page(pg);
>>> +            }
>>> +            else
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +        }
>>> +        else
>>> +            break;
>>> +
>>> +        /* Check to see if we need to yield and try again */
>>> +        if ( preempted && general_preempt_check() )
>>> +        {
>>> +            *preempted = true;
>>> +            return -ERESTART;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> Btw, with the order-2 requirement for the root page table, you may want to
>> consider an alternative approach: Here you could allocate some order-2
>> pages (possibly up to as many as a domain might need, which right now
>> would be exactly one), put them on a separate list, and consume the root
>> table(s) from there. If you run out of pages on the order-0 list, you
>> could shatter a page from the order-2 one (as long as that's still non-
>> empty). The difficulty would be with freeing, where a previously shattered
>> order-2 page would be nice to re-combine once all of its constituents are
>> free again.
> 
> Do we really need to re-combine shattered order-2 pages?
> It seems like the only usage for this order-2-list is to have 1 order-2 page
> for root page table. All other pages are 4k pages so even if we won't re-combine
> them, nothing serious will happen.

That's true as long as you have only the host-P2M for each domain. Once you
have alternative or nested ones, things may change (unless they all have
their roots also set up right during domain creation, which would seem
wasteful to me).

>>   The main benefit would be avoiding the back and forth in patch
>> 6.
> 
> ...
> Can’t we just avoid putting the pages (which will get back) for the root page table into the
> freelist at all?

Again, this may be fine as long as there's only the host-P2M. That sole root
won't ever be freed anyway during the lifetime of a domain.

Jan

