Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D27F1824
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637069.992772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56mx-0006mc-DX; Mon, 20 Nov 2023 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637069.992772; Mon, 20 Nov 2023 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56mx-0006kb-9Q; Mon, 20 Nov 2023 16:06:19 +0000
Received: by outflank-mailman (input) for mailman id 637069;
 Mon, 20 Nov 2023 16:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r56mw-0006kV-31
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:06:18 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc5e215f-87be-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 17:06:16 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so6044752e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 08:06:16 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 az30-20020adfe19e000000b00332c36b6563sm5496221wrb.101.2023.11.20.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 08:06:16 -0800 (PST)
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
X-Inumbo-ID: bc5e215f-87be-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700496376; x=1701101176; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdwP2KnwV3r+qdjUG+P5rZTetHQuycAJTio1w6dKjLI=;
        b=T1J7OzaUYyBwZO025cDvo8zA9CHKzyf3LJ/pafXO4XSosodqWm2ETKSG6RcGlUfH3/
         ESfYZQyA7TIyQzaDj28hmQRakqqxURjyj540o4bud5QCCv9O2oCrjxkAZLfKJmgCMuGj
         AdnKe9KvR987l1eE1e/sYcNF1gif7aPf1C+B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496376; x=1701101176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdwP2KnwV3r+qdjUG+P5rZTetHQuycAJTio1w6dKjLI=;
        b=sAwhj9+UcNN4KN2g8LeAqjEVyQuPz+LC6AgqRD5wyiOc84ea/7XI1t6kIUk0a4Z7zW
         /250Qsb92MW5xTZvDGB3DYVcy7QJbzBTg2FZyFkeD8SqQhhL8U79xvxKhdqP7Vd2+MDj
         c7H6FIplDhAsF11pk0GJeP4S91/XSDBlx1kjtynpHrmGrbgKLVk3AALDATu47tvM32e7
         EnzSTQDMhEOvhyhLq8xBowmos6Q47Q5vw0+Mzr9rr1Lqml87cm8ok10/yPg9XrEKwacg
         DNR90DJUV6d8EbkEzBg+fp+i/56MDt8d8yf29KYiYwz4tYDHDnzDJEweIEj/dvIB30/r
         je3g==
X-Gm-Message-State: AOJu0YyWsSXUxX9WNS5jmLmaXzPI9HQzALuKxrNg7jhp5b0amwyjeMqT
	oZ2JMQHS5KFbKf8f+TQnb2H+Eg==
X-Google-Smtp-Source: AGHT+IH5EhfS6lOKW17ESUTlI0600QtjBJ9924vu0cwA+8cEUm2CRxoJlhLdlCqFaro34NW0dgmQ6g==
X-Received: by 2002:a05:6512:b11:b0:509:3806:b80 with SMTP id w17-20020a0565120b1100b0050938060b80mr7335878lfu.53.1700496376308;
        Mon, 20 Nov 2023 08:06:16 -0800 (PST)
Date: Mon, 20 Nov 2023 17:06:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 07/17] vpci/header: implement guest BAR register
 handlers
Message-ID: <ZVuD9wJuqxhL_XOk@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-8-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-8-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:16PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> All empty, IO and ROM BARs for guests are emulated by returning 0 on
> reads and ignoring writes: this BARs are special with this respect as
> their lower bits have special meaning, so returning default ~0 on read
> may confuse guest OS.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> In v10:
> - ull -> ULL to be MISRA-compatbile
> - Use PAGE_OFFSET() instead of combining with ~PAGE_MASK
> - Set type of empty bars to VPCI_BAR_EMPTY
> In v9:
> - factored-out "fail" label introduction in init_bars()
> - replaced #ifdef CONFIG_X86 with IS_ENABLED()
> - do not pass bars[i] to empty_bar_read() handler
> - store guest's BAR address instead of guests BAR register view
> Since v6:
> - unify the writing of the PCI_COMMAND register on the
>   error path into a label
> - do not introduce bar_ignore_access helper and open code
> - s/guest_bar_ignore_read/empty_bar_read
> - update error message in guest_bar_write
> - only setup empty_bar_read for IO if !x86
> Since v5:
> - make sure that the guest set address has the same page offset
>   as the physical address on the host
> - remove guest_rom_{read|write} as those just implement the default
>   behaviour of the registers not being handled
> - adjusted comment for struct vpci.addr field
> - add guest handlers for BARs which are not handled and will otherwise
>   return ~0 on read and ignore writes. The BARs are special with this
>   respect as their lower bits have special meaning, so returning ~0
>   doesn't seem to be right
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 137 +++++++++++++++++++++++++++++++++-----
>  xen/include/xen/vpci.h    |   3 +
>  2 files changed, 123 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 33db58580c..40d1a07ada 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -477,6 +477,74 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void cf_check guest_bar_write(const struct pci_dev *pdev,
> +                                     unsigned int reg, uint32_t val, void *data)

In case we want to add handlers for IO BARs in the future, might be
better to name this guest_mem_bar_write() (or some similar name that
makes it clear applies to the memory BARs only).

> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_addr = bar->guest_addr;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +    }

Shouldn't writes to the BAR be refused when bar->enabled is set?
Otherwise the bar->guest_addr address would get out of sync with the
mappings created on the p2m, and memory decoding disabling (BAR
unmapping) won't work as expected.

> +
> +    guest_addr &= ~(0xffffffffULL << (hi ? 32 : 0));
> +    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    /* Allow guest to size BAR correctly */
> +    guest_addr &= ~(bar->size - 1);
> +
> +    /*
> +     * Make sure that the guest set address has the same page offset
> +     * as the physical address on the host or otherwise things won't work as
> +     * expected.
> +     */
> +    if ( guest_addr != ~(bar->size -1 )  &&
                                      ^ nit: missing space
> +         PAGE_OFFSET(guest_addr) != PAGE_OFFSET(bar->addr) )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: ignored BAR %zu write attempting to change page offset\n",
> +                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;

I think this will trigger on valid sizing attempts if the guest writes
the low part of the address before having updated the high one first
in case of 64bit BARs?

Reading the PCI Local Bus Spec 3.0 I don't see any restriction in
which the write of ~0 should be performed in order to size the BARs
(see the Implementation Note in section 6.2.5.1.)

So I think wrong offset can only be detected when the BAR map is
attempted to be established in the p2m, in modify_bars().

> +    }
> +
> +    bar->guest_addr = guest_addr;
> +}
> +
> +static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    uint32_t reg_val;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        return bar->guest_addr >> 32;
> +    }
> +
> +    reg_val = bar->guest_addr;
> +    reg_val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32 :
> +                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
> +    reg_val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +
> +    return reg_val;
> +}
> +
> +static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    return 0;
> +}
> +
>  static void cf_check rom_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -537,6 +605,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> @@ -578,8 +647,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>                  goto fail;
>              continue;
> @@ -588,7 +659,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          val = pci_conf_read32(pdev->sbdf, reg);
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
> -            bars[i].type = VPCI_BAR_IO;

Why are you removing this assignment?

This would leave the BAR with type VPCI_BAR_EMPTY on x86, which I
don't think will cause issues right now, but it's not correct either.

> +            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, NULL);
> +                if ( rc )
> +                {
> +                    bars[i].type = VPCI_BAR_EMPTY;
> +                    goto fail;

I'm confused as to why it matters setting the BAR type for the failure
path.

> +                }
> +            }
> +
>              continue;
>          }
>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> @@ -605,6 +686,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( size == 0 )
>          {
>              bars[i].type = VPCI_BAR_EMPTY;
> +
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, NULL);
> +                if ( rc )
> +                    goto fail;
> +            }
> +
>              continue;
>          }
>  
> @@ -612,28 +702,41 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
>              goto fail;
>      }
>  
> -    /* Check expansion ROM. */
> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> -    if ( rc > 0 && size )
> +    /* TODO: Check expansion ROM, we do not handle ROM for guests for now. */

Nit: it would be better to place the TODO comment in the else branch
that applied to the !is_hwdom case.

Thanks, Roger.

