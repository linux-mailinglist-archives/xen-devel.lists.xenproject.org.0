Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9ECB34B9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 16:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183019.1505809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTM2O-0001YA-1s; Wed, 10 Dec 2025 15:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183019.1505809; Wed, 10 Dec 2025 15:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTM2N-0001VA-VH; Wed, 10 Dec 2025 15:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1183019;
 Wed, 10 Dec 2025 15:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTM2M-0001V4-R6
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 15:23:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dfdc0b5-d5dc-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 16:23:29 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b735487129fso1059075966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 07:23:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7c2a3911e9sm338127566b.15.2025.12.10.07.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 07:23:27 -0800 (PST)
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
X-Inumbo-ID: 2dfdc0b5-d5dc-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765380208; x=1765985008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFnTuPlzwda6kNJXQsEgscCHGwtZpBkjXAEzqVrHV6c=;
        b=YzjQZXXfSpgMZRfW6u+vEHJ+taoKE3VG/dUz93MgSgkZNhxJWuENVa5O2Ya9/9A09L
         BXhyc5yfx45o+qgfQEsFyWGWeyC3aW/TsAEDN5Y32MpMWFFWJdDlXaYGm9MicjQPvxZI
         bd2XFCZs2TcAWD1oXmg7qum93J53m0jHBOjiIi4Cxu3N3M9Y1EfqdfPrmYA025/pMHAE
         gH+92NeldQ/OQuuIo3O4dVVNljqVvu9+Kb2iI/2r9G+lR6vweKB4/KJxgMEBWAv46XjL
         poHUxLsMkK3MtM9RzJzVLx68198+QWayHzPH+gMLRE9wwolzg8yn/HZt+vVxjeH8AFkj
         mifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765380208; x=1765985008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFnTuPlzwda6kNJXQsEgscCHGwtZpBkjXAEzqVrHV6c=;
        b=EuyYC/WfdQOY7+Y0qHqIvCoL5QQkVE5CZnqoFiRbwym4D+AXBGQqzDMeZq2/ofkH0H
         mZU+4/ZRhcFoDznGzLOgIW4HrX8jzWFRktVD9dP7XVdG+CNSwQzG9I5WhqpKvTyH8QkO
         1HqPQpQKmrGsH5Jm5cmL5trTTC+WFoipDsvOZ3dfKuqgOpg6zerF8OwQVAOtw3lQfNOm
         W7Dn4giyzl+mg2Bvd5zNSGpQ/y+2ngTk+ydb6mlAfpEXc3LuOc32NlKFA4/4HOx3JchZ
         me+XIwjdEroCqti7EOLY4Cly/nEHleRCZIeEPW9W90H6wUcqbEWYCBSTkKY4PUaXBJGe
         Ekdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqasFwiGJaWRxQTecOczrmg5vxf/z2Bsa9JAjqqKmIaCCe/fzaiOfXB6wioEORhMnYzMjBPEE8Hy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzQ0Gmm8AWVdGD/d68m7uMAWpSdx4kG4iVYLAJdbNISWgTYLfN
	TXemKZ413B101caRPS21lQgyJ07K0PEDxO55i103/qMo/LAMnfZmdO8t
X-Gm-Gg: ASbGncvPii0LOB9/58HpzZ0V0UznOydTclLe97NBmFCVWmOc8pSw7WhQpi4mn+sVgLw
	OulnWsrf6WMAun9XvGd2Qg7sBsv7yFGl4Flz5JpV8Th0e2kZjQk17GZ1/2s0wyvoIvcGTLlT+hH
	+SH/yqkQLJ4lCQOSdnCUBFfWbmXvEucvQbWl2QN2eIFb40Gux5W7Lz4FisjU1vt7+Hq3JdvPlac
	GgFUzMOk2NW2WT6zNX98V4zQiZkxdmrYGGkPZBuo20vB1P5FZCqBOs1ydwGb2lXnCYG+BDEBfZs
	qoFKsSKTT0zjifATa33k6z7RKqmLrhYMGq8aPhtxvVfYwsgB5QrSxwGuU/X6eB/N02deyoA9Wis
	FrSBdo1fkVe4MixfUO2rvE8ZHTcMakxYb+qnzwXiKodmdu2w4R8zgGo5tBTQsIaWGUzcicEMYqj
	uSLn9w+kh6+kqPgwomQtL/wZE2Kul2TYNOhEzKQGUDotuXkkxBe8uwxGG2Ca62
X-Google-Smtp-Source: AGHT+IFr/YwqdgpjKu+zR4l534dB24bbdUVreQgevIC4+D+FiQFZfghwSvDinMtbs3rd2taxAjZ7xw==
X-Received: by 2002:a17:907:1c25:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b7ce84514demr287150966b.49.1765380208277;
        Wed, 10 Dec 2025 07:23:28 -0800 (PST)
Message-ID: <1a729d7b-0a80-49bb-a91f-c212bffb9bc2@gmail.com>
Date: Wed, 10 Dec 2025 16:23:26 +0100
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

Similar check might be needed for p2m_get_page_from_gfn(), because in the pending
patches I have a call where t = NULL:
unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void 
*buf, unsigned int len) { - return -EINVAL; + /* XXX needs to handle 
faults */ + paddr_t addr = gpa; + unsigned offset = PAGE_OFFSET(addr); + 
+ BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t)); + 
BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t)); + + printk(XENLOG_INFO 
"copying d%d %#02lx-%#02lx to %#02lx-%#02lx\n", + d->domain_id, 
(unsigned long)buf, (unsigned long)buf+len, addr, + addr+len); + + while 
( len ) + { + void *p; + unsigned size = min(len, (unsigned)PAGE_SIZE - 
offset); + struct page_info *page; + + page = 
p2m_get_page_from_gfn(p2m_get_hostp2m(d) , gaddr_to_gfn(addr), NULL); + 
if ( page == NULL ) + return len; It now seems that I don’t actually 
need p2m_get_page_from_gfn(), as it is no longer used. I could drop it 
for now and reintroduce it later when it is truly needed by 
copy_to_guest_phys() or get_page_from_gfn(). Is it acceptable to keep 
p2m_get_page_from_gfn() as it is now, even without any current callers? 
Would it be considered dead code?

~ Oleksii


