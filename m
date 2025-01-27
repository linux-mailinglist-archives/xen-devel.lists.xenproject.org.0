Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4073A1D8C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877995.1288165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQTe-0006Kv-4l; Mon, 27 Jan 2025 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877995.1288165; Mon, 27 Jan 2025 14:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQTe-0006Ih-1Y; Mon, 27 Jan 2025 14:52:38 +0000
Received: by outflank-mailman (input) for mailman id 877995;
 Mon, 27 Jan 2025 14:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcQTc-0006IX-Mo
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:52:36 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56afbc8c-dcbe-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 15:52:33 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5dc10fe4e62so8374477a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:52:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e8b02dsm583160066b.85.2025.01.27.06.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:52:32 -0800 (PST)
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
X-Inumbo-ID: 56afbc8c-dcbe-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737989552; x=1738594352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJNSyZqIcL05KyotkwRsV9dF1Koazr54M3Gb2q3T28Y=;
        b=GTndCGH092Yb5S5Jg9/Az9JqDcurbNn8aBwiKbPphvbQmYrpUgLM8cfgXswZfxayWv
         79tD+qZt8BVf/v/Ym0dvCxWqfLrLllX/asIgXlXdT2yo2pkxmJukw59kMNyjUyGH9EHm
         WxNN92mTsbGLcVm7TL+0TLnYKaC8sdrd1JfZQxjBFACxby4LnvShMuOYZmY8mnA5xOMR
         U3BnXqf6yielcr2Bwc8n4WumqoWLX6vJhWv/QhVJd2mErrojTk+3vAVYI4QuId28MNPo
         VJUdN3iT79stbqsfugaEwBW8t+34riITcYTKwCS8QRmb+qUPyQe+Hap3O25lCB6sUjek
         M43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989552; x=1738594352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJNSyZqIcL05KyotkwRsV9dF1Koazr54M3Gb2q3T28Y=;
        b=mAyliS3bI1rRq6R2it8TzfO6vMNd5XER8xlKRCWYiasTG5+RcNf0kgfOJXC6IpsCEX
         OxHcTIxW1Z6FKoku7WknQx0rLnzqsZw3tKFe1oiMugjhiCxt0P7hFcPWKT6TNoNFexLp
         TvvnMepaNbmeP34MelIOw3QTKLSJY4QzKukbReAVd+girmV8bVHMpeFxYYkXRAs/L75u
         zXn8QXa2Un6xFcMR9v+eH53iY42vCeSrUQfgZiF34aRQ7iuSDNIOqw15TgJkl4I9964n
         dFTGzDcgSFTYmRzZumTsA6dFrWNHpzyR0NrfGoyg3kHhkFTQsVrxm8Xc7W+q0OC9shJQ
         Dr/w==
X-Forwarded-Encrypted: i=1; AJvYcCWXYQxv2+UKjaqmVghu8UveFFgbuMt8tn7FwTcFY5WcaRaPV4sE9Hv04yx8Kf3UvgX3Bg8BvWnI9aQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJa/Qd+knRLCzpgf5QbmxH5XylABkvUMJk1eH9r6YeuyOJipI2
	SzBFbf4NrdC1MKStzKUz5XrwZRelgplDXiHBa2Sr54jjs7fzdH8Af8SAd9dT7g==
X-Gm-Gg: ASbGncv+AHlwDHL9RNy5zt0AfW9+RCm9NA6xwRhhApZKnuA63Fc1Ur1gpt/Cs2GottE
	lYmVaS/FMGB02yD271l0018FLqvf5S5H+8jK4FudLxONJFfkg/N+RB4YosfKmkMrrdfQs6xZfh2
	8T/SFsj6fJeeHgHzvEuT5d+6rDZ3h7AUzciTe8AFGsd2wRgyvMEglvPVbi8gshr+POKCZWmJwYC
	c9BQI18YGcm/v9lQPuWi5PAYws7m34V7EnmS2OtpVNRcUUVmfSfbfLEk8ipGHNwKa9lmgUnCZzC
	4O8juhi3z3ied3dJlSgHq95t4k2QyW+aXDtJLQlDXHAWmyfAYwdpvAggjdYSpmGDLg==
X-Google-Smtp-Source: AGHT+IE5kNezw1MZFDXf44R7W2J1js8nIja71ZVmoyaX702rxjwruUTkVl92ZeH7Mg+ZaeyO2YPhug==
X-Received: by 2002:a17:906:4fc7:b0:aa6:6c08:dc79 with SMTP id a640c23a62f3a-ab38b42d8f9mr4116281666b.35.1737989552329;
        Mon, 27 Jan 2025 06:52:32 -0800 (PST)
Message-ID: <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
Date: Mon, 27 Jan 2025 15:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
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
In-Reply-To: <Z5ebGImjSz-55Nkj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2025 15:41, Roger Pau Monné wrote:
> On Mon, Jan 27, 2025 at 03:20:40PM +0100, Jan Beulich wrote:
>> On 23.01.2025 04:50, Jiqian Chen wrote:
>>> v5->v6 changes:
>>> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
>>> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
>>>   from register.
>>> * Added the index of BAR to error messages.
>>> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
>>
>> I'm not convinced this was a good change to make. While ...
>>
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
>>> +    for ( unsigned int i = 0; i < nbars; i++ )
>>> +    {
>>> +        int rc;
>>> +        struct vpci_bar *bar;
>>> +        unsigned int index;
>>> +
>>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
>>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
>>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>>> +                   pdev->domain, &pdev->sbdf, index);
>>> +            continue;
>>> +        }
>>> +
>>> +        bar = &pdev->vpci->header.bars[index];
>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>>> +                   pdev->domain, &pdev->sbdf, index);
>>> +            continue;
>>> +        }
>>
>> ... for these two cases we can permit Dom0 direct access because the BAR
>> isn't going to work anyway (as far as we can tell), ...
>>
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
>>> +        if ( rc )
>>> +        {
>>> +            /*
>>> +             * TODO: for failed pathes, need to hide ReBar capability
>>> +             * from hardware domain instead of returning an error.
>>> +             */
>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
>>> +                   pdev->domain, &pdev->sbdf, index, rc);
>>> +            continue;
>>> +        }
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
>>> +                   pdev->domain, &pdev->sbdf, index, rc);
>>> +            continue;
>>> +        }
>>
>> ... in these two cases we had an issue internally, and would hence wrongly
>> allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
>> only partially direct access, with who knows what resulting inconsistencies).
>>
>> Only with this particular change undone:
> R> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Otherwise you and Roger (who needs to at least ack the change anyway) will
>> need to sort that out, with me merely watching.
> 
> Ideally errors here should be dealt with by masking the capability.
> However Xen doesn't yet have that support.  The usage of continue is
> to merely attempt to keep any possible setup hooks working (header,
> MSI, MSI-X). Returning failure from init_rebar() will cause all
> vPCI hooks to be removed, and thus the hardware domain to have
> unmediated access to the device, which is likely worse than just
> continuing here.

Hmm, true. Maybe with the exception of the case where the first reg
registration works, but the 2nd fails. Since CTRL is writable but
CAP is r/o (and data there is simply being handed through) I wonder
whether we need to intercept CAP at all, and if we do, whether we
wouldn't better try to register CTRL first.

Jan

> This already happens in other capability init paths, that are much less
> careful about returning errors, so Jan might be right that if nothing
> else for consistency we return an error.  With the hope that
> initialization error of capabilities in vPCI will eventually lead to
> such capabilities being hidden instead of removing all vPCI handlers
> from the device.
> 
> Thanks, Roger.


