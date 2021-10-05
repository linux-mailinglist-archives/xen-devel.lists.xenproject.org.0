Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90598421AEF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 02:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201791.356416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXuD-0001Yh-JT; Tue, 05 Oct 2021 00:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201791.356416; Tue, 05 Oct 2021 00:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXuD-0001Wh-Fs; Tue, 05 Oct 2021 00:02:01 +0000
Received: by outflank-mailman (input) for mailman id 201791;
 Tue, 05 Oct 2021 00:01:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXXuB-0001Wb-Mv
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 00:01:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e357281-1c92-4a94-aa74-7fce28abf6e5;
 Tue, 05 Oct 2021 00:01:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABDBA6109F;
 Tue,  5 Oct 2021 00:01:57 +0000 (UTC)
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
X-Inumbo-ID: 0e357281-1c92-4a94-aa74-7fce28abf6e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633392118;
	bh=QDXR8GQPm28lq9EFaB3/ihK8Y0H6KJF1g8s2pyNW1iQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CSLoUPxW5qzG+59ZH21g3i5gDp2K00BKePLVl8JPZlQtu4c4IkUfQq83a400tUn1K
	 vaAJGUy/oNB0s6Do0qazm5GbAbaneIDZ9mt9N8Cn1bB5rymF1IoStedsgETm5nr8gw
	 tZ3KtKagZVs6zfyTAfqT7Hx4VUf0pBhnC2386TCCW6/ekWz+p3ZSVJ76OIazGgmW1m
	 tqvZ58Ab1dH/wLq+Nqh8izv/5v4ihvX6QDQponqijtfegi9Kqg4RscBPJWmE9m4219
	 w9t1sU1wyHCYvAZ8V9e3rj7W1NUp1Emqysqr6CuJdtFT4UEwksNql/L6uSA6a91O6H
	 sAJkwQStprwEg==
Date: Mon, 4 Oct 2021 17:01:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 08/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
In-Reply-To: <0d4157f3446a974cc69005b9ea0d5b1716e78f41.1633340795.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2110041659500.3209@sstabellini-ThinkPad-T480s>
References: <cover.1633340795.git.rahul.singh@arm.com> <0d4157f3446a974cc69005b9ea0d5b1716e78f41.1633340795.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Oct 2021, Rahul Singh wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> space to the XEN memory.
> 
> Patch helps to understand how the generic infrastructure for PCI
> host-bridge discovery will be used for future references.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v4:
> - Add __initconstrel and __init for struct and functions
> - Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Change in v3:
> - nwl_cfg_reg_index(..) as static function
> - Add support for pci_host_generic_probe()
> Change in v2:
> - Add more info in commit msg
> ---
> ---
>  xen/arch/arm/pci/Makefile          |  1 +
>  xen/arch/arm/pci/pci-host-zynqmp.c | 65 ++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index 6f32fbbe67..1d045ade01 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -3,3 +3,4 @@ obj-y += pci-access.o
>  obj-y += pci-host-generic.o
>  obj-y += pci-host-common.o
>  obj-y += ecam.o
> +obj-y += pci-host-zynqmp.o
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> new file mode 100644
> index 0000000000..61a9807d3d
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -0,0 +1,65 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/device.h>
> +#include <asm/pci.h>
> +
> +static int __init nwl_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "cfg");
> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops nwl_pcie_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = nwl_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +    }
> +};
> +
> +static const struct dt_device_match __initconstrel nwl_pcie_dt_match[] =
> +{
> +    { .compatible = "xlnx,nwl-pcie-2.11" },
> +    { },
> +};
> +
> +static int __init pci_host_generic_probe(struct dt_device_node *dev,
> +                                         const void *data)
> +{
> +    return pci_host_common_probe(dev, &nwl_pcie_ops);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +.dt_match = nwl_pcie_dt_match,
> +.init = pci_host_generic_probe,
> +DT_DEVICE_END
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
> 2.25.1
> 

