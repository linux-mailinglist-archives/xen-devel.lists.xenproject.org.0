Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B74AFD009
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 18:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036859.1409374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZAnx-0008LV-KJ; Tue, 08 Jul 2025 16:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036859.1409374; Tue, 08 Jul 2025 16:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZAnx-0008Ij-HP; Tue, 08 Jul 2025 16:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1036859;
 Tue, 08 Jul 2025 16:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZAnw-0008I6-78
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 16:04:24 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36239b6d-5c15-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 18:04:22 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55516abe02cso42503e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 09:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845922b5sm112747185ad.199.2025.07.08.09.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 09:04:20 -0700 (PDT)
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
X-Inumbo-ID: 36239b6d-5c15-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751990661; x=1752595461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJPaMR0Qa+RNXf36e56UDlD3Hz7ZXbbYRH8BpaUDx6w=;
        b=Rba7X0AQFDPlQGrqIBKqFgYjMw9q1Fqb42X9HvJtssYJXGd0/vsWJ6Gu5Y/O63KcWW
         FP2UZb+XRks70hPgdfY9gETkpK8jN9WnRLk+WDqIVQWAGs+ICgAp/5CQWtl3M5Nw01Tm
         ZsNn1dfDLzau0rTx1lzz74ro/aJSyDjpir+UfwfyE5iuJo0Zb+9rrORrQefrzofH2qyd
         2RCoABpRI4qa90XwdWBtaBte0hdFuG1GUq0s/ONKDO6uQU2Xh/4QOenaaq2Z9Lor8G8V
         aNn3Q2byG45Vsc7EpTzX1rKX2Bc2kf5Xe2U8mm9UZID6NmY9NhjkjhF4NbxwuHg0XQbV
         ehwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990661; x=1752595461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJPaMR0Qa+RNXf36e56UDlD3Hz7ZXbbYRH8BpaUDx6w=;
        b=aVtgMHPHuPR710XHDRaSRbFfgQQo670WLEsIvQMbGvfPVPpmgnpIeVLrC2Qnjlrw89
         5NAkTwekfyzaBUwomtUEFbN+iA2AAW9z1BTGvGWT+0z7A8/hADMdQAX6duZhbGrbpWt/
         2ymx/iigk9v+HVGBtjscXPTF7RmkCaKHqYlfzzk9XtWM0cb3KC3TF5+ErEuUJjAjKoef
         vXgP9EYxyJe03tCxaFrHSbXspKxxF1JK2gQRiCUI3HGN0tNL/+xaHCIFUmpbp8dARWzs
         1kolT5cgF/TJQAJktD4uMX4C/lyXgAEKqm/IUhmuYWa2plwOYPJxHQP880NkqjkVOhat
         uNlA==
X-Forwarded-Encrypted: i=1; AJvYcCWgsLn0J3PMOk+ffAHd7ijGnNOQu0e68/Az29GCw6n7rGiZ4QQsENHuekOJqeqthEhBXha4dD3wy00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxolhugoqcvjnI/4Y9GOfASpVd3AOlWDgvb8e0WyV+h6qLp0ZNo
	sqtXlrSKUoe0mXTHJMHgEow2QIPIxD/dZ1bvjBG3EEtJzY/T10fGK9KF32A7lvTKAQ==
X-Gm-Gg: ASbGncvPdmVkV/KqkTOLXBcWsybn2nAW8pbzezYTo/+L6PyW6it/YX2nfHqwMxLAraq
	4ypWcP04LbQngFN8W+LvfE5K11nCw/tctW9nHcUamjjMN98EDHUxD0sei9mzx2Hh6ijjyxGlHbV
	pctfDQq32292fvKHb6kagOzxsnInJlvoJdXEdRRmZTWCUULmt7N1JALLStcRaIOyFpSFUH6ufoC
	76CwS9E15EPNgcOY1kVSK335BMdCYqeyulHU1rJ/IALhUqSzI5OBBhzShQo2g80SWzafN2XX4K2
	AMlkWl5erIOR7cX2tTLOB6o+kb+cSMRhmXOPykV87GmTkVriuISpQPOWTHaymnEs58vAi7ftEiw
	dim9M0zH+7clSO1K7I05M0OSCcyVQTaYwwbgPxqSY0R2WvaM=
X-Google-Smtp-Source: AGHT+IE7tYl99/bI8ebgUvk/vPZInCD+GVt4yh3Q/pKRYDJ1UsfZ2rsXeax4l/RBSv/jgo9v9fQQhg==
X-Received: by 2002:a05:6512:4009:b0:553:2884:5fb3 with SMTP id 2adb3069b0e04-557f89c5971mr1288175e87.12.1751990661021;
        Tue, 08 Jul 2025 09:04:21 -0700 (PDT)
Message-ID: <7078f5aa-045c-44bf-9b82-623f0e709aed@suse.com>
Date: Tue, 8 Jul 2025 18:04:10 +0200
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
In-Reply-To: <dd73f1ed-e2cb-40c5-ad06-bd390467e128@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 17:42, Oleksii Kurochko wrote:
> 
> On 7/8/25 2:45 PM, Jan Beulich wrote:
>> On 08.07.2025 12:37, Oleksii Kurochko wrote:
>>> On 7/8/25 11:01 AM, Oleksii Kurochko wrote:
>>>>
>>>> On 7/8/25 9:10 AM, Jan Beulich wrote:
>>>>> On 07.07.2025 18:10, Oleksii Kurochko wrote:
>>>>>> On 7/7/25 5:15 PM, Jan Beulich wrote:
>>>>>>> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>>>>>>>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>>>>>>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>>>>>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>>>>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>>>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    return false;
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>>>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>>>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>>>>>>>         /*
>>>>>>>>>>>>          * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>>>>>>>          * the type to check whether an entry is valid.
>>>>>>>>>>>>          */
>>>>>>>>>>>>         static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>>>>>>         {
>>>>>>>>>>>>             return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>>>>>>         }
>>>>>>>>>>>>
>>>>>>>>>>>> It is done to track which page was modified by a guest.
>>>>>>>>>>> But then (again) the name doesn't convey what the function does.
>>>>>>>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>>>>>>>> For P2M type checks please don't invent new naming, but use what both x86
>>>>>>>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>>>>>>>> set. Just that it's not doing what you want here.
>>>>>>>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>>>>>>>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>>>>>>>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>>>>>>>> free bits for type).
>>>>>>> Because this is how it's defined on x86:
>>>>>>>
>>>>>>> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>>>>>>>                                 (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>>>>>>>
>>>>>>> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
>>>>>>> would better be uniform across architectures, such that in principle they
>>>>>>> might also be usable in common code (as we already do with p2m_is_foreign()).
>>>>>> Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
>>>>>> x86 and Arm have different understanding what is valid.
>>>>>>
>>>>>> Except what mentioned in the comment that grant types aren't considered valid
>>>>>> for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
>>>>>> p2m_is_valid() is stricter then Arm's one and if other arches should be also
>>>>>> so strict.
>>>>> Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
>>>>> could also consider x86'es to require a better name). It's a local helper, not
>>>>> a P2M type checking predicate. With that in mind, you may of course follow
>>>>> Arm's model, but in the longer run we may need to do something about the name
>>>>> collision then.
>>>>>
>>>>>>>> The only use case I can think of is that the caller
>>>>>>>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>>>>>>>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>>>>>>>> issue, and retrying would probably result in the same error.
>>>>>>>>
>>>>>>>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>>>>>>>> array to track all modified PTEs and then use it to revert the state if needed.
>>>>>>>> But again, what would the caller do after the rollback? At this point, it still seems
>>>>>>>> like the best option is simply to|panic(). |
>>>>>>>>
>>>>>>>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>>>>>>>> successfully mapped, or whether a rollback was performed, would really help — because
>>>>>>>> in most cases, I don’t have a better option than just calling|panic()| at the end.
>>>>>>> panic()-ing is of course only a last resort. Anything related to domain handling
>>>>>>> would better crash only the domain in question. And even that only if suitable
>>>>>>> error handling isn't possible.
>>>>>> And if there is no still any runnable domain available, for example, we are creating
>>>>>> domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
>>>>>> If yes, then it is enough to return only error code without returning how many GFNs were
>>>>>> mapped or rollbacking as domain won't be ran anyway.
>>>>> During domain creation all you need to do is return an error. But when you write a
>>>>> generic function that's also (going to be) used at domain runtime, you need to
>>>>> consider what to do there in case of partial success.
>>>>>
>>>>>>>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>>>>>>>> tree node, and the mapping fails partway through, I’m left with two options: either
>>>>>>>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>>>>>>>      booting; in which case I’d need to perform a rollback, and simply knowing the number
>>>>>>>> of successfully mapped GFNs may not be enough or, more likely, just panic.
>>>>>>> Well, no. For example, before even trying to map you could check that the range
>>>>>>> of P2M entries covered is all empty.
>>>>>> Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
>>>>>> just do a mapping, right?
>>>>> Possibly that would simply mean to return an error, yes.
>>>>>
>>>>>> Won't be this procedure consume a lot of time as it is needed to go through each page
>>>>>> tables for each entry.
>>>>> Well, you're free to suggest a clean alternative without doing so.
>>>> I thought about dynamically allocating an array in p2m_set_entry(), where to save all changed PTEs,
>>>> and then use it to roll back if __p2m_set_entry() returns rc != 0 ...
>> That's another possible source for failure, and such an allocation may end
>> up being a rather big one.
>>
>>>>>>>     _Then_ you know how to correctly roll back.
>>>>>>> And yes, doing so may not even require passing back information on how much of
>>>>>>> a region was successfully mapped.
>>>>>> If P2M entries were empty before start of the mapping then it is enough to just go
>>>>>> through the same range (sgfn,nr,smfn) and just clean them, right?
>>>>> Yes, what else would "roll back" mean in that case?
>>>> ... If we know that the P2M entries were empty, then there's nothing else to be done, just
>>>> clean PTE is needed to be done.
>>>> However, if the P2M entries weren’t empty (and I’m still not sure whether that’s a legal
>>>> case), then rolling back would mean restoring their original state, the state they
>>>> had before the P2M mapping procedure started.
>>> Possible roll back is harder to implement as expected because there is a case where subtree
>>> could be freed:
>>>       /*
>>>        * Free the entry only if the original pte was valid and the base
>>>        * is different (to avoid freeing when permission is changed).
>>>        */
>>>       if ( p2me_is_valid(p2m, orig_pte) &&
>>>            !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
>>>           p2m_free_subtree(p2m, orig_pte, level);
>>> In this case then it will be needed to store the full subtree.
>> Right, which is why it may be desirable to limit the ability to update multiple
>> entries in one go. Or work from certain assumptions, violation of which would
>> cause the domain to be crashed.
> 
> It seems to me that the main issue with updating multiple entries in one go is the rollback
> mechanism in case of a partial mapping failure. (other issues? mapping could consume a lot
> of time so something should wait while allocation will end?) In my opinion, the rollback
> mechanism is quite complex to implement and could become a source of further failures.
> For example, most of the cases where p2m_set_entry() could fail are due to failure in
> mapping the page table (to allow Xen to walk through it) or failure in creating a new page
> table due to memory exhaustion. Then, during rollback, which might also require memory
> allocation, we could face the same memory shortage issue.
> And what should be done in that case?
> 
> In my opinion, the best option is to simply return from p2m_set_entry() the number of
> successfully mapped GFNs (stored in rc which is returned by p2m_set_entry()) and let
> the caller decide how to handle the partial mapping:
> 1. If a partial mapping occurs during domain creation, we could just report that this
>     domain can't be created and continue without it if there are other domains to start;
>     otherwise, panic.

I don't see how panic()-ing is relevant here. That's to be decided (far) up
the call stack.

> 2. If a partial mapping occurs during the lifetime of a domain, for example, if the domain
>     requests to map some memory, we return the number of successfully mapped GFNs and let the
>     domain decide what to do: either remove the mappings or retry mapping the remaining part.
>     However, I think there's not much value in retrying, since p2m_set_entry() is likely to
>     fail again. So, perhaps the best course of action is to stop the domain altogether.
> Does that make sense?

Sure, why not. Provided you actually have a way to communicate back how much
was mapped.

Jan

