Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F94D8C01
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290422.492516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTpvB-0006G0-Vp; Mon, 14 Mar 2022 18:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290422.492516; Mon, 14 Mar 2022 18:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTpvB-0006DI-Sl; Mon, 14 Mar 2022 18:59:57 +0000
Received: by outflank-mailman (input) for mailman id 290422;
 Mon, 14 Mar 2022 18:59:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTpvA-0006DC-9Q
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 18:59:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTpv9-0002iE-7e; Mon, 14 Mar 2022 18:59:55 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTpv9-0003Yt-11; Mon, 14 Mar 2022 18:59:55 +0000
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
	bh=wUMMu6JHKIccap/X+FGwmbytiaOaNrrDZ1ytxXP3zYQ=; b=kCwyB9X+mAloSG/LcdUkBRh7qr
	JXXUK+uiYGXuGy38Fruu4MpZOeiKWUC10QutlhjL9HTSlYDNwT8e5E+lGCCQtb/ubvP9oNncA+RzD
	JFXTfTlEhL/0Z1zZnuMnxXsYCtluv/5+3acGb9BuNLsmw/yWqtpg37ZhchLo6YPJ32sk=;
Message-ID: <e7e38143-8ebe-942c-c85b-20604fdc1470@xen.org>
Date: Mon, 14 Mar 2022 18:59:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 22/36] xen/arch: init cache coloring conf for Xen
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, Luca Miccio <206497@studenti.unimore.it>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-23-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-23-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add initialization for Xen coloring data. By default, use the lowest
> color index available.
> 
> Benchmarking the VM interrupt response time provides an estimation of
> LLC usage by Xen's most latency-critical runtime task.  Results on Arm
> Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
> reserves 64 KiB of L2, is enough to attain best responsiveness.
> 
> More colors are instead very likely to be needed on processors whose L1
> cache is physically-indexed and physically-tagged, such as Cortex-A57.
> In such cases, coloring applies to L1 also, and there typically are two
> distinct L1-colors. Therefore, reserving only one color for Xen would
> senselessly partitions a cache memory that is already private, i.e.
> underutilize it. The default amount of Xen colors is thus set to one.
> 
> Signed-off-by: Luca Miccio <206497@studenti.unimore.it>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/coloring.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index d1ac193a80..761414fcd7 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -30,10 +30,18 @@
>   #include <asm/coloring.h>
>   #include <asm/io.h>
>   
> +/* By default Xen uses the lowestmost color */
> +#define XEN_COLOR_DEFAULT_MASK 0x0001

You are setting a uint32_t value. So it should be 0x00000001.

But I think it is a bit confusing to define a mask here. Instead, I 
would define the color ID and set the bit.

> +#define XEN_COLOR_DEFAULT_NUM 1
> +/* Current maximum useful colors */
> +#define MAX_XEN_COLOR   128 > +
>   /* Number of color(s) assigned to Xen */
>   static uint32_t xen_col_num;
>   /* Coloring configuration of Xen as bitmask */
>   static uint32_t xen_col_mask[MAX_COLORS_CELLS];
> +/* Xen colors IDs */
> +static uint32_t xen_col_list[MAX_XEN_COLOR];

Why do we need to store xen colors in both a bitmask form and an array 
of color ID?

>   
>   /* Number of color(s) assigned to Dom0 */
>   static uint32_t dom0_col_num;
> @@ -216,7 +224,7 @@ uint32_t get_max_colors(void)
>   
>   bool __init coloring_init(void)
>   {
> -    int i;
> +    int i, rc;
>   
>       printk(XENLOG_INFO "Initialize XEN coloring: \n");
>       /*
> @@ -266,6 +274,27 @@ bool __init coloring_init(void)
>       printk(XENLOG_INFO "Color bits in address: 0x%"PRIx64"\n", addr_col_mask);
>       printk(XENLOG_INFO "Max number of colors: %u\n", max_col_num);
>   
> +    if ( !xen_col_num )
> +    {
> +        xen_col_mask[0] = XEN_COLOR_DEFAULT_MASK;
> +        xen_col_num = XEN_COLOR_DEFAULT_NUM;
> +        printk(XENLOG_WARNING "Xen color configuration not found. Using default\n");
> +    }
> +
> +    printk(XENLOG_INFO "Xen color configuration: 0x%"PRIx32"%"PRIx32"%"PRIx32"%"PRIx32"\n",
> +            xen_col_mask[3], xen_col_mask[2], xen_col_mask[1], xen_col_mask[0]);

You are making the assumption that MAX_COLORS_CELLS is always 4. This 
may be more or worse less. So this should be rework to avoid making any 
assumption on the size.

I expect switching to the generic bitmask will help here.

> +    rc = copy_mask_to_list(xen_col_mask, xen_col_list, xen_col_num);
> +
> +    if ( rc )
> +        return false;
> +
> +    for ( i = 0; i < xen_col_num; i++ )
> +        if ( xen_col_list[i] > (max_col_num - 1) )
> +        {
> +            printk(XENLOG_ERR "ERROR: max. color value not supported\n");
> +            return false;
> +        }
> +
>       return true;
>   }
>   

Cheers,

-- 
Julien Grall

