Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CE9F2F14
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857773.1269985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Cl-0001a3-UX; Mon, 16 Dec 2024 11:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857773.1269985; Mon, 16 Dec 2024 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Cl-0001Ya-Q4; Mon, 16 Dec 2024 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 857773;
 Mon, 16 Dec 2024 11:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN9Cj-0001YU-U1
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:24:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f523e6b-bba0-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 12:24:00 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso42223575e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:24:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c57dsm136387485e9.12.2024.12.16.03.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:23:59 -0800 (PST)
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
X-Inumbo-ID: 3f523e6b-bba0-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734348240; x=1734953040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yxfdzce9dBvZit3hIoPW5hX1l7Tj1gSZWKooZXG8eMM=;
        b=bl3lBhZMSQGhAyCnSNWF2SJM8icE0tpEudeumI19O4GLQvtiEasDg5bZOolsBNxBtm
         kIgamhqRBqe2+ExKLYHa/xAMq46KjewNNUvE9PvNamTDIENavVuyUtWDw8DbJRrVF8Sw
         5LAge/FzDiimCS4MHiKpkEG3j3T6Nn0HB7L2FS1JUd94kzyYzViVPehYzzzxwA1EXP7v
         wsEY50eDCfvN+qPCmPvtHIWCx9f/brVqUqOdA2l+5ArV2gYJ8skJJ7Go812uqYFS8kG/
         yq83kj4DgpKiue0lGJ28HS901yMKpbNPn1W/wI36PHTDSxSrpTnzDNuwTjY4OP1QsLsH
         4UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348240; x=1734953040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxfdzce9dBvZit3hIoPW5hX1l7Tj1gSZWKooZXG8eMM=;
        b=l2+FbX3W0r8J7Aqg/4nJEA+5p7JRMnM15SPlqHJqzxM1vS1t0G8xlz36D9/0qowGKT
         rYkPncm02ELQwdo4OyMWaJuHnZtDRJQK9HS+tF/k/ec41O0S6gHqhdSQAdlSDLPc6G6L
         r1O+Wh/QL0o7G6eev3u1BOTl4eEB8P1oejK06vrrO1/Qgjipz+5Z64YlOOH02FJnJZTW
         OGBdfTXacUVgDfYbpXGsbCLzMKwJccD7oE862Xu265aoEbDc2STmKhVaeZqsoFHu0wVi
         azxE9uZi6+EaYq+nbRtDhbluI2rN/Ma500I3AaA8hrbnk6eApmRWDS2sSY6n+8OZU3Z9
         RBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJgTcJhkmh5Ro8qu9L+sQnDerzSwX2pKlqDOxoMcn7x0KIHV/Dbhhq9BPpXkF0589B16PlSFaxaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc0lmsHUy2WDBnGky7Vb7I1ZyGGk8aDISwR+l+JwPi9dYUbwBb
	U6BaW4I0AV5eEahGnqu4CClOEKkrrTfv5IuA31lg46h6NHAYSk2ciiXpd/ntOQ==
X-Gm-Gg: ASbGncv7tAWcFZBoo00AOwhVgqWMxYF8nVzRK86F8K2gwemHw8vHZVN28LpfToyb5XL
	xNCePp0dTICQk2iutmA+rI5XBQAdjrp4pvv24uRbT8kaNEwFIsddVMfo90iVMfJc6Dsl5Sp9Fj2
	qN/4Jv4EKKw5brCCXGsnYUHc22wOfLNbjAJ/sRwggfHHoF3BTe4UvZNq1Qs6zln0Q+fiepi81kz
	ogKQdiMc1NMh5/k9GOzyPq96D0yuDz0fLzxOl/F0ge0xrxUJZkS/fAyhlT5K/Mdz1D9xniIbf2A
	6iY8iYrUy20+DdDQCgu5TwRnzRnGUzDDSv5WcoW+cw==
X-Google-Smtp-Source: AGHT+IEaadTZpVH/9bJh6C7XOcdqNoUr0UWYFKJGSz+NdL8CiRtWmTOStyyaJtqc1kmAkVd/v7kl+A==
X-Received: by 2002:a05:600c:1f0b:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-4362aaa495emr90710175e9.28.1734348239901;
        Mon, 16 Dec 2024 03:23:59 -0800 (PST)
Message-ID: <0f75fcd2-6c5d-4be6-9fc9-3c7b6c10ae51@suse.com>
Date: Mon, 16 Dec 2024 12:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 06:42, Jiqian Chen wrote:
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
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
> +    struct vpci_bar *bar = data;
> +
> +    size = PCI_REBAR_CTRL_SIZE(val);
> +    if ( bar->enabled )
> +    {
> +        if ( size == bar->size )
> +            return;
> +
> +        /*
> +        * Refuse to resize a BAR while memory decoding is enabled, as
> +        * otherwise the size of the mapped region in the p2m would become
> +        * stale with the newly set BAR size, and the position of the BAR
> +        * would be reset to undefined.  Note the PCIe specification also
> +        * forbids resizing a BAR with memory decoding enabled.
> +        */
> +        gprintk(XENLOG_ERR,
> +                "%pp: refuse to resize BAR with memory decoding enabled\n",
> +                &pdev->sbdf);
> +        return;
> +    }
> +
> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) &
> +           MASK_EXTR(pci_conf_read32(pdev->sbdf,
> +                                     reg - PCI_REBAR_CTRL + PCI_REBAR_CAP),
> +                                     PCI_REBAR_CAP_SIZES)) )
> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, size);

This only covers the 1Mb ... 128Tb range. What about the 256Tb ... 8Eb one?

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
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk("ReBar is not supported for domUs\n");
> +        return -EOPNOTSUPP;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )

PCI_REBAR_CTRL is an offset; it can't be used to bump rebar_offset here.
That'll need a separate constant, even if both evaluate to 8.

Jan

