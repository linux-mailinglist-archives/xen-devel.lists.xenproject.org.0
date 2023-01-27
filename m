Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734567DAE0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 01:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485256.752344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLCpw-0007YF-Dk; Fri, 27 Jan 2023 00:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485256.752344; Fri, 27 Jan 2023 00:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLCpw-0007Vm-Aj; Fri, 27 Jan 2023 00:43:24 +0000
Received: by outflank-mailman (input) for mailman id 485256;
 Fri, 27 Jan 2023 00:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqQd=5Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLCpu-0007Vg-Tk
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 00:43:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96f7eaf8-9ddb-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 01:43:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB694619E2;
 Fri, 27 Jan 2023 00:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4543C433D2;
 Fri, 27 Jan 2023 00:43:14 +0000 (UTC)
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
X-Inumbo-ID: 96f7eaf8-9ddb-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674780196;
	bh=0UZTKXk99UQAyBs9j4BYQuTWCYKjpinEkTmlxbyNXGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l2qjVZR1kqdb4PDpAToT6Cf6CWdaVgodrlgzetM8lObUKdm3/jcuzIH5axPpUGUKh
	 Qxi4qsfIq9rA9ibKCOhbS12c4BtNI1LWX3ifXEOEAZqaibx6ykYJ2+gbaXR+8mouMJ
	 DiVKg3KLCiKa73hZ40EZZdSNyHHNtNtjPffAtBZxKwEbNNl8GG8EsiZido19i0HXMT
	 HpFHRjMX8bw3r0yfe4IaHD3KlB+6EJa5+qVT/dhCFNoAOAkG2C8eFgv25SOFqPJ3H1
	 fFtrNJAly8of6y5IBSYlcmOo8b5vfeBrHLYo/QdeoufDsCe2i7t6iHaMc3JpRWCN2M
	 QBrVYVUQa+15A==
Date: Thu, 26 Jan 2023 16:43:13 -0800 (PST)
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
Subject: Re: [RFC PATCH 05/10] xen: pci: introduce reference counting for
 pdev
In-Reply-To: <20220831141040.13231-6-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301261604370.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-6-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> Prior to this change, lifetime of pci_dev objects was protected by global
> pcidevs_lock(). We are going to get if of this lock, so we need some
> other mechanism to ensure that those objects will not disappear under
> feet of code that access them. Reference counting is a good choice as
> it provides easy to comprehend way to control object lifetime with
> better granularity than global super lock.
> 
> This patch adds two new helper functions: pcidev_get() and
> pcidev_put(). pcidev_get() will increase reference counter, while
> pcidev_put() will decrease it, destroying object when counter reaches
> zero.
> 
> pcidev_get() should be used only when you already have a valid pointer
> to the object or you are holding lock that protects one of the
> lists (domain, pseg or ats) that store pci_dev structs.
> 
> pcidev_get() is rarely used directly, because there already are
> functions that will provide valid pointer to pci_dev struct:
> pci_get_pdev() and pci_get_real_pdev(). They will lock appropriate
> list, find needed object and increase its reference counter before
> returning to the caller.
> 
> Naturally, pci_put() should be called after finishing working with a
> received object. This is the reason why this patch have so many
> pcidev_put()s and so little pcidev_get()s: existing calls to
> pci_get_*() functions now will increase reference counter
> automatically, we just need to decrease it back when we finished.
> 
> This patch removes "const" qualifier from some pdev pointers because
> pcidev_put() technically alters the contents of pci_dev structure.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

tabs everywhere in this patch


> ---
> 
> - Jan, can I add your Suggested-by tag?
> ---
>  xen/arch/x86/hvm/vmsi.c                  |   2 +-
>  xen/arch/x86/irq.c                       |   4 +
>  xen/arch/x86/msi.c                       |  41 ++++++-
>  xen/arch/x86/pci.c                       |   4 +-
>  xen/arch/x86/physdev.c                   |  17 ++-
>  xen/common/sysctl.c                      |   5 +-
>  xen/drivers/passthrough/amd/iommu_init.c |  12 ++-
>  xen/drivers/passthrough/amd/iommu_map.c  |   6 +-
>  xen/drivers/passthrough/pci.c            | 131 +++++++++++++++--------
>  xen/drivers/passthrough/vtd/quirks.c     |   2 +
>  xen/drivers/video/vga.c                  |  10 +-
>  xen/drivers/vpci/vpci.c                  |   6 +-
>  xen/include/xen/pci.h                    |  18 ++++
>  13 files changed, 201 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 75f92885dc..7fb1075673 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -912,7 +912,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  
>              spin_unlock(&msix->pdev->vpci->lock);
>              process_pending_softirqs();
> -            /* NB: we assume that pdev cannot go away for an alive domain. */
> +
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
>              if ( pdev->vpci->msix != msix )
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index cd0c8a30a8..d8672a03e1 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2174,6 +2174,7 @@ int map_domain_pirq(
>                  msi->entry_nr = ret;
>                  ret = -ENFILE;
>              }
> +	    pcidev_put(pdev);

I think it would be better to move pcidev_put just after done:


>              goto done;
>          }
>  
> @@ -2188,6 +2189,7 @@ int map_domain_pirq(
>              msi_desc->irq = -1;
>              msi_free_irq(msi_desc);
>              ret = -EBUSY;
> +	    pcidev_put(pdev);
>              goto done;
>          }
>  
> @@ -2272,10 +2274,12 @@ int map_domain_pirq(
>              }
>              msi_desc->irq = -1;
>              msi_free_irq(msi_desc);
> +	    pcidev_put(pdev);
>              goto done;
>          }
>  
>          set_domain_irq_pirq(d, irq, info);
> +	pcidev_put(pdev);
>          spin_unlock_irqrestore(&desc->lock, flags);
>      }
>      else
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1d..bccaccb98b 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -572,6 +572,10 @@ int msi_free_irq(struct msi_desc *entry)
>                          virt_to_fix((unsigned long)entry->mask_base));
>  
>      list_del(&entry->list);
> +
> +    /* Corresponds to pcidev_get() in msi[x]_capability_init()  */
> +    pcidev_put(entry->dev);
> +
>      xfree(entry);
>      return 0;
>  }
> @@ -644,6 +648,7 @@ static int msi_capability_init(struct pci_dev *dev,
>              entry[i].msi.mpos = mpos;
>          entry[i].msi.nvec = 0;
>          entry[i].dev = dev;
> +	pcidev_get(dev);
>      }
>      entry->msi.nvec = nvec;
>      entry->irq = irq;
> @@ -703,22 +708,36 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>               !num_vf || !offset || (num_vf > 1 && !stride) ||
>               bir >= PCI_SRIOV_NUM_BARS ||
>               !pdev->vf_rlen[bir] )
> +        {
> +            if ( pdev )
> +                pcidev_put(pdev);
>              return 0;
> +        }
>          base = pos + PCI_SRIOV_BAR;
>          vf -= PCI_BDF(bus, slot, func) + offset;
>          if ( vf < 0 )
> +        {
> +            pcidev_put(pdev);
>              return 0;
> +        }
>          if ( stride )
>          {
>              if ( vf % stride )
> +            {
> +                pcidev_put(pdev);
>                  return 0;
> +            }
>              vf /= stride;
>          }
>          if ( vf >= num_vf )
> +        {
> +            pcidev_put(pdev);
>              return 0;
> +        }
>          BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
>          disp = vf * pdev->vf_rlen[bir];
>          limit = PCI_SRIOV_NUM_BARS;
> +        pcidev_put(pdev);
>      }
>      else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
>                                   PCI_HEADER_TYPE) & 0x7f )
> @@ -925,6 +944,8 @@ static int msix_capability_init(struct pci_dev *dev,
>          entry->dev = dev;
>          entry->mask_base = base;
>  
> +	pcidev_get(dev);
> +
>          list_add_tail(&entry->list, &dev->msi_list);
>          *desc = entry;
>      }
> @@ -999,6 +1020,7 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>  {
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
> +    int ret;
>  
>      ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
> @@ -1010,6 +1032,7 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>      {
>          printk(XENLOG_ERR "irq %d already mapped to MSI on %pp\n",
>                 msi->irq, &pdev->sbdf);
> +	pcidev_put(pdev);
>          return -EEXIST;
>      }
>  
> @@ -1020,7 +1043,10 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>          __pci_disable_msix(old_desc);
>      }
>  
> -    return msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
> +    ret = msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
> +    pcidev_put(pdev);
> +
> +    return ret;
>  }
>  
>  static void __pci_disable_msi(struct msi_desc *entry)
> @@ -1054,6 +1080,7 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>  {
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
> +    int ret;
>  
>      ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
> @@ -1061,13 +1088,17 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>          return -ENODEV;

maybe missed pcidev_put above if pdev != 0 && pdev->msix == 0


>      if ( msi->entry_nr >= pdev->msix->nr_entries )
> +    {
> +	pcidev_put(pdev);
>          return -EINVAL;
> +    }
>  
>      old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSIX);
>      if ( old_desc )
>      {
>          printk(XENLOG_ERR "irq %d already mapped to MSI-X on %pp\n",
>                 msi->irq, &pdev->sbdf);
> +	pcidev_put(pdev);
>          return -EEXIST;
>      }
>  
> @@ -1078,7 +1109,11 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>          __pci_disable_msi(old_desc);
>      }
>  
> -    return msix_capability_init(pdev, msi, desc);
> +    ret = msix_capability_init(pdev, msi, desc);
> +
> +    pcidev_put(pdev);
> +
> +    return ret;
>  }
>  
>  static void _pci_cleanup_msix(struct arch_msix *msix)
> @@ -1161,6 +1196,8 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>          rc = msix_capability_init(pdev, NULL, NULL);
>      pcidevs_unlock();
>  
> +    pcidev_put(pdev);
> +
>      return rc;
>  }
>  
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 97b792e578..1d38f0df7c 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -91,8 +91,10 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>      pcidevs_lock();
>  
>      pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
> -    if ( pdev )
> +    if ( pdev ) {
>          rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
> +	pcidev_put(pdev);
> +    }
>  
>      pcidevs_unlock();
>  
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 2f1d955a96..96214a3d40 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -533,7 +533,14 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          pcidevs_lock();
>          pdev = pci_get_pdev(NULL,
>                              PCI_SBDF(0, restore_msi.bus, restore_msi.devfn));
> -        ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
> +        if ( pdev )
> +        {
> +            ret = pci_restore_msi_state(pdev);
> +            pcidev_put(pdev);
> +        }
> +        else
> +            ret = -ENODEV;
> +
>          pcidevs_unlock();
>          break;
>      }
> @@ -548,7 +555,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          pcidevs_lock();
>          pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
> -        ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
> +        if ( pdev )
> +        {
> +            ret =  pci_restore_msi_state(pdev);
> +            pcidev_put(pdev);
> +        }
> +        else
> +            ret = -ENODEV;
>          pcidevs_unlock();
>          break;
>      }
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 02505ab044..0feef94cd2 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -438,7 +438,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          {
>              physdev_pci_device_t dev;
>              uint32_t node;
> -            const struct pci_dev *pdev;
> +            struct pci_dev *pdev;
>  
>              if ( copy_from_guest_offset(&dev, ti->devs, i, 1) )
>              {
> @@ -456,6 +456,9 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  node = pdev->node;
>              pcidevs_unlock();
>  
> +            if ( pdev )
> +                pcidev_put(pdev);
> +
>              if ( copy_to_guest_offset(ti->nodes, i, &node, 1) )
>              {
>                  ret = -EFAULT;
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 1f14aaf49e..7c1713a602 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -644,6 +644,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
>  
>      if ( pdev )
>          guest_iommu_add_ppr_log(pdev->domain, entry);
> +    pcidev_put(pdev);
>  }
>  
>  static void iommu_check_ppr_log(struct amd_iommu *iommu)
> @@ -747,6 +748,11 @@ static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>      }
>  
>      pcidevs_lock();
> +    /*
> +     * XXX: it is unclear if this device can be removed. Right now
> +     * there is no code that clears msi.dev, so no one will decrease
> +     * refcount on it.
> +     */
>      iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
>      pcidevs_unlock();
>      if ( !iommu->msi.dev )
> @@ -1272,7 +1278,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>      {
>          if ( ivrs_mappings[bdf].valid )
>          {
> -            const struct pci_dev *pdev = NULL;
> +            struct pci_dev *pdev = NULL;
>  
>              /* add device table entry */
>              iommu_dte_add_device_entry(&dt[bdf], &ivrs_mappings[bdf]);
> @@ -1297,7 +1303,10 @@ static int __init cf_check amd_iommu_setup_device_table(
>                          pdev->msix ? pdev->msix->nr_entries
>                                     : pdev->msi_maxvec);
>                  if ( !ivrs_mappings[bdf].intremap_table )
> +		{
> +		    pcidev_put(pdev);
>                      return -ENOMEM;
> +		}
>  
>                  if ( pdev->phantom_stride )
>                  {
> @@ -1315,6 +1324,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>                              ivrs_mappings[bdf].intremap_inuse;
>                      }
>                  }
> +		pcidev_put(pdev);
>              }
>  
>              amd_iommu_set_intremap_table(
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index 993bac6f88..9d621e3d36 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -724,14 +724,18 @@ int cf_check amd_iommu_get_reserved_device_memory(
>          if ( !iommu )
>          {
>              /* May need to trigger the workaround in find_iommu_for_device(). */
> -            const struct pci_dev *pdev;
> +            struct pci_dev *pdev;
>  
>              pcidevs_lock();
>              pdev = pci_get_pdev(NULL, sbdf);
>              pcidevs_unlock();
>  
>              if ( pdev )
> +            {
>                  iommu = find_iommu_for_device(seg, bdf);
> +                /* XXX: Should we hold pdev reference till end of the loop? */
> +                pcidev_put(pdev);
> +            }
>              if ( !iommu )
>                  continue;
>          }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index b5db5498a1..a6c6368769 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -403,6 +403,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> +    refcnt_init(&pdev->refcnt);
>  
>      arch_pci_init_pdev(pdev);
>  
> @@ -499,33 +500,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      return pdev;
>  }
>  
> -static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
> -{
> -    /* update bus2bridge */
> -    switch ( pdev->type )
> -    {
> -        unsigned int sec_bus, sub_bus;
> -
> -        case DEV_TYPE_PCIe2PCI_BRIDGE:
> -        case DEV_TYPE_LEGACY_PCI_BRIDGE:
> -            sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> -            sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> -
> -            spin_lock(&pseg->bus2bridge_lock);
> -            for ( ; sec_bus <= sub_bus; sec_bus++ )
> -                pseg->bus2bridge[sec_bus] = pseg->bus2bridge[pdev->bus];
> -            spin_unlock(&pseg->bus2bridge_lock);
> -            break;
> -
> -        default:
> -            break;
> -    }
> -
> -    list_del(&pdev->alldevs_list);
> -    pdev_msi_deinit(pdev);
> -    xfree(pdev);
> -}
> -
>  static void __init _pci_hide_device(struct pci_dev *pdev)
>  {
>      if ( pdev->domain )
> @@ -596,10 +570,15 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
>      {
>          if ( !(sbdf.devfn & stride) )
>              continue;

We also need a pcidev_put before continue


> +
>          sbdf.devfn &= ~stride;
> +        pcidev_put(pdev);
>          pdev = pci_get_pdev(NULL, sbdf);
>          if ( pdev && stride != pdev->phantom_stride )
> +        {
> +            pcidev_put(pdev);
>              pdev = NULL;
> +        }
>      }
>  
>      return pdev;
> @@ -629,6 +608,7 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
>              if ( pdev->sbdf.bdf == sbdf.bdf &&
>                   (!d || pdev->domain == d) )
>              {
> +                pcidev_get(pdev);
>                  spin_unlock(&pseg->alldevs_lock);
>                  return pdev;
>              }
> @@ -640,6 +620,7 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf )
>              {
> +                pcidev_get(pdev);
>                  spin_unlock(&d->pdevs_lock);
>                  return pdev;
>              }
> @@ -754,7 +735,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                              PCI_SBDF(seg, info->physfn.bus,
>                                       info->physfn.devfn));
>          if ( pdev )
> +        {
>              pf_is_extfn = pdev->info.is_extfn;
> +            pcidev_put(pdev);
> +        }
>          pcidevs_unlock();
>          if ( !pdev )
>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> @@ -920,8 +904,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>                  spin_unlock(&pdev->domain->pdevs_lock);
>              }
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
> -            free_pdev(pseg, pdev);
>              list_del(&pdev->alldevs_list);
> +            pdev_msi_deinit(pdev);
> +            pcidev_put(pdev);
>              break;
>          }
>  
> @@ -952,7 +937,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      {
>          ret = iommu_quarantine_dev_init(pci_to_dev(pdev));
>          if ( ret )
> -           return ret;
> +            goto out;
>  
>          target = dom_io;
>      }
> @@ -982,6 +967,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      pdev->fault.count = 0;
>  
>   out:
> +    pcidev_put(pdev);
>      if ( ret )
>          printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
>                 d, &PCI_SBDF(seg, bus, devfn), ret);
> @@ -1117,7 +1103,10 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>              pdev->fault.count >>= 1;
>          pdev->fault.time = now;
>          if ( ++pdev->fault.count < PT_FAULT_THRESHOLD )
> +        {
> +            pcidev_put(pdev);
>              pdev = NULL;
> +        }
>      }
>      pcidevs_unlock();
>  
> @@ -1128,6 +1117,8 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>       * control it for us. */
>      cword = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cword & ~PCI_COMMAND_MASTER);
> +
> +    pcidev_put(pdev);
>  }
>  
>  /*
> @@ -1246,6 +1237,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>                  printk(XENLOG_WARNING "Dom%d owning %pp?\n",
>                         pdev->domain->domain_id, &pdev->sbdf);
>  
> +            pcidev_put(pdev);
>              if ( iommu_verbose )
>              {
>                  pcidevs_unlock();
> @@ -1495,33 +1487,28 @@ static int iommu_remove_device(struct pci_dev *pdev)
>      return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
>  }
>  
> -static int device_assigned(u16 seg, u8 bus, u8 devfn)
> +static int device_assigned(struct pci_dev *pdev)
>  {
> -    struct pci_dev *pdev;
>      int rc = 0;
>  
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> -
> -    if ( !pdev )
> -        rc = -ENODEV;
>      /*
>       * If the device exists and it is not owned by either the hardware
>       * domain or dom_io then it must be assigned to a guest, or be
>       * hidden (owned by dom_xen).
>       */
> -    else if ( pdev->domain != hardware_domain &&
> -              pdev->domain != dom_io )
> +    if ( pdev->domain != hardware_domain &&
> +         pdev->domain != dom_io )
>          rc = -EBUSY;
>  
>      return rc;
>  }
>  
>  /* Caller should hold the pcidevs_lock */
> -static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> +static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
> -    struct pci_dev *pdev;
> +    uint8_t devfn;
>      int rc = 0;
>  
>      if ( !is_iommu_enabled(d) )
> @@ -1532,10 +1519,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>  
>      /* device_assigned() should already have cleared the device for assignment */
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> +    devfn = pdev->devfn;
> +
>      /* Do not allow broken devices to be assigned to guests. */
>      rc = -EBADF;
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> @@ -1570,7 +1558,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> +               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>      /* The device is assigned to dom_io so mark it as quarantined */
>      else if ( d == dom_io )
>          pdev->quarantine = true;
> @@ -1710,6 +1698,9 @@ int iommu_do_pci_domctl(
>          ASSERT(d);
>          /* fall through */
>      case XEN_DOMCTL_test_assign_device:
> +    {
> +        struct pci_dev *pdev;
> +
>          /* Don't support self-assignment of devices. */
>          if ( d == current->domain )
>          {
> @@ -1737,26 +1728,36 @@ int iommu_do_pci_domctl(
>          seg = machine_sbdf >> 16;
>          bus = PCI_BUS(machine_sbdf);
>          devfn = PCI_DEVFN(machine_sbdf);
> +        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> +        if ( !pdev )
> +        {
> +            printk(XENLOG_G_INFO "%pp non-existent\n",
> +                   &PCI_SBDF(seg, bus, devfn));
> +            ret = -EINVAL;
> +            break;
> +        }
>  
>          pcidevs_lock();
> -        ret = device_assigned(seg, bus, devfn);
> +        ret = device_assigned(pdev);
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
>              if ( ret )
>              {
> -                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
> +                printk(XENLOG_G_INFO "%pp already assigned\n",
>                         &PCI_SBDF(seg, bus, devfn));
>                  ret = -EINVAL;
>              }
>          }
>          else if ( !ret )
> -            ret = assign_device(d, seg, bus, devfn, flags);
> +            ret = assign_device(d, pdev, flags);
> +
> +        pcidev_put(pdev);
>          pcidevs_unlock();
>          if ( ret == -ERESTART )
>              ret = hypercall_create_continuation(__HYPERVISOR_domctl,
>                                                  "h", u_domctl);
>          break;
> -
> +    }
>      case XEN_DOMCTL_deassign_device:
>          /* Don't support self-deassignment of devices. */
>          if ( d == current->domain )
> @@ -1796,6 +1797,46 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +static void release_pdev(refcnt_t *refcnt)
> +{
> +    struct pci_dev *pdev = container_of(refcnt, struct pci_dev, refcnt);
> +    struct pci_seg *pseg = get_pseg(pdev->seg);
> +
> +    printk(XENLOG_DEBUG "PCI release device %pp\n", &pdev->sbdf);
> +
> +    /* update bus2bridge */
> +    switch ( pdev->type )
> +    {
> +        unsigned int sec_bus, sub_bus;
> +
> +        case DEV_TYPE_PCIe2PCI_BRIDGE:
> +        case DEV_TYPE_LEGACY_PCI_BRIDGE:
> +            sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> +            sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> +
> +            spin_lock(&pseg->bus2bridge_lock);
> +            for ( ; sec_bus <= sub_bus; sec_bus++ )
> +                pseg->bus2bridge[sec_bus] = pseg->bus2bridge[pdev->bus];
> +            spin_unlock(&pseg->bus2bridge_lock);
> +            break;
> +
> +        default:
> +            break;
> +    }
> +
> +    xfree(pdev);
> +}
> +
> +void pcidev_get(struct pci_dev *pdev)
> +{
> +    refcnt_get(&pdev->refcnt);
> +}
> +
> +void pcidev_put(struct pci_dev *pdev)
> +{
> +    refcnt_put(&pdev->refcnt, release_pdev);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
> index fcc8f73e8b..d240da0416 100644
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -429,6 +429,8 @@ static int __must_check map_me_phantom_function(struct domain *domain,
>          rc = domain_context_unmap_one(domain, drhd->iommu, 0,
>                                        PCI_DEVFN(dev, 7));
>  
> +    pcidev_put(pdev);
> +
>      return rc;
>  }
>  
> diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
> index 29a88e8241..1298f3a7b6 100644
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -114,7 +114,7 @@ void __init video_endboot(void)
>          for ( bus = 0; bus < 256; ++bus )
>              for ( devfn = 0; devfn < 256; ++devfn )
>              {
> -                const struct pci_dev *pdev;
> +                struct pci_dev *pdev;
>                  u8 b = bus, df = devfn, sb;
>  
>                  pcidevs_lock();
> @@ -126,7 +126,11 @@ void __init video_endboot(void)
>                                       PCI_CLASS_DEVICE) != 0x0300 ||
>                       !(pci_conf_read16(PCI_SBDF(0, bus, devfn), PCI_COMMAND) &
>                         (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) )
> +		{
> +		    if (pdev)
> +			pcidev_put(pdev);
>                      continue;
> +		}
>  
>                  while ( b )
>                  {
> @@ -144,7 +148,10 @@ void __init video_endboot(void)
>                              if ( pci_conf_read16(PCI_SBDF(0, b, df),
>                                                   PCI_BRIDGE_CONTROL) &
>                                   PCI_BRIDGE_CTL_VGA )
> +			    {
> +				pcidev_put(pdev);
>                                  continue;
> +			    }

This is wrong: it is inside the inner while loop and unnecessary given
the pcidev_put below


>                              break;
>                          }
>                          break;
> @@ -157,6 +164,7 @@ void __init video_endboot(void)
>                             bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
>                      pci_hide_device(0, bus, devfn);
>                  }
> +		pcidev_put(pdev);
>              }
>      }
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 7d1f9fd438..59dc55f498 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -313,7 +313,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
>      struct domain *d = current->domain;
> -    const struct pci_dev *pdev;
> +    struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
> @@ -373,6 +373,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    pcidev_put(pdev);

I think there is a missing pcidev_put above in the vpci_read function:

if ( !pdev || !pdev->vpci )
    return ...

in case pdev != 0 && pdev->vpci == 0


>      if ( data_offset < size )
>      {
> @@ -416,7 +417,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
>      struct domain *d = current->domain;
> -    const struct pci_dev *pdev;
> +    struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
> @@ -478,6 +479,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    pcidev_put(pdev);

same here, missing pcidev_put above


>      if ( data_offset < size )
>          /* Tailing gap, write the remaining. */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 19047b4b20..e71a180ef3 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -13,6 +13,7 @@
>  #include <xen/irq.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pfn.h>
> +#include <xen/refcnt.h>
>  #include <asm/device.h>
>  #include <asm/numa.h>
>  
> @@ -116,6 +117,9 @@ struct pci_dev {
>      /* Device misbehaving, prevent assigning it to guests. */
>      bool broken;
>  
> +    /* Reference counter */
> +    refcnt_t refcnt;
> +
>      enum pdev_type {
>          DEV_TYPE_PCI_UNKNOWN,
>          DEV_TYPE_PCIe_ENDPOINT,
> @@ -160,6 +164,14 @@ void pcidevs_lock(void);
>  void pcidevs_unlock(void);
>  bool_t __must_check pcidevs_locked(void);
>  
> +/*
> + * Acquire and release reference to the given device. Holding
> + * reference ensures that device will not disappear under feet, but
> + * does not guarantee that code has exclusive access to the device.
> + */
> +void pcidev_get(struct pci_dev *pdev);
> +void pcidev_put(struct pci_dev *pdev);
> +
>  bool_t pci_known_segment(u16 seg);
>  bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
>  int scan_pci_devices(void);
> @@ -177,8 +189,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  int pci_remove_device(u16 seg, u8 bus, u8 devfn);
>  int pci_ro_device(int seg, int bus, int devfn);
>  int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
> +
> +/*
> + * Next two functions will find a requested device and acquire
> + * reference to it. Use pcidev_put() to release the reference.
> + */
>  struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf);
>  struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
> +
>  void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
>  
>  uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
> -- 
> 2.36.1
> 

