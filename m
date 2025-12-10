Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BFCB2D70
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 12:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182865.1505694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTIUj-00024h-1c; Wed, 10 Dec 2025 11:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182865.1505694; Wed, 10 Dec 2025 11:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTIUi-00023h-VF; Wed, 10 Dec 2025 11:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1182865;
 Wed, 10 Dec 2025 11:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTIUh-00023b-Vo
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 11:36:32 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a218f4-d5bc-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 12:36:28 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so1093830266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 03:36:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4a78869sm1661421566b.71.2025.12.10.03.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 03:36:27 -0800 (PST)
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
X-Inumbo-ID: 77a218f4-d5bc-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765366588; x=1765971388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nWqjvUa51CVTyMBmFpjkeCnXLmzU/A9jVG22EhPfEg=;
        b=jtnKzW58aJG1twl8ok0j7CUacsO2KO2xKEzbHNGUox4CVhbxRpwSJYmJAK5S2kGS12
         RVpqdjJaAX6c1nYNtzWc4xNgBc5M3qM3uFuYC4fukgp2q9T2KK+NEY3lve2m/znVln7D
         csZQWZBjCNKXx0C3Os2WUlbpVXX0wUX0BHNLGBxMu7aWRnsvticAgeQvRhwJkTVoN/uk
         PyFcxoLA/DTGIT1nF30Ku+c/WtKbaJ9RzqRuA7zW28QPts7ChjGpKlZyFtLmkmrOxr8v
         Z/z6mXGj0/URLIlgyCfTJrZ0JlhNzkhCFcl5IX0C9WhWQsvPqMU8xwLBknYb68AZcNca
         RSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765366588; x=1765971388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nWqjvUa51CVTyMBmFpjkeCnXLmzU/A9jVG22EhPfEg=;
        b=ded/fhbBkkRm9mrtKq/xmsy71eTs0mQvLPe1FxHQ/peMGP7+PXTa9rUF9l3xSY385W
         nkdhF62sWEFnjPKv3+yGSvqwT/4qcxodwBY2pwk16SqbzL+Yg4cNlXTv16qE/Yjo4Woo
         Azeyr9Q2BLCjssx3G33uiPXsrKdHm9Aku+LZRYH3yXbvGy8C0MHeN2/918tZ8JEBCpUO
         qWfeP47zJu2Z+8effA/4t8pwc8BPW7TnY05oeVi5fpuE7eNvQx2fojImoh32NMzxg9/e
         69O/rf48jFcpeS/8w1jgSXKK9hU2bA89TjDIMapCQIz8yRFzbsuLQc7oAa767esZRBcN
         gX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT+bnOTlep8aoDoelYjCl4XultCZEbi1ObIfopRtvahYeGkFDS3SAFg7kXF5DlMiR0isgJCbTikUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWeLZzEKDSyQlvf2yoffMk2sj6GWd1RPS5O0lZ1t1YSrHSIVbP
	E+yIHe4jelycMh0+YKFODtZ4TJ3T/W6y7dLqSRPR+WUm/MmES0N8aoMp
X-Gm-Gg: ASbGncvlrOjmWp/o6VTx/zmHvqu1Pj7Ce/PEyunW6KumP46OoOOszXrWBRvT2TceF0k
	2GzABT5CKhPNjcWh8K1pEFa7L0nFkp2NAmWHcE+5yNRyPgMtKfFxQKkaUIzM4LljRQSDXZUkFnq
	kVzhc51J2p7DePJ+bWPBkTSwf7AYiOMH7dbSowOsAliZS/uwf/FNSer5P1WWPJK0WyYY9jF1+9v
	WzC3ur1uJ5yg2I4PHMV5jlfCZ/kdD9nmDlE8mg9tdQWawfnEanPjh210kewZukUxIB1XuiIMbGo
	9OOKzd840I/TJrtKT+cU0ejIhnhn52X55IDEVjCe/mHoEtQ+pDZxUCFo8xwr/VIXqOSbYYkiSyi
	/qEBL3rO8S8KvOw8W5fJ6bZYFURZCnEnlyFT+a2UkoAGi1b3PaaVTM/JDoWu7N5EFzPbbQxRdF+
	ntsaPpihSQdKnHp7TDkdNrgeQHov/SpADkFg3XOK34cg86Avc36NHEoWX1BXCw
X-Google-Smtp-Source: AGHT+IFJJWJ27sKiQ/ytu7lVsjkdANKZQkoaHKNxOLaM3Ffi2HacfnSNEfYBwcRaBhmwu7RJSDVULQ==
X-Received: by 2002:a17:907:8693:b0:b76:b632:1123 with SMTP id a640c23a62f3a-b7ce841ef18mr221880166b.42.1765366587785;
        Wed, 10 Dec 2025 03:36:27 -0800 (PST)
Message-ID: <e6240b4a-c8f9-4618-916a-d97ce3ae7d3e@gmail.com>
Date: Wed, 10 Dec 2025 12:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <48a58cde3de6a459885465c6d29d00d046ae4a37.1763986955.git.oleksii.kurochko@gmail.com>
 <69dce344-4dee-4778-99c2-0621c4e17cfc@suse.com>
 <86a87823-8b15-4897-9a97-ade444e2830d@gmail.com>
 <5fd516ed-c6db-4e7f-beea-a87c89faa6c0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5fd516ed-c6db-4e7f-beea-a87c89faa6c0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/9/25 4:49 PM, Jan Beulich wrote:
> On 09.12.2025 16:41, Oleksii Kurochko wrote:
>> On 12/9/25 12:38 PM, Jan Beulich wrote:
>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>>>>    
>>>>        return rc;
>>>>    }
>>>> +
>>>> +/*
>>>> + * p2m_get_entry() should always return the correct order value, even if an
>>>> + * entry is not present (i.e. the GFN is outside the range):
>>>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>>>> + *
>>>> + * This ensures that callers of p2m_get_entry() can determine what range of
>>>> + * address space would be altered by a corresponding p2m_set_entry().
>>>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>>>> + *
>>>> + * Therefore, this function returns true for GFNs outside range (1), and in
>>>> + * that case the corresponding level is returned via the level_out argument.
>>>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>>>> + * find the proper entry.
>>>> + */
>>>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>>>> +                                   gfn_t boundary, bool is_lower,
>>>> +                                   unsigned int *level_out)
>>>> +{
>>>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>>>> +    bool ret = false;
>>>> +
>>>> +    ASSERT(p2m);
>>>> +
>>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>>> +    {
>>>> +        unsigned long mask = 0;
>>>> +
>>>> +        for ( ; level; level-- )
>>>> +        {
>>>> +            unsigned long masked_gfn;
>>>> +
>>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>>> +            masked_gfn = gfn_x(gfn) & mask;
>>>> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
>>> I fear I still don't fully understand this. I would have expected the same mask to
>>> be used for setting / clearing bits (once inverted, obviously). Why would you clear
>>> only some of the lower bits in one case but set all of them in the other?
>> Only when is_lower == true do we need to set the lower bits; in all other cases
>> this is not required, if i am not confusing something.
> That wasn't my point though. I don't follow the !is_lower case: Why would you
> clear only the bits for the given level, not all further down as well? Or am
> I reading P2M_LEVEL_MASK() incorrectly?

Maybe I am still misunderstanding your question, but let’s consider what happens
in the loop in the case of !is_lower.

P2M_LEVEL_MASK() returns the mask for a given level, so:

   P2M_LEVEL_MASK(2) = 0x1FFC0000000
   P2M_LEVEL_MASK(1) = 0x0003FE00000
   P2M_LEVEL_MASK(0) = 0x000001FF000  (not really used/checked, because if we need
                                       to calculate it, we already know we are at
                                       level 0)

Since we accumulate the mask across iterations, we get:

   level 2: mask = 0x1FFC0000000
   level 1: mask = 0x1FFFFE00000
   level 0: doesn’t matter for the same reason as above.

So, in the !is_lower case, it is clearing only the low bits for the current level.
On each iteration, we get only the portion of the GFN that corresponds to the
current level, plus the portions from previous level(s) if the level is not the root.


>
>> The idea is that if boundary = 0x1000 and gfn = 0x800, and is_lower == true,
>> then to return the correct level value we must set all lower bits of gfn to 1.
>> Otherwise, we would get level = root instead of level = 0 in this case.
>>
>> I decided not to reuse mask to set the lower bits when is_lower == true, because
>> doing something like:
>>
>>       mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>       masked_gfn = gfn_x(gfn) & mask;
>>       masked_gfn |= (is_lower * ~mask);
>>
>> would allow ~mask to introduce 1s into the upper bits, which is not what we want.
> If you set "mask" such that it has suitably many of its low bits set then you
> should be able to simply do
>
>        if ( is_lower )
>            masked_gfn = gfn_x(gfn) | mask;
>        else
>            masked_gfn = gfn_x(gfn) & ~mask;

So, if I understand correctly, your suggestion is to calculate the mask as follows:
   level 2: mask = 0x3fffffff
   level 1: mask = 0x001fffff
(i.e., mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1)

I agree that this works fully in the is_lower case, but it may cause issues
in the !is_lower case. According to the spec, the (guest) physical address is
56 bits (and the corresponding GFN is 44 bits). My concern is that bits above
bit 44 must be zero. However, ~mask would have all higher bits set to 1, so
those (above bit 44) upper bits would not be cleared.

Perhaps this is not an issue at all, since a GFN larger than 44 bits should be
considered invalid. In that case, it may be sufficient for check_outside_boundary()
to ensure something like:
   ASSERT(gfn_x(gfn) < (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1));

Does it make sense or I still continue to confuse something?


>
>>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>>> +                           p2m_type_t *t,
>>>> +                           unsigned int *page_order)
>>>> +{
>>>> +    unsigned int level = 0;
>>>> +    pte_t entry, *table;
>>>> +    int rc;
>>>> +    mfn_t mfn = INVALID_MFN;
>>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>>> +
>>>> +    ASSERT(p2m_is_locked(p2m));
>>>> +
>>>> +    if ( t )
>>>> +        *t = p2m_invalid;
>>> The sole caller passes non-NULL right now. Are you having patches pending
>>> where NULL would be passed? Else, this being a static helper, I'd suggest
>>> to drop the check here (and the other one further down).
>> I don’t have any such call in pending patches. I saw that Arm has a case
>> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
>> so I decided to keep the check.
>>
>> What you wrote makes sense to me, and given that the mem_access code is
>> Arm-specific, RISC-V will probably never have the same situation.
>> However, it still seems reasonable to keep this check for flexibility,
>> so that we don’t risk a NULL-pointer dereference in the future or end up
>> needing to reintroduce the check (or providing an unused variable for a type)
>> later. Does that make sense?
> To a degree. The other perspective is that the check is dead code right now,
> and dead code is often disliked (e.g. by Misra). Introducing the check when
> it becomes necessary is pretty simple.

Then it makes sense to me to drop the check for now.

Thanks.

~ Oleksii


