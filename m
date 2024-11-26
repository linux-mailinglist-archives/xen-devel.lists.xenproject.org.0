Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E29D94DD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843477.1259090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsAg-0000qX-K1; Tue, 26 Nov 2024 09:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843477.1259090; Tue, 26 Nov 2024 09:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsAg-0000nu-Gt; Tue, 26 Nov 2024 09:47:50 +0000
Received: by outflank-mailman (input) for mailman id 843477;
 Tue, 26 Nov 2024 09:47:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFsAe-0000no-Iu
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:47:48 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd95408-abdb-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 10:47:45 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3823eb7ba72so3615046f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:47:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb537dfsm12757071f8f.63.2024.11.26.01.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:47:44 -0800 (PST)
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
X-Inumbo-ID: 7cd95408-abdb-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdjZDk1NDA4LWFiZGItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjE0NDY1LjQ1NjI4MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732614465; x=1733219265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YRNxrvGGPv+J7YPiNDTf+hiJYnm6JyW2vOAOkEdMY94=;
        b=Z4ybu+6O4kbbP93yACoKTftQzF2waG3tt+HhNEyj7KnE4x3R1SyndvLRGFAs1okEqk
         Bube2mbtoIQ1w5BiGSGg/l9rtVqJ9dSUPgq8rkHBpPDOW3IBuzYWkp+zKVHX8re7gc7j
         ILVvE+SDcFh5XmtRmDln+rnUwSQe2Zbia5LJTIuxPwqVbVM0goCqT005/eMm5ypCLrQV
         Hd5BPtuhywFMKMm834H1dsCvOV8bvnj0j3w5g2t93S+KMYczlirAmzNNYDpJFoEgPpfQ
         mzs0CwznYy4SPiOsgzt29jP2xDlR/XAkr1W1aFZmLML71IGyV4Vlrv//CC3bfnK/cPsY
         NYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732614465; x=1733219265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRNxrvGGPv+J7YPiNDTf+hiJYnm6JyW2vOAOkEdMY94=;
        b=K5e9mZB0oofu6Tvt1PFqaqAY9K+dYTAHtF6v4FBFupE0JB7i4ViJZ50Cs/rjXM7uGs
         xV4uySaNBSygCG25jarSIB9r5+9NGrbNZCQk35A7AccpLImCso+sEmdCIiwnNkKaWN9b
         w7BjhV3R4r17Tcw855i2j/eN5ZwLo+BrfwzhmNLNCoXwXDL98pIxLIp4jFaNwfoCMyei
         COiWquXr2D8sBXi9c/6PbBzpDzipKMmTt9CD1w+80yptwm8xC3Hvo39kYByN9VqAWAjb
         mRXbOXPHuzXmwSV6FNfiBWqDzSyYByxKsmTdHvOX8MNjoLguyyfpAqVoOq/kz1N7xfWn
         Y55w==
X-Gm-Message-State: AOJu0Yzb2DXKzr7BZQlgUVzLwHMSxLzn0NjzLyS5kMnYYCFa7rfRBfjO
	MRXuO8OpbnwTseTAVJMoS5WRsjzCRPmV/qmrgczep2fKKXz4nuB7ElMid0oyxg==
X-Gm-Gg: ASbGncs1ZiaiSjroVdW/YJMYEMe2GwmrT4gG8Z17yGtQ5uNltX9fj8moaLQHGeuFk74
	vBgKyPVKErhe4I1lJqM1CTqqI69fxdPLsDKcR8pnWs9I/rcYvNIFljNWAqRqbPSRIqsokJqqHIC
	cdERxQgpEadV9fqRlOsdPNdmEP0gdqbji3p1mAkqolLdfOirRAavSNqK2aF48mLs+IquWZzY7BW
	MEO8LTOCVrMgJI0qLDGR9/e7l4GnHKSkzFUlSAmJEgTW1L+rSLtUCBojf1by5EYKLlJYQdd8FCp
	8LgUBeo0uJEzsqoZ+GWjWazj36dKQlG9FPk=
X-Google-Smtp-Source: AGHT+IFPlSyodWeM/ES/GQaMg0Mf88tYP73BTj2SaYvLHYPNMAcfMHR8tyzv17a4LfFf3aWy37o3gQ==
X-Received: by 2002:a5d:588b:0:b0:382:4a9d:28fa with SMTP id ffacd0b85a97d-38260b808edmr12712675f8f.30.1732614464805;
        Tue, 26 Nov 2024 01:47:44 -0800 (PST)
Message-ID: <c8aa7b64-b5b5-4ac3-b0c0-67d74441588e@suse.com>
Date: Tue, 26 Nov 2024 10:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
 <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z0Rx2IXqqvrLaIIq@macbook>
 <BL1PR12MB5849B85C116A74D138FF65AAE72F2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849B85C116A74D138FF65AAE72F2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 07:02, Chen, Jiqian wrote:
> On 2024/11/25 20:47, Roger Pau Monné wrote:
>> On Mon, Nov 25, 2024 at 03:44:52AM +0000, Chen, Jiqian wrote:
>>> On 2024/11/21 17:52, Roger Pau Monné wrote:
>>>> On Thu, Nov 21, 2024 at 03:05:14AM +0000, Chen, Jiqian wrote:
>>>>> On 2024/11/20 17:01, Roger Pau Monné wrote:
>>>>>> On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
>>>>>>> The only difference between our methods is the timing of updating the size.
>>>>>>> Yours is later than mine because you updated the size when the driver re-enabled memory decoding, while I updated the size in time when driver resize it.
>>>>>>
>>>>>> Indeed, my last guess is the stale cached size is somehow used in my
>>>>>> approach, and that leads to the failures.  One last (possibly dummy?)
>>>>>> thing to try might be to use your patch to detect writes to the resize
>>>>>> control register, but update the BAR sizes in modify_bars(), while
>>>>>> keeping the traces of when the operations happen.
>>>>>>
>>>>> This can work, combine our method, use my patch to detect and write the size into hardware register, and use your patch to update bar[i].size in modify_bars().
>>>>> Attached the combined patch and the xl dmesg.
>>>>
>>>> This is even weirder, so the attached patch works fine?  The only
>>>> difference with my proposal is that you trap the CTRL registers, but
>>>> the sizing is still done in modify_bars().
>>>>
>>>> What happens if (based on the attached patch) you change
>>>> rebar_ctrl_write() to:
>>>>
>>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>                                       unsigned int reg,
>>>>                                       uint32_t val,
>>>>                                       void *data)
>>>> {
>>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>>> }
>>>>
>>> If I change rebar_ctrl_write() to:
>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>                                       unsigned int reg,
>>>                                       uint32_t val,
>>>                                       void *data)
>>> {
>>>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, reg, val);
>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>> }
>>>
>>> I can see three time prints, it can't work.
>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 528, val 102
>>>
>>> If I change rebar_ctrl_write() to:
>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>                                       unsigned int reg,
>>>                                       uint32_t val,
>>>                                       void *data)
>>> {
>>>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>         return;
>>>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, reg, val);
>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>> } 
>>>
>>> I can only see one time print:
>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>>
>>> The check prevented the two times incorrect write actions.
>>>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>         return;
>>>
>>> And why my original patch can work too, the check:
>>> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
>>> +    if ( ctrl == val )
>>> +        return;
>>> happened to play the same role as PCI_COMMAND_MEMORY check.
>>
>> Thank you very much for figuring this out.  So in the end it's a bug
>> in the driver that plays with PCI_REBAR_CTRL with memory decoding
>> enabled.
> Yes, I think.
> During driver initiation, it calls pci_rebar_set_size to resize BARs,
> after that, it calls pci_restore_state->pci_restore_rebar_state to restore BARs,
> the problem is when calling pci_restore_rebar_state, memory deoding is enabled state.
> I will discuss with my colleagues internally whether this needs to be modified in amdgpu driver.

Why would memory decoding be enabled at that time? pci_restore_config_space()
specifically takes care of restoring CMD only after restoring BARs. And
pci_restore_config_space() is invoked by pci_restore_state() quite a bit
later than pci_restore_rebar_state(). So the driver must (wrongly?) be
enabling decoding earlier on?

Jan

