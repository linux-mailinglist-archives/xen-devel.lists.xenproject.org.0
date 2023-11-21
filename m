Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85A7F307F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 15:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637860.993904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RYp-0003S2-Sm; Tue, 21 Nov 2023 14:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637860.993904; Tue, 21 Nov 2023 14:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RYp-0003PY-Pt; Tue, 21 Nov 2023 14:17:07 +0000
Received: by outflank-mailman (input) for mailman id 637860;
 Tue, 21 Nov 2023 14:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5RYo-0003PS-HM
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 14:17:06 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a589bc68-8878-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 15:17:05 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-331733acbacso2655474f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 06:17:05 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfdb52000000b00332cbda1970sm3897396wrj.30.2023.11.21.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:17:03 -0800 (PST)
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
X-Inumbo-ID: a589bc68-8878-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700576224; x=1701181024; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62y2ZmDLdSX/ETrDEr7kJ6JPCn7l30tfvH0bjcp2XU4=;
        b=riaOG9ZvPcDMWD4IOEP2+H8340ffeARfPvif2WE4Fdxvri7uuDT6i9gUM4AhX5KiOH
         MI+WRRo6prUQcqs5zQDil9EABs96lJjxKZKZdKOKcrgwuwn2qfTGtLx3j194hvtEDcVD
         sG0P9PtJRr3h9OL0w6iMHERDqQO6/HJHcPqv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576224; x=1701181024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62y2ZmDLdSX/ETrDEr7kJ6JPCn7l30tfvH0bjcp2XU4=;
        b=b5qDcCdrgCGiTIxZkSUk+51a6ncVlymcQJ49rwYpRIOAenouHcxnigMpKqtYaiF/X5
         zHpjaIMRjT5SR6sHu+GbVTa6iQrHWqr7eCh9wkoSg22eiP1Vdm2gRcEyyYsfTXKYw0DB
         KsGpLERLam8n2ByMwCc+vSI9mI6OYxKCsUdPxqZEegfPuYgF6iz6Z3DZuUnMi853icfc
         Y/Ck45FGjMFqEAq+eJO/bCSrjE7SYhJ9AtApTfHu1JZ516P+MLxk5IHJ8Foh75qqsFvH
         bdVhmBS9deqaJkzslm59OxktNbYC7mL7E8e6UKYi/8ngqN+5TYcgZvlvJDCrdYHanr2n
         FVGg==
X-Gm-Message-State: AOJu0Yz30kt5oif6mKYxRtWj1FBIpgnof+W1YVQsTZGbDhM39c7AG67I
	3OGXZqhk2mwe2UAQqYlOqF+4eA==
X-Google-Smtp-Source: AGHT+IHCTSbM5Yp+s8QNJf0VZJCGYw8WD0T2ekOikTn7s1zGetgmeVO0vJJNgYUOZIC0xjpxH7goOw==
X-Received: by 2002:adf:d1e8:0:b0:32d:87e1:c349 with SMTP id g8-20020adfd1e8000000b0032d87e1c349mr9561911wrd.57.1700576224504;
        Tue, 21 Nov 2023 06:17:04 -0800 (PST)
Date: Tue, 21 Nov 2023 15:17:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <ZVy73iJ3E8nJHvgf@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-13-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:18PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's view of this will want to be zero initially, the host having set
> it to 1 may not easily be overwritten with 0, or else we'd effectively
> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
> proper emulation in order to honor host's settings.
> 
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" the reset state of the command register is typically 0,
> so when assigning a PCI device use 0 as the initial state for the guest's view
> of the command register.
> 
> Here is the full list of command register bits with notes about
> emulation, along with QEMU behavior in the same situation:
> 
> PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
> in real device. Instead it is always set to 1. A guest can write to this
> register, but writes are ignored.
> 
> PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
> Xen case, we handle writes to this bit by mapping/unmapping BAR
> regions. For devices assigned to DomUs, memory decoding will be
> disabled and the initialization.
> 
> PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
> writes to this bit.
> 
> PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
> access to host bridge that supports software generation of special
> cycles. In our case guest has no access to host bridges at all. Value
> after reset is 0. QEMU passes through writes of this bit, we will do
> the same.
> 
> PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
> to be generated. It requires additional configuration via Cacheline
> Size register. We are not emulating this register right now and we
> can't expect guest to properly configure it. QEMU "emulates" access to
> Cachline Size register by ignoring all writes to it. QEMU passes through
> writes of PCI_COMMAND_INVALIDATE bit, we will do the same.
> 
> PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
> through writes of this bit, we will do the same.
> 
> PCI_COMMAND_PARITY - Controls how device response to parity
> errors. QEMU ignores writes to this bit, we will do the same.
> 
> PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
> through writes of this bit, so we will do the same.
> 
> PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
> writes to this bit, we will do the same.
> 
> PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
> transactions. It is configured by firmware, so we don't want guest to
> control it. QEMU ignores writes to this bit, we will do the same.
> 
> PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
> enabled, device is prohibited from asserting INTx as per
> specification. Value after reset is 0. In QEMU case, it checks of INTx
> was mapped for a device. If it is not, then guest can't control
> PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
> change value of this bit if MSI(X) is enabled.

FWIW, bits 11-15 are RsvdP, so we will need to add support for them
after the series from Stewart that adds support for register masks is
accepted.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> In v10:
> - Added cf_check attribute to guest_cmd_read
> - Removed warning about non-zero cmd
> - Updated comment MSI code regarding disabling INTX
> - Used ternary operator in vpci_add_register() call
> - Disable memory decoding for DomUs in init_bars()
> In v9:
> - Reworked guest_cmd_read
> - Added handling for more bits
> Since v6:
> - fold guest's logic into cmd_write
> - implement cmd_read, so we can report emulated INTx state to guests
> - introduce header->guest_cmd to hold the emulated state of the
>   PCI_COMMAND register for guests
> Since v5:
> - add additional check for MSI-X enabled while altering INTX bit
> - make sure INTx disabled while guests enable MSI/MSI-X
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c | 44 +++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/msi.c    |  6 ++++++
>  xen/drivers/vpci/msix.c   |  4 ++++
>  xen/include/xen/vpci.h    |  3 +++
>  4 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index efce0bc2ae..e8eed6a674 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -501,14 +501,32 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      return 0;
>  }
>  
> +/* TODO: Add proper emulation for all bits of the command register. */
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>  {
>      struct vpci_header *header = data;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        const struct vpci *vpci = pdev->vpci;
> +        uint16_t excluded = PCI_COMMAND_PARITY | PCI_COMMAND_SERR |
> +            PCI_COMMAND_FAST_BACK;

You could implement those bits using the RsvdP mask also.

You seem to miss PCI_COMMAND_IO?  In the commit message you note that
writes are ignored, yet here you seem to pass through writes to the
underlying device (which might be OK, but needs to be coherent with
the commit message).

> +
> +        header->guest_cmd = cmd;

I'm kind of unsure whether we want to fake the guest view by returning
what the guest writes.

> +
> +        if ( (vpci->msi && vpci->msi->enabled) ||
> +             (vpci->msix && vpci->msi->enabled) )

The typo that you mentioned about msi vs msix.

> +            excluded |= PCI_COMMAND_INTX_DISABLE;
> +
> +        cmd &= ~excluded;
> +        cmd |= pci_conf_read16(pdev->sbdf, reg) & excluded;
> +    }
> +
>      /*
> -     * Let Dom0 play with all the bits directly except for the memory
> -     * decoding one.
> +     * Let guest play with all the bits directly except for the memory
> +     * decoding one. Bits that are not allowed for DomU are already
> +     * handled above.

I think this should be: "Let Dom0 play with all the bits directly ..."
as you mention both Dom0 and DomU.

>       */
>      if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
>          /*
> @@ -522,6 +540,14 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check guest_cmd_read(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    const struct vpci_header *header = data;
> +
> +    return header->guest_cmd;
> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -737,8 +763,9 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      }
>  
>      /* Setup a handler for the command register. */
> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> -                           2, header);
> +    rc = vpci_add_register(pdev->vpci,
> +                           is_hwdom ? vpci_hw_read16 : guest_cmd_read,
> +                           cmd_write, PCI_COMMAND, 2, header);
>      if ( rc )
>          return rc;
>  
> @@ -750,6 +777,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( cmd & PCI_COMMAND_MEMORY )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
>  
> +    /*
> +     * Clear PCI_COMMAND_MEMORY for DomUs, so they will always start with
> +     * memory decoding disabled and to ensure that we will not call modify_bars()
> +     * at the end of this function.
> +     */
> +    if ( !is_hwdom )
> +        cmd &= ~PCI_COMMAND_MEMORY;

Just for symmetry I would also disable PCI_COMMAND_IO.

I do wonder in which states does SeaBIOS or OVMF expects to find the
devices.

> +    header->guest_cmd = cmd;
> +
>      for ( i = 0; i < num_bars; i++ )
>      {
>          uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 2faa54b7ce..0920bd071f 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,12 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /*
> +         * Make sure guest doesn't enable INTx while enabling MSI.
> +         */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else
>          vpci_msi_arch_disable(msi, pdev);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index b6abab47ef..9d0233d0e3 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -97,6 +97,10 @@ static void cf_check control_write(
>          for ( i = 0; i < msix->max_entries; i++ )
>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>                  update_entry(&msix->entries[i], pdev, i);
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);

Note that if both new_enabled and new_masked are set, you won't get
inside of this condition, and that could lead to MSIX being enabled
with INTx set in the command register (albeit with the maskall bit
set).

You might have to add a new check before the pci_conf_write16() that
disables INTx if `new_enabled && !msix->enabled`.

>      }
>      else if ( !new_enabled && msix->enabled )
>      {
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index c5301e284f..60bdc10c13 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -87,6 +87,9 @@ struct vpci {
>          } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
>          /* At most 6 BARS + 1 expansion ROM BAR. */
>  
> +        /* Guest view of the PCI_COMMAND register. */

Maybe we want to add '(domU only)' to the comment.

Thanks, Roger.

