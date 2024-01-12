Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A482C286
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 16:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666914.1037851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJ7S-0004ZS-Fm; Fri, 12 Jan 2024 15:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666914.1037851; Fri, 12 Jan 2024 15:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJ7S-0004Xm-CL; Fri, 12 Jan 2024 15:06:50 +0000
Received: by outflank-mailman (input) for mailman id 666914;
 Fri, 12 Jan 2024 15:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvc=IW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rOJ7R-0004Xg-D8
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 15:06:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34680595-b15c-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 16:06:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3376f71fcbbso4352599f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 07:06:47 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 a7-20020adff7c7000000b0033660f75d08sm4102402wrq.116.2024.01.12.07.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 07:06:46 -0800 (PST)
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
X-Inumbo-ID: 34680595-b15c-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705072006; x=1705676806; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnA8RRNwAy+RlELZg4RbGOHswEXnMjFsRgVp2iFzVRs=;
        b=wPSTvRSh6HhKqzDDGbPc+0PUiuCe3/dOCyoZ72eWKLs8deHCAQdqsKIz/l7xyZFsyi
         WAQ4HX+Qw01BgsXW5oTsxq9CEMHX9dcG5xMiGl+de8/D6YKQPsJnDszYzw0LwbmU+cjP
         pe+75j02krNaXtO8eEEegT1StqS/lMbzIMU3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705072006; x=1705676806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnA8RRNwAy+RlELZg4RbGOHswEXnMjFsRgVp2iFzVRs=;
        b=V6C/R4ds3e5YxB51nTBQVvLT/wkSbrxqh8rNCQgtW3CwQQYjTO7sSKwrER8sLyxHs/
         8wg9RwQAx3DR7K1tPtI5JmmZkSSL3V4ruyMoTVOvS6n0HMsHYJQWsv1gX0I5ih1GRl/i
         n5+SGoQ/av14l/qkLEjZyGIsRad4wwi7LSEAGHkr1onnH0ySHcQlRQDzbtiD19ySeS8b
         2oxF9L6ZMhtkYaxzVo0sgdURgNjcpT1q71MiMsdTvqobf3XtiTQB0C9FoglgHGckoFaG
         ee4wBQTkTTjgC3gtdfuoQmOIO/WjsOZfIuX/TAXUQBITFf45+/2Y/oq2pwawBkl29G6x
         ksHw==
X-Gm-Message-State: AOJu0YwjrXiOXZSoEPw0DWCGlDzNP5+IfK729qpZQ5GHFKpV5eJjF0lH
	pVaLXHaGooLGGL7Ib5M/O33ExaIDP3Mc7A==
X-Google-Smtp-Source: AGHT+IFGI4QGs8jSgLmFuLnnF4ifiSiceRtNVXTxoLaJ6AqpUPSekFlUHDTtVyv5aZVM+we9+4bJ3Q==
X-Received: by 2002:adf:e3c1:0:b0:336:5d37:866c with SMTP id k1-20020adfe3c1000000b003365d37866cmr475433wrm.82.1705072006339;
        Fri, 12 Jan 2024 07:06:46 -0800 (PST)
Date: Fri, 12 Jan 2024 16:06:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v12 09/15] vpci/header: program p2m with guest BAR view
Message-ID: <ZaFVhaVvpDljEgdM@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109215145.430207-10-stewart.hildebrand@amd.com>

On Tue, Jan 09, 2024 at 04:51:24PM -0500, Stewart Hildebrand wrote:
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
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Some nits and a request to add an extra assert. If you agree:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> In v12:
> - Update guest_addr in rom_write()
> - Use unsigned long for start_mfn and map_mfn to reduce mfn_x() calls
> - Use existing vmsix_table_*() functions
> - Change vmsix_table_base() to use .guest_addr
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
>  xen/drivers/vpci/header.c | 81 +++++++++++++++++++++++++++++++--------
>  xen/include/xen/vpci.h    |  3 +-
>  2 files changed, 66 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index feccd070ddd0..f0b0b64b0929 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -34,6 +34,7 @@
>  
>  struct map_data {
>      struct domain *d;
> +    const struct vpci_bar *bar;
>      bool map;
>  };
>  
> @@ -41,13 +42,24 @@ static int cf_check map_range(
>      unsigned long s, unsigned long e, void *data, unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    /* Start address of the BAR as seen by the guest. */
> +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
> +    /* Physical start address of the BAR. */
> +    unsigned long start_mfn = PFN_DOWN(map->bar->addr);
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
> +        unsigned long map_mfn = start_mfn + s - start_gfn;
> +        unsigned long m_end = map_mfn + size - 1;
>  
> -        if ( !iomem_access_permitted(map->d, s, e) )
> +        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
>          {
>              printk(XENLOG_G_WARNING
>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
> @@ -55,7 +67,8 @@ static int cf_check map_range(
>              return -EPERM;
>          }
>  
> -        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
> +        rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end,
> +                               map->map);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING
> @@ -73,8 +86,8 @@ static int cf_check map_range(
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
> +                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -83,8 +96,9 @@ static int cf_check map_range(
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
> +                   map->map ? "" : "un", s, e, map_mfn,
> +                   map_mfn + size, map->d, rc);
>              break;
>          }
>          ASSERT(rc < size);
> @@ -163,10 +177,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
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
> @@ -186,6 +196,11 @@ bool vpci_process_pending(struct vcpu *v)
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
> @@ -236,7 +251,6 @@ bool vpci_process_pending(struct vcpu *v)
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              uint16_t cmd)
>  {
> -    struct map_data data = { .d = d, .map = true };
>      struct vpci_header *header = &pdev->vpci->header;
>      int rc = 0;
>      unsigned int i;
> @@ -246,6 +260,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(bar->mem) )
>              continue;
> @@ -311,12 +326,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
> @@ -336,11 +355,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }

Should we assert that the BAR rangeset is empty here? To stay on the
safe side.

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
                                           ^u

Also when using the x modifier it's better to also use # to print the
0x prefix.  You can also reduce the length of the message using
s/because of/due to/ IMO:

%pp: Can't map BAR%u due to offset mismatch: %lx vs %lx

> +                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
> +                    PAGE_OFFSET(bar->addr));

Maybe worth printing the whole address?

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
> @@ -352,12 +385,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
> @@ -425,8 +458,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
> @@ -513,6 +546,8 @@ static void cf_check bar_write(
>      struct vpci_bar *bar = data;
>      bool hi = false;
>  
> +    ASSERT(is_hardware_domain(pdev->domain));
> +
>      if ( bar->type == VPCI_BAR_MEM64_HI )
>      {
>          ASSERT(reg > PCI_BASE_ADDRESS_0);
> @@ -543,6 +578,10 @@ static void cf_check bar_write(
>       */
>      bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
>      bar->addr |= (uint64_t)val << (hi ? 32 : 0);
> +    /*
> +     * Update guest address as well, so hardware domain sees BAR identity mapped
> +     */

Can you drop the 'as well' and make this a single line comment?

Otherwise maybe reword to:

Update guest address, so hardware domain BAR is identity mapped.

Sorry, I find it wasteful to have the opening and closing comment
delimiters in separate lines for single line comments.

Thanks, Roger.

