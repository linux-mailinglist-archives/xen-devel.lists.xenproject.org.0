Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFF67F3BD
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 02:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486036.753504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLa4j-0002eG-MP; Sat, 28 Jan 2023 01:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486036.753504; Sat, 28 Jan 2023 01:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLa4j-0002dJ-I6; Sat, 28 Jan 2023 01:32:13 +0000
Received: by outflank-mailman (input) for mailman id 486036;
 Sat, 28 Jan 2023 01:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LM4o=5Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLa4h-0002dD-II
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 01:32:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94cf727f-9eab-11ed-a5d9-ddcf98b90cbd;
 Sat, 28 Jan 2023 02:32:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6959B82217;
 Sat, 28 Jan 2023 01:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE843C433EF;
 Sat, 28 Jan 2023 01:32:05 +0000 (UTC)
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
X-Inumbo-ID: 94cf727f-9eab-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674869527;
	bh=EFWfFpfiH8r6XMH+rfQWbY8Chcx0m99d6kLSG+o81tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YsTd/UH47lBn3r1SFvB10ooSdiwOUnJRxwsPtfqnnxqizuhZyuZGHxW51FqlX/CGg
	 Iz5JR567+l0DdxZrfnNWPSnd1vw21ZEPPqHVbbNvvKvRvRhK14rRAuiJlpnlbnOsL9
	 sxQsF7oq9SKxG341+rdmV++jim/YXAoBT8c65//vcD7LK0bxXJlIM3eDpZIsu7mSuJ
	 b6N/yOQlk2Gkl+DQIlR0u6DgYt+mmA3JF6OnajIGDGBGPpepntIXVjUaIcpFBXePHE
	 CS09sTovWpVlttZI3uhmIXEzomZO4X6rPiS6ffSPtVWdlB2fn8RxtbcZvON5hSJLU+
	 1Bie/VhAbN14Q==
Date: Fri, 27 Jan 2023 17:32:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
In-Reply-To: <20220831141040.13231-9-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-9-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> As pci devices are refcounted now and all list that store them are
> protected by separate locks, we can safely drop global pcidevs_lock.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Up until this patch this patch series introduces:
- d->pdevs_lock to protect d->pdev_list
- pci_seg->alldevs_lock to protect pci_seg->alldevs_list
- iommu->ats_list_lock to protect iommu->ats_devices
- pdev refcounting to detect a pdev in-use and when to free it
- pdev->lock to protect pdev->msi_list

They cover a lot of ground.  Are they collectively covering everything
pcidevs_lock() was protecting?

deassign_device is not protected by pcidevs_lock anymore.
deassign_device accesses a number of pdev fields, including quarantine,
phantom_stride and fault.count.

deassign_device could run at the same time as assign_device who sets
quarantine and other fields.

It looks like assign_device, deassign_device, and other functions
accessing/modifying pdev fields should be protected by pdev->lock.

In fact, I think it would be safer to make sure every place that
currently has a pcidevs_lock() gets a pdev->lock (unless there is a
d->pdevs_lock, pci_seg->alldevs_lock, iommu->ats_list_lock, or another
lock) ?


> ---
>  xen/arch/x86/domctl.c                       |  8 ---
>  xen/arch/x86/hvm/vioapic.c                  |  2 -
>  xen/arch/x86/hvm/vmsi.c                     | 12 ----
>  xen/arch/x86/irq.c                          |  7 ---
>  xen/arch/x86/msi.c                          | 11 ----
>  xen/arch/x86/pci.c                          |  4 --
>  xen/arch/x86/physdev.c                      |  7 +--
>  xen/common/sysctl.c                         |  2 -
>  xen/drivers/char/ns16550.c                  |  4 --
>  xen/drivers/passthrough/amd/iommu_init.c    |  7 ---
>  xen/drivers/passthrough/amd/iommu_map.c     |  5 --
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  4 --
>  xen/drivers/passthrough/pci.c               | 63 +--------------------
>  xen/drivers/passthrough/vtd/iommu.c         |  8 ---
>  xen/drivers/video/vga.c                     |  2 -
>  15 files changed, 4 insertions(+), 142 deletions(-)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 020df615bd..9f4ca03385 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -537,11 +537,7 @@ long arch_do_domctl(
>  
>          ret = -ESRCH;
>          if ( is_iommu_enabled(d) )
> -        {
> -            pcidevs_lock();
>              ret = pt_irq_create_bind(d, bind);
> -            pcidevs_unlock();
> -        }
>          if ( ret < 0 )
>              printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for dom%d\n",
>                     ret, d->domain_id);
> @@ -566,11 +562,7 @@ long arch_do_domctl(
>              break;
>  
>          if ( is_iommu_enabled(d) )
> -        {
> -            pcidevs_lock();
>              ret = pt_irq_destroy_bind(d, bind);
> -            pcidevs_unlock();
> -        }
>          if ( ret < 0 )
>              printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for dom%d\n",
>                     ret, d->domain_id);
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index cb7f440160..aa4e7766a3 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -197,7 +197,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
>          return ret;
>      }
>  
> -    pcidevs_lock();
>      ret = pt_irq_create_bind(currd, &pt_irq_bind);
>      if ( ret )
>      {
> @@ -207,7 +206,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
>          unmap_domain_pirq(currd, pirq);
>          write_unlock(&currd->event_lock);
>      }
> -    pcidevs_unlock();
>  
>      return ret;
>  }
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index c9e5f279c5..344bbd646c 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -470,7 +470,6 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>      struct msixtbl_entry *entry, *new_entry;
>      int r = -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -540,7 +539,6 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>      struct pci_dev *pdev;
>      struct msixtbl_entry *entry;
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -686,8 +684,6 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>  {
>      unsigned int i;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
>      {
>          gdprintk(XENLOG_ERR, "%pp: PIRQ %u: unsupported address %lx\n",
> @@ -728,7 +724,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>  
>      ASSERT(msi->arch.pirq != INVALID_PIRQ);
>  
> -    pcidevs_lock();
>      for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq unbind = {
> @@ -747,7 +742,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>  
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
>                                         msi->vectors, msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  }
>  
>  static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
> @@ -785,10 +779,8 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
>          return rc;
>      msi->arch.pirq = rc;
>  
> -    pcidevs_lock();
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
>                                         msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  
>      return 0;
>  }
> @@ -800,7 +792,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>  
>      ASSERT(pirq != INVALID_PIRQ);
>  
> -    pcidevs_lock();
>      for ( i = 0; i < nr && bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq bind = {
> @@ -816,7 +807,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      write_lock(&pdev->domain->event_lock);
>      unmap_domain_pirq(pdev->domain, pirq);
>      write_unlock(&pdev->domain->event_lock);
> -    pcidevs_unlock();
>  }
>  
>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
> @@ -863,7 +853,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>  
>      entry->arch.pirq = rc;
>  
> -    pcidevs_lock();
>      rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
>                           entry->masked);
>      if ( rc )
> @@ -871,7 +860,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>          vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
>          entry->arch.pirq = INVALID_PIRQ;
>      }
> -    pcidevs_unlock();
>  
>      return rc;
>  }
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index d8672a03e1..6a08830a55 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2156,8 +2156,6 @@ int map_domain_pirq(
>          struct pci_dev *pdev;
>          unsigned int nr = 0;
>  
> -        ASSERT(pcidevs_locked());
> -
>          ret = -ENODEV;
>          if ( !cpu_has_apic )
>              goto done;
> @@ -2317,7 +2315,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> @@ -2423,7 +2420,6 @@ void free_domain_pirqs(struct domain *d)
>  {
>      int i;
>  
> -    pcidevs_lock();
>      write_lock(&d->event_lock);
>  
>      for ( i = 0; i < d->nr_pirqs; i++ )
> @@ -2431,7 +2427,6 @@ void free_domain_pirqs(struct domain *d)
>              unmap_domain_pirq(d, i);
>  
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
>  }
>  
>  static void cf_check dump_irqs(unsigned char key)
> @@ -2911,7 +2906,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>      msi->irq = irq;
>  
> -    pcidevs_lock();
>      /* Verify or get pirq. */
>      write_lock(&d->event_lock);
>      pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
> @@ -2927,7 +2921,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>   done:
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
>      if ( ret )
>      {
>          switch ( type )
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 6b62c4f452..f04b90e235 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -623,7 +623,6 @@ static int msi_capability_init(struct pci_dev *dev,
>      u8 slot = PCI_SLOT(dev->devfn);
>      u8 func = PCI_FUNC(dev->devfn);
>  
> -    ASSERT(pcidevs_locked());
>      pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
>      if ( !pos )
>          return -ENODEV;
> @@ -810,8 +809,6 @@ static int msix_capability_init(struct pci_dev *dev,
>      if ( !pos )
>          return -ENODEV;
>  
> -    ASSERT(pcidevs_locked());
> -
>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>      /*
>       * Ensure MSI-X interrupts are masked during setup. Some devices require
> @@ -1032,7 +1029,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>      struct msi_desc *old_desc;
>      int ret;
>  
> -    ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
>      if ( !pdev )
>          return -ENODEV;
> @@ -1092,7 +1088,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>      struct msi_desc *old_desc;
>      int ret;
>  
> -    ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;
> @@ -1191,7 +1186,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>      if ( !use_msi )
>          return 0;
>  
> -    pcidevs_lock();
>      pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
>      if ( !pdev )
>          rc = -ENODEV;
> @@ -1204,7 +1198,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>      }
>      else
>          rc = msix_capability_init(pdev, NULL, NULL);
> -    pcidevs_unlock();
>  
>      pcidev_put(pdev);
>  
> @@ -1217,8 +1210,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>   */
>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>  {
> -    ASSERT(pcidevs_locked());
> -
>      if ( !use_msi )
>          return -EPERM;
>  
> @@ -1355,8 +1346,6 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>      unsigned int type = 0, pos = 0;
>      u16 control = 0;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !use_msi )
>          return -EOPNOTSUPP;
>  
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 1d38f0df7c..4dcd6d96f3 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -88,15 +88,11 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>      if ( reg < 64 || reg >= 256 )
>          return 0;
>  
> -    pcidevs_lock();
> -
>      pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
>      if ( pdev ) {
>          rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
>  	pcidev_put(pdev);
>      }
>  
> -    pcidevs_unlock();
> -
>      return rc;
>  }
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 96214a3d40..a41366b609 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -162,11 +162,9 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
>              goto free_domain;
>      }
>  
> -    pcidevs_lock();
>      write_lock(&d->event_lock);
>      ret = unmap_domain_pirq(d, pirq);
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
>  
>   free_domain:
>      rcu_unlock_domain(d);
> @@ -530,7 +528,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&restore_msi, arg, 1) != 0 )
>              break;
>  
> -        pcidevs_lock();
>          pdev = pci_get_pdev(NULL,
>                              PCI_SBDF(0, restore_msi.bus, restore_msi.devfn));
>          if ( pdev )
> @@ -541,7 +538,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          else
>              ret = -ENODEV;
>  
> -        pcidevs_unlock();
>          break;
>      }
>  
> @@ -553,7 +549,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&dev, arg, 1) != 0 )
>              break;
>  
> -        pcidevs_lock();
>          pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
>          if ( pdev )
>          {
> @@ -562,7 +557,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          }
>          else
>              ret = -ENODEV;
> -        pcidevs_unlock();
> +
>          break;
>      }
>  
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 0feef94cd2..6bb8c5c295 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -446,7 +446,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  break;
>              }
>  
> -            pcidevs_lock();
>              pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
>              if ( !pdev )
>                  node = XEN_INVALID_DEV;
> @@ -454,7 +453,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  node = XEN_INVALID_NODE_ID;
>              else
>                  node = pdev->node;
> -            pcidevs_unlock();
>  
>              if ( pdev )
>                  pcidev_put(pdev);
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 01a05c9aa8..66c10b18e5 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -445,8 +445,6 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>              {
>                  struct msi_desc *msi_desc = NULL;
>  
> -                pcidevs_lock();
> -
>                  rc = pci_enable_msi(&msi, &msi_desc);
>                  if ( !rc )
>                  {
> @@ -460,8 +458,6 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>                          pci_disable_msi(msi_desc);
>                  }
>  
> -                pcidevs_unlock();
> -
>                  if ( rc )
>                  {
>                      uart->irq = 0;
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 7c1713a602..e42af65a40 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -638,10 +638,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
>      uint16_t device_id = iommu_get_devid_from_cmd(entry[0]);
>      struct pci_dev *pdev;
>  
> -    pcidevs_lock();
>      pdev = pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
> -    pcidevs_unlock();
> -
>      if ( pdev )
>          guest_iommu_add_ppr_log(pdev->domain, entry);
>      pcidev_put(pdev);
> @@ -747,14 +744,12 @@ static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>          return 0;
>      }
>  
> -    pcidevs_lock();
>      /*
>       * XXX: it is unclear if this device can be removed. Right now
>       * there is no code that clears msi.dev, so no one will decrease
>       * refcount on it.
>       */
>      iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
> -    pcidevs_unlock();
>      if ( !iommu->msi.dev )
>      {
>          AMD_IOMMU_WARN("no pdev for %pp\n",
> @@ -1289,9 +1284,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>              {
>                  if ( !pci_init )
>                      continue;
> -                pcidevs_lock();
>                  pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
> -                pcidevs_unlock();
>              }
>  
>              if ( pdev && (pdev->msix || pdev->msi_maxvec) )
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index 9d621e3d36..d04aa37538 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -726,9 +726,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
>              /* May need to trigger the workaround in find_iommu_for_device(). */
>              struct pci_dev *pdev;
>  
> -            pcidevs_lock();
>              pdev = pci_get_pdev(NULL, sbdf);
> -            pcidevs_unlock();
>  
>              if ( pdev )
>              {
> @@ -848,7 +846,6 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
>      const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
>      int rc;
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(!hd->arch.amd.root_table);
>      ASSERT(page_list_empty(&hd->arch.pgtables.list));
>  
> @@ -903,8 +900,6 @@ void amd_iommu_quarantine_teardown(struct pci_dev *pdev)
>  {
>      struct domain_iommu *hd = dom_iommu(dom_io);
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev->arch.amd.root_table )
>          return;
>  
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 955f3af57a..919e30129e 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -268,8 +268,6 @@ static int __must_check amd_iommu_setup_domain_device(
>                      req_id, pdev->type, page_to_maddr(root_pg),
>                      domid, hd->arch.amd.paging_mode);
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>           !ivrs_dev->block_ats &&
>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> @@ -416,8 +414,6 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
>      if ( QUARANTINE_SKIP(domain, pdev) )
>          return;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>           pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>      {
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index c83397211b..cc62a5aec4 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -517,7 +517,6 @@ int __init pci_hide_device(unsigned int seg, unsigned int bus,
>      struct pci_seg *pseg;
>      int rc = -ENOMEM;
>  
> -    pcidevs_lock();
>      pseg = alloc_pseg(seg);
>      if ( pseg )
>      {
> @@ -528,7 +527,6 @@ int __init pci_hide_device(unsigned int seg, unsigned int bus,
>              rc = 0;
>          }
>      }
> -    pcidevs_unlock();
>  
>      return rc;
>  }
> @@ -588,8 +586,6 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
>  {
>      struct pci_dev *pdev;
>  
> -    ASSERT(d || pcidevs_locked());
> -
>      /*
>       * The hardware domain owns the majority of the devices in the system.
>       * When there are multiple segments, traversing the per-segment list is
> @@ -730,7 +726,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          pdev_type = "device";
>      else if ( info->is_virtfn )
>      {
> -        pcidevs_lock();
>          pdev = pci_get_pdev(NULL,
>                              PCI_SBDF(seg, info->physfn.bus,
>                                       info->physfn.devfn));
> @@ -739,7 +734,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              pf_is_extfn = pdev->info.is_extfn;
>              pcidev_put(pdev);
>          }
> -        pcidevs_unlock();
>          if ( !pdev )
>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>                             NULL, node);
> @@ -756,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  
>      ret = -ENOMEM;
>  
> -    pcidevs_lock();
>      pseg = alloc_pseg(seg);
>      if ( !pseg )
>          goto out;
> @@ -858,7 +851,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      pci_enable_acs(pdev);
>  
>  out:
> -    pcidevs_unlock();
>      if ( !ret )
>      {
>          printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf);
> @@ -889,7 +881,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      if ( !pseg )
>          return -ENODEV;
>  
> -    pcidevs_lock();
>      spin_lock(&pseg->alldevs_lock);
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
> @@ -910,12 +901,10 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              break;
>          }
>  
> -    pcidevs_unlock();
>      spin_unlock(&pseg->alldevs_lock);
>      return ret;
>  }
>  
> -/* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)
>  {
> @@ -927,7 +916,6 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
>      if ( !pdev )
>          return -ENODEV;
> @@ -981,13 +969,10 @@ int pci_release_devices(struct domain *d)
>      u8 bus, devfn;
>      int ret;
>  
> -    pcidevs_lock();
>      ret = arch_pci_clean_pirqs(d);
>      if ( ret )
> -    {
> -        pcidevs_unlock();
>          return ret;
> -    }
> +
>      spin_lock(&d->pdevs_lock);
>      list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>      {
> @@ -996,7 +981,6 @@ int pci_release_devices(struct domain *d)
>          ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>      }
>      spin_unlock(&d->pdevs_lock);
> -    pcidevs_unlock();
>  
>      return ret;
>  }
> @@ -1094,7 +1078,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>      s_time_t now = NOW();
>      u16 cword;
>  
> -    pcidevs_lock();
>      pdev = pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
>      if ( pdev )
>      {
> @@ -1108,7 +1091,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>              pdev = NULL;
>          }
>      }
> -    pcidevs_unlock();
>  
>      if ( !pdev )
>          return;
> @@ -1164,13 +1146,7 @@ static int __init cf_check _scan_pci_devices(struct pci_seg *pseg, void *arg)
>  
>  int __init scan_pci_devices(void)
>  {
> -    int ret;
> -
> -    pcidevs_lock();
> -    ret = pci_segments_iterate(_scan_pci_devices, NULL);
> -    pcidevs_unlock();
> -
> -    return ret;
> +    return pci_segments_iterate(_scan_pci_devices, NULL);
>  }
>  
>  struct setup_hwdom {
> @@ -1239,19 +1215,11 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>  
>              pcidev_put(pdev);
>              if ( iommu_verbose )
> -            {
> -                pcidevs_unlock();
>                  process_pending_softirqs();
> -                pcidevs_lock();
> -            }
>          }
>  
>          if ( !iommu_verbose )
> -        {
> -            pcidevs_unlock();
>              process_pending_softirqs();
> -            pcidevs_lock();
> -        }
>      }
>  
>      return 0;
> @@ -1262,9 +1230,7 @@ void __hwdom_init setup_hwdom_pci_devices(
>  {
>      struct setup_hwdom ctxt = { .d = d, .handler = handler };
>  
> -    pcidevs_lock();
>      pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
> -    pcidevs_unlock();
>  }
>  
>  /* APEI not supported on ARM yet. */
> @@ -1396,9 +1362,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>  static void cf_check dump_pci_devices(unsigned char ch)
>  {
>      printk("==== PCI devices ====\n");
> -    pcidevs_lock();
>      pci_segments_iterate(_dump_pci_devices, NULL);
> -    pcidevs_unlock();
>  }
>  
>  static int __init cf_check setup_dump_pcidevs(void)
> @@ -1417,8 +1381,6 @@ static int iommu_add_device(struct pci_dev *pdev)
>      if ( !pdev->domain )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> -
>      hd = dom_iommu(pdev->domain);
>      if ( !is_iommu_enabled(pdev->domain) )
>          return 0;
> @@ -1446,8 +1408,6 @@ static int iommu_enable_device(struct pci_dev *pdev)
>      if ( !pdev->domain )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> -
>      hd = dom_iommu(pdev->domain);
>      if ( !is_iommu_enabled(pdev->domain) ||
>           !hd->platform_ops->enable_device )
> @@ -1494,7 +1454,6 @@ static int device_assigned(struct pci_dev *pdev)
>  {
>      int rc = 0;
>  
> -    ASSERT(pcidevs_locked());
>      /*
>       * If the device exists and it is not owned by either the hardware
>       * domain or dom_io then it must be assigned to a guest, or be
> @@ -1507,7 +1466,6 @@ static int device_assigned(struct pci_dev *pdev)
>      return rc;
>  }
>  
> -/* Caller should hold the pcidevs_lock */
>  static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
> @@ -1521,7 +1479,6 @@ static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
>          return -EXDEV;
>  
>      /* device_assigned() should already have cleared the device for assignment */
> -    ASSERT(pcidevs_locked());
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> @@ -1587,7 +1544,6 @@ static int iommu_get_device_group(
>      if ( group_id < 0 )
>          return group_id;
>  
> -    pcidevs_lock();
>      spin_lock(&d->pdevs_lock);
>      for_each_pdev( d, pdev )
>      {
> @@ -1603,7 +1559,6 @@ static int iommu_get_device_group(
>          sdev_id = iommu_call(ops, get_device_group_id, seg, b, df);
>          if ( sdev_id < 0 )
>          {
> -            pcidevs_unlock();
>              spin_unlock(&d->pdevs_lock);
>              return sdev_id;
>          }
> @@ -1614,7 +1569,6 @@ static int iommu_get_device_group(
>  
>              if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>              {
> -                pcidevs_unlock();
>                  spin_unlock(&d->pdevs_lock);
>                  return -EFAULT;
>              }
> @@ -1622,7 +1576,6 @@ static int iommu_get_device_group(
>          }
>      }
>  
> -    pcidevs_unlock();
>      spin_unlock(&d->pdevs_lock);
>  
>      return i;
> @@ -1630,17 +1583,12 @@ static int iommu_get_device_group(
>  
>  void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>  {
> -    pcidevs_lock();
> -
>      /* iommu->ats_list_lock is taken by the caller of this function */
>      disable_ats_device(pdev);
>  
>      ASSERT(pdev->domain);
>      if ( d != pdev->domain )
> -    {
> -        pcidevs_unlock();
>          return;
> -    }
>  
>      pdev->broken = true;
>  
> @@ -1649,8 +1597,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>                 d->domain_id, &pdev->sbdf);
>      if ( !is_hardware_domain(d) )
>          domain_crash(d);
> -
> -    pcidevs_unlock();
>  }
>  
>  int iommu_do_pci_domctl(
> @@ -1740,7 +1686,6 @@ int iommu_do_pci_domctl(
>              break;
>          }
>  
> -        pcidevs_lock();
>          ret = device_assigned(pdev);
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
> @@ -1755,7 +1700,7 @@ int iommu_do_pci_domctl(
>              ret = assign_device(d, pdev, flags);
>  
>          pcidev_put(pdev);
> -        pcidevs_unlock();
> +
>          if ( ret == -ERESTART )
>              ret = hypercall_create_continuation(__HYPERVISOR_domctl,
>                                                  "h", u_domctl);
> @@ -1787,9 +1732,7 @@ int iommu_do_pci_domctl(
>          bus = PCI_BUS(machine_sbdf);
>          devfn = PCI_DEVFN(machine_sbdf);
>  
> -        pcidevs_lock();
>          ret = deassign_device(d, seg, bus, devfn);
> -        pcidevs_unlock();
>          break;
>  
>      default:
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 42661f22f4..87868188b7 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1490,7 +1490,6 @@ int domain_context_mapping_one(
>      if ( QUARANTINE_SKIP(domain, pgd_maddr) )
>          return 0;
>  
> -    ASSERT(pcidevs_locked());
>      spin_lock(&iommu->lock);
>      maddr = bus_to_context_maddr(iommu, bus);
>      context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
> @@ -1711,8 +1710,6 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
>      if ( drhd && drhd->iommu->node != NUMA_NO_NODE )
>          dom_iommu(domain)->node = drhd->iommu->node;
>  
> -    ASSERT(pcidevs_locked());
> -
>      for_each_rmrr_device( rmrr, bdf, i )
>      {
>          if ( rmrr->segment != pdev->seg || bdf != pdev->sbdf.bdf )
> @@ -2072,8 +2069,6 @@ static void quarantine_teardown(struct pci_dev *pdev,
>  {
>      struct domain_iommu *hd = dom_iommu(dom_io);
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev->arch.vtd.pgd_maddr )
>          return;
>  
> @@ -2341,8 +2336,6 @@ static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
>      u16 bdf;
>      int ret, i;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev->domain )
>          return -EINVAL;
>  
> @@ -3176,7 +3169,6 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
>      bool rmrr_found = false;
>      int rc;
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(!hd->arch.vtd.pgd_maddr);
>      ASSERT(page_list_empty(&hd->arch.pgtables.list));
>  
> diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
> index 1298f3a7b6..1f7c496114 100644
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -117,9 +117,7 @@ void __init video_endboot(void)
>                  struct pci_dev *pdev;
>                  u8 b = bus, df = devfn, sb;
>  
> -                pcidevs_lock();
>                  pdev = pci_get_pdev(NULL, PCI_SBDF(0, bus, devfn));
> -                pcidevs_unlock();
>  
>                  if ( !pdev ||
>                       pci_conf_read16(PCI_SBDF(0, bus, devfn),
> -- 
> 2.36.1
> 

