Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73102880137
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695467.1085251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbnd-0007Ox-34; Tue, 19 Mar 2024 15:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695467.1085251; Tue, 19 Mar 2024 15:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbnc-0007NQ-Ue; Tue, 19 Mar 2024 15:54:48 +0000
Received: by outflank-mailman (input) for mailman id 695467;
 Tue, 19 Mar 2024 15:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbnb-0007NK-D1
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:54:47 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0244902b-e609-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:54:46 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46cc947929so268709366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:54:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ws4-20020a170907704400b00a46d001a259sm1648839ejb.52.2024.03.19.08.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:54:45 -0700 (PDT)
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
X-Inumbo-ID: 0244902b-e609-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710863686; x=1711468486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCMG9o3i9SKD8VuuFfQOtBVuUDkjdhuaeGZRzJqdvDc=;
        b=SHrFnw6DAL7mVxa0OsGCXbiJFtHHV0tGr7wmSZP7oUnwpEGMRiBQCiNYzevhxv2UwG
         +1t6CBkuAhD1yjBZBGnZLcc7wxZbJqaXXOQsdlLobvRlbJjANqJzPS8K1IUkca1XYFg+
         QkSyFo7jycS0HEHC6rboQAC1q5byDGu89DibDPxGzV7Ie5g9Z0YmtWn5TUimKm1+aMJF
         Swogv6Le78EXUoIsuG4NQQEMlHbLYyg/MpPIlQro6mIVczEgWe+HztTYSX08bZwiTeLA
         7sUhKcq6zRqoY4kyRppJCCRlmwseJGOiAL2b4LQDxjtyLspsZGgtbU1ad+cPGgApgUrE
         /QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863686; x=1711468486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCMG9o3i9SKD8VuuFfQOtBVuUDkjdhuaeGZRzJqdvDc=;
        b=C8UqvRStmKDRo3L6fUSUEAFz5Ca4oJhinaciNErgODw2OLrdqnKSisxiy5FXSt+i+R
         8FcBwbKIpDOCDE3ucROGcbFMuh+MdpmuK8jcfPlXoqAIn6IYQLVUNoOjSBou6GlnZZxz
         ZYs+rp0oS16AMoUwiWWs3qnwkDnzYbKxVgmqmv/DXmx+qBj1f4+XuILByiz2NLifgp7P
         a8JiIbc26IGprial+BDwnWDvDmKQkkk1AHdYtni32ZA78cYzHNrPSoWSyUHah4tR51H1
         aaf7jDqXKqmWcPHQxmYddRbllAuwWu/Vr4/1JhKob1g7xDKlPMycldku1ohuE6+V/gQV
         9McA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3c7FYLIY4CG+fbVSRtoGgJ8t+k8aYmQuIgxbLgzy+8pfe6h5SMwppj/OjOANITuLSIf3HG74ugC2W3wZ6luGnxO0r9RrZS3XdabIkoc=
X-Gm-Message-State: AOJu0YxKcaPYJuwRu2mEQja26Q9C4oSlFeMFguGIGv8nwAtub5FGWxeM
	RCXWiqbIKdG0C+oX1s2DsrwGRqRiEDClOO1l777BjI82M4uql9VcXcyDPWxsiQ==
X-Google-Smtp-Source: AGHT+IGtggdMIj0TfVDM92nwrSzR3gxOXogHrXoyTDIISwSHpdLVi52wiL9qXuS0uG2hdH5RuIjFig==
X-Received: by 2002:a17:906:d10e:b0:a46:d49d:eebb with SMTP id b14-20020a170906d10e00b00a46d49deebbmr2361766ejz.16.1710863685829;
        Tue, 19 Mar 2024 08:54:45 -0700 (PDT)
Message-ID: <094ace88-eea9-4527-b166-9cd83214928d@suse.com>
Date: Tue, 19 Mar 2024 16:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/14] xen/arm: add Xen cache colors command line
 parameter
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-13-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:59, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add a new command line parameter to configure Xen cache colors.
> These colors can be dumped with the cache coloring info debug-key.
> 
> By default, Xen uses the first color.
> Benchmarking the VM interrupt response time provides an estimation of
> LLC usage by Xen's most latency-critical runtime task. Results on Arm
> Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
> reserves 64 KiB of L2, is enough to attain best responsiveness:
> - Xen 1 color latency:  3.1 us
> - Xen 2 color latency:  3.1 us
> 
> More colors are instead very likely to be needed on processors whose L1
> cache is physically-indexed and physically-tagged, such as Cortex-A57.
> In such cases, coloring applies to L1 also, and there typically are two
> distinct L1-colors. Therefore, reserving only one color for Xen would
> senselessly partitions a cache memory that is already private, i.e.
> underutilize it.

Here you say that using just a single color is undesirable on such systems.

> The default amount of Xen colors is thus set to one.

Yet then, without any further explanation you conclude that 1 is the
universal default.

> @@ -147,6 +159,21 @@ void __init llc_coloring_init(void)
>          panic("Number of LLC colors (%u) not in range [2, %u]\n",
>                max_nr_colors, CONFIG_NR_LLC_COLORS);
>  
> +    if ( !xen_num_colors )
> +    {
> +        unsigned int i;
> +
> +        xen_num_colors = MIN(XEN_DEFAULT_NUM_COLORS, max_nr_colors);
> +
> +        printk(XENLOG_WARNING
> +               "Xen LLC color config not found. Using first %u colors\n",
> +               xen_num_colors);
> +        for ( i = 0; i < xen_num_colors; i++ )
> +            xen_colors[i] = i;
> +    }
> +    else if ( !check_colors(xen_colors, xen_num_colors) )
> +        panic("Bad LLC color config for Xen\n");

This "else" branch again lacks a bounds check against max_nr_colors, if
I'm not mistaken.

Jan

