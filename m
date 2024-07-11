Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C535592E3BE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757246.1166035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqRk-0005mz-Rp; Thu, 11 Jul 2024 09:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757246.1166035; Thu, 11 Jul 2024 09:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqRk-0005ky-PH; Thu, 11 Jul 2024 09:50:40 +0000
Received: by outflank-mailman (input) for mailman id 757246;
 Thu, 11 Jul 2024 09:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRqRk-0005ks-2q
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:50:40 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 073c592c-3f6b-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 11:50:38 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so6947151fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:50:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad5af6sm46619185ad.288.2024.07.11.02.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 02:50:37 -0700 (PDT)
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
X-Inumbo-ID: 073c592c-3f6b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720691438; x=1721296238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d2v0rIS9sJtQfattGPiy04YQGflp7Gjr6UGI3CrWeKI=;
        b=AxoEzxEREUntj0rMSFdDUEkwXhFyD4uQVCFVmb7ZFUOFWpypNgwSYSn6uJkWCkUOpF
         nzKQRoA3uIpSLqJqMX/u36Jlk2pJS9djPQSIXOc/i9Tn8C8lGRZYS7O0qMYIAbk60PEB
         ZbEtlAljyr7bEYxf87dyxikbK/4nO+Hoh5lAiuD3/rjdhVfphAUrgvEy5J1q+s+Ida9f
         aDFm9tIS1KdVWP2c9RTcmhOS3RwFENhyNM49tZCKJ3i7EgnsE3spG+c3icN7nyQrDPSE
         v1t4J6Jup9lqr7aoMLgW8PHCZ71HDiqnalo/d5AL4nS7CcuK7B9Ev6zQxbWv0KZTmuCL
         4L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720691438; x=1721296238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2v0rIS9sJtQfattGPiy04YQGflp7Gjr6UGI3CrWeKI=;
        b=MWBqB16P2gaNZfHbQ+5uaCUgYZcj1DDgyspFpA7dSxGvx2c5LQWkTAs3cZQu9SwK5c
         2g9FKGSaFg4yO2FIfrwcJemZ+EQSI4tyPuut33D4CaPflIhcNlYOU/L2cvLBvZWOzsb1
         0p98Ad4rOAgO9XdITAjJ7J91e62HVetO8y/1PJ24TFXOIMBcYyYcDzL2JN5Xjlgb5GDd
         seoPDFOT1zgB+xMCY6TYqyrUt368PAsh/xSOoOrSuRFmwx01bcaLuLecdRTBrjLHiLgn
         2WJqPlLg3piCXzTeB5vKQd6wg+0ogxq6Sl841jDAaZpBhtPMxnqSa30MOulKVetRg477
         s9eg==
X-Forwarded-Encrypted: i=1; AJvYcCUOvVNHpUHm+O4751ozs0m1l/pS+O8H5JlbqTX26Vu5yVPPpdMZc2AmNQ+BG/f6FuztNWP+ph8eYSpssmWqMCDdqdMmhxkDV6PNECkNdtI=
X-Gm-Message-State: AOJu0YxdkGVSp5m8xjSZG5sC53AyimAHk2z13Jy3Vj8oSoR6URvmI95W
	/EBY1dJZh0QGPHJkHwcjrOtZXP/OnLZTGHysGBPELCcS1Q+eCSyCrn9BOXDnRw==
X-Google-Smtp-Source: AGHT+IHsbDYBdxaX2UJsZAIFlUBb6fT6z78nta/kDFA8wjLCiYfGcyGNJP5ZcAP66+cuUEfClfOKCA==
X-Received: by 2002:a2e:a78b:0:b0:2ee:6b86:b0aa with SMTP id 38308e7fff4ca-2eeb30e3693mr64592991fa.17.1720691438420;
        Thu, 11 Jul 2024 02:50:38 -0700 (PDT)
Message-ID: <6802e970-f013-419c-a83e-3adc16541afd@suse.com>
Date: Thu, 11 Jul 2024 11:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] xen/riscv: introduce device tree maping function
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <efd3e6a8c526d227f8db06779c65ffda42a695d6.1720002425.git.oleksii.kurochko@gmail.com>
 <91e1ff5e-a27a-4c59-b5b0-88414d504694@suse.com>
 <31b8683537e5dd9df1d64178f752bae56daad633.camel@gmail.com>
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
In-Reply-To: <31b8683537e5dd9df1d64178f752bae56daad633.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 11:31, Oleksii wrote:
> On Wed, 2024-07-10 at 12:38 +0200, Jan Beulich wrote:
>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -74,6 +74,9 @@
>>>  #error "unsupported RV_STAGE1_MODE"
>>>  #endif
>>>  
>>> +#define XEN_SIZE                MB(2)
>>> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
>>
>> Probably wants accompanying by an assertion in the linker script. Or
>> else
>> how would one notice when Xen grows bigger than this?
> I use XEN_SIZE in the linker script here:
>  ASSERT(_end - _start <= MB(2), "Xen too large for early-boot
> assumptions")

And that's the problem: You want to switch to using XEN_SIZE there. There
should never be two separate constant that need updating at the same time.
Keep such to a single place.

>>> @@ -99,6 +102,9 @@
>>>  #define VMAP_VIRT_START         SLOTN(VMAP_SLOT_START)
>>>  #define VMAP_VIRT_SIZE          GB(1)
>>>  
>>> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
>>> +#define BOOT_FDT_VIRT_SIZE      MB(4)
>>
>> Is the 4 selected arbitrarily, or derived from something?
> Yes, it was chosen arbitrarily. I just checked that I don't have any
> DTBs larger than 2 MB, but decided to add a little extra space and
> doubled it to an additional 2 MB.

Code comment then, please, or at the very least mention of this in the
description.

>>> @@ -39,9 +42,11 @@ static unsigned long __ro_after_init
>>> phys_offset;
>>>   * isn't 2 MB aligned.
>>>   *
>>>   * CONFIG_PAGING_LEVELS page tables are needed for the identity
>>> mapping,
>>> - * except that the root page table is shared with the initial
>>> mapping
>>> + * except that the root page table is shared with the initial
>>> mapping.
>>> + *
>>> + * CONFIG_PAGING_LEVELS page tables are needed for device tree
>>> mapping.
>>>   */
>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 3 + 1 +
>>> 1)
>>
>> Considering what would happen if two or three more of such
>> requirements
>> were added, maybe better
>>
>> #define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 3 - 1)
>>
>> ? However, why is it CONFIG_PAGING_LEVELS that's needed, and not
>> CONFIG_PAGING_LEVELS - 1? The top level table is the same as the
>> identity map's, isn't it?
> The top level table is the same, but I just wanted to be sure that if
> DTB size is bigger then 2Mb then we need 2xL0 page tables.

Makes sense, but then needs expressing that way (by using
BOOT_FDT_VIRT_SIZE). Otherwise (see also above) think of what will
happen if BOOT_FDT_VIRT_SIZE is updated without touching this
expression.

Jan

