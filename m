Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA23F1935
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168720.308040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGh9b-0007WF-Qh; Thu, 19 Aug 2021 12:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168720.308040; Thu, 19 Aug 2021 12:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGh9b-0007TW-MK; Thu, 19 Aug 2021 12:28:15 +0000
Received: by outflank-mailman (input) for mailman id 168720;
 Thu, 19 Aug 2021 12:28:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGh9Z-0007TQ-Ve
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:28:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGh9Z-0007Ds-N1; Thu, 19 Aug 2021 12:28:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGh9Z-0002Xs-G9; Thu, 19 Aug 2021 12:28:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Oy8D/CULkjD6YM207/z3GibxQbT8xRF8CORONGvXl6I=; b=zWR/YthcMWeEpUUGQc8lCuYWeo
	sETi21dJFg9tjfe5CX/sV2XgdA+cnVDOGxRA2NZjOLaZYZus1ovG981ddA0qflcfgsiUxFFKBqAxC
	5Me2ZEF9j2JZHBgsfcUY7N9HAPbHBJKtLvxuztJ5OeU+5SiIoR7Eof6Zo5Kq1bN+NjbY=;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
Date: Thu, 19 Aug 2021 13:28:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.

To be pedantic, what you are trying to solve is not a compilation error 
but the fact that the PCI mandates helpers that doesn't yet exist on 
Arm. So...

> Add definition for arch_iommu_use_permitted() and
> arch_pci_clean_pirqs().Implement dummy functions for pci_conf_read*() to
> fix compilation error.

... I am not really in favor of adding dummy implementation here. 
Instead, the series should be re-ordered so we add the pci-access 
helpers first and then enable HAS_PCI towards the end of the series.

> pci.c: In function ‘deassign_device’:
> pci.c:849:49: error: implicit declaration of function ‘pci_to_dev’;
> did you mean ‘dt_to_dev’? [-Werror=implicit-function-declaration]
>              pci_to_dev(pdev));
> 
> pci.c:18: undefined reference to `pci_conf_read16’
> pci.c:880: undefined reference to `arch_pci_clean_pirqs’
> pci.c:1392: undefined reference to `arch_iommu_use_permitted'
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/Makefile               |  1 +
>   xen/arch/arm/pci/Makefile           |  2 +
>   xen/arch/arm/pci/pci-access.c       | 61 +++++++++++++++++++++++++++++
>   xen/arch/arm/pci/pci.c              | 32 +++++++++++++++
>   xen/drivers/passthrough/arm/iommu.c |  5 +++
>   xen/include/asm-arm/pci.h           | 33 ++++++++++++++--
>   6 files changed, 131 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/arm/pci/Makefile
>   create mode 100644 xen/arch/arm/pci/pci-access.c
>   create mode 100644 xen/arch/arm/pci/pci.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..0e14a5e5c8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -6,6 +6,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>   obj-y += platforms/
>   endif
>   obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_PCI) += pci/
>   
>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>   obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> new file mode 100644
> index 0000000000..a9ee0b9b44
> --- /dev/null
> +++ b/xen/arch/arm/pci/Makefile
> @@ -0,0 +1,2 @@
> +obj-y += pci.o
> +obj-y += pci-access.o
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> new file mode 100644
> index 0000000000..b938047c03
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -0,0 +1,61 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
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
> +#include <xen/pci.h>
> +
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                                unsigned int len)
> +{
> +    return ~0U;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +                             unsigned int len, uint32_t val)
> +{
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type)                                            \
> +    void pci_conf_write##size (pci_sbdf_t sbdf,unsigned int reg, type val)  \
> +{                                                                           \
> +    pci_config_write(sbdf, reg, size / 8, val);                             \
> +}
> +
> +#define PCI_OP_READ(size, type)                                             \
> +    type pci_conf_read##size (pci_sbdf_t sbdf, unsigned int reg)            \
> +{                                                                           \
> +    return pci_config_read(sbdf, reg, size / 8);                            \
> +}
> +
> +PCI_OP_READ(8, u8)
> +PCI_OP_READ(16, u16)
> +PCI_OP_READ(32, u32)
> +PCI_OP_WRITE(8, u8)
> +PCI_OP_WRITE(16, u16)
> +PCI_OP_WRITE(32, u32)
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
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> new file mode 100644
> index 0000000000..dc55d23778
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci.c
> @@ -0,0 +1,32 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
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
> +#include <xen/pci.h>
> +
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
> +}

Please add a comment explaining why this just returns 0.

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
> index db3b07a571..fdec1c5547 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -135,3 +135,8 @@ void arch_iommu_domain_destroy(struct domain *d)
>   void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>   {
>   }
> +
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    return true;
> +}

Please add a comment explaining why returning true is always fine.

> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index de13359f65..61e43da088 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -1,7 +1,34 @@
> -#ifndef __X86_PCI_H__
> -#define __X86_PCI_H__
> +/*
> + * Copyright (C) 2021 Arm Ltd.
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
>   
> +#ifndef __ARM_PCI_H__
> +#define __ARM_PCI_H__
> +
> +#ifdef CONFIG_HAS_PCI
> +
> +#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +
> +/* Arch pci dev struct */
>   struct arch_pci_dev {
> +    struct device dev;
>   };
>   
> -#endif /* __X86_PCI_H__ */
> +#else   /*!CONFIG_HAS_PCI*/
> +
> +struct arch_pci_dev { };
> +
> +#endif  /*!CONFIG_HAS_PCI*/
> +#endif /* __ARM_PCI_H__ */
> 

-- 
Julien Grall

