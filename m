Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19697B38A4E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 21:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096897.1451460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urLzH-0006o7-9F; Wed, 27 Aug 2025 19:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096897.1451460; Wed, 27 Aug 2025 19:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urLzH-0006m5-6H; Wed, 27 Aug 2025 19:39:15 +0000
Received: by outflank-mailman (input) for mailman id 1096897;
 Wed, 27 Aug 2025 19:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73cR=3H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urLzG-0006lY-6d
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 19:39:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80bd914d-837d-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 21:39:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B0164174A;
 Wed, 27 Aug 2025 19:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C606CC4CEF4;
 Wed, 27 Aug 2025 19:39:07 +0000 (UTC)
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
X-Inumbo-ID: 80bd914d-837d-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756323549;
	bh=7Y/0urpoyzwV3W43SVFyUKSuY0dlGUUH2UBFFsep3N4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o754VcdPFrl/At3exWgpmM3ttP8fA68+r94whTjsUceJTBAuu82BxTove6Fs8almM
	 9uiIQVkU1QTYr4+wL+R9sfSMhCfOiw6WzLp4jR/bohmrEOWzTJB5f8+F10qBUc3/RF
	 CM25/bYqGGnlsT+XgmRH0FagbSAh4Bf4DMtml2wt0tSmRJa0leigJhQgeiuk1YdAWU
	 KX5VtAg0xA6Kt2TpVA3D9ZimnDDaDHT6akEy9hVmBizWAaTc51eTUT1+mYdMf87kzs
	 MP1xgIpIQvCYOEqJdDR0Zgt4xy5d2zFAySUmBWYdmm83ywwqK5RHdikm6Hk1vHvXwo
	 ppXjSRSoWcmmQ==
Date: Wed, 27 Aug 2025 12:39:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
In-Reply-To: <1f64aa13-d9d3-4b58-9581-a45f7173430b@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508271239020.3391208@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <a6a538ca4c02483e745f18db4f74504dad525fe6.1753184487.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2508221709020.2743087@ubuntu-linux-20-04-desktop>
 <1f64aa13-d9d3-4b58-9581-a45f7173430b@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Aug 2025, Oleksii Moisieiev wrote:
> On 23/08/2025 03:26, Stefano Stabellini wrote:
> > On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> >> From: Grygorii Strashko <grygorii_strashko@epam.com>
> >>
> >> The introduced SCI (System Control Interface) subsystem provides unified
> >> interface to integrate in Xen SCI drivers which adds support for ARM
> >> firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
> >> system management. The SCI subsystem allows to add drivers for different FW
> >> interfaces or have different drivers for the same FW interface (for example,
> >> SCMI with different transports).
> >>
> >> This patch updates SCMI over SMC calls handling layer, introduced by
> >> commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
> >> layer"), to be SCI driver:
> >> - convert to DT device;
> >> - convert to SCI Xen interface.
> >>
> >> There are no functional changes in general, the driver is just adopted
> >> to the SCI interface.
> >>
> >> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> >> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> >> ---
> >>
> >>
> >>
> >>   xen/arch/arm/firmware/Kconfig                | 13 ++-
> >>   xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
> >>   xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
> >>   xen/arch/arm/vsmc.c                          |  5 +-
> >>   xen/include/public/arch-arm.h                |  1 +
> >>   5 files changed, 64 insertions(+), 89 deletions(-)
> >>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> >>
> >> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> >> index fc7918c7fc..bbf88fbb9a 100644
> >> --- a/xen/arch/arm/firmware/Kconfig
> >> +++ b/xen/arch/arm/firmware/Kconfig
> >> @@ -8,9 +8,18 @@ config ARM_SCI
> >>   
> >>   menu "Firmware Drivers"
> >>   
> >> +choice
> >> +	prompt "ARM SCI driver type"
> >> +	default SCMI_SMC
> >> +	help
> >> +	Choose which ARM SCI driver to enable.
> >> +
> >> +config ARM_SCI_NONE
> >> +	bool "none"
> >> +
> >>   config SCMI_SMC
> >>   	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
> >> -	default y
> >> +	select ARM_SCI
> >>   	help
> >>   	  This option enables basic awareness for SCMI calls using SMC as
> >>   	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> >> @@ -18,4 +27,6 @@ config SCMI_SMC
> >>   	  firmware node is used to trap and forward corresponding SCMI SMCs
> >>   	  to firmware running at EL3, for calls coming from the hardware domain.
> >>   
> >> +endchoice
> >> +
> >>   endmenu
> >> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> >> index 33473c04b1..13d1137592 100644
> >> --- a/xen/arch/arm/firmware/scmi-smc.c
> >> +++ b/xen/arch/arm/firmware/scmi-smc.c
> >> @@ -9,6 +9,7 @@
> >>    * Copyright 2024 NXP
> >>    */
> >>   
> >> +#include <asm/device.h>
> >>   #include <xen/acpi.h>
> >>   #include <xen/device_tree.h>
> >>   #include <xen/errno.h>
> >> @@ -16,12 +17,11 @@
> >>   #include <xen/sched.h>
> >>   #include <xen/types.h>
> >>   
> >> +#include <asm/firmware/sci.h>
> >>   #include <asm/smccc.h>
> >> -#include <asm/firmware/scmi-smc.h>
> >>   
> >>   #define SCMI_SMC_ID_PROP   "arm,smc-id"
> >>   
> >> -static bool __ro_after_init scmi_enabled;
> >>   static uint32_t __ro_after_init scmi_smc_id;
> >>   
> >>   /*
> >> @@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
> >>    *
> >>    * Returns true if SMC was handled (regardless of response), false otherwise.
> >>    */
> >> -bool scmi_handle_smc(struct cpu_user_regs *regs)
> >> +static bool scmi_handle_smc(struct cpu_user_regs *regs)
> >>   {
> >>       uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> >>       struct arm_smccc_res res;
> >>   
> >> -    if ( !scmi_enabled )
> >> -        return false;
> >> -
> >>       if ( !scmi_is_valid_smc_id(fid) )
> >>           return false;
> >>   
> >> @@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
> >>       return true;
> >>   }
> >>   
> >> -static int __init scmi_check_smccc_ver(void)
> >> +static int scmi_smc_domain_init(struct domain *d,
> >> +                                struct xen_domctl_createdomain *config)
> >>   {
> >> -    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> >> -    {
> >> -        printk(XENLOG_WARNING
> >> -               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> >> -        return -ENOSYS;
> >> -    }
> >> +    if ( !is_hardware_domain(d) )
> >> +        return 0;
> > Should we also check for config->arch.sci_type ==
> > XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC ?
> >
> Current changes assume that only SCMI_SMC is present. This check was 
> added in the subsequent patch when multiagent was introduced.

In theory ARM_SCI_NONE is possible?


