Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA947F2D11
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 13:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637799.993844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Po1-0002Cu-Ji; Tue, 21 Nov 2023 12:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637799.993844; Tue, 21 Nov 2023 12:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Po1-0002Ad-Fd; Tue, 21 Nov 2023 12:24:41 +0000
Received: by outflank-mailman (input) for mailman id 637799;
 Tue, 21 Nov 2023 12:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5Po0-0002AX-AW
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 12:24:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f085e3b4-8868-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 13:24:39 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso25061955e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 04:24:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b004042dbb8925sm20988119wmi.38.2023.11.21.04.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:24:37 -0800 (PST)
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
X-Inumbo-ID: f085e3b4-8868-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700569478; x=1701174278; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQeT6KKUkQy9CM8Hn9Dp8XvubCgVcIJ6EBj14432r1s=;
        b=EXBMcYGpTnGW2j/WFZgUJIWBb52+fywjnNTBAmJ0tf4BloSeiFVW/qP7Duw7X8hWTT
         xyYGtcoDO+0zYHSz17duLYHG8+WlE+4i7KiYE2kG+yvcjsI3xexCY0S025QLa314wGvC
         xJOHiC8mEr51vMf/SmLyatIjywd8Zhb8Kt9N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700569478; x=1701174278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQeT6KKUkQy9CM8Hn9Dp8XvubCgVcIJ6EBj14432r1s=;
        b=PGxJx+QhHlJkheXoVsM6LUEZwJueEtkYPSI62rBgaTgubwQ7ATwbON4uGqf57Kc6G6
         xL+jnbL71BE8v3oRvHzdIUTiR0W9BZddZ8BgYKYXiUkCWumNaPUvAfH8pKjvpR6Hed+F
         /vsaqs5G/vBBVxs6YknJjG9acr0uqBcYp2rTl1NtRV1YX7UuaMLrtQU34xpDdUtWhCIM
         llDnwbkqdEkLabxG5CmdcuqSaUp6PzZcnIDElGS9dmSCZGIde6S2QFo2kMNp0Wal/GaQ
         oTrWTUUv+/lbdUsOyqxRciOpX3pzMSjl/hVJpqD57LeYwYICE4ceBiCgmWksq4N4sdZh
         ZDNg==
X-Gm-Message-State: AOJu0Ywtkp730T6QCMLTd4+TIPh59xQBfJMMWbelHaY+d2L8XfsPOfyW
	FU31MnDhDDB/zPxvu070VyRHZF4D7WEXssjbzWY=
X-Google-Smtp-Source: AGHT+IH8v9ni+jzRsBZ4FEmzQoOBeJSAqPmC98tu7Hht1uR8MKuUijARUOJOMi/nvzNSd5hjrw0jPw==
X-Received: by 2002:a05:600c:4ec8:b0:409:5580:bc9f with SMTP id g8-20020a05600c4ec800b004095580bc9fmr8118656wmq.34.1700569478387;
        Tue, 21 Nov 2023 04:24:38 -0800 (PST)
Date: Tue, 21 Nov 2023 13:24:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 11/17] vpci/header: program p2m with guest BAR view
Message-ID: <ZVyhhcJagG-OCMNn@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-12-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-12-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:17PM +0000, Volodymyr Babchuk wrote:
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
>  xen/drivers/vpci/header.c | 53 ++++++++++++++++++++++++++++-----------
>  xen/include/xen/vpci.h    |  3 ++-
>  2 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 5c056923ad..efce0bc2ae 100644
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
> @@ -40,11 +41,21 @@ static int cf_check map_range(
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
>  
>          if ( !iomem_access_permitted(map->d, s, e) )

This check must be switched to use host physical addresses (mfns), not
the guest ones, same for the xsm_iomem_mapping() check just below.

>          {
> @@ -72,8 +83,8 @@ static int cf_check map_range(
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
> @@ -82,8 +93,9 @@ static int cf_check map_range(
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
> +                   map->map ? "" : "un", s, e, mfn_x(map_mfn),
> +                   mfn_x(map_mfn) + size, map->d, rc);
>              break;
>          }
>          ASSERT(rc < size);
> @@ -162,10 +174,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
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
> @@ -184,6 +192,11 @@ bool vpci_process_pending(struct vcpu *v)
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
> @@ -234,7 +247,6 @@ bool vpci_process_pending(struct vcpu *v)
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              uint16_t cmd)
>  {
> -    struct map_data data = { .d = d, .map = true };
>      struct vpci_header *header = &pdev->vpci->header;
>      int rc = 0;
>      unsigned int i;
> @@ -244,6 +256,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(bar->mem) )
>              continue;
> @@ -311,12 +324,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
> @@ -336,11 +353,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start_guest, end_guest);

I think you will have to add a check here to ensure that guest and
host address use the same page offset, as it's AFAICT not possible to
do so from the BAR write handler like you have it in patch 10.

>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
> -                   start, end, rc);
> +                   start_guest, end_guest, rc);
>              return rc;
>          }
>  
> @@ -357,7 +374,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              {
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
> -                        &pdev->sbdf, start, end, rc);
> +                        &pdev->sbdf, start_guest, end_guest, rc);

Don't you need to also adjust the call to rangeset_remove_range()
above this error message to use {start,end}_guest instead of
{start,end}?

Thanks, Roger.

