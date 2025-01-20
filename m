Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C9A16F44
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 16:36:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874984.1285310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZtoQ-0000ps-5M; Mon, 20 Jan 2025 15:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874984.1285310; Mon, 20 Jan 2025 15:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZtoQ-0000nc-2i; Mon, 20 Jan 2025 15:35:38 +0000
Received: by outflank-mailman (input) for mailman id 874984;
 Mon, 20 Jan 2025 15:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tZtoP-0000nU-9f
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 15:35:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30cefac5-d744-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 16:35:35 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso32896365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 07:35:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c475csm206068965e9.20.2025.01.20.07.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 07:35:34 -0800 (PST)
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
X-Inumbo-ID: 30cefac5-d744-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737387334; x=1737992134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvXlhcaAtilLlQfU3BTOUNloWLtSLhanA/kAgU+qBAI=;
        b=fJFzCQvsbkkkem4uZPt82FXtFzV2wp6f8JJcEYDHH/zM69sSlyacRiKhu8NICLxgFJ
         szgHbZ2nbLs0Bi1nPWcgXoyzUbSUgxtv8bJ44szJ3dnaEZXw0j9BBMY5R7M17y5abCeQ
         Wf0IGnrRGsH+sgBlkL7IKRpI60NvcBGECtxIku77NzgK7kpz58SIskdbFfZz7IKMwQ3A
         U7F4agcmt3CUZ0uYS+7IFOrltGxp0YsgZmqEyMbbARig4l9OEi8wl+92nFLVDYMGfraJ
         qn/50qV+C4VjawcnnGAe+wWo9Vit1Q51CV08Kvc1SHo/l5MCCPa4uUI7ncJOmt+I6MDE
         t6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387334; x=1737992134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvXlhcaAtilLlQfU3BTOUNloWLtSLhanA/kAgU+qBAI=;
        b=TiM2uY/ujqP5nVbdB5hGgn0prelms5HXqghiW7IshpfDfBzi1HIzl8Qmo6sn5U8qTZ
         4SjuYf+XsIezN/tcSiWlL2pBRFxG2N1CsZ6GNvdtPkf+eyxYt+GhsLoce4umQ+gEHfaF
         Vnar1A3Ksixk0Rqx6DGHW+uE2VLa6ed4AcUgaNlASspJgh5T8LxNETgjV+CNb47kCRea
         9W2kINDmo5TrVcHCRUBq9bsGoj0v0vAWJPV2T3+Hczz6EbQRaZCIb9y3sfQoG0OTqJoR
         xf1AF74UD+haoSnIEzFWQO+KHF8YWhSW+z4Q+krePlkKJku4gmfyQ14pn5syWFe5NjVe
         dk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgNsxhh5F4S3ieBTjzth73swm2BmjKeYgWVjYE8kYdk9Oxs8chFrjNg5LmPHGTNgHor4TVOR6wYcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQbyR62n1KsfwuVrIP8e6UKWNW7KgHp7NoDAl4cgL74hZc3r9W
	Sxmg1K35bSwlpS5LpFR21x8RrZk+HrA7HXmTfjTM6xG4Pjg33h61tbcR2MptKA==
X-Gm-Gg: ASbGncsFAoPNA4i9SD5lPzBmPkE1axSRrWqeTC1nfYAKSNVDGNboxjzY01DjNP2A0xA
	ZNfpxyzOw3m+K6EMh1i9d0g02ZMOJrCeMp8mt15n/yPKoRy0eO8Zwxv8E+wj96TuruSln5xtMfM
	aZfdyv4+Oo5PyPRR8X6KyEBFhjM3fY+mPXa/6sU+Bn32R0CePq8YSJk+7jMeNSQOPxiCJZBfpeT
	JcAVZwW264Qw9Nsb2POKDdZ7B7OyH2gFUWk9YPWnOGmJFThvHhRFCvyGCK8Vc8gvIQryzcUjLHy
	a8QX2CvuZon8CRmlZprXSmjL+/TgGKZR5tvz6qTDUqmZugpoH1gGW9k=
X-Google-Smtp-Source: AGHT+IE5ipjHq7F9TG/oz+jCJmBEWQtDtV1iDJltR/psCLN2WsjGGTfT+/aUO344TL0m0x4V0Df4jQ==
X-Received: by 2002:a05:600c:4e4f:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-438913bf92cmr148742105e9.5.1737387334505;
        Mon, 20 Jan 2025 07:35:34 -0800 (PST)
Message-ID: <3e535294-8e68-476f-9958-d8c870f85f7c@suse.com>
Date: Mon, 20 Jan 2025 16:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2025 04:26, Jiqian Chen wrote:
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,135 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.

Nit: This has now gone stale.

> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    unsigned int index;
> +    struct vpci_bar *bar = data;
> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> +
> +    if ( bar->enabled )
> +    {
> +        /*
> +         * Refuse to resize a BAR while memory decoding is enabled, as
> +         * otherwise the size of the mapped region in the p2m would become
> +         * stale with the newly set BAR size, and the position of the BAR
> +         * would be reset to undefined.  Note the PCIe specification also
> +         * forbids resizing a BAR with memory decoding enabled.
> +         */
> +        if ( size != bar->size )
> +            gprintk(XENLOG_ERR,
> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
> +                    &pdev->sbdf);
> +        return;
> +    }
> +
> +    if ( !((size >> PCI_REBAR_CTRL_SIZE_BIAS) & bar->resizable_sizes) )
> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, size);
> +
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +
> +    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;
> +    pci_size_mem_bar(pdev->sbdf, PCI_BASE_ADDRESS_0 + index * 4, &bar->addr,
> +                     &bar->size, ((index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
> +                                  PCI_BAR_LAST : 0));

Nit: Imo it's unhelpful to the reader if you put multiple arguments on a single
line, when the final one then needs wrapping across lines. (Putting multiple
arguments on a single line is fine of course when they fully fit.)

> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -459,6 +459,7 @@
>  #define PCI_EXT_CAP_ID_ARI	14
>  #define PCI_EXT_CAP_ID_ATS	15
>  #define PCI_EXT_CAP_ID_SRIOV	16
> +#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
>  
>  /* Advanced Error Reporting */
>  #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
> @@ -541,6 +542,19 @@
>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>  
> +/* Resizable BARs */
> +#define PCI_REBAR_CAP(n)	(4 + 8 * (n))	/* capability register */
> +#define  PCI_REBAR_CAP_SIZES_MASK	0xFFFFFFF0U	/* supported BAR sizes in CAP */
> +#define PCI_REBAR_CTRL(n)	(8 + 8 * (n))	/* control register */
> +#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007	/* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00003F00	/* BAR size */
> +#define  PCI_REBAR_CTRL_SIZES_MASK	0xFFFF0000U	/* supported BAR sizes in CTRL */
> +#define  PCI_REBAR_CTRL_SIZE_BIAS	20
> +#define  PCI_REBAR_CTRL_SIZE(v) \
> +            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
> +                     + PCI_REBAR_CTRL_SIZE_BIAS))

On x86 (being 64-bit only) and Arm64 1UL may be good enough here, but
I expect we'll need 1ULL for any 32-bit architecture.

Plus, as indicated before, these two auxiliary #define-s would imo
better be separated from those directly pertaining to the control
register fields (and then also not be padded like those).

Jan

