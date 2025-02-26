Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F449A45C1A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896349.1305031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnExo-0007Ed-MP; Wed, 26 Feb 2025 10:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896349.1305031; Wed, 26 Feb 2025 10:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnExo-0007BW-Jr; Wed, 26 Feb 2025 10:48:28 +0000
Received: by outflank-mailman (input) for mailman id 896349;
 Wed, 26 Feb 2025 10:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnExn-0007BQ-F5
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:48:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34881fb6-f42f-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 11:48:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4399ee18a57so4431285e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 02:48:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba549eb9sm16814895e9.37.2025.02.26.02.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 02:48:24 -0800 (PST)
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
X-Inumbo-ID: 34881fb6-f42f-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740566905; x=1741171705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdmoSrIL4bVnx4zfs232V4a4x4R0T70kGxqY4WZbSQ=;
        b=PUEmN5Lnhk1R1H67gI35GVfCF1CeRj4d9ZPQE/NZwZH0uxcug55b4Q+qcyu9pcM+gQ
         RGzZRZkhI5MxmOj/u7SzVJ3+Tp4L8G9P52eUZRrVRBtviFVpjfOIisgutSpgz9z4Jnqw
         fY0sUr/Ijxd+rhL5Ihb/a1Jc8Mz9MMx2go4kZzSE2QVE01uuGUkhclFz+NPt294vD+X5
         8Z+aG11ZgvMFeXHwhAhaud0c+g7eEVB1XvmeLdQTR3qFHjYv8OhUNihk9Z3zwVTk5N0p
         1+t6oodqqstg0wjbi6kHe/BLL1PKMh6HDvED3vQxB+QCprY3QizvcDyD5Vm5E1zX+/w+
         +pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566905; x=1741171705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdmoSrIL4bVnx4zfs232V4a4x4R0T70kGxqY4WZbSQ=;
        b=cnBB8UQcSRKb/38HVxgzXmUllJ739jGST2qKyYm8StTuCm+OJSc7jE7/88MnkTIIKq
         ino3rdxYf7iyqSb8XvE99Dp2FZl+TY2I2Ymion8ipU8xHdS+r8gy+3XC02ljvwrpM2yt
         wzPmiJtuAxZjmB05Dua5OP+/0bJH7ZwHaCnYEoJSPpQIbk+fp4hJa3achWVLHZXw3MBm
         ctkhr9lthquqMZ8AKrGa1GHCPmLJJ5kCpE6I+fKsIkNHD3mmW9Ps1LkWTeh32s0U9tLh
         +rlJTBiYt6/ATIBeb+ZBP9l0jWjKe5fzYq7hCfP0vcpeysJaLIiQ9xJ16WnpqSblEAFa
         +FYg==
X-Forwarded-Encrypted: i=1; AJvYcCXNEQibphcH7j0eRzUS0zii4TEvnhS9smC6Iq3mAtLQCY88NgPcYhLQhyJstPFlJ0kruerhiBQg+b0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBS0Eskl1B4xSGMRUvZKFZgOaK287vM4TkEMFSct+SeSb0D6y1
	4GiXkIqUURjF15f7zDjdBe7/3l9JegLVRI9BWYBSjwAGa+UbsHTYsjcMHOdL7g==
X-Gm-Gg: ASbGncu2Y0OW1UflySYSc02ln36L+gCft1kjK4AHh1v9uUVv5TAKHIGpmR7VRGaZQb9
	iF5rz92urTqUnH09UKy8VSGhAd1tfVwO9Q6zblzsp0/dplONZnvgwDbcb6ewHX71/4gyc4xqmpz
	aETlwMUpp9EDZ1a0vXSfm/WHb9NZMIowEY+gY31VzyXD32YTyAySvZwevArWJiLgV9v9mPKrPZ0
	NFsM22E8Jv/pkDnTDz7tEC2B+gUV55jZ0B8C7V8QdaVc//HXriK1dloZj5CZnZSHUSWscOkr6Nv
	A38wqajyio0om8+Yd6OUw2dVxJKnR8pqDgx2vQsCNcfy8gHbuXdg37RUSsNQ2E8BwMlIXZh0YFI
	HKkmmVZafII4=
X-Google-Smtp-Source: AGHT+IF9p0WAwUfLFaHvtmYqduHfrt6FR9wavuQXYYy5LGfjTAx7UVMl5K/jDvWz1qqKNHQ5sWoKvQ==
X-Received: by 2002:a05:600c:4e8d:b0:439:892c:dfd0 with SMTP id 5b1f17b1804b1-439a30e91femr214615185e9.14.1740566904958;
        Wed, 26 Feb 2025 02:48:24 -0800 (PST)
Message-ID: <82b8b042-564c-4013-863e-499c316be344@suse.com>
Date: Wed, 26 Feb 2025 11:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
 <67c8ce1e-5559-4567-9eed-970d97c29bda@suse.com>
 <e6ea52a3-c7ce-411f-8186-cf725aa608f3@epam.com>
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
In-Reply-To: <e6ea52a3-c7ce-411f-8186-cf725aa608f3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 10:58, Mykyta Poturai wrote:
> On 10.02.25 12:52, Jan Beulich wrote:
>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -20,6 +20,7 @@
>>>   #include <xen/param.h>
>>>   #include <xen/softirq.h>
>>>   #include <xen/keyhandler.h>
>>> +#include <xen/acpi.h>
>>>   #include <xsm/xsm.h>
>>>   
>>>   #ifdef CONFIG_X86
>>> @@ -744,6 +745,18 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>>>       return 0;
>>>   }
>>>   
>>> +int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
>>> +{
>>> +    int ret = -EOPNOTSUPP;
>>> +
>>> +#ifdef CONFIG_HAS_PCI
>>> +    if ( acpi_disabled )
>>> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
>>> +#endif
>>> +
>>> +    return ret;
>>> +}
>>
>> This function has no caller, which violates a Misra rule iirc. Considering
>> all information given here it's also unclear why it would gain a caller on
>> x86 (at least as long as DT isn't used there).
> 
> Would it be ok to wrap it with CONFIG_ARM? I am not quite sure how 
> relevant this mapping functionality is to X86 iommus, although Linux has 
> similar implementations for ACPI.

Besides it being unclear to me whether the function is really Arm-specific
(what about RISC-V or PPC), I also don't see how that would address the
Misra concern. (If the function was truly Arm-specific, it would better
move into an Arm-specific source file.)

> Alternatively, we can remove this abstraction for now, to call 
> iommu_add_dt_pci_sideband_ids from Arm directly and only introduce it 
> back when at least some ACPI implementation is done.

I'd leave that to Arm folks to judge.

> Also, just want to mention the issue that forced me to move this from 
> the header in the first place in case it is not known. There is a 
> conflict in fixed width integers definitions between actypes.h and 
> efibind.h and it was revealed when including acpi.h into iommu.h.
> I initially tried to fix the source of this conflict, but I don't know 
> enough about ACPI and EFI quirks to confidently do it.
> 
> In file included from ./include/acpi/acpi.h:57,
>                   from ./include/xen/acpi.h:57,
>                   from ./include/xen/iommu.h:28,
>                   from ./include/xen/sched.h:12,
>                   from ./arch/x86/include/asm/paging.h:17,
>                   from ./arch/x86/include/asm/guest_access.h:11,
>                   from ./include/xen/guest_access.h:10,
>                   from arch/x86/efi/runtime.c:5:
> ./include/acpi/actypes.h:130:35: error: conflicting types for ‘UINT64’; 
> have ‘long long unsigned int’
>    130 | typedef COMPILER_DEPENDENT_UINT64 UINT64;
>        |                                   ^~~~~~
> In file included from ./arch/x86/include/asm/efibind.h:2,
>                   from ./common/efi/efi.h:1,
>                   from arch/x86/efi/runtime.c:1:
> ./arch/x86/include/asm/x86_64/efibind.h:89:20: note: previous 
> declaration of ‘UINT64’ with type ‘UINT64’ {aka ‘long unsigned int’}
>     89 | typedef uint64_t   UINT64;

Yeah, sadly ACPI and EFI headers (both imported from different origins)
aren't overly compatible with one another.

Jan

