Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2914072D5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 23:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184788.333532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOnqt-0004Lg-Ln; Fri, 10 Sep 2021 21:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184788.333532; Fri, 10 Sep 2021 21:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOnqt-0004Iw-IT; Fri, 10 Sep 2021 21:14:27 +0000
Received: by outflank-mailman (input) for mailman id 184788;
 Fri, 10 Sep 2021 21:14:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOnqs-0004Iq-C9
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 21:14:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 130529e2-127c-11ec-b289-12813bfff9fa;
 Fri, 10 Sep 2021 21:14:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD81D600D4;
 Fri, 10 Sep 2021 21:14:23 +0000 (UTC)
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
X-Inumbo-ID: 130529e2-127c-11ec-b289-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631308464;
	bh=vfbat+5CVfuz+zm5IcGyNDCj1urgE5qTYsCRF2aePKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZbLQdcb9QTi8Nc4l7ON++RpOo/2dXgQGNdWr8oDqMFhWQG3GDCK/0Ec/x7EcsPnLl
	 21QpoaI3CobP2jotyikHbsAwvuNJyLM51qzKdsfAeOXvFXc++uaHWCpLscQchTUTU0
	 JkdqlAEyAl+AYKnAO7uI+U82aPqUd1sy5tW+XicksKpv722LPXBWnh2TOjAUojvimz
	 5spgiqjGTEd2fepQF6P5XN2II+FTtfP2uRYDtcu0Bea8x1yEjq5bISsJXQiHRiMS6v
	 4X5W5OTHU5YZZQnAjBYNj1j8WuY651K3qp8p1D4aC6LVa/0VSmtsAMx5n09siCqu2R
	 YBEGbr+bPMc/w==
Date: Fri, 10 Sep 2021 14:14:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, jbeulich@suse.com, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
In-Reply-To: <20210903100831.177748-5-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109101412111.10523@sstabellini-ThinkPad-T480s>
References: <20210903100831.177748-1-andr2000@gmail.com> <20210903100831.177748-5-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Use stubs for guest domains for now.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 78 +++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/vpci.c   |  4 +-
>  xen/include/xen/vpci.h    |  4 ++
>  3 files changed, 76 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 31bca7a12942..5218b1af247e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -397,6 +397,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> -static int add_bar_handlers(struct pci_dev *pdev)
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
> +
> +static int add_bar_handlers(struct pci_dev *pdev, bool is_hwdom)
>  {
>      unsigned int i;
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> -    /* Setup a handler for the command register. */
> +    /* Setup a handler for the command register: same for hwdom and guests. */
>      rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
>                             2, header);
>      if ( rc )
> @@ -475,8 +497,13 @@ static int add_bar_handlers(struct pci_dev *pdev)
>                  rom_reg = PCI_ROM_ADDRESS;
>              else
>                  rom_reg = PCI_ROM_ADDRESS1;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> -                                   rom_reg, 4, &bars[i]);
> +            if ( is_hwdom )
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                       rom_reg, 4, &bars[i]);
> +            else
> +                rc = vpci_add_register(pdev->vpci,
> +                                       guest_rom_read, guest_rom_write,
> +                                       rom_reg, 4, &bars[i]);
>              if ( rc )
>                  return rc;
>          }
> @@ -485,8 +512,13 @@ static int add_bar_handlers(struct pci_dev *pdev)
>              uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
>  
>              /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            if ( is_hwdom )
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write,
> +                                       reg, 4, &bars[i]);
> +            else
> +                rc = vpci_add_register(pdev->vpci,
> +                                       guest_bar_read, guest_bar_write,
> +                                       reg, 4, &bars[i]);
>              if ( rc )
>                  return rc;
>          }
> @@ -520,7 +552,7 @@ static int init_bars(struct pci_dev *pdev)
>      }
>  
>      if ( pdev->ignore_bars )
> -        return add_bar_handlers(pdev);
> +        return add_bar_handlers(pdev, true);
>  
>      /* Disable memory decoding before sizing. */
>      cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> @@ -582,7 +614,7 @@ static int init_bars(struct pci_dev *pdev)
>                                PCI_ROM_ADDRESS_ENABLE;
>      }
>  
> -    rc = add_bar_handlers(pdev);
> +    rc = add_bar_handlers(pdev, true);
>      if ( rc )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
>  }
>  REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>  
> +int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);
> +
> +    /* It only makes sense to add registers for hwdom or guest domain. */
> +    if ( d->domain_id >= DOMID_FIRST_RESERVED )
> +        return 0;

This check is redundant, isn't it? Because it is already checked by the
caller?


> +    if ( is_hardware_domain(d) )
> +        rc = add_bar_handlers(pdev, true);
> +    else
> +        rc = add_bar_handlers(pdev, false);

NIT:

  rc = add_bar_handlers(pdev, is_hardware_domain(d));

