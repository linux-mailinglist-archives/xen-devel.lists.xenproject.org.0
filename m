Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258D816C5B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655884.1023761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBuv-0006u2-IM; Mon, 18 Dec 2023 11:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655884.1023761; Mon, 18 Dec 2023 11:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBuv-0006r9-FS; Mon, 18 Dec 2023 11:36:13 +0000
Received: by outflank-mailman (input) for mailman id 655884;
 Mon, 18 Dec 2023 11:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFBuu-0006et-8A
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:36:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f9ce38-9d99-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:36:10 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so21746225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:36:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b0040c45071c18sm33569238wmo.39.2023.12.18.03.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 03:36:09 -0800 (PST)
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
X-Inumbo-ID: a3f9ce38-9d99-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702899370; x=1703504170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m+bG8W4M+3kfYULre/DPAW8Mn6gXC7VyhQN4Iv0aD4=;
        b=BR0pXh2jYxHS5RW3bhikpo+lPOloj7FKap5vced25ttDzZK1BHFBL701wftIqaJ2F/
         jkrKdE0RDsYZDTFh+7ZEgkJTErCgzTmnKmoSqHeOpFIDAjA+eAIYcBqLs79KnxV4yBMf
         26uIrAGGuTGsEcpKeozrdqxEdNBs+MZGyg2Bixo4pRhAyP7FqZ8BqL04CsHDBswzPvSS
         CNB3OKLt/uHKolFy6SR0+nFoSsfEimn3p/DSgQblR6PUpPQ6Tgwz8t2FGdTOzMd867rC
         riwXv01PsI7tSBydBo4rX0VA60QE0UTm2CT1V4i+letNz0rXzyM5Ou2aBCMGxipkulHR
         Wl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899370; x=1703504170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0m+bG8W4M+3kfYULre/DPAW8Mn6gXC7VyhQN4Iv0aD4=;
        b=Kbbs42lgzy8vX72wO3W8cZLsmaMBCjkQrSziStFwY/KTH9o904LjV9gpQ+OQxy8iEU
         2Lb7TP4omDEO0fQEKPUWJOH4lL+bPJX+8ZDMtjHEnU7E1zKRJYO762zp8SCoAGgHJgo/
         vkpzCoQ41rs7vRTslmJ+kqU/NWUhe5u3tZTQsaFsN+2ba71bl2sWodcAgrc/mdPQQzNF
         o0U3CU3lbcX27YRdzSRaKuTEa98/k2DK0/ZM750sm5rF2JaT43KiATe0Pjw7iPUDSYpb
         EzNcZ92Ez2T/OMtEEdAT5ka9YKkNlltsZyQttn59f2dFt9n0PhUJB/Vo8gjFMrEBtTpV
         J+DA==
X-Gm-Message-State: AOJu0Yzp6zoTnAcSGZGbJ3l9hWVTtwIL4BrRg/nhVK2bzUEG8LT+pRe0
	L1IMP5jj3w8qRTuTPjgtZK8E
X-Google-Smtp-Source: AGHT+IFCguSCv0MHJd9r6ZtMU5lC5EQ5yBCaAvEWQe+xHZBRSzjVpihL5bqyqczX5YBJ9iq+toeojQ==
X-Received: by 2002:a05:600c:4f84:b0:40c:288b:a688 with SMTP id n4-20020a05600c4f8400b0040c288ba688mr7393618wmq.108.1702899369763;
        Mon, 18 Dec 2023 03:36:09 -0800 (PST)
Message-ID: <2fa8fa4f-86d9-4856-91f3-f3dcf1c1013c@suse.com>
Date: Mon, 18 Dec 2023 12:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <34a4bc023eb50e1d1cf70fa149825c51f2f4555f.1700761381.git.oleksii.kurochko@gmail.com>
 <ccef1adc-af39-43b2-8f97-ed3895e8809d@suse.com>
 <c0ae5654e6be1eb10282a3d95fb419d5c975e98b.camel@gmail.com>
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
In-Reply-To: <c0ae5654e6be1eb10282a3d95fb419d5c975e98b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 11:45, Oleksii wrote:
> On Thu, 2023-12-14 at 16:57 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I wonder though ...
>>
>>> --- a/xen/arch/riscv/include/asm/page.h
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -6,6 +6,7 @@
>>>  #ifndef __ASSEMBLY__
>>>  
>>>  #include <xen/const.h>
>>> +#include <xen/bug.h>
>>>  #include <xen/types.h>
>>>  
>>>  #include <asm/mm.h>
>>> @@ -32,6 +33,9 @@
>>>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE |
>>> PTE_WRITABLE)
>>>  #define PTE_TABLE                   (PTE_VALID)
>>>  
>>> +/* TODO */
>>> +#define PAGE_HYPERVISOR 0
>>
>> ... whether this couldn't be defined properly right away.
> It can be introduced now but it requires some additional defines to be
> introduced in the same time:
> 
> #define _PAGE_W_BIT     2
> #define _PAGE_XN_BIT    3
> #define _PAGE_RO_BIT    1
> #define _PAGE_XN        (1U << _PAGE_XN_BIT)
> #define _PAGE_RO        (1U << _PAGE_RO_BIT)
> #define _PAGE_W         (1U << _PAGE_W_BIT)

Why would you need these, when you already have
PTE_{READABLE,WRITABLE,EXECUTABLE} just out of context from above? (And
that's aside from me (a) not following the naming (vs their purpose) and
(b) not seeing what _PAGE_*_BIT are needed for, not even thinking about
the leading underscores in these identifiers again.)

> ...
> /*
>  * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
>  * meant to be used outside of this header.
>  */
> // #define _PAGE_DEVICE    _PAGE_XN
> #define _PAGE_NORMAL    _PAGE_PRESENT
> 
> #define PAGE_HYPERVISOR_RW      (_PAGE_NORMAL | _PAGE_RO | _PAGE_XN |
> _PAGE_W)
> 
> #define PAGE_HYPERVISOR         PAGE_HYPERVISOR_RW
> 
> And _PAGE_PRESENT in pgtbl-bits.h:
> 
> #define _PAGE_PRESENT   (1 << 0)
> 
> I prefer to introduce all this things when it will be really used.

I understand that, yet for easy things it may help doing them right
away, rather than leaving them to be touched (in a straightforward way)
again very soon.

Jan

