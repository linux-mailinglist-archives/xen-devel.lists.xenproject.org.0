Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D598AFE1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807638.1219200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svOxe-00037P-5h; Mon, 30 Sep 2024 22:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807638.1219200; Mon, 30 Sep 2024 22:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svOxe-00034w-2O; Mon, 30 Sep 2024 22:33:46 +0000
Received: by outflank-mailman (input) for mailman id 807638;
 Mon, 30 Sep 2024 22:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svOxc-00034q-AA
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:33:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0adb2399-7f7c-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 00:33:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F33F05C4D4C;
 Mon, 30 Sep 2024 22:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B7BC4CEC7;
 Mon, 30 Sep 2024 22:33:37 +0000 (UTC)
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
X-Inumbo-ID: 0adb2399-7f7c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727735618;
	bh=duHfxXcLw5HwOYVd/0wXOj0kRXz2oJCa0Qd9pIiMI5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GSgMHZF/O/+IcFCnehOS+I8O58VFLWZbwlluuN6cBuC/7YDJbPYELjkO6bXiFJNu+
	 fPTfX80aC1kvixXcBZb1QfhnHiHNMtoQEuHIIdfn3RAgKGhQqSyi7XfV8Ij8M9HzGN
	 WD9D5DNEEOIlVtIAhIq2XM/rjDaW0RbDf9Cr5FNeQ8TMFI7OoG024vWw3GsUWdsXQd
	 n5r7wYr0YaeNhcLa0WgRs3Ywv9Ey/lNrGmxESH6Lyz0tUh8ftz5bLW3MoI69jdsm1Y
	 BHrgk0vLrLMRVY6Ts1XZRCMFVJDb7qpNIQSX2FoHeaKmXQvMkxL0ZMKUO3o4TprVdL
	 b3jxJkVzcO2RA==
Date: Mon, 30 Sep 2024 15:33:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
In-Reply-To: <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409301533260.451631@ubuntu-linux-20-04-desktop>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com> <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Introduce the SCMI layer to have some basic degree of awareness
> about SMC calls that are based on the ARM System Control and
> Management Interface (SCMI) specification (DEN0056E).
> 
> The SCMI specification includes various protocols for managing
> system-level resources, such as: clocks, pins, reset, system power,
> power domains, performance domains, etc. The clients are named
> "SCMI agents" and the server is named "SCMI platform".
> 
> Only support the shared-memory based transport with SMCs as
> the doorbell mechanism for notifying the platform. Also, this
> implementation only handles the "arm,scmi-smc" compatible,
> requiring the following properties:
> 	- "arm,smc-id" (unique SMC ID)
> 	- "shmem" (one or more phandles pointing to shmem zones
> 	for each channel)
> 
> The initialization is done as 'presmp_initcall', since we need
> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
> If no "arm,scmi-smc" compatible node is found in Dom0's
> DT, the initialization fails silently, as it's not mandatory.
> Otherwise, we get the 'arm,smc-id' DT property from the node,
> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
> are not validated, as the SMC calls are only passed through
> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
> running.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/Kconfig                |  10 ++
>  xen/arch/arm/Makefile               |   1 +
>  xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>  xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>  create mode 100644 xen/arch/arm/scmi-smc.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 323c967361..adf53e2de1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>  	  not been emulated to their complete functionality. Enabling this might
>  	  result in unwanted/non-spec compliant behavior.
>  
> +config SCMI_SMC
> +	bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
> +	default y
> +	help
> +	  This option enables basic awareness for SCMI calls using SMC as
> +	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> +	  compatible only). The value of "arm,smc-id" DT property from SCMI
> +	  firmware node is used to trap and forward corresponding SCMI SMCs
> +	  to firmware running at EL3, if the call comes from Dom0.
> +
>  endmenu
>  
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..b85ad9c13f 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>  obj-y += physdev.o
>  obj-y += processor.o
>  obj-y += psci.o
> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>  obj-y += setup.o
>  obj-y += shutdown.o
>  obj-y += smp.o
> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/include/asm/scmi-smc.h
> new file mode 100644
> index 0000000000..c6c0079e86
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/scmi-smc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/include/asm/scmi-smc.h
> + *
> + * ARM System Control and Management Interface (SCMI) over SMC
> + * Generic handling layer
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __ASM_SCMI_SMC_H__
> +#define __ASM_SCMI_SMC_H__
> +
> +#include <xen/types.h>
> +#include <asm/regs.h>
> +
> +#ifdef CONFIG_SCMI_SMC
> +
> +bool scmi_is_enabled(void);
> +bool scmi_is_valid_smc_id(uint32_t fid);
> +bool scmi_handle_smc(struct cpu_user_regs *regs);
> +
> +#else
> +
> +static inline bool scmi_is_enabled(void)
> +{
> +    return false;
> +}
> +
> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
> +{
> +    return false;
> +}
> +
> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_SCMI_SMC */
> +
> +#endif /* __ASM_SCMI_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/scmi-smc.c b/xen/arch/arm/scmi-smc.c
> new file mode 100644
> index 0000000000..373ca7ba5f
> --- /dev/null
> +++ b/xen/arch/arm/scmi-smc.c
> @@ -0,0 +1,163 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/scmi-smc.c
> + *
> + * ARM System Control and Management Interface (SCMI) over SMC
> + * Generic handling layer
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2024 NXP
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/scmi-smc.h>
> +#include <asm/smccc.h>
> +
> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
> +
> +static bool scmi_support;
> +static uint32_t scmi_smc_id;
> +
> +/* Check if SCMI layer correctly initialized and can be used. */
> +bool scmi_is_enabled(void)
> +{
> +    return scmi_support;
> +}
> +
> +/*
> + * Check if provided SMC Function Identifier matches the one known by the SCMI
> + * layer, as read from DT prop 'arm,smc-id' during initialiation.
> + */
> +bool scmi_is_valid_smc_id(uint32_t fid)
> +{
> +    return (fid == scmi_smc_id);
> +}
> +
> +/*
> + * Generic handler for SCMI-SMC requests, currently only forwarding the
> + * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
> + * Can also be called from `platform_smc()` plat-specific callback.
> + *
> + * Returns true if SMC was handled (regardless of response), false otherwise.
> + */
> +bool scmi_handle_smc(struct cpu_user_regs *regs)
> +{
> +    struct arm_smccc_res res;
> +
> +    /* Only the hardware domain should use SCMI calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",
> +                current->domain->domain_id);
> +        return false;
> +    }
> +
> +    /* For the moment, forward the SCMI Request to FW running at EL3 */
> +    arm_smccc_1_1_smc(scmi_smc_id,
> +                      get_user_reg(regs, 1),
> +                      get_user_reg(regs, 2),
> +                      get_user_reg(regs, 3),
> +                      get_user_reg(regs, 4),
> +                      get_user_reg(regs, 5),
> +                      get_user_reg(regs, 6),
> +                      get_user_reg(regs, 7),
> +                      &res);
> +
> +    set_user_reg(regs, 0, res.a0);
> +    set_user_reg(regs, 1, res.a1);
> +    set_user_reg(regs, 2, res.a2);
> +    set_user_reg(regs, 3, res.a3);
> +
> +    return true;
> +}
> +
> +static int __init scmi_check_smccc_ver(void)
> +{
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> +    {
> +        printk(XENLOG_ERR
> +               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> +        return -ENOSYS;
> +    }
> +
> +    return 0;
> +}
> +
> +static int __init scmi_dt_init_smccc(void)
> +{
> +    static const struct dt_device_match scmi_ids[] __initconst =
> +    {
> +        /* We only support "arm,scmi-smc" binding for now */
> +        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
> +        { /* sentinel */ },
> +    };
> +    const struct dt_device_node *scmi_node;
> +    const char *smc_id_prop = SCMI_SMC_ID_PROP;
> +    int ret;
> +
> +    /* If no SCMI firmware node found, fail silently as it's not mandatory */
> +    scmi_node = dt_find_matching_node(NULL, scmi_ids);
> +    if ( !scmi_node )
> +        return -EOPNOTSUPP;
> +
> +    ret = dt_property_read_u32(scmi_node, smc_id_prop, &scmi_smc_id);
> +    if ( !ret )
> +    {
> +        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
> +               smc_id_prop, scmi_node->full_name);
> +        return -ENOENT;
> +    }
> +
> +    scmi_support = true;
> +
> +    return 0;
> +}
> +
> +/* Initialize the SCMI layer based on SMCs and Device-tree */
> +static int __init scmi_init(void)
> +{
> +    int ret;
> +
> +    if ( !acpi_disabled )
> +    {
> +        printk("SCMI is not supported when using ACPI\n");
> +        return -EINVAL;
> +    }
> +
> +    ret = scmi_check_smccc_ver();
> +    if ( ret )
> +        goto err;
> +
> +    ret = scmi_dt_init_smccc();
> +    if ( ret == -EOPNOTSUPP )
> +        return ret;
> +    if ( ret )
> +        goto err;
> +
> +    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
> +
> +    return 0;
> +
> +err:
> +    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
> +    return ret;
> +}
> +
> +presmp_initcall(scmi_init);
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
> -- 
> 2.45.2
> 

