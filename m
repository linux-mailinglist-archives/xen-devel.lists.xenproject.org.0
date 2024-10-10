Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849179992A0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 21:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816455.1230664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syyzb-0005wA-1U; Thu, 10 Oct 2024 19:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816455.1230664; Thu, 10 Oct 2024 19:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syyza-0005ts-Uh; Thu, 10 Oct 2024 19:38:34 +0000
Received: by outflank-mailman (input) for mailman id 816455;
 Thu, 10 Oct 2024 19:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syyzZ-0005tT-DJ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 19:38:33 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3937cbcf-873f-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 21:38:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2B237A4020A;
 Thu, 10 Oct 2024 19:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F03C4CECC;
 Thu, 10 Oct 2024 19:38:26 +0000 (UTC)
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
X-Inumbo-ID: 3937cbcf-873f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728589107;
	bh=fIaFEL2432nob6KEiMmP2odt7ge8i70XjeaZTXAuU0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uH4ye3CDFTPsPCrl4O32hydS+/adIaz9F1/wxOhQ/dCW3ZSDHfoiR45sBWOehUz20
	 BXTO/COj3dxoqUxNkvN+KDiOhM91VAE0xIRVRGIcDWfRQQ6HYLJHpr1VM86CAvVB5V
	 JEK/QO7iJcYquT4NumU8Hbf1u35EO48qQ6f9JmjI20sXzlWM5oI2DPU9UIsozrx3Ie
	 D6TlKRiHlkYluVc1KsVXk9BNvZFxuUamjy3dGkfQxto+UUAqpCuIfKPaHQVV1+GLlm
	 keDJI85nPt9CAXhjo3vlXfUzTchT+PYBj85JHr+IIG4OQu90bj98r1UYl2LeExivGX
	 /ECPqcwEH9Bsg==
Date: Thu, 10 Oct 2024 12:38:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
In-Reply-To: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410101237430.471028@ubuntu-linux-20-04-desktop>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-35704740-1728589107=:471028"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-35704740-1728589107=:471028
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 10 Oct 2024, Jiqian Chen wrote:
> Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> adds a weak reverse dependency to the config XEN_PRIVCMD definition, that
> dependency causes xen-privcmd can't be loaded on domU, because
> dependent xen-pciback is always not be loaded successfully on domU.
> 
> To solve above problem, remove that dependency, and do not call
> pcistub_get_gsi_from_sbdf() directly, instead add a hook in
> drivers/xen/apci.c, xen-pciback register the real call function, then in
> privcmd_ioctl_pcidev_get_gsi call that hook.
> 
> Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> v1->v2 changes:
> Added hook xen_acpi_get_gsi_from_sbdf.
> Changed pcistub_get_gsi_from_sbdf to static and pciback register it as the real hook function.
> ---
>  drivers/xen/Kconfig                |  1 -
>  drivers/xen/acpi.c                 | 17 +++++++++++++++++
>  drivers/xen/privcmd.c              |  6 ++----
>  drivers/xen/xen-pciback/pci_stub.c |  4 ++--
>  include/xen/acpi.h                 | 12 ++++--------
>  5 files changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 72ddee4c1544..f7d6f47971fd 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -261,7 +261,6 @@ config XEN_SCSI_BACKEND
>  config XEN_PRIVCMD
>  	tristate "Xen hypercall passthrough driver"
>  	depends on XEN
> -	imply XEN_PCIDEV_BACKEND
>  	default m
>  	help
>  	  The hypercall passthrough driver allows privileged user programs to
> diff --git a/drivers/xen/acpi.c b/drivers/xen/acpi.c
> index 9e2096524fbc..0bff2f3a87d2 100644
> --- a/drivers/xen/acpi.c
> +++ b/drivers/xen/acpi.c
> @@ -125,3 +125,20 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
> +
> +get_gsi_from_sbdf_t get_gsi_from_sbdf = NULL;

This can be static


> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
> +{
> +	get_gsi_from_sbdf = func;
> +}
> +EXPORT_SYMBOL_GPL(xen_acpi_register_get_gsi_func);
> +
> +int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
> +{
> +	if (get_gsi_from_sbdf)
> +		return get_gsi_from_sbdf(sbdf);
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_from_sbdf);
> \ No newline at end of file
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 3273cb8c2a66..4f75bc876454 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -850,15 +850,13 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
>  static long privcmd_ioctl_pcidev_get_gsi(struct file *file, void __user *udata)
>  {
>  #if defined(CONFIG_XEN_ACPI)
> -	int rc = -EINVAL;
> +	int rc;
>  	struct privcmd_pcidev_get_gsi kdata;
>  
>  	if (copy_from_user(&kdata, udata, sizeof(kdata)))
>  		return -EFAULT;
>  
> -	if (IS_REACHABLE(CONFIG_XEN_PCIDEV_BACKEND))
> -		rc = pcistub_get_gsi_from_sbdf(kdata.sbdf);
> -
> +	rc = xen_acpi_get_gsi_from_sbdf(kdata.sbdf);
>  	if (rc < 0)
>  		return rc;
>  
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 2f3da5ac62cd..900e6199eec7 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -227,7 +227,7 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
>  }
>  
>  #ifdef CONFIG_XEN_ACPI
> -int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> +static int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
>  {
>  	struct pcistub_device *psdev;
>  	int domain = (sbdf >> 16) & 0xffff;
> @@ -242,7 +242,6 @@ int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
>  
>  	return psdev->gsi;
>  }
> -EXPORT_SYMBOL_GPL(pcistub_get_gsi_from_sbdf);
>  #endif
>  
>  struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
> @@ -484,6 +483,7 @@ static int pcistub_init_device(struct pcistub_device *psdev)
>  		if (err)
>  			goto config_release;
>  		psdev->gsi = gsi;
> +		xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
>  	}
>  #endif
>  
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index daa96a22d257..ef4f70e4a557 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -91,13 +91,9 @@ static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  }
>  #endif
>  
> -#ifdef CONFIG_XEN_PCI_STUB
> -int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
> -#else
> -static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> -{
> -	return -1;
> -}
> -#endif
> +typedef int (*get_gsi_from_sbdf_t)(u32 sbdf);
> +
> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func);
> +int xen_acpi_get_gsi_from_sbdf(unsigned int sbdf);
>  
>  #endif	/* _XEN_ACPI_H */
> -- 
> 2.34.1
> 
--8323329-35704740-1728589107=:471028--

