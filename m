Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3699CFE46
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838752.1254737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGEQ-0007yO-Jt; Sat, 16 Nov 2024 10:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838752.1254737; Sat, 16 Nov 2024 10:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGEQ-0007vD-GP; Sat, 16 Nov 2024 10:40:46 +0000
Received: by outflank-mailman (input) for mailman id 838752;
 Sat, 16 Nov 2024 10:40:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCGEP-0007ui-7K
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:40:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGEO-0080Bw-21;
 Sat, 16 Nov 2024 10:40:44 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGEO-007w3e-2M;
 Sat, 16 Nov 2024 10:40:44 +0000
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
	bh=WCD75x8v1BnjbJnwUk3aPwiQWY+ACO7gwCHDEOJBWyQ=; b=IjFdBxZ/U1oFYPN0d4yt6s8dul
	1fXRQYb1WMJlKyEHQyVLMhD27BmuXWigobfk46bXInHv99AteQkLvOCBfplbNsrXIyFBUQtfMop6f
	5RS7pItjE0lgW18SEtcpi3FB4n9qNejyjlSSDLWnWYc3ZmBIL+aBG7/xqYQbMV8MeEEE=;
Message-ID: <3632e6df-410f-4147-b975-17ee7055b434@xen.org>
Date: Sat, 16 Nov 2024 10:40:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/common: Move gic_dt_preinit() to common code
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <0fa60e73eccb620ad37037e2128deea7a97f726b.1730457699.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0fa60e73eccb620ad37037e2128deea7a97f726b.1730457699.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/11/2024 12:55, Oleksii Kurochko wrote:
> Introduce intc_dt_preinit() in the common codebase, as it is not
> architecture-specific and can be reused by both PPC and RISC-V.
> This function identifies the node with the interrupt-controller property
> in the device tree and calls device_init() to handle architecture-specific
> initialization of the interrupt controller.
> 
> Make minor adjustments compared to the original ARM implementation of
> gic_dt_preinit():
>   - Remove the local rc variable in gic_dt_preinit() since it is only used once.
>   - Change the prefix from gic to intc to clarify that the function is not
>     specific to ARM’s GIC, making it suitable for other architectures as well.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>   - s/ic/intc.
>   - Update the commit message.
>   - Move intc_dt_preinit() to common/device-tree/intc.c.
>   - Add declaration of intc_dt_preinit() in xen/device_tree.h.
>   - Revert intc_preinit()-related changes and just back gic_preinit() in
>     Arm's gic.c.
>   - Revert ACPI-related changes.
> ---
> Changes in v2:
>   - Revert changes connected to moving of gic_acpi_preinit() to common code as
>     it isn't really architecture indepent part.
>   - Update the commit message.
>   - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
>     CONFIG_ACPI=n.
> ---
>   xen/arch/arm/gic.c              | 32 +------------------------------
>   xen/common/device-tree/Makefile |  1 +
>   xen/common/device-tree/intc.c   | 34 +++++++++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h   |  6 ++++++
>   4 files changed, 42 insertions(+), 31 deletions(-)
>   create mode 100644 xen/common/device-tree/intc.c
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 3eaf670fd7..acf61a4de3 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -214,36 +214,6 @@ int gic_map_hwdom_extra_mappings(struct domain *d)
>       return 0;
>   }
>   
> -static void __init gic_dt_preinit(void)
> -{
> -    int rc;
> -    struct dt_device_node *node;
> -    uint8_t num_gics = 0;
> -
> -    dt_for_each_device_node( dt_host, node )
> -    {
> -        if ( !dt_get_property(node, "interrupt-controller", NULL) )
> -            continue;
> -
> -        if ( !dt_get_parent(node) )
> -            continue;
> -
> -        rc = device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL);
> -        if ( !rc )
> -        {
> -            /* NOTE: Only one GIC is supported */
> -            num_gics = 1;
> -            break;
> -        }
> -    }
> -    if ( !num_gics )
> -        panic("Unable to find compatible GIC in the device tree\n");
> -
> -    /* Set the GIC as the primary interrupt controller */
> -    dt_interrupt_controller = node;
> -    dt_device_set_used_by(node, DOMID_XEN);
> -}
> -
>   #ifdef CONFIG_ACPI
>   static void __init gic_acpi_preinit(void)
>   {
> @@ -269,7 +239,7 @@ static void __init gic_acpi_preinit(void) { }
>   void __init gic_preinit(void)
>   {
>       if ( acpi_disabled )
> -        gic_dt_preinit();
> +        intc_dt_preinit();
>       else
>           gic_acpi_preinit();
>   }
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 58052d074e..7c549be38a 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -2,3 +2,4 @@ obj-y += bootfdt.init.o
>   obj-y += bootinfo.init.o
>   obj-y += device-tree.o
>   obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> +obj-y += intc.o
> diff --git a/xen/common/device-tree/intc.c b/xen/common/device-tree/intc.c
> new file mode 100644
> index 0000000000..e726daeb26
> --- /dev/null
> +++ b/xen/common/device-tree/intc.c
> @@ -0,0 +1,34 @@
> +

Missing SPDX. Because this code is not brand new, the license will 
derive from gic.c which is unfortunately GPLv2+. So it would need to be:

/* SPDX-License-Identifier: GPL-2.0-or-later */

> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +
> +void __init intc_dt_preinit(void)
> +{
> +    struct dt_device_node *node;
> +    uint8_t num_gics = 0;

I think you want to rename this variable to num_intc.

> +
> +    dt_for_each_device_node( dt_host, node )
> +    {
> +        if ( !dt_get_property(node, "interrupt-controller", NULL) )
> +            continue;
> +
> +        if ( !dt_get_parent(node) )
> +            continue;
> +
> +        if ( !device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL) )
> +        {
> +            /* NOTE: Only one GIC is supported */

And this probably need to be updated to "Only one interrupt controlled 
is supported".

> +            num_gics = 1;
> +            break;
> +        }
> +    }
> +
> +    if ( !num_gics )
> +        panic("Unable to find compatible interrupt contoller"
> +              "in the device tree\n");
> +
> +    /* Set the interrupt controller as the primary interrupt controller */
> +    dt_interrupt_controller = node;
> +    dt_device_set_used_by(node, DOMID_XEN);
> +}
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index e6287305a7..33d70b9594 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -238,6 +238,12 @@ extern rwlock_t dt_host_lock;
>   struct dt_device_node *
>   dt_find_interrupt_controller(const struct dt_device_match *matches);
>   
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +void intc_dt_preinit(void);
> +#else
> +static inline void intc_dt_preinit(void) { }
> +#endif
> +
>   #define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
>   #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>   #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))

Cheers,

-- 
Julien Grall

