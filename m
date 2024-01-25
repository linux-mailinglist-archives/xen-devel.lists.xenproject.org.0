Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F583C079
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 12:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671448.1044794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxfS-0002kU-Ng; Thu, 25 Jan 2024 11:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671448.1044794; Thu, 25 Jan 2024 11:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxfS-0002hk-Km; Thu, 25 Jan 2024 11:13:10 +0000
Received: by outflank-mailman (input) for mailman id 671448;
 Thu, 25 Jan 2024 11:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSxfR-0002hc-6o
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 11:13:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b682fa84-bb72-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 12:13:05 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf3a0b2355so3204991fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 03:13:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h7-20020a02c727000000b0046edb73ff8fsm2489302jao.74.2024.01.25.03.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 03:13:04 -0800 (PST)
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
X-Inumbo-ID: b682fa84-bb72-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706181185; x=1706785985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ5/HGGOnpZmOgJrZRjwRcSVcy21eqbEiTKW/rL9VXg=;
        b=bKES19xa7kLmRy9eI+DNsbi4eQGvG/JTa1r9YtCLE1VdGpiK8Tj7iyBM7hlfoDJZgL
         Tb4TxG4XqElOdmUAixR++KaBetXRgtBngPe8hzRDHZdyQVwuIRcHzVJPRGlpBOqECFTu
         f2IRWUVwpyfaXvi7yZRN0ouRJTl/ZbygHKp8gfVojxvuAKuspnAFGTeVmSo5bA+5exxf
         ECc2hblY9zEjrQNANfhiqeRSz547G3Qzct7Y71BCrDRZW75AJQe1NeN7NZuNz7saaLee
         A4gGcDuJcymqOSBqqEZpuMeNcbgdqWm6i6EOrvN8vVfpLAzTOThcF2wLFMvccugoMhHa
         BOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706181185; x=1706785985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ5/HGGOnpZmOgJrZRjwRcSVcy21eqbEiTKW/rL9VXg=;
        b=FWHcyzl+2oWlk6JHcoxLqzC9Wy89gbK3Cz+qX713wGoil1nwrayszm4uf/1097QHjJ
         TDrc1a9mTdjLhFnvvTo0aM8xIFdn3vJkEN+T//IocGt6PMdb4kOimb2WBG4yyYqbcbU2
         QdUNxz/JjPzzRwwLyoGlvwRuB94QZ4mcDsMj8lHL7SRctiZyGPRiMde7Qg+i5iWHYnGV
         MpIU7hIQtjpAFgtggkVofQQHGbWjhQowKm3md/BaNegSyhni2CF+gZXUCfxGQHSQFxg5
         KCBtw5avSUkX/4OeFYxzuIr76iBmtLKyY5GpOZZf9Qul+vZfeJk35O8DBmg7RgZmF3CI
         dv0g==
X-Gm-Message-State: AOJu0YyQ6sJaWYiT37/x3sFSUiGNTbWCbjZBU6A1mqnnw7FpC/pObkNv
	gxbXpm3cLO5VmR0ONsb02ADkqbR/Wl/2J4U3E8sKxXdgj+ht0IVaTf3EyNrsGg==
X-Google-Smtp-Source: AGHT+IFH2lBu3Glf5LELuaKlGfGfvYE5N/FDa69m3BNunzc+MP/fQJn0YWdbRydBjB3FAowtEjSApA==
X-Received: by 2002:a2e:7c19:0:b0:2cc:769e:723d with SMTP id x25-20020a2e7c19000000b002cc769e723dmr386778ljc.87.1706181185307;
        Thu, 25 Jan 2024 03:13:05 -0800 (PST)
Message-ID: <ed221b62-0151-45ce-a88d-d7e2a9946136@suse.com>
Date: Thu, 25 Jan 2024 12:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-2-roger.pau@citrix.com>
 <ad178469-15c3-4ae5-8538-e927f1116a42@suse.com> <ZbIgE8exXDVicN8D@macbook>
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
In-Reply-To: <ZbIgE8exXDVicN8D@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 09:47, Roger Pau Monné wrote:
> On Thu, Jan 25, 2024 at 09:34:40AM +0100, Jan Beulich wrote:
>> On 24.01.2024 18:29, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/io.c
>>> +++ b/xen/arch/x86/hvm/io.c
>>> @@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
>>>      return vpci_mmcfg_find(d, addr);
>>>  }
>>>  
>>> +int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
>>> +{
>>> +    const struct hvm_mmcfg *mmcfg;
>>> +
>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
>>> +    {
>>> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
>>> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
>>
>> Along the lines of this, ...
>>
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>>>      return 0;
>>>  }
>>>  
>>> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>> +{
>>> +    paddr_t start, end;
>>> +    int rc;
>>> +
>>> +    /* S3 resume code (and other real mode trampoline code) */
>>> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
>>> +                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
>>
>> ... did you perhaps mean
>>
>>                                PFN_DOWN(bootsym_phys(trampoline_end) - 1));
>>
>> here (and then similarly below, except there the difference is benign I
>> think, for the labels being page-aligned)?
> 
> They are all page aligned, so I didn't care much,  but now that you
> point it might be safer to do the subtraction from the address instead
> of the frame number, just in case.

Hmm, no, for me neither trampoline_end nor trampoline_start are page
aligned. While bootsym_phys(trampoline_start) is, I don't think
bootsym_phys(trampoline_end) normally would be (it might only be by
coincidence).

Jan

