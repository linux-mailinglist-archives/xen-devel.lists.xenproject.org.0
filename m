Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B88C7DB4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 22:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723612.1128595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7hjq-0001cd-Pu; Thu, 16 May 2024 20:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723612.1128595; Thu, 16 May 2024 20:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7hjq-0001ZX-NI; Thu, 16 May 2024 20:30:06 +0000
Received: by outflank-mailman (input) for mailman id 723612;
 Thu, 16 May 2024 20:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7hjo-0001FA-PP
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 20:30:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12754f9b-13c3-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 22:30:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BD2661765;
 Thu, 16 May 2024 20:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4F1C113CC;
 Thu, 16 May 2024 20:29:59 +0000 (UTC)
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
X-Inumbo-ID: 12754f9b-13c3-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715891401;
	bh=L6qDb7RoyyQ5xN5zU57yiUI3gcioSC+go1Mb4ZijJrI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KJUXM0vzrZPLc6p437NziW5Yk7eq5iEHIK+sjVtzFT4rK56q5IZ8obZkgLd2mtkYN
	 fdeAJHDYSCG9jdTTJDbr66RCXMsXKXIvfKlx2hN3AEEgz/nwOQQ0D8Xonbh4YsJK8p
	 EXmAc8w4Z0w6daWYRndieZL+t859t2fIw6C4ef41UnCpGtpx7xeG71FQZzjtS0QNE9
	 y97yqv6iFI+ceKgitBkvmBsj0ntBdcW6DUUoS0g0/EYunDJN/FEDLauW6eC6V/TiOw
	 5vMLM5O6emQBdRfxDxhOpbmwX/AcpkdBTXwap1v+/0xg3iSqEb9dL3g5KXOBdrT/ww
	 CdAI33djG0qfQ==
Date: Thu, 16 May 2024 13:29:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
    "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v7 2/2] xen/privcmd: Add new syscall to get
 gsi from dev
In-Reply-To: <BL1PR12MB584969F16D93CC4A5C8E1F0FE7ED2@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2405161329330.2544314@ubuntu-linux-20-04-desktop>
References: <20240515065011.13797-1-Jiqian.Chen@amd.com> <20240515065011.13797-3-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2405151537430.2544314@ubuntu-linux-20-04-desktop> <BL1PR12MB584969F16D93CC4A5C8E1F0FE7ED2@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 May 2024, Chen, Jiqian wrote:
> On 2024/5/16 06:42, Stefano Stabellini wrote:
> > On Wed, 15 May 2024, Jiqian Chen wrote:
> >> In PVH dom0, it uses the linux local interrupt mechanism,
> >> when it allocs irq for a gsi, it is dynamic, and follow
> >> the principle of applying first, distributing first. And
> >> the irq number is alloced from small to large, but the
> >> applying gsi number is not, may gsi 38 comes before gsi 28,
> >> it causes the irq number is not equal with the gsi number.
> >> And when passthrough a device, QEMU will use device's gsi
> >> number to do pirq mapping, but the gsi number is got from
> >> file /sys/bus/pci/devices/<sbdf>/irq, irq!= gsi, so it will
> >> fail when mapping.
> >> And in current linux codes, there is no method to get gsi
> >> for userspace.
> >>
> >> For above purpose, record gsi of pcistub devices when init
> >> pcistub and add a new syscall into privcmd to let userspace
> >> can get gsi when they have a need.
> >>
> >> Co-developed-by: Huang Rui <ray.huang@amd.com>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >>  drivers/xen/privcmd.c              | 28 ++++++++++++++++++++++
> >>  drivers/xen/xen-pciback/pci_stub.c | 38 +++++++++++++++++++++++++++---
> >>  include/uapi/xen/privcmd.h         |  7 ++++++
> >>  include/xen/acpi.h                 |  2 ++
> >>  4 files changed, 72 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> >> index 67dfa4778864..5953a03b5cb0 100644
> >> --- a/drivers/xen/privcmd.c
> >> +++ b/drivers/xen/privcmd.c
> >> @@ -45,6 +45,9 @@
> >>  #include <xen/page.h>
> >>  #include <xen/xen-ops.h>
> >>  #include <xen/balloon.h>
> >> +#ifdef CONFIG_ACPI
> >> +#include <xen/acpi.h>
> >> +#endif
> >>  
> >>  #include "privcmd.h"
> >>  
> >> @@ -842,6 +845,27 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
> >>  	return rc;
> >>  }
> >>  
> >> +static long privcmd_ioctl_gsi_from_dev(struct file *file, void __user *udata)
> >> +{
> >> +	struct privcmd_gsi_from_dev kdata;
> >> +
> >> +	if (copy_from_user(&kdata, udata, sizeof(kdata)))
> >> +		return -EFAULT;
> >> +
> >> +#ifdef CONFIG_ACPI
> >> +	kdata.gsi = pcistub_get_gsi_from_sbdf(kdata.sbdf);
> >> +	if (kdata.gsi == -1)
> >> +		return -EINVAL;
> >> +#else
> >> +	kdata.gsi = -1;
> > 
> > Should we return an error instead, like -EINVAL, to make the behavior
> > more similar to the CONFIG_ACPI case?
> OK, will return -EINVAL if not config acpi.
> Like:
> static long privcmd_ioctl_gsi_from_dev(struct file *file, void __user *udata)
> {
> #ifdef CONFIG_ACPI
> 	struct privcmd_gsi_from_dev kdata;
> 
> 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
> 		return -EFAULT;
> 
> 	kdata.gsi = pcistub_get_gsi_from_sbdf(kdata.sbdf);
> 	if (kdata.gsi == -1)
> 		return -EINVAL;
> 
> 	if (copy_to_user(udata, &kdata, sizeof(kdata)))
> 		return -EFAULT;
> 
> 	return 0;
> #else
> 	return -EINVAL;
> #endif
> }


Yep that's fine



> >> +#endif
> >> +
> >> +	if (copy_to_user(udata, &kdata, sizeof(kdata)))
> >> +		return -EFAULT;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  #ifdef CONFIG_XEN_PRIVCMD_EVENTFD
> >>  /* Irqfd support */
> >>  static struct workqueue_struct *irqfd_cleanup_wq;
> >> @@ -1529,6 +1553,10 @@ static long privcmd_ioctl(struct file *file,
> >>  		ret = privcmd_ioctl_ioeventfd(file, udata);
> >>  		break;
> >>  
> >> +	case IOCTL_PRIVCMD_GSI_FROM_DEV:
> >> +		ret = privcmd_ioctl_gsi_from_dev(file, udata);
> >> +		break;
> >> +
> >>  	default:
> >>  		break;
> >>  	}
> >> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> >> index 2b90d832d0a7..4b62b4d377a9 100644
> >> --- a/drivers/xen/xen-pciback/pci_stub.c
> >> +++ b/drivers/xen/xen-pciback/pci_stub.c
> >> @@ -56,6 +56,9 @@ struct pcistub_device {
> >>  
> >>  	struct pci_dev *dev;
> >>  	struct xen_pcibk_device *pdev;/* non-NULL if struct pci_dev is in use */
> >> +#ifdef CONFIG_ACPI
> >> +	int gsi;
> >> +#endif
> >>  };
> >>  
> >>  /* Access to pcistub_devices & seized_devices lists and the initialize_devices
> >> @@ -88,6 +91,9 @@ static struct pcistub_device *pcistub_device_alloc(struct pci_dev *dev)
> >>  
> >>  	kref_init(&psdev->kref);
> >>  	spin_lock_init(&psdev->lock);
> >> +#ifdef CONFIG_ACPI
> >> +	psdev->gsi = -1;
> >> +#endif
> >>  
> >>  	return psdev;
> >>  }
> >> @@ -220,6 +226,25 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
> >>  	return pci_dev;
> >>  }
> >>  
> >> +#ifdef CONFIG_ACPI
> >> +int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> >> +{
> >> +	struct pcistub_device *psdev;
> >> +	int domain = sbdf >> 16;
> >> +	int bus = (sbdf >> 8) & 0xff;
> >> +	int slot = (sbdf >> 3) & 0x1f;
> >> +	int func = sbdf & 0x7;
> > 
> > you can use PCI_DEVFN PCI_SLOT PCI_FUNC pci_domain_nr instead of open
> > coding.
> Thanks, will change to use these in next version.
> But pci_domain_nr requires passing in pci_dev.
> Will change like:
> 	int domain = (sbdf >> 16) & 0xffff;
> 	int bus = PCI_BUS_NUM(sbdf);
> 	int slot = PCI_SLOT(sbdf);
> 	int func = PCI_FUNC(sbdf);

That's fine


 
> >> +
> >> +	psdev = pcistub_device_find(domain, bus, slot, func);
> >> +
> >> +	if (!psdev)
> >> +		return -1;
> >> +
> >> +	return psdev->gsi;
> >> +}
> >> +EXPORT_SYMBOL_GPL(pcistub_get_gsi_from_sbdf);
> >> +#endif
> >> +
> >>  struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
> >>  					    int domain, int bus,
> >>  					    int slot, int func)
> >> @@ -367,14 +392,20 @@ static int pcistub_match(struct pci_dev *dev)
> >>  	return found;
> >>  }
> >>  
> >> -static int pcistub_init_device(struct pci_dev *dev)
> >> +static int pcistub_init_device(struct pcistub_device *psdev)
> >>  {
> >>  	struct xen_pcibk_dev_data *dev_data;
> >> +	struct pci_dev *dev;
> >>  #ifdef CONFIG_ACPI
> >>  	int gsi, trigger, polarity;
> >>  #endif
> >>  	int err = 0;
> >>  
> >> +	if (!psdev)
> >> +		return -EINVAL;
> >> +
> >> +	dev = psdev->dev;
> >> +
> >>  	dev_dbg(&dev->dev, "initializing...\n");
> >>  
> >>  	/* The PCI backend is not intended to be a module (or to work with
> >> @@ -448,6 +479,7 @@ static int pcistub_init_device(struct pci_dev *dev)
> >>  		dev_err(&dev->dev, "Fail to get gsi info!\n");
> >>  		goto config_release;
> >>  	}
> >> +	psdev->gsi = gsi;
> >>  
> >>  	if (xen_initial_domain() && xen_pvh_domain()) {
> >>  		err = xen_pvh_setup_gsi(gsi, trigger, polarity);
> >> @@ -495,7 +527,7 @@ static int __init pcistub_init_devices_late(void)
> >>  
> >>  		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
> >>  
> >> -		err = pcistub_init_device(psdev->dev);
> >> +		err = pcistub_init_device(psdev);
> >>  		if (err) {
> >>  			dev_err(&psdev->dev->dev,
> >>  				"error %d initializing device\n", err);
> >> @@ -565,7 +597,7 @@ static int pcistub_seize(struct pci_dev *dev,
> >>  		spin_unlock_irqrestore(&pcistub_devices_lock, flags);
> >>  
> >>  		/* don't want irqs disabled when calling pcistub_init_device */
> >> -		err = pcistub_init_device(psdev->dev);
> >> +		err = pcistub_init_device(psdev);
> >>  
> >>  		spin_lock_irqsave(&pcistub_devices_lock, flags);
> >>  
> >> diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
> >> index 8b8c5d1420fe..220e7670a113 100644
> >> --- a/include/uapi/xen/privcmd.h
> >> +++ b/include/uapi/xen/privcmd.h
> >> @@ -126,6 +126,11 @@ struct privcmd_ioeventfd {
> >>  	__u8 pad[2];
> >>  };
> >>  
> >> +struct privcmd_gsi_from_dev {
> >> +	__u32 sbdf;
> >> +	int gsi;
> >> +};
> >> +
> >>  /*
> >>   * @cmd: IOCTL_PRIVCMD_HYPERCALL
> >>   * @arg: &privcmd_hypercall_t
> >> @@ -157,5 +162,7 @@ struct privcmd_ioeventfd {
> >>  	_IOW('P', 8, struct privcmd_irqfd)
> >>  #define IOCTL_PRIVCMD_IOEVENTFD					\
> >>  	_IOW('P', 9, struct privcmd_ioeventfd)
> >> +#define IOCTL_PRIVCMD_GSI_FROM_DEV				\
> >> +	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_gsi_from_dev))
> >>  
> >>  #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
> >> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> >> index 9b50027113f3..0bf5f4884456 100644
> >> --- a/include/xen/acpi.h
> >> +++ b/include/xen/acpi.h
> >> @@ -83,4 +83,6 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
> >>  						  int *gsi_out,
> >>  						  int *trigger_out,
> >>  						  int *polarity_out);
> >> +
> >> +int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
> >>  #endif	/* _XEN_ACPI_H */
> >> -- 
> >> 2.34.1
> >>
> 
> -- 
> Best regards,
> Jiqian Chen.
> 

