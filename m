Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F164A28736
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882053.1292227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcBE-0000b1-Gx; Wed, 05 Feb 2025 09:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882053.1292227; Wed, 05 Feb 2025 09:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcBE-0000YU-E9; Wed, 05 Feb 2025 09:58:48 +0000
Received: by outflank-mailman (input) for mailman id 882053;
 Wed, 05 Feb 2025 09:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfcBC-0000YK-7g
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:58:46 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ce4a50-e3a7-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:58:44 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dce3763140so162082a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 01:58:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724c9cffsm10990609a12.74.2025.02.05.01.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:58:43 -0800 (PST)
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
X-Inumbo-ID: c8ce4a50-e3a7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738749523; x=1739354323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8LnZCcV0mezdMEilxNWYX5DP/LBcOYWwA67reiYfnWU=;
        b=VSTUaknTNUwgrXQ6/uFqsgP4niMwkiTDNjL7gianf8twwq36yhfbReS9I3A+3GmeUi
         KTeXTNiu+0jQWb1ZWQ8W2QvffmfZrdEI4C8EITsxIo1mPRzv/uWkHL+wRc0XlZOBFrDg
         Z8jPB+sc4rktK1dHNpmdtlgYEau/DMknAJGAiQjmtbEMNoT8tnMjMzZKdPEXpKyTKYAT
         rDuj5C6nI+HyH0rqLsoMMBMzLioAicOMnpCNGpHuqipTbPHqbwX4tR1wtCebQTQROybf
         jlFiM7ospQ9GapTYo661SJHcfVvL1jd83YAdcIFfL6S/M5t/b5na9mSXm402+V/t3F2M
         0djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749523; x=1739354323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LnZCcV0mezdMEilxNWYX5DP/LBcOYWwA67reiYfnWU=;
        b=qjiBtI2FzgITZOZ5zx2kCX2IuBZy8cHZKoBJVCy6y4i7ve+ZwM7vhyqp1I8vGOQmeE
         BRmBETMshWl0XCiAMGgCG2/GbapSFyCGZLMXKMOjOw8i6CkUCkVMQqF84u/163Wdyt3r
         ctx8nc08yiEugDck3UYXTdaHj802voDSNOrqO+sTzxPjLGUTmaLmBXsNOUsIXm4uQaUh
         GxhTCQWsXFCydcyALle8fZYpb/iW/A5fgCEm9ofKKx/hMG06rTYyzctfOgL0JWqTgjop
         J9TK5HFro1KwEck4xD/gamA1UY6VhZB6bASswbjR3cZ4dBF7XZNBWHezONx2qcLxh0Ap
         fzsw==
X-Forwarded-Encrypted: i=1; AJvYcCVpjUL47U3tlaFyK2Vo3JNLoF/DdHIX5lopDQNctLr6dZ3cuEe1AYodk0AeRdI0BabjTYkTmEaVsSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxghiuyWAg48YDIlvueP1SW7OQaGIRSRBNxVbaom9aan8duI6KH
	EP6vsSqcDLogxRB5zDbPT3hqAig5SrmPCgZSJkqeDN1YW+369Vnas0nl9K8Lag==
X-Gm-Gg: ASbGncu28Ohho/QwEBD/7i+4bJeNqnTVw3VmRrGdAZ7BWIL2C34bf9r5Df/6gQkSTbx
	NMf2pgY0KQFnTDGn25/5XrfjZsy9PKr7tdZZjPR2AaUAzeBUO2rfcfMFM9+Rc3quzeqNYEz6phk
	boZoR5fCPmIa2ODM7LLYuYRDxFxeVo2lLejb7Bib83FZfURUDJ/ukTb4RBP9QKnXLyvv0oT3eE7
	W5uy3B2NoTj8e/xMhhkhFc62BHYZ3dkJuNcGgYIyOJZnbk4a8V8iZCaH21PJx8+xNtpUdZuzHVp
	009sSX+uGDQr8QzLzYvEw6IKgbP0u0W6Mlur6/gaZTHh1wZbx5iw4hqKyVPUptEqpWtoqI/MU8W
	P
X-Google-Smtp-Source: AGHT+IHzFpZ4pNKnEU6ySaO3b3sygcRkjlrCKCSJITKJG4qL69WQR1srIz69XY3uFss3MsCMuXT7sQ==
X-Received: by 2002:a05:6402:1d4b:b0:5d2:8f70:75f6 with SMTP id 4fb4d7f45d1cf-5dcdb776f63mr2367176a12.30.1738749523513;
        Wed, 05 Feb 2025 01:58:43 -0800 (PST)
Message-ID: <bce9e718-36bd-4bb6-9a9c-97115f453c1a@suse.com>
Date: Wed, 5 Feb 2025 10:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <Z6Mn2pWdp6aquAmY@macbook.local>
 <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 10:12, Chen, Jiqian wrote:
> On 2025/2/5 16:56, Roger Pau Monné wrote:
>> On Wed, Feb 05, 2025 at 03:42:30AM +0000, Chen, Jiqian wrote:
>>> On 2025/1/27 23:08, Roger Pau Monné wrote:
>>>> On Mon, Jan 27, 2025 at 03:52:31PM +0100, Jan Beulich wrote:
>>>>> On 27.01.2025 15:41, Roger Pau Monné wrote:
>>>>>> On Mon, Jan 27, 2025 at 03:20:40PM +0100, Jan Beulich wrote:
>>>>>>> On 23.01.2025 04:50, Jiqian Chen wrote:
>>>>>>>> v5->v6 changes:
>>>>>>>> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
>>>>>>>> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
>>>>>>>>   from register.
>>>>>>>> * Added the index of BAR to error messages.
>>>>>>>> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
>>>>>>>
>>>>>>> I'm not convinced this was a good change to make. While ...
>>>>>>>
>>>>>>>> +static int cf_check init_rebar(struct pci_dev *pdev)
>>>>>>>> +{
>>>>>>>> +    uint32_t ctrl;
>>>>>>>> +    unsigned int nbars;
>>>>>>>> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
>>>>>>>> +                                                        PCI_EXT_CAP_ID_REBAR);
>>>>>>>> +
>>>>>>>> +    if ( !rebar_offset )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    if ( !is_hardware_domain(pdev->domain) )
>>>>>>>> +    {
>>>>>>>> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
>>>>>>>> +               &pdev->sbdf, pdev->domain);
>>>>>>>> +        return -EOPNOTSUPP;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
>>>>>>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>>>>>>> +    for ( unsigned int i = 0; i < nbars; i++ )
>>>>>>>> +    {
>>>>>>>> +        int rc;
>>>>>>>> +        struct vpci_bar *bar;
>>>>>>>> +        unsigned int index;
>>>>>>>> +
>>>>>>>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
>>>>>>>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
>>>>>>>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>>>>>>>> +                   pdev->domain, &pdev->sbdf, index);
>>>>>>>> +            continue;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        bar = &pdev->vpci->header.bars[index];
>>>>>>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>>>>>>>> +                   pdev->domain, &pdev->sbdf, index);
>>>>>>>> +            continue;
>>>>>>>> +        }
>>>>>>>
>>>>>>> ... for these two cases we can permit Dom0 direct access because the BAR
>>>>>>> isn't going to work anyway (as far as we can tell), ...
>>>>>>>
>>>>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32vpci_hw_read32, vpci_hw_write32,
>>>>>>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
>>>>>>>> +        if ( rc )
>>>>>>>> +        {
>>>>>>>> +            /*
>>>>>>>> +             * TODO: for failed pathes, need to hide ReBar capability
>>>>>>>> +             * from hardware domain instead of returning an error.
>>>>>>>> +             */
>>>>>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
>>>>>>>> +                   pdev->domain, &pdev->sbdf, index, rc);
>>>>>>>> +            continue;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>>>>>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>>>>>>>> +        if ( rc )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
>>>>>>>> +                   pdev->domain, &pdev->sbdf, index, rc);
>>>>>>>> +            continue;
>>>>>>>> +        }
>>>>>>>
>>>>>>> ... in these two cases we had an issue internally, and would hence wrongly
>>>>>>> allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
>>>>>>> only partially direct access, with who knows what resulting inconsistencies).
>>>>>>>
>>>>>>> Only with this particular change undone:
>>>>>> R> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> Otherwise you and Roger (who needs to at least ack the change anyway) will
>>>>>>> need to sort that out, with me merely watching.
>>>>>>
>>>>>> Ideally errors here should be dealt with by masking the capability.
>>>>>> However Xen doesn't yet have that support.  The usage of continue is
>>>>>> to merely attempt to keep any possible setup hooks working (header,
>>>>>> MSI, MSI-X). Returning failure from init_rebar() will cause all
>>>>>> vPCI hooks to be removed, and thus the hardware domain to have
>>>>>> unmediated access to the device, which is likely worse than just
>>>>>> continuing here.
>>>>>
>>>>> Hmm, true. Maybe with the exception of the case where the first reg
>>>>> registration works, but the 2nd fails. Since CTRL is writable but
>>>>> CAP is r/o (and data there is simply being handed through) I wonder
>>>>> whether we need to intercept CAP at all, and if we do, whether we
>>>>> wouldn't better try to register CTRL first.
>>>>
>>>> Indeed, Jiqian is that a leftover from a previous version when writes
>>>> to CAP where ignored for being a read-only register?
>>> Sorry to reply late, I just came back from an annual leave.
>>> Did you mean: why I added handler vpci_hw_write32 for CAP?
>>> If so, this is a change since V2, that you suggested to add it because there is no write limitation for dom0.
>>
>> Indeed, if there's no write limitation, you can just drop the addition
>> of the traps, as the hardware domain by default gets read and write
>> access to all PCI config space.  IOW: there's no need for a
>> vpci_add_register() call for PCI_REBAR_CAP if the handlers are just
>> vpci_hw_{read,write}32().
> OK, I think so.
> 
> Hi Jan, can this change meet your opinion?
> Not to add register for CAP, and if fail to add register for CTRL, then "continue"

Well, Roger as the maintainer has indicated to go that route. That's okay
with me. My only request then is to add a comment there, summarizing what
he said earlier on.

Jan

