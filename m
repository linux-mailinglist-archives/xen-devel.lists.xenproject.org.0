Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32727EF4FC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 16:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635259.991132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40aD-0002b9-Gw; Fri, 17 Nov 2023 15:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635259.991132; Fri, 17 Nov 2023 15:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40aD-0002Yh-Ce; Fri, 17 Nov 2023 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 635259;
 Fri, 17 Nov 2023 15:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r40aB-0002Yb-PW
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 15:16:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a570ed1-855c-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 16:16:32 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so16467915e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 07:16:32 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 i28-20020a05600c4b1c00b00405718cbeadsm4048357wmp.1.2023.11.17.07.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 07:16:31 -0800 (PST)
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
X-Inumbo-ID: 4a570ed1-855c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700234192; x=1700838992; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtXOAWSqRemoqhZ4YS+zLKCgvitsvgPchkjLeNyJwcs=;
        b=MJ9z3nVWCkHZALqKSQW6CgGZKxLiXkKaD45x9N5o+VPe4Z4vpd5NltN11jafShATso
         SZDj1awJoVaZy5gnAQ63RC2WdNt5pc1KdEGASSx/rgGKQz0f2OpGvwqxAVZ4LwFUWhn/
         644puVMjs0smK92wVXGMxEis9I2VUk0X/vTdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700234192; x=1700838992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtXOAWSqRemoqhZ4YS+zLKCgvitsvgPchkjLeNyJwcs=;
        b=EX9kn9mGfFR0YBij8HadlhxSDDDdPSQhP1fLqXDGZrSg8pwwahNPcUJfB0gSECL2+u
         4VNpdsI5c16+Tgmm5sPYrvoD+jGuxA8Wf+39L4bC846soCzUipdnIawNtqnyY2D1PapH
         D8j//iU5HCx3h0SdY0Lon0m2L+EEF1rmZGxK4mhGdGEVCodAhSpW2JfGLyx2dcIslQ6a
         YHrVZf7JhCs6xdfu+EDdbuG8eyqT5kLg6EqOMV59VNvKi1H2JrtbZSNj/VG0wvc52dwL
         srEfw8pBxOC4EXpkmqzdeV6MH4pLL9U2hEeYzU6PJB47eWBxiDhCdPhOHfKjK4INabAx
         Vsdg==
X-Gm-Message-State: AOJu0Yx69d9UN8PffuEEMf6A0YcyK9mD0SBZ/lvtCSylBNz0H5ylaeiV
	Vt7YrAZm/8Lfh7YA/xqgGAOtnw==
X-Google-Smtp-Source: AGHT+IFz8ZQhZVMi2gabxmhLDcC5161S4ZALuGRo8AAmw6+yGDxGz/T0yvzs8Ilf4ja0ZPjqI7U8Lg==
X-Received: by 2002:a05:600c:4f8a:b0:401:d803:624f with SMTP id n10-20020a05600c4f8a00b00401d803624fmr15540080wmq.4.1700234191988;
        Fri, 17 Nov 2023 07:16:31 -0800 (PST)
Date: Fri, 17 Nov 2023 16:16:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v10 03/17] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZVeDzhzl4y6Ok9y7@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-4-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012220854.2736994-4-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:15PM +0000, Volodymyr Babchuk wrote:
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
> There is a possible lock inversion in MSI code, as some parts of it
> acquire pcidevs_lock() while already holding d->pci_lock.

Is this going to be addressed in a further patch?

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
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
>  xen/arch/x86/hvm/vmsi.c        | 26 ++++++++---------
>  xen/arch/x86/hvm/vmx/vmx.c     |  2 --
>  xen/arch/x86/include/asm/irq.h |  3 +-
>  xen/arch/x86/irq.c             | 12 ++++----
>  xen/arch/x86/msi.c             | 10 ++-----
>  xen/arch/x86/physdev.c         |  2 +-
>  xen/drivers/passthrough/pci.c  |  9 +++---
>  xen/drivers/vpci/header.c      | 18 ++++++++++++
>  xen/drivers/vpci/msi.c         | 28 ++++++++++++++++--
>  xen/drivers/vpci/msix.c        | 52 +++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c        | 51 +++++++++++++++++++++++++++++++--
>  11 files changed, 166 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 128f236362..6b33a80120 100644
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
> @@ -762,7 +761,7 @@ static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
>      rc = allocate_and_map_msi_pirq(pdev->domain, -1, &pirq,
>                                     table_base ? MAP_PIRQ_TYPE_MSI
>                                                : MAP_PIRQ_TYPE_MULTI_MSI,
> -                                   &msi_info);
> +                                   &msi_info, false);
>      if ( rc )
>      {
>          gdprintk(XENLOG_ERR, "%pp: failed to map PIRQ: %d\n", &pdev->sbdf, rc);
> @@ -778,15 +777,13 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
>      int rc;
>  
>      ASSERT(msi->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>      rc = vpci_msi_enable(pdev, vectors, 0);
>      if ( rc < 0 )
>          return rc;
>      msi->arch.pirq = rc;
> -
> -    pcidevs_lock();
>      msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
>                                         msi->arch.pirq, msi->mask);
> -    pcidevs_unlock();
>  
>      return 0;
>  }
> @@ -797,8 +794,8 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      unsigned int i;
>  
>      ASSERT(pirq != INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    pcidevs_lock();
>      for ( i = 0; i < nr && bound; i++ )
>      {
>          struct xen_domctl_bind_pt_irq bind = {
> @@ -814,7 +811,6 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
>      write_lock(&pdev->domain->event_lock);
>      unmap_domain_pirq(pdev->domain, pirq);
>      write_unlock(&pdev->domain->event_lock);
> -    pcidevs_unlock();
>  }
>  
>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
> @@ -854,6 +850,8 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
>      int rc;
>  
>      ASSERT(entry->arch.pirq == INVALID_PIRQ);
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
> +
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
> index 1edc7f1e91..545a27796e 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -413,8 +413,6 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT(pcidevs_locked());
> -
>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>  
>   unlock_out:
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index ad907fc97f..3d24f39ca6 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -213,6 +213,7 @@ static inline void arch_move_irqs(struct vcpu *v) { }
>  struct msi_info;
>  int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
>  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> -                              int type, struct msi_info *msi);
> +                              int type, struct msi_info *msi,
> +			      bool use_pci_lock);

Indentation using hard tabs.

>  
>  #endif /* _ASM_HW_IRQ_H */
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 68b788c42e..970ba04aa0 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2157,7 +2157,7 @@ int map_domain_pirq(
>          struct pci_dev *pdev;
>          unsigned int nr = 0;
>  
> -        ASSERT(pcidevs_locked());
> +        ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>  
>          ret = -ENODEV;
>          if ( !cpu_has_apic )
> @@ -2314,7 +2314,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>          return -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> @@ -2875,7 +2875,7 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p)
>  }
>  
>  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> -                              int type, struct msi_info *msi)
> +                              int type, struct msi_info *msi, bool use_pci_lock)
>  {
>      int irq, pirq, ret;
>  
> @@ -2908,7 +2908,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>      msi->irq = irq;
>  
> -    pcidevs_lock();
> +    if ( use_pci_lock )
> +        pcidevs_lock();

Instead of passing the flag it might be better if the caller can take
the lock, as to avoid having to pass an extra parameter.

Then we should also assert that either the pcidev_lock or the
per-domain pci lock is taken?

>      /* Verify or get pirq. */
>      write_lock(&d->event_lock);
>      pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
> @@ -2924,7 +2925,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>  
>   done:
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
> +    if ( use_pci_lock )
> +        pcidevs_unlock();
>      if ( ret )
>      {
>          switch ( type )
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 20275260b3..466725d8ca 100644
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
> @@ -988,8 +988,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
>  {
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev )
>          return -ENODEV;
>  
> @@ -1043,8 +1041,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc,
>  {
>      struct msi_desc *old_desc;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;
>  
> @@ -1154,8 +1150,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
>  		   struct pci_dev *pdev)
>  {
> -    ASSERT(pcidevs_locked());
> -

If you have the pdev in all the above function, you could expand the
assert to test for pdev->domain->pci_lock?

>      if ( !use_msi )
>          return -EPERM;
>  
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 2f1d955a96..7cbb5bc2c8 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -123,7 +123,7 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>  
>      case MAP_PIRQ_TYPE_MSI:
>      case MAP_PIRQ_TYPE_MULTI_MSI:
> -        ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> +        ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi, true);
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
> index 767c1ba718..a52e52db96 100644
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
> +        read_unlock(&d->pci_lock);
>          process_pending_softirqs();
> +        read_lock(&d->pci_lock);

You are asserting the lock is taken in write mode just above the usage
of read_{un,}lock().  Either the assert is wrong, or the usage of
read_{un,}lock() is wrong.

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
> index a253ccbd7d..2faa54b7ce 100644
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
> + pdev_done:
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

Weird label indentation.

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
> index 3bec9a4153..112de56fb3 100644
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

I'm unsure whether devices assigned to dom_xen can change ownership
after boot, so maybe there's no need for all this lock dance, as the
device cannot disappear?

Maybe just taking the hardware domain lock is enough to prevent
concurrent accesses in that case, as the hardware domain is the only
allowed to access devices owned by dom_xen.

Thanks, Roger.

