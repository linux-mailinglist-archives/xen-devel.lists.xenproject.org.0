Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA039A05460
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866879.1278246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQMC-0000js-GE; Wed, 08 Jan 2025 07:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866879.1278246; Wed, 08 Jan 2025 07:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQMC-0000he-DZ; Wed, 08 Jan 2025 07:20:00 +0000
Received: by outflank-mailman (input) for mailman id 866879;
 Wed, 08 Jan 2025 07:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVQMB-0000hY-5u
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:19:59 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f75cf9cf-cd90-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 08:19:58 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so11418283f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:19:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm53918003f8f.0.2025.01.07.23.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:19:57 -0800 (PST)
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
X-Inumbo-ID: f75cf9cf-cd90-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736320798; x=1736925598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eEXZ4sJbGN687HyvKYaDPn5AHiUmfrPbzdtkBC35uzY=;
        b=XUoe2aBPGXxqvrsv41teUWuBs+I7bRmMJDcedmfK7TVqWlvZ6r9cQxWBg/UEg68O8m
         QaslCr4c2uOkx5F7M8zlwH+FHWoIfSmLYiiJY6f6Z34aMFiOfqJFoma2+hVSTYXfME/D
         p2gKN3JP9HwS2kKDY1KG/d3abhga4hwdP0EDp/X65iSzb0kp3DrdTmWCWZ1hD68lCv/j
         5IfVAT7Ca3mCr52Y0X1JwPAJJWGeCKLTbvrAD8EdfhXL1oOvUrE4UQtqoKg7AMtBfjRU
         uz2iw2SKHRG15m8lfCOb8GmE/8zy9x3HhsmdNE2qzEbKnonCjc++N5256rv9f6fbJF18
         Wt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320798; x=1736925598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEXZ4sJbGN687HyvKYaDPn5AHiUmfrPbzdtkBC35uzY=;
        b=Nht1Kg98ErS5xkRMY1i7jB3g8ogCsdKLAK7Do5M99enrfGv4z5aLJCfKJFtXNQ9Ixo
         /eBRcOKcGQs+wqtz9IfV7XYDJLYB9MQPqxzdgaRhxRQj5SfRMLrlzdK5QCZufMBAdgub
         C9Um6uQjpZfbo99wQDQwm+F4WxPahR4sdJq+QGgjLMMVnUs30sUrwH7PFCtws3yDoih8
         +JRGuw1j52ObLHfO4PhXIJMHpntqHdPEzRwtGY3GftfHHI7CzZLj9R4Pq7s0vobDc5Pc
         p09zpQaGpG1Whhw/pAY41u2PuEbdsl+Al19lASCMFhWb7Ehy/g+AUcVVYcECRkLEQmDI
         AV8A==
X-Forwarded-Encrypted: i=1; AJvYcCXk2EhZGxFlsHyAbLry4o4ICyn/bU9MlxN1dwkvaXqha4KSOvozkjRfc/HeCWG3irQbo04Gt1VDX94=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx41jJ+BI6ljfEyi7NA8D1DI7Tp2Z/kGT1V0EB894cwa9D3IAYY
	uuXd10LUXvfoJWWeZSJP3CX5FjT6Xf5RkDHow0OxC1kmiUBmoA1DGkcC39x69Q==
X-Gm-Gg: ASbGncv4ndoBQZuZPB5Vbiy2dks+vq+2ntikXyb5vPk+lWeg7qjf6OePrXrzaaZx4Q/
	bM7PSMtdGt/y9bMoJXJMEU18nI7FsJE3tL0yKLNQ8CzIt8H0O0MQPmn471iS3IGPOw5PVcm0GcY
	T3uI8AuTL7kSNWmQXAkwjg4FRU7AM3+guM09KSSVZ9F9glicmh0dHwebdQEPt94MskDbLnJCBS4
	IE8B8wC6Ywuy9TlBv7PLn3lFgZvxrucJ34ABFF/Az7R2aTJo58bIgREWH3V72pmpLQEz9xWU4vj
	oRN3biKVPF8/mUPjjDF/CHCL2gMYFasNJTZm9HrhHQ==
X-Google-Smtp-Source: AGHT+IH+ThGGc3Gpbbk0/hf8NxXu2RAEgRAI+tMxQhDnVEGS8dmusNJ9P/mvPtHiWjpl6khFwCqZsQ==
X-Received: by 2002:a05:6000:144d:b0:388:e377:8a1b with SMTP id ffacd0b85a97d-38a8730cc78mr1067893f8f.28.1736320797589;
        Tue, 07 Jan 2025 23:19:57 -0800 (PST)
Message-ID: <d5e37e59-2a05-4184-9b1e-ca0bf77f201c@suse.com>
Date: Wed, 8 Jan 2025 08:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
 <d904c816-da83-418a-9bff-9988660af546@suse.com>
 <Z308fGa1daaM62Rf@macbook.local>
 <fb1b00fe-5740-4c0e-81d9-ec9fd9a4a1c3@suse.com>
 <Z31wFjWadOkzTDK3@macbook.local>
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
In-Reply-To: <Z31wFjWadOkzTDK3@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 19:19, Roger Pau Monné wrote:
> On Tue, Jan 07, 2025 at 04:58:07PM +0100, Jan Beulich wrote:
>> On 07.01.2025 15:38, Roger Pau Monné wrote:
>>> On Tue, Jan 07, 2025 at 11:06:33AM +0100, Jan Beulich wrote:
>>>> On 19.12.2024 06:21, Jiqian Chen wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/drivers/vpci/rebar.c
>>>>> @@ -0,0 +1,131 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
>>>>> + *
>>>>> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>> + */
>>>>> +
>>>>> +#include <xen/sched.h>
>>>>> +#include <xen/vpci.h>
>>>>> +
>>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>> +                                      unsigned int reg,
>>>>> +                                      uint32_t val,
>>>>> +                                      void *data)
>>>>> +{
>>>>> +    struct vpci_bar *bar = data;
>>>>> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
>>>>> +
>>>>> +    if ( bar->enabled )
>>>>> +    {
>>>>> +        /*
>>>>> +         * Refuse to resize a BAR while memory decoding is enabled, as
>>>>> +         * otherwise the size of the mapped region in the p2m would become
>>>>> +         * stale with the newly set BAR size, and the position of the BAR
>>>>> +         * would be reset to undefined.  Note the PCIe specification also
>>>>> +         * forbids resizing a BAR with memory decoding enabled.
>>>>> +         */
>>>>> +        if ( size != bar->size )
>>>>> +            gprintk(XENLOG_ERR,
>>>>> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
>>>>> +                    &pdev->sbdf);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
>>>>> +        gprintk(XENLOG_WARNING,
>>>>> +                "%pp: new size %#lx is not supported by hardware\n",
>>>>> +                &pdev->sbdf, size);
>>>>> +
>>>>> +    bar->size = size;
>>>>
>>>> Shouldn't at least this be in an "else" to the if() above?
>>>
>>> I think this was already raised in a previous version - would be good
>>> to know how real hardware behaves when an invalid size is set.  Is the
>>> BAR register still reset?
>>
>> I'm pretty sure what happens is undefined. I'd expect though that the
>> BAR size then doesn't change. Which would require the above assignment
>> to not be unconditional.
> 
> Might be better to just re-size the BAR, like you suggested to fetch
> the BAR position from the register, instead of assuming 0.

FTAOD by "re-size" you mean re-obtain its size (seeing we're talking of
re-sizable BARs here)? As kind of confirmed ...

>>>>> +        }
>>>>> +
>>>>> +        bar = &pdev->vpci->header.bars[index];
>>>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>>>>> +                   pdev->domain, &pdev->sbdf, index);
>>>>> +            return -EINVAL;
>>>>
>>>> Same question here then.
>>>>
>>>>> +        }
>>>>> +
>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
>>>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
>>>>> +        if ( rc )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
>>>>> +                   pdev->domain, &pdev->sbdf, rc);
>>>>> +            return rc;
>>>>> +        }
>>>>> +
>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>>>>> +        if ( rc )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
>>>>> +                   pdev->domain, &pdev->sbdf, rc);
>>>>> +            return rc;
>>>>> +        }
>>>>> +
>>>>> +        bar->resizable_sizes |=
>>>>> +            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
>>>>> +             PCI_REBAR_CAP_SHIFT);
>>>>
>>>> Imo this would better use = in place of |= and (see also below) would also
>>>> better use MASK_EXTR() just like ...
>>>>
>>>>> +        bar->resizable_sizes |=
>>>>> +            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
>>>>> +             (32 - PCI_REBAR_CAP_SHIFT));
>>>>
>>>> ... this one does.
>>>>
>>>> Further I think you want to truncate the value for 32-bit BARs, such that
>>>> rebar_ctrl_write() would properly reject attempts to set sizes of 4G and
>>>> above for them.
>>>
>>> For the hardware domain at least we shouldn't add such restriction -
>>> Xen in general allows dom0 to do things it would otherwise consider
>>> invalid, in case it has to deal with hardware quirks.
>>>
>>> Rather than reject Xen should just print a warning that the sizes
>>> supported by the device are likely invalid.
>>
>> And do what when memory decode is re-enabled on the device? What size a
>> P2M update should it do then?
> 
> You did suggest to re-read the BARs positions after a ctrl write, we
> might as well read the BAR size and use that to be on the safe side.

... here.

>>>>> --- a/xen/drivers/vpci/vpci.c
>>>>> +++ b/xen/drivers/vpci/vpci.c
>>>>> @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
>>>>>      pci_conf_write16(pdev->sbdf, reg, val);
>>>>>  }
>>>>>  
>>>>> +void cf_check vpci_hw_write32(
>>>>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>>>> +{
>>>>> +    pci_conf_write32(pdev->sbdf, reg, val);
>>>>> +}
>>>>
>>>> This function is being added just to handle writing of a r/o register.
>>>> Can't you better re-use vpci_ignored_write()?
>>>
>>> But vpci_ignored_write() ignores the write, OTOH here the write is
>>> propagated to the hardware.
>>
>> Right, just for the hardware to drop it. I wouldn't have commented if
>> the function needed to do things like this already existed. Adding yet
>> another cf_check function just for this is what made me give the remark.
> 
> According to the spec yes, they will be ignored.  Yet for the hardware
> domain we try to avoid changing behavior from native as much as
> possible, hence propagating the write seems more appropriate.

Okay; you're the maintainer of this code anyway.

Jan

