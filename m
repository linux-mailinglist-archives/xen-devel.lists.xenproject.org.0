Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9550A67D9C8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 00:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485237.752308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLBrU-0006nH-PD; Thu, 26 Jan 2023 23:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485237.752308; Thu, 26 Jan 2023 23:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLBrU-0006kZ-Ls; Thu, 26 Jan 2023 23:40:56 +0000
Received: by outflank-mailman (input) for mailman id 485237;
 Thu, 26 Jan 2023 23:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSUn=5X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLBrT-0006kT-K9
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 23:40:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfbc2637-9dd2-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 00:40:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE3F0B81ED5;
 Thu, 26 Jan 2023 23:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8114FC433EF;
 Thu, 26 Jan 2023 23:40:51 +0000 (UTC)
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
X-Inumbo-ID: dfbc2637-9dd2-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674776452;
	bh=MwcrpHNjJOmzEcKQbB9lI4v77vX57G2nWxiUid79/vs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=So3E+Vni2AScsj3hwqrikOAemXJ89SU3gU9S78+9BTutugIa77wG2DWWgf17BHFkT
	 C0/nNQDlyUP667xkmkarejmvhwTSJnblya12XW2cAqp617d2SkZ2joaXBCiYM/J972
	 rpccpuPDA18n44C/cFRSKW1SR1MrkrB8Oz6epXz6jy9pULEFQmJAl7kdV0yfRDhN/u
	 Ea+rOdcKB9B1ACC+w5zp9kvZEutjuCjzKlP7SV2p3+2XiHxI51ZwyT782q+Qarnxys
	 Z90h+cXM78rfItuX2PGBDa4SX0Us2ehHL+KFiOjpZWxHpq7dDH8NppkC87oAKm9AD9
	 uQmwrZ+PuG5MA==
Date: Thu, 26 Jan 2023 15:40:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 02/10] xen: pci: add pci_seg->alldevs_lock
In-Reply-To: <20220831141040.13231-3-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301261524430.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-3-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> This lock protects alldevs_list of struct pci_seg. As this, it should
> be used when we are adding, removing on enumerating PCI devices
> assigned to a PCI segment.
> 
> Radix tree that stores PCI segment has own locking mechanism, also
> pci_seg structures are only allocated and newer freed, so we need no
> additional locking to access pci_seg structures. But we need a lock
> that protects alldevs_list field.
> 
> This enables more granular locking instead of one huge pcidevs_lock
> that locks entire PCI subsystem.  Please note that pcidevs_lock() is
> still used, we are going to remove it in subsequent patches.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/drivers/passthrough/pci.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 4366f8f965..2dfa1c2875 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -38,6 +38,7 @@
>  
>  struct pci_seg {
>      struct list_head alldevs_list;
> +    spinlock_t alldevs_lock;
>      u16 nr;
>      unsigned long *ro_map;
>      /* bus2bridge_lock protects bus2bridge array */
> @@ -93,6 +94,7 @@ static struct pci_seg *alloc_pseg(u16 seg)
>      pseg->nr = seg;
>      INIT_LIST_HEAD(&pseg->alldevs_list);
>      spin_lock_init(&pseg->bus2bridge_lock);
> +    spin_lock_init(&pseg->alldevs_lock);
>  
>      if ( radix_tree_insert(&pci_segments, seg, pseg) )
>      {
> @@ -385,9 +387,13 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      unsigned int pos;
>      int rc;
>  
> +    spin_lock(&pseg->alldevs_lock);
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
> +        {
> +            spin_unlock(&pseg->alldevs_lock);
>              return pdev;
> +        }
>  
>      pdev = xzalloc(struct pci_dev);
>      if ( !pdev )

Here there is a missing spin_unlock on the error path


> @@ -404,10 +410,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      if ( rc )
>      {
>          xfree(pdev);
> +        spin_unlock(&pseg->alldevs_lock);
>          return NULL;
>      }
>  
>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
> +    spin_unlock(&pseg->alldevs_lock);
>  
>      /* update bus2bridge */
>      switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
> @@ -611,15 +619,20 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_sbdf_t sbdf)
>       */
>      if ( !d || is_hardware_domain(d) )
>      {
> -        const struct pci_seg *pseg = get_pseg(sbdf.seg);
> +        struct pci_seg *pseg = get_pseg(sbdf.seg);
>  
>          if ( !pseg )
>              return NULL;
>  
> +        spin_lock(&pseg->alldevs_lock);
>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf &&
>                   (!d || pdev->domain == d) )
> +            {
> +                spin_unlock(&pseg->alldevs_lock);
>                  return pdev;
> +            }
> +        spin_unlock(&pseg->alldevs_lock);
>      }
>      else
>      {
> @@ -893,6 +906,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>          return -ENODEV;
>  
>      pcidevs_lock();
> +    spin_lock(&pseg->alldevs_lock);
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> @@ -907,10 +921,12 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              }
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
> +            list_del(&pdev->alldevs_list);

use after free: free_pdev is freeing pdef

>              break;
>          }
>  
>      pcidevs_unlock();
> +    spin_unlock(&pseg->alldevs_lock);

lock inversion


>      return ret;
>  }
>  
> @@ -1363,6 +1379,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>  
>      printk("==== segment %04x ====\n", pseg->nr);
>  
> +    spin_lock(&pseg->alldevs_lock);
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>      {
>          printk("%pp - ", &pdev->sbdf);
> @@ -1376,6 +1393,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>          pdev_dump_msi(pdev);
>          printk("\n");
>      }
> +    spin_unlock(&pseg->alldevs_lock);
>  
>      return 0;
>  }
> -- 
> 2.36.1
> 

