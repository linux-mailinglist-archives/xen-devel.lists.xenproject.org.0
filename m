Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0BA8B6CD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955477.1349244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u502k-0004ui-OI; Wed, 16 Apr 2025 10:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955477.1349244; Wed, 16 Apr 2025 10:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u502k-0004t4-LH; Wed, 16 Apr 2025 10:30:58 +0000
Received: by outflank-mailman (input) for mailman id 955477;
 Wed, 16 Apr 2025 10:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u502i-0004sy-VQ
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:30:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc87bc7-1aad-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 12:30:23 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so44695895e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 03:30:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4c8056sm17204915e9.2.2025.04.16.03.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 03:30:22 -0700 (PDT)
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
X-Inumbo-ID: cdc87bc7-1aad-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744799423; x=1745404223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mR0wgexs7v7FhQRFP92ev7RmOCtyGLhA5EYpw9vx/ZM=;
        b=gDJpTlvsIemvs//f90qCYaIayaJZdIdZXvHO5W2mU9mDI/L0n3/+GU4aQ2ehc9rwxZ
         oMwKWQexQG+wXjJXz8HIWxFeG8wwJKpk92ePJYAINm5vPrtzmKl8CbMCtIYNNRjHi+kl
         VxfnRtTwhzSElux3mY9qv1goQYMR8Gq7pZeNpm4bSEN5jQexNpHbGY5tAu2BElQWGP5q
         /1f9zQIC6mcN1WxXKUuVPPcvupu8OcTkyr9CglXC5rn17Rm+om/t4TOAxzazH0yoGKy3
         lfyzCUNCGw/dlULePdxOo01kUpRCNk/kizU/ckwPqYlq/qehg/HfFQIgWrXImDARpr8V
         pW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744799423; x=1745404223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR0wgexs7v7FhQRFP92ev7RmOCtyGLhA5EYpw9vx/ZM=;
        b=VQ4WbypLHTyIFDlI2GcrSzVfrNt66U1WGc1TtneMm7d4Q8lHzCve6gmj7q5iCEvuAF
         +E9oLIk0QB0xFpsGY8QdpWhOthLYiKX1vUfha42iObdtr6wg2RvEAu1KeaGbuOZX80Xc
         ntPywfhLTdt6m9lB9nKNHXoxrVcRfTReITxm7pErfUvsympVnS3T5yzZn6PWBlY69UYt
         7/8zVTnIkg/18KeqWZ4YC/5SYl8BKiJ4squJpRgACJPXWClJ/+IPBZvDHfwO592PdaUq
         SFOAdjfSXu0hqUA4PvZbkE2/sz84zIZdy9DzQzs5rMIZWqX+Io9ovaalx0NrJxu6ISU4
         1B/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlU3drRwKBO92Va6eY0d4/skuZI7nomJS+CxT+LXARdnZ9EGtEK9VJHkFB0nLAlZVX/aw09mI4e0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyf2B1r464drOU2mn9/6NbeYls11APsNkvpkNDuiTH7ryC0Njq
	m+2OCzzr2lYLn5zFsZM7GJmptTmSJ/npHM7TJeK5+4TxZ8HIS2bgTUlBlabUSw==
X-Gm-Gg: ASbGncttKSyuFIGTaRDgZOIDXKK+f4cYbCy6Y/bcCgnCoaPadPqf9b0q7gSihGYy0/x
	c6Kq3UzhxlOhHKsOV1SUFf2pNzhTNKNhyXTNrQdzZNmCloeJ6kPRYZRM7EyBt3V575BzfIBWhqd
	tBCKY0x6yKtyKSnGuConBtJBMgo8UGXH9bgZWq8kUaO4pLGFnibW9vF0oI51CtIvoCmFslPXfm3
	X+S8TD2cC81Pz3Aam4HlTfPmWd01CEum61beiS2THopX4WPCDMXxexTusx9wjbF8nziPVL6cJkO
	0EpxmfxXpwpGhlMHjtxIDvTigtnfJBj2Fl9ldFh/lgSCVDCZBRCG4spliuEpaLoWdOCiKIQ4hjQ
	I9vYnoUuBkIuzIMSKrglPkvuruA==
X-Google-Smtp-Source: AGHT+IFDClQC9dqhGnMNhOY6AuSjJZZfLThewL9y3pJU8iDigzTCbPscpiVslHZHA3e60MxanEmYkQ==
X-Received: by 2002:a05:600c:1c07:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-4405d61cdccmr11018135e9.8.1744799423042;
        Wed, 16 Apr 2025 03:30:23 -0700 (PDT)
Message-ID: <f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com>
Date: Wed, 16 Apr 2025 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
 <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>
 <a54ef262-92fc-453d-898e-70636c2918fd@gmail.com>
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
In-Reply-To: <a54ef262-92fc-453d-898e-70636c2918fd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.04.2025 12:15, Oleksii Kurochko wrote:
> On 4/14/25 12:04 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>> +    if ( !rc )
>>> +        panic("%s: IDC mode not supported\n", node->full_name);
>>> +
>>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>>> +    if ( !imsic_node )
>>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>>> +
>>> +    /* check imsic mode */
>>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>>> +                                    irq_range, ARRAY_SIZE(irq_range));
>>> +    if ( rc && (rc != -EOVERFLOW) )
>>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>>> +               node->full_name, imsic_node->full_name);
>> Why exactly is EOVERFLOW tolerable here?
> 
> QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
> For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
> interested in the S-mode IMSIC node.
> 
> The IMSIC node includes this information in the|"interrupts-extended"| property,
> which has the following format:
>    interrupt-extended = {<interrupt-controller-phandle>, <machine_mode>},...
> The number of such|<phandle, mode>| pairs depends on the number of CPUs the platform has.
> 
> For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:
> 
>    if ( irq_range[1] == IRQ_M_EXT )
> 
> Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
> has more then one CPU as we passed irq_range[2] as an argument but the amount of values
> in "interrupts-extended" property will be (2 * CPUS_NUM).
> 
> I can update the comment above dt_property_read_u32_array() for more clearness.

Yet my question remains: Why would it be okay to ignore the remaining entries,
and hence accept -EOVERFLOW as kind-of-success?

>>> +    aplic.regs = ioremap(paddr, size);
>>> +    if ( !aplic.regs )
>>> +        panic("%s: unable to map\n", node->full_name);
>>> +
>>> +    /* Setup initial state APLIC interrupts */
>>> +    aplic_init_hw_interrupts();
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct intc_hw_operations __ro_after_init aplic_ops = {
>> const or __ro_after_init?
> 
> What’s wrong with using both?|const| ensures the variable can't be changed at compile time,
> while|__ro_after_init| makes it read-only at runtime after initialization is complete.

No, const makes it read-only at compile- and run-time. __ro_after_init,
putting the item into a special section, makes it writable at init-time.
Due to the const, the compiler wouldn't emit any writes. But we can
also avoid stray writes by having the item live in .rodata.

> Probably,|__initconst| would be a better fit:
>    static const struct intc_hw_operations __initconst aplic_ops = {
> 
> Or even|__initconstrel|, since the|struct intc_hw_operations| contains pointers.

Well, if this variable isn't accessed post-init, sure. That seems pretty
unlikely though, considering it contains pointers to hook functions.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/aplic.h
>>> @@ -0,0 +1,77 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +
>>> +/*
>>> + * xen/arch/riscv/aplic.h
>>> + *
>>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>>> + *
>>> + * Copyright (c) 2023 Microchip.
>>> + */
>>> +
>>> +#ifndef ASM__RISCV__APLIC_H
>>> +#define ASM__RISCV__APLIC_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/imsic.h>
>>> +
>>> +#define APLIC_DOMAINCFG_IE      BIT(8, UL)
>>> +#define APLIC_DOMAINCFG_DM      BIT(2, UL)
>>> +
>>> +struct aplic_regs {
>>> +    uint32_t domaincfg;
>>> +    uint32_t sourcecfg[1023];
>>> +    uint8_t _reserved1[0xBC0];
>>> +
>>> +    uint32_t mmsiaddrcfg;
>>> +    uint32_t mmsiaddrcfgh;
>>> +    uint32_t smsiaddrcfg;
>>> +    uint32_t smsiaddrcfgh;
>>> +    uint8_t _reserved2[0x30];
>>> +
>>> +    uint32_t setip[32];
>>> +    uint8_t _reserved3[92];
>>> +
>>> +    uint32_t setipnum;
>>> +    uint8_t _reserved4[0x20];
>>> +
>>> +    uint32_t in_clrip[32];
>>> +    uint8_t _reserved5[92];
>>> +
>>> +    uint32_t clripnum;
>>> +    uint8_t _reserved6[32];
>>> +
>>> +    uint32_t setie[32];
>>> +    uint8_t _reserved7[92];
>>> +
>>> +    uint32_t setienum;
>>> +    uint8_t _reserved8[32];
>>> +
>>> +    uint32_t clrie[32];
>>> +    uint8_t _reserved9[92];
>>> +
>>> +    uint32_t clrienum;
>>> +    uint8_t _reserved10[32];
>>> +
>>> +    uint32_t setipnum_le;
>>> +    uint32_t setipnum_be;
>>> +    uint8_t _reserved11[4088];
>>> +
>>> +    uint32_t genmsi;
>>> +    uint32_t target[1023];
>>> +};
>>> +
>>> +struct aplic_priv {
>>> +    /* base physical address and size */
>>> +    paddr_t paddr_start;
>>> +    paddr_t paddr_end;
>>> +    size_t  size;
>>> +
>>> +    /* registers */
>>> +    volatile struct aplic_regs *regs;
>>> +
>>> +    /* imsic configuration */
>>> +    const struct imsic_config *imsic_cfg;
>>> +};
>>> +
>>> +#endif /* ASM__RISCV__APLIC_H */
>> Does all of this really need to live in a non-private header?
> 
> struct aplic_priv is used in different files:
> - in aplic.c to define `aplic` variable.
> - in vaplic.c (which isn't intoduced yet) is used in several places:https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L41

Which would still call for a private header (xen/arch/riscv/aplic.h).

> struct aplic_regs is used only in aplic.c (at least, at the moment) so could be moved to
> aplic.c, but I don't see too much sense.

It is generally good practice to limit the scope of things as much as
possible. Just to avoid (or make more noticeable) mis-uses or layering
violations, for example.

>>> --- a/xen/arch/riscv/include/asm/irq.h
>>> +++ b/xen/arch/riscv/include/asm/irq.h
>>> @@ -27,7 +27,6 @@
>>>   #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
>>>   
>>>   /* TODO */
>>> -#define nr_irqs 0U
>> How come this is simply no longer needed, i.e. without any replacement?
>> Hmm, looks like the only use in common code has gone away. Yet then this
>> still doesn't really look to belong here (especially if not mentioned in
>> the description).
> 
> I missed that it is used in xen/common/domain.c when CONFIG_HAS_PIRQ=y, but this
> config isn't selected for RISC-V.
> I think that I have to revert this change.

I don't think you need to, as long as you don't mean to select HAS_PIRQ
for RISC-V. It's just that the change looks entirely unrelated _here_.

Jan

