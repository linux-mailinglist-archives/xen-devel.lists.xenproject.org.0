Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C190E3F3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743438.1150338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpLY-0007PO-0h; Wed, 19 Jun 2024 07:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743438.1150338; Wed, 19 Jun 2024 07:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpLX-0007Mv-TB; Wed, 19 Jun 2024 07:03:07 +0000
Received: by outflank-mailman (input) for mailman id 743438;
 Wed, 19 Jun 2024 07:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJpLW-0007Mp-Gd
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:03:06 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f800e227-2e09-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 09:03:02 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e72224c395so63492031fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:03:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855ee6eebsm109306725ad.158.2024.06.19.00.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 00:03:01 -0700 (PDT)
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
X-Inumbo-ID: f800e227-2e09-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718780582; x=1719385382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+n3bJ+/wwvNBDF0b+OS1XGT2Hbd4sRyhnquBwVP9Mcs=;
        b=Xa/d0niKPDnSu9FMEgmlgJTNsOsFjP3fX9rR/Js1iNDvABUxn4GM04xgYloVBiB0jZ
         /ECWUSLDBc/eEcfUuDewPu3ypxLGgOR7G4Hf/ZM59wbeyrHH3FiVrFTtQGhbvXbkzIHR
         Gwv5OGRfTSXxkRzhArs/oRx6hJmwGVj5Sn3n1pZmvJtOWhwyCA+cFelxFREiuiMQGOe0
         Qt9mKJWKfwzFrP67eBMdQFi2YNJ/Ll3X7hD7S7bkvfKzfVDbSp8Xj5Ylr05zAEVM2iKU
         0JdfODq1P3fH1+92UaMJXq2YY4QEqPsOkTQbrYkVpXfyxLrTbsw+pU1Z5kYFOjLa48ZD
         kDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780582; x=1719385382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n3bJ+/wwvNBDF0b+OS1XGT2Hbd4sRyhnquBwVP9Mcs=;
        b=b11sojR/NNBhoInt41sxNICBBObHPyyjkcDxEFZNoVEe3jdOgy1BZmSqKWS+NkGIn1
         Gw5MKgY8JfRa0FQubD0uvRdhGUNjyWscw22rQm7Zw/v+hPrVYXvTzs9xsAPOXZRAEq9o
         ArUqi6s4aKzo5PrdAVEFubbhi9BuaEehP84Y19/Jxas6+gUJjZop3uyl89rxPJBPLXTd
         yndW0gMTtGEdzB/xLzQ/gM+cFqXsf5TdQGeqjVXGWQa+3va3dIY2riObUdLL1ZK+jmJw
         cf/WR/JVugUppoRYVzhWCf4trrCTuFu6qCMZ3xdc/9n14qFDA9wvdzXHPBjGLRR6iTrl
         hwtg==
X-Forwarded-Encrypted: i=1; AJvYcCUJRMVKBDpEHlUSjyZPMF9PjbnXewDHUJNf1MHPYSTmRBKpQJJSEL4os6DsJBiX9f2L6eG4RycNZvwLIaNlh4d9gH3FS1iDTBHYBhhCHdY=
X-Gm-Message-State: AOJu0YwDYjLQl1ItTIgosSbQd/cZY5vvN6+ht1ROQGLHljjVdHb95L+N
	AflUmbqsxy401CJcb8dJxkitKkDrQgeVNMtIsg4KpqctdmqhuNMQXvjyNQZUHw==
X-Google-Smtp-Source: AGHT+IGIBSaVJmgQ0u65W+M1lhucdxYDZotMAN7lah+V1KTJqiWDBfttcSHvkiS1hlx90ouPaZmIrw==
X-Received: by 2002:a2e:8701:0:b0:2ec:f68:51de with SMTP id 38308e7fff4ca-2ec3cffc8c5mr11140401fa.47.1718780582105;
        Wed, 19 Jun 2024 00:03:02 -0700 (PDT)
Message-ID: <896c7cde-4117-47a9-9b23-66876365713c@suse.com>
Date: Wed, 19 Jun 2024 09:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-2-Jiqian.Chen@amd.com>
 <4e2accc2-e81d-450a-af2d-38884455de9c@suse.com>
 <BL1PR12MB58499527CFA36446EAD3FCE0E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f8381d8b-0ad2-4766-8a53-d1ee44ea7e05@suse.com>
 <BL1PR12MB5849E84E58725FB947CCECD8E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849E84E58725FB947CCECD8E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 05:39, Chen, Jiqian wrote:
> On 2024/6/18 16:33, Jan Beulich wrote:
>> On 18.06.2024 08:25, Chen, Jiqian wrote:
>>> On 2024/6/17 22:17, Jan Beulich wrote:
>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>> --- a/xen/drivers/pci/physdev.c
>>>>> +++ b/xen/drivers/pci/physdev.c
>>>>> @@ -2,11 +2,17 @@
>>>>>  #include <xen/guest_access.h>
>>>>>  #include <xen/hypercall.h>
>>>>>  #include <xen/init.h>
>>>>> +#include <xen/vpci.h>
>>>>>  
>>>>>  #ifndef COMPAT
>>>>>  typedef long ret_t;
>>>>>  #endif
>>>>>  
>>>>> +static const struct pci_device_state_reset_method
>>>>> +                    pci_device_state_reset_methods[] = {
>>>>> +    [ DEVICE_RESET_FLR ].reset_fn = vpci_reset_device_state,
>>>>> +};
>>>>
>>>> What about the other three DEVICE_RESET_*? In particular ...
>>> I don't know how to implement the other three types of reset.
>>> This is a design form so that corresponding processing functions can be added later if necessary. Do I need to set them to NULL pointers in this array?
>>
>> No.
>>
>>> Does this form conform to your previous suggestion of using only one hypercall to handle all types of resets?
>>
>> Yes, at least in principle. Question here is: To be on the safe side,
>> wouldn't we better reset state for all forms of reset, leaving possible
>> relaxation of that for later? At which point the function wouldn't need
>> calling indirectly, and instead would be passed the reset type as an
>> argument.
> If I understood correctly, next version should be?
> Use macros to represent different reset types.
> Add switch cases in PHYSDEVOP_pci_device_state_reset to handle different reset functions.
> Add reset_type as a function parameter to vpci_reset_device_state for possible future use.
> 
> +    case PHYSDEVOP_pci_device_state_reset:
> +    {
> +        struct pci_device_state_reset dev_reset;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
> +            break;
> +
> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
> +                        dev_reset.dev.bus,
> +                        dev_reset.dev.evfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;
> +
> +        pcidevs_lock();
> +        pdev = pci_get_pdev(NULL, sbdf);
> +        if ( !pdev )
> +        {
> +            pcidevs_unlock();
> +            ret = -ENODEV;
> +            break;
> +        }
> +
> +        write_lock(&pdev->domain->pci_lock);
> +        pcidevs_unlock();
> +        /* Implement FLR, other reset types may be implemented in future */
> +        switch ( dev_reset.reset_type )
> +        {
> +        case PCI_DEVICE_STATE_RESET_COLD:
> +        case PCI_DEVICE_STATE_RESET_WARM:
> +        case PCI_DEVICE_STATE_RESET_HOT:
> +        case PCI_DEVICE_STATE_RESET_FLR:
> +            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
> +            break;
> +        }

If you use a switch() here, then there wants to be a default case returning
e.g. -EOPNOTSUPP or -EINVAL. Else the switch wants dropping. I'm not sure
which one's better in this specific case, I'm only slightly tending towards
the former.

In any event the comment (if any) wants to reflect what the actual code does.

Jan

