Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E09661DD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 14:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786436.1196034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0sW-0002Nx-Pb; Fri, 30 Aug 2024 12:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786436.1196034; Fri, 30 Aug 2024 12:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0sW-0002MI-Mt; Fri, 30 Aug 2024 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 786436;
 Fri, 30 Aug 2024 12:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sk0sV-0002M6-6N
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 12:37:23 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e8d336-66cc-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 14:37:21 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bede548f7cso1896205a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 05:37:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d7368sm210988566b.168.2024.08.30.05.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 05:37:20 -0700 (PDT)
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
X-Inumbo-ID: 99e8d336-66cc-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725021441; x=1725626241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z0krdLP9NbaqvYjToGU5GHAbSi87Pw4pwu9EzvkbzA=;
        b=XtlDSE2zsG/eh2qTJaIknh0V61WKuC9ZCUSG2/XWBaz2p+IYZzVgH0gOQ8n4ADaqe/
         wzqutdqMGFlPef+M7hghcfch8htaFot5bG3aBxcQOaIpuYOWgxaOqE9ponpRRSRD2rUx
         lqOWZSivDTEMMSvh21ZkDEB53Ak3XOTxP/q322erigjvEfot8J4YmGKuhDysVH5GrTNx
         MtS1TjrsYUJsvNpUQ3f5hMQbPwRc0M6BLcJxp0WkCl5J/h0P5KpNKO5Gj5JYI+QGXDOb
         oegSRfi8cZyQAgR9Pr0cAi0T9ChznOxJ5U/L4W0qBfuUx28H0Rrkq8eBo13kmhYOqUIX
         9pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725021441; x=1725626241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z0krdLP9NbaqvYjToGU5GHAbSi87Pw4pwu9EzvkbzA=;
        b=cZe3lTv0/+TpIZ+ikYRSdlkpeqpF9MYXomaNOOEaVSplD7izhdJEpDdgB/yjHQr5Dq
         gYVTdLzSF6mDcgTJfVslPvJEe8xH82LXf4fyF9xOKYnc1uIM+9jqGqV0Kn/NMwHAudCV
         fbF6fbBaYCzWCkAWNKg+zKZe3Z2kkDdtvIXanXJrHROvjjBxTAmWYWGFD+loFebM2mCS
         mjDYaAwtk06Q10HYYEPUnC7mHkIo6jw6LxWqA2YHuj3FD2u32lp9eR8alhhHngB80nNP
         /3kDfoVhLmrakz+ooOxvstpvUMYYEqiwLEbq7pkUZq0yV5SBuShjfPilt9dvcAG0ORBk
         e8sg==
X-Forwarded-Encrypted: i=1; AJvYcCW8CtLRVuqfrDa7Krb7ihhlmn7m3I1E2eCjPOFx12ANvGLy/urcHHPf9ReDpF9Uua25eNsI2uVcWuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqcCSt+ZZn20Ip01mkN2hqSgdW4N0+qXaTKDi/dvZFyAFZL8kq
	3CLKDw5YWXIZBTOAIaX4aiQ/RLiS1cJ5xEhhBrjWWvIhqOppQhX2sPZgt9YWjw==
X-Google-Smtp-Source: AGHT+IEAiGMcRyMLWPb1CdN03i6jjWKfmb9HOjhARkAITCuzoOA7Jzr2L4jODr4+SOaGnQmN3OtPNQ==
X-Received: by 2002:a17:906:c143:b0:a6f:8265:8f2 with SMTP id a640c23a62f3a-a897f8e2fc5mr452205866b.37.1725021440682;
        Fri, 30 Aug 2024 05:37:20 -0700 (PDT)
Message-ID: <8b398d9d-ccaf-4e1f-bedf-6105a8cca914@suse.com>
Date: Fri, 30 Aug 2024 14:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
 <9210aa20ebe892b9866309a7531398d446d0eef5.camel@gmail.com>
 <3705f296-3b79-4bad-9bbc-0b86aaa41314@suse.com>
 <f995bf0772edf69ba20c873c8056ab248a1cdd6f.camel@gmail.com>
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
In-Reply-To: <f995bf0772edf69ba20c873c8056ab248a1cdd6f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.08.2024 13:01, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-08-28 at 12:44 +0200, Jan Beulich wrote:
>> On 28.08.2024 11:53, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
>>>>>
>>>>> +
>>>>> +/*
>>>>> + * Direct access to xen_fixmap[] should only happen when {set,
>>>>> + * clear}_fixmap() is unusable (e.g. where we would end up to
>>>>> + * recursively call the helpers).
>>>>> + */
>>>>> +extern pte_t xen_fixmap[];
>>>>
>>>> I'm afraid I keep being irritated by the comment: What recursive
>>>> use
>>>> of
>>>> helpers is being talked about here? I can't see anything
>>>> recursive in
>>>> this
>>>> patch. If this starts happening with a subsequent patch, then you
>>>> have
>>>> two options: Move the declaration + comment there, or clarify in
>>>> the
>>>> description (in enough detail) what this is about.
> We can't move declaration of xen_fixmap[] to the patch where
> set_fixmap() will be introduced ( which uses PMAP for domain map page
> infrastructure ) as xen_fixmap[] is used in the current patch.
> 
> And we can't properly provide the proper description with the function
> which will be introduced one day in the future ( what can be not good
> too ). I came up with the following description in the comment above
> xen_fixmap[] declaration:
>    /*
>     * Direct access to xen_fixmap[] should only happen when {set,
>     * clear}_fixmap() is unusable (e.g. where we would end up to
>     * recursively call the helpers).
>     * 
>     * One such case is pmap_map() where set_fixmap() can not be used.
>     * It happens because PMAP is used when the domain map page
>    infrastructure
>     * is not yet initialized, so map_pages_to_xen() called by
>    set_fixmap() needs
>     * to map pages on demand, which then calls pmap() again, resulting
>    in a loop.
>     * Modification of the PTEs directly instead in arch_pmap_map().
>     * The same is true for pmap_unmap().
>     */
> 
> Could it be an option just to drop the comment for now at all as at the
> moment there is no such restriction with the usage of
> {set,clear}_fixmap() and xen_fixmap[]?

The comment isn't the right place to explain things here, imo. It's the
patch description where unexpected aspects need shedding light on.

>>> This comment is added because of:
>>> ```
>>> void *__init pmap_map(mfn_t mfn)
>>>   ...
>>>        /*
>>>         * We cannot use set_fixmap() here. We use PMAP when the
>>> domain map
>>>         * page infrastructure is not yet initialized, so
>>>    map_pages_to_xen() called
>>>         * by set_fixmap() needs to map pages on demand, which then
>>> calls
>>>    pmap()
>>>         * again, resulting in a loop. Modify the PTEs directly
>>> instead.
>>>    The same
>>>         * is true for pmap_unmap().
>>>         */
>>>        arch_pmap_map(slot, mfn);
>>>    ...
>>> ```
>>> And it happens because set_fixmap() could be defined using generic
>>> PT
>>> helpers
>>
>> As you say - could be. If I'm not mistaken no set_fixmap()
>> implementation
>> exists even by the end of the series. Fundamentally I'd expect
>> set_fixmap()
>> to (possibly) use xen_fixmap[] directly. That in turn ...
>>
>>> so what will lead to recursive behaviour when when there is no
>>> direct map:
>>
>> ... would mean no recursion afaict. Hence why clarification is needed
>> as
>> to what's going on here _and_ what's planned.
> Yes, it is true. No recursion will happen in this case but if to look
> at the implementation of set_fixmap() for other Arm or x86 ( but I am
> not sure that x86 uses PMAP inside map_pages_to_xen() ) they are using
> map_pages_to_xen().

There's no PMAP so far on x86.

Jan

