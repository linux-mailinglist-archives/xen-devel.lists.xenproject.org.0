Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA6C81BB69
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 17:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659035.1028507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLSi-0000Ge-6C; Thu, 21 Dec 2023 15:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659035.1028507; Thu, 21 Dec 2023 15:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLSi-0000E0-35; Thu, 21 Dec 2023 15:59:52 +0000
Received: by outflank-mailman (input) for mailman id 659035;
 Thu, 21 Dec 2023 15:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGLSg-0000CO-MA
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 15:59:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f8b23e-a019-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 16:59:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so12586045e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 07:59:45 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b0040b36050f1bsm3738627wmq.44.2023.12.21.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:59:44 -0800 (PST)
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
X-Inumbo-ID: f5f8b23e-a019-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703174385; x=1703779185; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=89EqVM+ZexFDRDW1LeTn2+bO2/osMV/uENoW2Z6+XY4=;
        b=b2HkiJ8tRo7xIzb8M5CxTYE9T1UOOhFx4mgSSkLpRHpWZijuzjmjxht+5PXERfzYKw
         drZLncX5omMtumdGEK6U88vQOKuPv/eWzQAV1pf1Q7qEVpguN7sNcYYQo2WhjtHg9RLQ
         22GJU0jcbi7Ot+IJWWHGhXF+nZyj7Fhiwpr4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703174385; x=1703779185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89EqVM+ZexFDRDW1LeTn2+bO2/osMV/uENoW2Z6+XY4=;
        b=TW5kxLWR/p6AL6z1Icwiw6d/G4D+y4G6OdvRWfjj/CwWp49u5th8njZ6rEqnv1K6ox
         B7SyFxLiV80BqbHAIZQPbExF1o0uKLkR6O5yFYR54qtrbfGuQ8K5mWiU3Jd6mE/Igl1z
         9iceAdYODkQ7m/5nhLiOo9showIaTxqib47WT1jGlQM/OuOTuEotnayVZ8H1HMw5trgz
         CRrZidH0cf1jzEvSv9bFX19nooCxm6r6VL6bkdccqXR+zlX+7fvX2FWVAgecbztb6J+y
         S+aFzRWyT3oG4+3pos+IMYpbhAcEd9i3QmQmDMvqlyZYbk14YiYM/YM4XZh+pNOoeYOS
         x0KA==
X-Gm-Message-State: AOJu0YwlQQLasZBDJiCJ5KgWx4exSSSZeHGDIg9yQakxJq930JEShpD9
	lbhBUwhltRMl1Bq8KcxoN61bJQ==
X-Google-Smtp-Source: AGHT+IFuS65KrcyGz1gxa+D2358t0rSrh67fg8OLQxKDU/FCYtXQOJhiPgTLUSYNtK5/Msa9OSal0Q==
X-Received: by 2002:a05:600c:4e56:b0:3fe:1fd9:bedf with SMTP id e22-20020a05600c4e5600b003fe1fd9bedfmr688638wmq.11.1703174385116;
        Thu, 21 Dec 2023 07:59:45 -0800 (PST)
Date: Thu, 21 Dec 2023 16:59:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v11 11/17] vpci/header: program p2m with guest BAR view
Message-ID: <ZYRg75b6mUWvQyr7@macbook>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-12-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231202012556.2012281-12-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:27:05AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value.
> This way hardware domain sees physical BAR values and guest sees
> emulated ones.
> 
> Hardware domain continues getting the BARs identity mapped, while for
> domUs the BARs are mapped at the requested guest address without
> modifying the BAR address in the device PCI config space.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> In v11:
> - Add vmsix_guest_table_addr() and vmsix_guest_table_base() functions
>   to access guest's view of the VMSIx tables.
> - Use MFN (not GFN) to check access permissions
> - Move page offset check to this patch
> - Call rangeset_remove_range() with correct parameters
> In v10:
> - Moved GFN variable definition outside the loop in map_range()
> - Updated printk error message in map_range()
> - Now BAR address is always stored in bar->guest_addr, even for
>   HW dom, this removes bunch of ugly is_hwdom() checks in modify_bars()
> - vmsix_table_base() now uses .guest_addr instead of .addr
> In v9:
> - Extended the commit message
> - Use bar->guest_addr in modify_bars
> - Extended printk error message in map_range
> - Moved map_data initialization so .bar can be initialized during declaration
> Since v5:
> - remove debug print in map_range callback
> - remove "identity" from the debug print
> Since v4:
> - moved start_{gfn|mfn} calculation into map_range
> - pass vpci_bar in the map_data instead of start_{gfn|mfn}
> - s/guest_addr/guest_reg
> Since v3:
> - updated comment (Roger)
> - removed gfn_add(map->start_gfn, rc); which is wrong
> - use v->domain instead of v->vpci.pdev->domain
> - removed odd e.g. in comment
> - s/d%d/%pd in altered code
> - use gdprintk for map/unmap logs
> Since v2:
> - improve readability for data.start_gfn and restructure ?: construct
> Since v1:
>  - s/MSI/MSI-X in comments
> ---
>  xen/drivers/vpci/header.c | 79 +++++++++++++++++++++++++++++----------
>  xen/include/xen/vpci.h    | 13 +++++++
>  2 files changed, 73 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 7c84cee5d1..21b3fb5579 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -33,6 +33,7 @@
>  
>  struct map_data {
>      struct domain *d;
> +    const struct vpci_bar *bar;
>      bool map;
>  };
>  
> @@ -40,13 +41,24 @@ static int cf_check map_range(
>      unsigned long s, unsigned long e, void *data, unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    /* Start address of the BAR as seen by the guest. */
> +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
> +    /* Physical start address of the BAR. */
> +    mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        mfn_t map_mfn = mfn_add(start_mfn, s - start_gfn);
> +        unsigned long m_end = mfn_x(map_mfn) + size - 1;
>  
> -        if ( !iomem_access_permitted(map->d, s, e) )
> +        if ( !iomem_access_permitted(map->d, mfn_x(map_mfn), m_end) )
>          {
>              printk(XENLOG_G_WARNING
>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
> @@ -54,7 +66,8 @@ static int cf_check map_range(
>              return -EPERM;
>          }
>  
> -        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
> +        rc = xsm_iomem_mapping(XSM_HOOK, map->d, mfn_x(map_mfn), m_end,
> +                               map->map);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING
> @@ -72,8 +85,8 @@ static int cf_check map_range(
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, map_mfn)
> +                      : unmap_mmio_regions(map->d, _gfn(s), size, map_mfn);
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -82,8 +95,9 @@ static int cf_check map_range(
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
> +                   map->map ? "" : "un", s, e, mfn_x(map_mfn),
> +                   mfn_x(map_mfn) + size, map->d, rc);

Seeing the amount of mfn_x calls, it might be better to do the
calculations as unsigned long, and use _mfn() in the
{,un}map_mmio_regions() calls.

>              break;
>          }
>          ASSERT(rc < size);
> @@ -162,10 +176,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  bool vpci_process_pending(struct vcpu *v)
>  {
>      struct pci_dev *pdev = v->vpci.pdev;
> -    struct map_data data = {
> -        .d = v->domain,
> -        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -    };
>      struct vpci_header *header = NULL;
>      unsigned int i;
>  
> @@ -185,6 +195,11 @@ bool vpci_process_pending(struct vcpu *v)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = {
> +            .d = v->domain,
> +            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .bar = bar,
> +        };
>          int rc;
>  
>          if ( rangeset_is_empty(bar->mem) )
> @@ -235,7 +250,6 @@ bool vpci_process_pending(struct vcpu *v)
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              uint16_t cmd)
>  {
> -    struct map_data data = { .d = d, .map = true };
>      struct vpci_header *header = &pdev->vpci->header;
>      int rc = 0;
>      unsigned int i;
> @@ -245,6 +259,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(bar->mem) )
>              continue;
> @@ -310,12 +325,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * First fill the rangesets with the BAR of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
> +     *
> +     * For non-hardware domain we use guest physical addresses.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +        unsigned long start_guest = PFN_DOWN(bar->guest_addr);
> +        unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
>          if ( !bar->mem )
>              continue;
> @@ -335,11 +354,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start, end);
> +        /*
> +         * Make sure that the guest set address has the same page offset
> +         * as the physical address on the host or otherwise things won't work as
> +         * expected.
> +         */
> +        if ( PAGE_OFFSET(bar->guest_addr) != PAGE_OFFSET(bar->addr) )
> +        {
> +            gprintk(XENLOG_G_WARNING,
> +                    "%pp: Can't map BAR%d because of page offset mismatch: %lx vs %lx\n",
> +                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
> +                    PAGE_OFFSET(bar->addr));
> +            return -EINVAL;
> +        }
> +
> +        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
> -                   start, end, rc);
> +                   start_guest, end_guest, rc);
>              return rc;
>          }
>  
> @@ -351,12 +384,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              if ( rangeset_is_empty(prev_bar->mem) )
>                  continue;
>  
> -            rc = rangeset_remove_range(prev_bar->mem, start, end);
> +            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
>              if ( rc )
>              {
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
> -                        &pdev->sbdf, start, end, rc);
> +                        &pdev->sbdf, start_guest, end_guest, rc);
>                  return rc;
>              }
>          }
> @@ -365,8 +398,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      /* Remove any MSIX regions if present. */
>      for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
>      {
> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> +        unsigned long start = PFN_DOWN(vmsix_guest_table_addr(pdev->vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_guest_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
>          for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
> @@ -424,8 +457,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>              {
>                  const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
> -                unsigned long start = PFN_DOWN(remote_bar->addr);
> -                unsigned long end = PFN_DOWN(remote_bar->addr +
> +                unsigned long start = PFN_DOWN(remote_bar->guest_addr);
> +                unsigned long end = PFN_DOWN(remote_bar->guest_addr +
>                                               remote_bar->size - 1);
>  
>                  if ( !remote_bar->enabled )
> @@ -512,6 +545,8 @@ static void cf_check bar_write(
>      struct vpci_bar *bar = data;
>      bool hi = false;
>  
> +    ASSERT(is_hardware_domain(pdev->domain));
> +
>      if ( bar->type == VPCI_BAR_MEM64_HI )
>      {
>          ASSERT(reg > PCI_BASE_ADDRESS_0);
> @@ -542,6 +577,10 @@ static void cf_check bar_write(
>       */
>      bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
>      bar->addr |= (uint64_t)val << (hi ? 32 : 0);
> +    /*
> +     * Update guest address as well, so hardware domain sees BAR identity mapped
> +     */
> +    bar->guest_addr = bar->addr;
>  
>      /* Make sure Xen writes back the same value for the BAR RO bits. */
>      if ( !hi )
> @@ -793,6 +832,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          }
>  
>          bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> @@ -814,6 +854,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>              rom->type = VPCI_BAR_ROM;
>              rom->size = size;
>              rom->addr = addr;
> +            rom->guest_addr = addr;

I think you are missing updating guest_addr also in rom_write()?

>              header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>                                    PCI_ROM_ADDRESS_ENABLE;
>  
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 18a0eca3da..c39fab4832 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -205,6 +205,19 @@ static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
>             (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
>  }
>  
> +static inline paddr_t vmsix_guest_table_base(const struct vpci *vpci,
> +                                             unsigned int nr)
> +{
> +    return (vpci->header.bars[vpci->msix->tables[nr] &
> +           PCI_MSIX_BIRMASK].guest_addr & PCI_BASE_ADDRESS_MEM_MASK);
> +}
> +
> +static inline paddr_t vmsix_guest_table_addr(const struct vpci *vpci,
> +                                             unsigned int nr)
> +{
> +    return vmsix_guest_table_base(vpci, nr) +
> +           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
> +}

Do we really need guest versions of this?  I was expecting that for
guests those functions should always returns the guest addresses of
the MSI-X structures, which in the dom0 case matches the host address.

If we really need guest specific versions, it's worth mentioning in
the commit message explicitly why.

Thanks, Roger.

