Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852DCB62BE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 15:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184155.1506673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThWx-0004CN-QA; Thu, 11 Dec 2025 14:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184155.1506673; Thu, 11 Dec 2025 14:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThWx-0004AU-NF; Thu, 11 Dec 2025 14:20:31 +0000
Received: by outflank-mailman (input) for mailman id 1184155;
 Thu, 11 Dec 2025 14:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vThWw-0004AO-8W
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 14:20:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b526447-d69c-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 15:20:29 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7a02592efaso22361166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 06:20:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5cf210sm286697066b.60.2025.12.11.06.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 06:20:27 -0800 (PST)
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
X-Inumbo-ID: 8b526447-d69c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765462828; x=1766067628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8J6AElJm49mGn7pfKTUapbD/RF7y6PHog29OIbazPg=;
        b=R/9JAFyH0etOO26Lg83SEsMnwSoLumZGnRimc20CWHPjxr/dzRdcpe9AGQSHPkwYaw
         /Cgt1K/YWMUcTCrujLwCeWWJZSW0VyYLF0POTBbBDHGUZUlPI67Jqw00J71vW9ou7KQP
         H/ipQcqzE7Zw+YEhlToCODtn0JbB8OLv10VYZEguu1iWREGLnChXqpaHWUF899whiBQo
         KHA/Thq2UImeTZKypk6VgrBblhUPS9EJuRbygJiqLr9z6dPXI0/CXxiS9rwkI2V+nrKh
         0ii4n+CEhNfTPVy3VhCKY+bQCkJ6Hwqa2EJbL21vkwYGeChdq55uABwbk23+DLP+91nG
         hGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765462828; x=1766067628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8J6AElJm49mGn7pfKTUapbD/RF7y6PHog29OIbazPg=;
        b=WtM9dCJfIayVW3mQugnfgBEkOPEoTmisrmLCjc6m1jdOQVOLnR9UiF8cz5nPxWDBOB
         e07VdYnGBiFMgevWVaC3YPDkXe1I4PtA+qxj2zUmjL1PzfMF5zpod4VHZIY/GDswdkcZ
         OG9zeI3FFbZYzKRgGJ3S6V0N0wGNWsXiGR8ZOljzuL6OQ2E9ZF/PS4n+0jKX6AhukKiL
         3k0qyuOk0g6wramLYWTewKGjSqCFxtYTJBSxTejIPbKlj09igK7XZEUICVYWa5fyZ5IY
         9R4JaFXGkhafASGZCxSCgBeeZWfhVd3Qx7HYunhFyvYXeC1Len+CWehe9cy5Ifkp1Xu8
         GN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnaYEOyMPhU1CQ7yj8O2sJlOBpV3lvddZ6/YpVjQdWchbzXqXerRI9C/9sPJ0JvC5kzqZEjrhTWEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE9W9eO6lPz9Iu1aBklDdT+guwqgSxexhqXva+vYGkup3OTugc
	PpY4PjODpm6ZrUoGl+9+G7zQKZCOv8Ct7tAHfduATXXYo04yJxN5n6Qc
X-Gm-Gg: AY/fxX5gSIkdpYrEuw9LtkaEMkRfWF22vWLW9RLaukZno/rB5xWXWMaOfded1SUD1pm
	iEuWcOWsC1oWshTUuNWbf3llGpQcij08jaJkpPFkXpS9+n/A24XloUdtUZE5vrWYvqsXMCFA2PD
	WLkesIvzz/E2OipX16gd8QxSUjPGYdC685/VG5Cc9/MSpvHNUYO+YPe/4uHUboVBOcwBQPAScpp
	GGMiCj9j7Wb9MGXJ7kQ/smbe5Gl/zHC3TeXGSzNtLcbO+6K4KjdIX3RNfiYbHFDnOi/4ZD//Yil
	DqmXETmyc1japPCVuwxYzrfRQenxwN50vl+Iqe80nS02U4Rzayx74dtkkOjhWt8atdgPIyPG6bP
	AhidvjUwtpmCMZZOQFjfnS42TCpd/woyHsbUT0yELMhpzidbCMuQe/nkDngk1i2BJZZO0UpPhar
	yJgTI7qxRro2u6vWqHqWjvm/Sm3lQa11x/bfU3+TJW1FQiX1Zcq/yAMths2Oh5
X-Google-Smtp-Source: AGHT+IG67Tp++rQRVYC5U4WE9LoXeCigY6F22ljK6vYTvKt6oEfeWD+UjTOgmQW8DhSF1OzF++VCBw==
X-Received: by 2002:a17:906:6a1b:b0:b6d:5262:a615 with SMTP id a640c23a62f3a-b7ce841dd27mr709362966b.41.1765462828045;
        Thu, 11 Dec 2025 06:20:28 -0800 (PST)
Message-ID: <7908312c-f55e-4bd0-8af8-be59cda836ca@gmail.com>
Date: Thu, 11 Dec 2025 15:20:26 +0100
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
 <b5aae12a-427f-4d11-b975-81fb1ce499c7@gmail.com>
 <18d40c29-4813-4673-9892-35f5df99fa0c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18d40c29-4813-4673-9892-35f5df99fa0c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 2:40 PM, Jan Beulich wrote:
> On 11.12.2025 14:00, Oleksii Kurochko wrote:
>> On 12/11/25 10:34 AM, Jan Beulich wrote:
>>> On 10.12.2025 16:23, Oleksii Kurochko wrote:
>>>> On 12/9/25 4:49 PM, Jan Beulich wrote:
>>>>>>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>>>>>>> +                           p2m_type_t *t,
>>>>>>>> +                           unsigned int *page_order)
>>>>>>>> +{
>>>>>>>> +    unsigned int level = 0;
>>>>>>>> +    pte_t entry, *table;
>>>>>>>> +    int rc;
>>>>>>>> +    mfn_t mfn = INVALID_MFN;
>>>>>>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>>>>>>> +
>>>>>>>> +    ASSERT(p2m_is_locked(p2m));
>>>>>>>> +
>>>>>>>> +    if ( t )
>>>>>>>> +        *t = p2m_invalid;
>>>>>>> The sole caller passes non-NULL right now. Are you having patches pending
>>>>>>> where NULL would be passed? Else, this being a static helper, I'd suggest
>>>>>>> to drop the check here (and the other one further down).
>>>>>> I don’t have any such call in pending patches. I saw that Arm has a case
>>>>>> where it is called with t = NULL (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/mem_access.c#L64),
>>>>>> so I decided to keep the check.
>>>>>>
>>>>>> What you wrote makes sense to me, and given that the mem_access code is
>>>>>> Arm-specific, RISC-V will probably never have the same situation.
>>>>>> However, it still seems reasonable to keep this check for flexibility,
>>>>>> so that we don’t risk a NULL-pointer dereference in the future or end up
>>>>>> needing to reintroduce the check (or providing an unused variable for a type)
>>>>>> later. Does that make sense?
>>>>> To a degree. The other perspective is that the check is dead code right now,
>>>>> and dead code is often disliked (e.g. by Misra). Introducing the check when
>>>>> it becomes necessary is pretty simple.
>>>> Similar check might be needed for p2m_get_page_from_gfn(), because in the pending
>>>> patches I have a call where t = NULL:
>>> My initial reaction would be "add the checking in that patch then".
>>>
>>>> unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void
>>>> *buf, unsigned int len) { - return -EINVAL; + /* XXX needs to handle
>>>> faults */ + paddr_t addr = gpa; + unsigned offset = PAGE_OFFSET(addr); +
>>>> + BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t)); +
>>>> BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t)); + + printk(XENLOG_INFO
>>>> "copying d%d %#02lx-%#02lx to %#02lx-%#02lx\n", + d->domain_id,
>>>> (unsigned long)buf, (unsigned long)buf+len, addr, + addr+len); + + while
>>>> ( len ) + { + void *p; + unsigned size = min(len, (unsigned)PAGE_SIZE -
>>>> offset); + struct page_info *page; + + page =
>>>> p2m_get_page_from_gfn(p2m_get_hostp2m(d) , gaddr_to_gfn(addr), NULL); +
>>>> if ( page == NULL ) + return len; It now seems that I don’t actually
>>>> need p2m_get_page_from_gfn(), as it is no longer used. I could drop it
>>>> for now and reintroduce it later when it is truly needed by
>>>> copy_to_guest_phys() or get_page_from_gfn(). Is it acceptable to keep
>>>> p2m_get_page_from_gfn() as it is now, even without any current callers?
>>>> Would it be considered dead code?
>>> Sorry, as you may see your response was effectively unreadable. Looks
>>> like all newlines were zapped for whatever reason, and then new were
>>> ones inserted just to wrap the resulting long line.
>> Fully unreadable. I wrote there that in the copy_to_guest_phys() here
>> (https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/guestcopy.c?ref_type=heads#L31)
>> there is a call of p2m_get_page_from_gfn() with t = NULL.
>>
>> It now seems that I don’t actually need p2m_get_page_from_gfn(), as it
>> is no longer used in this patch series. I could drop it for now and
>> reintroduce it later when it is truly needed by copy_to_guest_phys() or
>> get_page_from_gfn(). Is it acceptable to keep p2m_get_page_from_gfn()
>> as it is now (with adding a NULL check pointer for 't' argument),
>> even without any current callers?
>> Would it be considered dead code?
> As said, as long as no Misra checks are run on the RISC-V part of the
> tree, no dead code concerns really exist. As to the NULL check - if the
> sole (future) caller passes NULL, then why have the parameter at all?

Because there is another caller of p2m_get_page_from_gfn() — get_page_from_gfn(),
which also uses the 't' parameter, and at least in the common code there are
cases where 't' != NULL.

~ Oleksii


