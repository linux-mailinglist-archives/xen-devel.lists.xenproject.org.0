Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD1959207
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 03:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780827.1190435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZnr-0002ma-7l; Wed, 21 Aug 2024 01:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780827.1190435; Wed, 21 Aug 2024 01:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZnr-0002kE-43; Wed, 21 Aug 2024 01:06:23 +0000
Received: by outflank-mailman (input) for mailman id 780827;
 Wed, 21 Aug 2024 01:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgZnp-0002i4-A2
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 01:06:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92d8c06e-5f59-11ef-a507-bb4a2ccca743;
 Wed, 21 Aug 2024 03:06:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCE9260F8B;
 Wed, 21 Aug 2024 01:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7532C4AF09;
 Wed, 21 Aug 2024 01:06:16 +0000 (UTC)
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
X-Inumbo-ID: 92d8c06e-5f59-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724202378;
	bh=BH13lVKJeuyYp6L1+dnUtBn/qLzJxA6G2U25oUKFM4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZxYLv8Q6Y3WJJSFg30UoNe13lZII8LCgE6umdvgR6zt6BDmswGS45cenceElKsTmQ
	 CPNB49rZ21GTH0S1NK8rCAQpWowBtU66rWXV2yhPk9tM7uedSMzanFk8lXN0Xp3tPS
	 vJEGax8nAJQ0AKB83On5f/M1SxFJEdoInu7p6qKjwTOobZaUTrlXYC45TqD7IDr0Km
	 8De3/KVo2yNGF9NWWG6jNUnB6eY6+EuAN2hece54HuzRlkoCQFUMpMsosC/++QwxZB
	 AFutFtDqqve8dJOHx+sIywc+UPI6OcvBZG6HIDUkoHs5P1/lJm9iKH6dIR+dkOWGL0
	 qqELwFAvYsUYQ==
Date: Tue, 20 Aug 2024 18:06:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 06/12] hw/arm: xenpvh: Move stubbed functions to
 xen-stubs.c
In-Reply-To: <20240820142949.533381-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201806100.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/meson.build |  5 ++++-
>  hw/arm/xen-stubs.c | 32 ++++++++++++++++++++++++++++++++
>  hw/arm/xen_arm.c   | 20 --------------------
>  3 files changed, 36 insertions(+), 21 deletions(-)
>  create mode 100644 hw/arm/xen-stubs.c
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 0c07ab522f..074612b40c 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -59,7 +59,10 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> -arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add(when: 'CONFIG_XEN', if_true: files(
> +  'xen-stubs.c',
> +  'xen_arm.c',
> +))
>  
>  system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>  system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
> diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
> new file mode 100644
> index 0000000000..4ac6a56a96
> --- /dev/null
> +++ b/hw/arm/xen-stubs.c
> @@ -0,0 +1,32 @@
> +/*
> + * Stubs for unimplemented Xen functions for ARM.
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qapi/qapi-commands-migration.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/xen/xen-hvm-common.h"
> +#include "hw/xen/arch_hvm.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> +{
> +    hw_error("Invalid ioreq type 0x%x\n", req->type);
> +    return;
> +}
> +
> +void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
> +                         bool add)
> +{
> +}
> +
> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> +{
> +}
> +
> +void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> +{
> +}
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 16b3f00992..f0868e7be5 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -115,26 +115,6 @@ static void xen_init_ram(MachineState *machine)
>      memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
>  }
>  
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> -{
> -    hw_error("Invalid ioreq type 0x%x\n", req->type);
> -
> -    return;
> -}
> -
> -void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
> -                         bool add)
> -{
> -}
> -
> -void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> -{
> -}
> -
> -void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> -{
> -}
> -
>  #ifdef CONFIG_TPM
>  static void xen_enable_tpm(XenArmState *xam)
>  {
> -- 
> 2.43.0
> 

