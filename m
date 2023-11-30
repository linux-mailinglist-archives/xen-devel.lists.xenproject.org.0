Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D781F7FE7C9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644390.1005307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Y0K-0004ZQ-0d; Thu, 30 Nov 2023 03:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644390.1005307; Thu, 30 Nov 2023 03:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Y0J-0004Wf-TS; Thu, 30 Nov 2023 03:46:19 +0000
Received: by outflank-mailman (input) for mailman id 644390;
 Thu, 30 Nov 2023 03:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8Y0I-0004VL-40
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:46:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b9a5cd-8f33-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 04:46:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D9C30B840A3;
 Thu, 30 Nov 2023 03:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1247C433C8;
 Thu, 30 Nov 2023 03:46:12 +0000 (UTC)
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
X-Inumbo-ID: 03b9a5cd-8f33-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701315975;
	bh=ImiOiQhvhKUUm5oVJgUSz68972qeSMdz2GSy/eO9yLU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dMU82C4ZeK1W24ImseHcnSX0eL44pgYFISp5T440Je2Vd4TeXkzuVRypQvfXrKPsd
	 /0FMytuxWOCgVYRvEYAVtske8klm2NTIA2bGF7Tx6CqN3EriCImp1Ji7IsGMmrPp1y
	 UOkZBMLNF2jl60vh6uyUw4BwYoOVoBfd/QqQSFORM52fnvrNgBje020OVD8yFZAaJr
	 nHXBZX/ZJxahbdCW/IMPHnP/F4yA/Bvr9ZZjpjUiJTpQOIl9aJS3XHY88xdAAlIn0v
	 kfHoDg2K/N/V1W2aSIqJ1+NUCiVnrzpM6F+0m12/vvOOTXXkmfC1q4vbljJKxBzetP
	 PrL+7oqIEFKTA==
Date: Wed, 29 Nov 2023 19:46:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-acpi@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Christian Koenig <Christian.Koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 1/3] xen/pci: Add xen_reset_device_state
 function
In-Reply-To: <20231124103123.3263471-2-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311291943260.3533093@ubuntu-linux-20-04-desktop>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com> <20231124103123.3263471-2-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Jiqian Chen wrote:
> When device on dom0 side has been reset, the vpci on Xen side
> won't get notification, so that the cached state in vpci is
> all out of date with the real device state.
> To solve that problem, this patch add a function to clear all
> vpci device state when device is reset on dom0 side.
> 
> And call that function in pcistub_init_device. Because when
> we use "pci-assignable-add" to assign a passthrough device in
> Xen, it will reset passthrough device and the vpci state will
> out of date, and then device will fail to restore bar state.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/xen/pci.c                  | 12 ++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c |  3 +++
>  include/xen/interface/physdev.h    |  2 ++
>  include/xen/pci.h                  |  6 ++++++
>  4 files changed, 23 insertions(+)
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
> index e34b623e4b41..5a96b6c66c07 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -421,6 +421,9 @@ static int pcistub_init_device(struct pci_dev *dev)
>  	else {
>  		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
>  		__pci_reset_function_locked(dev);
> +		err = xen_reset_device_state(dev);
> +		if (err)
> +			goto config_release;

Older versions of Xen won't have the hypercall
PHYSDEVOP_pci_device_state_reset implemented. I think we should do
something like:

if (err && xen_pvh_domain())
    goto config_release;


Or even:

if (xen_pvh_domain()) {
    err = xen_reset_device_state(dev);
    if (err)
        goto config_release;
}

depending on whether we want to call xen_reset_device_state also for PV
guests or not. I am assuming we don't want to error out on failure such
as -ENOENT for PV guests.


>  		pci_restore_state(dev);
>  	}
>  	/* Now disable the device (this also ensures some private device
> diff --git a/include/xen/interface/physdev.h b/include/xen/interface/physdev.h
> index a237af867873..231526f80f6c 100644
> --- a/include/xen/interface/physdev.h
> +++ b/include/xen/interface/physdev.h
> @@ -263,6 +263,8 @@ struct physdev_pci_device {
>      uint8_t devfn;
>  };
>  
> +#define PHYSDEVOP_pci_device_state_reset     32
> +
>  #define PHYSDEVOP_DBGP_RESET_PREPARE    1
>  #define PHYSDEVOP_DBGP_RESET_DONE       2
>  
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

