Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFD807E4D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 03:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649525.1014108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3y6-0001B9-1k; Thu, 07 Dec 2023 02:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649525.1014108; Thu, 07 Dec 2023 02:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3y5-00018D-Uy; Thu, 07 Dec 2023 02:18:25 +0000
Received: by outflank-mailman (input) for mailman id 649525;
 Thu, 07 Dec 2023 02:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rB3y3-000187-VG
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 02:18:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e47b7d65-94a6-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 03:18:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C76F3B824D1;
 Thu,  7 Dec 2023 02:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC23C433C8;
 Thu,  7 Dec 2023 02:18:17 +0000 (UTC)
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
X-Inumbo-ID: e47b7d65-94a6-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701915500;
	bh=c7OyBhAKKMMDcdQ7TOKYguis+q3iuIF4wYZKx0rNcd0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GPEqMtN8nlLWwHDM78zzptjNKtdVnj3qq7q3pNHPpSPYp8J9zaPr5ZyY5WB7kSVow
	 CaCjLREqaYebqfbmMZuh+R9/3d6gJbukVDXQrD+BddaOatSKl2nPfS8Lw9RGJy+07x
	 8kjSyzUv0qqfpnxFNEq+TCiZgc6VJzBaBnUPLq/uoMspy5Jyr4cdfEOwZxkur4Ilgy
	 2xgxx0lFAR6smUenVZV8NAVHyNXOT+1ae1xf3w3g3k8JHx8N1QLJORIyx8KZvO7ovy
	 iSJLqH8U41qO1okKwdI+rAjoZ3Zg9rOei1zngKGlbOBTumZuqTdvb5nt25roOQj9BM
	 GTUvKNYFEvcbA==
Date: Wed, 6 Dec 2023 18:18:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
    "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
    "Koenig, Christian" <Christian.Koenig@amd.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    "Huang, Honglei1" <Honglei1.Huang@amd.com>, 
    "Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
In-Reply-To: <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2312061818030.1265976@ubuntu-linux-20-04-desktop>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com> <20231124103123.3263471-3-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop> <ZWiyBP4Lzz5lXraP@macbook> <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>
 <ZWmgJNidFsfkDp7q@macbook> <alpine.DEB.2.22.394.2312011857260.110490@ubuntu-linux-20-04-desktop> <ZW2ptexPQXrWBiOS@macbook> <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop> <ZW7rDjjC0gxEI1cq@macbook> <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Chen, Jiqian wrote:
> When PVH dom0 enable a device, it will get trigger and polarity from ACPI (see acpi_pci_irq_enable)
> I have a version of patch which tried that way, see below:

This approach looks much better. I think this patch is OKish. Juergen,
what do you think?


> diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> index ada3868c02c2..43e1bda9f946 100644
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
> @@ -25,6 +26,127 @@
>  bool __ro_after_init xen_pvh;
>  EXPORT_SYMBOL_GPL(xen_pvh);
> 
> +typedef struct gsi_info {
> +       int gsi;
> +       int trigger;
> +       int polarity;
> +       int pirq;
> +} gsi_info_t;
> +
> +struct acpi_prt_entry {
> +       struct acpi_pci_id      id;
> +       u8                      pin;
> +       acpi_handle             link;
> +       u32                     index;          /* GSI, or link _CRS index */
> +};
> +
> +static int xen_pvh_get_gsi_info(struct pci_dev *dev,
> +                                                               gsi_info_t *gsi_info)
> +{
> +       int gsi;
> +       u8 pin = 0;
> +       struct acpi_prt_entry *entry;
> +       int trigger = ACPI_LEVEL_SENSITIVE;
> +       int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
> +                                     ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
> +
> +       if (dev)
> +               pin = dev->pin;
> +       if (!pin) {
> +               xen_raw_printk("No interrupt pin configured\n");
> +               return -EINVAL;
> +       }
> +
> +       entry = acpi_pci_irq_lookup(dev, pin);
> +       if (entry) {
> +               if (entry->link)
> +                       gsi = acpi_pci_link_allocate_irq(entry->link,
> +                                                        entry->index,
> +                                                        &trigger, &polarity,
> +                                                        NULL);
> +               else
> +                       gsi = entry->index;
> +       } else
> +               return -EINVAL;
> +
> +       gsi_info->gsi = gsi;
> +       gsi_info->trigger = trigger;
> +       gsi_info->polarity = polarity;
> +
> +       return 0;
> +}
> +
> +static int xen_pvh_map_pirq(gsi_info_t *gsi_info)
> +{
> +       struct physdev_map_pirq map_irq;
> +       int ret;
> +
> +       map_irq.domid = DOMID_SELF;
> +       map_irq.type = MAP_PIRQ_TYPE_GSI;
> +       map_irq.index = gsi_info->gsi;
> +       map_irq.pirq = gsi_info->gsi;
> +
> +       ret = HYPERVISOR_physdev_op(PHYSDEVOP_map_pirq, &map_irq);
> +       gsi_info->pirq = map_irq.pirq;
> +
> +       return ret;
> +}
> +
> +static int xen_pvh_unmap_pirq(gsi_info_t *gsi_info)
> +{
> +       struct physdev_unmap_pirq unmap_irq;
> +
> +       unmap_irq.domid = DOMID_SELF;
> +       unmap_irq.pirq = gsi_info->pirq;
> +
> +       return HYPERVISOR_physdev_op(PHYSDEVOP_unmap_pirq, &unmap_irq);
> +}
> +
> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
> +{
> +       struct physdev_setup_gsi setup_gsi;
> +
> +       setup_gsi.gsi = gsi_info->gsi;
> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> +
> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> +}
> +
> +int xen_pvh_passthrough_gsi(struct pci_dev *dev)
> +{
> +       int ret;
> +       gsi_info_t gsi_info;
> +
> +       if (!dev) {
> +               return -EINVAL;
> +       }
> +
> +       ret = xen_pvh_get_gsi_info(dev, &gsi_info);
> +       if (ret) {
> +               xen_raw_printk("Fail to get gsi info!\n");
> +               return ret;
> +       }
> +
> +       ret = xen_pvh_map_pirq(&gsi_info);
> +       if (ret) {
> +               xen_raw_printk("Fail to map pirq for gsi (%d)!\n", gsi_info.gsi);
> +               return ret;
> +       }
> +
> +       ret = xen_pvh_setup_gsi(&gsi_info);
> +       if (ret == -EEXIST) {
> +               ret = 0;
> +               xen_raw_printk("Already setup the GSI :%u\n", gsi_info.gsi);
> +       } else if (ret) {
> +               xen_raw_printk("Fail to setup gsi (%d)!\n", gsi_info.gsi);
> +               xen_pvh_unmap_pirq(&gsi_info);
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(xen_pvh_passthrough_gsi);
> +
>  void __init xen_pvh_init(struct boot_params *boot_params)
>  {
>         u32 msr;
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
>         struct acpi_prt_entry *entry = NULL;
>         struct pci_dev *bridge;
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index e34b623e4b41..1abd4dad6f40 100644
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
> @@ -399,6 +400,12 @@ static int pcistub_init_device(struct pci_dev *dev)
>         if (err)
>                 goto config_release;
> 
> +       if (xen_initial_domain() && xen_pvh_domain()) {
> +               err = xen_pvh_passthrough_gsi(dev);
> +               if (err)
> +                       goto config_release;
> +       }
> +
>         if (dev->msix_cap) {
>                 struct physdev_pci_device ppdev = {
>                         .seg = pci_domain_nr(dev->bus),
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 641dc4843987..368d56ba2c5e 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -375,6 +375,7 @@ void acpi_unregister_gsi (u32 gsi);
> 
>  struct pci_dev;
> 
> +struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin);
>  int acpi_pci_irq_enable (struct pci_dev *dev);
>  void acpi_penalize_isa_irq(int irq, int active);
>  bool acpi_isa_irq_available(int irq);
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index b1e11863144d..ce7f5554f88e 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -67,6 +67,7 @@ static inline void xen_acpi_sleep_register(void)
>                 acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
>         }
>  }
> +int xen_pvh_passthrough_gsi(struct pci_dev *dev);
>  #else
>  static inline void xen_acpi_sleep_register(void)
>  {
> 
> > 
> > Jan
> 
> -- 
> Best regards,
> Jiqian Chen.
> 

