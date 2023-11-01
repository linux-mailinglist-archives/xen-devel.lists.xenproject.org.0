Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD17DE627
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 19:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626615.977014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGJC-00075R-SD; Wed, 01 Nov 2023 18:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626615.977014; Wed, 01 Nov 2023 18:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGJC-00072y-PV; Wed, 01 Nov 2023 18:51:18 +0000
Received: by outflank-mailman (input) for mailman id 626615;
 Wed, 01 Nov 2023 18:51:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyGJC-00072s-15
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 18:51:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyGJB-0001Pd-Gk; Wed, 01 Nov 2023 18:51:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[10.95.171.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyGJB-0002W5-9y; Wed, 01 Nov 2023 18:51:17 +0000
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
	bh=6dcS1j9HYq9c/byVQGW4O8OE5kylsF635B+I5wI8WNU=; b=zZDSLuyu6z7WIlJrx6yNq+BGrS
	v5jQOJaXgdeEGrQ3TwPwt2sYEyNZlRsR0nn8CEoDa8OyKf/VuEP0f2XX4q9Q2hALgAA1E0+uQf8QF
	yTQqWu1jntRE24oBtxaeSeAo1lHK6fQHa7eHGZYNU0qDPDtNvddAz5Kd1oxFzREBnges=;
Message-ID: <ac71e580-3d81-4024-b19c-d3d954df5948@xen.org>
Date: Wed, 1 Nov 2023 18:51:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230927140133.631192-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 27/09/2023 15:01, Luca Fancellu wrote:
> Currently the dom0less feature code is mostly inside domain_build.c
> and setup.c, it is a feature that may not be useful to everyone so
> put the code in a different compilation module in order to make it
> easier to disable the feature in the future.
> 
> Move gic_interrupt_t in domain_build.h to use it with the function
> declaration, move its comment above the declaration.
> 
> The following functions are now visible externally from domain_build
> because they are used also from the dom0less-build module:
>   - get_allocation_size
>   - set_interrupt
>   - domain_fdt_begin_node
>   - make_memory_node
>   - make_resv_memory_node
>   - make_hypervisor_node
>   - make_psci_node
>   - make_cpus_node
>   - make_timer_node
>   - handle_device_interrupts
>   - construct_domain
>   - process_shm
> 
> The functions allocate_static_memory and assign_static_memory_11
> are now externally visible, so put their declarations into
> domain_build.h and move the #else and stub definition in the header
> as well.
> 
> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
> externally visible.
> 
> Where spotted, fix code style issues.
> 
> No functional change is intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Makefile                     |    1 +
>   xen/arch/arm/dom0less-build.c             | 1087 ++++++++++++++++++
>   xen/arch/arm/domain_build.c               | 1276 ++-------------------
>   xen/arch/arm/include/asm/dom0less-build.h |   25 +
>   xen/arch/arm/include/asm/domain_build.h   |   58 +
>   xen/arch/arm/include/asm/setup.h          |    1 -
>   xen/arch/arm/setup.c                      |   33 +-
>   7 files changed, 1288 insertions(+), 1193 deletions(-)
>   create mode 100644 xen/arch/arm/dom0less-build.c
>   create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 81c31c36fc3d..70dd7201ef30 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -15,6 +15,7 @@ obj-y += cpufeature.o
>   obj-y += decode.o
>   obj-y += device.o
>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
> +obj-y += dom0less-build.init.o
>   obj-y += domain.o
>   obj-y += domain_build.init.o
>   obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> new file mode 100644
> index 000000000000..dc9c90cf00a7
> --- /dev/null
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -0,0 +1,1087 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/dom0less-build.c
> + *
> + * Code related to the dom0less functionality
> + *
> + * Copyright (C) 2023 Arm Ltd.

This feels a bit odd to add your copyright here. It sounds like Arm 
wrote all the code, but you only moved. That said, I am not a lawyer.

> + */
> +
> +#include <xen/device_tree.h>
> +#include <xen/err.h>
> +#include <xen/event.h>
> +#include <xen/grant_table.h>
> +#include <xen/iocap.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/sched.h>
> +#include <xen/serial.h>
> +#include <xen/sizes.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/arm64/sve.h>
> +#include <asm/dom0less-build.h>
> +#include <asm/domain_build.h>
> +
> +bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found = false;
> +    bool domUfound = false;
> +
> +    /* Look into the bootmodules */
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind == BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU == false )
> +            {
> +                dom0found = true;
> +                break;
> +            }
> +            else
> +                domUfound = true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode
> +     */
> +    return ( !dom0found && domUfound );
> +}
> +
> +static bool __init allocate_bank_memory(struct domain *d,
> +                                        struct kernel_info *kinfo,
> +                                        gfn_t sgfn,
> +                                        paddr_t tot_size)

I understand that this is today only used by domUs. However, we could 
technically use it for allocating dom0 memory if it is not 1:1.

So I think this function should stay in domain_build.c.

The rest of the code movement looks alright to me.

Cheers,

-- 
Julien Grall

