Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36B435211
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 19:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214041.372457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFoV-00011n-21; Wed, 20 Oct 2021 17:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214041.372457; Wed, 20 Oct 2021 17:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFoU-0000zC-V8; Wed, 20 Oct 2021 17:55:42 +0000
Received: by outflank-mailman (input) for mailman id 214041;
 Wed, 20 Oct 2021 17:55:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdFoT-0000z4-Cx
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 17:55:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFoT-0002iS-4y; Wed, 20 Oct 2021 17:55:41 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFoS-0007Lp-VJ; Wed, 20 Oct 2021 17:55:41 +0000
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
	bh=DCzFL+DAXXexd1S4orB6X3aWwiP41BcH9Wxt/IoTMaE=; b=Ji3zmivH1oyP+ELBxw5iCCxihl
	SNY1JIOwcOvXYq//moNHP7fczM7Okj1LwzWBhnYGbROs4lv2W1RQs90J50WlPTQZRbCv53qWKz0gr
	J6dUKWmUQNI6vVoiX0V3K6lIFAUP6YyUfeYsZBB0eLtzDtcu09Vynk5/aSomRd/wUCo0=;
Message-ID: <84b84cc5-1726-ec47-e598-9a768bc29de1@xen.org>
Date: Wed, 20 Oct 2021 18:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 01/13] device tree: Remove __init from function
 type
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-2-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-2-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

Apologies for the late answer. I was away most of September and still 
catching up with my e-mails.

On 02/09/2021 07:05, Vikram Garhwal wrote:
> Change function type of following function to access during runtime:
>      1. handle_device_interrupt()
>      2. map_irq_to_domain()
>      3. map_range_to_domain()
>      4. unflatten_dt_node()
>      5. unflatten_device_tree()

I would prefer if the __init is removed as it get used.

> 
> Remove .init from domain_build.o and move map_range_data declaration to
> domain_build.h.
Skimming through the rest of the series, I think the function you are 
trying to use will be misplaced because you are not looking to build a 
domain. Instead, you are looking to add more devices.

So I think it would be better to move the functions outside of 
domain_build.c. One possibility would be device.c.

Cheers,

> 
> These changes are done to support the dynamic programming of a nodes where an
> overlay node will be added to fdt and unflattened node will be added to dt_host.
> Furthermore, irq and mmio mapping will be done for the added node.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/arch/arm/Makefile              |  2 +-
>   xen/arch/arm/domain_build.c        | 15 ++++-----------
>   xen/common/device_tree.c           | 18 +++++++++---------
>   xen/include/asm-arm/domain_build.h | 10 ++++++++++
>   xen/include/xen/device_tree.h      |  5 +++++
>   5 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b..bef4517 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -15,7 +15,7 @@ obj-y += decode.o
>   obj-y += device.o
>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>   obj-y += domain.o
> -obj-y += domain_build.init.o
> +obj-y += domain_build.o
>   obj-y += domctl.o
>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>   obj-y += gic.o
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 206038d..3a457d3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -47,12 +47,6 @@ static int __init parse_dom0_mem(const char *s)
>   }
>   custom_param("dom0_mem", parse_dom0_mem);
>   
> -struct map_range_data
> -{
> -    struct domain *d;
> -    p2m_type_t p2mt;
> -};
> -
>   /* Override macros from asm/page.h to make them work with mfn_t */
>   #undef virt_to_mfn
>   #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> @@ -1144,7 +1138,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>       return res;
>   }
>   
> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
>                                bool need_mapping, const char *devname)
>   {
>       int res;
> @@ -1210,7 +1204,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>       return 0;
>   }
>   
> -static int __init map_range_to_domain(const struct dt_device_node *dev,
> +int map_range_to_domain(const struct dt_device_node *dev,
>                                         u64 addr, u64 len,
>                                         void *data)
>   {
> @@ -1300,9 +1294,8 @@ static int __init map_device_children(struct domain *d,
>    *   < 0 error
>    *   0   success
>    */
> -static int __init handle_device_interrupts(struct domain *d,
> -                                           struct dt_device_node *dev,
> -                                           bool need_mapping)
> +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> +                             bool need_mapping)
>   {
>       unsigned int i, nirq;
>       int res;
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 03d25a8..cda21be 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1750,12 +1750,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>    * @allnextpp: pointer to ->allnext from last allocated device_node
>    * @fpsize: Size of the node path up at the current depth.
>    */
> -static unsigned long __init unflatten_dt_node(const void *fdt,
> -                                              unsigned long mem,
> -                                              unsigned long *p,
> -                                              struct dt_device_node *dad,
> -                                              struct dt_device_node ***allnextpp,
> -                                              unsigned long fpsize)
> +static unsigned long unflatten_dt_node(const void *fdt,
> +                                unsigned long mem,
> +                                unsigned long *p,
> +                                struct dt_device_node *dad,
> +                                struct dt_device_node ***allnextpp,
> +                                unsigned long fpsize)
>   {
>       struct dt_device_node *np;
>       struct dt_property *pp, **prev_pp = NULL;
> @@ -1986,7 +1986,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>   }
>   
>   /**
> - * __unflatten_device_tree - create tree of device_nodes from flat blob
> + * unflatten_device_tree - create tree of device_nodes from flat blob
>    *
>    * unflattens a device-tree, creating the
>    * tree of struct device_node. It also fills the "name" and "type"
> @@ -1995,7 +1995,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>    * @fdt: The fdt to expand
>    * @mynodes: The device_node tree created by the call
>    */
> -static void __init __unflatten_device_tree(const void *fdt,
> +void unflatten_device_tree(const void *fdt,
>                                              struct dt_device_node **mynodes)
>   {
>       unsigned long start, mem, size;
> @@ -2118,7 +2118,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>   
>   void __init dt_unflatten_host_device_tree(void)
>   {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    unflatten_device_tree(device_tree_flattened, &dt_host);
>       dt_alias_scan();
>   }
>   
> diff --git a/xen/include/asm-arm/domain_build.h b/xen/include/asm-arm/domain_build.h
> index 34ceddc..17449b1 100644
> --- a/xen/include/asm-arm/domain_build.h
> +++ b/xen/include/asm-arm/domain_build.h
> @@ -4,10 +4,20 @@
>   #include <xen/sched.h>
>   #include <asm/kernel.h>
>   
> +struct map_range_data
> +{
> +    struct domain *d;
> +    p2m_type_t p2mt;
> +};
> +
>   int map_irq_to_domain(struct domain *d, unsigned int irq,
>                         bool need_mapping, const char *devname);
>   int make_chosen_node(const struct kernel_info *kinfo);
>   void evtchn_allocate(struct domain *d);
> +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> +                             bool need_mapping);
> +int map_range_to_domain(const struct dt_device_node *dev, u64 addr, u64 len,
> +                        void *data);
>   
>   #ifndef CONFIG_ACPI
>   static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index b02696b..a4e98a7 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -177,6 +177,11 @@ int device_tree_for_each_node(const void *fdt, int node,
>    */
>   void dt_unflatten_host_device_tree(void);
>   
> +/*
> + * unflatten any device tree.
> + */
> +void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
> +
>   /**
>    * IRQ translation callback
>    * TODO: For the moment we assume that we only have ONE
> 

-- 
Julien Grall

