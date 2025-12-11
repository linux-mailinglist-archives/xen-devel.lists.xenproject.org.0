Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE9CB60F8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 14:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184114.1506643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgua-0005Y6-BH; Thu, 11 Dec 2025 13:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184114.1506643; Thu, 11 Dec 2025 13:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgua-0005Vs-8c; Thu, 11 Dec 2025 13:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1184114;
 Thu, 11 Dec 2025 13:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTguZ-0005Vc-A9
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 13:40:51 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00fa36ec-d697-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 14:40:49 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so1184495e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 05:40:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f74291sm34846115e9.11.2025.12.11.05.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 05:40:48 -0800 (PST)
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
X-Inumbo-ID: 00fa36ec-d697-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765460449; x=1766065249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mRgjWfRt+yQTyUzxq7qqkKsCdvYmP/R7g/oEi38JTWA=;
        b=CetOPnFpNPWu2iWuSUUsGjAgLviDjfHp1SsXpx1/OUprPXiloUhij5H/BIE6IY5S2C
         HdpzaA20+Pqtqfta2xqkOYZ30eJRUQCZ4gS97FI6xIVI5seBJuEwbFv/sRTOgYDzxHlb
         HcAdgxFKGl904H8wO/f0JZxjQFeBk52jtEdKhu/DgRYFNSszzw0lIvHZpPmLDnjtoDyJ
         5YXFL9E3SyHL18WNJy+h8DUSCwKIfdVaoqo7QcF/M3Qc/ZrLkKgF7/2TR9suKHJ+y2Qc
         K4niQQWRIZVVD6IqgQ42j85puLlgblaFXcHGhzcI31JFChSkbUzDFpLkuwYkbXG5dVq3
         Dm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460449; x=1766065249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRgjWfRt+yQTyUzxq7qqkKsCdvYmP/R7g/oEi38JTWA=;
        b=xCkW5cNPzU4YLSOXjqQ9Foi5WWoOIBZoe65if6sY1luI/FZC0ndxJv8Gb5Q+uxoIrl
         IlkBDTLQxj/90PSfcR8V+fzIolz/2ffo+XjFsxXhhZyvX6ln8ddTZDlnh30PkSW2t58D
         hWCyNDuk+mN3JxodfIgz1Vxd3NBWFWzmEMJJq/ttU0C1uXHasn1FvOYsE91I9SrBLRU5
         C1n1prUif6LYPUzM9t07boQoe28fyGKu8dkSA7SiudcpEX58pCmpbRTpqv7jIVk5XRKE
         7AmZV0ijrrnBEfoMeOISOksnrpS6kaYqrWPGmP4OdeLzOWBDOV0LTd0Jvv1lXmqdetOi
         u3sw==
X-Forwarded-Encrypted: i=1; AJvYcCX7WbsXi930KALPtnAnQYOW9VZ1fDSkVcaJvWMZxug6zyleKuT1eG79NBFCeIpLgV9PnLzUQxUQyeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/n3Ej1JN6vysXzPW0z6I6/3jXGZnfkpGFD7SkOtsTovoxlWWY
	qtYVAQnK0AWiGWL6XbnBvFTl64aBLhZu0EBaFCxPh9DwbkhBiYGn5NzxoyNzxKUbag==
X-Gm-Gg: AY/fxX6UR5+1xPKG3nrwKY0VZFn8f4OZhqWwygXgbpmCkHSMiuiAX9H15Hjk7zwSOmo
	K2olYUuU3Nn2dguXIzl3UiRVtrAUN8d/dpnonLwflt1iRNQdHRiHAhGj+V+CO3aK+4i1HVai5aZ
	5IojxwulhBfc69zJawEND+AgiB24eyXtDYy0DQGtRDf1ZbpewQPkoyCO0f27+TLd2neetEEU8vK
	TE4sTADzfAgMGyn5gzuv+W9oxUe4QdMBpGPxX+sH2GoyIEeplNKX1AqcR8jDsWLoUn+rf1qoAwn
	5QkIsBifEMipGSGroLRi9P5mDK5v51UvzLeSqX5E3cIgyo/liDU5afMMCuPuZqch4Wpb+IF/dMG
	i1gpvPrcEf44sE8w8kuq6GSTnJwYerkbltWZK+AxP8TKKSNxJ3AAOLc/vuju2c5nY9J/G3SRQK+
	fEZ4VLqA+ttJZxA8S4pIopQPZVBCgbaTo3PX1kEhvra5d2KqmXeWDwTNuSQFBphdWDrNSdHRwMH
	EM=
X-Google-Smtp-Source: AGHT+IEKVrnSjn3BG/OOSrIx/841DXFAN4SifhkJjVT1vLxkRZL6YfvlhFEDSa+NeknkgeNb83aceA==
X-Received: by 2002:a05:600c:8288:b0:47a:7fd0:9efc with SMTP id 5b1f17b1804b1-47a8380c918mr72874925e9.15.1765460448867;
        Thu, 11 Dec 2025 05:40:48 -0800 (PST)
Message-ID: <18d40c29-4813-4673-9892-35f5df99fa0c@suse.com>
Date: Thu, 11 Dec 2025 14:40:46 +0100
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
 <fb5f995f-a0b9-4b7a-936c-6fd3585a52a4@suse.com>
 <b5aae12a-427f-4d11-b975-81fb1ce499c7@gmail.com>
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
In-Reply-To: <b5aae12a-427f-4d11-b975-81fb1ce499c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 14:00, Oleksii Kurochko wrote:
> 
> On 12/11/25 10:34 AM, Jan Beulich wrote:
>> On 10.12.2025 16:23, Oleksii Kurochko wrote:
>>> On 12/9/25 4:49 PM, Jan Beulich wrote:
>>>>>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>>>>>> +                           p2m_type_t *t,
>>>>>>> +                           unsigned int *page_order)
>>>>>>> +{
>>>>>>> +    unsigned int level = 0;
>>>>>>> +    pte_t entry, *table;
>>>>>>> +    int rc;
>>>>>>> +    mfn_t mfn = INVALID_MFN;
>>>>>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>>>>>> +
>>>>>>> +    ASSERT(p2m_is_locked(p2m));
>>>>>>> +
>>>>>>> +    if ( t )
>>>>>>> +        *t = p2m_invalid;
>>>>>> The sole caller passes non-NULL right now. Are you having patches pending
>>>>>> where NULL would be passed? Else, this being a static helper, I'd suggest
>>>>>> to drop the check here (and the other one further down).
>>>>> I don’t have any such call in pending patches. I saw that Arm has a case
>>>>> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
>>>>> so I decided to keep the check.
>>>>>
>>>>> What you wrote makes sense to me, and given that the mem_access code is
>>>>> Arm-specific, RISC-V will probably never have the same situation.
>>>>> However, it still seems reasonable to keep this check for flexibility,
>>>>> so that we don’t risk a NULL-pointer dereference in the future or end up
>>>>> needing to reintroduce the check (or providing an unused variable for a type)
>>>>> later. Does that make sense?
>>>> To a degree. The other perspective is that the check is dead code right now,
>>>> and dead code is often disliked (e.g. by Misra). Introducing the check when
>>>> it becomes necessary is pretty simple.
>>> Similar check might be needed for p2m_get_page_from_gfn(), because in the pending
>>> patches I have a call where t = NULL:
>> My initial reaction would be "add the checking in that patch then".
>>
>>> unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void
>>> *buf, unsigned int len) { - return -EINVAL; + /* XXX needs to handle
>>> faults */ + paddr_t addr = gpa; + unsigned offset = PAGE_OFFSET(addr); +
>>> + BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t)); +
>>> BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t)); + + printk(XENLOG_INFO
>>> "copying d%d %#02lx-%#02lx to %#02lx-%#02lx\n", + d->domain_id,
>>> (unsigned long)buf, (unsigned long)buf+len, addr, + addr+len); + + while
>>> ( len ) + { + void *p; + unsigned size = min(len, (unsigned)PAGE_SIZE -
>>> offset); + struct page_info *page; + + page =
>>> p2m_get_page_from_gfn(p2m_get_hostp2m(d) , gaddr_to_gfn(addr), NULL); +
>>> if ( page == NULL ) + return len; It now seems that I don’t actually
>>> need p2m_get_page_from_gfn(), as it is no longer used. I could drop it
>>> for now and reintroduce it later when it is truly needed by
>>> copy_to_guest_phys() or get_page_from_gfn(). Is it acceptable to keep
>>> p2m_get_page_from_gfn() as it is now, even without any current callers?
>>> Would it be considered dead code?
>> Sorry, as you may see your response was effectively unreadable. Looks
>> like all newlines were zapped for whatever reason, and then new were
>> ones inserted just to wrap the resulting long line.
> 
> Fully unreadable. I wrote there that in the copy_to_guest_phys() here
> (https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/guestcopy.c?ref_type=heads#L31)
> there is a call of p2m_get_page_from_gfn() with t = NULL.
> 
> It now seems that I don’t actually need p2m_get_page_from_gfn(), as it
> is no longer used in this patch series. I could drop it for now and
> reintroduce it later when it is truly needed by copy_to_guest_phys() or
> get_page_from_gfn(). Is it acceptable to keep p2m_get_page_from_gfn()
> as it is now (with adding a NULL check pointer for 't' argument),
> even without any current callers?
> Would it be considered dead code?

As said, as long as no Misra checks are run on the RISC-V part of the
tree, no dead code concerns really exist. As to the NULL check - if the
sole (future) caller passes NULL, then why have the parameter at all?

Jan

