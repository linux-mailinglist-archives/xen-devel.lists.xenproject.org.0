Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07181BB2A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 16:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659023.1028487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLD7-000582-GB; Thu, 21 Dec 2023 15:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659023.1028487; Thu, 21 Dec 2023 15:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLD7-00054p-Cl; Thu, 21 Dec 2023 15:43:45 +0000
Received: by outflank-mailman (input) for mailman id 659023;
 Thu, 21 Dec 2023 15:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGLD5-00053V-JY
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 15:43:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fbc7ba-a017-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 16:43:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so9573655e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 07:43:41 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c502a00b0040b3d8907fesm3753889wmr.29.2023.12.21.07.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:43:40 -0800 (PST)
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
X-Inumbo-ID: b6fbc7ba-a017-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703173420; x=1703778220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXlQF84QXS6cjJLFyjIJx+Sr3p4N4XR1RbdfG6mL2mU=;
        b=gS/qMba8xge2Jfx8b5ZDV3fan2WjZUaj4/y2OttQ/Txfp7plz0Eaf76eKb1Hx+hvrH
         e8SwDw9sOTFl97MUERSirWLXfIq2YPPPpQvGzP6ezL4VKoSH/HqSA5OHmZ1DU6JqpppW
         eEi20QuXIJxfgVeHkyxr5ItaBsO69itWmtUWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173420; x=1703778220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXlQF84QXS6cjJLFyjIJx+Sr3p4N4XR1RbdfG6mL2mU=;
        b=QxI/j5acZkZEeCf5cC1yWTiUz1h8T53QgKf2MxgTRHLaC9/bM7AIOFLmldmfXf4XIv
         DIJAqMq++nnmSG4+6LfjS7CEUh/zVg7+wy7iEdulh5rnRmj1fyLzp5C/bPZVYoSUc6Ia
         0QaSdDI6s/Fswn59VSX8qhu9jG9Pw4UwzHY/6KgKQvr0jZj14Lge3NsMF/m6kyqXDZgN
         yl2GGat74eSHUv43ORIvFAiA0iCpE3P3NqsvNTkqJTVEAE1+A7gXkeYewO8b/tS4dT0N
         UgJ98wBHwARwPyLPGuRvmLoSWdz0NUG3+QCADlYcVAJ+0YrmQxAtIv5m6BIgub6XTvEo
         DWOg==
X-Gm-Message-State: AOJu0YxQCylckfnCLzc05lptJNEA0PI0pWPhg6XGQlgES0jvvxn0Va5E
	5ht9YlL+ZafafBDXZL+wMots4w==
X-Google-Smtp-Source: AGHT+IEZfzLD0ATVWJt3bi67fJHTfYo5MD7AI9MmMiTdqU9EzEhVKZKTHTZ5lmJBeAYT+8+hOZnYgA==
X-Received: by 2002:a05:600c:601d:b0:40c:343b:fead with SMTP id az29-20020a05600c601d00b0040c343bfeadmr753583wmb.79.1703173420501;
        Thu, 21 Dec 2023 07:43:40 -0800 (PST)
Date: Thu, 21 Dec 2023 16:43:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v11 07/17] vpci/header: implement guest BAR register
 handlers
Message-ID: <ZYRdKyxo6kfkijOF@macbook>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-8-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231202012556.2012281-8-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:27:04AM +0000, Volodymyr Babchuk wrote:
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
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Just a couple of nits.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> In v11:
> - Access guest_addr after adjusting for MEM64_HI bar in
> guest_bar_write()
> - guest bar handlers renamed and now  _mem_ part to denote
> that they are handling only memory BARs
> - refuse to update guest BAR address if BAR is enabled
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
>  xen/drivers/vpci/header.c | 135 +++++++++++++++++++++++++++++++++-----
>  xen/include/xen/vpci.h    |   3 +
>  2 files changed, 122 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e6a1d58c42..43216429d9 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -477,6 +477,75 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> +                                         unsigned int reg, uint32_t val,
> +                                         void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_addr;
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
> +
> +    guest_addr = bar->guest_addr;
> +    guest_addr &= ~(0xffffffffULL << (hi ? 32 : 0));
> +    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    /* Allow guest to size BAR correctly */
> +    guest_addr &= ~(bar->size - 1);
> +
> +    /*
> +     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> +     * writes as long as the BAR is not mapped into the p2m.
> +     */
> +    if ( bar->enabled )
> +    {
> +        /* If the value written is the current one avoid printing a warning. */
> +        if ( guest_addr != bar->guest_addr )
> +            gprintk(XENLOG_WARNING,
> +                    "%pp: ignored guest BAR %zu write while mapped\n",
> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;
> +    }
> +    bar->guest_addr = guest_addr;
> +}
> +
> +static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
> +                                            unsigned int reg, void *data)
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
> @@ -537,6 +606,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> @@ -578,8 +648,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 :
> +                                                        guest_mem_bar_read,

Nit: I would usually indent this as:

is_hwdom ? vpci_hw_read32
         : guest_mem_bar_read,

> +                                   is_hwdom ? bar_write : guest_mem_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>                  goto fail;
>  
> @@ -590,6 +663,14 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, NULL);
> +                if ( rc )
> +                    goto fail;
> +            }
> +
>              continue;
>          }
>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> @@ -606,6 +687,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
> @@ -613,28 +703,41 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_read,
> +                               is_hwdom ? bar_write : guest_mem_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
>              goto fail;
>      }
>  
> -    /* Check expansion ROM. */
> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);

Nit: I guess you could do something like:

rc = is_hwdom ? pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM)
              : 0;

And that would avoid having to re-indent the whole block?

You could still place the domU code on an else ( !is_hwdom ) branch.

Overall I'm not sure what I prefer, as the re-indentation would be
better done in a non-functional change IMO.

Thanks, Roger.

