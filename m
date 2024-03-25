Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D643C88A637
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697783.1088887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rom6s-0003O6-2J; Mon, 25 Mar 2024 15:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697783.1088887; Mon, 25 Mar 2024 15:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rom6r-0003Lu-Vw; Mon, 25 Mar 2024 15:19:37 +0000
Received: by outflank-mailman (input) for mailman id 697783;
 Mon, 25 Mar 2024 15:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rom6r-0003Lo-0M
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:19:37 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16acb7f2-eabb-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 16:19:35 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-515a68d45faso1844008e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:19:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020a170906234a00b00a46ee3c31afsm3112270eja.154.2024.03.25.08.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:19:34 -0700 (PDT)
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
X-Inumbo-ID: 16acb7f2-eabb-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711379975; x=1711984775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkD5xjq/lPrBeG2KyUl1he/l9o1Obf7BcHZmc61sR2A=;
        b=fafIrFCPR7tabjClRLyYZEDRvxn3oheKR4HiKWGYrgNtDFB4tYz7QJA2Fnru5kkaCV
         tvWZXVldyLyUxmDA4g6/azDeuyy9f8HKnFEa0Gr03hOKxm7K1fTtWEL8NSf6SW0oZ7Sh
         9RdciXxoqP+vQxwsUFg0CyMcnsrgCj+UA5FqJds9GVgTPi5Db5IcDppNLheTpOBmSb7X
         G1f8in9Yy5IQPE7xu2d+W/N/4SilKgPj1vH5bstztPbu6SJGacRe84t78FLQGb9sjo1P
         wvw2e3dTwr0L+FLB432bV4cONaNlXgrRLegOthhDH2Y04/hI0IlNOL/9wviTLiXpRHnB
         exng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711379975; x=1711984775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkD5xjq/lPrBeG2KyUl1he/l9o1Obf7BcHZmc61sR2A=;
        b=Y/MVpcj46nZJ7GPthiVtfGd3EoP16I8iWDOyJmVLlzpQmvP3RqOHwcdrWn4EgUEgQX
         jq3NV2ib3+M8tDfjR6XocEJ7G8Lxm/VS9Xyc63CdX9tk1UoybB2z570egNdK1+fzoeUb
         kzl5gYM+Pbo4Kvf/Ev2p0pk1LlE1vYEktL0LX/0F12t8fo50ec97ej4Zq5/UV+5Qh5CV
         RAWjYMxIEDXtVsZD7hqM73gigSamfh+z6NLlCHIFrzIuvkwttosHHDmM8apoxrBefi+r
         YEx3sr+A3aZphR15wYyTrie4cy08R3ygpT/nlJronC0dpfcWVFR0Sq+BqBzXEPJC0oRc
         gWHg==
X-Forwarded-Encrypted: i=1; AJvYcCUlcikMF364GoaSa0ofXQOjwhmdkNae9QECdZZ/xr0JL/Af6zRbMTbhvim7CaEbvJXx5yfciN76kyuwM5Nbzz94zu14gz2sPdB1uAsNvKA=
X-Gm-Message-State: AOJu0Yyxjnvt6IWwODvHBEMQgcaBggwiBpCbvO/vwzUbyjSyo6WLWu0y
	ukIpcCT/L0Q0xwTx9p1CgY44qmOTowVctHoEbUf2RyX+k9WrGHIID1Q+mJ/C8Q==
X-Google-Smtp-Source: AGHT+IF6+t7EsKL4ves9dwN5Bf851GclUKe5HUVTqNZRakjJFPwWVQIJhUW+z0Xq+LRlX1gDHJbcFA==
X-Received: by 2002:a05:6512:4845:b0:514:b4ca:f478 with SMTP id ep5-20020a056512484500b00514b4caf478mr4575458lfb.39.1711379975128;
        Mon, 25 Mar 2024 08:19:35 -0700 (PDT)
Message-ID: <a6147b83-97e8-4c73-982c-221178b951f5@suse.com>
Date: Mon, 25 Mar 2024 16:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] xen/asm-generic: Introduce generic acpi.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <794e46b16475c0b4f482cdc8560ebb2f37875715.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <794e46b16475c0b4f482cdc8560ebb2f37875715.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> Introduce a generic acpi.h header that provides the required definitions
> to allow files including xen/acpi.h to be compiled. The definitions were
> largely derived from the !CONFIG_ACPI parts of ARM's acpi.h.

As said a couple of times in discussion with Oleksii on his work towards
populating asm-generic/, I view a use like this as an abuse of this
asm-generic machinery. Instead imo said !CONFIG_ACPI parts from Arm's header
want moving to xen/acpi.h, eliminating the need for asm/acpi.h for
architectures / configurations not supporting ACPI. Much like was done
with e.g. xen/numa.h.

Jan

> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +generic-y += acpi.h
>  generic-y += altp2m.h
>  generic-y += device.h
>  generic-y += div64.h
> --- /dev/null
> +++ b/xen/include/asm-generic/acpi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_ACPI_H
> +#define __ASM_GENERIC_ACPI_H
> +
> +#include <asm/page.h>
> +#include <xen/types.h>
> +
> +#ifdef CONFIG_ACPI
> +#error "asm-generic acpi.h can't be used with CONFIG_ACPI set"
> +#endif
> +
> +#define COMPILER_DEPENDENT_INT64   int64_t
> +#define COMPILER_DEPENDENT_UINT64  uint64_t
> +#define ACPI_MAP_MEM_ATTR          PAGE_HYPERVISOR
> +
> +#define acpi_disabled (true)
> +#define disable_acpi()
> +#define enable_acpi()
> +
> +#endif /* __ASM_GENERIC_ACPI_H */


