Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9ED7EF485
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 15:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635241.991111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zuR-0007oV-4d; Fri, 17 Nov 2023 14:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635241.991111; Fri, 17 Nov 2023 14:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zuR-0007mq-1u; Fri, 17 Nov 2023 14:33:27 +0000
Received: by outflank-mailman (input) for mailman id 635241;
 Fri, 17 Nov 2023 14:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3zuQ-0007mk-2j
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 14:33:26 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43cf815f-8556-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 15:33:24 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32faea0fa1fso1232084f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 06:33:24 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d4-20020a5d4f84000000b0032d96dd703bsm2457985wru.70.2023.11.17.06.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 06:33:23 -0800 (PST)
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
X-Inumbo-ID: 43cf815f-8556-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700231604; x=1700836404; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aKti1lsl/A8T/TPv7EBXllSJ3HFsGsEi80ZTnOCbMV4=;
        b=n2jRjiMF6uI+34DdGqzOXRRXkIzKAIwcVeJ7at4KzMlwIlt0Hk6A9O4ByWR/cEzYVs
         tE3Wun7cQjv4gnxlceOfZngFBL8MqFhcCNMgzCvZJpBMNnQG8do+3wpmCR3xsHnOdYto
         5EBkKf7Z6rBnEyIMVZ8PhsFa/pqvxStrHiK20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700231604; x=1700836404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKti1lsl/A8T/TPv7EBXllSJ3HFsGsEi80ZTnOCbMV4=;
        b=si+NUa3E2k2PcIkgIbDu8a9L5djZvWbxUu/2UKzgR/8NXHVQFjPoFdRagZNYG1opSS
         AqD2h8q8/5+rXZXeu+49mQj2iLZBVosvevAzFbvp8UM70Lm9sUJR1Ea1n9X/OG8ogI0k
         +RrvRQybkHKXMpRuvZIUja/kZr4S4txgSNtsdWNm1gnGhWQcFWBH7IwZDUMc/ApPi5sU
         juwgfbM/UTR0W/5Bav/bwedhl7DdY+rDsjoUGQoa5rry6gXrPrWQ97VC/bhmIkm4Tfcs
         rX8qvrAR7GCZolopegI74uTjWklR4MV5zOahTBxupJ/xnXIHtL8Nlz2nGWYNJpE/o6PM
         1lCQ==
X-Gm-Message-State: AOJu0YwQN9BD57BqtPNUM9iuDQhBpDtsuOM2OQEjWNjNTaNneNa8faJD
	yXwXlO/RQuzf81jWHVjN68nVlA==
X-Google-Smtp-Source: AGHT+IGZee6A+GzISWGJGJYzZDT50scBSV7rVibefOfUKsI9uy1Xgn4ESQ19wghPrJ84i+ZNWt/NwA==
X-Received: by 2002:a5d:59a4:0:b0:32d:c792:fcaf with SMTP id p4-20020a5d59a4000000b0032dc792fcafmr4055234wrr.26.1700231604225;
        Fri, 17 Nov 2023 06:33:24 -0800 (PST)
Date: Fri, 17 Nov 2023 15:33:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v10 02/17] pci: introduce per-domain PCI rwlock
Message-ID: <ZVd5spOWUw3UnkQO@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-3-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012220854.2736994-3-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:15PM +0000, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. This is a rw-lock,
> but this patch adds only write_lock()s. There will be read_lock()
> users in the next patches.
> 
> This lock should be taken in write mode every time d->pdev_list is
> altered. All write accesses also should be protected by pcidevs_lock()
> as well. Idea is that any user that wants read access to the list or
> to the devices stored in the list should use either this new
> d->pci_lock or old pcidevs_lock(). Usage of any of this two locks will
> ensure only that pdev of interest will not disappear from under feet
> and that the pdev still will be assigned to the same domain. Of
> course, any new users should use pcidevs_lock() when it is
> appropriate (e.g. when accessing any other state that is protected by
> the said lock). In case both the newly introduced per-domain rwlock
> and the pcidevs lock is taken, the later must be acquired first.
                                     ^ latter

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I'm a bit concerned with the logic used in pci_release_devices(), but
I guess it's fine for now as long as the global pcidevs_lock is still
held.

> ---
> 
> Changes in v10:
>  - pdev->domain is assigned after removing from source domain but
>    before adding to target domain in reassign_device() functions.
> 
> Changes in v9:
>  - returned back "pdev->domain = target;" in AMD IOMMU code
>  - used "source" instead of pdev->domain in IOMMU functions
>  - added comment about lock ordering in the commit message
>  - reduced locked regions
>  - minor changes non-functional changes in various places
> 
> Changes in v8:
>  - New patch
> 
> Changes in v8 vs RFC:
>  - Removed all read_locks after discussion with Roger in #xendevel
>  - pci_release_devices() now returns the first error code
>  - extended commit message
>  - added missing lock in pci_remove_device()
>  - extended locked region in pci_add_device() to protect list_del() calls
> ---
>  xen/common/domain.c                         |  1 +
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  9 ++-
>  xen/drivers/passthrough/pci.c               | 71 +++++++++++++++++----
>  xen/drivers/passthrough/vtd/iommu.c         |  9 ++-
>  xen/include/xen/sched.h                     |  1 +
>  5 files changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8f9ab01c0c..785c69e48b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -651,6 +651,7 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +    rwlock_init(&d->pci_lock);
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 836c24b02e..36a617bed4 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -476,8 +476,15 @@ static int cf_check reassign_device(
>  
>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> +        write_lock(&source->pci_lock);
> +        list_del(&pdev->domain_list);
> +        write_unlock(&source->pci_lock);
> +
>          pdev->domain = target;
> +
> +        write_lock(&target->pci_lock);
> +        list_add(&pdev->domain_list, &target->pdev_list);
> +        write_unlock(&target->pci_lock);
>      }
>  
>      /*
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 04d00c7c37..b8ad4fa07c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -453,7 +453,9 @@ static void __init _pci_hide_device(struct pci_dev *pdev)
>      if ( pdev->domain )
>          return;
>      pdev->domain = dom_xen;
> +    write_lock(&dom_xen->pci_lock);
>      list_add(&pdev->domain_list, &dom_xen->pdev_list);
> +    write_unlock(&dom_xen->pci_lock);
>  }
>  
>  int __init pci_hide_device(unsigned int seg, unsigned int bus,
> @@ -746,7 +748,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> +        write_lock(&hardware_domain->pci_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        write_unlock(&hardware_domain->pci_lock);
>  
>          /*
>           * For devices not discovered by Xen during boot, add vPCI handlers
> @@ -756,7 +760,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
> +            write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -764,7 +770,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              vpci_remove_device(pdev);
> +            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
> +            write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -814,7 +822,11 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> +            {
> +                write_lock(&pdev->domain->pci_lock);
>                  list_del(&pdev->domain_list);
> +                write_unlock(&pdev->domain->pci_lock);
> +            }
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;
> @@ -885,26 +897,61 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>  int pci_release_devices(struct domain *d)
>  {
> -    struct pci_dev *pdev, *tmp;
> -    u8 bus, devfn;
> -    int ret;
> +    int combined_ret;
> +    LIST_HEAD(failed_pdevs);
>  
>      pcidevs_lock();
> -    ret = arch_pci_clean_pirqs(d);
> -    if ( ret )
> +
> +    combined_ret = arch_pci_clean_pirqs(d);
> +    if ( combined_ret )
>      {
>          pcidevs_unlock();
> -        return ret;
> +        return combined_ret;
>      }
> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
> +
> +    write_lock(&d->pci_lock);

Strictly speaking this could be a read_lock, since you are not
modifying the list here, just getting an element out of it.  I see
however that the late half of the loop does require the lock in write
mode for altering the domain pdev list, and hence might be clearer to
just use the lock in write mode all along.

> +
> +    while ( !list_empty(&d->pdev_list) )
>      {
> -        bus = pdev->bus;
> -        devfn = pdev->devfn;
> -        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> +        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
> +                                                struct pci_dev,
> +                                                domain_list);
> +        uint16_t seg = pdev->seg;
> +        uint8_t bus = pdev->bus;
> +        uint8_t devfn = pdev->devfn;

What's the point of those local variables?  They are used only once,
and getting them is trivial.  Is this protection against 'pdev' being
removed since we no longer hold the per-domain lock?

I don't like much dropping the lock in the middle of a loop, as I
think it's dangerous, but I don't have much better suggestion here.

One thing that we might look into is to move the whole device list to
a local variable under the per domain pci lock, and then iterate over
that list without requiring the per domain lock to be taken.

Thanks, Roger.

