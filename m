Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464190FD71
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744214.1151227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKC5m-00008X-KW; Thu, 20 Jun 2024 07:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744214.1151227; Thu, 20 Jun 2024 07:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKC5m-00005z-Hi; Thu, 20 Jun 2024 07:20:22 +0000
Received: by outflank-mailman (input) for mailman id 744214;
 Thu, 20 Jun 2024 07:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKC5l-00005t-8C
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:20:21 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c7b77dd-2ed5-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 09:20:19 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so6131901fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 00:20:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f85c1d44basm124613255ad.76.2024.06.20.00.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:20:18 -0700 (PDT)
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
X-Inumbo-ID: 8c7b77dd-2ed5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718868019; x=1719472819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gkBlXg8IqU9OAf5pLZvGyigOMLuUb64DYUG3mYOyoA0=;
        b=C9MgSsEtuzeEP0eU913B5uo/VgEVbBJwH4kZDugD4b62VZXF8cW+gdWarPCwscsKVH
         k2r+BWfKk0JwgxaxZUjrljoAXa1Sb8mVflsId4qSirRD0/sgTU3RlOK3Zmnza3mFkdjt
         /6SqqpbXPVyhzfj5+8eFvgFz+QDU22CkpMCIEwyjx8RkXMVFXXbkhxM1AfVsjU4SJYfL
         N7XKeZF94bHmiQw+JcBl9eKSgcoF1LVpRMeFZ3P6marnI6s9WqPHDC8dIndHTLG0huDy
         80U+f2ZpL6Y+XtO6h3bv8r/GNFlJHRg0NPHMZki/P5o4XU/kKOoneAvRWZZiEEN6nTFl
         WKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718868019; x=1719472819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkBlXg8IqU9OAf5pLZvGyigOMLuUb64DYUG3mYOyoA0=;
        b=cUW6xxBl5GgHuMnnkcETQFQFziKSM2TrLt7Er6YZ9qCvhKo4KsB2fZQ6ArvFbeNgbr
         tucgt9Kf7o7lN25IEL5H5T7xKOM9FIUbeY2V/RfNK07BdoKmRyFkQA/kODDgraYzi6GS
         7NdIt0VnfRjeEUhZVrC8o6UvLbr1hACwHITUOaSWXISjssa4ava3MpOeaCPBip/q6YrY
         TVy5eDhpl6ArN8Xri4e0IrXXn58TBO1XmtumKoo9OOEiyazQ0+n6eUHL5YWtAZgZjI2o
         YNIhMc2zuAdtMRXUZNoLZbEQ4mLDdp9hv1F4FM1FNHYq2TNhWuwzAy/Hzjgb08Hdv6uD
         wJbg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+ajY7xJBZl/IK3TSX2fxop2tmqDYpvNSjbJYOImwgYn/Tutlmf+WR/Exh+i7MSHyS5mUp20Z4W7pmoBqoz38qrBHwK5M69/+FQw5U88=
X-Gm-Message-State: AOJu0YzTtOJbBgTufBzPnFVdQFIuq/iS/iXoQA+psgQpefM2kM51vuFN
	IwN/g7Y1Px8WQ3Iviq/HzU2BnjcE0NPoTWe+PQ1DrsABCNc9EBLzVoGPYsNa1g==
X-Google-Smtp-Source: AGHT+IHGVtm/UAErBntgn/h0UvaW/bLLLOCUODlXAoWkP6pKgHWGO/ZWf1srYG0AuN7RSCwkdGT2TQ==
X-Received: by 2002:a2e:8041:0:b0:2ec:403e:6314 with SMTP id 38308e7fff4ca-2ec403e645emr23634851fa.3.1718868018648;
        Thu, 20 Jun 2024 00:20:18 -0700 (PDT)
Message-ID: <3e550b43-38af-4c4f-a0b4-59e7e2fa181c@suse.com>
Date: Thu, 20 Jun 2024 09:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] AMD/IOMMU: Improve register_iommu_exclusion_range()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240618183128.1981751-1-andrew.cooper3@citrix.com>
 <052cccac-8c8f-4555-953c-2bd9de460f2a@suse.com>
 <9186bb9f-384d-426a-b3d3-40c00236be27@citrix.com>
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
In-Reply-To: <9186bb9f-384d-426a-b3d3-40c00236be27@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 18:22, Andrew Cooper wrote:
> On 19/06/2024 8:45 am, Jan Beulich wrote:
>> On 18.06.2024 20:31, Andrew Cooper wrote:
>>>  * Use 64bit accesses instead of 32bit accesses
>>>  * Simplify the constant names
>>>  * Pull base into a local variable to avoid it being reloaded because of the
>>>    memory clobber in writeq().
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> RFC.  This is my proposed way of cleaning up the whole IOMMU file.  The
>>> diffstat speaks for itself.
>> Absolutely.
>>
>>> I've finally found the bit in the AMD IOMMU spec which says 64bit accesses are
>>> permitted:
>>>
>>>   3.4 IOMMU MMIO Registers:
>>>
>>>   Software access to IOMMU registers may not be larger than 64 bits. Accesses
>>>   must be aligned to the size of the access and the size in bytes must be a
>>>   power of two. Software may use accesses as small as one byte.
>> I take it that the use of 32-bit writes was because of the past need
>> also work in a 32-bit hypervisor, not because of perceived restrictions
>> by the spec.
> 
> I recall having problems getting writeq() acked in the past, even after
> we'd dropped 32bit.

That's odd, as per my subsequent reply.

> But this is the first time that I've positively found anything in the
> spec saying that 64bit accesses are ok.
> 
>>> --- a/xen/drivers/passthrough/amd/iommu-defs.h
>>> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
>>> @@ -338,22 +338,10 @@ union amd_iommu_control {
>>>  };
>>>  
>>>  /* Exclusion Register */
>>> -#define IOMMU_EXCLUSION_BASE_LOW_OFFSET		0x20
>>> -#define IOMMU_EXCLUSION_BASE_HIGH_OFFSET	0x24
>>> -#define IOMMU_EXCLUSION_LIMIT_LOW_OFFSET	0x28
>>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET	0x2C
>>> -#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000U
>>> -#define IOMMU_EXCLUSION_BASE_LOW_SHIFT		12
>>> -#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFFU
>>> -#define IOMMU_EXCLUSION_BASE_HIGH_SHIFT		0
>>> -#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001U
>>> -#define IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT	0
>>> -#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002U
>>> -#define IOMMU_EXCLUSION_ALLOW_ALL_SHIFT		1
>>> -#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000U
>>> -#define IOMMU_EXCLUSION_LIMIT_LOW_SHIFT		12
>>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFFU
>>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT	0
>>> +#define IOMMU_MMIO_EXCLUSION_BASE           0x20
>>> +#define   EXCLUSION_RANGE_ENABLE            (1 << 0)
>>> +#define   EXCLUSION_ALLOW_ALL               (1 << 1)
>>> +#define IOMMU_MMIO_EXCLUSION_LIMIT          0x28
>> Just one question here: Previously you suggested we switch to bitfields
>> for anything like this, and we've already done so with e.g.
>> union amd_iommu_control and union amd_iommu_ext_features. IOW I wonder
>> if we wouldn't better strive to be consistent in this regard. Or if not,
>> what the (written or unwritten) guidelines are when to use which
>> approach.
> 
> We've got two very different kinds of things here.
> 
> The device table/etc are in-memory WB datastructure which we're
> interpreting and editing routinely.  It's completely full of bits and
> small fields, and letting the compiler do the hard work there is
> preferable; certainly in terms of legibility.

And it was specifically not the DTE I used as example in my reply, ...

> This example is an MMIO register (in a bar on the IOMMU PCI device, even
> though we find the address in the IVRS).  We set it up once at boot and
> don't touch it afterwards.

... but other MMIO registers.

> So while we could make a struct for it, we'd still need to get it into a
> form that we can writeq(), and that's more code than the single case
> were we need to put two metadata bits into an address.

See those other examples, which are usable with writeq() by way of their
"raw" fields.

Jan

