Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F19E9808
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851389.1265470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKeIZ-0002bI-KF; Mon, 09 Dec 2024 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851389.1265470; Mon, 09 Dec 2024 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKeIZ-0002ZV-Hh; Mon, 09 Dec 2024 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 851389;
 Mon, 09 Dec 2024 13:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKeIY-0002ZP-Ci
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:59:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d541022b-b635-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 14:59:40 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so2505035f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:59:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd4657a124sm2616205a12.2.2024.12.09.05.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 05:59:38 -0800 (PST)
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
X-Inumbo-ID: d541022b-b635-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733752779; x=1734357579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RHTOGzomTI+5DHJuDkaDJ1TQap05hXVmYm5I2YKajp4=;
        b=G02WQmEMkG9RsR67IkZqJaBsXelxNUAtVPbvQZf5zzgPnzcoewIdYSiKR+t9jsRFD2
         4QLK+Z2ewAgFHUg9HJu7IXS2OHe60JdACEhavu8C7tYqQfEQ93gBdvxHWgtPMA+/uayt
         4iRVY3iD4Q0mSUKHp08NOsYP3ayyzxHeD1rD67CPZogGRl6EtLn7k0uVpn/MqS/vhblj
         s6+USx41cG7lpfnP5fxU1MByThSNYInw6gjTPM0Bj/Kcj8GHUnA2YU5WATT+LkzTfqez
         kecl9/JBR9ifO9FekvgJxNYNmkqpZ1p2MXDFYDrxRO0jqHLennRoL2DTxfh/FS+L+p6/
         MULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752779; x=1734357579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHTOGzomTI+5DHJuDkaDJ1TQap05hXVmYm5I2YKajp4=;
        b=Gy7D8kuvIYRGCWP5nEbtoiByg/stWoK9rjoVyzwy4oNQPg4FVR4Ei9F9AID8WzkjQi
         f0IVE+9HXOmTX+8b61+JH/PDHCnarpcqXw+TKuK0Gk1RIBIhnFHqYk3PGuXwREMz5ts+
         kEHsZ3H357CqQ890hrD5eLNueQj5cwWY/jyhZUyMm6Z7St3zEOEnnLyrt3ZF7UtL4RIQ
         TIfhV5VIwHIUQHshLdYAAhgtBtgd8RHvCDAF1FJczw7QeqHomhqitp6/Uil1OUntdo2/
         uDMmDxRgn4XGKvs+Vi64nOJOR6O5roOUmkSwifnLkXDG4GIe4InQcEppstocgrXT2+Du
         MizQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJoDwbS7CZV0IF0m5M/fud9mDd0IRbOpyuXGbC3H9WHx+tQJ6RrX7z8l95TqmAPPnkomPrRiKqaVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTIsE8y69oNE8DeF7PR67cjxFC1Nz83mn9amSD+U+hq/126yA2
	lqYhFxvMgT+jKg3bgzW3Bl+/dHzNr2v7QrS/RPIKxC7bDFZzaBoUa4KtL4KRAg==
X-Gm-Gg: ASbGncthMz8XkHgfcfqzJO+RRNZWRMhaPPJcXbHm6uhbIHT3cQFXHWHzhbRyChUByDG
	mf7l/WL3fTw/EgvoleIDxnZOEjCtrNosblgXOewvrm9UsTuG9tr1oDZSnLlvgYCtWHf/k54F9rD
	mzzeqylw4Le+kIWk6cLbUwqwT0pIR40yXtTIk/iD4dMTqRLYXQ3Qa38JPiYWs2r9CXICfdqDvRJ
	WM6PNfVTZmPdt2ToEjpsKUwrj89EN0ts+cAPT1WrSS/BkNUqEztEQSXDy+FJtvCRROmiIXiKX79
	eskdFbfyHKkOqUycK+HNdVWkA59dn9BBqYE=
X-Google-Smtp-Source: AGHT+IGixjyqAYxZhDsEI2vh1C4Z8EGpOpjgu3Sx7w2uAEdI69EDZpQfOCw0aeIrquRmzfj8rkU1Lg==
X-Received: by 2002:a5d:64ef:0:b0:385:fb56:fb73 with SMTP id ffacd0b85a97d-3862b3553cfmr8341058f8f.15.1733752779393;
        Mon, 09 Dec 2024 05:59:39 -0800 (PST)
Message-ID: <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
Date: Mon, 9 Dec 2024 14:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 07:09, Jiqian Chen wrote:
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

Was this a deliberate decision? We default to GPL-2.0-only, I think.

> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/hypercall.h>
> +#include <xen/vpci.h>
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    uint64_t size;
> +    unsigned int index;
> +    struct vpci_bar *bars = data;
> +
> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> +        return;

I don't think something like this can go uncommented. I don't think the
spec mandates to drop writes in this situation?

> +    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;
> +    if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        return;
> +
> +    if ( bars[index].type != VPCI_BAR_MEM64_LO &&
> +         bars[index].type != VPCI_BAR_MEM32 )
> +        return;
> +
> +    size = PCI_REBAR_CTRL_SIZE(val);
> +    if ( !((size >> 20) &
> +         MASK_EXTR(pci_conf_read32(pdev->sbdf, reg - 4), PCI_REBAR_CAP_SIZES)) )

No such literal 4 please. What I think you mean is reg - PCI_REBAR_CTRL +
PCI_REBAR_CAP.

Also indentation is off (by 2) here.

> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx for BAR%u isn't supported\n",
> +                &pdev->sbdf, size, index);
> +
> +    bars[index].size = size;
> +    bars[index].addr = 0;
> +    bars[index].guest_addr = 0;
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +}
> +
> +static int cf_check init_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int rebar_offset, nbars;
> +
> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset )
> +        return 0;
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
> +    {
> +        int rc;
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> +                               rebar_offset + PCI_REBAR_CAP, 4, NULL);

The capability register is r/o aiui. While permitting hwdom to write it is
fine, DomU-s shouldn't be permitted doing so, just in case. (An alternative
to making handler selection conditional here would be to bail early for the
!hwdom case, accompanied by a TODO comment. This would then also address
the lack of virtualization of the extended capability chain, as we may not
blindly expose all capabilities to DomU-s.)

> +        if ( rc )
> +        {
> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
> +                   &pdev->sbdf, rc);
> +            break;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL, 4,
> +                               pdev->vpci->header.bars);
> +        if ( rc )
> +        {
> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
> +                   &pdev->sbdf, rc);
> +            break;

Is it correct to keep the other handler installed? After all ...

> +        }
> +    }
> +
> +    return 0;

... you - imo sensibly - aren't communicating the error back up (to allow
the device to be used without BAR resizing.

> @@ -541,6 +542,16 @@
>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>  
> +/* Resizable BARs */
> +#define PCI_REBAR_CAP		4	/* capability register */
> +#define  PCI_REBAR_CAP_SIZES		0xFFFFFFF0  /* supported BAR sizes */

Misra demands that this have a U suffix.

> +#define PCI_REBAR_CTRL		8	/* control register */
> +#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007  /* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
> +#define  PCI_REBAR_CTRL_SIZE(v) \
> +            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))

The literal 20 (appearing here the 2nd time) also wants hiding behind a
#define.

Jan

