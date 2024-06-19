Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACE90F3F9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 18:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743919.1150916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJy53-0004x3-9A; Wed, 19 Jun 2024 16:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743919.1150916; Wed, 19 Jun 2024 16:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJy53-0004uX-5j; Wed, 19 Jun 2024 16:22:41 +0000
Received: by outflank-mailman (input) for mailman id 743919;
 Wed, 19 Jun 2024 16:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXUT=NV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJy52-0004uR-BV
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 16:22:40 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24c1aea9-2e58-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 18:22:38 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso840296666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 09:22:38 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5b5ce0c2sm648594366b.78.2024.06.19.09.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 09:22:37 -0700 (PDT)
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
X-Inumbo-ID: 24c1aea9-2e58-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718814157; x=1719418957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XV0Ay7uy+lO597QczLYAkB7Vw1GqCFAkG1JuCj/ewig=;
        b=EllZJz68c30BxZHwFPv6jlX6oRtjf09yY9g6t+bZuLNtLYKGxrgHOz2L1DKbiFhjuy
         c8BMfP+dZbdv4cnJGrKKMqEFA7gyxpjOEIIm4rAjlN41iCANjnM7ya+GGbbbnW6wZhWy
         kv18UJQCWDlBjgmxuhf66IdfmMd8heDWA6aoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814157; x=1719418957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV0Ay7uy+lO597QczLYAkB7Vw1GqCFAkG1JuCj/ewig=;
        b=B1aTUe32i/TI3czPjNlD26nzICpKd8x3ETEI5KMBvnX44kjhO1sQNfOb2jQ/0Cgr13
         3xQWppfSJn0b+I+JtR8ejwDJRIHZ71vnNzZnv/AD35MNsuBUuf45yrOglDfTXirGcxyh
         TdpSu18NhLcOZ8As/99NsDsnkG5HY4ZcOo2lJLZ+l98t/MlAGZeSRwY/q2vNmh6x9nJ/
         +r/xPlOm/3GDgqIOxL70hUZKOfsxUJBz4cf3DDHEw1FRJHxnYBoEfvWtAs/yeP40kWyo
         LwWSrMimMg6nGMGdSBBcuC37laEIZs8GQQ9fY7qkXiG+8jRImcS1BzlIurSerTPcNV+0
         s1ug==
X-Forwarded-Encrypted: i=1; AJvYcCVNm5GvjXHgAmCu5/SOI4gle7udS5Bs0LV/XzsSIbwWcYspLsxOWTF+l2MC8y/HnjelMqizvqgG54AkxuHSDZ51lr9UYbK99IHgJmcDNOg=
X-Gm-Message-State: AOJu0YzWo8J5WGvwcCQWIP5htizdHneWn2uSGADE8mUXkdGzyFcdbPBk
	t99NV3HhoAClBYggrAtKrQKBQfMjhfX2ph+nzpAQVzJ0ICQ4+4habrpQiWU1+asdvoAlxL07RUG
	CGkM=
X-Google-Smtp-Source: AGHT+IG9oxd4/VrXzrbr2pH/jB5dAT1nPp1MMfb1+ypNdoYoVUSD4vUJ0emZ9iDCOgIVqmBWYGgX7g==
X-Received: by 2002:a17:906:40cd:b0:a59:dd90:baeb with SMTP id a640c23a62f3a-a6fab778cdbmr181720066b.48.1718814157513;
        Wed, 19 Jun 2024 09:22:37 -0700 (PDT)
Message-ID: <9186bb9f-384d-426a-b3d3-40c00236be27@citrix.com>
Date: Wed, 19 Jun 2024 17:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] AMD/IOMMU: Improve register_iommu_exclusion_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240618183128.1981751-1-andrew.cooper3@citrix.com>
 <052cccac-8c8f-4555-953c-2bd9de460f2a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <052cccac-8c8f-4555-953c-2bd9de460f2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2024 8:45 am, Jan Beulich wrote:
> On 18.06.2024 20:31, Andrew Cooper wrote:
>>  * Use 64bit accesses instead of 32bit accesses
>>  * Simplify the constant names
>>  * Pull base into a local variable to avoid it being reloaded because of the
>>    memory clobber in writeq().
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> RFC.  This is my proposed way of cleaning up the whole IOMMU file.  The
>> diffstat speaks for itself.
> Absolutely.
>
>> I've finally found the bit in the AMD IOMMU spec which says 64bit accesses are
>> permitted:
>>
>>   3.4 IOMMU MMIO Registers:
>>
>>   Software access to IOMMU registers may not be larger than 64 bits. Accesses
>>   must be aligned to the size of the access and the size in bytes must be a
>>   power of two. Software may use accesses as small as one byte.
> I take it that the use of 32-bit writes was because of the past need
> also work in a 32-bit hypervisor, not because of perceived restrictions
> by the spec.

I recall having problems getting writeq() acked in the past, even after
we'd dropped 32bit.

But this is the first time that I've positively found anything in the
spec saying that 64bit accesses are ok.

>
>> --- a/xen/drivers/passthrough/amd/iommu-defs.h
>> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
>> @@ -338,22 +338,10 @@ union amd_iommu_control {
>>  };
>>  
>>  /* Exclusion Register */
>> -#define IOMMU_EXCLUSION_BASE_LOW_OFFSET		0x20
>> -#define IOMMU_EXCLUSION_BASE_HIGH_OFFSET	0x24
>> -#define IOMMU_EXCLUSION_LIMIT_LOW_OFFSET	0x28
>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET	0x2C
>> -#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000U
>> -#define IOMMU_EXCLUSION_BASE_LOW_SHIFT		12
>> -#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFFU
>> -#define IOMMU_EXCLUSION_BASE_HIGH_SHIFT		0
>> -#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001U
>> -#define IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT	0
>> -#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002U
>> -#define IOMMU_EXCLUSION_ALLOW_ALL_SHIFT		1
>> -#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000U
>> -#define IOMMU_EXCLUSION_LIMIT_LOW_SHIFT		12
>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFFU
>> -#define IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT	0
>> +#define IOMMU_MMIO_EXCLUSION_BASE           0x20
>> +#define   EXCLUSION_RANGE_ENABLE            (1 << 0)
>> +#define   EXCLUSION_ALLOW_ALL               (1 << 1)
>> +#define IOMMU_MMIO_EXCLUSION_LIMIT          0x28
> Just one question here: Previously you suggested we switch to bitfields
> for anything like this, and we've already done so with e.g.
> union amd_iommu_control and union amd_iommu_ext_features. IOW I wonder
> if we wouldn't better strive to be consistent in this regard. Or if not,
> what the (written or unwritten) guidelines are when to use which
> approach.

We've got two very different kinds of things here.

The device table/etc are in-memory WB datastructure which we're
interpreting and editing routinely.  It's completely full of bits and
small fields, and letting the compiler do the hard work there is
preferable; certainly in terms of legibility.

This example is an MMIO register (in a bar on the IOMMU PCI device, even
though we find the address in the IVRS).  We set it up once at boot and
don't touch it afterwards.

So while we could make a struct for it, we'd still need to get it into a
form that we can writeq(), and that's more code than the single case
were we need to put two metadata bits into an address.

~Andrew

