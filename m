Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D939238E7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752079.1160205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ3w-0000LC-Oa; Tue, 02 Jul 2024 08:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752079.1160205; Tue, 02 Jul 2024 08:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ3w-0000J9-Lx; Tue, 02 Jul 2024 08:40:32 +0000
Received: by outflank-mailman (input) for mailman id 752079;
 Tue, 02 Jul 2024 08:40:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOZ3v-0000J3-4R
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:40:31 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd06edc7-384e-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 10:40:30 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e7d2278d8so5270058e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 01:40:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6c7f6dacsm5222964a12.70.2024.07.02.01.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 01:40:29 -0700 (PDT)
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
X-Inumbo-ID: bd06edc7-384e-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719909630; x=1720514430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJwzROFMrAAl5kAagTuqDXB/4UF5fFuFQBHzYepZFtI=;
        b=cjIQVr2e/0OYbKR4UkQBWe6l5DAOZSd2YOIdFKYudF4cdNwN0ZviCuIajLij++NS88
         fvIcmKYoe50Ep9JB7x4yJM3aC7ViaZqIMf+Vn2USsbaZ2p8gQ51sr07hzC/jkO8KLyxW
         ONWP4O64FWNZPNj6Do6nY7U9G2dTt7/YwxtY3wyvPrvokwJJ4EByzKuCwbzDzfW5c8rN
         6H5UTeZeYY7Y3dgCuyUn7yBlyL3y5iDwINL2RqMMJM5GFUa5LdVe4wMiRN1M/Ib0Ehen
         HiMiUudkXw+8RVyXOTdRmsDmPtDSsL58jfjqbWVdbXl6bWrHWBgYM5rDgzxI5wCFpFWL
         Gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909630; x=1720514430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJwzROFMrAAl5kAagTuqDXB/4UF5fFuFQBHzYepZFtI=;
        b=JCIVEQooG6tvNb4vjhqLaOXrUC/SrkAPRky33iS+b3oYCLNYM3znCv1l5+tUNGffxh
         gJ8jhXelzm9QJ6Y1EylGYtJTdEeufLZL48JIFHUxJlTVAhIPiKM/GhLR1UwyNc536Lr1
         n0BIiQkDQR+r8p8IY01rCw07R+KoaZeR+B/zAU+piBVHBUeJlu6evc2ufu3jBOf3i/cQ
         nxfY2cNwKQZn4JMcpn3BvN5FIEPrRebgpeZ77ZHBsKUv1dAGoeTp5ZX4TjLvjJxdU6Yt
         73y41442RUWia6BKNdQLZZy4ZtWbCZDKZERlJpy4a5QsXlkINeoOzuDtJH7H/7esBDq7
         HSJw==
X-Forwarded-Encrypted: i=1; AJvYcCUHDFDYqGIsds1HJmGmdDBroR3UPaSueYXBxczmCz5mY7zhiM6qaEe9BTsACZiw7UpxtzQfj9TMzfNJM83ehvR8E3XQ+JctilZUWZr4UwQ=
X-Gm-Message-State: AOJu0Yys1+6uYDwynxmA6a68Asb7Q1r9AYurWAIwWiTdDanFKUKVEWq/
	+Xsv83x2QcUrmn/NHtYkWwih3sbH3yXS3JfNB5N9NBnSSaNyJcm4yHq++9j9bg==
X-Google-Smtp-Source: AGHT+IFzfAyUM080VLLkDLIEeA+pb8fLGgNuo+zPbS+OOXc+NDB+bMJdwsK+1bvgz54YciyZT5AmiQ==
X-Received: by 2002:a2e:240a:0:b0:2ec:a022:880c with SMTP id 38308e7fff4ca-2ee5e3b36e3mr58780961fa.22.1719909629619;
        Tue, 02 Jul 2024 01:40:29 -0700 (PDT)
Message-ID: <de0f185a-52a8-435e-8afd-630c1bfc55d8@suse.com>
Date: Tue, 2 Jul 2024 10:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 1/8] xen/vpci: Clear all vpci status of device
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-2-Jiqian.Chen@amd.com>
 <d145f307-2c66-4a2b-8a1f-d969ed4f2e6d@suse.com>
 <BL1PR12MB58494BFDE98D3CDAEB157AC7E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58494BFDE98D3CDAEB157AC7E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 04:59, Chen, Jiqian wrote:
> On 2024/7/1 15:18, Jan Beulich wrote:
>> On 30.06.2024 14:33, Jiqian Chen wrote:
>>> When a device has been reset on dom0 side, the vpci on Xen
>>> side won't get notification, so the cached state in vpci is
>>> all out of date compare with the real device state.
>>> To solve that problem, add a new hypercall to clear all vpci
>>> device state. When the state of device is reset on dom0 side,
>>> dom0 can call this hypercall to notify vpci.
>>
>> While the description properly talks about all of this being about device
>> reset, the title suggests otherwise (leaving open what the context is, thus
>> - to me at least - suggesting it's during vPCI init for a particular
>> device).
> Change title to "xen/pci: Add hypercall to support reset of pcidev" ?

Perhaps.

>>> @@ -67,6 +68,63 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          break;
>>>      }
>>>  
>>> +    case PHYSDEVOP_pci_device_state_reset:
>>> +    {
>>> +        struct pci_device_state_reset dev_reset;
>>> +        struct pci_dev *pdev;
>>> +        pci_sbdf_t sbdf;
>>> +
>>> +        ret = -EOPNOTSUPP;
>>> +        if ( !is_pci_passthrough_enabled() )
>>> +            break;
>>> +
>>> +        ret = -EFAULT;
>>> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
>>> +            break;
>>> +
>>> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
>>> +                        dev_reset.dev.bus,
>>> +                        dev_reset.dev.devfn);
>>> +
>>> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        pcidevs_lock();
>>> +        pdev = pci_get_pdev(NULL, sbdf);
>>> +        if ( !pdev )
>>> +        {
>>> +            pcidevs_unlock();
>>> +            ret = -ENODEV;
>>> +            break;
>>> +        }
>>> +
>>> +        write_lock(&pdev->domain->pci_lock);
>>> +        pcidevs_unlock();
>>> +        /* Implement FLR, other reset types may be implemented in future */
>>
>> The comment isn't in sync with the code anymore.
> Change to "/* vpci_reset_device_state is called by default for all reset types, other specific operations can be added later as needed */" ?

Counter question: Is such a comment really adding any value?

Jan

