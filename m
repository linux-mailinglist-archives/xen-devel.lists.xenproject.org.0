Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B0E67F363
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 01:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486029.753496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLZW7-00081t-TJ; Sat, 28 Jan 2023 00:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486029.753496; Sat, 28 Jan 2023 00:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLZW7-0007yU-QI; Sat, 28 Jan 2023 00:56:27 +0000
Received: by outflank-mailman (input) for mailman id 486029;
 Sat, 28 Jan 2023 00:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LM4o=5Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLZW6-0007yO-G0
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 00:56:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969eb3c2-9ea6-11ed-a5d9-ddcf98b90cbd;
 Sat, 28 Jan 2023 01:56:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AEDCB821C0;
 Sat, 28 Jan 2023 00:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861EEC433D2;
 Sat, 28 Jan 2023 00:56:21 +0000 (UTC)
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
X-Inumbo-ID: 969eb3c2-9ea6-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674867383;
	bh=ko/2BoiEHAjn/12n/nbJy4SQj1VKto8eBKFuvRsHVtg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GyF2KsSZ7GqOjPO1q1cNZk+qCrJIeUyV2NYvKC1r9UdNXE1E6BnhzEPZAXsEHVde7
	 qgQ9C2N/jsJDXwyXIqLpVD9CljvfRnc6rC+zlWLT6McPzOExM2EV78mpRGdqquvv+o
	 6U6G1M/BtD+bvqMnJ2agJsakQ7GRlEPLRJffE0ejkF5DKENKNs8ACJufAxCAwxUdyc
	 or0Eyid1TDaKNdTlnD8lwledm1A+4X2pZC22LJj7Vdwf/OyLIVGqcRRdTSNBd/CeAz
	 CdOrlHX4rMYrvrxWzQVijVa8jZz29hw+uWipAxPelpypZV7q2X/vLqMpOjpbjRZmID
	 wdIttP371QKiA==
Date: Fri, 27 Jan 2023 16:56:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [RFC PATCH 07/10] xen: pci: add per-device locking
In-Reply-To: <20220831141040.13231-8-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301271615330.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-8-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> Spinlock in struct pci_device will be used to protect access to device
> itself. Right now it is used mostly by MSI code.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There are 2 instances of:

    BUG_ON(list_empty(&dev->msi_list));

in xen/arch/x86/msi.c:__pci_disable_msi and
xen/arch/x86/msi.c:__pci_disable_msix which are not protected by
pcidev_lock. However list_empty needs to be protected. (pci_disable_msi
can also be called from xen/arch/x86/irq.c where it is not surrounded by
pcidev_lock.)

Given that they are BUG_ON, I wonder if we could remove them instead of
adding locks there. It would make things simpler.


> ---
>  xen/arch/x86/hvm/vmsi.c       |  6 +++++-
>  xen/arch/x86/msi.c            | 16 ++++++++++++++++
>  xen/drivers/passthrough/msi.c |  8 +++++++-
>  xen/drivers/passthrough/pci.c |  2 ++
>  xen/include/xen/pci.h         | 12 ++++++++++++
>  5 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 7fb1075673..c9e5f279c5 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -203,10 +203,14 @@ static struct msi_desc *msixtbl_addr_to_desc(
>  
>      nr_entry = (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
>  
> +    pcidev_lock(entry->pdev);
>      list_for_each_entry( desc, &entry->pdev->msi_list, list )
>          if ( desc->msi_attrib.type == PCI_CAP_ID_MSIX &&
> -             desc->msi_attrib.entry_nr == nr_entry )
> +             desc->msi_attrib.entry_nr == nr_entry ) {
> +	    pcidev_unlock(entry->pdev);

code style


>              return desc;
> +	}
> +    pcidev_unlock(entry->pdev);
>  
>      return NULL;
>  }
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index bccaccb98b..6b62c4f452 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -389,6 +389,7 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
>      default:
>          return 0;
>      }
> +

spurious change


>      entry->msi_attrib.host_masked = host;
>      entry->msi_attrib.guest_masked = guest;
>  
> @@ -585,12 +586,17 @@ static struct msi_desc *find_msi_entry(struct pci_dev *dev,
>  {
>      struct msi_desc *entry;
>  
> +    pcidev_lock(dev);
>      list_for_each_entry( entry, &dev->msi_list, list )
>      {
>          if ( entry->msi_attrib.type == cap_id &&
>               (irq == -1 || entry->irq == irq) )
> +	{
> +	    pcidev_unlock(dev);
>              return entry;
> +	}
>      }
> +    pcidev_unlock(dev);
>  
>      return NULL;
>  }
> @@ -661,7 +667,9 @@ static int msi_capability_init(struct pci_dev *dev,
>          maskbits |= ~(uint32_t)0 >> (32 - dev->msi_maxvec);
>          pci_conf_write32(dev->sbdf, mpos, maskbits);
>      }
> +    pcidev_lock(dev);
>      list_add_tail(&entry->list, &dev->msi_list);
> +    pcidev_unlock(dev);
>  
>      *desc = entry;
>      /* Restore the original MSI enabled bits  */
> @@ -946,7 +954,9 @@ static int msix_capability_init(struct pci_dev *dev,
>  
>  	pcidev_get(dev);
>  
> +	pcidev_lock(dev);
>          list_add_tail(&entry->list, &dev->msi_list);
> +	pcidev_unlock(dev);
>          *desc = entry;
>      }
>  
> @@ -1231,11 +1241,13 @@ static void msi_free_irqs(struct pci_dev* dev)
>  {
>      struct msi_desc *entry, *tmp;
>  
> +    pcidev_lock(dev);
>      list_for_each_entry_safe( entry, tmp, &dev->msi_list, list )
>      {
>          pci_disable_msi(entry);
>          msi_free_irq(entry);
>      }
> +    pcidev_unlock(dev);
>  }
>  
>  void pci_cleanup_msi(struct pci_dev *pdev)
> @@ -1354,6 +1366,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>      if ( ret )
>          return ret;
>  
> +    pcidev_lock(pdev);
>      list_for_each_entry_safe( entry, tmp, &pdev->msi_list, list )
>      {
>          unsigned int i = 0, nr = 1;
> @@ -1371,6 +1384,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>              dprintk(XENLOG_ERR, "Restore MSI for %pp entry %u not set?\n",
>                      &pdev->sbdf, i);
>              spin_unlock_irqrestore(&desc->lock, flags);
> +	    pcidev_unlock(pdev);
>              if ( type == PCI_CAP_ID_MSIX )
>                  pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>                                   control & ~PCI_MSIX_FLAGS_ENABLE);
> @@ -1393,6 +1407,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>              if ( unlikely(!memory_decoded(pdev)) )
>              {
>                  spin_unlock_irqrestore(&desc->lock, flags);
> +		pcidev_unlock(pdev);
>                  pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>                                   control & ~PCI_MSIX_FLAGS_ENABLE);
>                  return -ENXIO;
> @@ -1438,6 +1453,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>          pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>                           control | PCI_MSIX_FLAGS_ENABLE);
>  
> +    pcidev_unlock(pdev);
>      return 0;
>  }
>  
> diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
> index ce1a450f6f..98f4d2721a 100644
> --- a/xen/drivers/passthrough/msi.c
> +++ b/xen/drivers/passthrough/msi.c
> @@ -22,6 +22,7 @@ int pdev_msi_init(struct pci_dev *pdev)
>  {
>      unsigned int pos;
>  
> +    pcidev_lock(pdev);
>      INIT_LIST_HEAD(&pdev->msi_list);
>  
>      pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> @@ -41,7 +42,10 @@ int pdev_msi_init(struct pci_dev *pdev)
>          uint16_t ctrl;
>  
>          if ( !msix )
> -            return -ENOMEM;
> +        {
> +             pcidev_unlock(pdev);
> +             return -ENOMEM;
> +        }
>  
>          spin_lock_init(&msix->table_lock);
>  
> @@ -51,6 +55,8 @@ int pdev_msi_init(struct pci_dev *pdev)
>          pdev->msix = msix;
>      }
>  
> +    pcidev_unlock(pdev);
> +
>      return 0;
>  }
>  
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index c8da80b981..c83397211b 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1383,7 +1383,9 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>              printk("%pd", pdev->domain);
>          printk(" - node %-3d refcnt %d", (pdev->node != NUMA_NO_NODE) ? pdev->node : -1,
>                 atomic_read(&pdev->refcnt));
> +        pcidev_lock(pdev);
>          pdev_dump_msi(pdev);
> +        pcidev_unlock(pdev);
>          printk("\n");
>      }
>      spin_unlock(&pseg->alldevs_lock);
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index e71a180ef3..d0a7339d84 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -106,6 +106,8 @@ struct pci_dev {
>      uint8_t msi_maxvec;
>      uint8_t phantom_stride;
>  
> +    /* Device lock */
> +    spinlock_t lock;
>      nodeid_t node; /* NUMA node */
>  
>      /* Device to be quarantined, don't automatically re-assign to dom0 */
> @@ -235,6 +237,16 @@ int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
>  void msixtbl_pt_unregister(struct domain *, struct pirq *);
>  void msixtbl_pt_cleanup(struct domain *d);
>  
> +static inline void pcidev_lock(struct pci_dev *pdev)
> +{
> +    spin_lock(&pdev->lock);
> +}
> +
> +static inline void pcidev_unlock(struct pci_dev *pdev)
> +{
> +    spin_unlock(&pdev->lock);
> +}
> +
>  #ifdef CONFIG_HVM
>  int arch_pci_clean_pirqs(struct domain *d);
>  #else
> -- 
> 2.36.1
> 

