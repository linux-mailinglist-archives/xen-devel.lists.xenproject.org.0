Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35298B871
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807887.1219599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZIa-0001xy-MP; Tue, 01 Oct 2024 09:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807887.1219599; Tue, 01 Oct 2024 09:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZIa-0001wS-Jc; Tue, 01 Oct 2024 09:36:04 +0000
Received: by outflank-mailman (input) for mailman id 807887;
 Tue, 01 Oct 2024 09:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZIZ-0001w2-67
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:36:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZIY-0007Sv-7y; Tue, 01 Oct 2024 09:36:02 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZIY-0005xe-0L; Tue, 01 Oct 2024 09:36:02 +0000
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
	bh=N6bl6iXNByHXOAv/LlmIckeETqGOSdMRyt+qALJ1Gb0=; b=tb5TC/Z5NPEumbLLCobLq+/zOf
	0l6VDnMz7ELjs1VQAUsO7kdEh3Jmjdx938PCmAmTqxhOnH+xJsT6bwOcAZmgK0g0NUnlU18ZfBXmz
	NKPs1rxRr6xT5COE77aI8LWTJ3MGP7pd/klSg1CDYL7o08P7lSR5Rgm4M+35vqHbdJAA=;
Message-ID: <e713ae46-104a-4414-8ad3-02ca8b0a521d@xen.org>
Date: Tue, 1 Oct 2024 10:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
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

presmp_initcall() should only be used when we really need to initialize 
a subsytem very early. But it is not clear why this can't be called in 
initcall. Can you clarify?

> If no "arm,scmi-smc" compatible node is found in Dom0's
> DT

You are checking the host device tree. Dom0's DT will be created by Xen 
based on the host device tree when the domain is ceated.

>, the initialization fails silently, as it's not mandatory.
> Otherwise, we get the 'arm,smc-id' DT property from the node,
> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
> are not validated, as the SMC calls are only passed through
> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
> running.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>   xen/arch/arm/Kconfig                |  10 ++
>   xen/arch/arm/Makefile               |   1 +
>   xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>   xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>   4 files changed, 226 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>   create mode 100644 xen/arch/arm/scmi-smc.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 323c967361..adf53e2de1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>   	  not been emulated to their complete functionality. Enabling this might
>   	  result in unwanted/non-spec compliant behavior.
>   
> +config SCMI_SMC
> +	bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"

Strictly speaking you are forwarding SMC from the hardware domain. For 
Arm, it is dom0 but it doesn't need to.

> +	default y
 > +	help> +	  This option enables basic awareness for SCMI calls using 
SMC as
> +	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> +	  compatible only). The value of "arm,smc-id" DT property from SCMI
> +	  firmware node is used to trap and forward corresponding SCMI SMCs
> +	  to firmware running at EL3, if the call comes from Dom0.

Same here.

 > +>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..b85ad9c13f 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>   obj-y += physdev.o
>   obj-y += processor.o
>   obj-y += psci.o
> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>   obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
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

AFAICT, the two variables should not change after boot. So they should 
be marked __ro_after_init.

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

s/dom0/hardware domain/

> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
> + * Can also be called from `platform_smc()` plat-specific callback.

I am not entirely sure I understand the value of calling the function 
from platform_smc(). I also don't see any use of it in this series, so 
probably best to remove the sentence for now.

 > + *> + * Returns true if SMC was handled (regardless of response), 
false otherwise.
> + */
> +bool scmi_handle_smc(struct cpu_user_regs *regs)
> +{
> +    struct arm_smccc_res res;
> +
> +    /* Only the hardware domain should use SCMI calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",

Please use %pd instead d%d. With that you can simply use...

> +                current->domain->domain_id);

... current->domain here.

 > +        return false;> +    }
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
 > +               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding 
disabled\n");> +        return -ENOSYS;
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

NIT: I would remove smc_id_prop and use SCMI_SMC_ID_PROP directly.

> +    int ret;
> +
> +    /* If no SCMI firmware node found, fail silently as it's not mandatory */
 > +    scmi_node = dt_find_matching_node(NULL, scmi_ids);> +    if ( 
!scmi_node )
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

NIT: Can you use XENLOG_WARN in front?

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

In the commit message, you said the SCMI subsystem was optional. But 
here you use XENLOG_ERR. Shouldn't it be a warn or XENLOG_INFO/XENLOG_WARN?

> +    return ret;
> +}
> +
> +presmp_initcall(scmi_init);

See my question above about using __initcall.

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

Cheers,

-- 
Julien Grall


