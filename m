Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F4844383
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674098.1048801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCyH-0003xT-Ba; Wed, 31 Jan 2024 15:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674098.1048801; Wed, 31 Jan 2024 15:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCyH-0003v7-8l; Wed, 31 Jan 2024 15:57:53 +0000
Received: by outflank-mailman (input) for mailman id 674098;
 Wed, 31 Jan 2024 15:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVCyF-0003v1-LI
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:57:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac4816f-c051-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 16:57:48 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ae74e5394so2233441f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 07:57:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bj12-20020a0560001e0c00b00337d6f0013esm10453006wrb.107.2024.01.31.07.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 07:57:47 -0800 (PST)
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
X-Inumbo-ID: 7ac4816f-c051-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706716667; x=1707321467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0wiqQQMfWO4JHT5/WmmU32IHcJ3aZ5LAcAlOufcPwQ=;
        b=JvCLf1BGjGqU5xFRJlcsOV/Ni0/1XoS9+y5jjADlAa56p3/XYwMKiLOHqhG3lJS2HJ
         +j9AJ0/PYcZDhj/9NkvB7KJryXBcrp/hb6cxurkXwl4vv5K2CamNZM8RcV6cnc4WiFhY
         DNgyv/fhQWk3DcyqkSXQ6Vvv4lFPIKe/exqbkX4xxFsVv6tIDuMfB6tpLir6m4yYFUhd
         P8EZfk9V1hoDYp+J+Ggaeb8duKWEm/uKKV/Ubp4/x/dZ0+iAPIN5dfGTK7T2EcrloopL
         Lixb3++90CL+E0azFvEZ1Enicn+GmUZvYOEiyFC4K3/L8egYhSmKTdvtLfLUuyEcmCYj
         pU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716667; x=1707321467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0wiqQQMfWO4JHT5/WmmU32IHcJ3aZ5LAcAlOufcPwQ=;
        b=B3WPRpp2fODEPJ+WBVvHTYIgrr5Gtk4S2B307RDR/djI6E+QHqxlYyCxw2oN7VYenV
         xvVSmRayjS5NRKI6eUANhygEWEVI5IpjxW3iSEPLb77w7T2jYVeByXgkBA7yx8lnofmg
         Xp5fWctpGThIIkTi62NXlPIpD9QGaju9aYshXXy2JD5MhiD2ab4CZTYmP7B34+nx/c7/
         4lK+U8tLU7TZTUVipMLBJEuUSnGy/gGdZZD7nn8Yvh6uKEqALV32uDWCSCflXuh8F+A0
         Wyf77crnsdwLvVGpsdnHUCKvIxBRgDJk1XJJfchWZ8hN1gBV3qUwpxyYCuEST6UGERwJ
         9d2A==
X-Gm-Message-State: AOJu0YxxVv1q1OCJMOcU96KPdNIMYFmRtgsxooNBClDKQNc9OgHAEZ78
	4ep5lGUlNHwyLqLdDhXzoM+n/jdYkvLbpFez34pmVhoMaUUd432VCrJZncfexA==
X-Google-Smtp-Source: AGHT+IGjQt9Y4LRPuyR8mGYnYf6NxY2c7aA3nC0MB7NydLW0eHbleLZtA5juAifK4A3LTqq5902Y9Q==
X-Received: by 2002:a5d:408e:0:b0:33a:fcc2:d84b with SMTP id o14-20020a5d408e000000b0033afcc2d84bmr1468510wrp.7.1706716667522;
        Wed, 31 Jan 2024 07:57:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUJfm8AwwMVmiEm1CC/DDrekHDjL9IcYfQSBOEZ2Ga4U77AkaXKhr9PnSOCtEvCDGovmCxUuqZ50qG5ku6nZYNOa/PElx/i1rJFa+rHqceDj/FkX/QIpjxm5O20h+IT+7hGlq2rqS9i9WI/4KkWGRIxV+3+UnNPAUw9ASZ47K89Mz44sPYxinuEut23kLz+vRXisi62rlQocsS1AL6V0ib3kQ5ma17WlV4pgulIEJA9ybJPbAkvNSfx9smtsJRZ5L6BXdTeb25qp5RG1e09+8DVbJ7zXMjf
Message-ID: <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
Date: Wed, 31 Jan 2024 16:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:17, Carlo Nonato wrote:
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors. Since not all architectures can actually
> implement it, add a HAS_LLC_COLORING Kconfig and put other options under
> xen/arch.
> 
> LLC colors are a property of the domain, so the domain struct has to be
> extended.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v6:
> - moved almost all code in common
> - moved documentation in this patch
> - reintroduced range for CONFIG_NR_LLC_COLORS
> - reintroduced some stub functions to reduce the number of checks on
>   llc_coloring_enabled
> - moved domain_llc_coloring_free() in same patch where allocation happens
> - turned "d->llc_colors" to pointer-to-const
> - llc_coloring_init() now returns void and panics if errors are found
> v5:
> - used - instead of _ for filenames
> - removed domain_create_llc_colored()
> - removed stub functions
> - coloring domain fields are now #ifdef protected
> v4:
> - Kconfig options moved to xen/arch
> - removed range for CONFIG_NR_LLC_COLORS
> - added "llc_coloring_enabled" global to later implement the boot-time
>   switch
> - added domain_create_llc_colored() to be able to pass colors
> - added is_domain_llc_colored() macro
> ---
>  docs/misc/cache-coloring.rst      | 87 +++++++++++++++++++++++++++++++
>  docs/misc/xen-command-line.pandoc | 27 ++++++++++
>  xen/arch/Kconfig                  | 17 ++++++
>  xen/common/Kconfig                |  3 ++
>  xen/common/Makefile               |  1 +
>  xen/common/keyhandler.c           |  3 ++
>  xen/common/llc-coloring.c         | 87 +++++++++++++++++++++++++++++++
>  xen/include/xen/llc-coloring.h    | 38 ++++++++++++++
>  xen/include/xen/sched.h           |  5 ++
>  9 files changed, 268 insertions(+)
>  create mode 100644 docs/misc/cache-coloring.rst
>  create mode 100644 xen/common/llc-coloring.c
>  create mode 100644 xen/include/xen/llc-coloring.h
> 
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> new file mode 100644
> index 0000000000..9fe01e99e1
> --- /dev/null
> +++ b/docs/misc/cache-coloring.rst
> @@ -0,0 +1,87 @@
> +Xen cache coloring user guide
> +=============================
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
> +
> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
> +
> +If needed, change the maximum number of colors with
> +``CONFIG_NR_LLC_COLORS=<n>``.
> +
> +Compile Xen and the toolstack and then configure it via
> +`Command line parameters`_.
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g .hosting another DomU). Cache coloring allows eliminating this
> +mutual interference, and thus guaranteeing higher and more predictable
> +performances for memory accesses.
> +The key concept underlying cache coloring is a fragmentation of the memory
> +space into a set of sub-spaces called colors that are mapped to disjoint cache
> +partitions. Technically, the whole memory space is first divided into a number
> +of subsequent regions. Then each region is in turn divided into a number of
> +subsequent sub-colors. The generic i-th color is then obtained by all the
> +i-th sub-colors in each region.
> +
> +::
> +
> +                            Region j            Region j+1
> +                .....................   ............
> +                .                     . .
> +                .                       .
> +            _ _ _______________ _ _____________________ _ _
> +                |     |     |     |     |     |     |
> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                    :                       :
> +                    :                       :...         ... .
> +                    :                            color 0
> +                    :...........................         ... .
> +                                                :
> +          . . ..................................:
> +
> +There are two pragmatic lesson to be learnt.
> +
> +1. If one wants to avoid cache interference between two domains, different
> +   colors needs to be used for their memory.
> +
> +2. Color assignment must privilege contiguity in the partitioning. E.g.,
> +   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
> +   assigning colors (0,2) to I and (1,3) to J.

I can't connect this 2nd point with any of what was said above.

> +How to compute the number of colors
> +***********************************
> +
> +To compute the number of available colors for a specific platform, the size of
> +an LLC way and the page size used by Xen must be known. The first parameter can
> +be found in the processor manual or can be also computed dividing the total
> +cache size by the number of its ways. The second parameter is the minimum
> +amount of memory that can be mapped by the hypervisor,

I find "amount of memory that can be mapped" quite confusing here. Don't you
really mean the granularity at which memory can be mapped?

> thus dividing the way
> +size by the page size, the number of total cache partitions is found. So for
> +example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up
> +to 16 colors when pages are 4 KiB in size.

I guess it's a matter of what one's use to, but to me talking of "way size"
and how the calculation is described is, well, unusual. What I would start
from is the smallest entity, i.e. a cache line. Then it would be relevant
to describe how, after removing the low so many bits to cover for cache line
size, the remaining address bits are used to map to a particular set. It
looks to me as if you're assuming that this mapping is linear, using the
next so many bits from the address. Afaik this isn't true on various modern
CPUs; instead hash functions are used. Without knowing at least certain
properties of such a hash function, I'm afraid your mapping from address to
color isn't necessarily guaranteeing the promised isolation. The guarantee
may hold for processors you specifically target, but then I think in this
description it would help if you would fully spell out any assumptions you
make on how hardware maps addresses to elements of the cache.

> +Cache layout is probed automatically by looking at the CLIDR_EL1 arm register.
> +This means that other system caches that aren't visible there, are ignored.
> +The possibility of manually setting the way size is left to the user to overcome
> +failing situations or for debugging/testing purposes. See
> +`Command line parameters`_ for more information on that.
> +
> +Command line parameters
> +***********************
> +
> +More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
> +
> ++----------------------+-------------------------------+
> +| **Parameter**        | **Description**               |
> ++----------------------+-------------------------------+
> +| ``llc-coloring``     | enable coloring at runtime    |
> ++----------------------+-------------------------------+
> +| ``llc-way-size``     | set the LLC way size          |
> ++----------------------+-------------------------------+

As a result of the above, I also find it confusing to specify "way size"
as a command line option. Cache size, number of ways, and cache line size
would seem more natural to me.

I'll get to looking nat the actual code later.

Jan

