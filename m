Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E472590C4F4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742829.1149699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUH8-0002vg-TM; Tue, 18 Jun 2024 08:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742829.1149699; Tue, 18 Jun 2024 08:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUH8-0002tm-Qi; Tue, 18 Jun 2024 08:33:10 +0000
Received: by outflank-mailman (input) for mailman id 742829;
 Tue, 18 Jun 2024 08:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJUH7-0002tg-TF
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:33:09 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 633607b1-2d4d-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 10:33:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f253a06caso610514366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:33:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42801sm593429966b.166.2024.06.18.01.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 01:33:06 -0700 (PDT)
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
X-Inumbo-ID: 633607b1-2d4d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718699587; x=1719304387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X4WHF8hc7Sw6TrRc++lpt1ZOAsyYQQFuAPuA7Q3d9iQ=;
        b=LqcBKJLJdvXNyNn/lXpk169rddFp7fTJfYopfm0IDJ7dd/UTx3P+xUcA83RYDonlKH
         HW622pLXI2vlJMEQZvKBOW5YCUZ3nZoznJytt7EQLwndSbmmf0HdMUdGyFIRk4UPbMM2
         kqj5u6qzhdxbp0e8zT8AryAO7IyIouHTQd3qtcSC4jMJeLh4KTziGWHsLXXbs8s/WatI
         6YEMhUdQq3aZj2ADRbFV5A6wzW/2/9CzcFHHF2fTXkMDzcGMozYbiPxO2LRZj1MB7tP1
         ryYrKQU6ZJDAQLMqG7lB2vSppVg/vrhHrC0qOxiFerYJlyPdXKDQ5JAcBnSvBZB7rki4
         4hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699587; x=1719304387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4WHF8hc7Sw6TrRc++lpt1ZOAsyYQQFuAPuA7Q3d9iQ=;
        b=qNiIEVOb1Tr9J4VUSryGzv3dRum/qZkFn2hf62Bl5o4uyqtSbdyZRcA35P3VZO2iZ/
         oihoF4IJiai+95XHfLRirZCflHrZKcSGYLVh8/tO1aZlw93WXk6QfIJamK87+0w6pPKx
         ZQoukyNq3XQ4SxASL23X4JaoB6f2p0S/BC6hyaGZfcm1HvCYkDR8XH9I5YcwZVltUhvy
         q+x1cx9ofPUMHolyWEvCoK1biZ+1oXU3UT+AyJoDkKZIf54fnK8lP2y9vtbuald1RQPK
         YXkVENoQ2kgsl6Uley0V4OmqK6zpBV6b0yIdOQlst7PT4Lot4hY7dHExkxGVxiS0C/CP
         TWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmUixykTx0EtZHakH+DduGcpfGL45EYxUxVNvFfLWRyn0v1+ogTiKHG7TtkFAHlRfYB87ZJOQg56+AvkLyrXJPZQ/l2zKli258sEaR+Ac=
X-Gm-Message-State: AOJu0Yy6BxCTjf+iXTMsTf6KteVQTogZKGjjFMBB8g51nn+s6RzLfmIH
	9jtmJdij+CYaYnIePKxZwAejLaXSMoCiV5wzU05ZjASC3546DR5sNF/Zi46pmA==
X-Google-Smtp-Source: AGHT+IErUDur7idyakpyW77bZ1vXRhkTEyn/hKarEnoC3QgFO/z8MPejw9H7Uc+R1hStwXJxCGU9JA==
X-Received: by 2002:a17:906:1148:b0:a6f:1541:e8d5 with SMTP id a640c23a62f3a-a6f60d37820mr1008414266b.23.1718699586622;
        Tue, 18 Jun 2024 01:33:06 -0700 (PDT)
Message-ID: <f8381d8b-0ad2-4766-8a53-d1ee44ea7e05@suse.com>
Date: Tue, 18 Jun 2024 10:33:04 +0200
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
In-Reply-To: <BL1PR12MB58499527CFA36446EAD3FCE0E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 08:25, Chen, Jiqian wrote:
> On 2024/6/17 22:17, Jan Beulich wrote:
>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>> --- a/xen/drivers/pci/physdev.c
>>> +++ b/xen/drivers/pci/physdev.c
>>> @@ -2,11 +2,17 @@
>>>  #include <xen/guest_access.h>
>>>  #include <xen/hypercall.h>
>>>  #include <xen/init.h>
>>> +#include <xen/vpci.h>
>>>  
>>>  #ifndef COMPAT
>>>  typedef long ret_t;
>>>  #endif
>>>  
>>> +static const struct pci_device_state_reset_method
>>> +                    pci_device_state_reset_methods[] = {
>>> +    [ DEVICE_RESET_FLR ].reset_fn = vpci_reset_device_state,
>>> +};
>>
>> What about the other three DEVICE_RESET_*? In particular ...
> I don't know how to implement the other three types of reset.
> This is a design form so that corresponding processing functions can be added later if necessary. Do I need to set them to NULL pointers in this array?

No.

> Does this form conform to your previous suggestion of using only one hypercall to handle all types of resets?

Yes, at least in principle. Question here is: To be on the safe side,
wouldn't we better reset state for all forms of reset, leaving possible
relaxation of that for later? At which point the function wouldn't need
calling indirectly, and instead would be passed the reset type as an
argument.

>> Also, nit (further up): Opening figure braces for a new scope go onto their
> OK, will change in next version.
>> own line. Then again I notice that apparenly _all_ other instances in this
>> file are doing it the wrong way, too.
> Do I need to change them in this patch?

No.

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -172,6 +172,15 @@ int vpci_assign_device(struct pci_dev *pdev)
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int vpci_reset_device_state(struct pci_dev *pdev)
>>
>> As a target of an indirect call this needs to be annotated cf_check (both
>> here and in the declaration, unlike __must_check, which is sufficient to
>> have on just the declaration).
> OK, will add cf_check in next version.

Which may not be necessary if you go the route suggested above.

>>> --- a/xen/include/xen/pci.h
>>> +++ b/xen/include/xen/pci.h
>>> @@ -156,6 +156,22 @@ struct pci_dev {
>>>      struct vpci *vpci;
>>>  };
>>>  
>>> +struct pci_device_state_reset_method {
>>> +    int (*reset_fn)(struct pci_dev *pdev);
>>> +};
>>> +
>>> +enum pci_device_state_reset_type {
>>> +    DEVICE_RESET_FLR,
>>> +    DEVICE_RESET_COLD,
>>> +    DEVICE_RESET_WARM,
>>> +    DEVICE_RESET_HOT,
>>> +};
>>> +
>>> +struct pci_device_state_reset {
>>> +    struct physdev_pci_device dev;
>>> +    enum pci_device_state_reset_type reset_type;
>>> +};
>>
>> This is the struct to use as hypercall argument. How can it live outside of
>> any public header? Also, when moving it there, beware that you should not
>> use enum-s there. Only handles and fixed-width types are permitted.t
> Yes, I put them there before, but enum is not permitted.
> Then, do you have other suggested type to use to distinguish different types of resets, because enum can't work in the public header?

Do like we do everywhere else: Use a set of #define-s.

>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -38,6 +38,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
>>>  
>>>  /* Remove all handlers and free vpci related structures. */
>>>  void vpci_deassign_device(struct pci_dev *pdev);
>>> +int __must_check vpci_reset_device_state(struct pci_dev *pdev);
>>
>> What's the purpose of this __must_check, when the sole caller is calling
>> this through a function pointer, which isn't similarly annotated?
> This is what I added before introducing function pointers, but after modifying the implementation, it was not taken into account.
> I will remove __must_check

Why remove? Is it relevant for the return value to be checked? Or if it
isn't, why would there be a return value?

Jan

> and change to cf_check, according to your above comment.


