Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424C851156
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679529.1056987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTod-0005s7-96; Mon, 12 Feb 2024 10:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679529.1056987; Mon, 12 Feb 2024 10:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTod-0005qb-6I; Mon, 12 Feb 2024 10:45:35 +0000
Received: by outflank-mailman (input) for mailman id 679529;
 Mon, 12 Feb 2024 10:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZTob-0005qR-Qk
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:45:33 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d89ab291-c993-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 11:45:32 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d09b21a8bbso34370291fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:45:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0033b5a6b4b9bsm6574107wrg.71.2024.02.12.02.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 02:45:31 -0800 (PST)
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
X-Inumbo-ID: d89ab291-c993-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707734732; x=1708339532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozEedm038kZzzThqZKsqIqIgWeSfHq5VvZACBL6sBvs=;
        b=YhTTVFw8oDaGGBa1Ji1k+lh0q4/mZjyza6L5JaJIlGQM2Bqo3UWaMq6jlL3olqcq3/
         2wdU0j3rwn6GtnKDCevCq2GNpL2DBx0w+hPRZKJ9ezcHV+51HSUOglYhOkw7HGEtB04M
         Lj4i8X/e5gJNaY1iYmmBbdEinfVX8N/uvynZCxw+v92RlLL4S1mEfLoIFm3mR1YLpvPK
         ww2fspilTm1wYS/0395F1EFQHuQb1syfXhpMkl6a2vdMDC3QELAmuXYIgOZkiwreDanY
         l/e1jv9Io0TTr3pO5JftrnYjasFJ+t2DdwTTxaV1jBRJ0EZcx6OmYpqId0TGcpiUzB4L
         7+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734732; x=1708339532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozEedm038kZzzThqZKsqIqIgWeSfHq5VvZACBL6sBvs=;
        b=beRK2QqF+DmEJfP8XeXaSUMTxulTVFJGzeIFBwFNkeit9aQiO1G0EnbodcnrsAGgkt
         8Sgq7Ke+G/5/ZC24n+Tc4NP31CKPnWbIAsGpwMVgT0tWtQv3dPLZaHMVoPyz7miguN4Z
         e9c7If2eA1J7nKeajK6ejnfekKZI1oXYH2h50Tjy+mW2aceKugx4Fa5sx4QqTDmTBqer
         b9E988PHst11qxEPlwBHyJdLmwEtuqdVH2tPKPBeSx++W26kaG/VY4ScJMFhQmWdekYQ
         J9YSE8DJpk/0Ls6pyJHZchCLF53xbp3Smre4SdMvym48Ss4oS6e/1TXnE1Xkh9UK278L
         mU7w==
X-Gm-Message-State: AOJu0Yzb675q42W302nBJNn4j0wCba9QMVK1Nm6PI6sZ9SDB0573nJkq
	cJ1t9FwZW5/aKNN3B+UcCcnhWvpwbDSnzc+OGQ2vqtmMkXioVgIFXb4EAJo6IA==
X-Google-Smtp-Source: AGHT+IGEf03lNC/YM35ygrRiY65g8fa2ADByICiNTEqp6Ufzb0xbsA/qkTqP5bScCv/0VX2LvvuNfA==
X-Received: by 2002:a2e:8ecf:0:b0:2d0:cd25:e569 with SMTP id e15-20020a2e8ecf000000b002d0cd25e569mr4223034ljl.5.1707734732232;
        Mon, 12 Feb 2024 02:45:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtU1BZ9cSDCeobDz29G86DNTvnEr6e4pRzBXBdeFJuNalAwGKIjM84tjLD1tHiP7DeBA25lBQZUOCwK3jjQBK7KXeZjIVEyRsUSE+KfNMHUPngrSeM20oH8zrFsTpNwRuYwMuaU45gQcruPrhk
Message-ID: <2fccd004-b35a-4cde-afbb-722cb2413902@suse.com>
Date: Mon, 12 Feb 2024 11:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <467d24e1-8ed3-4dda-a334-70ff747bf94b@suse.com> <ZcS_uC2t96Lh720Y@macbook>
 <4179ded9-36b8-4d47-997b-40d056e033af@suse.com> <ZcnnautuDD2qluQm@macbook>
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
In-Reply-To: <ZcnnautuDD2qluQm@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2024 10:39, Roger Pau Monné wrote:
> On Thu, Feb 08, 2024 at 04:49:46PM +0100, Jan Beulich wrote:
>> On 08.02.2024 12:49, Roger Pau Monné wrote:
>>> On Mon, Feb 05, 2024 at 02:55:43PM +0100, Jan Beulich wrote:
>>>> Make the variable a tristate, with (as done elsewhere) a negative value
>>>> meaning "default". Since all use sites need looking at, also rename it
>>>> to match our usual "opt_*" pattern. While touching it, also move it to
>>>> .data.ro_after_init.
>>>>
>>>> The only place it retains boolean nature is pci_ats_device(), for now.
>>>
>>> Why does it retain the boolean nature in pci_ats_device()?
>>>
>>> I assume this is to avoid having to touch the line again in a further
>>> patch, as given the current logic pci_ats_device() would also want to
>>> treat -1 as ATS disabled.
>>
>> No, then I would need to touch the line. The function wants to treat
>> -1 as "maybe enabled", so the caller can know whether a device is an
>> ATS device regardless of whether ATS use is fully off, or only
>> "soft-off".
> 
> I have to admit I'm slightly concerned about this soft-off.  Given the
> current status of ATS itself in Xen, and the technology itself, I
> think a user should always opt-in to ATS usage.

The plan is to follow your suggestion in patch 3 and require explicit
enabling for passing through of such devices. For Dom0, however, I
think it is important that we respect the firmware request by default.
The only viable(?!) alternative would be to panic() instead.

>>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>> @@ -185,10 +185,11 @@ static int __must_check amd_iommu_setup_
>>>>          dte->ex = ivrs_dev->dte_allow_exclusion;
>>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>>>>  
>>>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>>> +        if ( opt_ats > 0 &&
>>>>               !ivrs_dev->block_ats &&
>>>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>>>> -            dte->i = ats_enabled;
>>>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>>>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
>>>> +            dte->i = true;
>>>>  
>>>>          spin_unlock_irqrestore(&iommu->lock, flags);
>>>>  
>>>> @@ -248,10 +249,11 @@ static int __must_check amd_iommu_setup_
>>>>          ASSERT(dte->sys_mgt == MASK_EXTR(ivrs_dev->device_flags,
>>>>                                           ACPI_IVHD_SYSTEM_MGMT));
>>>>  
>>>> -        if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>>> +        if ( opt_ats > 0 &&
>>>>               !ivrs_dev->block_ats &&
>>>> -             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>>>> -            ASSERT(dte->i == ats_enabled);
>>>> +             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>>>> +             pci_ats_device(iommu->seg, bus, pdev->devfn) )
>>>> +            ASSERT(dte->i);
>>>>  
>>>>          spin_unlock_irqrestore(&iommu->lock, flags);
>>>>  
>>>> @@ -268,9 +270,10 @@ static int __must_check amd_iommu_setup_
>>>>  
>>>>      ASSERT(pcidevs_locked());
>>>>  
>>>> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>>> +    if ( opt_ats > 0 &&
>>>>           !ivrs_dev->block_ats &&
>>>>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>>>> +         pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>>>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>>>
>>> Seeing that this same set of conditions is used in 3 different checks,
>>> could we add a wrapper for it?
>>>
>>> opt_ats > 0 && !ivrs_dev->block_ats &&
>>> iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>>> pci_ats_device(iommu->seg, bus, pdev->devfn)
>>>
>>> pci_device_ats_capable()? or some such.
>>
>> I was pondering that, yes (iirc already once when adding block_ats).
>> Problem is the name. "capable" isn't quite right when considering
>> the tristate opt_ats. And pci_device_may_use_ats() reads, well,
>> clumsy to me. If you have any good idea for a name that's fully
>> applicable and not odd or overly long, I can certainly introduce
>> such a helper.
> 
> But if ATS is soft-disabled (-1) or hard disabled (0), it's fine to
> consider the devices as not ATS capable for the context here?

I don't like mixing capability and policy aspects into a resulting
"capable".

Jan

