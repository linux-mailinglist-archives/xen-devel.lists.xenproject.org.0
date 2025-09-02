Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BCB40636
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106597.1457249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRi4-0001wK-6W; Tue, 02 Sep 2025 14:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106597.1457249; Tue, 02 Sep 2025 14:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRi4-0001ty-2j; Tue, 02 Sep 2025 14:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1106597;
 Tue, 02 Sep 2025 14:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utRi2-0001h2-9q
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:10:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f93664-8806-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 16:10:05 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b042ec947e4so331887866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:10:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff032125e2sm1089009866b.77.2025.09.02.07.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 07:10:03 -0700 (PDT)
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
X-Inumbo-ID: 85f93664-8806-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756822204; x=1757427004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj0vxc2nvs0Ks97yPYXzgSqJCAe6jpruEwLP5raDuHk=;
        b=F1Mv6e2Fiig2O7WGaPyDT0itxzwMw4FRmzC3OA0ll/WvWQTIqQlp0xDcdIZxslPcy5
         sbp0+sEFHeRIsujYqCTd+pu/D5yoGwO99wrPWaa8FP7GfIJJCSObAyEaR0WdNT/UeGEO
         jkmanWNXoZEJSlA+asBj2sqx9BO54xxxfoaujYj/bdqnFSJwEaW7gsy/Kj9b1cqM8clE
         GVvpSuDLOZCIYG6wid0QJmB87c0wd5L5+D8ob/In+ZJQRx7JlQ8bRvajdUft5i2L4eKP
         jEizLCoigHU7v1IkKap5Mhz0UH3+wX4ZymywmzOAd0raqYKpzHtg6IQGTqydjO3s9h6v
         LMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822204; x=1757427004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj0vxc2nvs0Ks97yPYXzgSqJCAe6jpruEwLP5raDuHk=;
        b=pbfyQ2R1TKXptyznjYDWBdPwmFQMK3EgMb7KZ9aN05Xhjg9zlyihyboatGMNlmEfAJ
         01/1xqR4nVP1tHwCK5dXzgMNfVMooInFof3LsKlRjjuAxpl+HVweGOx0LHPrZz9ir6+P
         PkXkjAhwYZgHrTlIcfrUfAQG27AvdGVhtWazl4x0Kz+MriaZMxHyOthevdrO7RvYD3ZR
         TLDScBTluLIVTL3wgO2aGWWUQXhQFC8icMRFEkhGFDDPnrWvoH5u3xN71UKr0zwBYM3E
         Ds5G3HzeKe2fb4FDeTI8pcvxrcnpeqBxuCect2Ss0MKRVGrdo4xRHm/gliO26KPq5t9S
         ah0g==
X-Forwarded-Encrypted: i=1; AJvYcCUMCsmg5poVDNYyY0ncnnL93qWB5g7mtte05tN9Zdu1/CIhVeBUCxbIFfyMYfGTrDDUVuzJ4+J9u9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEvxf7PdqHWKyLbS0w5Q7yinRsRfndJ5rn09DRcUmIJb5l4owo
	G2iDw4nBdhEhw/RRIklpMkQf/HQxO2Aws9yZKddXF/2fQiHBb1TDh0K5kK6mGVESkw==
X-Gm-Gg: ASbGncsIT0t6ningy0QEZ6i58b5rQGpDL77PWRrUAzSY9oqJPpi8la+q2vZPKNoHfy0
	SbWW+ye7y9T1v7B2RlSkX7olkR+bw5Yj+DaJLJw+H6EYUIejeTVNS14tlkptcIVnuSvtQ5Cpijk
	ltwnpdrRqt/JJG/UPwlnM7z5KCPIKI/HsFR0khRaVbYOKWHragVJ95pejFfLh92R2OD52rgwLDw
	acn7dFQaCDOTDWGdzdYPRh/kbycdHOK/gG7oLbjNJKni1GJEwVXGQyGGJWOeu++3eJ+k2STFbrN
	kJ89O27SBbwhgK6zGQv6jFlSYdxouzsC0ayPdBsW9dicojlOP+wRf+F27P87x1u94BTdOfExuLH
	XifNDYSxN+lGPzMC83n/+oRCci0HDkB8sm9wiJDa4zLoG+1T29Co8Qoju8mj0N590fwb1SfI3Ku
	BySn2zicuAxUWSump5ww==
X-Google-Smtp-Source: AGHT+IEdHfoX1/iDcybcHK4Xjvi0Ze2xs4kj+5+L1g5O+LnyiTRClXRAlIodliGRd3nHXB9v+NbF2A==
X-Received: by 2002:a17:907:948a:b0:afe:b2be:6109 with SMTP id a640c23a62f3a-b01f20cc03emr907726466b.59.1756822204141;
        Tue, 02 Sep 2025 07:10:04 -0700 (PDT)
Message-ID: <0190dbe1-4583-49c1-86c1-9bcb57844315@suse.com>
Date: Tue, 2 Sep 2025 16:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 2/3] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
 <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com>
 <fdb2b2d2-a9d8-42ad-b9fc-e99905f5dbba@vates.tech>
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
In-Reply-To: <fdb2b2d2-a9d8-42ad-b9fc-e99905f5dbba@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 15:24, Teddy Astie wrote:
> Le 02/09/2025 à 14:38, Jan Beulich a écrit :
>> On 29.08.2025 11:58, Teddy Astie wrote:
>>> @@ -505,7 +505,22 @@ smbios_type_1_init(void *start, const char *xen_version,
>>>       p->version_str = 3;
>>>       p->serial_number_str = 4;
>>>   
>>> -    memcpy(p->uuid, uuid, 16);
>>> +    /*
>>> +     * Xen toolstack uses big endian UUIDs, however GUIDs (which requirement
>>> +     * is clarified by SMBIOS >= 2.6) has the first 3 components appearing as
>>> +     * being little endian and the rest as still being big endian.
>>> +     */
>>
>> The SMBIOS spec I'm looking at (2.7.1) doesn't mention the term GUID at all
>> (except of course when discussing the EFI System Table entry). It's all UUID
>> there. Here and in the description I think this needs expressing better, to
>> not raise extra questions.
> 
> Yes (this is also true for SMBIOS 3.9.0 spec). Not sure how to express 
> that aside saying that UUID encoding differs between SMBIOS 
> specification and Xen representation.

Maybe

    /*
     * Xen toolstack uses big endian UUIDs, whereas the UUIDs used by SMBIOS,
     * also known as GUIDs, have the first 3 components appearing in little
     * endian (with this requirement clarified by SMBIOS >= 2.6).
     */

?

>>> @@ -736,6 +751,22 @@ smbios_type_4_init(
>>>       p->l2_cache_handle = 0xffff; /* No cache information structure provided. */
>>>       p->l3_cache_handle = 0xffff; /* No cache information structure provided. */
>>>   
>>> +    /*
>>> +     * We have a smbios type 4 table per vCPU (which is per socket),
>>> +     * which means here that we have 1 socket per vCPU.
>>> +     */
>>> +    p->core_count = p->core_enabled = p->thread_count = 1;
>>
>> Might we be better off keeping them all at 0 (unknown)?
> 
> Making it Unknown would feel a bit weird, unless we only keep only one 
> (instead of the number of vCPUs) of these table with core_count, 
> core_enabled, thread_count as 0 (unknown) ?

I don't see how unknown or not is related to how many structure instances
we surface. Your suggestion of using 1 in all three fields isn't quite
what we'd like to present to guests. Once we sort virtual topology in Xen,
we may want to expose sane values here. Yet if we expose 1-s now, that
adjustment would need to happen in lock-step with the hypervisor changes.
Whereas when we expose "unknown" that can be done at a convenient later
time.

>>> +    /*
>>> +     * We set 64-bits, execute protection and enhanced virtualization.
>>> +     * We don't set Multi-Core (bit 3) because this individual processor
>>> +     * (as being a single vCPU) is only having one core.
>>> +     *
>>> +     * SMBIOS specification says that these bits don't state anything
>>> +     * regarding the actual availability of such features.
>>> +     */
>>> +    p->processor_characteristics = 0x64;
>>
>> Unless nested virt is enabled for the guest, I think we'd better avoid
>> setting the Enhanced Virtualization bit.
> 
> I am not sure how to interpret the SMBIOS spec on this
> 
>  > Enhanced Virtualization indicates that the processor can execute
>  > enhanced virtualization instructions. This bit does not indicate the
>  > present state of this feature
> 
> I see it as: Virtualization is available or can be enabled (with nested 
> virtualization).
> Or as : We have virtualization related instructions.

You want to view what we expose to the guest from the guest's perspective
on its own little world, I think.

>>> --- a/tools/firmware/hvmloader/smbios_types.h
>>> +++ b/tools/firmware/hvmloader/smbios_types.h
>>> @@ -147,6 +147,11 @@ struct smbios_type_4 {
>>>       uint8_t serial_number_str;
>>>       uint8_t asset_tag_str;
>>>       uint8_t part_number_str;
>>> +    uint8_t core_count;
>>> +    uint8_t core_enabled;
>>> +    uint8_t thread_count;
>>> +    uint16_t processor_characteristics;
>>> +    uint16_t processor_family_2;
>>>   } __attribute__ ((packed));
>>>   
>>>   /* SMBIOS type 7 - Cache Information */
>>> @@ -185,6 +190,9 @@ struct smbios_type_9 {
>>>       uint16_t slot_id;
>>>       uint8_t slot_characteristics_1;
>>>       uint8_t slot_characteristics_2;
>>> +    uint16_t sgn_base;
>>> +    uint8_t bus_number_base;
>>> +    uint8_t devfn_base;
>>
>> Where do the _base suffixes come from? Nothing like that is said in the
>> spec I'm looking at. Also "sgn" is imo too much of an abbreviation.
>>
> 
> My version of the specification (3.9.0) says
> 
> 0Dh 2.6+ Segment Group Number (Base)
> 0Fh 2.6+ Bus Number (Base)
> 10h 2.6+ Device/Function Number (Base)

Without any clarification what "(Base)" means, afaics.

> Regarding sgn, maybe we can use `segment` instead ?

Why not segment_group or seg_group (seeing how devfn also is an abbreviation)?
And if we omit _number there and on devfn, it's hard to see why it shouldn't
be just "bus" then as well.

Jan

