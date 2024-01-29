Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADD83FF3B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 08:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672895.1046991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUMNY-0005GZ-TC; Mon, 29 Jan 2024 07:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672895.1046991; Mon, 29 Jan 2024 07:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUMNY-0005DN-QY; Mon, 29 Jan 2024 07:48:28 +0000
Received: by outflank-mailman (input) for mailman id 672895;
 Mon, 29 Jan 2024 07:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9RcU=JH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUMNX-0005D9-Rk
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 07:48:27 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c87c70bb-be7a-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 08:48:25 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so23569571fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2024 23:48:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z16-20020a02ceb0000000b0046ef8c433basm1650454jaq.145.2024.01.28.23.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 23:48:24 -0800 (PST)
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
X-Inumbo-ID: c87c70bb-be7a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706514505; x=1707119305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuvcTlncC49aQrYd5Uc7RJWrb/jFlRJ+praUpGlIfZI=;
        b=G7HzNiP0xu6bnTsXJ3sr3eKUmZKEkJEmtICkSb1QjMYw5o7+NHtVczgPEpI6mHMbUq
         QH61MwFrS/NFkjW/jufRjnrq8GsWQ+HNyiJHuMP06UIbwzf4vFWH9HZzDLV3kdW3nghL
         zU/8TKO7t3oWOiyG7XSzuMUSvvzBgkkDGREg+jmbIx0cYc9KkhB/eT6ENVCp6X+dwvqm
         EQjwLMfy+WtpzveM5o5Ix82Lr8GvXMFbwB8FVI/5nkFbtML3Si4V1KPUuWkSOYAyKEeC
         k4m0I5EzfbQfv0dji773rtgX4vpkVLR4t+GFAIgBLbhj3XsxY1npbuCr4XMvrxNX8gYN
         XrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706514505; x=1707119305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuvcTlncC49aQrYd5Uc7RJWrb/jFlRJ+praUpGlIfZI=;
        b=A1rTSMymJC5x6eCebwijn8PIFqFQAK09GnUAUsBEjnR1AJBqnZgCcWd1h81qOHV1/+
         yK2uCGgv/DvsJAATMBvV0fR13Pnadina/VoLt9SrGH05HoEpGi4OT/zQoXFmSmoy8q9V
         jEpi4du/AHqAQPkZyMKf4iDWXP6dr1/HXmFM4Z3PRn9jdN0x+AzM87dD0/9xosCSkk3j
         eh+zWHW5sNQ3gorqMgkiywZgbNq+mGftaN5mVMHbwhMRmUEHzbDlUl3NceCoEK7d2FXV
         b7/KbaxNO1oIExngJtybisj5oAmhlx2ml9N5UxwwkSwFV+S0SEl76Og7WfRgmQ2xgNYI
         QW5g==
X-Gm-Message-State: AOJu0YxAsYinkqopbUHnoYi5oz+j1Pq+hLi5wigWIPMJrbPxLjphet3G
	Zrfo08LzxTc8NrIs3yHgr0bmhW8xjjoQ6xhK9NdlJe5kCbJA0vA8Bi6CZdkYRg==
X-Google-Smtp-Source: AGHT+IFIYRM3y0F/tWoYktjk94XHv7ZEmv6oEC7CZkD46ZuQWrqOrhrMiF9ZGEqjP1O1/Og/8u4Spw==
X-Received: by 2002:a2e:9e83:0:b0:2d0:50c4:cafe with SMTP id f3-20020a2e9e83000000b002d050c4cafemr405847ljk.37.1706514504946;
        Sun, 28 Jan 2024 23:48:24 -0800 (PST)
Message-ID: <d348c182-cce7-4f55-bbb5-830056322d65@suse.com>
Date: Mon, 29 Jan 2024 08:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/lib: introduce generic find next bit operations
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
 <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
 <1104df46d7780ef1bbcb6c745685b10fe6d2aa5d.camel@gmail.com>
 <a5a553cf-fe8c-4934-ac97-bdc59aeaed1c@xen.org>
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
In-Reply-To: <a5a553cf-fe8c-4934-ac97-bdc59aeaed1c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.01.2024 17:08, Julien Grall wrote:
> On 26/01/2024 15:58, Oleksii wrote:
>> On Fri, 2024-01-26 at 13:20 +0000, Julien Grall wrote:
>>> On 26/01/2024 12:20, Oleksii Kurochko wrote:
>>>> find-next-bit.c is common for Arm64, PPC and RISCV64,
>>>> so it is moved to xen/lib.
>>>>
>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>>    docs/misra/exclude-list.json                  |   4 -
>>>>    xen/arch/arm/arm64/lib/Makefile               |   2 +-
>>>>    xen/arch/arm/include/asm/arm64/bitops.h       |  48 --------
>>>>    xen/arch/ppc/include/asm/bitops.h             | 115 -------------
>>>> -----
>>>>    xen/include/xen/bitops.h                      |  48 ++++++++
>>>>    xen/lib/Makefile                              |   1 +
>>>>    .../find_next_bit.c => lib/find-next-bit.c}   |   0
>>>>    7 files changed, 50 insertions(+), 168 deletions(-)
>>>>    rename xen/{arch/arm/arm64/lib/find_next_bit.c => lib/find-next-
>>>> bit.c} (100%)
>>>>
>>>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-
>>>> list.json
>>>> index 7971d0e70f..7fe02b059d 100644
>>>> --- a/docs/misra/exclude-list.json
>>>> +++ b/docs/misra/exclude-list.json
>>>> @@ -13,10 +13,6 @@
>>>>                "rel_path": "arch/arm/arm64/insn.c",
>>>>                "comment": "Imported on Linux, ignore for now"
>>>>            },
>>>> -        {
>>>> -            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>>>
>>> Rather than removing the section, I was expecting the rel_path to be
>>> updated. Can you explain why you think the exclusion is not
>>> necessary?
>> I considered simply updating the path to xen/lib/find-next-bit.c, but
>> ultimately opted to remove it. This decision was based on the fact that
>> the line in question checks for a file that no longer exists. 
> 
> That's not quite correct. The file still exists but with a different name.
> 
>> If it's
>> preferable to update the rel_path with xen/lib/find-next-bit.c, I'm
>> more than willing to make that adjustment.
> 
> The problem is by removing the file, you effectively tell Eclair to 
> report any MISRA error. I don't believe this is what we want here.
> 
> But if the other agrees with you, then this change ought to be explained 
> in the commit message.

Imo it can only be removed (rather than updated) if the reason for adding
has meanwhile gone away. I don't think that's the case, though.

> To me the key is the commit message should contain enough information 
> for the reviewer to understand what/why you are doing. All the changes I 
> pointed out are definitely not just a normal code movement.
>>
>>>
>>>> -            "comment": "Imported from Linux, ignore for now"
>>>> -        },
>>>>            {
>>>>                "rel_path": "arch/x86/acpi/boot.c",
>>>>                "comment": "Imported from Linux, ignore for now"
>>>> diff --git a/xen/arch/arm/arm64/lib/Makefile
>>>> b/xen/arch/arm/arm64/lib/Makefile
>>>> index 1b9c7a95e6..66cfac435a 100644
>>>> --- a/xen/arch/arm/arm64/lib/Makefile
>>>> +++ b/xen/arch/arm/arm64/lib/Makefile
>>>> @@ -1,4 +1,4 @@
>>>>    obj-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
>>>>    obj-y += clear_page.o
>>>> -obj-y += bitops.o find_next_bit.o
>>>> +obj-y += bitops.o
>>>>    obj-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
>>>> diff --git a/xen/arch/arm/include/asm/arm64/bitops.h
>>>> b/xen/arch/arm/include/asm/arm64/bitops.h
>>>> index d85a49bca4..f9dd066237 100644
>>>> --- a/xen/arch/arm/include/asm/arm64/bitops.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/bitops.h
>>>> @@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
>>>>    
>>>>    /* Based on linux/include/asm-generic/bitops/find.h */
>>>>    
>>>> -#ifndef find_next_bit
>>>> -/**
>>>> - * find_next_bit - find the next set bit in a memory region
>>>> - * @addr: The address to base the search on
>>>> - * @offset: The bitnumber to start searching at
>>>> - * @size: The bitmap size in bits
>>>> - */
>>>> -extern unsigned long find_next_bit(const unsigned long *addr,
>>>> unsigned long
>>>> -		size, unsigned long offset);
>>>> -#endif
>>>> -
>>>> -#ifndef find_next_zero_bit
>>>> -/**
>>>> - * find_next_zero_bit - find the next cleared bit in a memory
>>>> region
>>>> - * @addr: The address to base the search on
>>>> - * @offset: The bitnumber to start searching at
>>>> - * @size: The bitmap size in bits
>>>> - */
>>>> -extern unsigned long find_next_zero_bit(const unsigned long *addr,
>>>> unsigned
>>>> -		long size, unsigned long offset);
>>>> -#endif
>>>> -
>>>> -#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
>>>> -
>>>> -/**
>>>> - * find_first_bit - find the first set bit in a memory region
>>>> - * @addr: The address to start the search at
>>>> - * @size: The maximum size to search
>>>> - *
>>>> - * Returns the bit number of the first set bit.
>>>> - */
>>>> -extern unsigned long find_first_bit(const unsigned long *addr,
>>>> -				    unsigned long size);
>>>> -
>>>> -/**
>>>> - * find_first_zero_bit - find the first cleared bit in a memory
>>>> region
>>>> - * @addr: The address to start the search at
>>>> - * @size: The maximum size to search
>>>> - *
>>>> - * Returns the bit number of the first cleared bit.
>>>> - */
>>>> -extern unsigned long find_first_zero_bit(const unsigned long
>>>> *addr,
>>>> -					 unsigned long size);
>>>> -#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
>>>> -
>>>>    #define find_first_bit(addr, size) find_next_bit((addr), (size),
>>>> 0)
>>>>    #define find_first_zero_bit(addr, size)
>>>> find_next_zero_bit((addr), (size), 0)
>>>>    
>>>> -#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
>>>
>>> AFAICT, you are changing the behavior for Arm64 without explaining
>>> why.
>>> Before, it was possible to set CONFIG_GENERIC_FIND_FIRST_BIT so the
>>> generic version of find_first_*_bit are used. This is not possible
>>> anymore with your change.
>>>
>>> Looking at Linux, I see that arm64 is now selecting
>>> GENERIC_FIND_FIRST_BIT (see [1]). So I would argue, we should not
>>> define
>>> find_first_bit(). That said, that's probably a separate patch.
>>>
>>> For now, you want to explain why GENERIC_FIND_FIRST_BIT is dropped.
>> I chose to remove it because I couldn't find any usage or configuration
>> setting for this in Xen (Arm).
> 
> Right. My point is the commit message can lead to think this is a simple 
> code movement and there are no change of behavior.
> 
> It wasn't clear to me whether this was done on purpose or not. It looks 
> like it was and therefore should really be explained in the commit message.
> 
>>
>> I can add "#ifdef GENERIC_FIND_FIRST_BIT" around find_first_zero_bit()
>> and find_first_bit() in xen/bitops.h, and according to the link [1], it
>> should be wrapped with ifdef. Perhaps it would be better to use "#if
>> defined(GENERIC_FIND_FIRST_BIT) && defined(CONFIG_ARM_64)".
>>
>> My only concern is that it might seem somewhat inconsistent with the
>> other find_*_bit() functions added in this patch. Should we be care
>> about that? I mean that do we need similar config or it would be enough
>> to add a comment why it is necessary to have ifdef
>> GENERIC_FIND_FIRST_BIT.
> 
> Note that I didn't ask to keep GENERIC_FIND_FIRST_BIT. I actually 
> pointed out that it can be removed but it should be explained in the 
> commit message.

+1

And, Oleksii, this isn't the first time that it is being pointed out to
you that commit messages need to contain enough information to justify
changes made.

Jan

