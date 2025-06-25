Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03159AE8923
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025303.1400935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUScV-0003F4-8F; Wed, 25 Jun 2025 16:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025303.1400935; Wed, 25 Jun 2025 16:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUScV-0003CH-5H; Wed, 25 Jun 2025 16:05:07 +0000
Received: by outflank-mailman (input) for mailman id 1025303;
 Wed, 25 Jun 2025 16:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUScU-0003CB-57
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 16:05:06 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269307fe-51de-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 18:05:02 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-553b6a349ccso29783e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 09:05:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83c7d45sm140986265ad.55.2025.06.25.09.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 09:05:00 -0700 (PDT)
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
X-Inumbo-ID: 269307fe-51de-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750867501; x=1751472301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b5Ce150+excxZCDbiei0DwFbtK25gxeKUYuQd7UHRW0=;
        b=bkFiH00+0G5ucAS/mNjyNivQ4pjaDw9KW3Sw0XpBLxGw12X5lR4Ozs+GUOMUUxTQ9+
         /EBEmneTgH/HvZp5Z7F/QWAj0+vkrp0NbNEWfVJXfb7PT3iQ0eqEafmOV8yKKmtCkAEM
         SXj6m978ejDzvp8WBTa5zvpL7aXlcM6wwOTUoBI7MTFIlZtlIrTO4rRJTWGwyPoXk0NB
         pjhAlRwVBy0ogxUWsKXLvm3GMAWEAs/fMoHD4u/a7Ix7fJAWrezEOpnPQTpzVYNnTVEz
         PEQ9LhpSRyeexGQS4D8ShxaJQMkvEJkJqkHDzEbwWygrYrOSBjuoPq4yI0YP6JILG0Yp
         o7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867501; x=1751472301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5Ce150+excxZCDbiei0DwFbtK25gxeKUYuQd7UHRW0=;
        b=aEpZluMNt/id1G/iryBjc7muBNF+lqE+B1Iw/by5rglJi75g/P6/tH6redTounzPGv
         faPY1zHwhX9oc/pHpLex3lK1k0GnCtczTdQz3tg/Rz3e77O6llx/EHkG8PlcL0R6w7p5
         ZHGXWegSxdYqxy48nIwGmv9KZ41lmr0pOz5tXDNv238/zhDEIfnxcQwK4BzLjZ4xDaRu
         wd2SQOJ56krwdh8mlocT875uCnH2ufYRTo4LSGkUxr/VTEQyr98ytR0UiB9ciUc7Czft
         SgQT/Id1mvvN181GioP4TkgFqWHT5fkvhGxu4X3psrIf2sEJoLhV1Y8VBxLYR7vW12D2
         tMVA==
X-Forwarded-Encrypted: i=1; AJvYcCUDcMkqQANbmMjn//XyghOZ/GXH0Mw4K0I++qr+GYhYC1nOLEup9XBn+773QfpjbXv4R1MZlZRG8/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfABbtQq09yufv4hz+3OExuc+Wt3qqWU+rAgkWRKre/4hozpM+
	nB9Uc/xiup53nVjoo4CgpdC+EunF+hGOF+cWfj1/y226N5IJKJukZcgv7yfONaCQpA==
X-Gm-Gg: ASbGncuQgTP4F3ch7GkdR2Focg6iu1k7K5uXrPCrq3k0dmHloVsjAi8OCIInyzT2Ybh
	9M/JXvY3G7G9hIyltF0V0uZ/SX+ooQu9ywE64i8iWMLM9WW3rSq/RM8S3iejDmvE0f8x3Lnt+r3
	00xG7Hym9KmbGIw5/DhbrT1zKUo0jQJcegocaq4u0wUuCZA6eLjjqC2iWDN21+t3lQIlb/2SEy6
	XPsqRdxk1NofPuoE19fkhpeGt/0SQE9lH7+r6uQyQ+QPw1tWIPZE/9lqDUc29hDBn3s8mfgBZ+8
	mpxdMhLLwngZ668g+YnWESk5zIa6m75cLLhL/5nrouE8X+CKcyYFiipNSe1+SZcL/WaMFxoP3dE
	q2Kn5Zw2sMwsVE83Bb/3qOSpELFaNb7kbAsQh1Oj9tAbhHXk=
X-Google-Smtp-Source: AGHT+IEYX80sL4mH2Xh+f1pg0Sot5/VQ52+EM9rAXDMcmBCmazlT0o4hxF97HH+FOe1Sj5MRGScqXg==
X-Received: by 2002:ac2:4e07:0:b0:550:e527:886f with SMTP id 2adb3069b0e04-554fdf650a8mr1313110e87.51.1750867500869;
        Wed, 25 Jun 2025 09:05:00 -0700 (PDT)
Message-ID: <bc971fe1-031c-465a-9d37-819739990c47@suse.com>
Date: Wed, 25 Jun 2025 18:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] pdx: allow per-arch optimization of PDX conversion
 helpers
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-6-roger.pau@citrix.com>
 <d179e5e5-605f-45a8-9b7d-01dd13359faf@suse.com>
 <aFwbEm-CYIVllliU@macbook.local>
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
In-Reply-To: <aFwbEm-CYIVllliU@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2025 17:51, Roger Pau Monné wrote:
> On Tue, Jun 24, 2025 at 03:51:09PM +0200, Jan Beulich wrote:
>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/pdx.h
>>> @@ -0,0 +1,75 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef X86_PDX_H
>>> +#define X86_PDX_H
>>> +
>>> +#ifndef CONFIG_PDX_NONE
>>> +
>>> +#include <asm/alternative.h>
>>> +
>>> +/*
>>> + * Introduce a macro to avoid repeating the same asm goto block in each helper.
>>> + * Note the macro is strictly tied to the code in the helpers.
>>> + */
>>> +#define PDX_ASM_GOTO_SKIP                           \
>>> +    asm_inline goto (                               \
>>> +        ALTERNATIVE(                                \
>>> +            "",                                     \
>>> +            "jmp %l[skip]",                         \
>>> +            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
>>> +        : : : : skip )
>>
>> Did you consider passing the label name as argument to the macro? That way ...
>>
>>> +static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>> +{
>>> +    PDX_ASM_GOTO_SKIP;
>>> +
>>> +    return pfn_to_pdx_xlate(pfn);
>>> +
>>> + skip:
>>> +    return pfn;
>>> +}
>>
>> ... the labels here and below then wouldn't look unused.
> 
> Yes - that's why I've added the "Note the macro is strictly tied to
> the code in the helpers" comment ahead of the macro, and named it as
> "GOTO_SKIP" to explicitly reference the label name.  I could pass the
> label name however if that's preferred, ie: PDX_ASM_GOTO(skip).  IMO
> It seems a bit redundant since all callers will pass the same label
> name.

Well, that comment isn't necessarily "in sight" when looking at the
functions using the macro. Personally I'd favor passing the label as
an argument; indeed I think we would better try to do away with other
such macros where inputs are implicit. Yes, there may be cases where
that's hard or getting unwieldy. But the one here isn't one of them.

Jan

