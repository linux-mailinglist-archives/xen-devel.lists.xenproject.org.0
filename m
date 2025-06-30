Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D91AEE1A4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029177.1402931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFwn-0004Fy-V7; Mon, 30 Jun 2025 14:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029177.1402931; Mon, 30 Jun 2025 14:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFwn-0004DG-S1; Mon, 30 Jun 2025 14:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1029177;
 Mon, 30 Jun 2025 14:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWFwm-0004DA-En
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:57:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89b5a7a3-55c2-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 16:57:27 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso6594355e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:57:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55c8437sm9005737b3a.115.2025.06.30.07.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:57:25 -0700 (PDT)
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
X-Inumbo-ID: 89b5a7a3-55c2-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751295446; x=1751900246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8B+hmkltaIYtUZVBdXOxpt3b/8p2vdivHKfkTrc1Lc=;
        b=JMnHEFAM3DLFNMUHPmCQ+I1b/EqB6JPDt7r4oxz+GArI9r9rfbbXB5N+qItLd4OZGj
         evMb4EMfU4L+8l/ItsBF/VwNSRUkkcmslRzP/Q81Hs5MNFBp+fBHx8UqcmBpleSchwvx
         DkzYaCzSOUjacXiPaMsVC8YZVwdrmu1KzJHeKUW1q63fssp3+BQ8+fy+T4ogRtZzj5mX
         PMU94nRw5wyvI8beAj8iER/E0ZLAxYc+oih5/R4DaCDEVC6PjrI4kM4NRTlsVJDCsR8Q
         xv7W3bJ/oonZuQt0kBdpHCocvpJoRD9CcOUl5NUTxlv/nvdrbu/bhK1Y1OMX3d/4iMLB
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295446; x=1751900246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8B+hmkltaIYtUZVBdXOxpt3b/8p2vdivHKfkTrc1Lc=;
        b=suJTB9sjLQEa0lGsw7DEfMWK+gl+cOVWwkmoLfGsISWqLXiOVgYAEJ7g+x/D0HkYif
         +MVJdltcdFUBE3lRiNX+uurAZcWkoYXDOAuSifZJcrQIElXA47qj74yokPqLiwt1dPfo
         w8M5P+oj7fYyiO6JMvAdkW0OmA9L/fjJZeuyKLlJR0GDNwN+SHN1NZtamFLnOic9cRTj
         sJA4MZDpPHx2n/m+/fV9O7VqCbuaUPY+RgdTrSYZ/tKqO2gabblA87Kyhc/c+h7RYWsu
         /QJ6N4aHtf6bHD9ruDuoWOGNAjcmHPJWyaGVc9JU/KcOGoVt8NbyGiL3FAbzU6Qziyk6
         aumg==
X-Forwarded-Encrypted: i=1; AJvYcCV6+OOM5Ajs39IWfPZb3YmdMCgjvtXG6Bmv2ZxKRM0y5ngkopJy37Mj2IUEp2wV6vXbEA5XoRkAdEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7e1PGDijSZ6SaOHYNQ3ifB+iqIuilhD1KGIkE8w0P85dOzLd6
	6zW+eChbmcOWYrC12CP6mznb2kBsMybdf6hoHmbVig20jiB7/BVYiXTf+Cj1Br0YVg==
X-Gm-Gg: ASbGncupiLI5dbD8ygiP8m7q1Y8VbRwclZ+zS6ojkWDHdTr5PylIMEIktps+JjJcdHv
	6BQAitMynYf1ajINJpOz9ae3qHZGz1ESVOA1/kyTt9aghP/1ZKkzmgV4oIqjPL+tDmTW+ML52Fb
	AUFknNhnwiBhfwRTPqBsDrfO2c1PSAvXSksHicJrVRNy/fYjYjEPbz71rbedeCCADOzNxXIYYIQ
	gKNpvgyhIW7c8wx64EDJRtq54QeuEqL8mEACR2qBUN3SBbW1ul4vURilCdhMj/y4IntyjSvzaa7
	OORk5bTWyZM/TQIRSfefK7TsfLEVeHNizTRpaclE3ndpHu2CgFBsRLkr+ApM4V7J9SCIhNE9dbe
	77c1EPp9SOL8fxtOSLUUKxrDlFeJxlindAnPKjkGYK8RHo6E=
X-Google-Smtp-Source: AGHT+IFqzqRQj6opO1qF3Q1TxzishyDuC4br6VjYS7F6eGp9/XwAOEbU5r2gJioxa8qqVjvuvJo2rQ==
X-Received: by 2002:a05:6000:21c7:b0:3a5:88cf:479c with SMTP id ffacd0b85a97d-3a8fe5b1d58mr7623353f8f.30.1751295446406;
        Mon, 30 Jun 2025 07:57:26 -0700 (PDT)
Message-ID: <51d7c5ac-cd02-4b5c-a2ac-0a673df38f56@suse.com>
Date: Mon, 30 Jun 2025 16:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <cfbfe119b2b19339c66edbe37f2165649b12741a.1749825782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cfbfe119b2b19339c66edbe37f2165649b12741a.1749825782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:48, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic-priv.h
> + *
> + * Private part of aplic.h header.
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates.
> + */
> +
> +#ifndef ASM_RISCV_PRIV_APLIC_H
> +#define ASM_RISCV_PRIV_APLIC_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/aplic.h>
> +#include <asm/imsic.h>
> +
> +struct aplic_priv {
> +    /* base physical address and size */

I'm sure I did ask for this before, and such a request really is meant to apply
globally: Please can you abide by the comment style set forth in ./CODING_STYLE.

> +static int __init cf_check aplic_init(void)
> +{
> +    dt_phandle imsic_phandle;
> +    const __be32 *prop;
> +    uint64_t size, paddr;
> +    const struct dt_device_node *imsic_node;
> +    const struct dt_device_node *node = aplic_info.node;
> +    int rc;
> +
> +    /* Check for associated imsic node */
> +    if ( !dt_property_read_u32(node, "msi-parent", &imsic_phandle) )
> +        panic("%s: IDC mode not supported\n", node->full_name);
> +
> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
> +    if ( !imsic_node )
> +        panic("%s: unable to find IMSIC node\n", node->full_name);
> +
> +    rc = imsic_init(imsic_node);
> +    if ( rc == IRQ_M_EXT )
> +        /* Machine mode imsic node, ignore this aplic node */
> +        return 0;
> +
> +    if ( rc )
> +        panic("%s: Failed to initialize IMSIC\n", node->full_name);
> +
> +    /* Find out number of interrupt sources */
> +    if ( !dt_property_read_u32(node, "riscv,num-sources",
> +                               &aplic_info.num_irqs) )
> +        panic("%s: failed to get number of interrupt sources\n",
> +              node->full_name);
> +
> +    if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
> +        aplic_info.num_irqs = ARRAY_SIZE(aplic.regs->sourcecfg);
> +
> +    prop = dt_get_property(node, "reg", NULL);
> +    dt_get_range(&prop, node, &paddr, &size);
> +    if ( !paddr )
> +        panic("%s: first MMIO resource not found\n", node->full_name);
> +
> +    if ( !IS_ALIGNED(paddr, KB(4)) )
> +        panic("%s: paddr of memory-mapped control region should be 4Kb aligned:%#lx\n",
> +              __func__, paddr);
> +
> +    if ( !IS_ALIGNED(size, KB(4)) || (size < KB(16)) )
> +        panic("%s: memory-mapped control region should be a multiple of 4 KiB in size and the smallest valid control is 16Kb: %#lx\n",

The line having grown so long should have served as an indication to abbreviate the
text somewhat.

Also note the consmetic difference between this and the earlier message, as to a
blank (or not) after the latter colon. Please try to be consistent at least within
a patch / function / whatever other unit.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/asm/include/aplic.h
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + */
> +
> +#ifndef ASM_RISCV_APLIC_H
> +#define ASM_RISCV_APLIC_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/imsic.h>
> +
> +#define APLIC_DOMAINCFG_IE      BIT(8, U)
> +#define APLIC_DOMAINCFG_DM      BIT(2, U)
> +
> +struct aplic_regs {
> +    uint32_t domaincfg;
> +    uint32_t sourcecfg[1023];
> +    uint8_t _reserved1[3008];
> +
> +    uint32_t mmsiaddrcfg;
> +    uint32_t mmsiaddrcfgh;
> +    uint32_t smsiaddrcfg;
> +    uint32_t smsiaddrcfgh;
> +    uint8_t _reserved2[48];
> +
> +    uint32_t setip[32];
> +    uint8_t _reserved3[92];
> +
> +    uint32_t setipnum;
> +    uint8_t _reserved4[32];
> +
> +    uint32_t in_clrip[32];
> +    uint8_t _reserved5[92];
> +
> +    uint32_t clripnum;
> +    uint8_t _reserved6[32];
> +
> +    uint32_t setie[32];
> +    uint8_t _reserved7[92];
> +
> +    uint32_t setienum;
> +    uint8_t _reserved8[32];
> +
> +    uint32_t clrie[32];
> +    uint8_t _reserved9[92];
> +
> +    uint32_t clrienum;
> +    uint8_t _reserved10[32];
> +
> +    uint32_t setipnum_le;
> +    uint32_t setipnum_be;
> +    uint8_t _reserved11[4088];
> +
> +    uint32_t genmsi;
> +    uint32_t target[1023];
> +};

Each time I see this I wonder whether it wouldn't be helpful if, at least for
the non-reserved fields, there would be comments clarifying their hex offset.
That way it would be easier to (a) compare with the spec and (b) cross-check
the array dimensions used.

Jan

