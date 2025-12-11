Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC2CB5F6C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 14:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184067.1506613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgHV-0006z9-TX; Thu, 11 Dec 2025 13:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184067.1506613; Thu, 11 Dec 2025 13:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgHV-0006wU-QU; Thu, 11 Dec 2025 13:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1184067;
 Thu, 11 Dec 2025 13:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTgHU-0006wO-IM
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 13:00:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d51683e-d691-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 14:00:27 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64312565c10so70127a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 05:00:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6498210fceasm2376551a12.24.2025.12.11.05.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 05:00:25 -0800 (PST)
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
X-Inumbo-ID: 5d51683e-d691-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765458027; x=1766062827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQQgx4YpEOEzWKuIWcySB7cR0Hxy8vIMfoCjw7nek1g=;
        b=gTnflFOMfwQYu+U7FoRHVmQ1BGyKymzjyf/Vw82JqHM6AQvkVKXoHZUFJxHziUc+m1
         /TvwSFsH6Msc7IQ+ubXz8RP2JD4nuTVa6Ww2LITO5V2CrbbygeS5vP0Hai3x48Eq3ori
         fthQO7wIgia61k0hm1c4ueX+1UN8lsAJHCCELzVJKVG65UCG7rdeuyl7vLNJ0RRp0Mqm
         sr9iR2Cf/6iUqv3quq1JzuGkv0TjKtuT7zYroZ/tw6eJLdqOz+KOru7Qj3dWmRSOjq/P
         i1qfnaaepdKiBtEFiOmSWWabKaHRa8FfIPZjFiE4XZBPnV8/eKMuXoVcG4/r2xh+23z0
         BoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458027; x=1766062827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQQgx4YpEOEzWKuIWcySB7cR0Hxy8vIMfoCjw7nek1g=;
        b=T5HQP4lj732g6OWV/w4njZazoIUMO+fV1MeVra+FIxwsuMwz60BZmqIn7aSUnaxDUI
         UGoIoQCh9gu7pnHztlDU8dtzpDph6dGnxMrPnIhoGevSwxp88+cz50hMxHUDNaWZxjF+
         krvIw9JfRN3zr8mERX/QGBSywMMVEYIO8ALjr55JZq9cxYwiOH+5ZfN+fu06BbNSnMW8
         9nl+16tRVfjmRb4eMQsBEZiSuf7a0BwtDJvpT11Pt+gC9lVgI4gpOo7zxPKZt7goR13C
         87t0jg74PhFW6pejDcpQSWOxkv9jDGQeLHSwHPZ9PA2sWxb1YuGiAmYlRK/NiJSHhm3C
         E62Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI+FOI6idqQALqTWurVOPevUR+mw9e8mWEKMDgWtC4viELxamm7e/uzAHoU2/xWiqO/SweRl2GbmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeYLHz++M8EPZ7FWyHLxUNgED9UNOeGslJlXUc6ct5OlJJg9Y4
	VwWdjrQ3xAGXMI1tMZFnelcmfBhi56o3ZL0wdjoCbMz/3G/ovhOstOI1
X-Gm-Gg: AY/fxX53jeUH/S/YjAZL3XSMr7Gup7zpa7XEgiq/7wvRCcBO2GIk+gbJvd7aGTsg6Om
	qk2z/q4vMdtq5a5u111xahXacaby8f8wNFDn/GxVNP4qX+jlEuJi/m4DgJZDOPFwrteiZgg4GjK
	UUHrLFi2iEks7qi0aG7SquF3zwPPs5C+LPWg0MIxVIBjDTN+/BgwuJ+UQVb0sDzVgHO3d84Tv8N
	o2g8LqSE4JfyR110McG2KUqhQWwNR0z7y8etnGBFr5LX2MtTj5JmyghZSsvT58M9ZxzSQLscF7n
	2Da40kNr/fHSWCmXTYNoCDQSXJHYLfHfs5y90wCU8nP3wDqndlxnm6N522IdCz2AVgvhA0KjUo+
	kfpLExn7fS1W3tGxSTGpNh8UMumfs+zmtAIC5X5+UUFyhhx7Bis1WhjhhVBOvgTQxcU9pLclZW8
	wuB8f3YMQCcNDkkG74QD6oqJ0JMu4UFzPv33QTCBmEMXPAZVygGoaE0KX6YV3P
X-Google-Smtp-Source: AGHT+IHwDJn0nqacaVpE94+gAv01JJ6nXbCOPkl3t0cnwI32CixnsyeiJ62WAPZf2fAe2B0aTyW4hw==
X-Received: by 2002:a05:6402:440a:b0:649:83ec:759e with SMTP id 4fb4d7f45d1cf-64983ec77eamr2421511a12.33.1765458026462;
        Thu, 11 Dec 2025 05:00:26 -0800 (PST)
Message-ID: <b5aae12a-427f-4d11-b975-81fb1ce499c7@gmail.com>
Date: Thu, 11 Dec 2025 14:00:25 +0100
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
 <1a729d7b-0a80-49bb-a91f-c212bffb9bc2@gmail.com>
 <fb5f995f-a0b9-4b7a-936c-6fd3585a52a4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fb5f995f-a0b9-4b7a-936c-6fd3585a52a4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 10:34 AM, Jan Beulich wrote:
> On 10.12.2025 16:23, Oleksii Kurochko wrote:
>> On 12/9/25 4:49 PM, Jan Beulich wrote:
>>>>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>>>>> +                           p2m_type_t *t,
>>>>>> +                           unsigned int *page_order)
>>>>>> +{
>>>>>> +    unsigned int level = 0;
>>>>>> +    pte_t entry, *table;
>>>>>> +    int rc;
>>>>>> +    mfn_t mfn = INVALID_MFN;
>>>>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>>>>> +
>>>>>> +    ASSERT(p2m_is_locked(p2m));
>>>>>> +
>>>>>> +    if ( t )
>>>>>> +        *t = p2m_invalid;
>>>>> The sole caller passes non-NULL right now. Are you having patches pending
>>>>> where NULL would be passed? Else, this being a static helper, I'd suggest
>>>>> to drop the check here (and the other one further down).
>>>> I don’t have any such call in pending patches. I saw that Arm has a case
>>>> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
>>>> so I decided to keep the check.
>>>>
>>>> What you wrote makes sense to me, and given that the mem_access code is
>>>> Arm-specific, RISC-V will probably never have the same situation.
>>>> However, it still seems reasonable to keep this check for flexibility,
>>>> so that we don’t risk a NULL-pointer dereference in the future or end up
>>>> needing to reintroduce the check (or providing an unused variable for a type)
>>>> later. Does that make sense?
>>> To a degree. The other perspective is that the check is dead code right now,
>>> and dead code is often disliked (e.g. by Misra). Introducing the check when
>>> it becomes necessary is pretty simple.
>> Similar check might be needed for p2m_get_page_from_gfn(), because in the pending
>> patches I have a call where t = NULL:
> My initial reaction would be "add the checking in that patch then".
>
>> unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void
>> *buf, unsigned int len) { - return -EINVAL; + /* XXX needs to handle
>> faults */ + paddr_t addr = gpa; + unsigned offset = PAGE_OFFSET(addr); +
>> + BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t)); +
>> BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t)); + + printk(XENLOG_INFO
>> "copying d%d %#02lx-%#02lx to %#02lx-%#02lx\n", + d->domain_id,
>> (unsigned long)buf, (unsigned long)buf+len, addr, + addr+len); + + while
>> ( len ) + { + void *p; + unsigned size = min(len, (unsigned)PAGE_SIZE -
>> offset); + struct page_info *page; + + page =
>> p2m_get_page_from_gfn(p2m_get_hostp2m(d) , gaddr_to_gfn(addr), NULL); +
>> if ( page == NULL ) + return len; It now seems that I don’t actually
>> need p2m_get_page_from_gfn(), as it is no longer used. I could drop it
>> for now and reintroduce it later when it is truly needed by
>> copy_to_guest_phys() or get_page_from_gfn(). Is it acceptable to keep
>> p2m_get_page_from_gfn() as it is now, even without any current callers?
>> Would it be considered dead code?
> Sorry, as you may see your response was effectively unreadable. Looks
> like all newlines were zapped for whatever reason, and then new were
> ones inserted just to wrap the resulting long line.

Fully unreadable. I wrote there that in the copy_to_guest_phys() here
(https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/guestcopy.c?ref_type=heads#L31)
there is a call of p2m_get_page_from_gfn() with t = NULL.

It now seems that I don’t actually need p2m_get_page_from_gfn(), as it
is no longer used in this patch series. I could drop it for now and
reintroduce it later when it is truly needed by copy_to_guest_phys() or
get_page_from_gfn(). Is it acceptable to keep p2m_get_page_from_gfn()
as it is now (with adding a NULL check pointer for 't' argument),
even without any current callers?
Would it be considered dead code?

~ Oleksii


