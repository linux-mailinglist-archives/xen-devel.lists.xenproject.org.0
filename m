Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D58C13C6B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 10:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152017.1482559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfw9-00052l-5a; Tue, 28 Oct 2025 09:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152017.1482559; Tue, 28 Oct 2025 09:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfw9-00050U-2S; Tue, 28 Oct 2025 09:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1152017;
 Tue, 28 Oct 2025 09:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDfw8-00050M-BZ
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 09:24:16 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df312361-b3df-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 10:24:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so32680135e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 02:24:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd03585esm184085765e9.6.2025.10.28.02.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:24:14 -0700 (PDT)
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
X-Inumbo-ID: df312361-b3df-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761643455; x=1762248255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ilp/syw6EMwLbpimPSma/qpX5NLdKN/BpZo3UApmSAA=;
        b=dwwtmWiu3bRDvyZvO1H/Z7dKJ0t6lcUk7ltypNUD37chC8ffkBusxbUGRNC7D55t12
         FoRat7YU3+4//uOY6gW0PKWSs22OlkEJo1OmY2UWfsmhOD6YEpYAlEs8Z/igbQU5M5xX
         8OG8xwi0ngUZXP9GvDKduZYSux+pnml9N1+fwp2FCP1Vg766sSb0tFAPg/NbrPM95k37
         burjz3i/4fzrX7tvgqzHJIdWZko3uFWY1JnM9IFup00lr8fVBjsuQM6ICAFE/Q88QVTz
         3sqdUxCslk49OiN8qOtNqhbBR4seJ5SflgNTFowiZu5UdY1i2gxMl+Mrn5ieMcLC+ymN
         NHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643455; x=1762248255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilp/syw6EMwLbpimPSma/qpX5NLdKN/BpZo3UApmSAA=;
        b=WkrnXyeVWCICI8CgHJet+bNx5wZ6jPAJMRI0x+LiAoGJnwasyp2qe6N0Fciyhs9pU9
         iXGZ+3QMAzXbw3b/zHji0qAP1ksOtNLp2fbLOQbmlWDhLus2hx61YquSbNJURqtuX8oT
         FhDzH17cDbkgD1VdEbR7xzKTfAA2aYHIT1vUHdA1+2n4PNOuI00BkEIOSaFDkDDkXnmt
         nwrRh8ag29RuKSeRVVgU9uqvGBH1931wpKJGWxXt/lXJwkNBqhK4E0i5bL+HLZeb2rRU
         0JthwAelbnupdeZtvCN6RBw7s/UnDXa3r2aaRvIFpNqXDr9AwLwel3r6vLwQ8LK3hA9Y
         yTjA==
X-Forwarded-Encrypted: i=1; AJvYcCUL8hkld7nDoxKwAyxw3xfXush6kcUREROrSFKH9lC1iT16Cg8CkWPcdXJd/1Noud4kw+MQTYg2tOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7IA1dHwQE5uF1RFlkHPVUprtKy9j/WJbMtbLcr1+WNTgNQq5y
	6N53rn5meSstAp8YowNi2A+Nnp04dnwSjPMHnPfGizBO53xgThy0aDAcAi7bB8c1Mrk6ApiSXEP
	7jFU=
X-Gm-Gg: ASbGncvnMA6xMYbeWuNCya6I+rhm4uqH59r1L+G+vIwi6yBsM1WC9Ve/NdE1Klp6Heu
	1klf/o82ZIlZLcdnHn2h1u/Z1GZc6t3h+Z7I7v/3r/z8WqD3knrZ6RFIVMMUkSoMVqSvteAKiGn
	sjTM1vuDEWHqmbXAKI/xczUgdRjtbATExPQuKfFWk5ZZncZ3VSwrWKvUiUPcwDnPyChsB6L2TdB
	ISFnH2FQuj34yAXEOw3PeZAKvYPz7hj+Zzky4knKb3SkrKhXk5obrONCF6wFms6BQuetTJ2pKpj
	Sk4Z02Ro/Kh941mN9VVuuMxEjU+/QzVwshB6eZODb2wJrPiu04TrZBI7F+7ujmHBmJltAkJNsyB
	9j5UCNW/XMoZdcZI8QwnUgHDuNjokAt1q7M4xldIfJnZS5p99dHZQMaOLL5M5GPX0l339E0P9gI
	32av8pNrwsj25iSyf7pImmGyhVZefCWdzkgOSafmHjC4dcmnzLmTP1yAvxiILY
X-Google-Smtp-Source: AGHT+IG3eWynB5nfoV6dvVAdktBCd29QGFjpuFDh+4bvATPO7N4mw1+L4Byc7VNc73vmSduP8PIlXQ==
X-Received: by 2002:a05:600d:4350:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-47719aa4365mr7781995e9.25.1761643454783;
        Tue, 28 Oct 2025 02:24:14 -0700 (PDT)
Message-ID: <6dcbb451-7c2e-434b-a125-1abf932ce0d0@suse.com>
Date: Tue, 28 Oct 2025 10:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 2/2] tools: Introduce xen-inteltemp tool
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <acb887d5df692aa143cb2b509dd362b7b46c158e.1761585640.git.teddy.astie@vates.tech>
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
In-Reply-To: <acb887d5df692aa143cb2b509dd362b7b46c158e.1761585640.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 18:26, Teddy Astie wrote:
> Introduce a new tool to fetch Intel CPU temperatures through the
> Intel DTS interface using XENPF_resource_op hypercall.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  tools/misc/.gitignore      |  1 +
>  tools/misc/Makefile        |  4 ++
>  tools/misc/xen-inteltemp.c | 98 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 tools/misc/xen-inteltemp.c

Instead of introducing a new tool, might this not fit in xenpm?

> --- /dev/null
> +++ b/tools/misc/xen-inteltemp.c
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen-inteltemp.c
> + *
> + * Get the CPU temperature of Intel processors.
> + *
> + * Copyright 2025 Teddy Astie <teddy.astie@vates.tech>
> + */
> +
> +#include <stdio.h>
> +#include <errno.h>
> +#include <xenctrl.h>
> +
> +#define MSR_IA32_THERM_STATUS         0x0000019c
> +#define MSR_IA32_TEMPERATURE_TARGET   0x000001a2
> +#define MSR_IA32_PACKAGE_THERM_STATUS 0x000001b1
> +
> +int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[2] = {
> +        (xc_resource_entry_t){
> +            .idx = package ? MSR_IA32_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS
> +        },
> +        (xc_resource_entry_t){ .idx = MSR_IA32_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = 2,
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    if ( ret <= 0 )
> +        /* This CPU isn't online or can't query this MSR */
> +        return ret ?: -EOPNOTSUPP;
> +
> +    if ( ret == 2 )
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +    else
> +    {
> +        /*
> +         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume it's 100 which
> +         * is correct aside a few selected Atom CPUs. Check coretemp source code for more
> +         * information.
> +         */
> +        fprintf(stderr, "CPU%d doesn't support MSR_IA32_TEMPERATURE_TARGET, assume "
> +               "tjmax=100°C, readings may be incorrect\n", cpu);
> +        tjmax = 100;
> +    }
> +    
> +    *temp = tjmax - ((entries[0].val >> 16) & 0xff);
> +    return 0;
> +}
> +
> +int main(void)
> +{
> +    int rc = 0, temp, cpu, socket;
> +    bool has_data = false;
> +    xc_interface *xch = xc_interface_open(0, 0, 0);
> +    xc_physinfo_t info;
> +
> +    if ( (rc = xc_physinfo(xch, &info)) < 0 )
> +    {
> +        perror("Getting physinfo failed");
> +        return rc;
> +    }
> +
> +    /* Per socket measurement */
> +    for ( socket = 0, cpu = 0;
> +          cpu < (info.max_cpu_id + 1);
> +          socket++, cpu += info.cores_per_socket * info.threads_per_core )
> +    {
> +        if ( !fetch_dts_temp(xch, cpu, true, &temp) )
> +        {
> +            has_data = true;
> +            printf("Package%d: %d°C\n", socket, temp);
> +        }
> +    }
> +
> +    printf("\n");
> +
> +    for ( cpu = 0; cpu < (info.max_cpu_id + 1); cpu += info.threads_per_core )
> +    {
> +        if ( fetch_dts_temp(xch, cpu, false, &temp) )
> +            continue;
> +
> +        has_data = true;
> +        printf("CPU%d: %d°C\n", cpu, temp);
> +    }
> +
> +    if ( !has_data )
> +        printf("No data\n");
> +
> +    xc_interface_close(xch);
> +    return 0;
> +}
> \ No newline at end of file

Please never introduce files without trailing newline.

Jan

