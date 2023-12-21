Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C981B93B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 15:05:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658943.1028357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGJgG-0000GE-8Y; Thu, 21 Dec 2023 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658943.1028357; Thu, 21 Dec 2023 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGJgG-0000ED-59; Thu, 21 Dec 2023 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 658943;
 Thu, 21 Dec 2023 14:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGJgE-0000E7-Oe
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 14:05:43 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 052168be-a00a-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 15:05:39 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso649685f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 06:05:39 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d51ce000000b00336765e9babsm2102088wrv.83.2023.12.21.06.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 06:05:37 -0800 (PST)
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
X-Inumbo-ID: 052168be-a00a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703167539; x=1703772339; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ukVgJ6naVUWuV88eywBslckUmXp3pPw9z92pqo+pLxs=;
        b=QhNQepyToPwsRYlCt927VDY4fqeVlImK2I4LdjA5m1ROUQdGncLropOB9KdtNFPm2P
         sAaDJRQL+8wzzxAQmc0nKqYuHCUmtyQbceT1AeY/inmjm00iUOz1ZHRbdzEjplgDPgy6
         kqrfDNVUwK4JjN8aBPQxBtFtQit6AJi/3mZiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167539; x=1703772339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukVgJ6naVUWuV88eywBslckUmXp3pPw9z92pqo+pLxs=;
        b=UzU0d/R8c3sz0N9l9JZzBxjgP9ucG5JW1ciQCVsOM+83SOADthLg3HETcLRqGT3Y1+
         XpqiuMtJhKXdNAZFEXHcNyvjGMi38yezBuZ71laEUb+YorZtJdj1HftT4e5XICZkj5vX
         iwBn06JZUBoHVSuoWnb1Vo4W/NTXuXqSc35g97nVhK891b7yXqHUJDJFr4PSnLf+Yc40
         3uT+2bDPw1OBpaQs7xreeoTZHNQLggx2t1uXDTn/o0zHtYGrwoWmaGWGBHgnILvyFsB+
         np6u8jZso6I4hPwUcv7wcTYFszQRc9L2ofMKoUwoHHy3m644+Tb9mz66MXP3Q7x7Vo2V
         6nnA==
X-Gm-Message-State: AOJu0YykKyqFEBQo6B/SSOqYN0p7nF9Eo0PCRDtQ+Uhq/7EJ0N8SL6dZ
	YcHmR07o9rq9zRiE0yX0rugqrw==
X-Google-Smtp-Source: AGHT+IHWh6wNE6LdUaRX2ihDa227kVbkr1aGfimkx9mheHb8ahqM8dMqopIUopGHDa6m7z58/rdAkA==
X-Received: by 2002:a5d:4578:0:b0:336:66f5:4096 with SMTP id a24-20020a5d4578000000b0033666f54096mr576310wrc.112.1703167538551;
        Thu, 21 Dec 2023 06:05:38 -0800 (PST)
Date: Thu, 21 Dec 2023 15:05:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v11 03/17] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZYRGMFKhwurDzHrT@macbook>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-4-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231202012556.2012281-4-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:27:03AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use a previously introduced per-domain read/write lock to check
> whether vpci is present, so we are sure there are no accesses to the
> contents of the vpci struct if not. This lock can be used (and in a
> few cases is used right away) so that vpci removal can be performed
> while holding the lock in write mode. Previously such removal could
> race with vpci_read for example.
> 
> When taking both d->pci_lock and pdev->vpci->lock, they should be
> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> possible deadlock situations.
> 
> 1. Per-domain's pci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if
> done under the read lock, requires vpci->lock to be acquired on both
> devices being compared, which may produce a deadlock. It is not
> possible to upgrade read lock to write lock in such a case. So, in
> order to prevent the deadlock, use d->pci_lock instead. To prevent
> deadlock while locking both hwdom->pci_lock and dom_xen->pci_lock,
> always lock hwdom first.

FWIW (I think it was also mentioned in the previous version) for
devices assigned to dom_xen taking the hwdom lock should be enough.
There are no other accesses to such devices that don't originate from
hwdom, and it's not possible to degassing devices from dom_xen.

> 
> All other code, which doesn't lead to pdev->vpci destruction and does
> not access multiple pdevs at the same time, can still use a
> combination of the read lock and pdev->vpci->lock.
> 
> 3. Drop const qualifier where the new rwlock is used and this is
> appropriate.
> 
> 4. Do not call process_pending_softirqs with any locks held. For that
> unlock prior the call and re-acquire the locks after. After
> re-acquiring the lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.
> 
> 6. We are removing multiple ASSERT(pcidevs_locked()) instances because
> they are too strict now: they should be corrected to
> ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock)), but problem is
> that mentioned instances does not have access to the domain
> pointer and it is not feasible to pass a domain pointer to a function
> just for debugging purposes.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in v11:
>  - Fixed commit message regarding possible spinlocks
>  - Removed parameter from allocate_and_map_msi_pirq(), which was added
>  in the prev version. Now we are taking pcidevs_lock in
>  physdev_map_pirq()
>  - Returned ASSERT to pci_enable_msi
>  - Fixed case when we took read lock instead of write one
>  - Fixed label indentation
> 
> Changes in v10:
>  - Moved printk pas locked area
>  - Returned back ASSERTs
>  - Added new parameter to allocate_and_map_msi_pirq() so it knows if
>  it should take the global pci lock
>  - Added comment about possible improvement in vpci_write
>  - Changed ASSERT(rw_is_locked()) to rw_is_write_locked() in
>    appropriate places
>  - Renamed release_domain_locks() to release_domain_write_locks()
>  - moved domain_done label in vpci_dump_msi() to correct place
> Changes in v9:
>  - extended locked region to protect vpci_remove_device and
>    vpci_add_handlers() calls
>  - vpci_write() takes lock in the write mode to protect
>    potential call to modify_bars()
>  - renamed lock releasing function
>  - removed ASSERT()s from msi code
>  - added trylock in vpci_dump_msi
> 
> Changes in v8:
>  - changed d->vpci_lock to d->pci_lock
>  - introducing d->pci_lock in a separate patch
>  - extended locked region in vpci_process_pending
>  - removed pcidevs_lockis vpci_dump_msi()
>  - removed some changes as they are not needed with
>    the new locking scheme
>  - added handling for hwdom && dom_xen case
> ---
>  xen/arch/x86/hvm/vmsi.c       | 22 +++++++--------
>  xen/arch/x86/hvm/vmx/vmx.c    |  2 --
>  xen/arch/x86/irq.c            |  8 +++---
>  xen/arch/x86/msi.c            | 10 ++-----
>  xen/arch/x86/physdev.c        |  2 ++
>  xen/drivers/passthrough/pci.c |  9 +++---
>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>  xen/drivers/vpci/msi.c        | 28 +++++++++++++++++--
>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c       | 50 +++++++++++++++++++++++++++++++--
>  10 files changed, 160 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 128f236362..03caf91bee 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>      struct msixtbl_entry *entry, *new_entry;
>      int r = -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>      struct pci_dev *pdev;
>      struct msixtbl_entry *entry;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>  {
>      unsigned int i;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
>      if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
>      {
> @@ -725,8 +725,8 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>      int rc;
>  
>      ASSERT(msi->arch.pirq != INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    pcidevs_lock();
>      for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq unbind = {
> @@ -745,7 +745,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
>  
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
>                                         msi->vectors, msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  }
>  
>  static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
> @@ -778,15 +777,14 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
>      int rc;
>  
>      ASSERT(msi->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>      rc = vpci_msi_enable(pdev, vectors, 0);
>      if ( rc < 0 )
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
> @@ -797,8 +795,8 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      unsigned int i;
>  
>      ASSERT(pirq != INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    pcidevs_lock();
>      for ( i = 0; i < nr && bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq bind = {
> @@ -814,7 +812,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      write_lock(&pdev->domain->event_lock);
>      unmap_domain_pirq(pdev->domain, pirq);
>      write_unlock(&pdev->domain->event_lock);
> -    pcidevs_unlock();
>  }
>  
>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
> @@ -854,6 +851,7 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>      int rc;
>  
>      ASSERT(entry->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>      rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
>                           table_base);
>      if ( rc < 0 )
> @@ -861,7 +859,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>  
>      entry->arch.pirq = rc;
>  
> -    pcidevs_lock();
>      rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
>                           entry->masked);
>      if ( rc )
> @@ -869,7 +866,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>          vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
>          entry->arch.pirq = INVALID_PIRQ;
>      }
> -    pcidevs_unlock();
>  
>      return rc;
>  }
> @@ -895,6 +891,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> @@ -913,7 +911,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            read_unlock(&pdev->domain->pci_lock);
>              process_pending_softirqs();
> +            read_lock(&pdev->domain->pci_lock);
>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 5663bc0178..dd836e49f3 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -413,8 +413,6 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT(pcidevs_locked());

Can't you do?

ASSERT(pcidevs_locked() || rw_is_locked(&msi_desc->dev->domain->pci_lock));

The iommu_update_ire_from_msi() call below does rely on msi_desc->dev
being set, so we can do the same here.

> -
>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>  
>   unlock_out:
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 50e49e1a4b..4d89d9af99 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2166,7 +2166,7 @@ int map_domain_pirq(
>          struct pci_dev *pdev;
>          unsigned int nr = 0;
>  
> -        ASSERT(pcidevs_locked());
> +        ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>  
>          ret = -ENODEV;
>          if ( !cpu_has_apic )
> @@ -2323,7 +2323,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  {
>      int irq, pirq, ret;
>  
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> +
>      switch ( type )
>      {
>      case MAP_PIRQ_TYPE_MSI:
> @@ -2917,7 +2919,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>      msi->irq = irq;
>  
> -    pcidevs_lock();

Since you remove the locking here, it might be good to replace with an
assert.

>      /* Verify or get pirq. */
>      write_lock(&d->event_lock);
>      pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
> @@ -2933,7 +2934,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>   done:
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
>      if ( ret )
>      {
>          switch ( type )
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 335c0868a2..6a548611a5 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -602,7 +602,7 @@ static int msi_capability_init(struct pci_dev *dev,
>      unsigned int i, mpos;
>      uint16_t control;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>      pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
>      if ( !pos )
>          return -ENODEV;
> @@ -771,7 +771,7 @@ static int msix_capability_init(struct pci_dev *dev,
>      if ( !pos )
>          return -ENODEV;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>  
>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>      /*
> @@ -988,8 +988,6 @@ static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
>  {
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev )
>          return -ENODEV;
>  
> @@ -1043,8 +1041,6 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>  {
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;

For both __pci_enable_msi{,x}(), can you move the check after making
sure that pdev != NULL, and then expand the condition to cover
pdev->domain->pci_lock taken?

>  
> @@ -1154,7 +1150,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>  int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
>                     struct msi_desc **desc)
>  {
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>  
>      if ( !use_msi )
>          return -EPERM;
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 47c4da0af7..369c9e788c 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>  
>      case MAP_PIRQ_TYPE_MSI:
>      case MAP_PIRQ_TYPE_MULTI_MSI:
> +        pcidevs_lock();
>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> +        pcidevs_unlock();
>          break;
>  
>      default:
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index b8ad4fa07c..182da45acb 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -750,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          pdev->domain = hardware_domain;
>          write_lock(&hardware_domain->pci_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> -        write_unlock(&hardware_domain->pci_lock);
>  
>          /*
>           * For devices not discovered by Xen during boot, add vPCI handlers
> @@ -759,18 +758,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          ret = vpci_add_handlers(pdev);
>          if ( ret )
>          {
> -            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> -            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>              goto out;
>          }
> +        write_unlock(&hardware_domain->pci_lock);
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {
> -            vpci_remove_device(pdev);
>              write_lock(&hardware_domain->pci_lock);
> +            vpci_remove_device(pdev);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
> @@ -1146,7 +1145,9 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>      } while ( devfn != pdev->devfn &&
>                PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>  
> +    write_lock(&ctxt->d->pci_lock);
>      err = vpci_add_handlers(pdev);
> +    write_unlock(&ctxt->d->pci_lock);
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
>                 ctxt->d->domain_id, err);
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 767c1ba718..c86d33d0cd 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -172,6 +172,7 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> +        write_lock(&v->domain->pci_lock);
>          spin_lock(&v->vpci.pdev->vpci->lock);
>          /* Disable memory decoding unconditionally on failure. */
>          modify_decoding(v->vpci.pdev,
> @@ -190,6 +191,7 @@ bool vpci_process_pending(struct vcpu *v)
>               * failure.
>               */
>              vpci_remove_device(v->vpci.pdev);
> +        write_unlock(&v->domain->pci_lock);
>      }
>  
>      return false;
> @@ -201,8 +203,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      struct map_data data = { .d = d, .map = true };
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&d->pci_lock));
> +
>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    {
> +        /*
> +         * It's safe to drop and reacquire the lock in this context
> +         * without risking pdev disappearing because devices cannot be
> +         * removed until the initial domain has been started.
> +         */
> +        write_unlock(&d->pci_lock);
>          process_pending_softirqs();
> +        write_lock(&d->pci_lock);
> +    }
> +
>      rangeset_destroy(mem);
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
> @@ -243,6 +257,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      unsigned int i;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !mem )
>          return -ENOMEM;
>  
> @@ -522,6 +538,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index a253ccbd7d..6ff71e5f9a 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -263,7 +263,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -275,6 +275,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !read_trylock(&d->pci_lock) )
> +            continue;
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -316,14 +319,33 @@ void vpci_dump_msi(void)
>                       * holding the lock.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
>              spin_unlock(&pdev->vpci->lock);
> +        pdev_done:
> +            /*
> +             * Unlock lock to process pending softirqs. This is
> +             * potentially unsafe, as d->pdev_list can be changed in
> +             * meantime.
> +             */
> +            read_unlock(&d->pci_lock);
>              process_pending_softirqs();
> +            if ( !read_trylock(&d->pci_lock) )
> +            {
> +                printk("unable to access other devices for the domain\n");
> +                goto domain_done;
> +            }
>          }
> +        read_unlock(&d->pci_lock);
> +    domain_done:
> +        /*
> +         * We need this label at the end of the loop, but some
> +         * compilers might not be happy about label at the end of the
> +         * compound statement so we adding an empty statement here.
> +         */
> +        ;
>      }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index d1126a417d..b6abab47ef 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -147,6 +147,8 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
>      list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>      {
>          const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
> @@ -163,7 +165,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>  static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    int rc;
> +
> +    read_lock(&v->domain->pci_lock);
> +    rc = !!msix_find(v->domain, addr);
> +    read_unlock(&v->domain->pci_lock);
> +
> +    return rc;
>  }
>  
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
> @@ -358,21 +366,35 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_read(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      *data = ~0UL;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_read(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_read(d, msix, addr, len, data);
> +
> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -404,6 +426,7 @@ static int cf_check msix_read(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -491,19 +514,33 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>  static int cf_check msix_write(
>      struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
> +    struct domain *d = v->domain;
> +    struct vpci_msix *msix;
>      struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
> +    read_lock(&d->pci_lock);
> +
> +    msix = msix_find(d, addr);
>      if ( !msix )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_RETRY;
> +    }
>  
>      if ( adjacent_handle(msix, addr) )
> -        return adjacent_write(d, msix, addr, len, data);
> +    {
> +        int rc = adjacent_write(d, msix, addr, len, data);
> +
> +        read_unlock(&d->pci_lock);
> +        return rc;
> +    }
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return X86EMUL_OKAY;
> +    }
>  
>      spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
> @@ -579,6 +616,7 @@ static int cf_check msix_write(
>          break;
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
> +    read_unlock(&d->pci_lock);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3bec9a4153..0b694beadf 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
>          return;
>  
> @@ -73,6 +75,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      if ( !has_vpci(pdev->domain) )
>          return 0;
>  
> @@ -326,11 +330,12 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
> +    rwlock_t *lock;
>  
>      if ( !size )
>      {
> @@ -342,11 +347,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>       * Find the PCI dev matching the address, which for hwdom also requires
>       * consulting DomXEN.  Passthrough everything that's not trapped.
>       */
> +    lock = &d->pci_lock;
> +    read_lock(lock);
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev && is_hardware_domain(d) )
> +    {
> +        read_unlock(lock);
> +        lock = &dom_xen->pci_lock;
> +        read_lock(lock);
>          pdev = pci_get_pdev(dom_xen, sbdf);
> +    }
>      if ( !pdev || !pdev->vpci )
> +    {
> +        read_unlock(lock);
>          return vpci_read_hw(sbdf, reg, size);
> +    }

As said above in the commit message, I'm unsure you really need both
locks, as the devices assigned to dom_xen can only be accessed by the
hardware domain, so considering those protected by the hwdom pci_lock
would be OK IMO.  A comment would need to be added here and in
vpci_write() to that regard.

I also wonder whether you don't nest locks here like you do in
vpci_write().  Maybe I'm missing something that justifies the
asymmetry with the locking pattern used in vpci_write().

>  
>      spin_lock(&pdev->vpci->lock);
>  
> @@ -392,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    read_unlock(lock);
>  
>      if ( data_offset < size )
>      {
> @@ -431,10 +447,23 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +/* Helper function to unlock locks taken by vpci_write in proper order */
> +static void release_domain_write_locks(struct domain *d)
> +{
> +    ASSERT(rw_is_write_locked(&d->pci_lock));
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        ASSERT(rw_is_write_locked(&dom_xen->pci_lock));
> +        write_unlock(&dom_xen->pci_lock);
> +    }
> +    write_unlock(&d->pci_lock);
> +}
> +
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -447,8 +476,20 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  
>      /*
>       * Find the PCI dev matching the address, which for hwdom also requires
> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> +     * consulting DomXEN. Passthrough everything that's not trapped.
> +     * If this is hwdom, we need to hold locks for both domain in case if
> +     * modify_bars() is called
>       */
> +    /*
> +     * TODO: We need to take pci_locks in exclusive mode only if we
> +     * are modifying BARs, so there is a room for improvement.

Nit: could be joined with the previous comment block.

Thanks, Roger.

