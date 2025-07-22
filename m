Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669AB0DECC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052767.1421537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueE68-0006yc-9T; Tue, 22 Jul 2025 14:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052767.1421537; Tue, 22 Jul 2025 14:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueE68-0006wF-6n; Tue, 22 Jul 2025 14:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1052767;
 Tue, 22 Jul 2025 14:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueE66-0006w9-35
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:36:02 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f761d3f-6709-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 16:35:59 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3930731f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:35:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6f19d0sm77463295ad.207.2025.07.22.07.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:35:58 -0700 (PDT)
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
X-Inumbo-ID: 2f761d3f-6709-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753194959; x=1753799759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RfKsqXCR8Of6DyttwfGxXrA/Nf+4b0zF2PB2KQPE5HU=;
        b=Ye9sL/vmuYsOD9D67prXWAGfskIi2Ee5iu6TDbDbMXDSJc76h1r63jJQ/0r3hPVm3C
         FHjj5jqaDUQ9iEYMo4wOPbqNLmQd7wtXKxUV2gwMCkm9G/WQvukMOpeF7LnEjmlF+Ej0
         CPYKaYehj4c5BuohMTsac8xy7oZzS45cZqaxxTwLeeBF5RgiwzG+mqBGdE6rUDTF+pDC
         nNpNRyZ/1CTEPiASmKdT6I2mHeNGxcsMJxniCsUuF3M75bK7amk6TfLtU43lZ6t6Nmi0
         lgGVq+JEoIOyVIYY6Gmjca+VGpZCaQD6PwKCM5socQR7Pl9nQXxFsDaqc4ZP7Xiq7HXb
         gZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194959; x=1753799759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfKsqXCR8Of6DyttwfGxXrA/Nf+4b0zF2PB2KQPE5HU=;
        b=en/CC20ZUdes0ezrMwZh/nHrxv9Ql+VbOAfziROdSpZs9tvT4Gw49u+mcgMBNp1s97
         3rj0yi1eLucS1s2yMmi8L2vzRXE02Ahkj+Hcpq01zrcihKzEUp7XWdymbkyBnBglxzv0
         r/HNNq0ZMJABf12tsly0bK2UHjwkTa6pQJHZohBq4HD2uN7x5IIi36+L0SUlQ2anTWJk
         Ej50Fy2BjUyeKiLrOtmSDBTMABI3Hn/06s+Vnmpa9Klj8c+f9eyz9k6UIPauAWrfDsoP
         z26n1tLZydNWvtGxv3F9eqGE9zfSd70G9vGso9njVldqUz6tzhYtVjjW+q80DH6FgcNj
         YUFg==
X-Forwarded-Encrypted: i=1; AJvYcCXTQFVLI85LXUCCww/vac5BFWDUEpQ2sB9cIV20XxkLzoBoczuuF7XDUrjqehQGHn2nPUeTnqIkg3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbvyOM9unN7XF/6aqGHIY+IPw7UhapFKo2MB7Y1zzbZgUfZQqE
	6aMTBw1q61UO2FuFicOzHX8b2Q6/KcW8lLSI1rK6k7doT5JuiRH2zVZhy7JbLrOPYQ==
X-Gm-Gg: ASbGncvPtpYYHjXG83HKwk0yfl6Kwvd1Gtj8enncgOhZ+htk0OjMNLX732oMGL9oqQv
	3pylOYYdruFTJmjcjdmGel5Oforzvrb0l6QnXW1k3Ir3tJOonCh8V9XZIlRlGURgQnJzdT6InDE
	yRoSZsPrICLh+qX39zxa7YYS2hSysQLWGbGLHFZrBp+B4pefkfBdtP5aW2XwlUiqj3LZv84jI2d
	sv8Onm3//TYqlULmD/4DK77cLAleX2Mmwz7YLwsoL8PCZ1ImGFnHZPOWIpDckGBc/YEwEeEwFBF
	wYskE+aY9pp3EyGNrGWzLPOqr1/6EiTGj76FESfc6/MvOf4nw8p/e30VJmLl2lMJwV/po/OFfDS
	9KTdqg8Zt4CdnaRj8Lod8tPLLrVp5Hw8g8CkwSW7jVe3yAwA7pAFxywW3oAZ2fq+d0swMGD9cB5
	1sN1QAczOBfiCYOVHkqw==
X-Google-Smtp-Source: AGHT+IFhc/RY0ji4vhUEEFh9btqYbs2Us+UOo6jeenWdFc56xgI+OPkUJeR+jNMHSBH0JX9wP9LK0g==
X-Received: by 2002:a05:6000:40ce:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b60e4be28fmr18655054f8f.2.1753194959042;
        Tue, 22 Jul 2025 07:35:59 -0700 (PDT)
Message-ID: <7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com>
Date: Tue, 22 Jul 2025 16:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
 <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
 <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
 <9e9c1943-b2af-471f-b8c9-f7179073ef99@suse.com>
 <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
 <f110cd42-d34b-44fc-bd76-85cb0bfc2357@gmail.com>
 <25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com>
 <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
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
In-Reply-To: <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2025 16:25, Oleksii Kurochko wrote:
> On 7/22/25 2:00 PM, Jan Beulich wrote:
>> On 22.07.2025 13:34, Oleksii Kurochko wrote:
>>> On 7/22/25 12:41 PM, Oleksii Kurochko wrote:
>>>> On 7/21/25 2:18 PM, Jan Beulich wrote:
>>>>> On 18.07.2025 11:52, Oleksii Kurochko wrote:
>>>>>> On 7/17/25 12:25 PM, Jan Beulich wrote:
>>>>>>> On 17.07.2025 10:56, Oleksii Kurochko wrote:
>>>>>>>> On 7/16/25 6:18 PM, Jan Beulich wrote:
>>>>>>>>> On 16.07.2025 18:07, Oleksii Kurochko wrote:
>>>>>>>>>> On 7/16/25 1:31 PM, Jan Beulich wrote:
>>>>>>>>>>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>>>>>>>>>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>>>>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>>>>>>>>>>            return __map_domain_page(p2m->root + root_table_indx);
>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>        
>>>>>>>>>>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>>>>>>>>>>> See comments on the earlier patch regarding naming.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +    int rc;
>>>>>>>>>>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>>>>>>>>>>> How does this work, when you record GFNs only for Xenheap pages?
>>>>>>>>>>>> I think I don't understand what is an issue. Could you please provide
>>>>>>>>>>>> some extra details?
>>>>>>>>>>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>>>>>>>>>>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>>>>>>>>>>> of the function, making it possible to use it here?
>>>>>>>>>> At the moment, I planned to support only 1:1 mapped domains, so it is final
>>>>>>>>>> implementation.
>>>>>>>>> Isn't that on overly severe limitation?
>>>>>>>> I wouldn't say that it's a severe limitation, as it's just a matter of how
>>>>>>>> |mfn_to_gfn()| is implemented. When non-1:1 mapped domains are supported,
>>>>>>>> |mfn_to_gfn()| can be implemented differently, while the code where it’s called
>>>>>>>> will likely remain unchanged.
>>>>>>>>
>>>>>>>> What I meant in my reply is that, for the current state and current limitations,
>>>>>>>> this is the final implementation of|mfn_to_gfn()|. But that doesn't mean I don't
>>>>>>>> see the value in, or the need for, non-1:1 mapped domains—it's just that this
>>>>>>>> limitation simplifies development at the current stage of the RISC-V port.
>>>>>>> Simplification is fine in some cases, but not supporting the "normal" way of
>>>>>>> domain construction looks like a pretty odd restriction. I'm also curious
>>>>>>> how you envision to implement mfn_to_gfn() then, suitable for generic use like
>>>>>>> the one here. Imo, current limitation or not, you simply want to avoid use of
>>>>>>> that function outside of the special gnttab case.
>>>>>>>
>>>>>>>>>>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>>>>>>>>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>>>>>>>>>>> making Xen insert very many entries?
>>>>>>>>>>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>>>>>>>>>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>>>>>>>>>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>>>>>>>>>>> Which would require these allocations to come from that pool.
>>>>>>>>>> Yes, and it is true only for non-hardware domains with the current implementation.
>>>>>>>>> ???
>>>>>>>> I meant that pool is used now only for non-hardware domains at the moment.
>>>>>>> And how does this matter here? The memory required for the radix tree doesn't
>>>>>>> come from that pool anyway.
>>>>>> I thought that is possible to do that somehow, but looking at a code of
>>>>>> radix-tree.c it seems like the only one way to allocate memroy for the radix
>>>>>> tree isradix_tree_node_alloc() -> xzalloc(struct rcu_node).
>>>>>>
>>>>>> Then it is needed to introduce radix_tree_node_allocate(domain)
>>>>> That would be a possibility, but you may have seen that less than half a
>>>>> year ago we got rid of something along these lines. So it would require
>>>>> some pretty good justification to re-introduce.
>>>>>
>>>>>> or radix tree
>>>>>> can't be used at all for mentioned in the previous replies security reason, no?
>>>>> (Very) careful use may still be possible. But the downside of using this
>>>>> (potentially long lookup times) would always remain.
>>>> Could you please clarify what do you mean here by "(Very) careful"?
>>>> I thought about an introduction of an amount of possible keys in radix tree and if this amount
>>>> is 0 then stop domain. And it is also unclear what should be a value for this amount.
>>>> Probably, you have better idea.
>>>>
>>>> But generally your idea below ...
>>>>>>>>>>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>>>>>>>>>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>>>>>>>>>>> Or one domain exhausting memory would cause another domain to fail. A domain
>>>>>>>>>>> impacting just itself may be tolerable. But a domain affecting other domains
>>>>>>>>>>> isn't.
>>>>>>>>>> But it seems like this issue could happen in any implementation. It won't happen only
>>>>>>>>>> if we will have only pre-populated pool for any domain type (hardware, control, guest
>>>>>>>>>> domain) without ability to extend them or allocate extra pages from domheap in runtime.
>>>>>>>>>> Otherwise, if extra pages allocation is allowed then we can't really do something
>>>>>>>>>> with this issue.
>>>>>>>>> But that's why I brought this up: You simply have to. Or, as indicated, the
>>>>>>>>> moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
>>>>>>>> Why it isn't XSA for other architectures? At least, Arm then should have such
>>>>>>>> XSA.
>>>>>>> Does Arm use a radix tree for storing types? It uses one for mem-access, but
>>>>>>> it's not clear to me whether that's actually a supported feature.
>>>>>>>
>>>>>>>> I don't understand why x86 won't have the same issue. Memory is the limited
>>>>>>>> and shared resource, so if one of the domain will use to much memory then it could
>>>>>>>> happen that other domains won't have enough memory for its purpose...
>>>>>>> The question is whether allocations are bounded. With this use of a radix tree,
>>>>>>> you give domains a way to have Xen allocate pretty much arbitrary amounts of
>>>>>>> memory to populate that tree. That unbounded-ness is the problem, not memory
>>>>>>> allocations in general.
>>>>>> Isn't radix tree key bounded to an amount of GFNs given for a domain? We can't have
>>>>>> more keys then a max GFN number for a domain. So a potential amount of necessary memory
>>>>>> for radix tree is also bounded to an amount of GFNs.
>>>>> To some degree yes, hence why I said "pretty much arbitrary amounts".
>>>>> But recall that "amount of GFNs" is a fuzzy term; I think you mean to
>>>>> use it to describe the amount of memory pages given to the guest. GFNs
>>>>> can be used for other purposes, though. Guests could e.g. grant
>>>>> themselves access to their own memory, then map those grants at
>>>>> otherwise unused GFNs.
>>>>>
>>>>>> Anyway, IIUC I just can't use radix tree for p2m types at all, right?
>>>>>> If yes, does it make sense to borrow 2 bits from struct page_info->type_info as now it
>>>>>> is used 9-bits for count of a frame?
>>>>> struct page_info describes MFNs, when you want to describe GFNs. As you
>>>>> mentioned earlier, multiple GFNs can in principle map to the same MFN.
>>>>> You would force them to all have the same properties, which would be in
>>>>> direct conflict with e.g. the grant P2M types.
>>>>>
>>>>> Just to mention one possible alternative to using radix trees: You could
>>>>> maintain a 2nd set of intermediate "page tables", just that leaf entries
>>>>> would hold meta data for the respective GFN. The memory for those "page
>>>>> tables" could come from the normal P2M pool (and allocation would thus
>>>>> only consume domain-specific resources). Of course in any model like
>>>>> this the question of lookup times (as mentioned above) would remain.
>>>> ...looks like an optimal option.
>>>>
>>>> The only thing I worry about is that it will require some code duplication
>>>> (I will think how to re-use the current one code), as for example, when
>>>> setting/getting metadata, TLB flushing isn’t needed at all as we aren't
>>>> working with with real P2M page tables.
>>>> Agree that lookup won't be the best one, but nothing can be done with
>>>> such models.
>>> Probably, instead of having a second set of intermediate "page tables",
>>> we could just allocate two consecutive pages within the real P2M page
>>> tables for the intermediate page table. The first page would serve as
>>> the actual page table to which the intermediate page table points,
>>> and the second page would store metadata for each entry of the page
>>> table that the intermediate page table references.
>>>
>>> As we are supporting only 1gb, 2mb and 4kb mappings we could do a little
>>> optimization and start allocate these consecutive pages only for PT levels
>>> which corresponds to 1gb, 2mb, 4kb mappings.
>>>
>>> Does it make sense?
>> I was indeed entertaining this idea, but I couldn't conclude for myself if
>> that would indeed be without any rough edges. Hence I didn't want to
>> suggest such. For example, the need to have adjacent pairs of pages could
>> result in a higher rate of allocation failures (while populating or
>> re-sizing the P2M pool). This would be possible to avoid by still using
>> entirely separate pages, and then merely linking them together via some
>> unused struct page_info fields (the "normal" linking fields can't be used,
>> afaict).
> 
> I think that all the fields are used, so it will be needed to introduce new
> "struct page_list_entry metadata_list;".

All the fields are used _somewhere_, sure. But once you have allocated a
page (and that page isn't assigned to a domain), you control what the
fields are used for. Or else enlisting pages on private lists wouldn't be
legitimate either.

> Can't we introduce new PGT_METADATA type and then add metadata page to
> struct page_info->list and when a metadata will be needed just iterate through
> page_info->list and find a page with PGT_METADATA type?

I'd be careful with the introduction of new page types. All handling of
page types everywhere in the (affected part of the) code base would then
need auditing.

Jan

