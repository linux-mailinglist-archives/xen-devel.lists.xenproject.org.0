Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7B86078C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 01:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684559.1064465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJGc-0004UK-PE; Fri, 23 Feb 2024 00:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684559.1064465; Fri, 23 Feb 2024 00:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdJGc-0004SI-MS; Fri, 23 Feb 2024 00:18:18 +0000
Received: by outflank-mailman (input) for mailman id 684559;
 Fri, 23 Feb 2024 00:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdJGb-0004SB-7J
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 00:18:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08ac98a3-d1e1-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 01:18:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07FD861576;
 Fri, 23 Feb 2024 00:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75A5C433C7;
 Fri, 23 Feb 2024 00:18:10 +0000 (UTC)
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
X-Inumbo-ID: 08ac98a3-d1e1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647492;
	bh=/G3WPmBRvHL0fQTmn66Ut0QyFHARNRNblDjaZFfez/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hlxrDVqi28sPJZBicQlLwLyRh9U4XeEujfJ0EFXtO9br3dnF2mFBBMflGjQcl5sf3
	 m64smT5OWhiZNtV7EEuXe8uEPcdgW549x03T0y467QC2NKZx0rNa16MbydqNH6/KuG
	 3NfQs6tQ5dC2D1lyl2xE6qa+u+E8I3ustDK803Ust/MUgChlKwTNa09VpBj31bkpLP
	 8RYwXA98chqcnzdAmsMQ9XRyQHQtyQyN5+bCs0MoO3vGXvYU/AAgBgCTtCgVKJtYkX
	 4TBnN2D1gH0tozMZM1O5lbxj06kgzmetx5E/deNYgJ/NxjfOaEPs6LH9DqX3MzUhif
	 Wqzj8oehIpS9A==
Date: Thu, 22 Feb 2024 16:18:09 -0800 (PST)
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
Subject: Re: [RFC KERNEL PATCH v4 1/3] xen/pci: Add xen_reset_device_state
 function
In-Reply-To: <20240105062217.349645-2-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402221617590.754277@ubuntu-linux-20-04-desktop>
References: <20240105062217.349645-1-Jiqian.Chen@amd.com> <20240105062217.349645-2-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> When device on dom0 side has been reset, the vpci on Xen side
> won't get notification, so that the cached state in vpci is
> all out of date with the real device state.
> To solve that problem, add a new function to clear all vpci
> device state when device is reset on dom0 side.
> 
> And call that function in pcistub_init_device. Because when
> using "pci-assignable-add" to assign a passthrough device in
> Xen, it will reset passthrough device and the vpci state will
> out of date, and then device will fail to restore bar state.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/pci.c                  | 12 ++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c | 18 +++++++++++++++---
>  include/xen/interface/physdev.h    |  7 +++++++
>  include/xen/pci.h                  |  6 ++++++
>  4 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 72d4e3f193af..e9b30bc09139 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -177,6 +177,18 @@ static int xen_remove_device(struct device *dev)
>  	return r;
>  }
>  
> +int xen_reset_device_state(const struct pci_dev *dev)
> +{
> +	struct physdev_pci_device device = {
> +		.seg = pci_domain_nr(dev->bus),
> +		.bus = dev->bus->number,
> +		.devfn = dev->devfn
> +	};
> +
> +	return HYPERVISOR_physdev_op(PHYSDEVOP_pci_device_state_reset, &device);
> +}
> +EXPORT_SYMBOL_GPL(xen_reset_device_state);
> +
>  static int xen_pci_notifier(struct notifier_block *nb,
>  			    unsigned long action, void *data)
>  {
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index e34b623e4b41..46c40ec8a18e 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -89,6 +89,16 @@ static struct pcistub_device *pcistub_device_alloc(struct pci_dev *dev)
>  	return psdev;
>  }
>  
> +static int pcistub_reset_device_state(struct pci_dev *dev)
> +{
> +	__pci_reset_function_locked(dev);
> +
> +	if (!xen_pv_domain())
> +		return xen_reset_device_state(dev);
> +	else
> +		return 0;
> +}
> +
>  /* Don't call this directly as it's called by pcistub_device_put */
>  static void pcistub_device_release(struct kref *kref)
>  {
> @@ -107,7 +117,7 @@ static void pcistub_device_release(struct kref *kref)
>  	/* Call the reset function which does not take lock as this
>  	 * is called from "unbind" which takes a device_lock mutex.
>  	 */
> -	__pci_reset_function_locked(dev);
> +	pcistub_reset_device_state(dev);
>  	if (dev_data &&
>  	    pci_load_and_free_saved_state(dev, &dev_data->pci_saved_state))
>  		dev_info(&dev->dev, "Could not reload PCI state\n");
> @@ -284,7 +294,7 @@ void pcistub_put_pci_dev(struct pci_dev *dev)
>  	 * (so it's ready for the next domain)
>  	 */
>  	device_lock_assert(&dev->dev);
> -	__pci_reset_function_locked(dev);
> +	pcistub_reset_device_state(dev);
>  
>  	dev_data = pci_get_drvdata(dev);
>  	ret = pci_load_saved_state(dev, dev_data->pci_saved_state);
> @@ -420,7 +430,9 @@ static int pcistub_init_device(struct pci_dev *dev)
>  		dev_err(&dev->dev, "Could not store PCI conf saved state!\n");
>  	else {
>  		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
> -		__pci_reset_function_locked(dev);
> +		err = pcistub_reset_device_state(dev);
> +		if (err)
> +			goto config_release;
>  		pci_restore_state(dev);
>  	}
>  	/* Now disable the device (this also ensures some private device
> diff --git a/include/xen/interface/physdev.h b/include/xen/interface/physdev.h
> index a237af867873..8609770e28f5 100644
> --- a/include/xen/interface/physdev.h
> +++ b/include/xen/interface/physdev.h
> @@ -256,6 +256,13 @@ struct physdev_pci_device_add {
>   */
>  #define PHYSDEVOP_prepare_msix          30
>  #define PHYSDEVOP_release_msix          31
> +/*
> + * Notify the hypervisor that a PCI device has been reset, so that any
> + * internally cached state is regenerated.  Should be called after any
> + * device reset performed by the hardware domain.
> + */
> +#define PHYSDEVOP_pci_device_state_reset     32
> +
>  struct physdev_pci_device {
>      /* IN */
>      uint16_t seg;
> diff --git a/include/xen/pci.h b/include/xen/pci.h
> index b8337cf85fd1..b2e2e856efd6 100644
> --- a/include/xen/pci.h
> +++ b/include/xen/pci.h
> @@ -4,10 +4,16 @@
>  #define __XEN_PCI_H__
>  
>  #if defined(CONFIG_XEN_DOM0)
> +int xen_reset_device_state(const struct pci_dev *dev);
>  int xen_find_device_domain_owner(struct pci_dev *dev);
>  int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
>  int xen_unregister_device_domain_owner(struct pci_dev *dev);
>  #else
> +static inline int xen_reset_device_state(const struct pci_dev *dev)
> +{
> +	return -1;
> +}
> +
>  static inline int xen_find_device_domain_owner(struct pci_dev *dev)
>  {
>  	return -1;
> -- 
> 2.34.1
> 

