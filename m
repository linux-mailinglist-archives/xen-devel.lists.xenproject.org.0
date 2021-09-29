Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FD41C067
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198788.352470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUia-00063E-3x; Wed, 29 Sep 2021 08:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198788.352470; Wed, 29 Sep 2021 08:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUia-000616-0L; Wed, 29 Sep 2021 08:13:32 +0000
Received: by outflank-mailman (input) for mailman id 198788;
 Wed, 29 Sep 2021 08:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpj4=OT=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVUiX-000610-WB
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:13:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 20a20022-20fd-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:13:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 889C46D;
 Wed, 29 Sep 2021 01:13:28 -0700 (PDT)
Received: from [10.57.23.68] (unknown [10.57.23.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78FE63F793;
 Wed, 29 Sep 2021 01:13:26 -0700 (PDT)
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
X-Inumbo-ID: 20a20022-20fd-11ec-bcdf-12813bfff9fa
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
Date: Wed, 29 Sep 2021 10:13:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125501.234252-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the host bridge in the hardware domain.
> This way hardware doamin sees physical BAR values and guest sees
> emulated ones.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - s/MSI/MSI-X in comments
> ---
>  xen/drivers/vpci/header.c | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 9c603d26d302..bdd18599b205 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -30,6 +30,10 @@
>  
>  struct map_data {
>      struct domain *d;
> +    /* Start address of the BAR as seen by the guest. */
> +    gfn_t start_gfn;
> +    /* Physical start address of the BAR. */
> +    mfn_t start_mfn;
>      bool map;
>  };
>  
> @@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>                       unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    gfn_t start_gfn;
>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Any BAR may have holes in its memory we want to map, e.g.
> +         * we don't want to map MSI-X regions which may be a part of that BAR,
> +         * e.g. when a single BAR is used for both MMIO and MSI-X.
> +         * In this case MSI-X regions are subtracted from the mapping, but
> +         * map->start_gfn still points to the very beginning of the BAR.
> +         * So if there is a hole present then we need to adjust start_gfn
> +         * to reflect the fact of that substraction.
> +         */
> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
> +
> +        printk(XENLOG_G_DEBUG
> +               "%smap [%lx, %lx] -> %#"PRI_gfn" for d%d\n",
> +               map->map ? "" : "un", s, e, gfn_x(start_gfn),
> +               map->d->domain_id);
>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed
> @@ -52,8 +72,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, start_gfn,
> +                                         size, _mfn(s))
> +                      : unmap_mmio_regions(map->d, start_gfn,
> +                                           size, _mfn(s));
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -69,6 +91,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>          ASSERT(rc < size);
>          *c += rc;
>          s += rc;
> +        gfn_add(map->start_gfn, rc);
>          if ( general_preempt_check() )
>                  return -ERESTART;
>      }
> @@ -149,6 +172,10 @@ bool vpci_process_pending(struct vcpu *v)
>              if ( !bar->mem )
>                  continue;
>  
> +            data.start_gfn = is_hardware_domain(v->vpci.pdev->domain) ?
> +                _gfn(PFN_DOWN(bar->addr)) :
> +                _gfn(PFN_DOWN(bar->guest_addr));
I believe this would look better with the following alignment:
data.start_gfn = is_hardware_domain(v->vpci.pdev->domain)
                 ? _gfn(PFN_DOWN(bar->addr))
                 : _gfn(PFN_DOWN(bar->guest_addr));
> +            data.start_mfn = _mfn(PFN_DOWN(bar->addr));
>              rc = rangeset_consume_ranges(bar->mem, map_range, &data);
>  
>              if ( rc == -ERESTART )
> @@ -194,6 +221,10 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>          if ( !bar->mem )
>              continue;
>  
> +        data.start_gfn = is_hardware_domain(d) ?
> +            _gfn(PFN_DOWN(bar->addr)) :
> +            _gfn(PFN_DOWN(bar->guest_addr));
This one also.
> +        data.start_mfn = _mfn(PFN_DOWN(bar->addr));
>          while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
>                                                &data)) == -ERESTART )
>              process_pending_softirqs();
> 

Cheers,
Michal

