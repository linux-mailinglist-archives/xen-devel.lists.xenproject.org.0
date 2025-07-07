Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618ABAFB3A8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 14:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035576.1407904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlMD-0003GQ-UM; Mon, 07 Jul 2025 12:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035576.1407904; Mon, 07 Jul 2025 12:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlMD-0003Dr-RD; Mon, 07 Jul 2025 12:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1035576;
 Mon, 07 Jul 2025 12:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYlMC-0003Dl-Bx
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 12:54:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754840fc-5b31-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 14:54:03 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1420897f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 05:54:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845be93esm91065325ad.247.2025.07.07.05.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 05:54:01 -0700 (PDT)
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
X-Inumbo-ID: 754840fc-5b31-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751892842; x=1752497642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7BYWVxHWgRIJr8FWDr8lsgcsjkMAlDKfxgYBDoyBrg=;
        b=Wa9ic5ypO/dYuzvasl6iBi00kkD3yH3uUUJel0VUg1bML4s3ijuRzyIoFTVLxksGhJ
         QEUF/h5l2QgtYEkl24v1EvKAs7CCCwAd16IBs74Qk7TvCMCUpstAk/6obEOiioua/xtJ
         NFXZzmeTwM475rKXUf7pRYEtX8YVUL4KiFRhTYm34hsw8IyyMaMroQHd0FcGCjOE2jc5
         214NrlMgWhHp9d2M7f1Bloro5T9IHfwHiuEulIvt9g4sm7TBfKLJ1luh3ImpniXA2G8B
         bQbGedCid9k5CQjTuRAycawJMd/Nu+NEj+lC6q4ksPO7RemJv64ZtBVe4MUsrLvo6yon
         bXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892842; x=1752497642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7BYWVxHWgRIJr8FWDr8lsgcsjkMAlDKfxgYBDoyBrg=;
        b=GdM6sQzH//ldQIqTfY5saYsWQxr1ayTFAECFuGYJr35UiYCKyuuJu5XZtgQyWMn5wp
         yo7Qwef7FZqGn/WmGCusNvVy6cCRlmzJMSdyMOFkM8FbblvhugHX5zhnMaAXynP43Xh/
         cNqMo5J/1CjlrJOrmMS2mJV8/mHlGxmrtMIM2Tj+MVOBchSwokpZcGoGqTZ0XQqAymHw
         1UvaYCNd3eLHkSmrJVLkKmXJm+Icu6+1VKZVCgd6KYUihYPryHQy5yhKPLOYGcQq8gA4
         QpSzKOS8kskXiIP36KBhQsqVYoKPjR474bBUyQr/rTe3Tq2j8DdA/E8OvtAtrgPSfYZ0
         95Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVjp0GSnDtBmigMWtXVOmEOYKEkdYMYS7rhqJd5ijDECtRCGnd/D/fkcW5No8Lq8EIfBE14pxGO/vA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhmaiyLJII6sCukobhzK8UTGVuaaAa+OJPdHin0/LC38HXtZb8
	VP2RxZxT7uh1J4UucTkFkcu4Mg+wXdIhgqqIWHBGNJ8ByOguacPtwGVes3iKdHay6Q==
X-Gm-Gg: ASbGncuxXCO6qt4u2MVYghmZ136/txP5E+1xNn21Gi0ruAJgecjjL8WKrXbJXAzuX+p
	KAx+nW4vtxCx6WL8aLeI7D4IKUZTwU7SXah29cmJGNXd6INogLr2R3H1OadcVuxUYi0BBx3slJI
	/74kY9ywiQsOtTdFqs6xd2G535roywuhaHUHp65VytmUl8upCXLzXqiLDe8rQgHaCX+ruNLikBF
	JXxQFUJEu1geYOQ+vWCgHLFvSrYt3bJNi7M1m2oxqwOu58qvCpAhjw9S0U/N3tK2Jyt/Ue425a6
	NV3YdkuwuHlUwmdnmk57mcaQZDTGkfUfHXHrOjwO/26U4rct4JqgJ8RQ5CrAo8JcU6ZrI1qi7SE
	Go7WzaHgdlL+jxoLOaK73r0Y/Dd7+aNU6XKb6Bs9M9dUGfQ8=
X-Google-Smtp-Source: AGHT+IHgqiOXtChUB1/WAtwbyHOgq/4bN/HG0JY7S7sZwIAO3j6aY51kQpR6WiKpI94uK70S3+WMJQ==
X-Received: by 2002:a05:6000:40dc:b0:3a4:f7af:b41 with SMTP id ffacd0b85a97d-3b4964c062cmr10134099f8f.15.1751892842031;
        Mon, 07 Jul 2025 05:54:02 -0700 (PDT)
Message-ID: <cec77342-367c-41fe-abaf-b7e04309ca63@suse.com>
Date: Mon, 7 Jul 2025 14:53:51 +0200
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
In-Reply-To: <82362709-c386-485e-935c-e229e735fba6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.07.2025 13:46, Oleksii Kurochko wrote:
> On 7/7/25 9:20 AM, Jan Beulich wrote:
>> On 04.07.2025 17:01, Oleksii Kurochko wrote:
>>> On 7/1/25 3:49 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
>>>>> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
>>>>> modifications.
>>>>>
>>>>> Key differences include:
>>>>> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>>>>>     break-before-make (BBM). As a result, the flushing logic is simplified.
>>>>>     TLB invalidation can be deferred until p2m_write_unlock() is called.
>>>>>     Consequently, the p2m->need_flush flag is always considered true and is
>>>>>     removed.
>>>>> - Page Table Traversal: The order of walking the page tables differs from Arm,
>>>>>     and this implementation reflects that reversed traversal.
>>>>> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>>>>>     P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
>>>>>
>>>>> The main functionality is in __p2m_set_entry(), which handles mappings aligned
>>>>> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
>>>>>
>>>>> p2m_set_entry() breaks a region down into block-aligned mappings and calls
>>>>> __p2m_set_entry() accordingly.
>>>>>
>>>>> Stub implementations (to be completed later) include:
>>>>> - p2m_free_entry()
>>>> What would a function of this name do?
>>> Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
>>> put_page() (which will free if there is no any reference to this page),
>>> freeing intermediate page table (after all entries were freed) by removing
>>> it from d->arch.paging.freelist, and removes correspondent page of intermediate page
>>> table from p2m->pages list.
>>>
>>>> You can clear entries, but you can't
>>>> free them, can you?
>>> Is is a question regarding terminology?
>> Yes. If one sees a call to a function, it should be possible to at least
>> roughly know what it does without needing to go look at the implementation.
>>
>>> I can't free entry itself, but a page table or
>>> a page (if it is a leaf entry) on which it points could free.
>> Then e.g. pte_free_subtree() or some such?
> 
> It sounds fine to me. I'll use suggested name.
> 
> Just want to notice that other arches also have the same function
> for the same purpose with the same name.

As to x86, it's not general P2M code which uses this odd (for the purpose)
name, but only p2m-pt.c.

> Does it make sense then to change a name for all arches?

I think so.

>>>>> +{
>>>>> +    panic("%s: isn't implemented for now\n", __func__);
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>> For this function in particular, though: Besides the "p2me" in the name
>>>> being somewhat odd (supposedly page table entries here are simply pte_t),
>>>> how is this going to be different from pte_is_valid()?
>>> pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
>>> what is a type stored in the radix tree (p2m->p2m_types):
>>>     /*
>>>      * In the case of the P2M, the valid bit is used for other purpose. Use
>>>      * the type to check whether an entry is valid.
>>>      */
>>>     static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>     {
>>>         return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>     }
>>>
>>> It is done to track which page was modified by a guest.
>> But then (again) the name doesn't convey what the function does.
> 
> Then probably p2me_type_is_valid(struct p2m_domain *p2m, pte_t pte) would better.

For P2M type checks please don't invent new naming, but use what both x86
and Arm are already using. Note how we already have p2m_is_valid() in that
set. Just that it's not doing what you want here.

>>   Plus
>> can't a guest also arrange for an entry's type to move to p2m_invalid?
>> That's then still an entry that was modified by the guest.
> 
> I am not really sure that I fully understand the question.
> Do you ask if a guest can do something which will lead to a call of p2m_set_entry()
> with p2m_invalid argument?

That I'm not asking, but rather stating. I.e. I expect such is possible.

> If yes, then it seems like it will be done only in case of p2m_remove_mapping() what
> will mean that alongside with p2m_invalid INVALID_MFN will be also passed, what means
> this entry isn't expected to be used anymore.

Right. But such an entry would still have been "modified" by the guest.

>> Overall I think I'm lacking clarity what you mean to use this predicate
>> for.
> 
> By using of "p2me_" predicate I wanted to express that not PTE's valid bit will be
> checked, but the type saved in radix tree will be used.
> As suggested above probably it will be better drop "e" too and just use p2m_type_is_valid().

See above regarding that name.

>>>>> +        /*
>>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>>> +         *
>>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>>> +         * superpage size.
>>>>> +         */
>>>> Does this really need leaving as a to-do?
>>> I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
>>> a smaller order will simply be chosen.
>> Well, my question was more like "Isn't it simple enough to cover the case
>> right away?"
>>
>>>>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>>>>> +        mask |= gfn_x(sgfn) | nr;
>>>>> +
>>>>> +        for ( ; i != 0; i-- )
>>>>> +        {
>>>>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>>>>> +            {
>>>>> +                    order = XEN_PT_LEVEL_ORDER(i);
>>>>> +                    break;
>>>> Nit: Style.
>>>>
>>>>> +            }
>>>>> +        }
>>>>> +
>>>>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>>>>> +        if ( rc )
>>>>> +            break;
>>>>> +
>>>>> +        sgfn = gfn_add(sgfn, (1 << order));
>>>>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>>>>> +           smfn = mfn_add(smfn, (1 << order));
>>>>> +
>>>>> +        nr -= (1 << order);
>>>> Throughout maybe better be safe right away and use 1UL?
>>>>
>>>>> +    }
>>>>> +
>>>>> +    return rc;
>>>>>    }
>>>> How's the caller going to know how much of the range was successfully
>>>> mapped?
>>> There is no such option. Do other arches do that? I mean returns somehow
>>> the number of successfully mapped (sgfn,smfn).
>> On x86 we had to introduce some not very nice code to cover for the absence
>> of proper handling there. For a new port I think it wants at least seriously
>> considering not to repeat such a potentially unhelpful pattern.
>>
>>>> That part may need undoing (if not here, then in the caller),
>>>> or a caller may want to retry.
>>> So the caller in the case if rc != 0, can just undoing the full range
>>> (by using the same sgfn, nr, smfn).
>> Can it? How would it know what the original state was?
> 
> You're right — blindly unmapping the range assumes that no entries were valid
> beforehand and I missed that it could be that something valid was mapped before
> p2m_set_entry(sgfn,...,smfn) was called.
> But then I am not really understand why it won't be an issue if will know
> how many GFNs were successfully mapped.

The caller may know what that range's state was. But what I really wanted to
convey is: Updating multiple entries in one go is complicated in some of the
corner cases. You will want to think this through now, in order to avoid the
need to re-write everything later again.

Jan

