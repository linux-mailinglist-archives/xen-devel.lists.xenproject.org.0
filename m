Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C7B14F83
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062807.1428548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglcp-00052t-F1; Tue, 29 Jul 2025 14:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062807.1428548; Tue, 29 Jul 2025 14:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglcp-00050O-Bu; Tue, 29 Jul 2025 14:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1062807;
 Tue, 29 Jul 2025 14:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uglco-00050F-Br
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:48:18 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3acf16-6c8b-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 16:48:16 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so3288146f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:48:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f328ce065sm1873018a91.20.2025.07.29.07.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:48:14 -0700 (PDT)
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
X-Inumbo-ID: 0f3acf16-6c8b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753800495; x=1754405295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1HPggrktndC4Faof3ZGDa9l7xL78GSRI5VVV+7VVG0Y=;
        b=OV5BRH4bQOHfaP0er2hZ2DpnR6+Ude7tCa/LsVkj/vs2ydeDlcrRlYFh6rSylx85eY
         GFM2u3+FBASssV43HUxWuutc6f/4YWNiWDobX9UrufJ56+yvJeQFb3WZFId2vRjTyL+S
         sfTx7iDis3FUoLBw+pXvDt5AuJnaIV5KEVlWTrIkKvOiX0ZbmHjLFNb+xIvWWBKzeaws
         dNReGz/qws9/te+b/l6K6nEmornxUBLoxIGqnR18prMg62aGDAo0tb+vIGRGVIKn1UG4
         eNZn1mOM3nic6tghRMT+vZT+0D+NszytxYhQNBdYmmJIGhuAJBgXNVZc/55AMbrqYUKY
         YEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800495; x=1754405295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HPggrktndC4Faof3ZGDa9l7xL78GSRI5VVV+7VVG0Y=;
        b=hzSanbihD1ZaYAd0JC08VGMcHmMVDGviwuUse407zkMNpxpQhc2BHUehLpqe45j+TV
         aEnsUDd7TT/TupNwCqnzL3jRNh/Qg/0o4exb4balNcfFt2VrjgNakXiF4X7UydvjQhwy
         VRg6TP38H1k/XMcPtmOVFAVw5t9MGM2pRrdOEn/uv2OaeEL/vphb6xjWYos0gkNUQYl6
         qqZmOUB6DUSLh+mhhx4e8rJt+6+GG3bmXJKUjgVzm3fMFI97BWtucINmC4VxqrLoB3vM
         +CjumMvqXKn8AnXYKzpEnfSdyuH8BNH9vUx2a6PC2G+lmO3aiHWdT7JdTJroS70EK+WO
         PXFw==
X-Forwarded-Encrypted: i=1; AJvYcCXtGw+7lsXIhshQD1eZbib3EpHsnm6viX9uF78LckVwpliA0hfIwiI5RujGWnrP++2P4KONEpYjB80=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWF6i8Hqv7uM43bBhJ864/SiuncF6z+6nHU51R89b6qi8I7vlq
	bX/PXpWzdp4gcVcB2caLK3fjpP9G0mm25axuixvt/WnQ4Lnsp2kNZ6BaZStqPHDvtA==
X-Gm-Gg: ASbGnctR1NqR0wM6DEO/6/UuNaD4fS+3Th5pRfBo49e8ABYi9Sv32N+U7PcFhBKFoh5
	NGdkxqut4NsSNc6Sk0N5Ow2lDzo46KYBCZa4GHi2uxmuwSM9lbZSrpxyD7072t29nbBBeGA3Mdw
	HePbtdNENy/Y/7X/alhR0PhAVTcfrevpzblF2IpDBot/4joVcf9HvOKE0NttJVVgtta0/CF4bp/
	gBPoVzBYLm9abNS4XwILQP6Qsu9XhgMWjUZQfEZMeWgGHhyTs8dt+5y0T/1i5hX71mh46njBRIK
	gXi2hJ6iZ+kj6EErwcSW8xs9wci11TFUduyqRV0hTv6l3xuxdK9UvJBnM9FBSi7TROE/gDiFbjd
	3q3GAQY80Dp7BcRGvnfPHC63RI9PXIY0p/zN/fosIfeHgQazQ/Vdash4LMyKdWIZxqCyfn0gx3j
	nuesRbTVg=
X-Google-Smtp-Source: AGHT+IEvmm9Sb//xUKs5PCjFu8A8y8GksdJ0Nc/NgikArFlm49yK+juzRECZWqR3s+rPRIWmgrwGiw==
X-Received: by 2002:a5d:64cf:0:b0:3b7:9350:d372 with SMTP id ffacd0b85a97d-3b79350d5d0mr1220637f8f.24.1753800495509;
        Tue, 29 Jul 2025 07:48:15 -0700 (PDT)
Message-ID: <de2119e5-e3f1-49dd-a810-13df11c282cc@suse.com>
Date: Tue, 29 Jul 2025 16:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
 <831c7c26-51e1-4834-b08e-03607cd438aa@suse.com>
 <9dfc64b3-7dda-4620-9da6-388cecc3b9ad@gmail.com>
 <b669f089-f0a1-4d46-a508-d8be8ea28975@suse.com>
 <52accd52-a363-4545-8e5c-0a5de3ca8eeb@gmail.com>
 <db9e161a-4eb4-4806-857a-abced7bad304@suse.com>
 <616c30ed-72c1-449d-bbe1-1ad263bb2d50@gmail.com>
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
In-Reply-To: <616c30ed-72c1-449d-bbe1-1ad263bb2d50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 15:47, Oleksii Kurochko wrote:
> 
> On 7/22/25 2:05 PM, Jan Beulich wrote:
>> On 22.07.2025 14:03, Oleksii Kurochko wrote:
>>> On 7/21/25 3:39 PM, Jan Beulich wrote:
>>>> On 18.07.2025 16:37, Oleksii Kurochko wrote:
>>>>> On 7/2/25 12:28 PM, Jan Beulich wrote:
>>>>>> On 02.07.2025 12:09, Jan Beulich wrote:
>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>>>>>>>     {
>>>>>>>>         return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>>>>     }
>>>>>>>> +
>>>>>>>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>>>>>>>> +{
>>>>>>>> +    ASSERT_UNREACHABLE();
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>>>>>>>> +                                                      unsigned long nr)
>>>>>>>> +{
>>>>>>>> +    unsigned long x, y = page->count_info;
>>>>>>>> +    struct domain *owner;
>>>>>>>> +
>>>>>>>> +    /* Restrict nr to avoid "double" overflow */
>>>>>>>> +    if ( nr >= PGC_count_mask )
>>>>>>>> +    {
>>>>>>>> +        ASSERT_UNREACHABLE();
>>>>>>>> +        return NULL;
>>>>>>>> +    }
>>>>>>> I question the validity of this, already in the Arm original: I can't spot
>>>>>>> how the caller guarantees to stay below that limit. Without such an
>>>>>>> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
>>>>>>> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
>>>>>>> any limit check.
>>>>>>>
>>>>>>>> +    do {
>>>>>>>> +        x = y;
>>>>>>>> +        /*
>>>>>>>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>>>>>> +         * Count == -1: Reference count would wrap, which is invalid.
>>>>>>>> +         */
>>>>>>> May I once again ask that you look carefully at comments (as much as at code)
>>>>>>> you copy. Clearly this comment wasn't properly updated when the bumping by 1
>>>>>>> was changed to bumping by nr.
>>>>>>>
>>>>>>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>>>>>>>> +            return NULL;
>>>>>>>> +    }
>>>>>>>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>>>>>>>> +
>>>>>>>> +    owner = page_get_owner(page);
>>>>>>>> +    ASSERT(owner);
>>>>>>>> +
>>>>>>>> +    return owner;
>>>>>>>> +}
>>>>>> There also looks to be a dead code concern here (towards the "nr" parameters
>>>>>> here and elsewhere, when STATIC_SHM=n). Just that apparently we decided to
>>>>>> leave out Misra rule 2.2 entirely.
>>>>> I think that I didn't get what is an issue when STATIC_SHM=n, functions is still
>>>>> going to be called through page_get_owner_and_reference(), at least, in page_alloc.c .
>>>> Yes, but will "nr" ever be anything other than 1 then? IOW omitting the parameter
>>>> would be fine. And that's what "dead code" is about.
>>> Got it.
>>>
>>> So we don't have any SAF-x tag to mark this function as safe. What is the best one
>>> solution for now if nr argument will be needed in the future for STATIC_SHM=y?
>> Add the parameter at that point. Just like was done for Arm.
> 
> Hmm, it seems like I am confusing something... Arm has the same defintion and declaration
> of page_get_owner_and_nr_reference().

But it didn't always have it. And there is at least one pending issue there.
Hence my request to use the simpler variant until someone actually makes
STATIC_SHM work on RISC-V. And hopefully by then the issue in Arm code is
sorted, and you can clone the code without raising questions.

Jan

