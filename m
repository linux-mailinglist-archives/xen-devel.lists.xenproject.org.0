Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AB41532A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193116.343971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTALq-0003zZ-PX; Wed, 22 Sep 2021 22:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193116.343971; Wed, 22 Sep 2021 22:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTALq-0003xW-MU; Wed, 22 Sep 2021 22:04:26 +0000
Received: by outflank-mailman (input) for mailman id 193116;
 Wed, 22 Sep 2021 22:04:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTALp-0003xQ-DT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:04:25 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 082567a7-7bfe-47b9-b941-26d9ffd77b5c;
 Wed, 22 Sep 2021 22:04:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B41061019;
 Wed, 22 Sep 2021 22:04:23 +0000 (UTC)
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
X-Inumbo-ID: 082567a7-7bfe-47b9-b941-26d9ffd77b5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632348263;
	bh=vqa3+sLgyMyBECDMtbSv1gF5D/5Z3StQ0yR5jODH2pE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QL/ugiFdJg/o4vfd6/x+haECioSvUCpvoGsTqPRvpwHXnT0Y6R8t9fNSN9ytrQ0LD
	 v8pZnsnk6VdlaPYRFZo1B2NHjbfnUGK97rkviIw+W4ZrYSr5a1F1Ehv+mhGZU2mJ34
	 fYS4KK2Q6cWN6sWO+q9VHD2J1v0EuQ4BdIrVh32gS5yddakBj9BPItVYgwjaHo45VZ
	 yGWJYy+EewKpW8UwU6vwrtwde20oaqSO14YsXE5bctCyOJiXrvE8h1dPZc0YpaYpBj
	 E/q7IVjS/5/Tr4FBade8Mf1iUqqRp/CwqXTPqY3fnGj2XQBns3XtOIzOrr078UNul4
	 Y99GD/pUyKXeg==
Date: Wed, 22 Sep 2021 15:04:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/17] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
In-Reply-To: <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221503490.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1615104374-1632348263=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1615104374-1632348263=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Rahul Singh wrote:
> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.
> 
> Add definition for arch_iommu_use_permitted() and
> arch_pci_clean_pirqs().
> 
> pci.c: In function ‘deassign_device’:
> pci.c:849:49: error: implicit declaration of function ‘pci_to_dev’;
> did you mean ‘dt_to_dev’? [-Werror=implicit-function-declaration]
>             pci_to_dev(pdev));
> pci.c:880: undefined reference to `arch_pci_clean_pirqs’
> pci.c:1392: undefined reference to `arch_iommu_use_permitted'
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v2:
> - Remove pci_conf_read*(..) dummy implementation
> - Add in code comment for arch_pci_clean_pirqs() and arch_iommu_use_permitted()
> - Fixed minor comments
> ---
>  xen/arch/arm/Makefile               |  1 +
>  xen/arch/arm/pci/Makefile           |  1 +
>  xen/arch/arm/pci/pci.c              | 33 +++++++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/iommu.c |  9 ++++++++
>  xen/include/asm-arm/pci.h           | 31 ++++++++++++++++++++++++---
>  5 files changed, 72 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/pci/Makefile
>  create mode 100644 xen/arch/arm/pci/pci.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..44d7cc81fa 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -2,6 +2,7 @@ obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
>  obj-$(CONFIG_ARM_64) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
> +obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> new file mode 100644
> index 0000000000..a98035df4c
> --- /dev/null
> +++ b/xen/arch/arm/pci/Makefile
> @@ -0,0 +1 @@
> +obj-y += pci.o
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> new file mode 100644
> index 0000000000..a7a7bc3213
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci.c
> @@ -0,0 +1,33 @@
> +/*
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
> +#include <xen/pci.h>
> +
> +/*
> + * PIRQ event channels are not supported on Arm, so nothing to do.
> + */
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
> +}
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
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
> index db3b07a571..ee653a9c48 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -135,3 +135,12 @@ void arch_iommu_domain_destroy(struct domain *d)
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
>  }
> +
> +/*
> + * Unlike x86, Arm doesn't support mem-sharing, mem-paging and log-dirty (yet).
> + * So there is no restriction to use the IOMMU.
> + */
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    return true;
> +}
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index de13359f65..7dd9eb3dba 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -1,7 +1,32 @@
> -#ifndef __X86_PCI_H__
> -#define __X86_PCI_H__
> +/*
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
>  
> +#ifndef __ARM_PCI_H__
> +#define __ARM_PCI_H__
> +
> +#ifdef CONFIG_HAS_PCI
> +
> +#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +
> +/* Arch pci dev struct */
>  struct arch_pci_dev {
> +    struct device dev;
>  };
>  
> -#endif /* __X86_PCI_H__ */
> +#else   /*!CONFIG_HAS_PCI*/
> +
> +struct arch_pci_dev { };
> +
> +#endif  /*!CONFIG_HAS_PCI*/
> +#endif /* __ARM_PCI_H__ */
> -- 
> 2.17.1
> 
--8323329-1615104374-1632348263=:17979--

