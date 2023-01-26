Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CAA67D989
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 00:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485232.752299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLBVl-0003B6-U9; Thu, 26 Jan 2023 23:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485232.752299; Thu, 26 Jan 2023 23:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLBVl-000387-Qt; Thu, 26 Jan 2023 23:18:29 +0000
Received: by outflank-mailman (input) for mailman id 485232;
 Thu, 26 Jan 2023 23:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSUn=5X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLBVk-00037z-E9
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 23:18:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7ea3c8-9dcf-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 00:18:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2154961987;
 Thu, 26 Jan 2023 23:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D2FC433EF;
 Thu, 26 Jan 2023 23:18:21 +0000 (UTC)
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
X-Inumbo-ID: bb7ea3c8-9dcf-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674775103;
	bh=oEPoflK9awJKSXqE5/QPLzbwK4CdwEB6BVinXmr75wU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l/SD3o4PRRj7/YUs6CoVZkeh59hizanT7ua2uPxrddWSXxswztV0zSpzITIitGQFb
	 PIrBOuuoJ/fNc9ce+RkhAKKjFhGsAmoHEkdDjVqoduh3B0oc8PeAzeLQarxJwTT3WE
	 UMZSTVwJkns8Q/vO+Lhua4iUl2+gPug+wlDjqDXwudju3S/iJQq6PIofjSm4H7kJhF
	 jrtjdndRsmcAC50wRdp7L1z1T3vLNzbyHRr7qXflh21e/gDjnrTimsimbDi5NWNwZN
	 1lpLwsCEs6eEmGxtOg/X+MGhnzR8qWmsUdi9un57jLYe3Enk4dvHovrnD53nBd6ILf
	 6FBe2x2qPAbgQ==
Date: Thu, 26 Jan 2023 15:18:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Kevin Tian <kevin.tian@intel.com>, Stewart.Hildebrand@amd.com
Subject: Re: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
In-Reply-To: <20220831141040.13231-2-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-2-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> domain->pdevs_lock protects access to domain->pdev_list.
> As this, it should be used when we are adding, removing on enumerating
> PCI devices assigned to a domain.
> 
> This enables more granular locking instead of one huge pcidevs_lock that
> locks entire PCI subsystem. Please note that pcidevs_lock() is still
> used, we are going to remove it in subsequent patches.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

I reviewed the patch, and made sure to pay extra attention to:
- error paths
- missing locks
- lock ordering
- interruptions

Here is what I found:


1) iommu.c:reassign_device_ownership and pci_amd_iommu.c:reassign_device
Both functions without any pdevs_lock locking do:
list_move(&pdev->domain_list, &target->pdev_list);

It seems to be it would need pdevs_lock. Maybe we need to change
list_move into list_del (protected by the pdevs_lock of the old domain)
and list_add (protected by the pdev_lock of the new domain).


2) has_arch_pdevs
has_arch_pdevs is implemented as list_empty and needs locking as well,
however no domain->pdevs_lock are added to protect has_arch_pdevs in
this patch. I think we need pdevs_lock around has_arch_pdevs.


Two more comments below about lock inversion and taking the same lock
twice



> ---
>  xen/common/domain.c                         |  1 +
>  xen/drivers/passthrough/amd/iommu_cmd.c     |  4 ++-
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  7 ++++-
>  xen/drivers/passthrough/pci.c               | 29 ++++++++++++++++++++-
>  xen/drivers/passthrough/vtd/iommu.c         |  9 +++++--
>  xen/drivers/vpci/header.c                   |  3 +++
>  xen/drivers/vpci/msi.c                      |  7 ++++-
>  xen/drivers/vpci/vpci.c                     |  4 +--
>  xen/include/xen/pci.h                       |  2 +-
>  xen/include/xen/sched.h                     |  1 +
>  10 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7062393e37..4611141b87 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -618,6 +618,7 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +    spin_lock_init(&d->pdevs_lock);
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> index 40ddf366bb..47c45398d4 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -308,11 +308,12 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
>      flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
>  }
>  
> -static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
> +static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
>                                         unsigned int order)
>  {
>      struct pci_dev *pdev;
>  
> +    spin_lock(&d->pdevs_lock);
>      for_each_pdev( d, pdev )
>      {
>          u8 devfn = pdev->devfn;
> @@ -323,6 +324,7 @@ static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
>          } while ( devfn != pdev->devfn &&
>                    PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>      }
> +    spin_unlock(&d->pdevs_lock);
>  }
>  
>  /* Flush iommu cache after p2m changes. */
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 4ba8e764b2..64c016491d 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -96,20 +96,25 @@ static int __must_check allocate_domain_resources(struct domain *d)
>      return rc;
>  }
>  
> -static bool any_pdev_behind_iommu(const struct domain *d,
> +static bool any_pdev_behind_iommu(struct domain *d,
>                                    const struct pci_dev *exclude,
>                                    const struct amd_iommu *iommu)
>  {
>      const struct pci_dev *pdev;
>  
> +    spin_lock(&d->pdevs_lock);
>      for_each_pdev ( d, pdev )
>      {
>          if ( pdev == exclude )
>              continue;
>  
>          if ( find_iommu_for_device(pdev->seg, pdev->sbdf.bdf) == iommu )
> +	{
> +	    spin_unlock(&d->pdevs_lock);
>              return true;
> +	}

code style: tabs instead of spaces


>      }
> +    spin_unlock(&d->pdevs_lock);
>  
>      return false;
>  }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index cdaf5c247f..4366f8f965 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -523,7 +523,9 @@ static void __init _pci_hide_device(struct pci_dev *pdev)
>      if ( pdev->domain )
>          return;
>      pdev->domain = dom_xen;
> +    spin_lock(&dom_xen->pdevs_lock);
>      list_add(&pdev->domain_list, &dom_xen->pdev_list);
> +    spin_unlock(&dom_xen->pdevs_lock);
>  }
>  
>  int __init pci_hide_device(unsigned int seg, unsigned int bus,
> @@ -595,7 +597,7 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
>      return pdev;
>  }
>  
> -struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
> +struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
>  {
>      struct pci_dev *pdev;
>  
> @@ -620,9 +622,16 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
>                  return pdev;
>      }
>      else
> +    {
> +        spin_lock(&d->pdevs_lock);
>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf )
> +            {
> +                spin_unlock(&d->pdevs_lock);
>                  return pdev;
> +            }
> +        spin_unlock(&d->pdevs_lock);
> +    }
>  
>      return NULL;
>  }
> @@ -817,7 +826,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> +        spin_lock(&hardware_domain->pdevs_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        spin_unlock(&hardware_domain->pdevs_lock);
>  
>          /*
>           * For devices not discovered by Xen during boot, add vPCI handlers
> @@ -827,7 +838,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            spin_lock(&pdev->domain->pdevs_lock);
>              list_del(&pdev->domain_list);
> +            spin_unlock(&pdev->domain->pdevs_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -835,7 +848,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              vpci_remove_device(pdev);
> +            spin_lock(&pdev->domain->pdevs_lock);
>              list_del(&pdev->domain_list);
> +            spin_unlock(&pdev->domain->pdevs_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -885,7 +900,11 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> +            {
> +                spin_lock(&pdev->domain->pdevs_lock);
>                  list_del(&pdev->domain_list);
> +                spin_unlock(&pdev->domain->pdevs_lock);
> +            }
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;
> @@ -967,12 +986,14 @@ int pci_release_devices(struct domain *d)
>          pcidevs_unlock();
>          return ret;
>      }
> +    spin_lock(&d->pdevs_lock);
>      list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>      {
>          bus = pdev->bus;
>          devfn = pdev->devfn;
>          ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;

This causes pdevs_lock to be taken twice. deassign_device also takes a
pdevs_lock.  Probably we need to change all the
spin_lock(&d->pdevs_lock) into spin_lock_recursive.



>      }
> +    spin_unlock(&d->pdevs_lock);
>      pcidevs_unlock();
>  
>      return ret;
> @@ -1194,7 +1215,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>              if ( !pdev->domain )
>              {
>                  pdev->domain = ctxt->d;
> +                spin_lock(&pdev->domain->pdevs_lock);
>                  list_add(&pdev->domain_list, &ctxt->d->pdev_list);
> +                spin_unlock(&pdev->domain->pdevs_lock);
>                  setup_one_hwdom_device(ctxt, pdev);
>              }
>              else if ( pdev->domain == dom_xen )
> @@ -1556,6 +1579,7 @@ static int iommu_get_device_group(
>          return group_id;
>  
>      pcidevs_lock();
> +    spin_lock(&d->pdevs_lock);
>      for_each_pdev( d, pdev )
>      {
>          unsigned int b = pdev->bus;
> @@ -1571,6 +1595,7 @@ static int iommu_get_device_group(
>          if ( sdev_id < 0 )
>          {
>              pcidevs_unlock();
> +            spin_unlock(&d->pdevs_lock);

lock inversion


>              return sdev_id;
>          }
>  
> @@ -1581,6 +1606,7 @@ static int iommu_get_device_group(
>              if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>              {
>                  pcidevs_unlock();
> +                spin_unlock(&d->pdevs_lock);

lock inversion


>                  return -EFAULT;
>              }
>              i++;
> @@ -1588,6 +1614,7 @@ static int iommu_get_device_group(
>      }
>  
>      pcidevs_unlock();
> +    spin_unlock(&d->pdevs_lock);

lock inversion


>      return i;
>  }
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 62e143125d..fff1442265 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -183,12 +183,13 @@ static void cleanup_domid_map(domid_t domid, struct vtd_iommu *iommu)
>      }
>  }
>  
> -static bool any_pdev_behind_iommu(const struct domain *d,
> +static bool any_pdev_behind_iommu(struct domain *d,
>                                    const struct pci_dev *exclude,
>                                    const struct vtd_iommu *iommu)
>  {
>      const struct pci_dev *pdev;
>  
> +    spin_lock(&d->pdevs_lock);
>      for_each_pdev ( d, pdev )
>      {
>          const struct acpi_drhd_unit *drhd;
> @@ -198,8 +199,12 @@ static bool any_pdev_behind_iommu(const struct domain *d,
>  
>          drhd = acpi_find_matched_drhd_unit(pdev);
>          if ( drhd && drhd->iommu == iommu )
> +        {
> +            spin_unlock(&d->pdevs_lock);
>              return true;
> +        }
>      }
> +    spin_unlock(&d->pdevs_lock);
>  
>      return false;
>  }
> @@ -208,7 +213,7 @@ static bool any_pdev_behind_iommu(const struct domain *d,
>   * If no other devices under the same iommu owned by this domain,
>   * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
>   */
> -static void check_cleanup_domid_map(const struct domain *d,
> +static void check_cleanup_domid_map(struct domain *d,
>                                      const struct pci_dev *exclude,
>                                      struct vtd_iommu *iommu)
>  {
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index a1c928a0d2..a59aa7ad0b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -267,6 +267,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * Check for overlaps with other BARs. Note that only BARs that are
>       * currently mapped (enabled) are checked for overlaps.
>       */
> +    spin_lock(&pdev->domain->pdevs_lock);
>      for_each_pdev ( pdev->domain, tmp )
>      {
>          if ( tmp == pdev )
> @@ -306,11 +307,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
>                  rangeset_destroy(mem);
> +                spin_unlock( &pdev->domain->pdevs_lock);
>                  return rc;
>              }
>          }
>      }
>  
> +    spin_unlock( &pdev->domain->pdevs_lock);
>      ASSERT(dev);
>  
>      if ( system_state < SYS_STATE_active )
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 8f2b59e61a..8969c335b0 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -265,7 +265,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -277,6 +277,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !spin_trylock(&d->pdevs_lock) )
> +            continue;
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -326,6 +329,8 @@ void vpci_dump_msi(void)
>              spin_unlock(&pdev->vpci->lock);
>              process_pending_softirqs();
>          }
> +        spin_unlock(&d->pdevs_lock);
> +
>      }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3467c0de86..7d1f9fd438 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -312,7 +312,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -415,7 +415,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 5975ca2f30..19047b4b20 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -177,7 +177,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  int pci_remove_device(u16 seg, u8 bus, u8 devfn);
>  int pci_ro_device(int seg, int bus, int devfn);
>  int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
> -struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
> +struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf);
>  struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
>  void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 1cf629e7ec..0775228ba9 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,7 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +    spinlock_t pdevs_lock;

I think it would be better called "pdev_lock" but OK either way


>  #endif
>  
>  #ifdef CONFIG_HAS_PASSTHROUGH
> -- 
> 2.36.1
> 

