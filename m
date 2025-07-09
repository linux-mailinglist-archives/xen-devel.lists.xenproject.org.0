Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40CDAFE2F5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037905.1410408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQMp-0004WQ-5R; Wed, 09 Jul 2025 08:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037905.1410408; Wed, 09 Jul 2025 08:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQMp-0004UO-2P; Wed, 09 Jul 2025 08:41:27 +0000
Received: by outflank-mailman (input) for mailman id 1037905;
 Wed, 09 Jul 2025 08:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZQMn-0004UH-Dr
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:41:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e8dcdc0-5ca0-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:41:23 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4537fdec33bso33170005e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 01:41:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c30038076sm1401285a91.3.2025.07.09.01.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 01:41:22 -0700 (PDT)
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
X-Inumbo-ID: 7e8dcdc0-5ca0-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752050483; x=1752655283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SbhZi/j49mkL0FFmM9+F5phvOWHzyv5z6tJzlHgQLrE=;
        b=ak9o/V2ZOhbcZJFcqkzAwW2ewugvom+6T9hxD1HX2uzXbSUOViAVjibFkK+fxz9eqr
         uaWQT5U1QdX836e26UDWgMwYVXsp9parVgr/b+2T/kqhwo7EJylFncuscS2P0Nn2o4Ir
         OMC8Wz79a8Z3EaZq54Moe8gWa19kx3FQcQ4fJBRaVGoqGT7V1eBzSvjMNw5VrDkrzJd2
         s2epJ/P1L8cges8QH4eH6wS19aoKcxQH8Ej1iB4Lyp9OV2ydF1533O2zcmu4DgW6/ANV
         I1dMl0qvPcHO8D/+srHcMZlBSc0oAOuGlHyEmduPasWwD1fU9/ZbW3X+K67lpai4DDuF
         C3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752050483; x=1752655283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbhZi/j49mkL0FFmM9+F5phvOWHzyv5z6tJzlHgQLrE=;
        b=v1IRKhr4z25Iz20G+Ggzzj5d0w+2/UfexwDvNXXIND+tmtQDv76KNPpc8H9sPJkwjz
         j3SUr/d8RBjavO4xgbOvCbgh/J21/FfVffuTsGDIEtq5xx3IVVsjpmK1KJ4mBR5TUyr2
         sNND9ouuyaD/BSOEpwvKTDTKVLRA9vklK6Ks1zdWZlXqGMGSS7WLxP/AqOis02pshXjF
         21wII0AaNzv0bq/QVV7HXerRNAa5nwgpyJkM5DiRlA86HPtlcHS3uiY4+cn9XkC1qSfV
         kIFD7CYNlMRrJ6GJ1oc70sGTprDGd9HNNiJxHY1VErDPbv/5Yxjmb56acPlHErQctscn
         AdJw==
X-Forwarded-Encrypted: i=1; AJvYcCUOef/SfU/IzeNFu8Xd4GHWSp1s0TGyZsW/PpKL/L3Gg22UhxD3H+VMDh2R/X7o2IASViX1i0grWsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzopvrl1qs7Ul9NyepjJIBSEfpisd4RwkNiwq+IdSZYLevuFIm7
	nKsV0zoemi9+pzGxF8l/B6UcY4vXKSdUedER94fk0Ao4zsev21Tb4V26upAHcZ/eUA==
X-Gm-Gg: ASbGncubSUhWxa9PdZI0BCjU0u0e7xTkcglpImmO5Z2YlJOCs8ggzgKdf55LSObjSFu
	6sIeyYI2adlQ50A31JTagBWZ88T9uTNy9ffsxbqQooaLZz8BvwXDQ964Y8APV5ar8jJg68o4SW3
	8DSF72c/ZEVVlt0H7bvhE7tFBi+jDOP4U2wUQTape78ppCue2ACMrPDuzF74bVU2/kJTATR5XR1
	U+n9OY05u9RUcofKZK8l/zKzpg7btxQweysIW7usn6b/aiV8S+DpnQ43lv1QkeGvSlalEevG/85
	fVCyKRgFNledpf4A0FjODXrHLJdPgpC8YayGtVfNnlX12ECrDsBdQuTNond9GrKKb3bdTOGzpnh
	+pR86izxUf//SGiS67DLhQhc2QxbiBGxuFh/jOhZvBOHez9c=
X-Google-Smtp-Source: AGHT+IEBs1mx2P3JcIM0F3aMto4N7wTvwl+LYavQqz5Z+DUYoCiiDkaVVvu9k0emqecH1WpmC+wWrg==
X-Received: by 2002:a5d:588b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3b5e44e3ed6mr1161595f8f.16.1752050482978;
        Wed, 09 Jul 2025 01:41:22 -0700 (PDT)
Message-ID: <479c44c7-4cff-436e-9a46-934b9a92579e@suse.com>
Date: Wed, 9 Jul 2025 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
 <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>
 <674c9f82-f486-4cca-991b-3ac3da3a237d@gmail.com>
 <2afe5641-0790-4f27-823b-ab941ad2c971@suse.com>
 <82362709-c386-485e-935c-e229e735fba6@gmail.com>
 <cec77342-367c-41fe-abaf-b7e04309ca63@suse.com>
 <8036ddb2-f223-41f5-a498-75b483c237bb@gmail.com>
 <6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com>
 <8f166b5d-eed3-4695-a0e9-ba8fc8a2b9b2@gmail.com>
 <409cdade-192d-47dc-941d-9256bfa53cea@suse.com>
 <65aaf77e-85fe-4934-a485-710aff59f4eb@gmail.com>
 <05b789f0-7064-4ec3-9e0c-ba528a30d315@gmail.com>
 <61773bca-32f7-42ee-867f-80dc8a389bef@suse.com>
 <dd73f1ed-e2cb-40c5-ad06-bd390467e128@gmail.com>
 <7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com>
 <a37e790b-90f6-40c1-8984-564951650ef2@gmail.com>
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
In-Reply-To: <a37e790b-90f6-40c1-8984-564951650ef2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2025 10:24, Oleksii Kurochko wrote:
> 
> On 7/8/25 6:04 PM, Jan Beulich wrote:
>> On 08.07.2025 17:42, Oleksii Kurochko wrote:
>>> On 7/8/25 2:45 PM, Jan Beulich wrote:
>>>> On 08.07.2025 12:37, Oleksii Kurochko wrote:
>>>>> On 7/8/25 11:01 AM, Oleksii Kurochko wrote:
>>>>>> On 7/8/25 9:10 AM, Jan Beulich wrote:
>>>>>>> On 07.07.2025 18:10, Oleksii Kurochko wrote:
>>>>>>>> On 7/7/25 5:15 PM, Jan Beulich wrote:
>>>>>>>>> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>>>>>>>>>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>>>>>>>>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>>>>>>>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>>>>>>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>>>>>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +    return false;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>>>>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>>>>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>>>>>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>>>>>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>>>>>>>>>          /*
>>>>>>>>>>>>>>           * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>>>>>>>>>           * the type to check whether an entry is valid.
>>>>>>>>>>>>>>           */
>>>>>>>>>>>>>>          static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>>>>>>>>          {
>>>>>>>>>>>>>>              return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> It is done to track which page was modified by a guest.
>>>>>>>>>>>>> But then (again) the name doesn't convey what the function does.
>>>>>>>>>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>>>>>>>>>> For P2M type checks please don't invent new naming, but use what both x86
>>>>>>>>>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>>>>>>>>>> set. Just that it's not doing what you want here.
>>>>>>>>>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>>>>>>>>>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>>>>>>>>>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>>>>>>>>>> free bits for type).
>>>>>>>>> Because this is how it's defined on x86:
>>>>>>>>>
>>>>>>>>> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>>>>>>>>>                                  (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>>>>>>>>>
>>>>>>>>> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
>>>>>>>>> would better be uniform across architectures, such that in principle they
>>>>>>>>> might also be usable in common code (as we already do with p2m_is_foreign()).
>>>>>>>> Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
>>>>>>>> x86 and Arm have different understanding what is valid.
>>>>>>>>
>>>>>>>> Except what mentioned in the comment that grant types aren't considered valid
>>>>>>>> for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
>>>>>>>> p2m_is_valid() is stricter then Arm's one and if other arches should be also
>>>>>>>> so strict.
>>>>>>> Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
>>>>>>> could also consider x86'es to require a better name). It's a local helper, not
>>>>>>> a P2M type checking predicate. With that in mind, you may of course follow
>>>>>>> Arm's model, but in the longer run we may need to do something about the name
>>>>>>> collision then.
>>>>>>>
>>>>>>>>>> The only use case I can think of is that the caller
>>>>>>>>>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>>>>>>>>>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>>>>>>>>>> issue, and retrying would probably result in the same error.
>>>>>>>>>>
>>>>>>>>>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>>>>>>>>>> array to track all modified PTEs and then use it to revert the state if needed.
>>>>>>>>>> But again, what would the caller do after the rollback? At this point, it still seems
>>>>>>>>>> like the best option is simply to|panic(). |
>>>>>>>>>>
>>>>>>>>>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>>>>>>>>>> successfully mapped, or whether a rollback was performed, would really help — because
>>>>>>>>>> in most cases, I don’t have a better option than just calling|panic()| at the end.
>>>>>>>>> panic()-ing is of course only a last resort. Anything related to domain handling
>>>>>>>>> would better crash only the domain in question. And even that only if suitable
>>>>>>>>> error handling isn't possible.
>>>>>>>> And if there is no still any runnable domain available, for example, we are creating
>>>>>>>> domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
>>>>>>>> If yes, then it is enough to return only error code without returning how many GFNs were
>>>>>>>> mapped or rollbacking as domain won't be ran anyway.
>>>>>>> During domain creation all you need to do is return an error. But when you write a
>>>>>>> generic function that's also (going to be) used at domain runtime, you need to
>>>>>>> consider what to do there in case of partial success.
>>>>>>>
>>>>>>>>>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>>>>>>>>>> tree node, and the mapping fails partway through, I’m left with two options: either
>>>>>>>>>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>>>>>>>>>       booting; in which case I’d need to perform a rollback, and simply knowing the number
>>>>>>>>>> of successfully mapped GFNs may not be enough or, more likely, just panic.
>>>>>>>>> Well, no. For example, before even trying to map you could check that the range
>>>>>>>>> of P2M entries covered is all empty.
>>>>>>>> Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
>>>>>>>> just do a mapping, right?
>>>>>>> Possibly that would simply mean to return an error, yes.
>>>>>>>
>>>>>>>> Won't be this procedure consume a lot of time as it is needed to go through each page
>>>>>>>> tables for each entry.
>>>>>>> Well, you're free to suggest a clean alternative without doing so.
>>>>>> I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
>>>>>> and then use it to roll back if __p2m_set_entry() returns rc != 0 ...
>>>> That's another possible source for failure, and such an allocation may end
>>>> up being a rather big one.
>>>>
>>>>>>>>>      _Then_ you know how to correctly roll back.
>>>>>>>>> And yes, doing so may not even require passing back information on how much of
>>>>>>>>> a region was successfully mapped.
>>>>>>>> If P2M entries were empty before start of the mapping then it is enough to just go
>>>>>>>> through the same range (sgfn,nr,smfn) and just clean them, right?
>>>>>>> Yes, what else would "roll back" mean in that case?
>>>>>> ... If we know that the P2M entries were empty, then there's nothing else to be done, just
>>>>>> clean PTE is needed to be done.
>>>>>> However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
>>>>>> case), then rolling back would mean restoring their original state, the state they
>>>>>> had before the P2M mapping procedure started.
>>>>> Possible roll back is harder to implement as expected because there is a case where subtree
>>>>> could be freed:
>>>>>        /*
>>>>>         * Free the entry only if the original pte was valid and the base
>>>>>         * is different (to avoid freeing when permission is changed).
>>>>>         */
>>>>>        if ( p2me_is_valid(p2m, orig_pte) &&
>>>>>             !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
>>>>>            p2m_free_subtree(p2m, orig_pte, level);
>>>>> In this case then it will be needed to store the full subtree.
>>>> Right, which is why it may be desirable to limit the ability to update multiple
>>>> entries in one go. Or work from certain assumptions, violation of which would
>>>> cause the domain to be crashed.
>>> It seems to me that the main issue with updating multiple entries in one go is the rollback
>>> mechanism in case of a partial mapping failure. (other issues? mapping could consume a lot
>>> of time so something should wait while allocation will end?) In my opinion, the rollback
>>> mechanism is quite complex to implement and could become a source of further failures.
>>> For example, most of the cases where p2m_set_entry() could fail are due to failure in
>>> mapping the page table (to allow Xen to walk through it) or failure in creating a new page
>>> table due to memory exhaustion. Then, during rollback, which might also require memory
>>> allocation, we could face the same memory shortage issue.
>>> And what should be done in that case?
>>>
>>> In my opinion, the best option is to simply return from p2m_set_entry() the number of
>>> successfully mapped GFNs (stored in rc which is returned by p2m_set_entry()) and let
>>> the caller decide how to handle the partial mapping:
>>> 1. If a partial mapping occurs during domain creation, we could just report that this
>>>      domain can't be created and continue without it if there are other domains to start;
>>>      otherwise, panic.
>> I don't see how panic()-ing is relevant here. That's to be decided (far) up
>> the call stack.
> 
> So it's just a question of whether the caller should panic() or propagate the return
> value (error code) up the call stack.
> 
> For example, in case of domain construction return value is propogate almost to  the top
> of the stack:
>    p2m_set_entry(p2m_access_t a, p2m_type_t t, mfn_t smfn, unsigned long nr, gfn_t sgfn, struct p2m_domain * p2m) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1005)
>    p2m_insert_mapping(struct domain * d, gfn_t start_gfn, unsigned long nr, mfn_t mfn, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1055)
>    guest_physmap_add_entry(struct domain * d, gfn_t gfn, mfn_t mfn, unsigned long page_order, p2m_type_t t) (/run/media/ok/blue_disk//xen/xen/arch/riscv/p2m.c:1076)
>    guest_physmap_add_page(unsigned int page_order, struct domain * d) (/run/media/ok/blue_disk//xen/xen/arch/riscv/include/asm/p2m.h:152)
>    guest_map_pages(struct domain * d, struct page_info * pg, unsigned int order, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:63)
>    allocate_domheap_memory(struct domain * d, paddr_t tot_size, alloc_domheap_mem_cb cb, void * extra) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:47)
>    allocate_bank_memory(struct kernel_info * kinfo, gfn_t sgfn, paddr_t tot_size) (/run/media/ok/blue_disk//xen/xen/common/device-tree/domain-build.c:99)
>    allocate_memory(struct domain * d, struct kernel_info * kinfo) (/run/media/ok/blue_disk//xen/xen/include/xen/mm-frame.h:43)
>    construct_domU(struct domain * d, const struct dt_device_node * node) (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:835)
>    create_domUs() (/run/media/ok/blue_disk//xen/xen/common/device-tree/dom0less-build.c:1019)
>    start_xen(unsigned long bootcpu_id, paddr_t dtb_addr) (/run/media/ok/blue_disk//xen/xen/arch/riscv/setup.c:296)
>    start() (/run/media/ok/blue_disk//xen/xen/arch/riscv/riscv64/head.S:61)
> 
> And panic() almost at the end:
>          rc = construct_domU(d, node);
>          if ( rc )
>              panic("Could not set up domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);

Which is what is wanted, imo.

Jan

