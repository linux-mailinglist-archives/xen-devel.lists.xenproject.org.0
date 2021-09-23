Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26E415563
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193278.344265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEDL-00036L-Ar; Thu, 23 Sep 2021 02:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193278.344265; Thu, 23 Sep 2021 02:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEDL-00033c-5z; Thu, 23 Sep 2021 02:11:55 +0000
Received: by outflank-mailman (input) for mailman id 193278;
 Thu, 23 Sep 2021 02:11:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTEDJ-00033P-21
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:11:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9da2e36e-1c13-11ec-ba04-12813bfff9fa;
 Thu, 23 Sep 2021 02:11:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0584160F6F;
 Thu, 23 Sep 2021 02:11:50 +0000 (UTC)
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
X-Inumbo-ID: 9da2e36e-1c13-11ec-ba04-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632363111;
	bh=xh93hQYHLTrmEWpKa/RRvkSMxY/bjEQtAb+dCCClAnw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=agXw60tK1DbRlICfzlzF6x0AQXXor78GwIYozAtKYl6aB/M7tr4NjHS/X0Qz8UiEC
	 yDreiuLLZBePeRDd6Eb1z/XNxtQGHsCcUy6GT9MSrVuTiM9UYgHiTDhJ/gg0CFu2JE
	 Q03ozGT7yoUU3Sg7P2yyUug97rgxi88gjkea9r/O1Xn1LDo5Oc3gfuJ5xWPLH6q8uQ
	 PZrXtXb661m0NXXHT6w2bTw9qQ2U30iiOkGJRsuGuy1Tu/8ptCT/p+m7G+/1g6g0mT
	 C1dEWKKWJ99QR1KEa86tkvyxYWddXXqeaw235bXy2cCp3quzwYH59Roivq/PqwJO+r
	 qlzSuQ18+ee7A==
Date: Wed, 22 Sep 2021 19:11:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
In-Reply-To: <4b2b04ab1dbc1a5c52bf54c399cdb6cf454183ea.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221911020.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <4b2b04ab1dbc1a5c52bf54c399cdb6cf454183ea.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> space to the XEN memory.
> 
> Patch helps to understand how the generic infrastructure for PCI
> host-bridge discovery will be used for future references.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Change on v2:
> - Add more info in commit msg
> ---
>  xen/arch/arm/pci/Makefile          |  1 +
>  xen/arch/arm/pci/pci-host-zynqmp.c | 58 ++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index e86f2b46fd..0572c68bba 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -4,3 +4,4 @@ obj-y += pci.o
>  obj-y += pci-host-generic.o
>  obj-y += pci-host-common.o
>  obj-y += ecam.o
> +obj-y += pci-host-zynqmp.o
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> new file mode 100644
> index 0000000000..c27b4ea9f0
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -0,0 +1,58 @@
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
> +#include <asm/device.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +int nwl_cfg_reg_index(struct dt_device_node *np)

static


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
> +static const struct dt_device_match nwl_pcie_dt_match[] = {
> +    { .compatible = "xlnx,nwl-pcie-2.11",
> +      .data =       &nwl_pcie_ops },
> +    { },
> +};
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +.dt_match = nwl_pcie_dt_match,
> +.init = pci_host_common_probe,
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
> 2.17.1
> 

