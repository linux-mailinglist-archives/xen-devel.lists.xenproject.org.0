Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5F9F2E84
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857718.1269934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8hC-0002ow-HZ; Mon, 16 Dec 2024 10:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857718.1269934; Mon, 16 Dec 2024 10:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8hC-0002nX-DP; Mon, 16 Dec 2024 10:51:26 +0000
Received: by outflank-mailman (input) for mailman id 857718;
 Mon, 16 Dec 2024 10:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8hA-0002kq-OF
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:51:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af67b0ee-bb9b-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 11:51:21 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so26785205e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:51:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436362c8fbasm80586165e9.44.2024.12.16.02.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 02:51:19 -0800 (PST)
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
X-Inumbo-ID: af67b0ee-bb9b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734346280; x=1734951080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ZI0HEEOzwUl1IvW7tceorT+M4QEr+GcDshLLfHT50=;
        b=UyxV1Wh7nk4ywFbiuOG6BRR8Jdy9X1OeDaFm08uT1gJxS+Col7Hj3PnSc01wYlpmpx
         sMlP+N6YQRgYxE+Dyz95QO8EpIg5zZP635gLA7I+6hXpJU/M+KY5tYGNonDF9ZsHtIom
         DNXBngmv5nxMPs2aRbp23diY6Cqckc9TXWs1Ory9lLjcB8SWI8CN5MXJKzn4pg6K77//
         3Y2Lr6Xvw+e8ogbcyhVt4udpNUi6nNmK1twUQFMkwVcEZ5TPrIm8u5JLjOmpsFfjiGYA
         t1m5RtwGTBRks4dtvTN+TTKWApRBIfTMN0kS8WmGLp0NFFiLn2QgX4IDCI4vWMbwYxDj
         6IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346280; x=1734951080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0ZI0HEEOzwUl1IvW7tceorT+M4QEr+GcDshLLfHT50=;
        b=iJgJyMg28gOL6ovMAU2nqg1uhuSe8NuD1fsw/cYgmv6vp4aIte4ztW2agHD2Fkkn3O
         m6b6j31sfROXGM5AKkZ+kGr/3lKXGERBWzawQSxhPWkmdh44/NS3CWak264YiA2OLNSa
         boF0+Pl4AjRCUVjSg7naj9yJbrDKVVXcbmhddOqGtJrJdZJtN1Em4eNxUudWoIa9Sf1B
         LSEvgwoRtjEVnUHcdTGdAaKMYunI3coEan9ypNF7wG0c+k4Gww48BewtQ5tQAAV4BNU6
         r2C+P+BqyhP6NfLHgzf7CbfMIqUErjz4aoxBjeKJ4YXY9sPFEzQdB1mdpNpmOm219eqk
         xLJg==
X-Forwarded-Encrypted: i=1; AJvYcCXlL0hVZtGnLGEfa7uu4vfzVRyTWAzo2t76+bt3DCE1DpfmOstLM5RT0x1bz2z8Bf0UU/FUwiyXlVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWzNyvJrgPkr91OSWx94cuZ3CwynHkZcNp2bSlLa3TymZrySUc
	RCbRZWkuKGfTswiEWgxr4j0zmxwOj9SQQMKKzX0MP30DtcHAKbZ46UEestKiLA==
X-Gm-Gg: ASbGncuuUndR8Q5xzqXmvxZ6mHrXalEvVvsmBNhKjFv+DWB8s8OrERMbkXeN3XvnrnY
	LHNvWbB8dDylZoavrvKgbSIAXfzMoXimIIdXesWlEqa/dgi+z3lhMKwR0zIKNBWJ8zKzyBI9RdQ
	hFdaodLP9Ep4lsYh/Oh9ySeGd0hbnnVX09kzvIl4JqhlMIZApgasj11XUYmIusksgv2L2uvNhGf
	jNHzb5pb7O3glaJN6EoAehxAzp0+ywtrtlMK9yGNfiJOEVdmjiHbhC9DYsojgoCuAVUVmJhap/n
	au1uE6VRRehTy7JLGiadAWnaaU++AMOdA3/ia1n9zw==
X-Google-Smtp-Source: AGHT+IGTIWGR9C8KMv5jmcovA1i/4F1juPg9gXNuS+70r7bq6JRpLdoUOmlTRrb2TPWdFFpvfJ5OLg==
X-Received: by 2002:a05:600c:1c82:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-4362aa944bbmr92086365e9.24.1734346280207;
        Mon, 16 Dec 2024 02:51:20 -0800 (PST)
Message-ID: <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
Date: Mon, 16 Dec 2024 11:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241213162815.9196-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 17:28, Carlo Nonato wrote:
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors.
> 
> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
> Kconfig option.
> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
> because that's the number of colors that fit in a 4 KiB page when integers
> are 4 bytes long.
> 
> LLC colors are a property of the domain, so struct domain has to be extended.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Acked-by: Michal Orzel <michal.orzel@amd.com>
> ---
> v12:
> - fixed build errors
> - added opt_llc_coloring to improve readibility
> - reverted llc_coloring_enabled type to bool
> v11:
> - __COLORING_H__ -> __XEN_LLC_COLORING_H__ in llc-coloring.h
> - added SPDX tag to cache-coloring.rst
> - llc-coloring=off now takes precedence over other cmdline options
> - removed useless #includes
> v10:
> - fixed commit message to use LLC_COLORS_ORDER
> - added documentation to index.rst
> - moved check on CONFIG_NUMA in arch/arm/Kconfig (next patch)
> - fixed copyright line
> - fixed array type for colors parameter in print_colors()
> - added check on (way_size & ~PAGE_MASK)
> v9:
> - dropped _MAX_ from CONFIG_MAX_LLC_COLORS_ORDER
> v8:
> - minor documentation fixes
> - "llc-coloring=on" is inferred from "llc-nr-ways" and "llc-size" usage
> - turned CONFIG_NR_LLC_COLORS to CONFIG_MAX_LLC_COLORS_ORDER, base-2 exponent
> - moved Kconfig options to common/Kconfig
> - don't crash if computed max_nr_colors is too large
> v7:
> - SUPPORT.md changes added to this patch
> - extended documentation to better address applicability of cache coloring
> - "llc-nr-ways" and "llc-size" params introduced in favor of "llc-way-size"
> - moved dump_llc_coloring_info() call in 'm' keyhandler (pagealloc_info())
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
>  SUPPORT.md                        |   7 ++
>  docs/index.rst                    |   1 +
>  docs/misc/cache-coloring.rst      | 118 ++++++++++++++++++++++++++++
>  docs/misc/xen-command-line.pandoc |  37 +++++++++
>  xen/common/Kconfig                |  21 +++++
>  xen/common/Makefile               |   1 +
>  xen/common/keyhandler.c           |   3 +
>  xen/common/llc-coloring.c         | 124 ++++++++++++++++++++++++++++++
>  xen/common/page_alloc.c           |   3 +
>  xen/include/xen/llc-coloring.h    |  36 +++++++++
>  xen/include/xen/sched.h           |   5 ++
>  11 files changed, 356 insertions(+)
>  create mode 100644 docs/misc/cache-coloring.rst
>  create mode 100644 xen/common/llc-coloring.c
>  create mode 100644 xen/include/xen/llc-coloring.h
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 82239d0294..998faf5635 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -401,6 +401,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
>      Status, x86 HVM: Tech Preview
>      Status, ARM: Tech Preview
>  
> +### Cache coloring
> +
> +Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and Xen
> +itself.
> +
> +    Status, Arm64: Experimental
> +
>  ## Resource Management
>  
>  ### CPU Pools
> diff --git a/docs/index.rst b/docs/index.rst
> index 1d44796d72..1bb8d02ea3 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -66,6 +66,7 @@ Documents in need of some rearranging.
>     misc/xen-makefiles/makefiles
>     misra/index
>     fusa/index
> +   misc/cache-coloring
>  
>  
>  Miscellanea
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> new file mode 100644
> index 0000000000..371f21a0e7
> --- /dev/null
> +++ b/docs/misc/cache-coloring.rst
> @@ -0,0 +1,118 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Xen cache coloring user guide
> +=============================
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
> +Cache coloring realizes per-set cache partitioning in software and is applicable
> +to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CPUs.
> +
> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
> +
> +If needed, change the maximum number of colors with
> +``CONFIG_LLC_COLORS_ORDER=<n>``.
> +
> +Runtime configuration is done via `Command line parameters`_.
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g. hosting another DomU). Cache coloring realizes per-set cache-partitioning
> +in software and mitigates this, guaranteeing more predictable performances for
> +memory accesses.
> +Software-based cache coloring is particularly useful in those situations where
> +no hardware mechanisms (e.g., DSU-based way partitioning) are available to
> +partition caches. This is the case for e.g., Cortex-A53, A57 and A72 CPUs that
> +feature a L2 LLC cache shared among all cores.
> +
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
> +How colors are actually defined depends on the function that maps memory to
> +cache lines. In case of physically-indexed, physically-tagged caches with linear
> +mapping, the set index is found by extracting some contiguous bits from the
> +physical address. This allows colors to be defined as shown in figure: they
> +appear in memory as subsequent blocks of equal size and repeats themselves after
> +``n`` different colors, where ``n`` is the total number of colors.
> +
> +If some kind of bit shuffling appears in the mapping function, then colors
> +assume a different layout in memory. Those kind of caches aren't supported by
> +the current implementation.
> +
> +**Note**: Finding the exact cache mapping function can be a really difficult
> +task since it's not always documented in the CPU manual. As said Cortex-A53, A57
> +and A72 are known to work with the current implementation.
> +
> +How to compute the number of colors
> +###################################
> +
> +Given the linear mapping from physical memory to cache lines for granted, the
> +number of available colors for a specific platform is computed using three
> +parameters:
> +
> +- the size of the LLC.
> +- the number of the LLC ways.
> +- the page size used by Xen.
> +
> +The first two parameters can be found in the processor manual, while the third
> +one is the minimum mapping granularity. Dividing the cache size by the number of
> +its ways we obtain the size of a way. Dividing this number by the page size,
> +the number of total cache colors is found. So for example an Arm Cortex-A53
> +with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when pages are
> +4 KiB in size.
> +
> +Effective colors assignment
> +###########################
> +
> +When assigning colors, if one wants to avoid cache interference between two
> +domains, different colors needs to be used for their memory.
> +
> +Command line parameters
> +***********************
> +
> +Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
> +
> ++----------------------+-------------------------------+
> +| **Parameter**        | **Description**               |
> ++----------------------+-------------------------------+
> +| ``llc-coloring``     | Enable coloring at runtime    |
> ++----------------------+-------------------------------+
> +| ``llc-size``         | Set the LLC size              |
> ++----------------------+-------------------------------+
> +| ``llc-nr-ways``      | Set the LLC number of ways    |
> ++----------------------+-------------------------------+
> +
> +Auto-probing of LLC specs
> +#########################
> +
> +LLC size and number of ways are probed automatically by default.
> +
> +LLC specs can be manually set via the above command line parameters. This
> +bypasses any auto-probing and it's used to overcome failing situations, such as
> +flawed probing logic, or for debugging/testing purposes.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 293dbc1a95..abd8dae96f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1708,6 +1708,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>  record with other registers.
>  
> +### llc-coloring (arm64)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This option is
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-nr-ways (arm64)
> +> `= <integer>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the number of ways of the Last Level Cache. This option is available
> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
> +to find the number of supported cache colors. By default the value is
> +automatically computed by probing the hardware, but in case of specific needs,
> +it can be manually set. Those include failing probing and debugging/testing
> +purposes so that it's possible to emulate platforms with different number of
> +supported colors. If set, also "llc-size" must be set, otherwise the default
> +will be used. Note that using both options implies "llc-coloring=on".
> +
> +### llc-size (arm64)
> +> `= <size>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the size of the Last Level Cache. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
> +the number of supported cache colors. By default the value is automatically
> +computed by probing the hardware, but in case of specific needs, it can be
> +manually set. Those include failing probing and debugging/testing purposes so
> +that it's possible to emulate platforms with different number of supported
> +colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
> +used. Note that using both options implies "llc-coloring=on".
> +
>  ### lock-depth-size
>  > `= <integer>`
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..b4ec6893be 100644
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
> @@ -516,4 +519,22 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +
> +config LLC_COLORS_ORDER
> +	int "Maximum number of LLC colors (base-2 exponent)"
> +	range 1 10
> +	default 7
> +	depends on LLC_COLORING
> +	help
> +	  Controls the build-time size of various arrays associated with LLC
> +	  coloring. The value is a base-2 exponent. Refer to cache coloring
> +	  documentation for how to compute the number of colors supported by the
> +	  platform. This is only an upper bound. The runtime value is autocomputed
> +	  or manually set via cmdline parameters.
> +	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
> +	  more than what's needed in the general case.
> +
>  endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index b279b09bfb..cba3b32733 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -25,6 +25,7 @@ obj-y += keyhandler.o
>  obj-$(CONFIG_KEXEC) += kexec.o
>  obj-$(CONFIG_KEXEC) += kimage.o
>  obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
> +obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>  obj-y += memory.o
>  obj-y += multicall.o
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 6da291b34e..6ea54838d4 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -5,6 +5,7 @@
>  #include <asm/regs.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/param.h>
>  #include <xen/sections.h>
>  #include <xen/shutdown.h>
> @@ -304,6 +305,8 @@ static void cf_check dump_domains(unsigned char key)
>  
>          arch_dump_domain_info(d);
>  
> +        domain_dump_llc_colors(d);
> +
>          rangeset_domain_printk(d);
>  
>          dump_pageframe_info(d);
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> new file mode 100644
> index 0000000000..b0fc162b05
> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common code
> + *
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2024, Minerva Systems SRL
> + */
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +
> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> +
> +/*
> + * -1: not specified (disabled unless llc-size and llc-nr-ways present)
> + *  0: explicitly disabled through cmdline
> + *  1: explicitly enabled through cmdline
> + */
> +static int8_t __initdata opt_llc_coloring = -1;
> +boolean_param("llc-coloring", opt_llc_coloring);
> +
> +static bool __ro_after_init llc_coloring_enabled;
> +
> +static unsigned int __initdata llc_size;
> +size_param("llc-size", llc_size);
> +static unsigned int __initdata llc_nr_ways;
> +integer_param("llc-nr-ways", llc_nr_ways);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init max_nr_colors;
> +
> +static void print_colors(const unsigned int colors[], unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    printk("{ ");
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        unsigned int start = colors[i], end = start;
> +
> +        printk("%u", start);
> +
> +        for ( ; i < num_colors - 1 && end + 1 == colors[i + 1]; i++, end++ )
> +            ;
> +
> +        if ( start != end )
> +            printk("-%u", end);
> +
> +        if ( i < num_colors - 1 )
> +            printk(", ");
> +    }
> +    printk(" }\n");
> +}
> +
> +void __init llc_coloring_init(void)
> +{
> +    unsigned int way_size;
> +
> +    llc_coloring_enabled = (opt_llc_coloring == 1);

Generally I'd suggest to only use > 0, >= 0, < 0, and <= 0 on such
variables.

> +    if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
> +    {
> +        llc_coloring_enabled = true;
> +        way_size = llc_size / llc_nr_ways;
> +    }

Hmm, I actually see a difference in someone saying

"llc-coloring=0 llc-size=... llc-nr-ways=..."

vs

"llc-size=... llc-nr-ways=... llc-coloring=0"

I'm not sure about Arm, but on x86 this can be relevant as there may be
pre-set parts of a command line with appended (human) overrides. Therefore
it always wants to be "last wins". Yet yes, you may weant to take the
position that in such a case the former example would require "llc-coloring=1"
to also be added. Kind of against the shorthand llc-size+llc-nr-ways only,
though.

Jan

