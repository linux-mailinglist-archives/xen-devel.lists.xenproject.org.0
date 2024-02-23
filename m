Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3686079D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684563.1064476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJM9-00068I-Ih; Fri, 23 Feb 2024 00:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684563.1064476; Fri, 23 Feb 2024 00:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJM9-00066b-F4; Fri, 23 Feb 2024 00:24:01 +0000
Received: by outflank-mailman (input) for mailman id 684563;
 Fri, 23 Feb 2024 00:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJM7-00066V-Uy
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:23:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d53846fb-d1e1-11ee-8a55-1f161083a0e0;
 Fri, 23 Feb 2024 01:23:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 203E8CE2817;
 Fri, 23 Feb 2024 00:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C99C433C7;
 Fri, 23 Feb 2024 00:23:51 +0000 (UTC)
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
X-Inumbo-ID: d53846fb-d1e1-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647833;
	bh=N50MF0FEA09+JdWWeSvMMaGLUQyg9qJDly4KxW/WH/E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Jl+0Mx5FR+/lTfq3bBupa6egNmH/ZvbEnlWJLi7B0LT49a8HDDkw9VRnwuer3NtUz
	 G7fdAwswNBE4Mak1W1T/wp1OUGuxg3UMITwset0GoLfaZblcN8lMQKR3eDyqLrT2Ac
	 rhGhgjJsCXOnHrPAOvz75j36TkWXbr70dezzFDhMOvEAxwMAu3iwraUHU6O3Rs9B8X
	 jamAjUL6RXaFCPCnLZPWJIfJMLcDN9qQbXIcW64fpMgF/wIFTlOLZ6fqP9OppflKQO
	 aDQkrepAuXioLa2VBKcgNjeXUNBYnUDLF71P4pQBhaXth2/TsjVNAwv/lmFOd7mzhO
	 rp4ZNAOSWcQrg==
Date: Thu, 22 Feb 2024 16:23:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 2/3] xen/pvh: Setup gsi for passthrough
 device
In-Reply-To: <20240105062217.349645-3-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402221622000.754277@ubuntu-linux-20-04-desktop>
References: <20240105062217.349645-1-Jiqian.Chen@amd.com> <20240105062217.349645-3-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> In PVH dom0, the gsis don't get registered, but the gsi of
> a passthrough device must be configured for it to be able to be
> mapped into a domU.
> 
> When assign a device to passthrough, proactively setup the gsi
> of the device during that process.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  arch/x86/xen/enlighten_pvh.c       | 90 ++++++++++++++++++++++++++++++
>  drivers/acpi/pci_irq.c             |  2 +-
>  drivers/xen/xen-pciback/pci_stub.c |  8 +++
>  include/linux/acpi.h               |  1 +
>  include/xen/acpi.h                 |  6 ++
>  5 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> index ada3868c02c2..ecadd966c684 100644
> --- a/arch/x86/xen/enlighten_pvh.c
> +++ b/arch/x86/xen/enlighten_pvh.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/acpi.h>
>  #include <linux/export.h>
> +#include <linux/pci.h>
>  
>  #include <xen/hvc-console.h>
>  
> @@ -25,6 +26,95 @@
>  bool __ro_after_init xen_pvh;
>  EXPORT_SYMBOL_GPL(xen_pvh);
>  
> +typedef struct gsi_info {
> +	int gsi;
> +	int trigger;
> +	int polarity;
> +} gsi_info_t;
> +
> +struct acpi_prt_entry {
> +	struct acpi_pci_id	id;
> +	u8			pin;
> +	acpi_handle		link;
> +	u32			index;		/* GSI, or link _CRS index */
> +};
> +
> +static int xen_pvh_get_gsi_info(struct pci_dev *dev,
> +								gsi_info_t *gsi_info)
> +{
> +	int gsi;
> +	u8 pin = 0;
> +	struct acpi_prt_entry *entry;
> +	int trigger = ACPI_LEVEL_SENSITIVE;
> +	int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
> +				      ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
> +
> +	if (dev)
> +		pin = dev->pin;

This is minor, but you can just move the pin = dev->pin after the !dev
check below.

With that change, and assuming the Xen-side and QEMU-side patches are
accepted:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>




> +	if (!dev || !pin || !gsi_info)
> +		return -EINVAL;
> +
> +	entry = acpi_pci_irq_lookup(dev, pin);
> +	if (entry) {
> +		if (entry->link)
> +			gsi = acpi_pci_link_allocate_irq(entry->link,
> +							 entry->index,
> +							 &trigger, &polarity,
> +							 NULL);
> +		else
> +			gsi = entry->index;
> +	} else
> +		gsi = -1;
> +
> +	if (gsi < 0)
> +		return -EINVAL;
> +
> +	gsi_info->gsi = gsi;
> +	gsi_info->trigger = trigger;
> +	gsi_info->polarity = polarity;
> +
> +	return 0;
> +}
> +
> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
> +{
> +	struct physdev_setup_gsi setup_gsi;
> +
> +	if (!gsi_info)
> +		return -EINVAL;
> +
> +	setup_gsi.gsi = gsi_info->gsi;
> +	setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> +	setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> +
> +	return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> +}
> +
> +int xen_pvh_passthrough_gsi(struct pci_dev *dev)
> +{
> +	int ret;
> +	gsi_info_t gsi_info;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	ret = xen_pvh_get_gsi_info(dev, &gsi_info);
> +	if (ret) {
> +		xen_raw_printk("Fail to get gsi info!\n");
> +		return ret;
> +	}
> +
> +	ret = xen_pvh_setup_gsi(&gsi_info);
> +	if (ret == -EEXIST) {
> +		xen_raw_printk("Already setup the GSI :%d\n", gsi_info.gsi);
> +		ret = 0;
> +	} else if (ret)
> +		xen_raw_printk("Fail to setup GSI (%d)!\n", gsi_info.gsi);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xen_pvh_passthrough_gsi);
> +
>  void __init xen_pvh_init(struct boot_params *boot_params)
>  {
>  	u32 msr;
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index ff30ceca2203..630fe0a34bc6 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -288,7 +288,7 @@ static int acpi_reroute_boot_interrupt(struct pci_dev *dev,
>  }
>  #endif /* CONFIG_X86_IO_APIC */
>  
> -static struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin)
> +struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin)
>  {
>  	struct acpi_prt_entry *entry = NULL;
>  	struct pci_dev *bridge;
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 46c40ec8a18e..22d4380d2b04 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -20,6 +20,7 @@
>  #include <linux/atomic.h>
>  #include <xen/events.h>
>  #include <xen/pci.h>
> +#include <xen/acpi.h>
>  #include <xen/xen.h>
>  #include <asm/xen/hypervisor.h>
>  #include <xen/interface/physdev.h>
> @@ -435,6 +436,13 @@ static int pcistub_init_device(struct pci_dev *dev)
>  			goto config_release;
>  		pci_restore_state(dev);
>  	}
> +
> +	if (xen_initial_domain() && xen_pvh_domain()) {
> +		err = xen_pvh_passthrough_gsi(dev);
> +		if (err)
> +			goto config_release;
> +	}
> +
>  	/* Now disable the device (this also ensures some private device
>  	 * data is setup before we export)
>  	 */
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4db54e928b36..7ea3be981cc3 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -360,6 +360,7 @@ void acpi_unregister_gsi (u32 gsi);
>  
>  struct pci_dev;
>  
> +struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin);
>  int acpi_pci_irq_enable (struct pci_dev *dev);
>  void acpi_penalize_isa_irq(int irq, int active);
>  bool acpi_isa_irq_available(int irq);
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index b1e11863144d..17c4d37f1e60 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -67,10 +67,16 @@ static inline void xen_acpi_sleep_register(void)
>  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
>  	}
>  }
> +int xen_pvh_passthrough_gsi(struct pci_dev *dev);
>  #else
>  static inline void xen_acpi_sleep_register(void)
>  {
>  }
> +
> +static inline int xen_pvh_passthrough_gsi(struct pci_dev *dev)
> +{
> +	return -1;
> +}
>  #endif
>  
>  #endif	/* _XEN_ACPI_H */
> -- 
> 2.34.1
> 

