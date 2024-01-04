Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547E8248FC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 20:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661889.1031655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLTKw-0002sg-Qd; Thu, 04 Jan 2024 19:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661889.1031655; Thu, 04 Jan 2024 19:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLTKw-0002po-N9; Thu, 04 Jan 2024 19:25:02 +0000
Received: by outflank-mailman (input) for mailman id 661889;
 Thu, 04 Jan 2024 19:25:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLTKv-0002pi-CN
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 19:25:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLTKu-0001Up-P3; Thu, 04 Jan 2024 19:25:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLTKu-0008T2-An; Thu, 04 Jan 2024 19:25:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=H5jbqCvL2UaiubVyGvC3lQ8QoAbu3bBC2WrZAd609rc=; b=gz2WmSnUtUi5ih8WVKC3m5UQyL
	YpLr9j8v7cZSfr7PPOgZQYPX3iRJuOGOjZKqbN3v7NELtqbHiezM3jMRjE37yVHP3IaZRAF9y/dp/
	+Mq3wAdBqlZPDfiR6m0rKK3pEkXGC8xMiQ8eeT8rFz93o9XeWyO1rYL3y0g9qjNtaK1w=;
Message-ID: <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
Date: Thu, 4 Jan 2024 19:24:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-3-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit implements functions declared in the LLC coloring common header
> for arm64 and adds documentation. It also adds two command line options: a
> runtime switch for the cache coloring feature and the LLC way size
> parameter.
> 
> The feature init function consists of an auto probing of the cache layout
> necessary to retrieve the LLC way size which is used to compute the number
> of platform colors. It also adds a debug-key to dump general cache coloring
> info.
> 
> Static memory allocation and cache coloring are incompatible because static
> memory can't be guaranteed to use only colors assigned to the domain.
> Panic during domUs creation when both are enabled.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - used - instead of _ for filenames
> - moved static-mem check in this patch
> - moved dom0 colors parsing in next patch
> - moved color allocation and configuration in next patch
> - moved check_colors() in next patch
> - colors are now printed in short form
> v4:
> - added "llc-coloring" cmdline option for the boot-time switch
> - dom0 colors are now checked during domain init as for any other domain
> - fixed processor.h masks bit width
> - check for overflow in parse_color_config()
> - check_colors() now checks also that colors are sorted and unique
> ---
>   docs/misc/arm/cache-coloring.rst        |  97 ++++++++++++++
>   docs/misc/xen-command-line.pandoc       |  28 +++++
>   xen/arch/arm/Kconfig                    |   1 +
>   xen/arch/arm/Makefile                   |   1 +
>   xen/arch/arm/dom0less-build.c           |   6 +
>   xen/arch/arm/include/asm/llc-coloring.h |  28 +++++
>   xen/arch/arm/include/asm/processor.h    |  16 +++
>   xen/arch/arm/llc-coloring.c             | 161 ++++++++++++++++++++++++
>   xen/arch/arm/setup.c                    |   7 ++
>   9 files changed, 345 insertions(+)
>   create mode 100644 docs/misc/arm/cache-coloring.rst
>   create mode 100644 xen/arch/arm/include/asm/llc-coloring.h
>   create mode 100644 xen/arch/arm/llc-coloring.c
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> new file mode 100644
> index 0000000000..eabf8f5d1b
> --- /dev/null
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -0,0 +1,97 @@
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
> +
> +How to compute the number of colors
> +***********************************
> +
> +To compute the number of available colors for a specific platform, the size of
> +an LLC way and the page size used by Xen must be known.

Looking at the get_llc_way_size(), you are using CLIDR_EL1 which doesn't 
contains the system caches. They are invisible to the software but I 
guess could have an impact for cache coloring.

Can you clarify if by Last Cache Level, you mean the last visible cache?

> The first parameter can
> +be found in the processor manual or can be also computed dividing the total
> +cache size by the number of its ways. The second parameter is the minimum
> +amount of memory that can be mapped by the hypervisor, thus dividing the way
> +size by the page size, the number of total cache partitions is found. So for
> +example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up
> +to 16 colors when pages are 4 KiB in size.
> +
> +Cache layout is probed automatically by Xen itself, but a possibility to
> +manually set the way size it's left for the user to overcome failing situations
> +or for debugging/testing purposes. See `Command line parameters`_ for more
> +information on that.
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
> +
> +Known issues and limitations
> +****************************
> +
> +"xen,static-mem" isn't supported when coloring is enabled
> +#########################################################
> +
> +In the domain configuration, "xen,static-mem" allows memory to be statically
> +allocated to the domain. This isn't possibile when LLC coloring is enabled,
> +because that memory can't be guaranteed to use only colors assigned to the
> +domain.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8e65f8bd18..22d2d5b6cf 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1713,6 +1713,34 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>   in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>   record with other registers.
>   
> +### llc-coloring (arm64)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This options is
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-way-size (arm64)
> +> `= <size>`
> +
> +> Default: `Obtained from the hardware`
> +
> +Specify the way size of the Last Level Cache. This options is available only
> +when `CONFIG_LLC_COLORING` is enabled. It is an optional, expert-only parameter
> +and it is used to calculate the number of available LLC colors on the platform.
> +It can be obtained by dividing the total LLC size by the number of its
> +associative ways.
> +By default, the value is automatically computed by probing the hardware, but in
> +case of specific needs, it can be manually set. Those include failing probing
> +and debugging/testing purposes so that it's possibile to emulate platforms with

typo: s/possibile/possible/

> +different number of supported colors.
> +An important detail to highlight is that the current implementation of the
> +cache coloring technique requires the number of colors to be a power of 2, and
> +consequently, also the LLC way size must be so. A value that doesn't match this
> +requirement is aligned down to the previous power of 2.

Possibly a matter of taste here, but I would prefer if we simply throw 
an error. This makes more obvious that the size provided by the user was 
incorrect.

> +
>   ### lock-depth-size
>   > `= <integer>`
>   
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1a..55143f86a9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_64
>   	depends on !ARM_32
>   	select 64BIT
>   	select HAS_FAST_MULTIPLY
> +	select HAS_LLC_COLORING
>   
>   config ARM
>   	def_bool y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 33c677672f..c9a1cd298d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>   obj-y += irq.o
>   obj-y += kernel.init.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> +obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>   obj-y += mem_access.o
>   obj-y += mm.o
>   obj-y += monitor.o
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..1142f7f74a 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -5,6 +5,7 @@
>   #include <xen/grant_table.h>
>   #include <xen/iocap.h>
>   #include <xen/libfdt/libfdt.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/sched.h>
>   #include <xen/serial.h>
>   #include <xen/sizes.h>
> @@ -879,7 +880,12 @@ void __init create_domUs(void)
>               panic("No more domain IDs available\n");
>   
>           if ( dt_find_property(node, "xen,static-mem", NULL) )
> +        {
> +            if ( llc_coloring_enabled )
> +                panic("LLC coloring and static memory are incompatible\n");
> +
>               flags |= CDF_staticmem;
> +        }
>   
>           if ( dt_property_read_bool(node, "direct-map") )
>           {
> diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
> new file mode 100644
> index 0000000000..7885e9e3f5
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/llc-coloring.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please use GPL-2.0-only.

> +/*
> + * Last Level Cache (LLC) coloring support for ARM
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>

Same question as before for the authorship.

> + */
> +#ifndef __ASM_ARM_COLORING_H__
> +#define __ASM_ARM_COLORING_H__
> +
> +#include <xen/init.h>
> +
> +bool __init llc_coloring_init(void);

The __init attribute is not necessary here. It is sufficient on the 
definition.

> +
> +#endif /* __ASM_ARM_COLORING_H__ */
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
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 8e02410465..fd5e8eba98 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -18,6 +18,22 @@
>   #define CTR_IDC_SHIFT       28
>   #define CTR_DIC_SHIFT       29
>   
> +/* CCSIDR Current Cache Size ID Register */
> +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
> +#define CCSIDR_NUMSETS_SHIFT            13
> +#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, ULL)
> +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, ULL)
> +
> +/* CCSELR Cache Size Selection Register */

Typo: s/CCSELR/CSSELR/

> +#define CCSELR_LEVEL_MASK  _AC(0x7, UL)
> +#define CCSELR_LEVEL_SHIFT 1
> +
> +/* CLIDR Cache Level ID Register */
> +#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
> +#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
> +#define CLIDR_CTYPEn_LEVELS   7
> +
>   #define ICACHE_POLICY_VPIPT  0
>   #define ICACHE_POLICY_AIVIVT 1
>   #define ICACHE_POLICY_VIPT   2
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> new file mode 100644
> index 0000000000..37d647f038
> --- /dev/null
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only

> +/*
> + * Last Level Cache (LLC) coloring support for ARM
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>

Same question as before for the authorship.

> + */
> +#include <xen/errno.h>
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +#include <xen/types.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +
> +bool __ro_after_init llc_coloring_enabled;
> +boolean_param("llc-coloring", llc_coloring_enabled);
> +
> +/* Size of an LLC way */
> +static unsigned int __ro_after_init llc_way_size;
> +size_param("llc-way-size", llc_way_size);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
> +
> +/* Return the LLC way size by probing the hardware */
> +static unsigned int __init get_llc_way_size(void)
> +{
> +    register_t ccsidr_el1;
> +    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
> +    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
> +    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
> +    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
> +    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
> +    unsigned int n, line_size, num_sets;
> +
> +    for ( n = CLIDR_CTYPEn_LEVELS;
> +          n != 0 && !((clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) & CLIDR_CTYPEn_MASK);
> +          n-- );
> +
> +    if ( n == 0 )
> +        return 0;


Shouldn't you check cache type of the level is either 0b011 (Separate 
instruction and cache) or 0b100 (Unified cache)?

> +
> +    WRITE_SYSREG(((n - 1) & CCSELR_LEVEL_MASK) << CCSELR_LEVEL_SHIFT,

NIT: masking (n - 1) looks a bit odd as it already indicates the cache 
level. It actually made me wonder if the other bits have a meaning. So I 
would drop the mask.

> +                 CSSELR_EL1);
> +    isb();
> +
> +    ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
> +
> +    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
> +    line_size = 1 << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);

Please use 1U even thought the shift should not be big enough to result 
to an overflow.

> +
> +    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout */
> +    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
> +    {
> +        ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
> +        ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
> +    }
> +    /* Arm ARM: (Number of sets in cache) - 1 */
> +    num_sets = ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numsets_mask) + 1;
> +
> +    printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num: %u)\n",
> +           n, line_size, num_sets);
> +
> +    /* Restore value in CSSELR_EL1 */
> +    WRITE_SYSREG(csselr_el1, CSSELR_EL1);
> +    isb();
> +
> +    return line_size * num_sets;
> +}
> +
> +static void print_colors(unsigned int *colors, unsigned int num_colors)

I think colors can be const. In general, I would prefer if 
variable/parameters that should not be modified are const.

> +{
> +    unsigned int i;
> +
> +    printk("{ ");
> +    for ( i = 0; i < num_colors; i++ ) {
> +        unsigned int start = colors[i], end = colors[i];
> +
> +        printk("%u", start);
> +
> +        for ( ;
> +              i < num_colors - 1 && colors[i] + 1 == colors[i + 1];
> +              i++, end++ );
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
> +static void dump_coloring_info(unsigned char key)
> +{
> +    printk("'%c' pressed -> dumping LLC coloring general info\n", key);
> +    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
> +    printk("Number of LLC colors supported: %u\n", nr_colors);
> +}
> +
> +bool __init llc_coloring_init(void)
> +{
> +    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
> +    {
> +        printk(XENLOG_ERR
> +               "Probed LLC way size is 0 and no custom value provided\n");
> +        return false;
> +    }
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address, so also the LLC way size must be so.
> +     */
> +    if ( llc_way_size & (llc_way_size - 1) )
> +    {
> +        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2.\n",
> +               llc_way_size);
> +        llc_way_size = 1U << flsl(llc_way_size);
> +        printk(XENLOG_WARNING
> +               "Using %u instead. Performances will be suboptimal\n",
> +               llc_way_size);
> +    }
> +
> +    nr_colors = llc_way_size >> PAGE_SHIFT;
> +
> +    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )

I didn't find any documentation explaining why we need at least two 
colors. I guess you want to make sure that there is a color for Xen and 
domain. But I wonder what could wrong with just one color (other than 
been pointless)?

> +    {
> +        printk(XENLOG_ERR "Number of LLC colors (%u) not in range [2, %u]\n",
> +               nr_colors, CONFIG_NR_LLC_COLORS);
> +        return false;
> +    }
> +
> +    register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
> +
> +    return true;
> +}
> +
> +void domain_llc_coloring_free(struct domain *d)
> +{
> +    xfree(d->llc_colors);
> +}
> +
> +void domain_dump_llc_colors(struct domain *d)
> +{
> +    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
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
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 59dd9bb25a..4c16b566db 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -12,6 +12,7 @@
>   #include <xen/device_tree.h>
>   #include <xen/domain_page.h>
>   #include <xen/grant_table.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/types.h>
>   #include <xen/string.h>
>   #include <xen/serial.h>
> @@ -746,6 +747,12 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>       printk("Command line: %s\n", cmdline);
>       cmdline_parse(cmdline);
>   
> +    if ( llc_coloring_enabled )

I would consider to move llc_coloring_enabled in llc_coloring_init(). 
But if you prefer to keep the check here, then I would at least request 
to merge the two ifs. I.e.

if ( llc_coloring_enabled && !llc_coloring_init() )

That said...

> +    {
> +        if ( !llc_coloring_init() )
> +            panic("Xen LLC coloring support: setup failed\n");
> +    }
> +
>       setup_mm();

... shouldn't the coloring happen in setup_mm()? After all, this is part 
of the memory subystem and I suspect this will not work with the 
upcoming MPU support.

>   
>       /* Parse the ACPI tables for possible boot-time configuration */

Cheers,

-- 
Julien Grall

