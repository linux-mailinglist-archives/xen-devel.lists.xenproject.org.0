Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD241AFB710
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035654.1408002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnZK-0000Vi-Kg; Mon, 07 Jul 2025 15:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035654.1408002; Mon, 07 Jul 2025 15:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnZK-0000Tb-HZ; Mon, 07 Jul 2025 15:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1035654;
 Mon, 07 Jul 2025 15:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYnZI-0000TV-Qo
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:15:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f922054-5b45-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 17:15:42 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so2486077f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:15:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8434ee29sm93917685ad.58.2025.07.07.08.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:15:41 -0700 (PDT)
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
X-Inumbo-ID: 3f922054-5b45-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751901342; x=1752506142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4FPxN78xUd1ZjBETzacbgx+Z52DbfWXI5yhq/pH5/oc=;
        b=NMHbOrAV1WEt6TCEcIdinmRRW6ZiFCvhYc+8gIBEe9ieJNeYxez6UpY/Qvpi1q3ZF5
         19jhIVPh2GWf2pyFaXQGrRwcmq6OGKqDhgULtSZ4bfVXoqyP27ZvmAkrxSMX2IcpVABW
         32Nbn9UVFzDYbWMWJLnhj8H78lPfouc7JULoASVwQOzy2AFhsXgr4sH6R0HYsmDa2Sce
         mx8+vfU4Vgj6/cmadTuljkEE5L+HcgvKriCmt9YordKHUvUVM4zqnkjShH1NYYdYX983
         qOgmfeqnYdgqicY5Ac7iYGuurYREr1hJ28PbDJOfMHOmp9juZdpsw6hyQ3nb0Vrpm0vX
         3BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901342; x=1752506142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FPxN78xUd1ZjBETzacbgx+Z52DbfWXI5yhq/pH5/oc=;
        b=XoW14h39mBue6hstc1K3xhJmiP8VYOFqRkAPGtcSuuxRyRsPy75hbsW0T8iZip6ac0
         o6MzbXC/KbeYbpI0QgrgEKDjVpJlG6U2CXK9kMl1boA11VzwNXR/95h1pRjLlRglN0Qz
         iW0+qR49IfvIPEZUsuMwhjGyleJxvHJWaem2JxJZWSN46xqBncFbu9FEOAiDzhZkupX5
         a73Msp+hxLYqlhR+Wx9SrF+Y8bpMuIvszcIaq2tav8/lNB3auuCA5JlXCQoyOkvTEBQJ
         gnHHuyvklqEZVo9PKxqn/jXn3mBXzNWyPrAtHyZXxIl5dPe8jpmjK8Iq+2ZLS6P8Myh5
         hVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+FLzZsYdrbsWkvYfhNT4dSaZVh/6twiLvjINs8MnnF84x4Kun43xdbYMzAEB1O/JCUH8OJLsDVTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc4XL/7k9FW6ewe+lyo9PK8Y81Ff0nsMDJQj8rAOrkrKFeCWfR
	PuY1nkX769khwa08IWNdIPZybxtbDxN2/w8AohpV7CDuUiskz6/cFz9MUSXRqNlS7A==
X-Gm-Gg: ASbGnctXy53GxQEPrfnwVl4W+tDue2UWHy1FDLG4nt0t77GLMQwgA9wI7q3k+ZzMNJ8
	a4WJHq44k3ZqlQUEj8cJdqQuP6XDQ2CrClIq7wAkvIpC95dz0akAVqTNoWmjnn/HZouqzJbdArC
	x2PpzzKPhH/BoC9XzNHfddi2vWhmQEBMmxhddskWjhGNG/LEjTch+fy3BJaRDHJb1V5QQ1j6dfO
	zaPwbGCPEjgIkbC/P3JfcNuPlI7iffbEB2CVyuxO0bDIcktUSpTj0o/yBPSMtWM0D9i+mVRD9V1
	qw+OMYncIQev3bn6/f+AQsdsgjwPGfZR08e5HyPpJGZ41lAo4/X7Uo48ycwv83p3iBXRhmAwtQs
	VlZ5TWF/jwOX/WByt4IV7qPLoZoL1pJpf17OJBptvfVuDvfMnK/sG2xr1Fw==
X-Google-Smtp-Source: AGHT+IH5ckz1CoKSCwDUjTozcqt9+oB0K41fO80x7lERy+yZ/i98VHxw8pI64+W+LamOj8WRBd5YYA==
X-Received: by 2002:a05:6000:2209:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3b497038f95mr11533481f8f.48.1751901341822;
        Mon, 07 Jul 2025 08:15:41 -0700 (PDT)
Message-ID: <6bdad560-d631-4ae7-aaa2-3a0f64250f4b@suse.com>
Date: Mon, 7 Jul 2025 17:15:31 +0200
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
In-Reply-To: <8036ddb2-f223-41f5-a498-75b483c237bb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.07.2025 17:00, Oleksii Kurochko wrote:
> On 7/7/25 2:53 PM, Jan Beulich wrote:
>> On 07.07.2025 13:46, Oleksii Kurochko wrote:
>>> On 7/7/25 9:20 AM, Jan Beulich wrote:
>>>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> +{
>>>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>>>> +
>>>>>>> +    return false;
>>>>>>> +}
>>>>>> For this function in particular, though: Besides the "p2me" in the name
>>>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>>>> how is this going to be different from pte_is_valid()?
>>>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>>>      /*
>>>>>       * In the case of the P2M, the valid bit is used for other purpose. Use
>>>>>       * the type to check whether an entry is valid.
>>>>>       */
>>>>>      static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>      {
>>>>>          return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>      }
>>>>>
>>>>> It is done to track which page was modified by a guest.
>>>> But then (again) the name doesn't convey what the function does.
>>> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.
>> For P2M type checks please don't invent new naming, but use what both x86
>> and Arm are already using. Note how we already have p2m_is_valid() in that
>> set. Just that it's not doing what you want here.
> 
> Hm, why not doing what I want? p2m_is_valid() verifies if P2M entry is valid.
> And in here it is checked if P2M pte is valid from P2M point of view by checking
> the type in radix tree and/or in reserved PTEs bits (just to remind we have only 2
> free bits for type).

Because this is how it's defined on x86:

#define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
                             (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))

I.e. more strict that simply "!= p2m_invalid". And I think such predicates
would better be uniform across architectures, such that in principle they
might also be usable in common code (as we already do with p2m_is_foreign()).

>>>>    Plus
>>>> can't a guest also arrange for an entry's type to move to p2m_invalid?
>>>> That's then still an entry that was modified by the guest.
>>> I am not really sure that I fully understand the question.
>>> Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
>>> with p2m_invalid argument?
>> That I'm not asking, but rather stating. I.e. I expect such is possible.
>>
>>> If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
>>> will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
>>> this entry isn't expected to be used anymore.
>> Right. But such an entry would still have been "modified" by the guest.
> 
> Yes, but nothing then is needed to do with it.

I understand that. Maybe I'm overly picky, but all of the above was in response
to you saying "It is done to track which page was modified by a guest." And I'm
simply trying to get you to use precise wording, both in code comments and in
discussions. In a case like the one here I simply can't judge whether you simply
expressed yourself not clear enough, or whether you indeed meant what you said.

>>>>>>> +        /*
>>>>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>>>>> +         *
>>>>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>>>>> +         * superpage size.
>>>>>>> +         */
>>>>>> Does this really need leaving as a to-do?
>>>>> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
>>>>> a smaller order will simply be chosen.
>>>> Well, my question was more like "Isn't it simple enough to cover the case
>>>> right away?"
>>>>
>>>>>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>>>>>> +        mask |= gfn_x(sgfn) | nr;
>>>>>>> +
>>>>>>> +        for ( ; i != 0; i-- )
>>>>>>> +        {
>>>>>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>>>>>> +            {
>>>>>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>>>>>> +                    break;
>>>>>> Nit: Style.
>>>>>>
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>>>>>> +        if ( rc )
>>>>>>> +            break;
>>>>>>> +
>>>>>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>>>>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>>>>>> +           smfn = mfn_add(smfn, (1 << order));
>>>>>>> +
>>>>>>> +        nr -= (1 << order);
>>>>>> Throughout maybe better be safe right away and use 1UL?
>>>>>>
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return rc;
>>>>>>>     }
>>>>>> How's the caller going to know how much of the range was successfully
>>>>>> mapped?
>>>>> There is no such option. Do other arches do that? I mean returns somehow
>>>>> the number of successfully mapped (sgfn,smfn).
>>>> On x86 we had to introduce some not very nice code to cover for the absence
>>>> of proper handling there. For a new port I think it wants at least seriously
>>>> considering not to repeat such a potentially unhelpful pattern.
>>>>
>>>>>> That part may need undoing (if not here, then in the caller),
>>>>>> or a caller may want to retry.
>>>>> So the caller in the case if rc != 0, can just undoing the full range
>>>>> (by using the same sgfn, nr, smfn).
>>>> Can it? How would it know what the original state was?
>>> You're right — blindly unmapping the range assumes that no entries were valid
>>> beforehand and I missed that it could be that something valid was mapped before
>>> p2m_set_entry(sgfn,...,smfn) was called.
>>> But then I am not really understand why it won't be an issue if will know
>>> how many GFNs were successfully mapped.
>> The caller may know what that range's state was. But what I really wanted to
>> convey is: Updating multiple entries in one go is complicated in some of the
>> corner cases. You will want to think this through now, in order to avoid the
>> need to re-write everything later again.
> 
> I can add one more argument to return the number of successfully mapped GFNs.
> Fortunately, that's very easy to do.
> 
> The problem for me is that I don’t really understand what the caller is supposed
> to do with that information.

That's only the 2nd step to take. The first is: What behavior do you want, overall?

> The only use case I can think of is that the caller
> might try to map the remaining GFNs again. But that doesn’t seem very useful,
> if|p2m_set_entry()| wasn’t able to map the full range, it likely indicates a serious
> issue, and retrying would probably result in the same error.
> 
> The same applies to rolling back the state. It wouldn’t be difficult to add a local
> array to track all modified PTEs and then use it to revert the state if needed.
> But again, what would the caller do after the rollback? At this point, it still seems
> like the best option is simply to|panic(). |
> 
> Basically, I don’t see or understand the cases where knowing how many GFNs were
> successfully mapped, or whether a rollback was performed, would really help — because
> in most cases, I don’t have a better option than just calling|panic()| at the end.

panic()-ing is of course only a last resort. Anything related to domain handling
would better crash only the domain in question. And even that only if suitable
error handling isn't possible.

> For example, if I call|map_regions_p2mt()| for an MMIO region described in a device
> tree node, and the mapping fails partway through, I’m left with two options: either
> ignore the device (if it's not essential for Xen or guest functionality) and continue
>   booting; in which case I’d need to perform a rollback, and simply knowing the number
> of successfully mapped GFNs may not be enough or, more likely, just panic.

Well, no. For example, before even trying to map you could check that the range
of P2M entries covered is all empty. _Then_ you know how to correctly roll back.
And yes, doing so may not even require passing back information on how much of
a region was successfully mapped.

Jan

