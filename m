Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D17825993
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 19:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662296.1032371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoV3-0007wE-C1; Fri, 05 Jan 2024 18:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662296.1032371; Fri, 05 Jan 2024 18:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoV3-0007tt-9E; Fri, 05 Jan 2024 18:00:53 +0000
Received: by outflank-mailman (input) for mailman id 662296;
 Fri, 05 Jan 2024 18:00:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLoV2-0007tn-E7
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 18:00:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoV1-0004DU-Te; Fri, 05 Jan 2024 18:00:51 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoV1-0000JE-Mf; Fri, 05 Jan 2024 18:00:51 +0000
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
	bh=R7/oPbFOObvrsFjNmsOK4ipe+8DXTx17VRIvyMPYQw0=; b=W+r2Rf9+Jnno7g/Vcw3ATyB51b
	XcsXcVTb9u1aDu0GsZIhl+8aGh26gqIMQjDYXy6roA9NzVFIyA8kYZZ/Kcp3Jad7qtAU9eEjjJ7OM
	NCkWYOtzq44cQN5aHaC8tdIetYkI0nmGpZGuZEHSpGu6M5gaDC7fOYMNsDw3g/PcpkWM=;
Message-ID: <7e69b9de-8156-4944-87be-207ad79f2df9@xen.org>
Date: Fri, 5 Jan 2024 18:00:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/arm: add Xen cache colors command line
 parameter
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-13-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/01/2024 09:51, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This commit adds a new command line parameter to configure Xen cache colors.
> These colors can be dumped with the cache coloring info debug-key.
> 
> By default, Xen uses the first color.
> Benchmarking the VM interrupt response time provides an estimation of
> LLC usage by Xen's most latency-critical runtime task. Results on Arm
> Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
> reserves 64 KiB of L2, is enough to attain best responsiveness.

Would you be able to share some numbers? This is quite helpful if in the 
future we need to revise the default.

> 
> More colors are instead very likely to be needed on processors whose L1
> cache is physically-indexed and physically-tagged, such as Cortex-A57.
> In such cases, coloring applies to L1 also, and there typically are two
> distinct L1-colors. Therefore, reserving only one color for Xen would
> senselessly partitions a cache memory that is already private, i.e.
> underutilize it. The default amount of Xen colors is thus set to one.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
>   docs/misc/xen-command-line.pandoc | 10 ++++++++++
>   xen/arch/arm/llc-coloring.c       | 29 +++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 163fe7bcb1..f983f22796 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2877,6 +2877,16 @@ mode.
>   **WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
>   The latter takes precedence if both are set.**
>   
> +### xen-llc-colors (arm64)
> +> `= List of [ <integer> | <integer>-<integer> ]`
> +
> +> Default: `0: the lowermost color`
> +
> +Specify Xen LLC color configuration. This options is available only when
> +`CONFIG_LLC_COLORING` is enabled.
> +Two colors are most likely needed on platforms where private caches are
> +physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
> +
>   ### xenheap_megabytes (arm32)
>   > `= <size>`
>   
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 526129cc43..99ea69ad39 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -18,6 +18,9 @@
>   #include <asm/processor.h>
>   #include <asm/sysregs.h>
>   
> +#define XEN_DEFAULT_COLOR       0
> +#define XEN_DEFAULT_NUM_COLORS  1
> +
>   bool __ro_after_init llc_coloring_enabled;
>   boolean_param("llc-coloring", llc_coloring_enabled);
>   
> @@ -30,6 +33,9 @@ static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
>   static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
>   static unsigned int __ro_after_init dom0_num_colors;
>   
> +static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
> +static unsigned int __ro_after_init xen_num_colors;
> +
>   #define mfn_color_mask              (nr_colors - 1)
>   #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
>   
> @@ -87,6 +93,12 @@ static int __init parse_dom0_colors(const char *s)
>   }
>   custom_param("dom0-llc-colors", parse_dom0_colors);
>   
> +static int __init parse_xen_colors(const char *s)
> +{
> +    return parse_color_config(s, xen_colors, &xen_num_colors);
> +}
> +custom_param("xen-llc-colors", parse_xen_colors);
> +
>   /* Return the LLC way size by probing the hardware */
>   static unsigned int __init get_llc_way_size(void)
>   {
> @@ -161,6 +173,8 @@ static void dump_coloring_info(unsigned char key)
>       printk("'%c' pressed -> dumping LLC coloring general info\n", key);
>       printk("LLC way size: %u KiB\n", llc_way_size >> 10);
>       printk("Number of LLC colors supported: %u\n", nr_colors);
> +    printk("Xen has %u LLC colors: ", xen_num_colors);
> +    print_colors(xen_colors, xen_num_colors);
>   }
>   
>   static bool check_colors(unsigned int *colors, unsigned int num_colors)
> @@ -217,6 +231,21 @@ bool __init llc_coloring_init(void)
>           return false;
>       }
>   
> +    if ( !xen_num_colors )
> +    {
> +        printk(XENLOG_WARNING
> +               "Xen LLC color config not found. Using default color: %u\n",
> +               XEN_DEFAULT_COLOR);
> +        xen_colors[0] = XEN_DEFAULT_COLOR;
> +        xen_num_colors = XEN_DEFAULT_NUM_COLORS;
> +    }
> +
> +    if ( !check_colors(xen_colors, xen_num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for Xen\n");
> +        return false;
> +    }
> +
>       register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
>   
>       return true;

Cheers,

-- 
Julien Grall

