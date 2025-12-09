Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9ACB06D5
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181877.1504857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzpy-0003cX-98; Tue, 09 Dec 2025 15:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181877.1504857; Tue, 09 Dec 2025 15:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzpy-0003a0-61; Tue, 09 Dec 2025 15:41:14 +0000
Received: by outflank-mailman (input) for mailman id 1181877;
 Tue, 09 Dec 2025 15:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSzpw-0003Zt-CW
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:41:12 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb377a0-d515-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:41:09 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so822565566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:41:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c56sm1397977966b.33.2025.12.09.07.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 07:41:07 -0800 (PST)
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
X-Inumbo-ID: 7bb377a0-d515-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294869; x=1765899669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXiaujvUvvR/z0zrzSKxFRSx3Lik8dAv8cTMffKtAic=;
        b=EFf2DKELNS+ACR0RRcw5Gj4N3y4wmEGaq82i7Ab3T9Zahn8B7l+Ur6Uchye0oErylk
         p7Xv/6kc8V6gojNAf5OiYOGnoEDaJENUPdMxbedT0YffNomEVSbCzt3RmOwPttme+4Cs
         fFEtbU25WiY5QPqc8ui3yoFhvnCwm098Vr3fmcBQcHyMVSNEeAigfTVgCCnaPEbQDKwb
         lcEnkyTs2snDsBss2BbV3FiEI+Z+EMyQknqn3uGCMfpE7t3K1tF9NHxppLmyjC338/1w
         RebgjSJO4eaDz5GEanZUMbIH45jAZU4LKqdkxTaE72Fj5ylKEgviZJfm0/uF0J/h2dQu
         jFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294869; x=1765899669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXiaujvUvvR/z0zrzSKxFRSx3Lik8dAv8cTMffKtAic=;
        b=GvpGpCblEiGMNJ9qz7kJNyY3UMaJxNCdokqZdgNsJOA2w4aJkWw6r/odKSBS5Trs44
         p/FCkcKhuV84I+qFQLy/382bgRv6BE04xL52VT13Ow7ZnK1wOU6V7XjhbovPLPcvH/e5
         /HHo33Ot7fz3hbnAxP3Op2lJ2iBBmfAaobo1BHx+V9Vo0RclZAuiysA4ryHj2FkyM/dZ
         5/+p5qm0LWWgjx4ipXc/O/npfiDsfHKYpVXmDEtcWVbnE2oqJp8JVmeTu/iDFZ1Jo2tJ
         nHlcMInc9bbtIa/5VbdKa3Q4XhkDp16SuZ6yAm/jagrt1RqIIayovVOMWSYDnh1Q5KOW
         m2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWvvuSFPhzX86MnxrBFsY6J5mTnZo0FYXVic7uKxaeCmtvJsCKrmS9NwGR8yLaKGn2xH1O8V14Wb0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx57RBZ1SZA0qBt5stuIH486bHbIrNH3dH+9QH7GCHFemkXcloG
	H8WpbCK74XrzSbvsvj7CrRFVP+SmcH9bLBy1y3dZH3gsSBzj0Cgvo7xa
X-Gm-Gg: ASbGnctX1QR8+HnqTQVUQXz0eTAc0zlPT8Uwj1xHwroAJF+lW9+mcJdrHwBkh4BU8YP
	JLkVznl1qVAOZwAq71vLRgBwWVWLm7WfRsb6vcV8sJxdbTploKmF5h1Z+TZYY9Tgbv8XTRkqKYR
	uxvqvPDmQIV1GYKYAJ8ZuZs5fLguNgE4WQRmENJtgmb/o1xFQYI1WBGN0Qd4JBoFMUWLg7rmsbC
	zFhZis35LBbAXsMFU+8h0BzrF7LGv+OMN8QvtyRVpYdm/ECoJneyxt4qbyjd42pfHfqSbd8mBpj
	4XFzdv70r/oBIYToDnHGuXFfDbnbwPprTDgXpEIxbnsHIMWf2oF6M6CKeYLwkvnwAEbVDPhQKLJ
	z00YPuXqbjS2WmTVOQ+Jb/JzzTgjUG1RX1xsnUa4cDZC3NX5ipBZ7RyHwVzGZt8cao/YmIsfVUp
	NT4uRecfrqRDlq9EHv466WXkShe80P/1aur+bMGsB1455HkbTt8yWyg1vYtn14
X-Google-Smtp-Source: AGHT+IHA2NuZn6kcL7SYzy0+2O+6yiAikMLG7Zb8Cmi7cpJKhSQh9n0KX5OcCRG4qTrhBgMEPNpBRQ==
X-Received: by 2002:a17:906:c10c:b0:b73:3e15:a370 with SMTP id a640c23a62f3a-b7a248164b9mr1377298866b.57.1765294868549;
        Tue, 09 Dec 2025 07:41:08 -0800 (PST)
Message-ID: <86a87823-8b15-4897-9a97-ade444e2830d@gmail.com>
Date: Tue, 9 Dec 2025 16:41:07 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <69dce344-4dee-4778-99c2-0621c4e17cfc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/9/25 12:38 PM, Jan Beulich wrote:
> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
>>   
>>       return rc;
>>   }
>> +
>> +/*
>> + * p2m_get_entry() should always return the correct order value, even if an
>> + * entry is not present (i.e. the GFN is outside the range):
>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>> + *
>> + * This ensures that callers of p2m_get_entry() can determine what range of
>> + * address space would be altered by a corresponding p2m_set_entry().
>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>> + *
>> + * Therefore, this function returns true for GFNs outside range (1), and in
>> + * that case the corresponding level is returned via the level_out argument.
>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>> + * find the proper entry.
>> + */
>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>> +                                   gfn_t boundary, bool is_lower,
>> +                                   unsigned int *level_out)
>> +{
>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>> +    bool ret = false;
>> +
>> +    ASSERT(p2m);
>> +
>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>> +    {
>> +        unsigned long mask = 0;
>> +
>> +        for ( ; level; level-- )
>> +        {
>> +            unsigned long masked_gfn;
>> +
>> +            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
>> +            masked_gfn = gfn_x(gfn) & mask;
>> +            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
> I fear I still don't fully understand this. I would have expected the same mask to
> be used for setting / clearing bits (once inverted, obviously). Why would you clear
> only some of the lower bits in one case but set all of them in the other?

Only when is_lower == true do we need to set the lower bits; in all other cases
this is not required, if i am not confusing something.

The idea is that if boundary = 0x1000 and gfn = 0x800, and is_lower == true,
then to return the correct level value we must set all lower bits of gfn to 1.
Otherwise, we would get level = root instead of level = 0 in this case.

I decided not to reuse mask to set the lower bits when is_lower == true, because
doing something like:

     mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
     masked_gfn = gfn_x(gfn) & mask;
     masked_gfn |= (is_lower * ~mask);

would allow ~mask to introduce 1s into the upper bits, which is not what we want.

> Overall, this alternative of clearing / setting of bits may also better (more
> clearly / readably) be expressed using if/else or a conditional operator.

Sure, I will rework it then, unless I have missed something in what I wrote above.

>> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
>> +                          : masked_gfn > gfn_x(boundary) )
>> +                break;
>> +        }
>> +
>> +        ret = true;
>> +    }
>> +
>> +    if ( level_out )
>> +        *level_out = level;
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Get the details of a given gfn.
>> + *
>> + * If the entry is present, the associated MFN will be returned and the
>> + * p2m type of the mapping.
> There may be a word order issue in this sentence, or there are words missing
> at the end. It more likely being the former, isn't the order being returned
> also worth mentioning, ...
>
>> + * The page_order will correspond to the order of the mapping in the page
>> + * table (i.e it could be a superpage).
> ... since this really is a separate piece of commentary?

I will reword it in the following way then:
  * If the entry is present, the associated MFN, the p2m type of the mapping,
  * and the page order of the mapping in the page table (i.e., it could be a
  * superpage) will be returned.

>
>> + * If the entry is not present, INVALID_MFN will be returned and the
>> + * page_order will be set according to the order of the invalid range.
> ... and type will be "invalid".

And this one I'll reword in the following way:

  * If the entry is not present, INVALID_MFN will be returned,
  * the page_order will be set according to the order of the invalid
  * range, and type will be p2m_invalid.


>
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order)
>> +{
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_locked(p2m));
>> +
>> +    if ( t )
>> +        *t = p2m_invalid;
> The sole caller passes non-NULL right now. Are you having patches pending
> where NULL would be passed? Else, this being a static helper, I'd suggest
> to drop the check here (and the other one further down).

I don’t have any such call in pending patches. I saw that Arm has a case
where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
so I decided to keep the check.

What you wrote makes sense to me, and given that the mem_access code is
Arm-specific, RISC-V will probably never have the same situation.
However, it still seems reasonable to keep this check for flexibility,
so that we don’t risk a NULL-pointer dereference in the future or end up
needing to reintroduce the check (or providing an unused variable for a type)
later. Does that make sense?

~ Oleksii


