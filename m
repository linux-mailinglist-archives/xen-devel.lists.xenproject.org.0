Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F82AEFC44
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 16:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029782.1403521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbyJ-0005dd-KA; Tue, 01 Jul 2025 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029782.1403521; Tue, 01 Jul 2025 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbyJ-0005bv-H2; Tue, 01 Jul 2025 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1029782;
 Tue, 01 Jul 2025 14:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWbyI-0005bo-0q
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 14:28:30 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8193c57-5687-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 16:28:29 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so2913639f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 07:28:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3d27dbsm105209075ad.256.2025.07.01.07.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 07:28:27 -0700 (PDT)
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
X-Inumbo-ID: a8193c57-5687-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751380108; x=1751984908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0e4KoCr0/cojJAjT3qPaoLchvh1yamFGOKsgeDqwBB8=;
        b=K6jE/shIc/9afqd9cR2Ue4Vg+7AZ3p9FTtJFveduACauhsrwqueHI0xstDTLQwFn1T
         oyeuw6nj2wCQLrNmcPBPudqEYVm/WkwxNZ/cQTr4vjVhbjBmOKT9NuwasCArJfQqP8QY
         +rGlMCA5G1RQde4Pxt3MQfwy0JUqwxokSTbHt+yzoblTL3ULqa/eqfhOvbO9kqP+QLKy
         gdY6pn0MAMsMi+wJPf2CCJUIXbXdzu/FXx4hCRzu/yQ70WPsVAp6oNdA1ykZMJCpeA6T
         dEDuvoK7/LFhSDOLHrLMhxHyBQpKK+KqaGp/9D3nb2iRifDbAVIwu5bctXyhRqgQ8XWS
         RyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380108; x=1751984908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e4KoCr0/cojJAjT3qPaoLchvh1yamFGOKsgeDqwBB8=;
        b=nQ9d3p9gn9R1jv9kFT1W44iZ7SfuTfmhLgldi3oFnsT0vBUY74j+BlKhpemYHSw9fq
         KPOT7BlqnBxO/rOz4ep8Z4mNra0hNR23uvN3cb7jCeNs1yc1LyqEM4tQLqp3ZJ0iA9p6
         5UhfWPfzpTkLXsuvIdEo8mnvXUZ441EeG4t3oSVr7UpvLN9MQveYrwpRqqhlI2+1QSqB
         18SG/26IApHN0/3+GGofgv2BRknIDFDGLEklLNiZpVOrLLYhVVfc8Y/rRra4LzO1xGm3
         01SMm/x+JfI3U7ziI/hhtAfngwyqlRdimTjrZXYxw1tKdpB4spPCBOf9uxLW62NS1y9V
         D3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWxsi7NcstlezeGD/8y0dBNZ1UwGxG+WQb5YvPLo1YG/uOBV4uj2c7tdxF+AcnQKbYUbCj0CXeY+QM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw15H13WrPO/rOwMZHOmDcNKNGyFrvXNL8jQAtm5KQ17GzE6bTs
	BzldpN3W2w9/AST39pzzO7wJVm4/iAbB5eycCbSSzoK3f9YQ8edfdHg43jTOOw3IGg==
X-Gm-Gg: ASbGncs/kpiJjKnGts6fT6OoJ0ElF7H2Y8hDIax0vhXfM9Mlqf5p6mmvCTV+ZM6nrcI
	EtAtUcv8DlYeKe5QfYvOKR7qvBCVY0gOC1IhL30SekGm2BZXopEEIPMuUAeJNAQE1RI+UmpXF6Z
	tHEzrTxCtOMOmah7E9cXj1pLSJ2jz/oy5nrFeMz2sszv6gEyaJOG8gOMrSspYMvdqjWCx2xfFvx
	uuovnfZ0mszTcC71zvfa+NpnZg2N5etZbTcAZBhuN7FR72DQo8yPpYvijFO+VUrmu9bFQOkQerf
	2hHmlfx27eOdY5cl46RrDY6YEyfJn5juePmWismDh7YKokWaZZ5NNgn6dtww7UF59tsymecdIg0
	rv75XrxjjWhhCJOUoTZ0qsrmQVqM/mIjqz9XMGDdru2W1xbU1X87PMqkZ3A==
X-Google-Smtp-Source: AGHT+IGYGgqvF0GnjfrPmstiaXAVaKKkcw1C/LyvKgcFIxYHDhupMhMpYPn2FnJwUrw6VJhfoewQOw==
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr11854155f8f.48.1751380108364;
        Tue, 01 Jul 2025 07:28:28 -0700 (PDT)
Message-ID: <a4701b32-602f-4557-a8cb-1b5090c6b618@suse.com>
Date: Tue, 1 Jul 2025 16:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
 <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>
 <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
 <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>
 <55144da9-cf8e-4b73-8817-e72d8ff91019@gmail.com>
 <b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com>
 <a30141b2-1b02-482c-b6dd-a017d976fdc1@gmail.com>
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
In-Reply-To: <a30141b2-1b02-482c-b6dd-a017d976fdc1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 16:02, Oleksii Kurochko wrote:
> On 7/1/25 12:27 PM, Jan Beulich wrote:
>> On 01.07.2025 11:44, Oleksii Kurochko wrote:
>>> On 7/1/25 8:29 AM, Jan Beulich wrote:
>>>> On 30.06.2025 18:18, Oleksii Kurochko wrote:
>>>>> On 6/30/25 5:22 PM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>>>>>>         write_unlock(&p2m->lock);
>>>>>>>     }
>>>>>>>     
>>>>>>> +static void clear_and_clean_page(struct page_info *page)
>>>>>>> +{
>>>>>>> +    clean_dcache_va_range(page, PAGE_SIZE);
>>>>>>> +    clear_domain_page(page_to_mfn(page));
>>>>>>> +}
>>>>>> A function of this name can, imo, only clear and then clean. Question is why
>>>>>> it's the other way around, and what the underlying requirement is for the
>>>>>> cleaning part to be there in the first place. Maybe that's obvious for a
>>>>>> RISC-V person, but it's entirely non-obvious to me (Arm being different in
>>>>>> this regard because of running with caches disabled at certain points in
>>>>>> time).
>>>>> You're right, the current name|clear_and_clean_page()| implies that clearing
>>>>> should come before cleaning, which contradicts the current implementation.
>>>>> The intent here is to ensure that the page contents are consistent in RAM
>>>>> (not just in cache) before use by other entities (guests or devices).
>>>>>
>>>>> The clean must follow the clear — so yes, the order needs to be reversed.
>>>> What you don't address though - why's the cleaning needed in the first place?
>>> If we clean the data cache first, we flush the d-cache and then use the page to
>>> perform the clear operation. As a result, the "cleared" value will be written into
>>> the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
>>> sequence is to clear the page first, then clean the data cache.
>> If you want to avoid cache pollution, I think you'd need to use a form of stores
>> which simply bypass the cache. Yet then - why would this matter here, but not
>> elsewhere? Wouldn't you better leave such to the hardware, unless you can prove
>> a (meaningful) performance gain?
> 
> I thought about a case when IOMMU doesn't support coherent walks and p2m tables are
> shared between CPU and IOMMU. Then my understanding is:
> - clear_page(p) just zero-ing a page in a CPU's cache.
> - But IOMMU can see old data or uninitialized, if they still in cache.
> - So, it is need to do clean_cache() to writeback data from cache to RAM, before a
>    page will be used as a part of page table for IOMMU.

Okay, so this is purely about something that doesn't matter at all for now
(until IOMMU support is introduced). Fair enough then to play safe from the
beginning.

>>>>>>> +    unsigned int nr_pages = _AC(1,U) << order;
>>>>>> Nit (style): Missing blank after comma.
>>>>> I've changed that to BIT(order, U)
>>>>>
>>>>>>> +    /* Return back nr_pages necessary for p2m root table. */
>>>>>>> +
>>>>>>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>>>>>>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
>>>>>> You shouldn't panic() in anything involved in domain creation. You want to
>>>>>> return NULL in this case.
>>>>> It makes sense in this case just to return NULL.
>>>>>
>>>>>> Further, to me the use of "more" looks misleading here. Do you perhaps mean
>>>>>> "larger" or "bigger"?
>>>>>>
>>>>>> This also looks to be happening without any lock held. If that's intentional,
>>>>>> I think the "why" wants clarifying in a code comment.
>>>>> Agree, returning back pages necessary for p2m root table should be done under
>>>>> spin_lock(&d->arch.paging.lock).
>>>> Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
>>>> (As long as you mean to have that separation, that is. See the earlier discussion
>>>> on that matter.)
>>> Then partly p2m_set_allocation() should be moved to paging_*() too.
>> Not exactly sure what you mean. On x86 at least the paging layer part of
>> the function is pretty slim.
> 
> I meant that part of code which is spin_lock(&d->arch.paging.lock); ... spin_unlock(&d->arch.paging.lock)
> in function p2m_set_allocation() should be moved somewhere to paging_*() layer for the same logic as you
> suggested to move part of  p2m_allocate_root()'s code which is guarded by d->arch.paging.lock to
> paging_*() layer.

Yes, of course.

Jan

