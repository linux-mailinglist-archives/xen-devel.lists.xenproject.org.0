Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E260867DA0F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 00:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485248.752329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLC6S-0000vJ-Dk; Thu, 26 Jan 2023 23:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485248.752329; Thu, 26 Jan 2023 23:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLC6S-0000tO-Aq; Thu, 26 Jan 2023 23:56:24 +0000
Received: by outflank-mailman (input) for mailman id 485248;
 Thu, 26 Jan 2023 23:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSUn=5X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLC6R-0000tE-A2
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 23:56:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07ba4d61-9dd5-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 00:56:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34110619B6;
 Thu, 26 Jan 2023 23:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC114C433EF;
 Thu, 26 Jan 2023 23:56:15 +0000 (UTC)
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
X-Inumbo-ID: 07ba4d61-9dd5-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674777377;
	bh=DwfCsZqi11xOsBibNjExjGi09Wzh6P6UdIyV2qy6aZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RTKzyjZG3PuPEN19kpNkRjAbGF0P95/sJ4tQc7bokyg8MJHpNlj2zDA7+i1cjkEmV
	 tTxkkSPlwVjhHJTIxzzfnYyotTF+hAKMIWZryb5ktwwmgerTqgw4T91rbVYBGuTSKI
	 +Y/hXhey+SBJP1Z7M5qT9dO82TzLBjfu4MjwOoTtbojOpucc451NunQawLFxFyjLAy
	 7XVeiAi1G2fQB+9U50Q8m3l5yQ1ijAVtqk0Ko2kgQZVCKNFw/TAcGsCY1wgEAvd72j
	 UqF70clJCAEdZf+hVBZ/Q0fA3lobPjurxdSLMqoLuYOxRNolom7C5bjU1pMj47JxND
	 kCReDtBcIG8Xg==
Date: Thu, 26 Jan 2023 15:56:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
In-Reply-To: <20220831141040.13231-4-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301261541420.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-4-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> ATS subsystem has own list of PCI devices. As we are going to remove
> global pcidevs_lock() in favor to more granular locking, we need to
> ensure that this list is protected somehow. To do this, we need to add
> additional lock for each IOMMU, as list to be protected is also part
> of IOMMU.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/drivers/passthrough/amd/iommu.h         |  1 +
>  xen/drivers/passthrough/amd/iommu_detect.c  |  1 +
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 ++++++++
>  xen/drivers/passthrough/pci.c               |  1 +
>  xen/drivers/passthrough/vtd/iommu.c         | 11 +++++++++++
>  xen/drivers/passthrough/vtd/iommu.h         |  1 +
>  xen/drivers/passthrough/vtd/qinval.c        |  3 +++
>  xen/drivers/passthrough/vtd/x86/ats.c       |  3 +++
>  8 files changed, 29 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index 8bc3c35b1b..edd6eb52b3 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -106,6 +106,7 @@ struct amd_iommu {
>      int enabled;
>  
>      struct list_head ats_devices;
> +    spinlock_t ats_list_lock;
>  };
>  
>  struct ivrs_unity_map {
> diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
> index 2317fa6a7d..1d6f4f2168 100644
> --- a/xen/drivers/passthrough/amd/iommu_detect.c
> +++ b/xen/drivers/passthrough/amd/iommu_detect.c
> @@ -160,6 +160,7 @@ int __init amd_iommu_detect_one_acpi(
>      }
>  
>      spin_lock_init(&iommu->lock);
> +    spin_lock_init(&iommu->ats_list_lock);
>      INIT_LIST_HEAD(&iommu->ats_devices);
>  
>      iommu->seg = ivhd_block->pci_segment_group;
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 64c016491d..955f3af57a 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -276,7 +276,11 @@ static int __must_check amd_iommu_setup_domain_device(
>           !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>      {
>          if ( devfn == pdev->devfn )
> +	{
> +	    spin_lock(&iommu->ats_list_lock);
>              enable_ats_device(pdev, &iommu->ats_devices);
> +	    spin_unlock(&iommu->ats_list_lock);

code style


> +	}
>  
>          amd_iommu_flush_iotlb(devfn, pdev, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
>      }
> @@ -416,7 +420,11 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
>  
>      if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>           pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
> +    {
> +	spin_lock(&iommu->ats_list_lock);
>          disable_ats_device(pdev);
> +	spin_unlock(&iommu->ats_list_lock);

code style


> +    }
>  
>      BUG_ON ( iommu->dev_table.buffer == NULL );
>      req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 2dfa1c2875..b5db5498a1 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1641,6 +1641,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>  {
>      pcidevs_lock();
>  
> +    /* iommu->ats_list_lock is taken by the caller of this function */

This is a locking inversion. In all other places we take pcidevs_lock
first, then ats_list_lock lock. For instance look at
xen/drivers/passthrough/pci.c:deassign_device that is called with
pcidevs_locked and then calls iommu_call(... reassign_device ...) which
ends up taking ats_list_lock.

This is the only exception. I think we need to move the
spin_lock(ats_list_lock) from qinval.c to here.



>      disable_ats_device(pdev);
>  
>      ASSERT(pdev->domain);
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index fff1442265..42661f22f4 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1281,6 +1281,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>      spin_lock_init(&iommu->lock);
>      spin_lock_init(&iommu->register_lock);
>      spin_lock_init(&iommu->intremap.lock);
> +    spin_lock_init(&iommu->ats_list_lock);
>  
>      iommu->drhd = drhd;
>      drhd->iommu = iommu;
> @@ -1769,7 +1770,11 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
>          if ( ret > 0 )
>              ret = 0;
>          if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
> +        {
> +            spin_lock(&drhd->iommu->ats_list_lock);
>              enable_ats_device(pdev, &drhd->iommu->ats_devices);
> +            spin_unlock(&drhd->iommu->ats_list_lock);
> +        }
>  
>          break;
>  
> @@ -1977,7 +1982,11 @@ static const struct acpi_drhd_unit *domain_context_unmap(
>                     domain, &PCI_SBDF(seg, bus, devfn));
>          ret = domain_context_unmap_one(domain, iommu, bus, devfn);
>          if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
> +        {
> +            spin_lock(&iommu->ats_list_lock);
>              disable_ats_device(pdev);
> +            spin_unlock(&iommu->ats_list_lock);
> +        }
>  
>          break;
>  
> @@ -2374,7 +2383,9 @@ static int cf_check intel_iommu_enable_device(struct pci_dev *pdev)
>      if ( ret <= 0 )
>          return ret;
>  
> +    spin_lock(&drhd->iommu->ats_list_lock);
>      ret = enable_ats_device(pdev, &drhd->iommu->ats_devices);
> +    spin_unlock(&drhd->iommu->ats_list_lock);
>  
>      return ret >= 0 ? 0 : ret;
>  }
> diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
> index 78aa8a96f5..2a7a4c1b58 100644
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -506,6 +506,7 @@ struct vtd_iommu {
>      } flush;
>  
>      struct list_head ats_devices;
> +    spinlock_t ats_list_lock;
>      unsigned long *pseudo_domid_map; /* "pseudo" domain id bitmap */
>      unsigned long *domid_bitmap;  /* domain id bitmap */
>      domid_t *domid_map;           /* domain id mapping array */
> diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
> index 4f9ad136b9..6e876348db 100644
> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -238,7 +238,10 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
>          if ( d == NULL )
>              return rc;
>  
> +	spin_lock(&iommu->ats_list_lock);
>          iommu_dev_iotlb_flush_timeout(d, pdev);
> +	spin_unlock(&iommu->ats_list_lock);

code style


>          rcu_unlock_domain(d);
>      }
>      else if ( rc == -ETIMEDOUT )
> diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
> index 04d702b1d6..55e991183b 100644
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -117,6 +117,7 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
>      if ( !ecap_dev_iotlb(iommu->ecap) )
>          return ret;
>  
> +    spin_lock(&iommu->ats_list_lock);
>      list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
>      {
>          bool_t sbit;
> @@ -155,12 +156,14 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
>              break;
>          default:
>              dprintk(XENLOG_WARNING VTDPREFIX, "invalid vt-d flush type\n");
> +	    spin_unlock(&iommu->ats_list_lock);

code style


>              return -EOPNOTSUPP;
>          }
>  
>          if ( !ret )
>              ret = rc;
>      }
> +    spin_unlock(&iommu->ats_list_lock);
>  
>      return ret;
>  }
> -- 
> 2.36.1
> 

