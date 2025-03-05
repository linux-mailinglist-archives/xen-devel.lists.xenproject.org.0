Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13FA4F833
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 08:45:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901767.1309699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjQr-0002uw-KP; Wed, 05 Mar 2025 07:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901767.1309699; Wed, 05 Mar 2025 07:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjQr-0002sS-HU; Wed, 05 Mar 2025 07:44:45 +0000
Received: by outflank-mailman (input) for mailman id 901767;
 Wed, 05 Mar 2025 07:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpjQq-0002sM-1i
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 07:44:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2b86431-f995-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 08:44:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso27654205e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 23:44:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844abbsm19959772f8f.70.2025.03.04.23.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 23:44:40 -0800 (PST)
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
X-Inumbo-ID: b2b86431-f995-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741160681; x=1741765481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftr6Xg1hZ02fphiue8vEFJkZwtKT77ok2bC4AeHAdt0=;
        b=EBRtDoVTzBQsgJHYRVBnMiNEp7A28zfjuHYvTIXXzaoMHrIs4eXRG4xHRVhZA46u0E
         +8lNLBtqK7AlgEys1iPBoeUwVc7x0ixIYDvRSD7zt/No1NRPMQVx+/tOrAcIMFD4o4sU
         afbCj9xWm0Y/YeueZ0WJuD+O60Zvjd6xUZBtT6pCa+d6hkJiyA2R5Hp+16gEipGeKY+v
         H/oAKNSlGvf+ZEobmbxUKXvQb2jiye268LrcdPxdPq76mBAbZr+unCWyGmj7o6zBPQsz
         iRKR7f0F8RizU377b0kuQn78LxAn1GmHMmX7xFgMIet0CmBdDkAFDAqXfw4tY0yHha75
         Mgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160681; x=1741765481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftr6Xg1hZ02fphiue8vEFJkZwtKT77ok2bC4AeHAdt0=;
        b=lObjD7S+jnu13o9EDMc1yGfX4XgOjTRy0lQ9GfK/AnVbNds07tAAiot2z34rl0JaDv
         UxOL/y/MN+IcXDdijcj/+ciTWzTJ185XCW5wVbDPFQQex3HWAMZSv7nUY51ZeLg2b/Yp
         994Nyqi82EHTw2hJb67hl3BIdOumF5MbLwfqvJiSLJKX3paZw4GNekwL85iZMfAv6ZJe
         zBOaabJH4k+Cz3ku7AJ2gbrUZBg5hFeLmY/DsL37/jdn2Yj0g4wN7ulmJOuTH1hdEnSE
         M+IoXeSCrrBXlu3R3Egzr46YyflY9Njq20TvA95spYLmt2a+k7axEa1xP+n+Gje9Mgah
         ERrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV448fVZnzAIJF5tsaqXX1Uvrl1b4W2UF/S3NXVWQiuY8ZsVPnbshBLbUawaY4faW/FRWesnxjZD/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEUSW4i04fHjIDCy0CcWFvXg2c/5e20bZMwephi6hrt4W9+01c
	mQwN6Yr552d83/JyGjErV2ijnIRYwgKFrM3KiUnj3OOh8pcOyhZipIaBa2SWQA==
X-Gm-Gg: ASbGnctBXdtp/S9e2hC/1wvtomHd4BkJSIvRwE0bjAGvdf4lnfBXEvQxv7cmqeSfflA
	MnSJzywh0j0tAlbi/pMvB28EFpxAU83yPgvUnUXKZAXtOhSHd81vpa8oRc5hvzZv7NsYDtEeD1W
	Nj8G3hogV4omhnQV39nODJD6XOA2yRX6HpHHmyC0xfue8LhTmmNk/8Dehki1CAsYhQtTdD7NyJq
	elThbvhaRbNH7r8czSZrifaZUBubr+aPkY5kKSK4UHmaLNgikh09jKC5WRqq6QhILYf/T59iRc4
	XcMtuKLjmCngABgrusWjpHRgAnxGFIOJIfMG0cM9dJKzuT60DT7zhJSYww5lcbgYHeVCelxF5LK
	WHkUn/OqFKH6OPLcob0Wi9azqUDaoPQ==
X-Google-Smtp-Source: AGHT+IGZxbAl2Ch7j7/qxxcuF47syUqb4FVu29X0J0RrQXpTupfHR1G2qaQwKQXvuWZqoH3/FZAp2Q==
X-Received: by 2002:a5d:64c5:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-3911f7bbb52mr1417527f8f.34.1741160681048;
        Tue, 04 Mar 2025 23:44:41 -0800 (PST)
Message-ID: <47a9697c-2acb-4082-82cc-7903651b1abd@suse.com>
Date: Wed, 5 Mar 2025 08:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
 <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
 <e6ea52a3-c7ce-411f-8186-cf725aa608f3@epam.com>
 <82b8b042-564c-4013-863e-499c316be344@suse.com>
 <8a559344-e239-4b99-bfaf-325d0d8aded3@epam.com>
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
In-Reply-To: <8a559344-e239-4b99-bfaf-325d0d8aded3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2025 12:31, Mykyta Poturai wrote:
> 
> 
> On 26.02.25 12:48, Jan Beulich wrote:
>> On 26.02.2025 10:58, Mykyta Poturai wrote:
>>> On 10.02.25 12:52, Jan Beulich wrote:
>>>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>>>> --- a/xen/drivers/passthrough/iommu.c
>>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>>> @@ -20,6 +20,7 @@
>>>>>    #include <xen/param.h>
>>>>>    #include <xen/softirq.h>
>>>>>    #include <xen/keyhandler.h>
>>>>> +#include <xen/acpi.h>
>>>>>    #include <xsm/xsm.h>
>>>>>    
>>>>>    #ifdef CONFIG_X86
>>>>> @@ -744,6 +745,18 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>>>>>        return 0;
>>>>>    }
>>>>>    
>>>>> +int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
>>>>> +{
>>>>> +    int ret = -EOPNOTSUPP;
>>>>> +
>>>>> +#ifdef CONFIG_HAS_PCI
>>>>> +    if ( acpi_disabled )
>>>>> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
>>>>> +#endif
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>
>>>> This function has no caller, which violates a Misra rule iirc. Considering
>>>> all information given here it's also unclear why it would gain a caller on
>>>> x86 (at least as long as DT isn't used there).
>>>
>>> Would it be ok to wrap it with CONFIG_ARM? I am not quite sure how
>>> relevant this mapping functionality is to X86 iommus, although Linux has
>>> similar implementations for ACPI.
>>
>> Besides it being unclear to me whether the function is really Arm-specific
>> (what about RISC-V or PPC), I also don't see how that would address the
>> Misra concern. (If the function was truly Arm-specific, it would better
>> move into an Arm-specific source file.)
>>
>>> Alternatively, we can remove this abstraction for now, to call
>>> iommu_add_dt_pci_sideband_ids from Arm directly and only introduce it
>>> back when at least some ACPI implementation is done.
>>
>> I'd leave that to Arm folks to judge.
>>
>>> Also, just want to mention the issue that forced me to move this from
>>> the header in the first place in case it is not known. There is a
>>> conflict in fixed width integers definitions between actypes.h and
>>> efibind.h and it was revealed when including acpi.h into iommu.h.
>>> I initially tried to fix the source of this conflict, but I don't know
>>> enough about ACPI and EFI quirks to confidently do it.
>>>
>>> In file included from ./include/acpi/acpi.h:57,
>>>                    from ./include/xen/acpi.h:57,
>>>                    from ./include/xen/iommu.h:28,
>>>                    from ./include/xen/sched.h:12,
>>>                    from ./arch/x86/include/asm/paging.h:17,
>>>                    from ./arch/x86/include/asm/guest_access.h:11,
>>>                    from ./include/xen/guest_access.h:10,
>>>                    from arch/x86/efi/runtime.c:5:
>>> ./include/acpi/actypes.h:130:35: error: conflicting types for ‘UINT64’;
>>> have ‘long long unsigned int’
>>>     130 | typedef COMPILER_DEPENDENT_UINT64 UINT64;
>>>         |                                   ^~~~~~
>>> In file included from ./arch/x86/include/asm/efibind.h:2,
>>>                    from ./common/efi/efi.h:1,
>>>                    from arch/x86/efi/runtime.c:1:
>>> ./arch/x86/include/asm/x86_64/efibind.h:89:20: note: previous
>>> declaration of ‘UINT64’ with type ‘UINT64’ {aka ‘long unsigned int’}
>>>      89 | typedef uint64_t   UINT64;
>>
>> Yeah, sadly ACPI and EFI headers (both imported from different origins)
>> aren't overly compatible with one another.
>>
>> Jan
> 
> Hi everyone
> I searched for an appropriate place to put this function but I am a 
> little stuck here:
> - Can't be put in the header as static inline because of header conflict.
> - Putting it in Arm only files or defines feels wrong because it is not 
> in fact Arm-specific.
> - In iommu.c it can become dead code on some architectures.
> - Removing it and calling iommu_add_dt_pci_sideband_ids goes against the 
> effort to make DT and ACPI able to co-exist.
> 
> Could you please suggest a good way forward from here? I see two 
> possible ones:
> 
> 1. Fix the header conflict and return it to the header as static inline 
> - best solution in my opinion

I'm very likely to say "no" to anything trying to go this route. The
headers in question want leaving alone as much as possible, to stay
close to their originals. The only acceptable approach there would be
to propose adjusting said originals.

> 2. Move to arm files it gains callers on other architectures.

I fear I don't understand this one.

Jan

> If we are going for the first approach maybe you can provide some 
> pointers on how to better deal with this header conflict? Adding ifdef 
> guards to the definitions? Renaming the types in one of them to 
> something like EFI_UINT64 or ACPI_UINT64? Would a successful boot on the 
> ACPI/EFI system be enough to confirm that I didn't break anything or 
> will it require some more specific tests?
> 


