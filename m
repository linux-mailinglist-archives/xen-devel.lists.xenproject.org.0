Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B84CB55CF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183752.1506349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd4I-0007rK-DR; Thu, 11 Dec 2025 09:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183752.1506349; Thu, 11 Dec 2025 09:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd4I-0007oD-Al; Thu, 11 Dec 2025 09:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1183752;
 Thu, 11 Dec 2025 09:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTd4G-0007o7-PA
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:34:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b0e394a-d674-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 10:34:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so7437695e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 01:34:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b85dd1sm4740818f8f.20.2025.12.11.01.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 01:34:34 -0800 (PST)
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
X-Inumbo-ID: 9b0e394a-d674-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765445675; x=1766050475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gYW6+VcpGPh9mtCsq7EmYPfKojzF1qeMc7yDi726lj0=;
        b=IncXQbVSMab2gIVrjpwK6li2FUq5jaFdamh86G3fbz0XPZOaxqBtk680o4M99mYsFL
         KPzATb7Jusqu/HLJXvhnvP59fN/yYAOvdAooYG/1eMfWvrb3134SMVz0j4mQChZEw74+
         0DhsXZh1SUchDDHRyWPaVqHiMNWgXrOKPwVQUYvpwOrjb3cKy1rTbvjHVUO9aKG+t7Mg
         vfOFkesk35n4cUFn8r+x2bM2FMlfTviREkEjwm6AoE+7PPRDrVFSaHeFovgH+qZ7YlC4
         J1SV9HkMUK1yyNXq4QlhN/3jTM0wXtsGCcWrrzQLnFh3yTAPcEn8TnNB+LZHUA/UMXNC
         d9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445675; x=1766050475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYW6+VcpGPh9mtCsq7EmYPfKojzF1qeMc7yDi726lj0=;
        b=JoivlvcsLElytyYHKEk+qh9MhWre/Jc3jdyDI+qlNqWis+5kzTV+wg92LHFfIX4Mkb
         BL6t+nUu5KQ5XvbSTHStwuGK0CG6bLKXtwZh8cSnI7jQ377aW6JfZTdRU6+sAp5yIQXm
         wt2HVA/6k88FYpOHVarr6UHthY6MBUY3OiVRukkXQF0bGH6bxxQTobeN4ZJpeNS9auKn
         FoZOHA9QYLGwHjxIRiBzSR1HGgp1bOcEhJn6AR2cokN5dnHOgZkggLJjbWdMMZjmrjy5
         3EFer/4sNhmB6f+5vEeUbO2eqXM/B5cpZd2yOf9yU9PRJ1yM4/sGqQcCcROM397ePvKh
         0B0g==
X-Forwarded-Encrypted: i=1; AJvYcCUST/YbWxvGpHAX7Diuz+mywKD1B34e6sxS+FjlJv1scwPwyu3/H9Jv3BDPP88EiMIFbyHBPxdaaLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDeVn+e2F7P0itfj/A3M9MWO/MQX5g2O2mtlTLGWIklDrJ/xCX
	r9Vq++yHzJNSMGYAK9gqGC4UxZ5FzEXG1g735Gkt1Idcb8PKU9dlcg1RWjKK3vvRtQ==
X-Gm-Gg: AY/fxX50LYL/ymp9r5NYYT0s8/oqqZU6+nHJJ+IApeeMfP79vA67AUERyh9oLGpag4s
	MegWkGn+Bm72gpfdwD3Htg8vm6g/zy2zDxVOs1TCgeCf3XalmmVZurvXMHWwGK+Xp5zKtpMo4Kq
	9AYFy8f7dMYyakEUldF5Q7WWN+UKjQ1t38PfzZ0P79DGLui4rukPsvVqIqAAG5JFPMccL3OEmN8
	Dy+dAYbEes8K5FowUEq0uLWLLVd4jIKvf/gIj+4gk5rdDjp6kju6Ka2y4Xo0CeuHk2mpygtI6CK
	uI8nnYuU4wjTmA6SrkXDWXkdFeH31uGTH/8EysH9QlMH8Hx0PPnitDooj8Bx4FvX8BR29A4sRDN
	MG3iAsnus4LzM5HOJ6RiFof1OhB+Pha+AA17okvWHok+x6k4uEjiD4Lt5AhTZ7N6wO7EcRLlw/L
	looMuKWnoYmvhyemNfFqgzco+8uqYLWlWev13bQ8Nmu3F3nPd8xB9c2fU/rVxUndBH+Z0u4/zLM
	J8=
X-Google-Smtp-Source: AGHT+IHU3sxbK3jdqNLFAb2TbfuEWcQhRiADeDOxme2AS+z/V5iwFlrsgwhJfuQ48CfWxtCdqtYSWQ==
X-Received: by 2002:a05:600c:a0a:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47a8375ab54mr54123305e9.14.1765445674847;
        Thu, 11 Dec 2025 01:34:34 -0800 (PST)
Message-ID: <fb5f995f-a0b9-4b7a-936c-6fd3585a52a4@suse.com>
Date: Thu, 11 Dec 2025 10:34:32 +0100
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
 <1a729d7b-0a80-49bb-a91f-c212bffb9bc2@gmail.com>
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
In-Reply-To: <1a729d7b-0a80-49bb-a91f-c212bffb9bc2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 16:23, Oleksii Kurochko wrote:
> 
> On 12/9/25 4:49 PM, Jan Beulich wrote:
>>>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>>>> +                           p2m_type_t *t,
>>>>> +                           unsigned int *page_order)
>>>>> +{
>>>>> +    unsigned int level = 0;
>>>>> +    pte_t entry, *table;
>>>>> +    int rc;
>>>>> +    mfn_t mfn = INVALID_MFN;
>>>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>>>> +
>>>>> +    ASSERT(p2m_is_locked(p2m));
>>>>> +
>>>>> +    if ( t )
>>>>> +        *t = p2m_invalid;
>>>> The sole caller passes non-NULL right now. Are you having patches pending
>>>> where NULL would be passed? Else, this being a static helper, I'd suggest
>>>> to drop the check here (and the other one further down).
>>> I don’t have any such call in pending patches. I saw that Arm has a case
>>> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
>>> so I decided to keep the check.
>>>
>>> What you wrote makes sense to me, and given that the mem_access code is
>>> Arm-specific, RISC-V will probably never have the same situation.
>>> However, it still seems reasonable to keep this check for flexibility,
>>> so that we don’t risk a NULL-pointer dereference in the future or end up
>>> needing to reintroduce the check (or providing an unused variable for a type)
>>> later. Does that make sense?
>> To a degree. The other perspective is that the check is dead code right now,
>> and dead code is often disliked (e.g. by Misra). Introducing the check when
>> it becomes necessary is pretty simple.
> 
> Similar check might be needed for p2m_get_page_from_gfn(), because in the pending
> patches I have a call where t = NULL:

My initial reaction would be "add the checking in that patch then".

> unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void 
> *buf, unsigned int len) { - return -EINVAL; + /* XXX needs to handle 
> faults */ + paddr_t addr = gpa; + unsigned offset = PAGE_OFFSET(addr); + 
> + BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t)); + 
> BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t)); + + printk(XENLOG_INFO 
> "copying d%d %#02lx-%#02lx to %#02lx-%#02lx\n", + d->domain_id, 
> (unsigned long)buf, (unsigned long)buf+len, addr, + addr+len); + + while 
> ( len ) + { + void *p; + unsigned size = min(len, (unsigned)PAGE_SIZE - 
> offset); + struct page_info *page; + + page = 
> p2m_get_page_from_gfn(p2m_get_hostp2m(d) , gaddr_to_gfn(addr), NULL); + 
> if ( page == NULL ) + return len; It now seems that I don’t actually 
> need p2m_get_page_from_gfn(), as it is no longer used. I could drop it 
> for now and reintroduce it later when it is truly needed by 
> copy_to_guest_phys() or get_page_from_gfn(). Is it acceptable to keep 
> p2m_get_page_from_gfn() as it is now, even without any current callers? 
> Would it be considered dead code?

Sorry, as you may see your response was effectively unreadable. Looks
like all newlines were zapped for whatever reason, and then new were
ones inserted just to wrap the resulting long line.

Jan

