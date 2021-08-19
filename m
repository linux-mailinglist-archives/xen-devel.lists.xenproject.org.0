Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8E3F190E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168712.308018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGh0L-0005M2-Ns; Thu, 19 Aug 2021 12:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168712.308018; Thu, 19 Aug 2021 12:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGh0L-0005JP-K7; Thu, 19 Aug 2021 12:18:41 +0000
Received: by outflank-mailman (input) for mailman id 168712;
 Thu, 19 Aug 2021 12:18:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGh0J-0005JJ-Ng
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:18:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGgzr-00073E-Q4; Thu, 19 Aug 2021 12:18:11 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGgzr-0001Yf-J3; Thu, 19 Aug 2021 12:18:11 +0000
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
	bh=pHMKAREm+s+DDHZ/m96rIl8yCzk6Nb4Z4r+rxzNiqR4=; b=3UDNebj37/e1scTdEdZJoWamXW
	h7XCXgR73VtPiSNSs7oRbMDLp01TxeT1ax88mgH4TyYKCMYw1MwP3HI+g3AbxeRRmGDOVU7W1fEou
	TJOcQo0qs3R4PZgDNQTF/nDrI86yQJ4/jDpYggGsjZyYEbIUvrDLg7DT8eijUlcyGq4g=;
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9022cf38-532f-05bd-d78d-50f46cdbd8f5@xen.org>
Date: Thu, 19 Aug 2021 13:18:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> MSI code that implements MSI functionality to support MSI within XEN is
> not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI flag to gate

Can you clarify what you mean by not usable? Is it because we lack of 
support or we have no plan to use it?

Cheers,

> the code for ARM.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/x86/Kconfig             |  1 +
>   xen/drivers/passthrough/Makefile |  1 +
>   xen/drivers/passthrough/msi.c    | 96 ++++++++++++++++++++++++++++++++
>   xen/drivers/passthrough/pci.c    | 54 +++++-------------
>   xen/drivers/pci/Kconfig          |  4 ++
>   xen/include/xen/msi.h            | 56 +++++++++++++++++++
>   xen/xsm/flask/hooks.c            |  8 +--
>   7 files changed, 175 insertions(+), 45 deletions(-)
>   create mode 100644 xen/drivers/passthrough/msi.c
>   create mode 100644 xen/include/xen/msi.h
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9b164db641..7b46ee98c5 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -19,6 +19,7 @@ config X86
>   	select HAS_NS16550
>   	select HAS_PASSTHROUGH
>   	select HAS_PCI
> +	select HAS_PCI_MSI
>   	select HAS_PDX
>   	select HAS_SCHED_GRANULARITY
>   	select HAS_UBSAN
> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
> index 445690e3e5..a5efa22714 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -7,3 +7,4 @@ obj-y += iommu.o
>   obj-$(CONFIG_HAS_PCI) += pci.o
>   obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>   obj-$(CONFIG_HAS_PCI) += ats.o
> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o
> diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
> new file mode 100644
> index 0000000000..15ad0f8160
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi.c
> @@ -0,0 +1,96 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/msi.h>
> +#include <asm/hvm/io.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc = pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    INIT_LIST_HEAD(&pdev->msi_list);
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
> +    if ( pos )
> +    {
> +        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> +
> +        pdev->msi_maxvec = multi_msi_capable(ctrl);
> +    }
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
> +    if ( pos )
> +    {
> +        struct arch_msix *msix = xzalloc(struct arch_msix);
> +        uint16_t ctrl;
> +
> +        if ( !msix )
> +            return -ENOMEM;
> +
> +        spin_lock_init(&msix->table_lock);
> +
> +        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +        msix->nr_entries = msix_table_size(ctrl);
> +
> +        pdev->msix = msix;
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_msi_deinit(struct pci_dev *pdev)
> +{
> +    XFREE(pdev->msix);
> +}
> +
> +void pdev_dump_msi(const struct pci_dev *pdev)
> +{
> +    const struct msi_desc *msi;
> +
> +    printk("- MSIs < ");
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +    printk(">");
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
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index fc4fa2e5c3..67f5686ab6 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -32,8 +32,8 @@
>   #include <xen/softirq.h>
>   #include <xen/tasklet.h>
>   #include <xen/vpci.h>
> +#include <xen/msi.h>
>   #include <xsm/xsm.h>
> -#include <asm/msi.h>
>   #include "ats.h"
>   
>   struct pci_seg {
> @@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>   {
>       struct pci_dev *pdev;
>       unsigned int pos;
> +    int rc;
>   
>       list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>           if ( pdev->bus == bus && pdev->devfn == devfn )
> @@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>       *((u8*) &pdev->bus) = bus;
>       *((u8*) &pdev->devfn) = devfn;
>       pdev->domain = NULL;
> -    INIT_LIST_HEAD(&pdev->msi_list);
> -
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSI);
> -    if ( pos )
> -    {
> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> -
> -        pdev->msi_maxvec = multi_msi_capable(ctrl);
> -    }
>   
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSIX);
> -    if ( pos )
> +    rc = pdev_msi_init(pdev);
> +    if ( rc )
>       {
> -        struct arch_msix *msix = xzalloc(struct arch_msix);
> -        uint16_t ctrl;
> -
> -        if ( !msix )
> -        {
> -            xfree(pdev);
> -            return NULL;
> -        }
> -        spin_lock_init(&msix->table_lock);
> -
> -        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> -        msix->nr_entries = msix_table_size(ctrl);
> -
> -        pdev->msix = msix;
> +        xfree(pdev);
> +        return NULL;
>       }
>   
>       list_add(&pdev->alldevs_list, &pseg->alldevs_list);
> @@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>       }
>   
>       list_del(&pdev->alldevs_list);
> -    xfree(pdev->msix);
> +    pdev_msi_deinit(pdev);
>       xfree(pdev);
>   }
>   
> @@ -1271,18 +1249,16 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>   static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>   {
>       struct pci_dev *pdev;
> -    struct msi_desc *msi;
>   
>       printk("==== segment %04x ====\n", pseg->nr);
>   
>       list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>       {
> -        printk("%pp - %pd - node %-3d - MSIs < ",
> +        printk("%pp - %pd - node %-3d ",
>                  &pdev->sbdf, pdev->domain,
>                  (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
> -        list_for_each_entry ( msi, &pdev->msi_list, list )
> -               printk("%d ", msi->irq);
> -        printk(">\n");
> +        pdev_dump_msi(pdev);
> +        printk("\n");
>       }
>   
>       return 0;
> @@ -1422,13 +1398,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>       ASSERT(pdev && (pdev->domain == hardware_domain ||
>                       pdev->domain == dom_io));
>   
> -    if ( pdev->msix )
> -    {
> -        rc = pci_reset_msix_state(pdev);
> -        if ( rc )
> -            goto done;
> -        msixtbl_init(d);
> -    }
> +    rc = pdev_msix_assign(d, pdev);
> +    if ( rc )
> +        goto done;
>   
>       pdev->fault.count = 0;
>   
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..c6a7bc8007 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,7 @@
>   
>   config HAS_PCI
>   	bool
> +
> +config HAS_PCI_MSI
> +	bool
> +	depends on HAS_PCI
> diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
> new file mode 100644
> index 0000000000..b2d5bc6f9d
> --- /dev/null
> +++ b/xen/include/xen/msi.h
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright (C) 2008,  Netronome Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_MSI_H_
> +#define __XEN_MSI_H_
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +
> +#include <asm/msi.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
> +int pdev_msi_init(struct pci_dev *pdev);
> +void pdev_msi_deinit(struct pci_dev *pdev);
> +void pdev_dump_msi(const struct pci_dev *pdev);
> +
> +#else /* !CONFIG_HAS_PCI_MSI */
> +static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
> +static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
> +
> +#endif /* CONFIG_HAS_PCI_MSI */
> +
> +#endif /* __XEN_MSI_H */
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
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index f1a1217c98..fdcfeb984c 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -21,7 +21,7 @@
>   #include <xen/guest_access.h>
>   #include <xen/xenoprof.h>
>   #include <xen/iommu.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>   #include <asm/msi.h>
>   #endif
>   #include <public/xen.h>
> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
>           }
>           return security_irq_sid(irq, sid);
>       }
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>       {
>           struct irq_desc *desc = irq_to_desc(irq);
>           if ( desc->msi_desc && desc->msi_desc->dev ) {
> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
>   static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
>                                    u32 *sid, struct avc_audit_data *ad)
>   {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>       const struct msi_info *msi = data;
>       u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>   
> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
>   static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
>                                      u32 *sid, struct avc_audit_data *ad)
>   {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>       const struct pci_dev *pdev = data;
>       u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
>   
> 

-- 
Julien Grall

