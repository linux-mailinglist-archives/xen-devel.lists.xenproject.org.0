Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B19AB9B90
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 13:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987034.1372512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFtim-0007V3-MC; Fri, 16 May 2025 11:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987034.1372512; Fri, 16 May 2025 11:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFtim-0007Sp-JM; Fri, 16 May 2025 11:59:24 +0000
Received: by outflank-mailman (input) for mailman id 987034;
 Fri, 16 May 2025 11:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFtik-0007Sj-T6
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 11:59:22 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33b729b2-324d-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 13:59:21 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6011407431cso1065518a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 04:59:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b059sm152298366b.10.2025.05.16.04.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 04:59:20 -0700 (PDT)
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
X-Inumbo-ID: 33b729b2-324d-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747396760; x=1748001560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pIFyXStJjbN7FXjwQkDmXRREFRbxUm51JKeGx6OS8MY=;
        b=YQS4VtVpq09Z+UOQbYz45s8cFfy13uTbzJCGG5SLAsmB06T+maulA7Q0/6ZMzgsJjj
         Z8+QGoE4aZarpJ+nths6x7XGvmGVFheiTWRRRJXAGn/jheRP0x7QoepRJ8TCtXsOREnk
         34rXbdn4on77Q4zA+rq2G+F2ComUJrG8AoMPx1ewyvX9+z5h/kMNFynx/uxi5Whwhlvp
         X1tJHmtJJoh3AD0vR3dR1IAwVjwi9Dqy5rxXPCXtaQ0d7eawI481XzeZRQFUitfKbo8O
         yl32ikQXELj0cYyo3AiQZ//FcVyNVAM4ZEKFjV2waRa+Hx7QZe4knJtMcFrgjVkVbOBF
         o3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396760; x=1748001560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIFyXStJjbN7FXjwQkDmXRREFRbxUm51JKeGx6OS8MY=;
        b=IorPpyMokX9GhSrVVuBDVipmrBJMvzRf4Y04+vl8PW/wQbSI/8keCsmP7mE9YSxUph
         +bHdBkznzbYVDjZlwyNr8Jgy0i+T2u8whvrP9VxFfJB1/MFBD8LsSYyNNxYvrLnMVxHC
         nt9ljXARtDT0EoK91RdfZ66qPqUXoTqxbFDai/gJIJ2vxY8rR3XSDg8ee5XM0pjeVPRa
         1kmSniHi7bJHYbu20MuMXqok+B4Hg08VPMXWlfnEqGkXOIMRt71ZnmI2h4sXLSP05PF2
         6/P8hLHSrNYuBDNVFcHqpM0F4PYjlqMufVNBZTOMMsgc8z7CbAXbJ7sZXuail0MuPj38
         ihtA==
X-Forwarded-Encrypted: i=1; AJvYcCXG4HE+QBIjQsVZlcnEKrvBjW6vr2TbUd1yUgZbMqwa1pXKa7c3IRyw8Ty6QlubP50DhMjm/tNFZEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/BIQR8Wfhn7BhYOwYOYbvGBLewTtqvgkX1z/XTRkZAXM1+F8+
	60JcuJJ3+sMqM7wVCCbNvzSDp6DG+HqgU5VLDvCiOvSMwQhmrJJWJdmOX8mSbA2lxA==
X-Gm-Gg: ASbGncvQj6N7LIz3rw2Pd6NtIkC8Vvp15VOhUXB5OV4GY7X2Pdyrlpc0s2ARtv9Dnk2
	0WAn+S/fYKU9XNSyAFJIJ/z7GXsFiam1/kbEXqUIXib0ucqOX9XLw5TFSUl8nojJSFKcFRIfRor
	wYKaBjyxC/tgCORZOWaI/p8na21pfsL7y64/KhNcvSr50SmxQfv8F2PPNCTXXF5n9imuVoE2egT
	uYFhLkkrdZz/YecYbgOvLkoOpGcwOD6XS/NnBY05xwpbd3lfgfa0lVhiLaq+E/ZwttyMSaGjzYu
	c931hDt47iGSI9YOaGUlmzJO8MYy/3FRbyuk2k+W6CzeHH0FIq+JBU8XzRLLpJi4VrcNxyq+SdG
	8Q0OpT+9t1ElxUbooc5LHTNuf1qy8hEWL8K9p
X-Google-Smtp-Source: AGHT+IHxuMt3G7kJYQW+yHzmx9MUPNIFieDJHKHkP2QiOjkBHCGRFCPzZemp6BKM8SaYV+ZjACrK3A==
X-Received: by 2002:a17:906:c14d:b0:ad2:3efc:dd7a with SMTP id a640c23a62f3a-ad536b57a13mr191001166b.4.1747396760490;
        Fri, 16 May 2025 04:59:20 -0700 (PDT)
Message-ID: <0e978f13-bc06-4d21-99b3-0e903c2bfedf@suse.com>
Date: Fri, 16 May 2025 13:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] xen/riscv: introduce init_IRQ()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <2a57200785c710a5203a116bf9a933b4ea12d112.1746530883.git.oleksii.kurochko@gmail.com>
 <86738265-1137-45f0-ae9e-0db7f0451c08@suse.com>
 <43bc3c71-fa21-4373-b136-31f2f6bd29ab@gmail.com>
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
In-Reply-To: <43bc3c71-fa21-4373-b136-31f2f6bd29ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 13:53, Oleksii Kurochko wrote:
> On 5/14/25 4:49 PM, Jan Beulich wrote:
>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/irq.h
>>> +++ b/xen/arch/riscv/include/asm/irq.h
>>> @@ -3,6 +3,11 @@
>>>   #define ASM__RISCV__IRQ_H
>>>   
>>>   #include <xen/bug.h>
>>> +#include <xen/device_tree.h>
>>> +
>>> +#include <asm/irq-dt.h>
>>> +
>>> +#define NR_IRQS 1024
>> Is this arbitrary or arch-induced? Imo it wants saying in a brief comment either
>> way. Then again maybe it's entirely obvious for a RISC-V person ...
> 
> 1024 it is number of interrupt sources for PLIC and APLIC. I will add the comment above:
> /*
>   * According to the AIA spec:
>   *   The maximum number of interrupt sources an APLIC may support is 1023.
>   *
>   * The same is true for PLIC.
>   *
>   * Interrupt Source 0 is reserved and shall never generate an interrupt.
>   */
> #define NR_CPUS 1024

s/CPU/IRQ I suppose.

> Probably, it makes sense to change it to 1023 as interrupt 0 isn't really used.

I'd recommend against that. It would likely make things more difficult when
range-checking IRQ numbers.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/irq.c
>>> @@ -0,0 +1,45 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +/*
>>> + * RISC-V Trap handlers
>>> + *
>>> + * Copyright (c) 2024 Vates
>>> + */
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/init.h>
>>> +#include <xen/irq.h>
>>> +
>>> +static irq_desc_t irq_desc[NR_IRQS];
>>> +
>>> +int arch_init_one_irq_desc(struct irq_desc *desc)
>>> +{
>>> +    desc->arch.type = IRQ_TYPE_INVALID;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __init init_irq_data(void)
>>> +{
>>> +    unsigned int irq;
>>> +
>>> +    for ( irq = 0; irq < NR_IRQS; irq++ )
>>> +    {
>>> +        struct irq_desc *desc = irq_to_desc(irq);
>>> +        int rc = init_one_irq_desc(desc);
>>> +
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>> +        desc->irq = irq;
>>> +        desc->action  = NULL;
>> Nit: You copied a stray blank from Arm code. Actually I wonder why it isn't
>> init_one_irq_desc() that clears this field.
> 
> I can come up with the patch which does desc->action = NULL in init_one_irq_desc().
> But considering that irq_desc[] is zero-initialized then perhaps there is no any
> sense for desc->action = NULL, at all.

Oh, yes, indeed.

>> It also feels like ->irq would
>> better be set ahead of calling that function, like x86 has it.
> 
> But what is the difference with an order of writing a value to ->irq? It isn't
> really used in init_one_irq_desc().

That's the present state of things, yes. There or ...

> Or could ->irq be used in arch_init_one_irq_desc()
> for something?

... there it could be used e.g. for a log message. Maybe even just a transient
debugging one. And there's no (proper) way to re-establish the IRQ number from
the desc pointer, at least not in arch-independent code.

Jan

