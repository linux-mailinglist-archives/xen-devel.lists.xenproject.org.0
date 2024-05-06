Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8C8BCD34
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717584.1119944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wvd-00039C-MH; Mon, 06 May 2024 11:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717584.1119944; Mon, 06 May 2024 11:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wvd-000362-JL; Mon, 06 May 2024 11:54:45 +0000
Received: by outflank-mailman (input) for mailman id 717584;
 Mon, 06 May 2024 11:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3wvc-00035C-Ji
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:54:44 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c9be461-0b9f-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:54:42 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso23478321fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:54:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b0041be78ae1f0sm15933188wmn.2.2024.05.06.04.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:54:41 -0700 (PDT)
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
X-Inumbo-ID: 6c9be461-0b9f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714996482; x=1715601282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybB+OrEafTfvjTdX0ZF5+FOZSJMERe67vWiSCm+uFhQ=;
        b=NsCzXzTHD42beaKhXN4YZnXMsXQjTydsaegfUEL1giuWvDkwQR177MTM5n++ueOQSC
         RD1PI6GJOFNXlWzUwwUHlg9LDxe57P4yxVPDiZ+DaLdSsz4AGsdIsRHhuQoobe1RxDlS
         2c195yy+M4pj2vsiFDzzsiYbux/JSssYvh82dyyP819Skr4GAfvhG4VwgtxuWXGMb2GD
         Tmb9gVqCNNNVx5nSczdkcaVeL0NjGsMU95Zk3i4lEJOPzsIHEcnatO7uOFC4gYFTYsut
         xkgMBmQU9GwpdLmjiOHId9QmV5Q/H+k8SXFnagSoawUST3VH0PMp/NnKomo/fUKYdR24
         zPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714996482; x=1715601282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybB+OrEafTfvjTdX0ZF5+FOZSJMERe67vWiSCm+uFhQ=;
        b=Mba8d+Zw0coLKle17aFSeeDW5j5a3NL9KXy2f/kDcon7vDfncpHYxlsbicC/o47nq+
         FJfwnAdEqYPSVvxCCp061yxtZf9o464GRmKP8QuRNeCeaAy6698NueDa3LpVbLlCS8K/
         aIFCyZZF02xEvUEEOu/aOPwMCtC//qonW8aBh3PLXWHFX2SmLGxrV25EOKYOixSSptqa
         q/xaK9JrVTAWWeF1RYe6r4WQm24isIY/BcBlwa0YbYW9qLcx9AoUgZ/VQxHjsezI9JKo
         QNos3Q4+ceCWC/h9VGrX+po67lJGN8MwC7KwfJzR1jB9B5t3q90xI6TpTaKeqUtMqY6p
         njcg==
X-Forwarded-Encrypted: i=1; AJvYcCX+Gqxn4P+iHfLADQshE70tfRd+RgSwZPHvJn8z+VBAPfXLEh1ltKHxEm3aw3yjs9mVF/JDk6cSgr//q4Wv//myFfuQvDtR9v8r9pEgk4w=
X-Gm-Message-State: AOJu0YwRIFzCRHjgUWX8TdzJyRwkNo1kCTICRHVyffy+ZHW20bHXaAuj
	xZY6behlzHFLXJLWNtC7zlppfOm/fWOkmPaUuEDGQ+/VjDB8fup3ovtUUy+k8A==
X-Google-Smtp-Source: AGHT+IF9dsI6Q8fhz+IexT2MYp4Iub5+RHx6SAzPoXOQ5lprLNg5G4WXPI7H1BvzUWFoEz/xDgwIFA==
X-Received: by 2002:a2e:6a01:0:b0:2dd:66ea:5fbd with SMTP id f1-20020a2e6a01000000b002dd66ea5fbdmr7944661ljc.44.1714996481698;
        Mon, 06 May 2024 04:54:41 -0700 (PDT)
Message-ID: <bcfc0da1-5d8a-4e14-be34-89876d668b86@suse.com>
Date: Mon, 6 May 2024 13:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/13] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>  config HAS_KEXEC
>  	bool
>  
> +config HAS_LLC_COLORING
> +	bool
> +
>  config HAS_PIRQ
>  	bool
>  
> @@ -513,4 +516,23 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +	depends on !NUMA
> +
> +config MAX_LLC_COLORS_ORDER

May I ask that you consider dropping MAX_ from here (but keeping "maximum"
in prompt and text), thus ...

> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common code
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + */
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +
> +#define NR_LLC_COLORS          (1 << CONFIG_MAX_LLC_COLORS_ORDER)

... making this look less strange?

To match up with e.g. max_nr_colors you may also want to use 1U here.

> +void __init llc_coloring_init(void)
> +{
> +    unsigned int way_size;
> +
> +    if ( llc_size && llc_nr_ways )
> +    {
> +        llc_coloring_enabled = true;
> +        way_size = llc_size / llc_nr_ways;
> +    }
> +    else if ( !llc_coloring_enabled )
> +        return;
> +    else
> +    {
> +        way_size = get_llc_way_size();
> +        if ( !way_size )
> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");

Since you won't accept way_size == 0 here, how about it ending up zero in
the initial if()'s body? Even more, don't you want to demand
llc_size % llc_nr_ways == 0 there (thus, together with the enclosing
condition, guaranteeing way_size != 0)?

> +    }
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address.
> +     */
> +    max_nr_colors = way_size >> PAGE_SHIFT;
> +
> +    if ( max_nr_colors & (max_nr_colors - 1) )
> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);
> +
> +    if ( max_nr_colors > NR_LLC_COLORS )
> +    {
> +        printk(XENLOG_WARNING
> +               "Number of LLC colors (%u) too big. Using configured max %u\n",
> +               max_nr_colors, NR_LLC_COLORS);
> +        max_nr_colors = NR_LLC_COLORS;
> +    } else if ( max_nr_colors < 2 )
> +        panic("Number of LLC colors %u < 2\n", max_nr_colors);

Ah, here's a check guaranteeing at least the first of the two things asked
about above.

Jan

