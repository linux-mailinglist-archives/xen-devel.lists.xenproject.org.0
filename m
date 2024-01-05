Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA682592C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 18:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662277.1032331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLo98-0000R9-Rt; Fri, 05 Jan 2024 17:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662277.1032331; Fri, 05 Jan 2024 17:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLo98-0000Oh-P7; Fri, 05 Jan 2024 17:38:14 +0000
Received: by outflank-mailman (input) for mailman id 662277;
 Fri, 05 Jan 2024 17:38:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLo97-0000Ob-Lx
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 17:38:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLo97-0003YP-2h; Fri, 05 Jan 2024 17:38:13 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLo96-0007ic-Qf; Fri, 05 Jan 2024 17:38:12 +0000
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
	bh=kf6T5i3vYgPyaEsZYkQZj+k2CJJCYSvVE8T0mj/9WPw=; b=ugOSRZiQSfQgIr+lDbACIeCUWQ
	RTn02WPN1OWVmRMebdU+0KRBPRWz0WNITKiD9/kBaoGllMQ1Ji7Uwxk33vxO02nPuSUlJUWBLrum/
	2ZfAj9FQ2fOzFr0ldjGeXml+l5x7tpHU1DErGNYoQHg1USjBOTcYGqbPAc0LvGe8Q39A=;
Message-ID: <849b166d-a1a1-407e-8a9c-e0beac6ee955@xen.org>
Date: Fri, 5 Jan 2024 17:38:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] xen/arm: add support for cache coloring
 configuration via device-tree
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-7-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-7-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit adds the "llc-colors" Device Tree attribute that can be used
> for DomUs and Dom0less color configurations. The syntax is the same used
> for every color config.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - static-mem check has been moved in a previous patch
> - added domain_set_llc_colors_from_str() to set colors after domain creation
> ---
>   docs/misc/arm/cache-coloring.rst        | 48 ++++++++++++++++++++++++-
>   docs/misc/arm/device-tree/booting.txt   |  4 +++
>   xen/arch/arm/dom0less-build.c           | 13 +++++++
>   xen/arch/arm/include/asm/llc-coloring.h |  1 +
>   xen/arch/arm/llc-coloring.c             | 17 +++++++++
>   5 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index acf82c3df8..ae1dd8f4af 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -10,7 +10,7 @@ If needed, change the maximum number of colors with
>   ``CONFIG_NR_LLC_COLORS=<n>``.
>   
>   Compile Xen and the toolstack and then configure it via
> -`Command line parameters`_.
> +`Command line parameters`_. For DomUs follow `DomUs configuration`_.
>   
>   Background
>   **********
> @@ -114,6 +114,52 @@ Examples:
>   | 0                 | [0]                         |
>   +-------------------+-----------------------------+
>   
> +DomUs configuration
> +*******************
> +
> +DomUs colors can be set via Device Tree, also for Dom0less configurations
> +(documentation at `docs/misc/arm/device-tree/booting.txt`) using the
> +``llc-colors`` option. For example:
> +
> +::
> +
> +    xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-coloring=on llc-way-size=64K dom0-llc-colors=2-6";
> +    xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen root=/dev/ram0"
> +
> +    dom0 {
> +        compatible = "xen,linux-zimage" "xen,multiboot-module";
> +        reg = <0x0 0x1000000 0x0 15858176>;
> +    };
> +
> +    dom0-ramdisk {
> +        compatible = "xen,linux-initrd" "xen,multiboot-module";
> +        reg = <0x0 0x2000000 0x0 20638062>;
> +    };
> +
> +    domU0 {
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        compatible = "xen,domain";
> +        memory = <0x0 0x40000>;
> +        llc-colors = "4-8,10,11,12";
> +        cpus = <0x1>;
> +        vpl011 = <0x1>;
> +
> +        module@2000000 {
> +            compatible = "multiboot,kernel", "multiboot,module";
> +            reg = <0x2000000 0xffffff>;
> +            bootargs = "console=ttyAMA0";
> +        };
> +
> +        module@30000000 {
> +            compatible = "multiboot,ramdisk", "multiboot,module";
> +            reg = <0x3000000 0xffffff>;
> +        };
> +    };
> +
> +**Note:** If no color configuration is provided for a domain, the default one,
> +which corresponds to all available colors, is used instead.

Looking at your code, it will use *all* the colors. Some of the colors 
might have been assigned to a domain. I am not entirely convinced this 
is good idea to allow this as a default setup.


> +
>   Known issues and limitations
>   ****************************
>   
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bbd955e9c2..e9f9862e9c 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -162,6 +162,10 @@ with the following properties:
>   
>       An integer specifying the number of vcpus to allocate to the guest.
>   
> +- llc-colors
> +    A string specifying the LLC color configuration for the guest.
> +    Refer to "docs/misc/arm/cache_coloring.rst" for syntax.
> +
>   - vpl011
>   
>       An empty property to enable/disable a virtual pl011 for the guest to
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 1142f7f74a..eb39f5291f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -850,6 +850,7 @@ void __init create_domUs(void)
>       struct dt_device_node *node;
>       const struct dt_device_node *cpupool_node,
>                                   *chosen = dt_find_node_by_path("/chosen");
> +    const char *llc_colors_str = NULL;
>   
>       BUG_ON(chosen == NULL);
>       dt_for_each_child_node(chosen, node)
> @@ -993,6 +994,13 @@ void __init create_domUs(void)
>   #endif
>           }
>   
> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> +        if ( llc_coloring_enabled && !llc_colors_str )
> +            panic("'llc-colors' is required when LLC coloring is enabled\n");

In the documentation you wrote:

"**Note:** If no color configuration is provided for a domain, the 
default one,which corresponds to all available colors, is used instead."

I interpret as you want to continue rather than panic-ing. That said, I 
much prefer the panic version.

> +        else if ( !llc_coloring_enabled && llc_colors_str)
> +            printk(XENLOG_WARNING
> +                   "'llc-colors' found, but LLC coloring is disabled\n");
> +
>           /*
>            * The variable max_init_domid is initialized with zero, so here it's
>            * very important to use the pre-increment operator to call
> @@ -1003,6 +1011,11 @@ void __init create_domUs(void)
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
>   
> +        if ( llc_coloring_enabled &&
> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
> +                  dt_node_name(node), rc);
> +
>           d->is_console = true;
>           dt_device_set_used_by(node, d->domain_id);
>   
> diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
> index ee5551e3cc..5f9b0a8121 100644
> --- a/xen/arch/arm/include/asm/llc-coloring.h
> +++ b/xen/arch/arm/include/asm/llc-coloring.h
> @@ -15,6 +15,7 @@
>   
>   bool __init llc_coloring_init(void);
>   int dom0_set_llc_colors(struct domain *d);
> +int domain_set_llc_colors_from_str(struct domain *d, const char *str);
>   
>   #endif /* __ASM_ARM_COLORING_H__ */
>   
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index a08614ec36..d3de5f14cb 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -295,6 +295,23 @@ int domain_set_llc_colors_domctl(struct domain *d,
>       return domain_check_colors(d);
>   }
>   
> +int domain_set_llc_colors_from_str(struct domain *d, const char *str)
> +{
> +    int err;
> +
> +    if ( domain_alloc_colors(d, nr_colors) )

This code is somewhat confusing and would deserve some explanation. 
AFAICT, you are allocating a large array because parse_color_config() 
expects an array of nr_colors.

d->num_llc_colors will also be set to nr_colors but then overriden by 
parse_color_config().

It feels to me that maybe set num_llc_colors() in domain_alloc_colors() 
is not right.

> +        return -ENOMEM;
> +
> +    err = parse_color_config(str, d->llc_colors, &d->num_llc_colors);
> +    if ( err )
> +    {
> +        printk(XENLOG_ERR "Error parsing LLC color configuration.");
> +        return err;
> +    }
> +
> +    return domain_check_colors(d);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C

Cheers,

-- 
Julien Grall

