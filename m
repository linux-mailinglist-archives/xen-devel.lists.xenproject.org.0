Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD15CB2DFB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 13:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182899.1505714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJAO-0007un-NW; Wed, 10 Dec 2025 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182899.1505714; Wed, 10 Dec 2025 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJAO-0007tA-Kk; Wed, 10 Dec 2025 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1182899;
 Wed, 10 Dec 2025 12:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTJAN-0007t4-95
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 12:19:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c4b4b56-d5c2-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 13:19:33 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so10329298a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 04:19:33 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6496a8cc841sm2731629a12.4.2025.12.10.04.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 04:19:32 -0800 (PST)
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
X-Inumbo-ID: 7c4b4b56-d5c2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765369173; x=1765973973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsJL26CJGVBCZ/QgFLVcz7bzQXO/wt0gp12A34+Ga2Q=;
        b=GMU/pLcnOYDsIcPMNRqL4HvuSAY6L+CQvRt2EJzH3+K6bmkV0/PdoE/lzaj9sHRAqN
         1xET5gC5cSqxmkfPOXVPL94mczGdBVYm72i5iJbOwUSqcIbVhfkIvmxZaisr98whIU8c
         91eVnOBuxEBdXTCPPazyfHSzVIVaNuqoZX/Bf8It/w4MIdnVsLpa5YQh2pzAcNbryKu8
         abN6IPQ8kvtUjVkkNXJEH4tB7o42qYG1ICEA3YtIXA8d9Cng+GBZqYK+xs2kbxwTCTZV
         NTdGfL8s9FEDvJNy2rlayIhsNFtGAasMgFAYmbBoTAuLRt1629AIuPscSA8g+lD1mRiU
         pKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765369173; x=1765973973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsJL26CJGVBCZ/QgFLVcz7bzQXO/wt0gp12A34+Ga2Q=;
        b=E7sUMZ9d5n6wwbNql+9B4cZxyEO+TZhEPK09ebVEY3Ag+muGdOLPAdAs8lzU8WIFYT
         NGzaw9fLNnO7puSpUImoZZxNmNGvmwGIe+v7yAox6WShe6mfZ0sJhbnpu+nVMQRH5/Eu
         xJBn9Tgr2Jd59cbptbqTgNLnDqfIQXPQKuYU2fmAppzJmaUUXusYhPFzrDoT3m9iMRCH
         QLVP1yZCS90xIowNWsdUm9ZE/453tbU3lZkdxksktFpiWoC6u9Y1zd505UZWQoTiSo3Y
         RvO0KB4ZOkMi0sw6Denm/EUknGBvxgZ0gBktWcDThPpLfqG2FKIGgJJ51STdxgeVySyd
         mEWA==
X-Forwarded-Encrypted: i=1; AJvYcCX2DIVHes5Ac5vsBbRBNbFEln0yhZODStYWJdbvHOWcXS9acFQqfxZT9jvpeT9dmrr0NEHA+hDkOx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3p5p0ypNIvMxagS2RYjQrRMe34+bm9OVfNdsNghBZfzdg8UWx
	MyFYlweusd5BWy14kw4Tk570bJRONpOaJlQiqUTlJxSCLAdPIK8XSL+E
X-Gm-Gg: AY/fxX4cxaB+2O5/Q8+Ua4sPkJyL9v0U2Fi4KdfsefU04PcBs9c8DqcY/608GJLaViZ
	tIFkYLhBQ7KNtzLaeU5u7eRV5SvnnNbuXrZSM1GmoZkpIcyfO1B86PhPhWv204DxSldbmAkj05P
	e2QemQrhvT8rZnLJiuJA0C/x2KlPIiBiTva/zz0ZYBnbmlzfjYo7L/N2wvIsp0CwQa9gv8abvyr
	+bur94tvMvMN6j43+WSH9YF2mWl04wLnB6dH/18IKtTxfpQ8JGDP+qQOCdddI+MK2+wpPAnsJXN
	o6P6TKRfCAYpHVl+15mOe2rJfwn9VTPvzup6VUxObxv512wKkVvFVRws9QwANStl+gjNt4G08Ox
	xkHn6ltojfFyIKHDa3rF2h3y0f76lOZyVRA6ptEuZD6tBbx/WX3olPzVOwOklNc8zyzmXs9vFFt
	n2yGfkokjBWpGWh8ZTPgbpwNmOsbTbY+jC1mCUJsvMPhVkyBW9SVJ8/NuBLCH/
X-Google-Smtp-Source: AGHT+IHnTNOdUWANagiILPydxb+B8q22RESdGXsqxkPco3IchA2bilN8PactGCfDCubPcsuaYPI+xw==
X-Received: by 2002:a05:6402:2552:b0:649:6ac4:79af with SMTP id 4fb4d7f45d1cf-6496cb85504mr2133394a12.6.1765369172707;
        Wed, 10 Dec 2025 04:19:32 -0800 (PST)
Message-ID: <9aa60307-6571-4680-a5ec-4c7f945a109e@gmail.com>
Date: Wed, 10 Dec 2025 13:19:31 +0100
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
 <e6240b4a-c8f9-4618-916a-d97ce3ae7d3e@gmail.com>
 <07e53eae-2475-4325-bc4c-3634c4ed2aa4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <07e53eae-2475-4325-bc4c-3634c4ed2aa4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/10/25 12:44 PM, Jan Beulich wrote:
> On 10.12.2025 12:36, Oleksii Kurochko wrote:
>> On 12/9/25 4:49 PM, Jan Beulich wrote:
>>> On 09.12.2025 16:41, Oleksii Kurochko wrote:
>>>> On 12/9/25 12:38 PM, Jan Beulich wrote:
>>>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>>>>>>     
>>>>>>         return rc;
>>>>>>     }
>>>>>> +
>>>>>> +/*
>>>>>> + * p2m_get_entry() should always return the correct order value, even if an
>>>>>> + * entry is not present (i.e. the GFN is outside the range):
>>>>>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>>>>>> + *
>>>>>> + * This ensures that callers of p2m_get_entry() can determine what range of
>>>>>> + * address space would be altered by a corresponding p2m_set_entry().
>>>>>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>>>>>> + *
>>>>>> + * Therefore, this function returns true for GFNs outside range (1), and in
>>>>>> + * that case the corresponding level is returned via the level_out argument.
>>>>>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>>>>>> + * find the proper entry.
>>>>>> + */
>>>>>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>>>>>> +                                   gfn_t boundary, bool is_lower,
>>>>>> +                                   unsigned int *level_out)
>>>>>> +{
>>>>>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>>>>>> +    bool ret = false;
>>>>>> +
>>>>>> +    ASSERT(p2m);
>>>>>> +
>>>>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>>>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>>>>> +    {
>>>>>> +        unsigned long mask = 0;
>>>>>> +
>>>>>> +        for ( ; level; level-- )
>>>>>> +        {
>>>>>> +            unsigned long masked_gfn;
>>>>>> +
>>>>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>>>>> +            masked_gfn = gfn_x(gfn) & mask;
>>>>>> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
>>>>> I fear I still don't fully understand this. I would have expected the same mask to
>>>>> be used for setting / clearing bits (once inverted, obviously). Why would you clear
>>>>> only some of the lower bits in one case but set all of them in the other?
>>>> Only when is_lower == true do we need to set the lower bits; in all other cases
>>>> this is not required, if i am not confusing something.
>>> That wasn't my point though. I don't follow the !is_lower case: Why would you
>>> clear only the bits for the given level, not all further down as well? Or am
>>> I reading P2M_LEVEL_MASK() incorrectly?
>> Maybe I am still misunderstanding your question, but let’s consider what happens
>> in the loop in the case of !is_lower.
>>
>> P2M_LEVEL_MASK() returns the mask for a given level, so:
>>
>>     P2M_LEVEL_MASK(2) = 0x1FFC0000000
>>     P2M_LEVEL_MASK(1) = 0x0003FE00000
>>     P2M_LEVEL_MASK(0) = 0x000001FF000  (not really used/checked, because if we need
>>                                         to calculate it, we already know we are at
>>                                         level 0)
>>
>> Since we accumulate the mask across iterations, we get:
>>
>>     level 2: mask = 0x1FFC0000000
>>     level 1: mask = 0x1FFFFE00000
>>     level 0: doesn’t matter for the same reason as above.
>>
>> So, in the !is_lower case, it is clearing only the low bits for the current level.
>> On each iteration, we get only the portion of the GFN that corresponds to the
>> current level, plus the portions from previous level(s) if the level is not the root.
> But then you accumulate only for the ANDing, whereas you calculate the same mask
> from scratch for ORing. That's inefficient and confusing imo.

Agree that it isn't really efficient and it is confusing, so lets stick to suggested
way below.

>
>>>> The idea is that if boundary = 0x1000 and gfn = 0x800, and is_lower == true,
>>>> then to return the correct level value we must set all lower bits of gfn to 1.
>>>> Otherwise, we would get level = root instead of level = 0 in this case.
>>>>
>>>> I decided not to reuse mask to set the lower bits when is_lower == true, because
>>>> doing something like:
>>>>
>>>>        mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>>>        masked_gfn = gfn_x(gfn) & mask;
>>>>        masked_gfn |= (is_lower * ~mask);
>>>>
>>>> would allow ~mask to introduce 1s into the upper bits, which is not what we want.
>>> If you set "mask" such that it has suitably many of its low bits set then you
>>> should be able to simply do
>>>
>>>         if ( is_lower )
>>>             masked_gfn = gfn_x(gfn) | mask;
>>>         else
>>>             masked_gfn = gfn_x(gfn) & ~mask;
>> So, if I understand correctly, your suggestion is to calculate the mask as follows:
>>     level 2: mask = 0x3fffffff
>>     level 1: mask = 0x001fffff
>> (i.e., mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1)
> Yes.
>
>> I agree that this works fully in the is_lower case, but it may cause issues
>> in the !is_lower case. According to the spec, the (guest) physical address is
>> 56 bits (and the corresponding GFN is 44 bits). My concern is that bits above
>> bit 44 must be zero. However, ~mask would have all higher bits set to 1, so
>> those (above bit 44) upper bits would not be cleared.
>>
>> Perhaps this is not an issue at all, since a GFN larger than 44 bits should be
>> considered invalid. In that case, it may be sufficient for check_outside_boundary()
>> to ensure something like:
>>     ASSERT(gfn_x(gfn) < (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1));
> Invalid GFNs you want to make sure you reject earlier, if they can make it
> into here. Only if elsewhere you have code to reject them, you can add such
> an assertion here. (Recall: You may not assert on guest controlled input.)

Then I will reject invalid gfns at the start of p2m_get_entry() instead of ASSERT().

Thanks.

~ Oleksii


