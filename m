Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2770CB2D97
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 12:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182879.1505705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTIco-0003ll-Um; Wed, 10 Dec 2025 11:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182879.1505705; Wed, 10 Dec 2025 11:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTIco-0003jB-S2; Wed, 10 Dec 2025 11:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1182879;
 Wed, 10 Dec 2025 11:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTIcn-0003j5-LL
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 11:44:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a32d6057-d5bd-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 12:44:51 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2e77f519so4203719f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 03:44:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fdcsm37558790f8f.6.2025.12.10.03.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 03:44:50 -0800 (PST)
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
X-Inumbo-ID: a32d6057-d5bd-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765367091; x=1765971891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TOQqeyKlsVjnU4kOQYjStHyT8TJL8n1c/+MIxjqFYPQ=;
        b=KidOFp4gYNz+7MtHalpDsd7tff4+bYICXe5eN0awgjkHiHidunwMmGG5SkLP67JT6E
         1hKF+0Hw/UrnRIQB1a0BY2YbGRrjaGtSl0Xmauk3Cz8O78qJlibIJQInmDzywgEgVLE0
         HMM4iUVzPShTNotWWVdtP1HUj4AnMCCJHLl8M07zVYRADhNpWM9Nd3TVVTQFncmuNRYl
         AAwjwIdsWv38rHbvQAjo4yky51MUVwfrlSgSFXkS/s7V+2JEpZ642peCEFVdPHbsghSF
         4TQFy0eWp3PX2ze1U15EzwcQmqKRksXvmxfRISF4j53ktvWRerrFCju/cLW06qS+vCiL
         gNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765367091; x=1765971891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOQqeyKlsVjnU4kOQYjStHyT8TJL8n1c/+MIxjqFYPQ=;
        b=PbnsrP72WDxxu/jiS3u/sefmwJNnxQdtK25jysKEQeDDxO4VURYHez/N62vEOPELJk
         dkvWm75sMsjiCT6T+mbCLXWAhtjUUP01JaWhbMXY/DLZWVrNAj3gk5bfADBSev/yHox0
         nm1Dii6z+rV3oSntgmuLdbgpzD+BoHCNz9BvhMjRU1lhXJEbXUFMyMsBfSjrPO/Z++dw
         nP/K3YhGbF4OBIfdjobD4Ut9MZgVmVsd62uV+jNGH4WV+8LFRp1KAfV5M17lpPFZeWnZ
         bPs7vsToNSyT3QcmYM1RQ6M4lxw7U+ooDP6LWJlzdpJ79ola6liyZJRPw7oKLv1uyEY+
         kvBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5/OqT/YWwcUDO4/vX2ekYmUFYGWs+mdPMAbNkZ9oQreAuqGHZxX5vjQnhdvshbqPJT0LgDGhY0BU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzfn2g0Na12g0CFcRs0za8HVl2Ggoqv/BvR8kZcKnT/DDYZiZpG
	ErzzQNPUXN5SP8sNqp0BIaGo3QZq+sJvFyxqFTRKQtgqKQZjRBHKvZSB+LqxlPOi8w==
X-Gm-Gg: AY/fxX6sDDvtDjEFNZpo0XNB0YghZZKpJd7wl8gMWIeLBKSTIj9iwrsoLb6P2Y9TRuI
	K98fZeluoWK3kvR2/fpYcRFjmkShMZSJ7xnRtgTnXTHgimfheypYdkNd6qF1BANaY2aUV1hlsl/
	jauO5U/1Fw4hjpgk6Dk9lTOVgO38pp2dbG5H5bsKHUbqXz2/bRQpqEFblXx6bJvxa4kt5rmzZc/
	Fk7Go/dxQuawzfNT+dSuVKwGGIzzmkfRirOsi2s22fQBmPKTaCxXLN99ZmtfaVQB9EYCXRKtiqL
	kaasOYvFJXH/oQketMrRtETc10TtT9tpUndOkNRVoETKH8hjeOZmC18zPJJihF5FbcqqUGisRZP
	Gw6Y9kddIYbI+nMc2wiBuiifbfcsJrViFecXrpixrwvbeUDKP2fdL1zluOkAP4ZsJqTW7dzGFc5
	BtXT6NUkOQYdxuuTTQLMEjqB3VCMVEWJmGp4O4zZhXssHE0HaTgHXpSwj8hKBDBDgKaDzeI4YJg
	JM=
X-Google-Smtp-Source: AGHT+IEppmzHNZWrAsh9HWZ03rwoiB+z1t+PtwOQN80x5xbO+cwsdvk+Vh4Ok3PihQn1sSiuYdp7bw==
X-Received: by 2002:adf:fa49:0:b0:42b:3455:e4a4 with SMTP id ffacd0b85a97d-42fa3afe634mr1672686f8f.31.1765367090675;
        Wed, 10 Dec 2025 03:44:50 -0800 (PST)
Message-ID: <07e53eae-2475-4325-bc4c-3634c4ed2aa4@suse.com>
Date: Wed, 10 Dec 2025 12:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/19] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <e6240b4a-c8f9-4618-916a-d97ce3ae7d3e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 12:36, Oleksii Kurochko wrote:
> On 12/9/25 4:49 PM, Jan Beulich wrote:
>> On 09.12.2025 16:41, Oleksii Kurochko wrote:
>>> On 12/9/25 12:38 PM, Jan Beulich wrote:
>>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>>>>>    
>>>>>        return rc;
>>>>>    }
>>>>> +
>>>>> +/*
>>>>> + * p2m_get_entry() should always return the correct order value, even if an
>>>>> + * entry is not present (i.e. the GFN is outside the range):
>>>>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>>>>> + *
>>>>> + * This ensures that callers of p2m_get_entry() can determine what range of
>>>>> + * address space would be altered by a corresponding p2m_set_entry().
>>>>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>>>>> + *
>>>>> + * Therefore, this function returns true for GFNs outside range (1), and in
>>>>> + * that case the corresponding level is returned via the level_out argument.
>>>>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>>>>> + * find the proper entry.
>>>>> + */
>>>>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>>>>> +                                   gfn_t boundary, bool is_lower,
>>>>> +                                   unsigned int *level_out)
>>>>> +{
>>>>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>>>>> +    bool ret = false;
>>>>> +
>>>>> +    ASSERT(p2m);
>>>>> +
>>>>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>>>>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>>>>> +    {
>>>>> +        unsigned long mask = 0;
>>>>> +
>>>>> +        for ( ; level; level-- )
>>>>> +        {
>>>>> +            unsigned long masked_gfn;
>>>>> +
>>>>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>>>> +            masked_gfn = gfn_x(gfn) & mask;
>>>>> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
>>>> I fear I still don't fully understand this. I would have expected the same mask to
>>>> be used for setting / clearing bits (once inverted, obviously). Why would you clear
>>>> only some of the lower bits in one case but set all of them in the other?
>>> Only when is_lower == true do we need to set the lower bits; in all other cases
>>> this is not required, if i am not confusing something.
>> That wasn't my point though. I don't follow the !is_lower case: Why would you
>> clear only the bits for the given level, not all further down as well? Or am
>> I reading P2M_LEVEL_MASK() incorrectly?
> 
> Maybe I am still misunderstanding your question, but let’s consider what happens
> in the loop in the case of !is_lower.
> 
> P2M_LEVEL_MASK() returns the mask for a given level, so:
> 
>    P2M_LEVEL_MASK(2) = 0x1FFC0000000
>    P2M_LEVEL_MASK(1) = 0x0003FE00000
>    P2M_LEVEL_MASK(0) = 0x000001FF000  (not really used/checked, because if we need
>                                        to calculate it, we already know we are at
>                                        level 0)
> 
> Since we accumulate the mask across iterations, we get:
> 
>    level 2: mask = 0x1FFC0000000
>    level 1: mask = 0x1FFFFE00000
>    level 0: doesn’t matter for the same reason as above.
> 
> So, in the !is_lower case, it is clearing only the low bits for the current level.
> On each iteration, we get only the portion of the GFN that corresponds to the
> current level, plus the portions from previous level(s) if the level is not the root.

But then you accumulate only for the ANDing, whereas you calculate the same mask
from scratch for ORing. That's inefficient and confusing imo.

>>> The idea is that if boundary = 0x1000 and gfn = 0x800, and is_lower == true,
>>> then to return the correct level value we must set all lower bits of gfn to 1.
>>> Otherwise, we would get level = root instead of level = 0 in this case.
>>>
>>> I decided not to reuse mask to set the lower bits when is_lower == true, because
>>> doing something like:
>>>
>>>       mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>>>       masked_gfn = gfn_x(gfn) & mask;
>>>       masked_gfn |= (is_lower * ~mask);
>>>
>>> would allow ~mask to introduce 1s into the upper bits, which is not what we want.
>> If you set "mask" such that it has suitably many of its low bits set then you
>> should be able to simply do
>>
>>        if ( is_lower )
>>            masked_gfn = gfn_x(gfn) | mask;
>>        else
>>            masked_gfn = gfn_x(gfn) & ~mask;
> 
> So, if I understand correctly, your suggestion is to calculate the mask as follows:
>    level 2: mask = 0x3fffffff
>    level 1: mask = 0x001fffff
> (i.e., mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1)

Yes.

> I agree that this works fully in the is_lower case, but it may cause issues
> in the !is_lower case. According to the spec, the (guest) physical address is
> 56 bits (and the corresponding GFN is 44 bits). My concern is that bits above
> bit 44 must be zero. However, ~mask would have all higher bits set to 1, so
> those (above bit 44) upper bits would not be cleared.
> 
> Perhaps this is not an issue at all, since a GFN larger than 44 bits should be
> considered invalid. In that case, it may be sufficient for check_outside_boundary()
> to ensure something like:
>    ASSERT(gfn_x(gfn) < (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1));

Invalid GFNs you want to make sure you reject earlier, if they can make it
into here. Only if elsewhere you have code to reject them, you can add such
an assertion here. (Recall: You may not assert on guest controlled input.)

Jan

