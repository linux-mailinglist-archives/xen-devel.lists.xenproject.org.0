Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF2AFC3C2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036160.1408476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2Tv-0002tA-Ua; Tue, 08 Jul 2025 07:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036160.1408476; Tue, 08 Jul 2025 07:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2Tv-0002qZ-Rd; Tue, 08 Jul 2025 07:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1036160;
 Tue, 08 Jul 2025 07:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2Tu-0002qT-VD
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:11:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70da24c-5bca-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 09:11:06 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so26871815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:11:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c220a4d37sm1286772a91.37.2025.07.08.00.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:11:04 -0700 (PDT)
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
X-Inumbo-ID: b70da24c-5bca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751958666; x=1752563466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu30FE0dlTylS6smJ1w88SOtJ1jvaDGOIdIR1NTZQJ4=;
        b=Mxpn8sQuf61+t0VcPSSOgNGGSSCC/9sP4RydCv+t/TrZMoNQKQkbPa9412sVbwxFuR
         fmh2NcptnqLKHZkC6NfmUeAd0YgO87w1OTBktMZpmHRzSO3cToglIek5p73t7WKD69ve
         CCL4OaWcFYIuGs0LpITA33rZROaJEqZ59JU4IKBSX7y28ekN+RrJNsR20OjT4d0PrKa4
         MCaAQGjCoeEzSEQCQkPL3Io5zb0fuwHkpI4dSj9XLvHXwQ8kI1FzmcIvXD1P/5bQ7rYV
         20tSHQlvE4p94iCC26O52gmMLfI0BsghjBiGjEW+aJD/nsnIJkOE6YzQsDVQuY7m9ei0
         NmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751958666; x=1752563466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu30FE0dlTylS6smJ1w88SOtJ1jvaDGOIdIR1NTZQJ4=;
        b=gXhu/x6vA18CitxyopUU9nqab0MJPRJUxc7tu1exbv1mS40UUjPbU4EPBR18EibACQ
         kOalTVmqp4wn5gkR4g0dIou1HkBdlDFmsnk093N+FQRGVJDRNOiEgl/13HlIAL6r701s
         tqB2l1F00UQEoDM8p6pEJZaFWLzf8ClrmJ17rvIno59D6viPOvGkZJX/g+DKMw7HV6FZ
         GJRGnz1K0WvevPNE/o7v5PEj8FDEYCSFWnysNVQ6mw+MUSQ+d9OXdFDj/vZ1LAJyh7JL
         PNa+ZJt+RKXKty4O4Elp7bRvnq+nBRK0IR5JSmzYJdOY8dxMs5Wmzmf9NECC7s6B+4+h
         IIDA==
X-Forwarded-Encrypted: i=1; AJvYcCWzughYdwv5Axbnf5to5rz0YmbhI7GxvnKNnqzgDLoP+DK6hs/qMBUYP5zAgBcj3XwXPohuIrchtj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5nnX8G4HAbWMcXKrIWW+4kRwmcZ2duQSfs2jlRRFq5dMlH7NH
	sCMq1Y8KXs8yjv/fhb3wNHie+pmdwn5tQlz2brhmeKhqgJbGokkwfkyatUywBY9NJw==
X-Gm-Gg: ASbGncvf3cthxn9xdZoTlbQrEV5KK0hpxz7XWgwd6M9A0VJf/GxKn1sS3LBtFLtzqqH
	edd2fsReZasoYMqpM+n5+xCL7WcNpZ6abmUrlY2+Kuuh3gEwnqo0n+9Q0rCsxev0bpVsAI+hW4A
	1x/v3ze2FunZMdJnBDOXU+uMO3aJdtSSwF0B3B1dS4NnGtGkzfcPT4ftXAxbfNmH/qdQLBnYjZr
	PDjKhVwLISOl4fc2Dab1mLQqicJJNx5nXZcBl/k9l6fg8zB8suGD5qr1OBmh3S+ZsLJHbfROcsi
	JNcicAFFV3BmJ8pdeX9OH6pCbGL1HfAP7Jy7Vp6RdQgJPVxwz1Avt5hWwlzZ0lPxDGHqDqD7VdE
	GKF7NXdT/2FiAK8htjzemg4eU3cdDvGs671abzE5uBoKoi5E=
X-Google-Smtp-Source: AGHT+IE4e4Pg0B8ARC0i7XjuNTv8h6GPOcmzcRBvFZpBFls8EIJV3sNvUZGasVs4sqj6Y05TIfAeVA==
X-Received: by 2002:a05:6000:22c3:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3b4964ea6c0mr11645561f8f.50.1751958665506;
        Tue, 08 Jul 2025 00:11:05 -0700 (PDT)
Message-ID: <409cdade-192d-47dc-941d-9256bfa53cea@suse.com>
Date: Tue, 8 Jul 2025 09:10:54 +0200
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
In-Reply-To: <8f166b5d-eed3-4695-a0e9-ba8fc8a2b9b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.07.2025 18:10, Oleksii Kurochko wrote:
> On 7/7/25 5:15 PM, Jan Beulich wrote:
>> On 07.07.2025 17:00, Oleksii Kurochko wrote:
>>> On 7/7/25 2:53 PM, Jan Beulich wrote:
>>>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>>>> +{
>>>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>>>> +
>>>>>>>>> +    return false;
>>>>>>>>> +}
>>>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>>>> how is this going to be different from pte_is_valid()?
>>>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>>>       /*
>>>>>>>        * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>>>        * the type to check whether an entry is valid.
>>>>>>>        */
>>>>>>>       static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>       {
>>>>>>>           return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>       }
>>>>>>>
>>>>>>> It is done to track which page was modified by a guest.
>>>>>> But then (again) the name doesn't convey what the function does.
>>>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>>>> For P2M type checks please don't invent new naming, but use what both x86
>>>> and Arm are already using. Note how we already have p2m_is_valid() in that
>>>> set. Just that it's not doing what you want here.
>>> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
>>> And in here it is checked if P2M pte is valid from P2M point of view by checking
>>> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
>>> free bits for type).
>> Because this is how it's defined on x86:
>>
>> #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
>>                               (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
>>
>> I.e. more strict that simply "!= p2m_invalid". And I think such predicates
>> would better be uniform across architectures, such that in principle they
>> might also be usable in common code (as we already do with p2m_is_foreign()).
> 
> Yeah, Arm isn't so strict in definition of p2m_is_valid() and it seems like
> x86 and Arm have different understanding what is valid.
> 
> Except what mentioned in the comment that grant types aren't considered valid
> for x86 (and shouldn't be the same then for Arm?), it isn't clear why x86's
> p2m_is_valid() is stricter then Arm's one and if other arches should be also
> so strict.

Arm's p2m_is_valid() is entirely different (and imo misnamed, but arguably one
could also consider x86'es to require a better name). It's a local helper, not
a P2M type checking predicate. With that in mind, you may of course follow
Arm's model, but in the longer run we may need to do something about the name
collision then.

>>> The only use case I can think of is that the caller
>>> might try to map the remaining GFNs again. But that doesn’t seem very useful,
>>> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
>>> issue, and retrying would probably result in the same error.
>>>
>>> The same applies to rolling back the state. It wouldn’t be difficult to add a local
>>> array to track all modified PTEs and then use it to revert the state if needed.
>>> But again, what would the caller do after the rollback? At this point, it still seems
>>> like the best option is simply to|panic(). |
>>>
>>> Basically, I don’t see or understand the cases where knowing how many GFNs were
>>> successfully mapped, or whether a rollback was performed, would really help — because
>>> in most cases, I don’t have a better option than just calling|panic()| at the end.
>> panic()-ing is of course only a last resort. Anything related to domain handling
>> would better crash only the domain in question. And even that only if suitable
>> error handling isn't possible.
> 
> And if there is no still any runnable domain available, for example, we are creating
> domain and some p2m mapping is called? Will it be enough just ignore to boot this domain?
> If yes, then it is enough to return only error code without returning how many GFNs were
> mapped or rollbacking as domain won't be ran anyway.

During domain creation all you need to do is return an error. But when you write a
generic function that's also (going to be) used at domain runtime, you need to
consider what to do there in case of partial success.

>>> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
>>> tree node, and the mapping fails partway through, I’m left with two options: either
>>> ignore the device (if it's not essential for Xen or guest functionality) and continue
>>>    booting; in which case I’d need to perform a rollback, and simply knowing the number
>>> of successfully mapped GFNs may not be enough or, more likely, just panic.
>> Well, no. For example, before even trying to map you could check that the range
>> of P2M entries covered is all empty.
> 
> Could it be that they aren't all empty? Then it seems like we have overlapping and we can't
> just do a mapping, right?

Possibly that would simply mean to return an error, yes.

> Won't be this procedure consume a lot of time as it is needed to go through each page
> tables for each entry.

Well, you're free to suggest a clean alternative without doing so.

>>   _Then_ you know how to correctly roll back.
>> And yes, doing so may not even require passing back information on how much of
>> a region was successfully mapped.
> 
> If P2M entries were empty before start of the mapping then it is enough to just go
> through the same range (sgfn,nr,smfn) and just clean them, right?

Yes, what else would "roll back" mean in that case?

Jan

