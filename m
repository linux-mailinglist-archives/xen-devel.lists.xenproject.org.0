Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDD84E44C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678294.1055403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6eu-00045g-3c; Thu, 08 Feb 2024 15:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678294.1055403; Thu, 08 Feb 2024 15:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6eu-00043j-0s; Thu, 08 Feb 2024 15:49:52 +0000
Received: by outflank-mailman (input) for mailman id 678294;
 Thu, 08 Feb 2024 15:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY6es-00043d-NE
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:49:50 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b02319f9-c699-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 16:49:48 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5114c05806eso3012233e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 07:49:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b004103ffb8cfdsm1684167wmq.10.2024.02.08.07.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:49:47 -0800 (PST)
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
X-Inumbo-ID: b02319f9-c699-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707407388; x=1708012188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9IfOXbySo5kMYwKP5SIe9JdNxvzj7Wb+z/dAnAkMBRk=;
        b=N/yZHE5NRmyjoD+FcQeibpFMvHSQE8TnSFO7tKe5UELfN0bjkzM5Xxy0BhhAUjZ5CN
         seKx4jb94GlCy5/qhv9d2cn126ZrBbcu+OaGDvC7HNOigDMk/iybMotPc6v8KkgldOi5
         bRW/FwKi5+7c02Vb66zBKtRybatrHvp3q8x+3VuN2WclLBJk6YVM1R8th/fExhgBuyI8
         bjDJYKsM6VelSpCXy6rZNoMOgtvGrSdpwveG+wVzJK6j6ZSrq6swq7I8HVHBgsmNpXXK
         hbQKxl8HIX1sv1eF3GHB3h05aL2/Ye3e9u3rWIco3aTBcbREdG/R4RQRESdPGMaMoLFV
         dKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407388; x=1708012188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IfOXbySo5kMYwKP5SIe9JdNxvzj7Wb+z/dAnAkMBRk=;
        b=jI54GNGG8B6Qe0HJR/2ICLFmr7GgBJPTVqsrZA3wE9h518A6zIaU0viPZBX4evlbl5
         W3wfp3qSdPwSjukBVemTapG2TOqWNMhMrl8uUZYC1GG60X8GM3San2/JsdXSvyk+1r97
         kMoyBFTdG5VnT2hNfXNP1sTiR9KkOAP1DArfX80XPI17pdLr4i0dtgXDU7BsFddawfwC
         9YJO1cQXeTb2inQciKEnK7eWVXHLlGJBrwrXVK0QDaMBebSFZ5wKwxjKsP1XKMvVIaQN
         YSZEe+o0QEGOI6JQ/NgXvV/HPFjwpOrNJxkFOGT9sVsCbcgq1p8yR67EnAHriICCrfrz
         lXnA==
X-Gm-Message-State: AOJu0YzwxJtOCua6XG/ojdWttpE3lCUhMyL/I/HVgTPdZsCfXKylFDSz
	nQA1efBth1CqIm++/NJSNg3jgLdhXaptyx/sPQudiXjvPja248xBYgLlgdv3rQ==
X-Google-Smtp-Source: AGHT+IGkgUj99GW2jBlzP2XdvWHMwKlracBDRcumKQS8z0i1cltN0/+nZZiLulUFE8U5F1W+DzXu6Q==
X-Received: by 2002:ac2:43b7:0:b0:511:6fe4:efdd with SMTP id t23-20020ac243b7000000b005116fe4efddmr1294133lfl.5.1707407387752;
        Thu, 08 Feb 2024 07:49:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpyOH/CbRFQhYXusBikQwsLshn/7WhUIACgnYx1yIXlD3Nw1VpEH0V5STBD5Y9QMyNxhcCDesS1DoCGnLVcZRQFOVNOL9LQdsQMQMsGLW7TV9vzdEP104thltYrZC2NCgQURSYE61Ri7VgJvsO
Message-ID: <4179ded9-36b8-4d47-997b-40d056e033af@suse.com>
Date: Thu, 8 Feb 2024 16:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com> <ZcS_uC2t96Lh720Y@macbook>
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
In-Reply-To: <ZcS_uC2t96Lh720Y@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 12:49, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
>> Make the variable a tristate, with (as done elsewhere) a negative value
>> meaning "default". Since all use sites need looking at, also rename it
>> to match our usual "opt_*" pattern. While touching it, also move it to
>> .data.ro_after_init.
>>
>> The only place it retains boolean nature is pci_ats_device(), for now.
> 
> Why does it retain the boolean nature in pci_ats_device()?
> 
> I assume this is to avoid having to touch the line again in a further
> patch, as given the current logic pci_ats_device() would also want to
> treat -1 as ATS disabled.

No, then I would need to touch the line. The function wants to treat
-1 as "maybe enabled", so the caller can know whether a device is an
ATS device regardless of whether ATS use is fully off, or only
"soft-off".

> I think this is all fine because you add additional opt_ats > 0 checks
> before the call to pci_ats_device(), but would be good to know this is
> the intention.

Note how amd_iommu_disable_domain_device() does not gain such a
check, for exactly the reason named above: The function would better
turn off ATS whenever enabled, no matter for what reason.

And of course - none of this "soft-off" vs "fully off" matters for
AMD (which is the only user of the function) right now anyway, seeing
they don't have an equivalent of the ATC_REQUIRED flag.

>> In AMD code re-order conditionals to have the config space accesses
>> after (cheaper) flag checks.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In domain_context_mapping_one() I'm a little puzzled that translation
>> type is selected based on only IOMMU and global properties, i.e. not
>> taking the device itself into account.
> 
> That seems like a bug to me, we should check that the device supports
> ATS (and has it enabled) before setting the translation type to
> CONTEXT_TT_DEV_IOTLB unconditionally.  We should likely use
> ats_device() instead of ats_enabled in domain_context_mapping_one().

Will try to remember to add yet another patch then.

> There's also IMO a second bug here, which is that we possibly attempt
> to flush the device IOTLB before having ATS enabled.  We flush the
> device TLB in domain_context_mapping_one(), yet ATS is enabled by the
> caller afterwards (see domain_context_mapping()).

You may be right with this; I'd need to read up on whether such
flushing is permissible.

>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
>>          dte->ex = ivrs_dev->dte_allow_exclusion;
>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>>  
>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>> +        if ( opt_ats > 0 &&
>>               !ivrs_dev->block_ats &&
>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>> -            dte->i = ats_enabled;
>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
>> +            dte->i = true;
>>  
>>          spin_unlock_irqrestore(&iommu->lock, flags);
>>  
>> @@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
>>          ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
>>                                           ACPI_IVHD_SYSTEM_MGMT));
>>  
>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>> +        if ( opt_ats > 0 &&
>>               !ivrs_dev->block_ats &&
>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>> -            ASSERT(dte->i == ats_enabled);
>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
>> +            ASSERT(dte->i);
>>  
>>          spin_unlock_irqrestore(&iommu->lock, flags);
>>  
>> @@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
>>  
>>      ASSERT(pcidevs_locked());
>>  
>> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>> +    if ( opt_ats > 0 &&
>>           !ivrs_dev->block_ats &&
>>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> +         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> 
> Seeing that this same set of conditions is used in 3 different checks,
> could we add a wrapper for it?
> 
> opt_ats > 0 && !ivrs_dev->block_ats &&
> iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> pci_ats_device(iommu->seg, bus, pdev->devfn)
> 
> pci_device_ats_capable()? or some such.

I was pondering that, yes (iirc already once when adding block_ats).
Problem is the name. "capable" isn't quite right when considering
the tristate opt_ats. And pci_device_may_use_ats() reads, well,
clumsy to me. If you have any good idea for a name that's fully
applicable and not odd or overly long, I can certainly introduce
such a helper.

Jan

