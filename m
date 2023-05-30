Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C971713C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 01:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541522.844373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q48PQ-00058I-Bl; Tue, 30 May 2023 23:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541522.844373; Tue, 30 May 2023 23:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q48PQ-000565-8I; Tue, 30 May 2023 23:05:44 +0000
Received: by outflank-mailman (input) for mailman id 541522;
 Tue, 30 May 2023 23:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FU5e=BT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q48PP-00055z-AQ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 23:05:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d761fa4-ff3e-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 01:05:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E379661336;
 Tue, 30 May 2023 23:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3140C433D2;
 Tue, 30 May 2023 23:05:36 +0000 (UTC)
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
X-Inumbo-ID: 7d761fa4-ff3e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685487937;
	bh=W4qs1C3fqrpYJfUFup6WGc9s7xQH+F9LR2w3DLMz8gI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CV5Svw/G1dVZFoLzHmRi/CkqKaK8eYofGD2cg0fTDhwFtPFCVH0YFMymrLQ1p9pc8
	 yAR6Yh1gPpwJ11Usgg+oF+zQuV9+dTFwcXAbepLWmX2ioKbU1WkSxI0QgyKA3kxMR5
	 G5oti36qyguGLHEq4TF3q1QEbnt832T3yh5pKxLwT+cNN+gvQD9UdSt6m+lwZs5EZp
	 T26ev6ymsTVfUEy/DibhFV6Vi1tZm+FiDo/SFu0wueagoj/8QEcXidWS5zQj6CZ6r8
	 X1GmOVCNjYJKiMMfF93TUMWP1j8eOBL1DAWEDqo5NAeFrKn0WZUaJ4OgSf5tbRbr6O
	 WERjhjiYv6g2w==
Date: Tue, 30 May 2023 16:05:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] vPCI: account for hidden devices
In-Reply-To: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305301604530.44000@ubuntu-linux-20-04-desktop>
References: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 May 2023, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's list
> of devices; DomXEN's list also needs to be scanned.
> 
> Suppress vPCI init altogether for r/o devices (which constitute a subset
> of hidden ones).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3: Also consider pdev being DomXEN's in modify_bars(). Also consult
>     DomXEN in vpci_{read,write}(). Move vpci_write()'s check of the r/o
>     map out of mainline code. Re-base over the standalone addition of
>     the loop continuation in modify_bars(), and finally make the code
>     change there well-formed.
> v2: Extend existing comment. Relax assertion. Don't initialize vPCI for
>     r/o devices.
> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
> @@ -285,58 +286,69 @@ static int modify_bars(const struct pci_
>  
>      /*
>       * Check for overlaps with other BARs. Note that only BARs that are
> -     * currently mapped (enabled) are checked for overlaps.
> +     * currently mapped (enabled) are checked for overlaps. Note also that
> +     * for hwdom we also need to include hidden, i.e. DomXEN's, devices.
>       */
> -    for_each_pdev ( pdev->domain, tmp )
> +    for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain; ; )
>      {
> -        if ( !tmp->vpci )
> -            /*
> -             * For the hardware domain it's possible to have devices assigned
> -             * to it that are not handled by vPCI, either because those are
> -             * read-only devices, or because vPCI setup has failed.
> -             */
> -            continue;
> -
> -        if ( tmp == pdev )
> +        for_each_pdev ( d, tmp )
>          {
> -            /*
> -             * Need to store the device so it's not constified and defer_map
> -             * can modify it in case of error.
> -             */
> -            dev = tmp;
> -            if ( !rom_only )
> +            if ( !tmp->vpci )
>                  /*
> -                 * If memory decoding is toggled avoid checking against the
> -                 * same device, or else all regions will be removed from the
> -                 * memory map in the unmap case.
> +                 * For the hardware domain it's possible to have devices
> +                 * assigned to it that are not handled by vPCI, either because
> +                 * those are read-only devices, or because vPCI setup has
> +                 * failed.
>                   */
>                  continue;
> -        }
>  
> -        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> -        {
> -            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> -            unsigned long start = PFN_DOWN(bar->addr);
> -            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> -
> -            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
> -                 /*
> -                  * If only the ROM enable bit is toggled check against other
> -                  * BARs in the same device for overlaps, but not against the
> -                  * same ROM BAR.
> -                  */
> -                 (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> -                continue;
> +            if ( tmp == pdev )
> +            {
> +                /*
> +                 * Need to store the device so it's not constified and defer_map
> +                 * can modify it in case of error.
> +                 */
> +                dev = tmp;
> +                if ( !rom_only )
> +                    /*
> +                     * If memory decoding is toggled avoid checking against the
> +                     * same device, or else all regions will be removed from the
> +                     * memory map in the unmap case.
> +                     */
> +                    continue;
> +            }
>  
> -            rc = rangeset_remove_range(mem, start, end);
> -            if ( rc )
> +            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>              {
> -                printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> -                       start, end, rc);
> -                rangeset_destroy(mem);
> -                return rc;
> +                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> +                unsigned long start = PFN_DOWN(bar->addr);
> +                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +
> +                if ( !bar->enabled ||
> +                     !rangeset_overlaps_range(mem, start, end) ||
> +                     /*
> +                      * If only the ROM enable bit is toggled check against
> +                      * other BARs in the same device for overlaps, but not
> +                      * against the same ROM BAR.
> +                      */
> +                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> +                    continue;
> +
> +                rc = rangeset_remove_range(mem, start, end);
> +                if ( rc )
> +                {
> +                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> +                           start, end, rc);
> +                    rangeset_destroy(mem);
> +                    return rc;
> +                }
>              }
>          }
> +
> +        if ( !is_hardware_domain(d) )
> +            break;
> +
> +        d = dom_xen;
>      }
>  
>      ASSERT(dev);
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -70,6 +70,7 @@ void vpci_remove_device(struct pci_dev *
>  int vpci_add_handlers(struct pci_dev *pdev)
>  {
>      unsigned int i;
> +    const unsigned long *ro_map;
>      int rc = 0;
>  
>      if ( !has_vpci(pdev->domain) )
> @@ -78,6 +79,11 @@ int vpci_add_handlers(struct pci_dev *pd
>      /* We should not get here twice for the same device. */
>      ASSERT(!pdev->vpci);
>  
> +    /* No vPCI for r/o devices. */
> +    ro_map = pci_get_ro_map(pdev->sbdf.seg);
> +    if ( ro_map && test_bit(pdev->sbdf.bdf, ro_map) )
> +        return 0;
> +
>      pdev->vpci = xzalloc(struct vpci);
>      if ( !pdev->vpci )
>          return -ENOMEM;
> @@ -332,8 +338,13 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsi
>          return data;
>      }
>  
> -    /* Find the PCI dev matching the address. */
> +    /*
> +     * Find the PCI dev matching the address, which for hwdom also requires
> +     * consulting DomXEN.  Passthrough everything that's not trapped.
> +     */
>      pdev = pci_get_pdev(d, sbdf);
> +    if ( !pdev && is_hardware_domain(d) )
> +        pdev = pci_get_pdev(dom_xen, sbdf);
>      if ( !pdev || !pdev->vpci )
>          return vpci_read_hw(sbdf, reg, size);
>  
> @@ -427,7 +438,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigne
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> -    const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
>  
>      if ( !size )
>      {
> @@ -435,18 +445,20 @@ void vpci_write(pci_sbdf_t sbdf, unsigne
>          return;
>      }
>  
> -    if ( ro_map && test_bit(sbdf.bdf, ro_map) )
> -        /* Ignore writes to read-only devices. */
> -        return;
> -
>      /*
> -     * Find the PCI dev matching the address.
> -     * Passthrough everything that's not trapped.
> +     * Find the PCI dev matching the address, which for hwdom also requires
> +     * consulting DomXEN.  Passthrough everything that's not trapped.
>       */
>      pdev = pci_get_pdev(d, sbdf);
> +    if ( !pdev && is_hardware_domain(d) )
> +        pdev = pci_get_pdev(dom_xen, sbdf);
>      if ( !pdev || !pdev->vpci )
>      {
> -        vpci_write_hw(sbdf, reg, size, data);
> +        /* Ignore writes to read-only devices, which have no ->vpci. */
> +        const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
> +
> +        if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
> +            vpci_write_hw(sbdf, reg, size, data);
>          return;
>      }
>  
> 

