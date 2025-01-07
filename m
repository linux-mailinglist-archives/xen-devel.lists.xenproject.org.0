Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F809A04548
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866594.1277906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBy9-0005VC-Ly; Tue, 07 Jan 2025 15:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866594.1277906; Tue, 07 Jan 2025 15:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBy9-0005Tk-J9; Tue, 07 Jan 2025 15:58:13 +0000
Received: by outflank-mailman (input) for mailman id 866594;
 Tue, 07 Jan 2025 15:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBy7-0005TP-Kb
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:58:11 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e27445-cd10-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 16:58:09 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so178120455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:58:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acb85sm50358768f8f.103.2025.01.07.07.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:58:08 -0800 (PST)
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
X-Inumbo-ID: 30e27445-cd10-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736265489; x=1736870289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0o9daT+a94PO+d5RoEpoktH06ZlvJMExcQYADSfY+I=;
        b=Y9uNAP59ViqOtC5cvxig3wwHpzKsABtu6sDupf6QVnkAtsZm3mZC2OdFStNEx22yN5
         M7BvSdNX6QtUDFwudCnq1SQ9vn0FHfNJisPnfKWfXjmluXD0YzMQ3Hu3TBlof5nXkEl8
         yrS7I4pi9Q1ywz0sJqzRc5NQ3f5RAhEq5/uW7WtFU+nAQl+cmTfZvn+1mztOaLAqlOHe
         88TRSUC2ocqd5HAPmM9sCoAa45Zb9qTursFJG3H7e2YpqquoPZM3ulkKxZDLgjHlB4D5
         pPDjF4JmPSgxEUkEAnpVC6OUOdjjFbFnTJmQQuvehP0UwiMrL2k630mvHv2lWV1txrF/
         ZFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265489; x=1736870289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0o9daT+a94PO+d5RoEpoktH06ZlvJMExcQYADSfY+I=;
        b=CsKZ3MlIB3ap2P64ck99G01PGK8uGBW/dwGHBoCu3btQJIIEcEa/IK0wq4rdIN1Aqb
         NiWd2H1eOduNsxwslOsopB7e5pcY4S2sFboUwjj2tHJgVi0sE+uJqG1hpZCLI+DHN3Be
         YrhW+HxC+TGnORBYX0X3dFofI/qXYKyHW2GJSjeDld7toQF8yoS1WCM/w3wfHSLxBLdc
         RnZjVwANJmoeD0CCYqYIxplTmmn0RPhK21dhLlfsz3gR60C+Fe8Qmz4pPm3oItN8NBVn
         cfF+arphwS3t/XDTHmzgVIdd8bXC0idF4S5H97W9Od8wZpjfY7KZ/kLGPXgUjEniRFbT
         6KJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsIyMdiRXQCRrcjNKduYW0W7Uklaezqttt63NpnSy/CiMhcSv8aADhKmwEzdxVFL2kY9X/gwQYnPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzU9CX2zjfXX5k6u9pabbBz7L5g4EnyDFyxqqyaVaPQ1dnvsStU
	GJhd5F2RdjJL1NtT3Xa62xwHwrg1tw5NO1f0EFECXq97B4rhDYePkpJoi4Ww7g==
X-Gm-Gg: ASbGncuYY8CZxGvyzRabVL/6mLO8+wKLfaSyn2FU8ctcAa1ih7AQSjkEN8Vb8/25SBT
	fqmp6xnSIcJbcGkAVOjhAw9igc5r0/mC/L5hEsvi12Olh1DPhuOtaSPofIObjH8W+AKWrOHoci8
	suaZZQ9SRkUEUbkRQArhFicdHvkmoKufsZEhI2fdp3U75fw2iDxxZ+OD4/TCzjhjzNJ7rWJTHBo
	Q3K9Er2Hh6PqNNWgWwh7WKjitqRZMA3wR7WeJnhZnCYQlnIbqFBamjnkLOu+OENK4894eYnLv9G
	WF8/ZHO1EWwGMveYCSR+F0ittqG/hEzYlApEeuyiYg==
X-Google-Smtp-Source: AGHT+IHl2hEu23r0pAHgLIp5OcEqmPIPzKt7ndAJAulEaSb/TN0l1PhVPyoq4NLoW4ZtylZMC1NFQg==
X-Received: by 2002:a5d:5f56:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-38a223f5b41mr60793957f8f.40.1736265488988;
        Tue, 07 Jan 2025 07:58:08 -0800 (PST)
Message-ID: <fb1b00fe-5740-4c0e-81d9-ec9fd9a4a1c3@suse.com>
Date: Tue, 7 Jan 2025 16:58:07 +0100
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
In-Reply-To: <Z308fGa1daaM62Rf@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 15:38, Roger Pau Monné wrote:
> On Tue, Jan 07, 2025 at 11:06:33AM +0100, Jan Beulich wrote:
>> On 19.12.2024 06:21, Jiqian Chen wrote:
>>> --- /dev/null
>>> +++ b/xen/drivers/vpci/rebar.c
>>> @@ -0,0 +1,131 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
>>> + *
>>> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
>>> + */
>>> +
>>> +#include <xen/sched.h>
>>> +#include <xen/vpci.h>
>>> +
>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>> +                                      unsigned int reg,
>>> +                                      uint32_t val,
>>> +                                      void *data)
>>> +{
>>> +    struct vpci_bar *bar = data;
>>> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
>>> +
>>> +    if ( bar->enabled )
>>> +    {
>>> +        /*
>>> +         * Refuse to resize a BAR while memory decoding is enabled, as
>>> +         * otherwise the size of the mapped region in the p2m would become
>>> +         * stale with the newly set BAR size, and the position of the BAR
>>> +         * would be reset to undefined.  Note the PCIe specification also
>>> +         * forbids resizing a BAR with memory decoding enabled.
>>> +         */
>>> +        if ( size != bar->size )
>>> +            gprintk(XENLOG_ERR,
>>> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
>>> +                    &pdev->sbdf);
>>> +        return;
>>> +    }
>>> +
>>> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
>>> +        gprintk(XENLOG_WARNING,
>>> +                "%pp: new size %#lx is not supported by hardware\n",
>>> +                &pdev->sbdf, size);
>>> +
>>> +    bar->size = size;
>>
>> Shouldn't at least this be in an "else" to the if() above?
> 
> I think this was already raised in a previous version - would be good
> to know how real hardware behaves when an invalid size is set.  Is the
> BAR register still reset?

I'm pretty sure what happens is undefined. I'd expect though that the
BAR size then doesn't change. Which would require the above assignment
to not be unconditional.

>>> +static int cf_check init_rebar(struct pci_dev *pdev)
>>> +{
>>> +    uint32_t ctrl;
>>> +    unsigned int nbars;
>>> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
>>> +                                                        PCI_EXT_CAP_ID_REBAR);
>>> +
>>> +    if ( !rebar_offset )
>>> +        return 0;
>>> +
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
>>> +               &pdev->sbdf, pdev->domain);
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>> +
>>> +    for ( unsigned int i = 0; i < nbars; i++ )
>>> +    {
>>> +        int rc;
>>> +        struct vpci_bar *bar;
>>> +        unsigned int index;
>>> +
>>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
>>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;;
>>
>> Nit: No double semicolons please.
>>
>>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
>>> +        {
>>> +            /*
>>> +             * TODO: for failed pathes, need to hide ReBar capability
>>> +             * from hardware domain instead of returning an error.
>>> +             */
>>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>>> +                   pdev->domain, &pdev->sbdf, index);
>>> +            return -EINVAL;
>>
>> With the TODO unaddressed, is it actually appropriate to return an error
>> here? Shouldn't we continue in a best effort manner? (Question also to
>> Roger as the maintainer.)
> 
> It would indeed be better to shallow the error and return 0, however
> the handlers added in this loop would need removing if no error is
> returned.

Would they? For those BARs where things worked fine I would think they
could be left in place.

>>> +        }
>>> +
>>> +        bar = &pdev->vpci->header.bars[index];
>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>>> +                   pdev->domain, &pdev->sbdf, index);
>>> +            return -EINVAL;
>>
>> Same question here then.
>>
>>> +        }
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
>>> +                   pdev->domain, &pdev->sbdf, rc);
>>> +            return rc;
>>> +        }
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
>>> +                   pdev->domain, &pdev->sbdf, rc);
>>> +            return rc;
>>> +        }
>>> +
>>> +        bar->resizable_sizes |=
>>> +            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
>>> +             PCI_REBAR_CAP_SHIFT);
>>
>> Imo this would better use = in place of |= and (see also below) would also
>> better use MASK_EXTR() just like ...
>>
>>> +        bar->resizable_sizes |=
>>> +            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
>>> +             (32 - PCI_REBAR_CAP_SHIFT));
>>
>> ... this one does.
>>
>> Further I think you want to truncate the value for 32-bit BARs, such that
>> rebar_ctrl_write() would properly reject attempts to set sizes of 4G and
>> above for them.
> 
> For the hardware domain at least we shouldn't add such restriction -
> Xen in general allows dom0 to do things it would otherwise consider
> invalid, in case it has to deal with hardware quirks.
> 
> Rather than reject Xen should just print a warning that the sizes
> supported by the device are likely invalid.

And do what when memory decode is re-enabled on the device? What size a
P2M update should it do then?

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
>>>      pci_conf_write16(pdev->sbdf, reg, val);
>>>  }
>>>  
>>> +void cf_check vpci_hw_write32(
>>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>> +{
>>> +    pci_conf_write32(pdev->sbdf, reg, val);
>>> +}
>>
>> This function is being added just to handle writing of a r/o register.
>> Can't you better re-use vpci_ignored_write()?
> 
> But vpci_ignored_write() ignores the write, OTOH here the write is
> propagated to the hardware.

Right, just for the hardware to drop it. I wouldn't have commented if
the function needed to do things like this already existed. Adding yet
another cf_check function just for this is what made me give the remark.

Jan

