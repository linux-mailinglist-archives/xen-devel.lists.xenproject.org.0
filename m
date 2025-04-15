Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA5A8A78D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 21:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954360.1348625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4lhM-0007xO-BX; Tue, 15 Apr 2025 19:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954360.1348625; Tue, 15 Apr 2025 19:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4lhM-0007uW-8p; Tue, 15 Apr 2025 19:11:56 +0000
Received: by outflank-mailman (input) for mailman id 954360;
 Tue, 15 Apr 2025 19:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4lhL-0007uQ-2P
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 19:11:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5a6e74-1a2d-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 21:11:53 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so989589366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 12:11:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acac8a494f5sm879652866b.85.2025.04.15.12.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 12:11:51 -0700 (PDT)
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
X-Inumbo-ID: 7d5a6e74-1a2d-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744312; x=1745349112; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzN1EHCiQ2VUK83EBh1hxAVhaBmFtMzbUc+9g/UxZYI=;
        b=M6KsRVlZMqkxdSr/RMTxnctENpDEv3EclryqbpXBg4hbRX5NrbzbD0l6TsdTDrEdgH
         M2HnEcKCJL2H9+QP5v8XHVSnvY+kU/Plb36ftiRMe0YuDF2hCwWoYKwK6csUpjl/yqYo
         CGDCf3QHjczf0tQcMolQnnVDtzOpTtwSO/wCRY3bRV2+sVYpXwVg2SgwsyFjos9geLjS
         WGPSgHjE2aSJsn0as3LpZJJmSVo0vaiW8SeYKG/ZOlQ1XJXr39SAQnDZubZPFQdia1kZ
         C3QKKrSErb6dWhC23yVMovPTat2CkL2rnaWTb8DSRDqxGdnD/OP2Y2Tnl6RecJ4cu9Q5
         TnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744312; x=1745349112;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nzN1EHCiQ2VUK83EBh1hxAVhaBmFtMzbUc+9g/UxZYI=;
        b=sPxzEibv3QVraKOf7f6fR2rUwMnPezVIBkN/KkBIQNdr9574vgnvglkycPErkOoTSE
         gM1OvlzpwA+OiKirGMJmN7byS+BNhMD1+g14xJQH+jQrU5gQ5OzmlzfYoUhxXfPCzwpo
         VBVn/LrWHv4h5kWu5hfmztvoAHvj3xmdM/L3d1g4NBpTlW+ajUhED2oKzTE/k2fUhveA
         q+uUA9HidlQXW/BDpQvXPx6F0fp1gYdGY3yWiSugJXnhqPoZ+6lRkHcWn1riFkCt/OIJ
         K+WjzySnKL267t8oJxQIJbUe5/nO5H7I46cIvA/1MG0/rDV9BcnqDaYcZKGHF544vND1
         TjjA==
X-Forwarded-Encrypted: i=1; AJvYcCXRaw3+IYtAjuO0pLAff50/3l7wVJO59Zrs0dFqiNvxivhUy6/u52z7Nca5lNN5n66O7YXX6YLzwtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYBrXFsjpHThPA01qzZDzt1x8bEq50zD3XsaI344TN90pe+pb3
	qQlsv6sur+N7CTbyCj3dydebs+hP3cL/I94jY66W7jS13QdB2gic
X-Gm-Gg: ASbGncteGtAHDoHV3MrH9yGzeolJ3pXFGQSR5JTX+abD1DFMMXO9lPV8f50d1OJnSxm
	rjkejR/lA/68hjTHM+ZbJOlmF1uLsbpGALZXPdriBF8v4eTeO1luXsTwC/8gWTdlsG4nG7CIGmK
	SiH88daPHkx8U/U0FC75vCGRfmaqbVdK/nsT/LUmObDggzUFm468qpki5MJ4cyYlOYGGmpd7JHe
	vKXk2HcTSobDWh/RcKRshpuihn6f5oQR+1Dz6i0/MLUoNwl3aeyvjqpusiZrZ/6Yn1tifvd4jXk
	X7Gny+cmrTM31tBov0NMxpxkENITPCji8BYUkQywInQRGp0mfjwSZQRj6d5Am3ggwFvqVp3f7V4
	FRmHYKHu4psV8oboi
X-Google-Smtp-Source: AGHT+IHSg6LDxlJPNQ3YwGMFM++sHPwfG1MWSgiBrQYsJIj1HJYeJCcypdSojT80nTU0ltDCCFnj4Q==
X-Received: by 2002:a17:907:7fa6:b0:ac2:fd70:ddcc with SMTP id a640c23a62f3a-acb384e2080mr16587566b.47.1744744311852;
        Tue, 15 Apr 2025 12:11:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2PuCBkmw5JrA8BtKKDoiNZrA"
Message-ID: <aadd8ccf-94f4-407e-8510-3640c6d43b31@gmail.com>
Date: Tue, 15 Apr 2025 21:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/14] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <09e0fcd64f97062441a68102ead520b818150fe9.1744126720.git.oleksii.kurochko@gmail.com>
 <78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com>

This is a multi-part message in MIME format.
--------------2PuCBkmw5JrA8BtKKDoiNZrA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/14/25 11:32 AM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -0,0 +1,286 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/imsic.c
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) 2023 Microchip Technology Inc.
>> + * (c) 2024 Vates
> No 2025 here (if already the years matter)?

I think it doesn't really matter and it could be just dropped.

>
>> + */
>> +
>> +#include <xen/const.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/macros.h>
>> +#include <xen/xmalloc.h>
>> +
>> +#include <asm/imsic.h>
>> +
>> +static struct imsic_config imsic_cfg;
>> +
>> +const struct imsic_config *imsic_get_config(void)
> Does this need to return a pointer to non-const?

No, I think it could be const struct imsic_config * const as a return type.
It isn't expected that the caller will change a pointer.

>
>> +{
>> +    return &imsic_cfg;
>> +}
>> +
>> +static int __init imsic_get_parent_hartid(struct dt_device_node *node,
>> +                                          unsigned int index,
>> +                                          unsigned long *hartid)
>> +{
>> +    int res;
>> +    unsigned long hart;
>> +    struct dt_phandle_args args;
>> +
>> +    /* Try the new-style interrupts-extended first */
> The comment says "first", but then ...
>
>> +    res = dt_parse_phandle_with_args(node, "interrupts-extended",
>> +                                     "#interrupt-cells", index, &args);
>> +    if ( !res )
>> +    {
>> +        res = riscv_of_processor_hartid(args.np->parent, &hart);
>> +        if ( res < 0 )
>> +            return -EINVAL;
>> +
>> +        *hartid = hart;
>> +    }
>> +    return res;
>> +}
> ... nothing else is being tried.

A stale comment, we decided to support only interrupt-extended to be in line with
Linux device tree bindings.
I'll drop this comment.

>
> Also, nit: Blank line please ahead of the main "return" of a function.
>
> Further - any particular reason to discard riscv_of_processor_hartid()'s
> error code on the error path?

No particular reason, just overlooked that we could really return just `res`.


>> +static int imsic_parse_node(struct dt_device_node *node,
>> +                     unsigned int *nr_parent_irqs)

(for me: fix an indentation)

>> +{
>> +    int rc;
>> +    unsigned int tmp;
>> +    paddr_t base_addr;
>> +
>> +    /* Find number of parent interrupts */
>> +    *nr_parent_irqs = dt_number_of_irq(node);
>> +    if ( !*nr_parent_irqs )
>> +    {
>> +        printk(XENLOG_ERR "%s: no parent irqs available\n", node->name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    /* Find number of guest index bits in MSI address */
>> +    rc = dt_property_read_u32(node, "riscv,guest-index-bits",
>> +                              &imsic_cfg.guest_index_bits);
>> +    if ( !rc )
> It is confusing to store a bool return value in a local "int" variable,
> just to then use it as boolean. Is the local var needed at all here?

'int` is used because of ...:
   rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
... at the end of imsic_parse_node().

Agree, we can just drop `rc` variable and return err code explicitly.

>
>> +        imsic_cfg.guest_index_bits = 0;
>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>> +    if ( tmp < imsic_cfg.guest_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: guest index bits too big\n", node->name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    /* Find number of HART index bits */
>> +    rc = dt_property_read_u32(node, "riscv,hart-index-bits",
>> +                              &imsic_cfg.hart_index_bits);
>> +    if ( !rc )
>> +    {
>> +        /* Assume default value */
>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>> +            imsic_cfg.hart_index_bits++;
>> +    }
>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
>> +          imsic_cfg.guest_index_bits;
>      tmp -= imsic_cfg.guest_index_bits;
>
> ? (And then similarly further down.)

Yes, it would be simpler.

>> +    if ( tmp < imsic_cfg.hart_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: HART index bits too big\n", node->name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    /* Find number of group index bits */
>> +    rc = dt_property_read_u32(node, "riscv,group-index-bits",
>> +                              &imsic_cfg.group_index_bits);
>> +    if ( !rc )
>> +        imsic_cfg.group_index_bits = 0;
>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
>> +          imsic_cfg.guest_index_bits - imsic_cfg.hart_index_bits;
>> +    if ( tmp < imsic_cfg.group_index_bits )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index bits too big\n", node->name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    /* Find first bit position of group index */
>> +    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
>> +    rc = dt_property_read_u32(node, "riscv,group-index-shift",
>> +                              &imsic_cfg.group_index_shift);
>> +    if ( !rc )
>> +        imsic_cfg.group_index_shift = tmp;
>> +    if ( imsic_cfg.group_index_shift < tmp )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index shift too small\n", node->name);
>> +        return -ENOENT;
>> +    }
>> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
>> +    if ( tmp >= BITS_PER_LONG )
>> +    {
>> +        printk(XENLOG_ERR "%s: group index shift too big\n", node->name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* Find number of interrupt identities */
>> +    rc = dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids);
>> +    if ( !rc )
>> +    {
>> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
>> +               node->name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
>> +         (imsic_cfg.nr_ids >= IMSIC_MAX_ID) ||
> Something named "max" normally wants to decribe the highest valid value,
> not the first out-of-range one.

But it is the maximum of identities for IMISIC according to the AIA specs:
```
( MRIF stands for Memory-Resident Interrupt File )

All MRIFs are the size to accommodate 2047 valid interrupt identities,
the maximum allowed for an IMSIC interrupt file. If a system’s actual IMSICs
have interrupt files that implement only N interrupt identities, N < 2047,
then the contents of MRIFs for identities greater than N may be ignored by
softwareand
```
and prefix IMSIC (IMO)emphasizes this. Would it be better to rename to IMSIC_MAX_ALLOWED_ID? 
And then IMSIC_MIN_ALLOWED_ID?

>
>> +         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
>> +    {
>> +        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
>> +               node->name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* Compute base address */
>> +    imsic_cfg.nr_mmios = 0;
>> +    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
>> +    if (rc)
> Nit: Style.
>
>> +    {
>> +        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node->name);
>> +        return -EINVAL;
> Discarding "rc" again?

Agree, it could be just `rc`, but considering of that this functions always returns
-EINVAL in case of the error and that `rc` could be dropped at all, we just explicitly
return here -EINVAL.

>
>> +    }
>> +
>> +    imsic_cfg.base_addr = base_addr;
>> +    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>> +                   imsic_cfg.hart_index_bits +
>> +                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>> +    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>> +                   imsic_cfg.group_index_shift);
> Besides indentation being bogus here, why is it that you need to mask bits
> off of the value read from DT? Wouldn't the expectation be that you get back
> the true base address?

The group index is used to differentiate between clusters/groups. For 
example, consider two clusters: - Cluster 1 with cpu0 and cpu1 - Cluster 
2 with cpu2 and cpu3 Then, the reg property in the IMSIC node will 
include two entries: reg = <0x0 0xd100000 0x0 0x20000>, <0x0 0x2d100000 
0x0 0x20000>; riscv,guest-index-bits = <3>; riscv,hart-index-bits = <2>; 
riscv,group-index-bits = <1>; riscv,group-index-shift = <29>; In this 
example: The group index is 1 bit wide (group-index-bits = <1>), It is 
located at bit 29 (group-index-shift = <29>) of the address.

so imsic_cfg.group_index_bits will be used to distinguish clusters, but 
they must have

the same base address and this is the reason why the mask is applied.



>
>> +    /* Find number of MMIO register sets */
>> +    imsic_cfg.nr_mmios++;
>> +    while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) )
>> +        imsic_cfg.nr_mmios++;
> And the base addresses of these aren't of interest? Oh, I see they're
> fetched again further down.

It is fetched again because we are using imsic_cfg.nr_mmios to calculate the size of
imsic_cfg.mmios array:
   imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, imsic_cfg.nr_mmios);

>
> Also - use do-while here?

It could be, I'll update that.

>> +        if ( base_addr != imsic_cfg.base_addr )
>> +        {
>> +            rc = -EINVAL;
>> +            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
> Oh, all of the addresses need to (sufficiently) match.
>
>> +    xfree(imsic_cfg.mmios);
> Better use XFREE() in cases like this one?

I think, yes.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -0,0 +1,66 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/imsic.h
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) 2023 Microchip Technology Inc.
>> + */
>> +
>> +#ifndef ASM__RISCV__IMSIC_H
>> +#define ASM__RISCV__IMSIC_H
>> +
>> +#include <xen/types.h>
>> +
>> +#define IMSIC_MMIO_PAGE_SHIFT   12
>> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
>> +
>> +#define IMSIC_MIN_ID            63
>> +#define IMSIC_MAX_ID            2048
>> +
>> +struct imsic_msi {
>> +    paddr_t base_addr;
>> +    unsigned long offset;
>> +};
>> +
>> +struct imsic_mmios {
>> +    paddr_t base_addr;
>> +    unsigned long size;
>> +    bool harts[NR_CPUS];
> An array of bool - won't a bitmap do here? Even then I wouldn't be overly
> happy to see it dimensioned by NR_CPUS.

Bitmap will fit here well. But for DECLARE_BITMAP() is necessary the size
of bitmap so NR_CPUS should be used again.
Could you please remind me why it isn't good to use it?
Because NR_CPUS not always equal to an amount of physical cpus?
Should I use non-static version of bitmap declaration? (if we have such...)

>
>> +};
>> +
>> +struct imsic_config {
>> +    /* base address */
>> +    paddr_t base_addr;
>> +
>> +    /* Bits representing Guest index, HART index, and Group index */
>> +    unsigned int guest_index_bits;
>> +    unsigned int hart_index_bits;
>> +    unsigned int group_index_bits;
>> +    unsigned int group_index_shift;
>> +
>> +    /* imsic phandle */
>> +    unsigned int phandle;
>> +
>> +    /* number of parent irq */
>> +    unsigned int nr_parent_irqs;
>> +
>> +    /* number off interrupt identities */
>> +    unsigned int nr_ids;
>> +
>> +    /* mmios */
>> +    unsigned int nr_mmios;
>> +    struct imsic_mmios *mmios;
>> +
>> +    /* MSI */
>> +    struct imsic_msi msi[NR_CPUS];
> You surely can avoid wasting perhaps a lot of memory by allocating this
> based on the number of CPUs in use?

It make sense. I'll allocate then this dynamically.

Thanks!

~ Oleksii

--------------2PuCBkmw5JrA8BtKKDoiNZrA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/14/25 11:32 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,286 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.c
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ * (c) 2024 Vates
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No 2025 here (if already the years matter)?</pre>
    </blockquote>
    <pre>I think it doesn't really matter and it could be just dropped.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+
+#include &lt;xen/const.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/xmalloc.h&gt;
+
+#include &lt;asm/imsic.h&gt;
+
+static struct imsic_config imsic_cfg;
+
+const struct imsic_config *imsic_get_config(void)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does this need to return a pointer to non-const?</pre>
    </blockquote>
    <pre>No, I think it could be const struct imsic_config * const as a return type.
It isn't expected that the caller will change a pointer.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    return &amp;imsic_cfg;
+}
+
+static int __init imsic_get_parent_hartid(struct dt_device_node *node,
+                                          unsigned int index,
+                                          unsigned long *hartid)
+{
+    int res;
+    unsigned long hart;
+    struct dt_phandle_args args;
+
+    /* Try the new-style interrupts-extended first */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The comment says "first", but then ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    res = dt_parse_phandle_with_args(node, "interrupts-extended",
+                                     "#interrupt-cells", index, &amp;args);
+    if ( !res )
+    {
+        res = riscv_of_processor_hartid(args.np-&gt;parent, &amp;hart);
+        if ( res &lt; 0 )
+            return -EINVAL;
+
+        *hartid = hart;
+    }
+    return res;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... nothing else is being tried.</pre>
    </blockquote>
    <pre>A stale comment, we decided to support only interrupt-extended to be in line with
Linux device tree bindings.
I'll drop this comment.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also, nit: Blank line please ahead of the main "return" of a function.

Further - any particular reason to discard riscv_of_processor_hartid()'s
error code on the error path?</pre>
    </blockquote>
    <pre>No particular reason, just overlooked that we could really return just `res`.


</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int imsic_parse_node(struct dt_device_node *node,
+                     unsigned int *nr_parent_irqs)</pre>
      </blockquote>
    </blockquote>
    <pre>(for me: fix an indentation)</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
+{
+    int rc;
+    unsigned int tmp;
+    paddr_t base_addr;
+
+    /* Find number of parent interrupts */
+    *nr_parent_irqs = dt_number_of_irq(node);
+    if ( !*nr_parent_irqs )
+    {
+        printk(XENLOG_ERR "%s: no parent irqs available\n", node-&gt;name);
+        return -ENOENT;
+    }
+
+    /* Find number of guest index bits in MSI address */
+    rc = dt_property_read_u32(node, "riscv,guest-index-bits",
+                              &amp;imsic_cfg.guest_index_bits);
+    if ( !rc )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It is confusing to store a bool return value in a local "int" variable,
just to then use it as boolean. Is the local var needed at all here?</pre>
    </blockquote>
    <pre>'int` is used because of ...:
  rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &amp;base_addr, NULL);
... at the end of imsic_parse_node().

Agree, we can just drop `rc` variable and return err code explicitly.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp &lt; imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n", node-&gt;name);
+        return -ENOENT;
+    }
+
+    /* Find number of HART index bits */
+    rc = dt_property_read_u32(node, "riscv,hart-index-bits",
+                              &amp;imsic_cfg.hart_index_bits);
+    if ( !rc )
+    {
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
+        if ( BIT(imsic_cfg.hart_index_bits, UL) &lt; *nr_parent_irqs )
+            imsic_cfg.hart_index_bits++;
+    }
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
+          imsic_cfg.guest_index_bits;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
    tmp -= imsic_cfg.guest_index_bits;

? (And then similarly further down.)
</pre>
    </blockquote>
    <pre>Yes, it would be simpler.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( tmp &lt; imsic_cfg.hart_index_bits )
+    {
+        printk(XENLOG_ERR "%s: HART index bits too big\n", node-&gt;name);
+        return -ENOENT;
+    }
+
+    /* Find number of group index bits */
+    rc = dt_property_read_u32(node, "riscv,group-index-bits",
+                              &amp;imsic_cfg.group_index_bits);
+    if ( !rc )
+        imsic_cfg.group_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
+          imsic_cfg.guest_index_bits - imsic_cfg.hart_index_bits;
+    if ( tmp &lt; imsic_cfg.group_index_bits )
+    {
+        printk(XENLOG_ERR "%s: group index bits too big\n", node-&gt;name);
+        return -ENOENT;
+    }
+
+    /* Find first bit position of group index */
+    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
+    rc = dt_property_read_u32(node, "riscv,group-index-shift",
+                              &amp;imsic_cfg.group_index_shift);
+    if ( !rc )
+        imsic_cfg.group_index_shift = tmp;
+    if ( imsic_cfg.group_index_shift &lt; tmp )
+    {
+        printk(XENLOG_ERR "%s: group index shift too small\n", node-&gt;name);
+        return -ENOENT;
+    }
+    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
+    if ( tmp &gt;= BITS_PER_LONG )
+    {
+        printk(XENLOG_ERR "%s: group index shift too big\n", node-&gt;name);
+        return -EINVAL;
+    }
+
+    /* Find number of interrupt identities */
+    rc = dt_property_read_u32(node, "riscv,num-ids", &amp;imsic_cfg.nr_ids);
+    if ( !rc )
+    {
+        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
+               node-&gt;name);
+        return -ENOENT;
+    }
+
+    if ( (imsic_cfg.nr_ids &lt; IMSIC_MIN_ID) ||
+         (imsic_cfg.nr_ids &gt;= IMSIC_MAX_ID) ||
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Something named "max" normally wants to decribe the highest valid value,
not the first out-of-range one.</pre>
    </blockquote>
    <pre>But it is the maximum of identities for IMISIC according to the AIA specs:
```
( MRIF stands for Memory-Resident Interrupt File )

All MRIFs are the size to accommodate 2047 valid interrupt identities,
the maximum allowed for an IMSIC interrupt file. If a system’s actual IMSICs
have interrupt files that implement only N interrupt identities, N &lt; 2047,
then the contents of MRIFs for identities greater than N may be ignored by
softwareand
```
and prefix IMSIC (IMO) <span class="Y2IQFc" lang="en">emphasizes this.

Would it be better to rename to IMSIC_MAX_ALLOWED_ID? And then IMSIC_MIN_ALLOWED_ID?

</span></pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+         ((imsic_cfg.nr_ids &amp; IMSIC_MIN_ID) != IMSIC_MIN_ID) )
+    {
+        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
+               node-&gt;name);
+        return -EINVAL;
+    }
+
+    /* Compute base address */
+    imsic_cfg.nr_mmios = 0;
+    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &amp;base_addr, NULL);
+    if (rc)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Style.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node-&gt;name);
+        return -EINVAL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Discarding "rc" again?</pre>
    </blockquote>
    <pre>Agree, it could be just `rc`, but considering of that this functions always returns
-EINVAL in case of the error and that `rc` could be dropped at all, we just explicitly
return here -EINVAL.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    imsic_cfg.base_addr = base_addr;
+    imsic_cfg.base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
+                   imsic_cfg.hart_index_bits +
+                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+    imsic_cfg.base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
+                   imsic_cfg.group_index_shift);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Besides indentation being bogus here, why is it that you need to mask bits
off of the value read from DT? Wouldn't the expectation be that you get back
the true base address?</pre>
    </blockquote>
    <pre><pre><span data-teams="true">The group index is used to differentiate between clusters/groups.
For example, consider two clusters:
- Cluster 1 with cpu0 and cpu1
- Cluster 2 with cpu2 and cpu3

Then, the reg property in the IMSIC node will include two entries:
reg = &lt;0x0 0xd100000  0x0 0x20000&gt;,
      &lt;0x0 0x2d100000 0x0 0x20000&gt;;
riscv,guest-index-bits = &lt;3&gt;;
riscv,hart-index-bits = &lt;2&gt;;
riscv,group-index-bits = &lt;1&gt;;
riscv,group-index-shift = &lt;29&gt;;

In this example:
The group index is 1 bit wide (group-index-bits = &lt;1&gt;),
It is located at bit 29 (group-index-shift = &lt;29&gt;) of the address.</span><pre><span
    data-teams="true"><p>so <span data-teams="true">imsic_cfg.group_index_bits will be used to distinguish clusters, but they must have</span></p><p><span
    data-teams="true">the same base address and this is the reason why the mask is applied.</span></p></span>
<span data-teams="true"><p><span data-teams="true"></span></p></span></pre></pre>
</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Find number of MMIO register sets */
+    imsic_cfg.nr_mmios++;
+    while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &amp;base_addr, NULL) )
+        imsic_cfg.nr_mmios++;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And the base addresses of these aren't of interest? Oh, I see they're
fetched again further down.</pre>
    </blockquote>
    <pre>It is fetched again because we are using imsic_cfg.nr_mmios to calculate the size of
imsic_cfg.mmios array:
  imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, imsic_cfg.nr_mmios);

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also - use do-while here?</pre>
    </blockquote>
    <pre>It could be, I'll update that.</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, all of the addresses need to (sufficiently) match.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    xfree(imsic_cfg.mmios);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Better use XFREE() in cases like this one?</pre>
    </blockquote>
    <pre>I think, yes.

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ */
+
+#ifndef ASM__RISCV__IMSIC_H
+#define ASM__RISCV__IMSIC_H
+
+#include &lt;xen/types.h&gt;
+
+#define IMSIC_MMIO_PAGE_SHIFT   12
+#define IMSIC_MMIO_PAGE_SZ      (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
+
+#define IMSIC_MIN_ID            63
+#define IMSIC_MAX_ID            2048
+
+struct imsic_msi {
+    paddr_t base_addr;
+    unsigned long offset;
+};
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+    bool harts[NR_CPUS];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
An array of bool - won't a bitmap do here? Even then I wouldn't be overly
happy to see it dimensioned by NR_CPUS.</pre>
    </blockquote>
    <pre>Bitmap will fit here well. But for DECLARE_BITMAP() is necessary the size
of bitmap so NR_CPUS should be used again.
Could you please remind me why it isn't good to use it?
Because NR_CPUS not always equal to an amount of physical cpus?
Should I use non-static version of bitmap declaration? (if we have such...)

</pre>
    <blockquote type="cite"
      cite="mid:78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+};
+
+struct imsic_config {
+    /* base address */
+    paddr_t base_addr;
+
+    /* Bits representing Guest index, HART index, and Group index */
+    unsigned int guest_index_bits;
+    unsigned int hart_index_bits;
+    unsigned int group_index_bits;
+    unsigned int group_index_shift;
+
+    /* imsic phandle */
+    unsigned int phandle;
+
+    /* number of parent irq */
+    unsigned int nr_parent_irqs;
+
+    /* number off interrupt identities */
+    unsigned int nr_ids;
+
+    /* mmios */
+    unsigned int nr_mmios;
+    struct imsic_mmios *mmios;
+
+    /* MSI */
+    struct imsic_msi msi[NR_CPUS];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You surely can avoid wasting perhaps a lot of memory by allocating this
based on the number of CPUs in use?</pre>
    </blockquote>
    <pre>It make sense. I'll allocate then this dynamically.

Thanks!

~ Oleksii
</pre>
  </body>
</html>

--------------2PuCBkmw5JrA8BtKKDoiNZrA--

