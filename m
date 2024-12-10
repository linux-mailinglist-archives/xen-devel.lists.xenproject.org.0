Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907569EA963
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 08:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851891.1265875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuV1-0005zZ-Gk; Tue, 10 Dec 2024 07:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851891.1265875; Tue, 10 Dec 2024 07:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuV1-0005wj-Dr; Tue, 10 Dec 2024 07:17:39 +0000
Received: by outflank-mailman (input) for mailman id 851891;
 Tue, 10 Dec 2024 07:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKuV0-0005pk-Jw
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 07:17:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d562cab3-b6c6-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 08:17:37 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso2628099f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 23:17:37 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:a58f:4219:ab5d:cf03?
 (p200300cab746063ca58f4219ab5dcf03.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:a58f:4219:ab5d:cf03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862e52a96csm11645346f8f.33.2024.12.09.23.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 23:17:36 -0800 (PST)
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
X-Inumbo-ID: d562cab3-b6c6-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733815057; x=1734419857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Juq6WqKgwtWs4FOuT6Ymg/mdR62ofayr2Su4F4rhCw=;
        b=WeIbIa/AMUOHKCge5hYkz3wO8OdMH5lwLuBJoy1/RjDHTk1qI4BD3H1LlXSXf40C91
         Lo4lIxMjp3Lx1Qc9PIkxsiNVyVYIEFY2V5ckC8Dmyg0gRe6QhcexBKjer4rEM3JZjJXp
         nwMGPPtfvUZj8HH1Ah3SeFOChMJvbtE5+xHUQAGrm1ye5YQ5yAvjQNuCoJmUMIRW9jL8
         S0rK1gguFtEEOm/4zR+f0+pTSRd3dJxhHGGtyWgQXXwiV39C2uI9dg9CnBYZEojC74Td
         p8sYQDxrt0xtO5Flj1htbqmHkCiYCimXMEFiZZCdlFbtqlFkkv27oKNBod1RQcEV4U8/
         RsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815057; x=1734419857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Juq6WqKgwtWs4FOuT6Ymg/mdR62ofayr2Su4F4rhCw=;
        b=CLB4J/Iab8CR1lRojY2DaMVsO/D7UgC9UHtRQ5+ATKKnUNMgSMauu7NIVOyXA1Jklt
         oCAR2wRD3EdeHLz/WbSBmEEgkBUq385KOP3rONymGBHwjNEmfoM7yMGxThAshD+4z+Jy
         gH8kagmuW2qLvCs5pfSoUrPFFvgHG6CDuj/CemcdM+SOlo2T82nO9oXe04ai30/W5az4
         a6hqc43k9qsNnf173duBOaJ0Tf00QbmDKBMJ/BfAM+48HCPGarOKoOyn08InFz3mO0vQ
         kKLoU+tL0s0T7iRXNjViCzukAxrOmFr1PgOpDW9EuDskLIIoT+6HkPQOnH8Vwf0tcQRm
         Q0vA==
X-Forwarded-Encrypted: i=1; AJvYcCVAJ6EvJFb/w/veSRz16JWSht/jhVWnm6wIUp0XK90FEirLvGCsf0DfEVXQB7ikijtf8VXZ9d27OuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwatS61ork7t13PssPeVdvirNobBPfjvxtDkk95uHJiAfRNj99U
	fFF1SjQBoVj8Q8i74Tz07LmaJc4faaYqYNSO7MJQzBMaWNH3D96RNMLl0ggYQg==
X-Gm-Gg: ASbGncv+mXj/v50B0lOxTPyYDrWCfSjX26yAw4qQyaA1EvtzEHn8Sl2hfhd8W5Mgy7q
	a2OvN+hCt7hF4ZZC15GgP1xH6GFESxMdMtffcFYrlkIDnD5huaT2HLVLL9HH9pBWWL67JpARE5z
	scL7dAzNVfZRxvlZmX72gzWUXd0VvKTmHWjKhNQlEf/3qbeH/jDBtNIpvXRL24SCMIMf5hecnft
	A746XEVITxIc+DnwQWZX1VsGRyoCVAJ154LVUtfGJdgle34d+rS6+XwO7qxy96mFdebfJAZxfJP
	/gV2ERo9tvhArYvskx/Qx9ABOkFlbD+7Ui0hauPe6UR8VjS19eIK7M0PuPc7t4hrOABeqdHjnYR
	jnr9XYXkl6w==
X-Google-Smtp-Source: AGHT+IF7MlPoFurWAOAWaiWg1w/Hl3IzUGIlmSTlJxRJu2fF1BQJBBEROZJvaVxQjo9lHlg17MSICw==
X-Received: by 2002:a5d:5f53:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-386453da317mr2745873f8f.20.1733815056726;
        Mon, 09 Dec 2024 23:17:36 -0800 (PST)
Message-ID: <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
Date: Tue, 10 Dec 2024 08:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 08:07, Chen, Jiqian wrote:
> On 2024/12/9 21:59, Jan Beulich wrote:
>> On 02.12.2024 07:09, Jiqian Chen wrote:
>>> --- /dev/null
>>> +++ b/xen/drivers/vpci/rebar.c
>>> @@ -0,0 +1,93 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>
>> Was this a deliberate decision? We default to GPL-2.0-only, I think.
> Will change to GPL-2.0-only.
> What's the difference between GPL-2.0-only and GPL-2.0-or-later?

As the name says, the latter includes any known or yet to be written newer
versions of the GPL.

>>> +/*
>>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
>>> + *
>>> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
>>> + */
>>> +
>>> +#include <xen/hypercall.h>
>>> +#include <xen/vpci.h>
>>> +
>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>> +                                      unsigned int reg,
>>> +                                      uint32_t val,
>>> +                                      void *data)
>>> +{
>>> +    uint64_t size;
>>> +    unsigned int index;
>>> +    struct vpci_bar *bars = data;
>>> +
>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>> +        return;
>>
>> I don't think something like this can go uncommented. I don't think the
>> spec mandates to drop writes in this situation?
> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
> such as the result of debugging with Roger in the previous version.
> I will add the spec's sentences as comments here in next version.

What you quote from the spec may not be enough as a comment here. There's
no direct implication that the write would simply be dropped on the floor
if the bit is still set. So I think you want to go a little beyond just
quoting from the spec.

>>> +        if ( rc )
>>> +        {
>>> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
>>> +                   &pdev->sbdf, rc);
>>> +            break;
>>> +        }
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>> +                               rebar_offset + PCI_REBAR_CTRL, 4,
>>> +                               pdev->vpci->header.bars);
>>> +        if ( rc )
>>> +        {
>>> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
>>> +                   &pdev->sbdf, rc);
>>> +            break;
>>
>> Is it correct to keep the other handler installed? After all ...
> Will change to "return rc;" here and above in next version.

I'm not convinced this is what we want, as per ...

>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>
>> ... you - imo sensibly - aren't communicating the error back up (to allow
>> the device to be used without BAR resizing.

... what I said here.

>>> @@ -541,6 +542,16 @@
>>>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>>>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>>>  
>>> +/* Resizable BARs */
>>> +#define PCI_REBAR_CAP		4	/* capability register */
>>> +#define  PCI_REBAR_CAP_SIZES		0xFFFFFFF0  /* supported BAR sizes */
>>
>> Misra demands that this have a U suffix.
> Do below PCI_REBAR_CTRL_BAR_IDX, PCI_REBAR_CTRL_NBAR_MASK and PCI_REBAR_CTRL_BAR_SIZE also need a U suffix?

They may want to gain them for consistency, but they don't strictly need
them. I wanted to say "See the rest of the file", but it looks like the
file wasn't cleaned up yet Misra-wise.

>>> +#define PCI_REBAR_CTRL		8	/* control register */
>>> +#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007  /* BAR index */
>>> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
>>> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
>>> +#define  PCI_REBAR_CTRL_SIZE(v) \
>>> +            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))
>>
>> The literal 20 (appearing here the 2nd time) also wants hiding behind a
>> #define.
> OK, will add " #define PCI_REBAR_SIZE_UNIT_BYTES_LEN 20" to replace above two '20' case.

What is "UNIT_BYTES_LEN" there? There's nothing byte-ish here, I don't
think, 20 is simply the shift bias.

Jan

