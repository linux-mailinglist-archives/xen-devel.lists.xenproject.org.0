Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741A83A4AB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670818.1043847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZ3y-0006lz-3L; Wed, 24 Jan 2024 08:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670818.1043847; Wed, 24 Jan 2024 08:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZ3x-0006jb-Vx; Wed, 24 Jan 2024 08:56:49 +0000
Received: by outflank-mailman (input) for mailman id 670818;
 Wed, 24 Jan 2024 08:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSZ3w-0006jF-TU
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:56:48 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817f5d03-ba96-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 09:56:47 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cddb0ee311so56379441fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:56:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x4-20020a056e020f0400b00361b6a1e6aasm2960866ilj.87.2024.01.24.00.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:56:47 -0800 (PST)
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
X-Inumbo-ID: 817f5d03-ba96-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706086608; x=1706691408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts+uFTaRePmueIU5jH7HQYe7b0R4U5xP6OKpShqXZGM=;
        b=VXSHbqz+zHmIVyPxpWIUOl2QmXrDWt4/Fv4EYXlCzBlhZth70W0WNUNCae8rWCdKZU
         GGRAQnZMhxqCHgeAl8jFIPrOz/jqoH9NfPaKyFpPVUlYrUyCftsUqDZYcl8a5H2ZE8OH
         XZaJewA77+77+lHkez5nsg4xo0mL0g+heGRFMY/teNkZr0UvO/y0VAK3YTKbmqAE4Ygq
         4F5t1Z74UhbD7YN3udrcjGtcYyXj1Q0LHWijbwfP7AaJJXm2+76pUjiD/LzQuJLTsXoc
         l4Z72amPiyRgat4LrSbmgp0WtxTMUnQuDLQ0C3qbCQpXospzzCzyPEtP+LfGKkyrAffB
         VMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706086608; x=1706691408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts+uFTaRePmueIU5jH7HQYe7b0R4U5xP6OKpShqXZGM=;
        b=G7QyeFbmunAZTXsYUi2jVLlP0mmkxYIQCf9rZzETX4mm+eLux1LiIbw+8thAUtJ+CP
         jiGyfyfYx9wwX5EHfwJVtKkGaHCpcU/IXIefWoreF62zTo/1zfFnLqgTGHXmdTC+C+li
         3wDfwpOOPUA3WH0lW8JC6sqmDboZUYP2cf1wh60o7cLEgaLH29XAquEThqt35r6UOlFO
         +cdHgiOzdOP+g1et+hA7Yxp171CIs8VzmIrjZ+e33PoPPIU9l/+pVvT24s/WlEbKzq7F
         OdxZNxy7cG8UYzX1+HDXoej4iYFGIB8+i51JUAkybYjyx4IG4ikut5Ojfyb/0fkSuvZt
         Tmjw==
X-Gm-Message-State: AOJu0YwIyW40MSjny/nEXuJ1inYCor3/H3TgRH+hA3HiAaAZILSytObH
	Ll87L1lC5XOR22i+uLUa6Yx8U7D7wguEjJgMuqDi1qlSUM368N1Avyk8DItEDw==
X-Google-Smtp-Source: AGHT+IEktw8YQL1QsTGtPHYfVIvIAqHfFfuMJhmykcW5kDjvFdOojsSt3azW5f3I3hSZyqnacnto3g==
X-Received: by 2002:a2e:9e46:0:b0:2cc:c895:7140 with SMTP id g6-20020a2e9e46000000b002ccc8957140mr251279ljk.73.1706086607717;
        Wed, 24 Jan 2024 00:56:47 -0800 (PST)
Message-ID: <c8792489-3e61-4c2e-af80-97832a3622b7@suse.com>
Date: Wed, 24 Jan 2024 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <18ec3401-4334-40c0-82a0-31abfd9797d0@suse.com> <Za_Z_WlLbBgb0EzF@macbook>
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
In-Reply-To: <Za_Z_WlLbBgb0EzF@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 16:23, Roger Pau Monné wrote:
> On Tue, Jan 23, 2024 at 03:26:26PM +0100, Jan Beulich wrote:
>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>> --- a/xen/arch/x86/hvm/vmsi.c
>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>>>      struct msixtbl_entry *entry, *new_entry;
>>>      int r = -EINVAL;
>>>  
>>> -    ASSERT(pcidevs_locked());
>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>>  
>>>      if ( !msixtbl_initialised(d) )
>>> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>>>      struct pci_dev *pdev;
>>>      struct msixtbl_entry *entry;
>>>  
>>> -    ASSERT(pcidevs_locked());
>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>      ASSERT(rw_is_write_locked(&d->event_lock));
>>
>> I was hoping to just ack this patch, but the two changes above look
>> questionable to me: How can it be that holding _either_ lock is okay?
>> It's not obvious in this context that consumers have to hold both
>> locks now. In fact consumers looks to be the callers of
>> msixtbl_find_entry(), yet the list is RCU-protected. Whereas races
>> against themselves or against one another are avoided by holding
>> d->event_lock.
> 
> The reason for the change here is that msixtbl_pt_{un,}register() gets
> called by pt_irq_{create,destroy}_bind(), which is in turn called by
> vPCI code (pcidevs_locked()) that has been switched to not take the
> pcidevs lock anymore, and hence the ASSERT would trigger.

I understand this is the motivation for the change, but that doesn't
(alone) render the construct above sensible / correct.

>> My only guess then for the original need of holding pcidevs_lock is
>> the use of msi_desc->dev, with the desire for the device to not go
>> away. Yet the description doesn't talk about interactions of the per-
>> domain PCI lock with that one at all; it all circles around the
>> domain'd vPCI lock.
> 
> I do agree that it looks like the original intention of holding
> pcidevs_lock is to prevent msi_desc->dev from being removed - yet I'm
> not sure it's possible for the device to go away while the domain
> event_lock is hold, as device removal would need to take that same
> lock in order to destroy the irq_desc.

Yes, that matches an observation of mine as well. If we can simplify
(rather then complicate) locking, I'd prefer if we did. May need to
be a separate (prereq) patch, though.

>> Feels like I'm missing something that's obvious to everyone else.
>> Or maybe this part of the patch is actually unrelated, and should be
>> split off (with its own [proper] justification)? Or wouldn't it then
>> be better to also change the other paths leading here to acquire the
>> per-domain PCI lock?
> 
> Other paths in vPCI vpci_msi_update(), vpci_msi_arch_update(),
> vpci_msi_arch_enable()... are switched in this patch to use the
> per-domain pci_lock instead of pcidevs lock.

Hence my question: Can't we consolidate to all paths only using the
per-domain lock? That would make these odd-looking assertions become
normal-looking again.

Jan

