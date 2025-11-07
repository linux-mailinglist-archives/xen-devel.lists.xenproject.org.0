Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57051C3EF59
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 09:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157387.1486190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHqA-00049P-0z; Fri, 07 Nov 2025 08:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157387.1486190; Fri, 07 Nov 2025 08:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHq9-00046N-Tr; Fri, 07 Nov 2025 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1157387;
 Fri, 07 Nov 2025 08:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=suI1=5P=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vHHq8-0003eW-6F
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 08:29:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce8c793a-bbb3-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 09:28:58 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-640b9c7eab9so921798a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 00:28:58 -0800 (PST)
Received: from [192.168.50.2] (pool185-5-253-110.as6723.net. [185.5.253.110])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcaeaasm186291766b.1.2025.11.07.00.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:28:57 -0800 (PST)
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
X-Inumbo-ID: ce8c793a-bbb3-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762504138; x=1763108938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6AmKl85eFp0cNTVepMXc06n++lf/ZVa6szbytxf8Sio=;
        b=i41aalgrZYf6tLanHx14XcVmMeKsHds/hPWcU9xsGXMoGfhEGQyZ34IWKSrXsexvUk
         iW2V6btuJNnqJ2UXIhaiG2kOvkG06LDceJT3nRGhlymp8onmBAkAodEYJ1rqK32m3wW4
         DUDrBIb+OS3edpMyktlfgPrA5AuDrz71LGmDVsSQ8ly8OdHXr1oGx9kzdtHQmAZ8VBH7
         7o9/vtBJtA5oxNX1jJ/rG1VRPmu6vLNmKrdnZlNQJHXr9gVpf1jUcn39uxWtdk3qwoVx
         LGAePH3WF2XYbWlv0GO/57Omltp2d8zMXO+xfx9IAUYAFz9R/hTR9b5umYWBj5q0hXMk
         nTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504138; x=1763108938;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AmKl85eFp0cNTVepMXc06n++lf/ZVa6szbytxf8Sio=;
        b=o6yG2LvatTHu7Zu2KThbpSnlLYyPsO15wF+TQdl0QdCqNo4Kmpu966juv3RneeWO36
         /pP/60nnM2v210qBBPj+8ZA/zYICDrZEBSSaSRliI7YHaVKWyEDhPbFDcB9avvRtVWzT
         p8FjXQWbnHSnxrlMs15sq79Zydy2qs/602GEsQqCtuPi0/3U7m7XKFxzJ3wKiwzqrDUm
         QlKrD65Or26Y3VvGXjjB6FNhKijUUr+AULeOFg0pXS5C3mkceXUgp7OzbsTrgPJr2rSP
         /yGu+uX+f3g7ShtkENa/0wLUc2BdCXv4IzQhsThA7yzQifebqQW5lDI7iiL+fR4idVND
         Bysg==
X-Forwarded-Encrypted: i=1; AJvYcCWHksmCzX2IyVAg065O3wwNLz8eoxhxq3w3Hc72JOLkFJWzF1+zBTHcIK5tZ7ofkZhPoAnZdm27Mks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7VA4nvZBzftYT8j6tHq1wLWNWAWvN2NIHL+ZdnjtoLvqcT49A
	NAU/aGjQh2ZaCnkymBUgsSOIJMWhERrThy/7aOt5ESn5XusjVMc4AWpv
X-Gm-Gg: ASbGnctCEffKnZAPtJ3741dUl6lLCn5VyCk+aSRs5WIan7e1xJywOwdZtlH0+bBnOpO
	UsyasovpDX5h27/VZuy9GQ6LPqbo96jbo3gKIrz5rMbpybZsHFBhO+PX6M46fERHu7LKSaJtAE/
	b9/9xbeRN5Iw9+b0OJFGk3VwDUeHW7B4eMJdIAQ8r1sW7Yu6QAvjZPhfWRIi7MLBdJoXnCrtm9r
	m7R5KDtUz5jz6KL8CLjU/c3lmkGQtNpRY9k0SdMoqTxm6Zk0wXWjwKo6MrwI4hX5ZWnDQKTs68o
	eLAwcrhhVsL2IVyl8s1S/zlsjGKjrPvx0xLqLjW5O5wy4itzmY4GyLmUF1scnIquwcSea4hAfG8
	eVIzSaqONuYX7hZpVxHA5EzBFwPrL1PDinUogqfY8x3FsSfmXiH403760ChDOcWxJGkJijdr/49
	/+yDr/hCdyP3TWTBXM8g4q6+Pc1yLZeF0Uso4=
X-Google-Smtp-Source: AGHT+IHeJ4fhbfjgSfmLTmW23obgjMrDOpONRm155RTcCRWlz9f/0G9l+i/lKNEp/yJRrz94DPIpbQ==
X-Received: by 2002:a17:907:c1d:b0:b49:2021:793f with SMTP id a640c23a62f3a-b72c0d9fae1mr244347066b.53.1762504137785;
        Fri, 07 Nov 2025 00:28:57 -0800 (PST)
Message-ID: <0b5f19ea-6e33-4658-a165-f0af1cffbd03@gmail.com>
Date: Fri, 7 Nov 2025 10:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mykola Kvach <xakep.amatop@gmail.com>
Subject: Re: [PATCH v13 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-2-carlo.nonato@minervasys.tech>
Content-Language: en-US
In-Reply-To: <20241217170637.233097-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

Thank you for the patch.

On 17/12/2024 19:06, Carlo Nonato wrote:
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
> v13:
> - added note to cmdline docs for llc-nr-ways and llc-size shorthand precedence
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
>    llc_coloring_enabled
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
>    switch
> - added domain_create_llc_colored() to be able to pass colors
> - added is_domain_llc_colored() macro
> ---
>   SUPPORT.md                        |   7 ++
>   docs/index.rst                    |   1 +
>   docs/misc/cache-coloring.rst      | 118 ++++++++++++++++++++++++++++
>   docs/misc/xen-command-line.pandoc |  39 ++++++++++
>   xen/common/Kconfig                |  21 +++++
>   xen/common/Makefile               |   1 +
>   xen/common/keyhandler.c           |   3 +
>   xen/common/llc-coloring.c         | 124 ++++++++++++++++++++++++++++++
>   xen/common/page_alloc.c           |   3 +
>   xen/include/xen/llc-coloring.h    |  36 +++++++++
>   xen/include/xen/sched.h           |   5 ++
>   11 files changed, 358 insertions(+)
>   create mode 100644 docs/misc/cache-coloring.rst
>   create mode 100644 xen/common/llc-coloring.c
>   create mode 100644 xen/include/xen/llc-coloring.h
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 82239d0294..998faf5635 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -401,6 +401,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
>       Status, x86 HVM: Tech Preview
>       Status, ARM: Tech Preview
>   
> +### Cache coloring
> +
> +Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and Xen
> +itself.
> +
> +    Status, Arm64: Experimental
> +
>   ## Resource Management
>   
>   ### CPU Pools
> diff --git a/docs/index.rst b/docs/index.rst
> index 1d44796d72..1bb8d02ea3 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -66,6 +66,7 @@ Documents in need of some rearranging.
>      misc/xen-makefiles/makefiles
>      misra/index
>      fusa/index
> +   misc/cache-coloring
>   
>   
>   Miscellanea
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
> index 293dbc1a95..ca105ec559 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1708,6 +1708,45 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>   in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>   record with other registers.
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
> +will be used. Note that using both options implies "llc-coloring=on" unless an
> +earlier "llc-coloring=off" is there.
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
> +used. Note that using both options implies "llc-coloring=on" unless an
> +earlier "llc-coloring=off" is there.
> +
>   ### lock-depth-size
>   > `= <integer>`
>   
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..b4ec6893be 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>   config HAS_KEXEC
>   	bool
>   
> +config HAS_LLC_COLORING
> +	bool
> +
>   config HAS_PIRQ
>   	bool
>   
> @@ -516,4 +519,22 @@ config TRACEBUFFER
>   	  to be collected at run time for debugging or performance analysis.
>   	  Memory and execution overhead when not active is minimal.
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
>   endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index b279b09bfb..cba3b32733 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -25,6 +25,7 @@ obj-y += keyhandler.o
>   obj-$(CONFIG_KEXEC) += kexec.o
>   obj-$(CONFIG_KEXEC) += kimage.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
> +obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>   obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>   obj-y += memory.o
>   obj-y += multicall.o
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 6da291b34e..6ea54838d4 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -5,6 +5,7 @@
>   #include <asm/regs.h>
>   #include <xen/delay.h>
>   #include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/param.h>
>   #include <xen/sections.h>
>   #include <xen/shutdown.h>
> @@ -304,6 +305,8 @@ static void cf_check dump_domains(unsigned char key)
>   
>           arch_dump_domain_info(d);
>   
> +        domain_dump_llc_colors(d);
> +
>           rangeset_domain_printk(d);
>   
>           dump_pageframe_info(d);
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> new file mode 100644
> index 0000000000..335a907296
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
> +    llc_coloring_enabled = (opt_llc_coloring >= 1);
> +    if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
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

As far as I can see, this error means that we did not detect a suitable 
LLC/unified cache.
Maybe it would be better to make that explicit in the panic message.



Best regards,
Mykola

> +    }
> +
> +    if ( way_size & ~PAGE_MASK )
> +        panic("LLC way size must be a multiple of PAGE_SIZE\n");
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
> +    }
> +    else if ( max_nr_colors < 2 )
> +        panic("Number of LLC colors %u < 2\n", max_nr_colors);
> +
> +    arch_llc_coloring_init();
> +}
> +
> +void dump_llc_coloring_info(void)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("LLC coloring info:\n");
> +    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
> +}
> +
> +void domain_dump_llc_colors(const struct domain *d)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("%u LLC colors: ", d->num_llc_colors);
> +    print_colors(d->llc_colors, d->num_llc_colors);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 1f424333db..da505a79f6 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -126,6 +126,7 @@
>   #include <xen/irq.h>
>   #include <xen/keyhandler.h>
>   #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/nodemask.h>
>   #include <xen/numa.h>
> @@ -2647,6 +2648,8 @@ static void cf_check pagealloc_info(unsigned char key)
>       }
>   
>       printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
> +
> +    dump_llc_coloring_info();
>   }
>   
>   static __init int cf_check pagealloc_keyhandler_init(void)
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> new file mode 100644
> index 0000000000..0acd8d0ad6
> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2024, Minerva Systems SRL
> + */
> +#ifndef __XEN_LLC_COLORING_H__
> +#define __XEN_LLC_COLORING_H__
> +
> +struct domain;
> +
> +#ifdef CONFIG_LLC_COLORING
> +void llc_coloring_init(void);
> +void dump_llc_coloring_info(void);
> +void domain_dump_llc_colors(const struct domain *d);
> +#else
> +static inline void llc_coloring_init(void) {}
> +static inline void dump_llc_coloring_info(void) {}
> +static inline void domain_dump_llc_colors(const struct domain *d) {}
> +#endif
> +
> +unsigned int get_llc_way_size(void);
> +void arch_llc_coloring_init(void);
> +
> +#endif /* __XEN_LLC_COLORING_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 711668e028..037c83fda2 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -640,6 +640,11 @@ struct domain
>   
>       /* Holding CDF_* constant. Internal flags for domain creation. */
>       unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned int num_llc_colors;
> +    const unsigned int *llc_colors;
> +#endif
>   };
>   
>   static inline struct page_list_head *page_to_list(

