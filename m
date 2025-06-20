Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C2AE1411
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020637.1396774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVOI-0005BH-4E; Fri, 20 Jun 2025 06:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020637.1396774; Fri, 20 Jun 2025 06:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVOI-00059t-0v; Fri, 20 Jun 2025 06:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1020637;
 Fri, 20 Jun 2025 06:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSVOH-00059n-5o
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:38:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b41bc3-4da1-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:38:18 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso878144f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:38:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86d563fsm10184215ad.207.2025.06.19.23.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:38:17 -0700 (PDT)
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
X-Inumbo-ID: 26b41bc3-4da1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750401498; x=1751006298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBOh/2+Jjzkd4ISRnkwtmCajaQZSIGEi1SerSNTWDS8=;
        b=AKGHAzf5tMoDYVABMg5w9AGd5GKRmh+gBR2QHmTZJzjYIbg9x+9cNECULCObhkDW5o
         Vi95y5fTBU3tO9qFAXA1lpWpw3GDejOaV4bdF7eGWHkq4w2Hai5IypeQUQHr+kVCj/OQ
         4eDIfSWJYCSnq9JGmAIESzTBWbUoZCo8N+jZRLgGx2Dne0nzt3v5s7F8ZDu+N2N0/Ax+
         Y/AHGZ72kGyxmHwH9hmLCYu48q/u1rt72wjU6HcaOSM8DEJVxxLlYMpYFrBy4gYwCrAe
         sub1Pvu/tlaQwZ9MeLcVZA7Ha635CZdt9KxdWluFpj9IYWAO9ItV1CnaQdEJjPRQx/KH
         gc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750401498; x=1751006298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBOh/2+Jjzkd4ISRnkwtmCajaQZSIGEi1SerSNTWDS8=;
        b=BwTCDsXBidgsw2L6WOWUKPEJYiLk1wx9Eqb3s2tLorX39S360wjKQ1Y01WdExuVteI
         bFRdPGh69lKpe8f7wku8eknFO3d5tAvbHp3DOT/HZ9ZErDvwLFz9kq0CedtvcZHKkoeD
         EVdxKUEYBY1uPdo/yp7Lu7XBXUlKCwPOR6OIxQkBW4LpsXl7F5rQhAvGAWgPw8CSL9M8
         TFubAWRiuMW/jggYx9nG+P4FDbGRsbk3a3VC5whWRQsrWxR+wWvZJ/NdusDo0AZic5B2
         Ka4Bqee34wJ8+ZVn/BMf6YWgjU9Jm1v85vIoYcQKpbebUpKuORlF+349002K5TRyazX/
         t7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX2rpx9IEqxV+B9nc8hNyH56vzjLzT6FH7OpsiHnFBMG8WoO5eJ1YAbFWEjaEG/Vh0jEoMtpVTM76E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7d7XA3dduUSLP0rm4bvhKMWyQsK8oB5kdh82dRbnpXxEUqGSS
	G7vtT5PwQonkbvjZtoQiPIeYnVNhWlcpeV4PYO/L5MUxiJBqY4AvaBQYdwsptZDxBQ==
X-Gm-Gg: ASbGncuLtQ1b0IWS/q/mwxEtwUuIeXC63joj0uLhx/t8NVSn5gX42p0tdB7Blk5bACM
	N4JV2D5cjeY8SN7KmP1O2I6hXB3AXCoIntJaWiLTwlxaXlmMEa3TpTSwk5wykYpdA6Htpz7rfld
	WhTTfqdkawV8bYPvZmC+amCTGsZfziGtVovdFcaulrZTXRIxCETBFV/qkscTeAIrbInkxdgqRwV
	6La0igAqfethuv7sabjElX6g1ZASWfeuGCPL3YtODIRU6XFsLD/dYo+bzt/argK3XDDhNpuXnAh
	FiX+h1o8lAi8XZNCORaqYv9anI91TrBM5tYlPEavR3xnivIDlZnF9FPMiD4I36Vg5cLLxsTVqRl
	QtWnCipWAVJ+/aSjrICmUkuKN2E8nNZpTOipfF7lA92/f4E4=
X-Google-Smtp-Source: AGHT+IHXGpYUKw3rchKSykoSrSr4v2aJlmWKceyYja3tkRmE2AI9qQ9Sa2kE5a1kClvuiAfLHO8w+Q==
X-Received: by 2002:a05:6000:4107:b0:3a6:c95c:36c5 with SMTP id ffacd0b85a97d-3a6d1329bfamr976084f8f.40.1750401497801;
        Thu, 19 Jun 2025 23:38:17 -0700 (PDT)
Message-ID: <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
Date: Fri, 20 Jun 2025 08:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 08:39, Chen, Jiqian wrote:
> On 2025/6/18 22:05, Jan Beulich wrote:
>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>      pdev->vpci->msix = msix;
>>>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>>>  
>>> -    return 0;
>>> +    spin_lock(&pdev->vpci->lock);
>>> +    rc = vpci_make_msix_hole(pdev);
>>> +    spin_unlock(&pdev->vpci->lock);
>>
>> If you add a call to vpci_make_msix_hole() here, doesn't it need (or at
>> least want) removing somewhere else? Otherwise maybe a code comment is
>> warranted next to the new call site?
> The removing operation in modify_bars() and vpci_deassign_device() is not enough?

I fear I don't understand this reply of yours. Which suggests that the patch
description may want extending as to this part of the change.

>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>   */
>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>  
>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>> -  static vpci_register_init_t *const x##_entry  \
>>> -               __used_section(".data.vpci." p) = (x)
>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>> +    static const vpci_capability_t finit##_t = { \
>>> +        .id = (cap), \
>>> +        .init = (finit), \
>>> +        .cleanup = (fclean), \
>>> +        .is_ext = (ext), \
>>> +    }; \
>>> +    static const vpci_capability_t *const finit##_entry  \
>>> +        __used_section(".data.rel.ro.vpci") = &finit##_t
>>
>> Could you remind me why the extra level of indirection is necessary here?
>> That is, why can't .data.rel.ro.vpci be an array of vpci_capability_t?
> You mean I should change to be:
> #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>     static const vpci_capability_t finit##_t \
>         __used_section(".data.rel.ro.vpci") = { \
>         .id = (cap), \
>         .init = (finit), \
>         .cleanup = (fclean), \
>         .is_ext = (ext), \
>     }
> 
> Right?

Yes, subject to the earlier comments on the identifier choice.

Jan

