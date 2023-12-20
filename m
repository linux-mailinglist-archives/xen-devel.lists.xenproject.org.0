Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4028196B9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 03:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657317.1026126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFm2m-0000Mp-Bv; Wed, 20 Dec 2023 02:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657317.1026126; Wed, 20 Dec 2023 02:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFm2m-0000Ku-89; Wed, 20 Dec 2023 02:10:44 +0000
Received: by outflank-mailman (input) for mailman id 657317;
 Wed, 20 Dec 2023 02:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFm2k-0000IC-EQ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 02:10:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f856da79-9edc-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 03:10:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDEAB614D4;
 Wed, 20 Dec 2023 02:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C962C433C8;
 Wed, 20 Dec 2023 02:10:37 +0000 (UTC)
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
X-Inumbo-ID: f856da79-9edc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703038238;
	bh=ER7BcoQkaH144AE6yTsMgJ2rFW80agKDieErSk2bdnQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=flbZAEX3P/77Y3tkqzZE311d8ZiiB3j65bPtgDXHyCE7J595pGJAxCjsWX+8qOa5i
	 jjCvyC36My+Zm/+m1XmaVyNw+uejga8BAGvdW9PGt2xN/QTpK12UyMu+r1I2s2GC/5
	 oMYUNU6+KGVYB0fI+d29Qn8TeY/5qVBaYe5DnOqf9omtQ4KDd/y3PThfxp1l9N5ZGj
	 NkpvYiM6hAqdEVIYJeaWptPspsTDeDerAlQP9+PdOh3im1t8oaPTvvcsA4i2uXHF/v
	 zoPU+xgC286NayuocE5smcq65ple5xevY9Jcdcy4HOYjhly+ywV5iQoP0OZjq4TlX+
	 8gixlHEnLdZXA==
Date: Tue, 19 Dec 2023 18:10:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
In-Reply-To: <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2312191806520.3175268@ubuntu-linux-20-04-desktop>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Dec 2023, Volodymyr Babchuk wrote:
> Previously pci_enable_msi() function obtained pdev pointer by itself,
> but taking into account upcoming changes to PCI locking, it is better
> when caller passes already acquired pdev pointer to the function,
> because caller knows better how to obtain the pointer and which locks
> are needed to be used. Also, in most cases caller already has pointer
> to pdev, so we can avoid an extra list walk.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> In v11:
>  - Made pdev parameter very first in pci_enable_msi() and friends.
>  - Extended the commit message
>  - Added check for pdev into ns16550 driver
>  - Replaced hard tabs with spaces
> 
> Changes in v10:
> 
>  - New in v10. This is the result of discussion in "vpci: add initial
>  support for virtual PCI bus topology"
> ---
>  xen/arch/x86/include/asm/msi.h |  5 +++--
>  xen/arch/x86/irq.c             |  2 +-
>  xen/arch/x86/msi.c             | 19 ++++++++++---------
>  xen/drivers/char/ns16550.c     | 28 ++++++++++++++++++----------
>  4 files changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index c1ece2786e..07b3ee55e9 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -81,8 +81,9 @@ struct irq_desc;
>  struct hw_interrupt_type;
>  struct msi_desc;
>  /* Helper functions */
> -extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
> -extern void pci_disable_msi(struct msi_desc *msi_desc);
> +extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
> +                          struct msi_desc **desc);
> +extern void pci_disable_msi(struct msi_desc *desc);

As the parameters name should match between declaration and definition,
you should also rename msi_desc to desc in the implementation of
pci_disable_msi. Or keep the parameter called "msi_desc" for
pci_disable_msi here. That change could be done on commit and everything
else looks OK:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



>  extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
>  extern void pci_cleanup_msi(struct pci_dev *pdev);
>  extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc);
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6e668b1b4f..50e49e1a4b 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2176,7 +2176,7 @@ int map_domain_pirq(
>          if ( !pdev )
>              goto done;
>  
> -        ret = pci_enable_msi(msi, &msi_desc);
> +        ret = pci_enable_msi(pdev, msi, &msi_desc);
>          if ( ret )
>          {
>              if ( ret > 0 )
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 7f8e794254..335c0868a2 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -983,13 +983,13 @@ static int msix_capability_init(struct pci_dev *dev,
>   * irq or non-zero for otherwise.
>   **/
>  
> -static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
> +static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
> +                            struct msi_desc **desc)
>  {
> -    struct pci_dev *pdev;
>      struct msi_desc *old_desc;
>  
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, msi->sbdf);
> +
>      if ( !pdev )
>          return -ENODEV;
>  
> @@ -1038,13 +1038,13 @@ static void __pci_disable_msi(struct msi_desc *entry)
>   * of irqs available. Driver should use the returned value to re-send
>   * its request.
>   **/
> -static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
> +static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
> +                             struct msi_desc **desc)
>  {
> -    struct pci_dev *pdev;
>      struct msi_desc *old_desc;
>  
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, msi->sbdf);
> +
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;
>  
> @@ -1151,15 +1151,16 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>   * Notice: only construct the msi_desc
>   * no change to irq_desc here, and the interrupt is masked
>   */
> -int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
> +int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
> +                   struct msi_desc **desc)
>  {
>      ASSERT(pcidevs_locked());
>  
>      if ( !use_msi )
>          return -EPERM;
>  
> -    return msi->table_base ? __pci_enable_msix(msi, desc) :
> -                             __pci_enable_msi(msi, desc);
> +    return msi->table_base ? __pci_enable_msix(pdev, msi, desc) :
> +                             __pci_enable_msi(pdev, msi, desc);
>  }
>  
>  /*
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index ddf2a48be6..cfe9ff8d2a 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -452,21 +452,29 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>              if ( rc > 0 )
>              {
>                  struct msi_desc *msi_desc = NULL;
> +                struct pci_dev *pdev;
>  
>                  pcidevs_lock();
>  
> -                rc = pci_enable_msi(&msi, &msi_desc);
> -                if ( !rc )
> +                pdev = pci_get_pdev(NULL, msi.sbdf);
> +                if ( pdev )
>                  {
> -                    struct irq_desc *desc = irq_to_desc(msi.irq);
> -                    unsigned long flags;
> -
> -                    spin_lock_irqsave(&desc->lock, flags);
> -                    rc = setup_msi_irq(desc, msi_desc);
> -                    spin_unlock_irqrestore(&desc->lock, flags);
> -                    if ( rc )
> -                        pci_disable_msi(msi_desc);
> +                    rc = pci_enable_msi(pdev, &msi, &msi_desc);
> +
> +                    if ( !rc )
> +                    {
> +                        struct irq_desc *desc = irq_to_desc(msi.irq);
> +                        unsigned long flags;
> +
> +                        spin_lock_irqsave(&desc->lock, flags);
> +                        rc = setup_msi_irq(desc, msi_desc);
> +                        spin_unlock_irqrestore(&desc->lock, flags);
> +                        if ( rc )
> +                            pci_disable_msi(msi_desc);
> +                    }
>                  }
> +                else
> +                    rc = -ENODEV;
>  
>                  pcidevs_unlock();
>  
> -- 
> 2.42.0
> 

