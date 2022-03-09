Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63084D3994
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 20:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288044.488454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS1gw-0004Hb-64; Wed, 09 Mar 2022 19:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288044.488454; Wed, 09 Mar 2022 19:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS1gw-0004FI-2t; Wed, 09 Mar 2022 19:09:46 +0000
Received: by outflank-mailman (input) for mailman id 288044;
 Wed, 09 Mar 2022 19:09:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nS1gu-0004FB-Ii
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 19:09:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS1gt-00032G-OM; Wed, 09 Mar 2022 19:09:43 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS1gt-0007Eo-HH; Wed, 09 Mar 2022 19:09:43 +0000
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
	bh=LMLUIzHcrhPLCpNrIagUAPfG48xyvEA9nKowKMRjMhY=; b=exYvH+X4DMhiNFejCW5uRQ0oC/
	BCXIncFK03refPRoDYqqnzrvWnuzVoEANaHrR5wk4Lvm/PxYQhJxkocGd9/GTXdgGfVZA7gw701ES
	j2zJrqcgP447uhRQMnFWfQc/TZ+eSVfY9TlII3uc6dhQtr8akLTva/yesEiIjugMGGJU=;
Message-ID: <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
Date: Wed, 9 Mar 2022 19:09:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 04/36] xen/arm: add parsing function for cache coloring
 configuration
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-5-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-5-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add three new bootargs allowing configuration of cache coloring support
> for Xen:

I would prefer if documentation of each command line is part of the 
patch introducing them. This would help understanding some of the 
parameters.

> - way_size: The size of a LLC way in bytes. This value is mainly used
>    to calculate the maximum available colors on the platform.

We should only add command line option when they are a strong use case. 
In documentation, you wrote that someone may want to overwrite the way 
size for "specific needs".

Can you explain what would be those needs?

> - dom0_colors: The coloring configuration for Dom0, which also acts as
>    default configuration for any DomU without an explicit configuration.
> - xen_colors: The coloring configuration for the Xen hypervisor itself.
> 
> A cache coloring configuration consists of a selection of colors to be
> assigned to a VM or to the hypervisor. It is represented by a set of
> ranges. Add a common function that parses a string with a
> comma-separated set of hyphen-separated ranges like "0-7,15-16" and
> returns both: the number of chosen colors, and an array containing their
> ids.
> Currently we support platforms with up to 128 colors.

Is there any reason this value is hardcoded in Xen rather than part of 
the Kconfig?

> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/Kconfig                |   5 ++
>   xen/arch/arm/Makefile               |   2 +-
>   xen/arch/arm/coloring.c             | 131 ++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/coloring.h |  28 ++++++
>   4 files changed, 165 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/coloring.c
>   create mode 100644 xen/arch/arm/include/asm/coloring.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..f0f999d172 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR
>   
>   	  If unsure, say Y.
>   
> +config COLORING
> +	bool "L2 cache coloring"
> +	default n

This wants to be gated with EXPERT for time-being. SUPPORT.MD woudl
Furthermore, I think this wants to be gated with EXPERT for the time-being.

> +	depends on ARM_64

Why is this limited to arm64?

> +
>   config TEE
>   	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>   	default n
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index c993ce72a3..581896a528 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -66,7 +66,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>   obj-y += vsmc.o
>   obj-y += vpsci.o
>   obj-y += vuart.o
> -
> +obj-$(CONFIG_COLORING) += coloring.o

Please keep the newline before extra-y. The file are meant to be ordered 
alphabetically. So this should be inserted in the correct position.

>   extra-y += xen.lds
>   
>   #obj-bin-y += ....o
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> new file mode 100644
> index 0000000000..8f1cff6efb
> --- /dev/null
> +++ b/xen/arch/arm/coloring.c
> @@ -0,0 +1,131 @@
> +/*
> + * xen/arch/arm/coloring.c
> + *
> + * Coloring support for ARM
> + *
> + * Copyright (C) 2019 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <xen/init.h>
> +#include <xen/types.h>
> +#include <xen/lib.h>
> +#include <xen/errno.h>
> +#include <xen/param.h>
> +#include <asm/coloring.h>

The includes should be ordered so <xen/...> are first, then <asm/...>.
They are also ordered alphabetically within their own category.

> +
> +/* Number of color(s) assigned to Xen */
> +static uint32_t xen_col_num;
> +/* Coloring configuration of Xen as bitmask */
> +static uint32_t xen_col_mask[MAX_COLORS_CELLS];
Xen provides helpers to create and use bitmaps (see 
include/xen/bitmap.h). Can you use?

> +
> +/* Number of color(s) assigned to Dom0 */
> +static uint32_t dom0_col_num;
> +/* Coloring configuration of Dom0 as bitmask */
> +static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
> +
> +static uint64_t way_size;
> +
> +/*************************
> + * PARSING COLORING BOOTARGS
> + */
> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below, and store the number of colors and a corresponding mask in
> + * the last two given pointers.
> + *
> + * COLOR_CONFIGURATION ::= RANGE,...,RANGE
> + * RANGE               ::= COLOR-COLOR
> + *
> + * Example: "2-6,15-16" represents the set of colors: 2,3,4,5,6,15,16.
> + */
> +static int parse_color_config(
> +    const char *buf, uint32_t *col_mask, uint32_t *col_num)


Coding style. We usually declarate paremeters on the same line as the 
function name. If they can't fit on the same line, then we split in two 
with the parameter aligned to the first paremeter.

> +{
> +    int start, end, i;

AFAICT, none of the 3 variables will store negative values. So can they 
be unsigned?

> +    const char* s = buf;
> +    unsigned int offset;
> +
> +    if ( !col_mask || !col_num )
> +        return -EINVAL;
> +
> +    *col_num = 0;
> +    for ( i = 0; i < MAX_COLORS_CELLS; i++ )
> +        col_mask[i] = 0;
dom0_col_mask and xen_col_mask are already zeroed. I would also expect 
the same for dynamically allocated bitmask. So can this be dropped?

> +
> +    while ( *s != '\0' )
> +    {
> +        if ( *s != ',' )
> +        {
> +            start = simple_strtoul(s, &s, 0);
> +
> +            /* Ranges are hyphen-separated */
> +            if ( *s != '-' )
> +                goto fail;
> +            s++;
> +
> +            end = simple_strtoul(s, &s, 0);
> +
> +            for ( i = start; i <= end; i++ )
> +            {
> +                offset = i / 32;
> +                if ( offset > MAX_COLORS_CELLS )
> +                    goto fail;
> +
> +                if ( !(col_mask[offset] & (1 << i % 32)) )
> +                    *col_num += 1;
> +                col_mask[offset] |= (1 << i % 32);
> +            }
> +        }
> +        else
> +            s++;
> +    }
> +
> +    return *s ? -EINVAL : 0;
> +fail:
> +    return -EINVAL;
> +}
> +
> +static int __init parse_way_size(const char *s)
> +{
> +    way_size = simple_strtoull(s, &s, 0);
> +
> +    return *s ? -EINVAL : 0;
> +}
> +custom_param("way_size", parse_way_size);
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_col_mask, &dom0_col_num);
> +}
> +custom_param("dom0_colors", parse_dom0_colors);
> +
> +static int __init parse_xen_colors(const char *s)
> +{
> +    return parse_color_config(s, xen_col_mask, &xen_col_num);
> +}
> +custom_param("xen_colors", parse_xen_colors);
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
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> new file mode 100644
> index 0000000000..60958d1244
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -0,0 +1,28 @@
> +/*
> + * xen/arm/include/asm/coloring.h
> + *
> + * Coloring support for ARM
> + *
> + * Copyright (C) 2019 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __ASM_ARM_COLORING_H__
> +#define __ASM_ARM_COLORING_H__
> +
> +#define MAX_COLORS_CELLS 4
> +
> +#endif /* !__ASM_ARM_COLORING_H__ */

Cheers,

-- 
Julien Grall

