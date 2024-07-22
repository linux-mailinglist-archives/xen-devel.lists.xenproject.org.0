Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C1939581
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762383.1172561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0cR-0001mi-OS; Mon, 22 Jul 2024 21:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762383.1172561; Mon, 22 Jul 2024 21:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0cR-0001jZ-KM; Mon, 22 Jul 2024 21:30:55 +0000
Received: by outflank-mailman (input) for mailman id 762383;
 Mon, 22 Jul 2024 21:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sW0cP-0001iW-Rl
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:30:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab7fe684-4871-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:30:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A2AD60AC1;
 Mon, 22 Jul 2024 21:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367D3C116B1;
 Mon, 22 Jul 2024 21:30:49 +0000 (UTC)
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
X-Inumbo-ID: ab7fe684-4871-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721683850;
	bh=v2sonCVqGjpGXag0Jb6VPks8bVvtizl2cT0DH9S8f8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M/gTu0O/fsCWf0yAF/e9ksNF7AtzQ8sI7IBf1Z26/uuvRpxVlQEDrfcHDlpY93t/X
	 SWWNHGELxFQVA+m5/tiqL+glkGbvsvMnNk9caLotyWGE/7I93AUe0TguFafW54ULGh
	 WXdFI1kaUsOi+1Ue+qSqDxWBUgohGR+xuYkgwKT10lKJXDxuh0TcQ4KY7WYEYVKVMb
	 AWlqHarMTeyeaQyUUvfBpA4igCZeDY2ZkeoNyjEE+j3xSEXqSZvpZ1Vg7euKo4z8o3
	 INhpJ+KxcPZesmlDwXSlG4p6DMStZd/l7k0BiC3p+W1phG0UHSmwsDbFhDPCgeDVqb
	 f+784j3Wm6I5g==
Date: Mon, 22 Jul 2024 14:30:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v8 3/3] xen/privcmd: Add new syscall to get
 gsi from dev
In-Reply-To: <20240607075109.126277-4-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407221430380.4857@ubuntu-linux-20-04-desktop>
References: <20240607075109.126277-1-Jiqian.Chen@amd.com> <20240607075109.126277-4-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi 28,
> it causes the irq number is not equal with the gsi number.
> And when passthrough a device, QEMU will use device's gsi
> number to do pirq mapping, but the gsi number is got from
> file /sys/bus/pci/devices/<sbdf>/irq, irq!= gsi, so it will
> fail when mapping.
> And in current linux codes, there is no method to get gsi
> for userspace.
> 
> For above purpose, record gsi of pcistub devices when init
> pcistub and add a new syscall into privcmd to let userspace
> can get gsi when they have a need.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> RFC: it need review and need to wait for previous patch of this series to be merged.
> ---
>  drivers/xen/privcmd.c              | 28 ++++++++++++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c | 38 +++++++++++++++++++++++++++---
>  include/uapi/xen/privcmd.h         |  7 ++++++
>  include/xen/acpi.h                 |  9 +++++++
>  4 files changed, 79 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 67dfa4778864..5809b3168f25 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -45,6 +45,9 @@
>  #include <xen/page.h>
>  #include <xen/xen-ops.h>
>  #include <xen/balloon.h>
> +#ifdef CONFIG_XEN_ACPI
> +#include <xen/acpi.h>
> +#endif
>  
>  #include "privcmd.h"
>  
> @@ -842,6 +845,27 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
>  	return rc;
>  }
>  
> +static long privcmd_ioctl_gsi_from_dev(struct file *file, void __user *udata)
> +{
> +#ifdef CONFIG_XEN_ACPI
> +	struct privcmd_gsi_from_dev kdata;
> +
> +	if (copy_from_user(&kdata, udata, sizeof(kdata)))
> +		return -EFAULT;
> +
> +	kdata.gsi = pcistub_get_gsi_from_sbdf(kdata.sbdf);
> +	if (kdata.gsi == -1)
> +		return -EINVAL;
> +
> +	if (copy_to_user(udata, &kdata, sizeof(kdata)))
> +		return -EFAULT;
> +
> +	return 0;
> +#else
> +	return -EINVAL;
> +#endif
> +}
> +
>  #ifdef CONFIG_XEN_PRIVCMD_EVENTFD
>  /* Irqfd support */
>  static struct workqueue_struct *irqfd_cleanup_wq;
> @@ -1529,6 +1553,10 @@ static long privcmd_ioctl(struct file *file,
>  		ret = privcmd_ioctl_ioeventfd(file, udata);
>  		break;
>  
> +	case IOCTL_PRIVCMD_GSI_FROM_DEV:
> +		ret = privcmd_ioctl_gsi_from_dev(file, udata);
> +		break;
> +
>  	default:
>  		break;
>  	}
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 6b22e45188f5..9d791d7a8098 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -56,6 +56,9 @@ struct pcistub_device {
>  
>  	struct pci_dev *dev;
>  	struct xen_pcibk_device *pdev;/* non-NULL if struct pci_dev is in use */
> +#ifdef CONFIG_XEN_ACPI
> +	int gsi;
> +#endif
>  };
>  
>  /* Access to pcistub_devices & seized_devices lists and the initialize_devices
> @@ -88,6 +91,9 @@ static struct pcistub_device *pcistub_device_alloc(struct pci_dev *dev)
>  
>  	kref_init(&psdev->kref);
>  	spin_lock_init(&psdev->lock);
> +#ifdef CONFIG_XEN_ACPI
> +	psdev->gsi = -1;
> +#endif
>  
>  	return psdev;
>  }
> @@ -220,6 +226,25 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
>  	return pci_dev;
>  }
>  
> +#ifdef CONFIG_XEN_ACPI
> +int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> +{
> +	struct pcistub_device *psdev;
> +	int domain = (sbdf >> 16) & 0xffff;
> +	int bus = PCI_BUS_NUM(sbdf);
> +	int slot = PCI_SLOT(sbdf);
> +	int func = PCI_FUNC(sbdf);
> +
> +	psdev = pcistub_device_find(domain, bus, slot, func);
> +
> +	if (!psdev)
> +		return -1;
> +
> +	return psdev->gsi;
> +}
> +EXPORT_SYMBOL_GPL(pcistub_get_gsi_from_sbdf);
> +#endif
> +
>  struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
>  					    int domain, int bus,
>  					    int slot, int func)
> @@ -367,14 +392,20 @@ static int pcistub_match(struct pci_dev *dev)
>  	return found;
>  }
>  
> -static int pcistub_init_device(struct pci_dev *dev)
> +static int pcistub_init_device(struct pcistub_device *psdev)
>  {
>  	struct xen_pcibk_dev_data *dev_data;
> +	struct pci_dev *dev;
>  #ifdef CONFIG_XEN_ACPI
>  	int gsi, trigger, polarity;
>  #endif
>  	int err = 0;
>  
> +	if (!psdev)
> +		return -EINVAL;
> +
> +	dev = psdev->dev;
> +
>  	dev_dbg(&dev->dev, "initializing...\n");
>  
>  	/* The PCI backend is not intended to be a module (or to work with
> @@ -448,6 +479,7 @@ static int pcistub_init_device(struct pci_dev *dev)
>  		dev_err(&dev->dev, "Fail to get gsi info!\n");
>  		goto config_release;
>  	}
> +	psdev->gsi = gsi;
>  
>  	if (xen_initial_domain() && xen_pvh_domain()) {
>  		err = xen_pvh_setup_gsi(gsi, trigger, polarity);
> @@ -495,7 +527,7 @@ static int __init pcistub_init_devices_late(void)
>  
>  		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
>  
> -		err = pcistub_init_device(psdev->dev);
> +		err = pcistub_init_device(psdev);
>  		if (err) {
>  			dev_err(&psdev->dev->dev,
>  				"error %d initializing device\n", err);
> @@ -565,7 +597,7 @@ static int pcistub_seize(struct pci_dev *dev,
>  		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
>  
>  		/* don't want irqs disabled when calling pcistub_init_device */
> -		err = pcistub_init_device(psdev->dev);
> +		err = pcistub_init_device(psdev);
>  
>  		spin_lock_irqsave(&pcistub_devices_lock, flags);
>  
> diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
> index 8b8c5d1420fe..220e7670a113 100644
> --- a/include/uapi/xen/privcmd.h
> +++ b/include/uapi/xen/privcmd.h
> @@ -126,6 +126,11 @@ struct privcmd_ioeventfd {
>  	__u8 pad[2];
>  };
>  
> +struct privcmd_gsi_from_dev {
> +	__u32 sbdf;
> +	int gsi;
> +};
> +
>  /*
>   * @cmd: IOCTL_PRIVCMD_HYPERCALL
>   * @arg: &privcmd_hypercall_t
> @@ -157,5 +162,7 @@ struct privcmd_ioeventfd {
>  	_IOW('P', 8, struct privcmd_irqfd)
>  #define IOCTL_PRIVCMD_IOEVENTFD					\
>  	_IOW('P', 9, struct privcmd_ioeventfd)
> +#define IOCTL_PRIVCMD_GSI_FROM_DEV				\
> +	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_gsi_from_dev))
>  
>  #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index 9b50027113f3..d6315fd559a9 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -83,4 +83,13 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  						  int *gsi_out,
>  						  int *trigger_out,
>  						  int *polarity_out);
> +
> +#ifdef CONFIG_XEN_PCI_STUB
> +int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
> +#else
> +static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> +{
> +	return -1;
> +}
> +#endif
>  #endif	/* _XEN_ACPI_H */
> -- 
> 2.34.1
> 

