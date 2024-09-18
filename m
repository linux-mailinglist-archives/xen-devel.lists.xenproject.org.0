Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75D97C1D0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 00:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800459.1210394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr2t3-0000VE-Jh; Wed, 18 Sep 2024 22:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800459.1210394; Wed, 18 Sep 2024 22:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sr2t3-0000TN-Gr; Wed, 18 Sep 2024 22:11:01 +0000
Received: by outflank-mailman (input) for mailman id 800459;
 Wed, 18 Sep 2024 22:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uy3Y=QQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sr2t2-0000TH-9O
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 22:11:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e181d358-760a-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 00:10:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 382A35C5B05;
 Wed, 18 Sep 2024 22:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60956C4CEC2;
 Wed, 18 Sep 2024 22:10:55 +0000 (UTC)
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
X-Inumbo-ID: e181d358-760a-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726697456;
	bh=20JtWju5r84jTJ9MYxoesSH3lY/hB9UFeFpAkXa66VA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BflWEmuzhD4ePQO3KyHgVBkfZi42uHSBZX/VyDg0a/+wUzuf/dJCvQnHNbO1dtYtH
	 dLHvd7Xx8B7c+YOGDRFUIHAXaHpGNN4MlIu95OXw3Znkzr/4kOSMOuCgbqr0E2/uLT
	 5YYuBOY4qzRmZwzL8M3yywoHnWPw2AKY2zN0J+plPtfUYBMB1k2R06TtgknoDH+nJe
	 DbZPScqhSm4oVJA0NBQc1Eb3D1wOnmS2Au/01WhJAdbF+7w4XmMYyr7WQw+gp0yiPQ
	 uensMIOKa9nFtmY/4zgCiNP8zOHltM+rw9QSvI9DfBUYC8Cz2Dw3IfDBUC7pBSB0KZ
	 0DtzrLE4WaYiA==
Date: Wed, 18 Sep 2024 15:10:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
    linux-acpi@vger.kernel.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [KERNEL PATCH v9 2/3] xen/pvh: Setup gsi for passthrough
 device
In-Reply-To: <20240912092352.1602724-3-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409181510460.1417852@ubuntu-linux-20-04-desktop>
References: <20240912092352.1602724-1-Jiqian.Chen@amd.com> <20240912092352.1602724-3-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Sep 2024, Jiqian Chen wrote:
> In PVH dom0, the gsis don't get registered, but the gsi of
> a passthrough device must be configured for it to be able to be
> mapped into a domU.
> 
> When assigning a device to passthrough, proactively setup the gsi
> of the device during that process.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v8->v9 changes:
> Moved the calling of xen_acpi_get_gsi_info under check "if (xen_initial_domain() && xen_pvh_domain())" to prevent it is called in PV dom0.
> Removed Reviewed-by of Stefano.
> 
> v7->v8 changes:
> Used CONFIG_XEN_ACPI instead of CONFIG_ACPI to wrap codes.
> 
> v6->v7 changes:
> Moved the implementation of function xen_acpi_get_gsi_info to file drivers/xen/acpi.c, that modification is more convenient for the subsequent patch to obtain gsi.
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> Added Reviewed-by of Stefano.
> 
> v3->v4 changes:
> Removed map_pirq from xen_pvh_passthrough_gsi since let pvh calls map_pirq here is not right.
> 
> v2->v3 changes:
> Abandoned previous implementations that called unmask_irq, and change to do setup_gsi and map_pirq for passthrough device in pcistub_init_device.
> ---
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406090859.KW3eeESv-lkp@intel.com/
> ---
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405172132.TazuVpPo-lkp@intel.com/
> ---
>  arch/x86/xen/enlighten_pvh.c       | 23 ++++++++++++++
>  drivers/acpi/pci_irq.c             |  2 +-
>  drivers/xen/acpi.c                 | 50 ++++++++++++++++++++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c | 20 ++++++++++++
>  include/linux/acpi.h               |  1 +
>  include/xen/acpi.h                 | 18 +++++++++++
>  6 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> index 728a4366ca85..bf68c329fc01 100644
> --- a/arch/x86/xen/enlighten_pvh.c
> +++ b/arch/x86/xen/enlighten_pvh.c
> @@ -4,6 +4,7 @@
>  #include <linux/mm.h>
>  
>  #include <xen/hvc-console.h>
> +#include <xen/acpi.h>
>  
>  #include <asm/bootparam.h>
>  #include <asm/io_apic.h>
> @@ -28,6 +29,28 @@
>  bool __ro_after_init xen_pvh;
>  EXPORT_SYMBOL_GPL(xen_pvh);
>  
> +#ifdef CONFIG_XEN_DOM0
> +int xen_pvh_setup_gsi(int gsi, int trigger, int polarity)
> +{
> +	int ret;
> +	struct physdev_setup_gsi setup_gsi;
> +
> +	setup_gsi.gsi = gsi;
> +	setup_gsi.triggering = (trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> +	setup_gsi.polarity = (polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> +
> +	ret = HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> +	if (ret == -EEXIST) {
> +		xen_raw_printk("Already setup the GSI :%d\n", gsi);
> +		ret = 0;
> +	} else if (ret)
> +		xen_raw_printk("Fail to setup GSI (%d)!\n", gsi);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xen_pvh_setup_gsi);
> +#endif
> +
>  /*
>   * Reserve e820 UNUSABLE regions to inflate the memory balloon.
>   *
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
> diff --git a/drivers/xen/acpi.c b/drivers/xen/acpi.c
> index 6893c79fd2a1..9e2096524fbc 100644
> --- a/drivers/xen/acpi.c
> +++ b/drivers/xen/acpi.c
> @@ -30,6 +30,7 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#include <linux/pci.h>
>  #include <xen/acpi.h>
>  #include <xen/interface/platform.h>
>  #include <asm/xen/hypercall.h>
> @@ -75,3 +76,52 @@ int xen_acpi_notify_hypervisor_extended_sleep(u8 sleep_state,
>  	return xen_acpi_notify_hypervisor_state(sleep_state, val_a,
>  						val_b, true);
>  }
> +
> +struct acpi_prt_entry {
> +	struct acpi_pci_id      id;
> +	u8                      pin;
> +	acpi_handle             link;
> +	u32                     index;
> +};
> +
> +int xen_acpi_get_gsi_info(struct pci_dev *dev,
> +						  int *gsi_out,
> +						  int *trigger_out,
> +						  int *polarity_out)
> +{
> +	int gsi;
> +	u8 pin;
> +	struct acpi_prt_entry *entry;
> +	int trigger = ACPI_LEVEL_SENSITIVE;
> +	int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
> +				      ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
> +
> +	if (!dev || !gsi_out || !trigger_out || !polarity_out)
> +		return -EINVAL;
> +
> +	pin = dev->pin;
> +	if (!pin)
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
> +	*gsi_out = gsi;
> +	*trigger_out = trigger;
> +	*polarity_out = polarity;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 3e162c1753e2..8ce27333f54b 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -21,6 +21,9 @@
>  #include <xen/events.h>
>  #include <xen/pci.h>
>  #include <xen/xen.h>
> +#ifdef CONFIG_XEN_ACPI
> +#include <xen/acpi.h>
> +#endif
>  #include <asm/xen/hypervisor.h>
>  #include <xen/interface/physdev.h>
>  #include "pciback.h"
> @@ -367,6 +370,9 @@ static int pcistub_match(struct pci_dev *dev)
>  static int pcistub_init_device(struct pci_dev *dev)
>  {
>  	struct xen_pcibk_dev_data *dev_data;
> +#ifdef CONFIG_XEN_ACPI
> +	int gsi, trigger, polarity;
> +#endif
>  	int err = 0;
>  
>  	dev_dbg(&dev->dev, "initializing...\n");
> @@ -435,6 +441,20 @@ static int pcistub_init_device(struct pci_dev *dev)
>  			goto config_release;
>  		pci_restore_state(dev);
>  	}
> +
> +#ifdef CONFIG_XEN_ACPI
> +	if (xen_initial_domain() && xen_pvh_domain()) {
> +		err = xen_acpi_get_gsi_info(dev, &gsi, &trigger, &polarity);
> +		if (err) {
> +			dev_err(&dev->dev, "Fail to get gsi info!\n");
> +			goto config_release;
> +		}
> +		err = xen_pvh_setup_gsi(gsi, trigger, polarity);
> +		if (err)
> +			goto config_release;
> +	}
> +#endif
> +
>  	/* Now disable the device (this also ensures some private device
>  	 * data is setup before we export)
>  	 */
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 0687a442fec7..02ded9f53a6b 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -362,6 +362,7 @@ void acpi_unregister_gsi (u32 gsi);
>  
>  struct pci_dev;
>  
> +struct acpi_prt_entry *acpi_pci_irq_lookup(struct pci_dev *dev, int pin);
>  int acpi_pci_irq_enable (struct pci_dev *dev);
>  void acpi_penalize_isa_irq(int irq, int active);
>  bool acpi_isa_irq_available(int irq);
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index b1e11863144d..3bcfe82d9078 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -67,10 +67,28 @@ static inline void xen_acpi_sleep_register(void)
>  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
>  	}
>  }
> +int xen_pvh_setup_gsi(int gsi, int trigger, int polarity);
> +int xen_acpi_get_gsi_info(struct pci_dev *dev,
> +						  int *gsi_out,
> +						  int *trigger_out,
> +						  int *polarity_out);
>  #else
>  static inline void xen_acpi_sleep_register(void)
>  {
>  }
> +
> +static inline int xen_pvh_setup_gsi(int gsi, int trigger, int polarity)
> +{
> +	return -1;
> +}
> +
> +static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
> +						  int *gsi_out,
> +						  int *trigger_out,
> +						  int *polarity_out)
> +{
> +	return -1;
> +}
>  #endif
>  
>  #endif	/* _XEN_ACPI_H */
> -- 
> 2.34.1
> 

