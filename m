Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037AAC85AD
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 02:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000325.1380639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKnea-00029c-5b; Fri, 30 May 2025 00:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000325.1380639; Fri, 30 May 2025 00:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKnea-00027s-23; Fri, 30 May 2025 00:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1000325;
 Fri, 30 May 2025 00:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z72a=YO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKneZ-00027m-61
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 00:31:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66165a4a-3ced-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 02:31:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0ED035C5C5C;
 Fri, 30 May 2025 00:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8905C4CEE7;
 Fri, 30 May 2025 00:31:13 +0000 (UTC)
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
X-Inumbo-ID: 66165a4a-3ced-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748565074;
	bh=gXMZ2q5QGavScEzwe/E57YBvwBVge8+b+q0afY1rlwY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GIjwvwzuBGUwlzhZK50sMeRUB29xXX5ccbX63mGV1faOf/oMTBEzCIVTkswNLvpmt
	 Zy6q7f7o3ud3VIzmREPLx9t0UotemhoBhq7EoFyNiXg7R777F/2E7sBf/Pdscu0Fbh
	 D3JUPuBfJWQFLuUPjM3z6utqKVPwFIXUBXIVjl5WNR3FgPM79f/9SzHXZ5Odzho6rY
	 Y1BWUZTtLJ4X9TVwNoKVjQUho3LSjecT7dv9xNWbSlYew50IEcNclOo/fgVTewdpK2
	 buIJtDBLkIuTZzLaFDwMgjfj31Q7kpNC3BJOwmgObV1Mlobmt4zjBU1NLtMoMJSM7Q
	 e+uu31JuJ5frQ==
Date: Thu, 29 May 2025 17:31:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 6/6] tools/arm: exclude iomem from domU extended
 regions
In-Reply-To: <20250508132040.532898-7-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505291731040.135336@ubuntu-linux-20-04-desktop>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com> <20250508132040.532898-7-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Stewart Hildebrand wrote:
> When a device is passed through to a xl domU, the iomem ranges may
> overlap with the extended regions. Remove iomem from extended regions.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Not sure if we need a Fixes: tag, but if we do:
> Fixes: 57f87857dc2d ("libxl/arm: Add handling of extended regions for DomU")
> 
> v1->v2:
> * no change
> ---
>  tools/libs/light/libxl_arm.c | 118 +++++++++++++++++++++++++++++------
>  1 file changed, 99 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 75c811053c7c..8ae16a1726fc 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -798,6 +798,8 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +#define MAX_NR_EXT_REGIONS   256
> +
>  static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>                                  const libxl_version_info *vers)
>  {
> @@ -821,7 +823,7 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>       */
>      res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>                                         GUEST_ROOT_SIZE_CELLS,
> -                                       GUEST_RAM_BANKS + 1);
> +                                       MAX_NR_EXT_REGIONS + 1);
>      if (res) return res;
>  
>      /*
> @@ -1517,17 +1519,29 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
>  
>  #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
>  
> -static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
> +static int compare_iomem(const void *a, const void *b)
> +{
> +    const libxl_iomem_range *x = a, *y = b;
> +
> +    if (x->gfn < y->gfn)
> +        return -1;
> +    if (x->gfn > y->gfn)
> +        return 1;
> +    return 0;
> +}
> +
> +static int finalize_hypervisor_node(libxl__gc *gc,
> +                                    libxl_domain_build_info *b_info,
> +                                    struct xc_dom_image *dom)
>  {
>      void *fdt = dom->devicetree_blob;
> -    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
> -        bankend[GUEST_RAM_BANKS];
> +    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
>      uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> -                  (GUEST_RAM_BANKS + 1)];
> +                  (MAX_NR_EXT_REGIONS + 1)];
>      be32 *cells = &regs[0];
>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> -    unsigned int i, len, nr_regions = 0;
> +    unsigned int i, j, len, nr_regions = 0;
>      libxl_dominfo info;
>      int offset, rc;
>  
> @@ -1542,20 +1556,90 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>      if (info.gpaddr_bits > 64)
>          return ERROR_INVAL;
>  
> +    qsort(b_info->iomem, b_info->num_iomem, sizeof(libxl_iomem_range),
> +          compare_iomem);
> +
>      /*
>       * Try to allocate separate 2MB-aligned extended regions from the first
>       * and second RAM banks taking into the account the maximum supported
>       * guest physical address space size and the amount of memory assigned
>       * to the guest.
>       */
> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> -        region_base[i] = bankbase[i] +
> +    for (i = 0; i < GUEST_RAM_BANKS && nr_regions < MAX_NR_EXT_REGIONS; i++) {
> +        struct {
> +            uint64_t start;
> +            uint64_t end; /* inclusive */
> +        } unallocated;
> +        uint64_t size = 0;
> +
> +        unallocated.start = bankbase[i] +
>              ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
>  
> -        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
> -        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
> -        if (bankend[i] > region_base[i])
> -            region_size[i] = bankend[i] - region_base[i] + 1;
> +        unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
> +        unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
> +
> +        if (unallocated.end > unallocated.start)
> +            size = unallocated.end - unallocated.start + 1;
> +
> +        if (size < EXT_REGION_MIN_SIZE)
> +            continue;
> +
> +        /* Exclude iomem */
> +        for (j = 0; j < b_info->num_iomem && nr_regions < MAX_NR_EXT_REGIONS;
> +             j++) {
> +            struct {
> +                uint64_t start;
> +                uint64_t end; /* inclusive */
> +            } iomem;
> +
> +            iomem.start = b_info->iomem[j].gfn << XC_PAGE_SHIFT;
> +            iomem.end = ((b_info->iomem[j].gfn + b_info->iomem[j].number)
> +                         << XC_PAGE_SHIFT) - 1;
> +
> +            if (iomem.end >= unallocated.start
> +                && iomem.start <= unallocated.end) {
> +
> +                if (iomem.start <= unallocated.start) {
> +                    unallocated.start = iomem.end + 1;
> +
> +                    if (iomem.end >= unallocated.end)
> +                        /* Complete overlap, discard unallocated region */
> +                        break;
> +
> +                    /* Beginning overlap */
> +                    continue;
> +                }
> +
> +                if (iomem.start > unallocated.start) {
> +                    assert(unallocated.end > unallocated.start);
> +                    size = iomem.start - unallocated.start;
> +
> +                    if (size >= EXT_REGION_MIN_SIZE) {
> +                        region_base[nr_regions] = unallocated.start;
> +                        region_size[nr_regions] = size;
> +                        nr_regions++;
> +                    }
> +
> +                    unallocated.start = iomem.end + 1;
> +
> +                    if (iomem.end >= unallocated.end)
> +                        /* End overlap, discard remaining unallocated region */
> +                        break;
> +                }
> +            }
> +        }
> +
> +        if (unallocated.end > unallocated.start
> +            && nr_regions < MAX_NR_EXT_REGIONS)
> +        {
> +            size = unallocated.end - unallocated.start + 1;
> +
> +            if (size >= EXT_REGION_MIN_SIZE) {
> +                region_base[nr_regions] = unallocated.start;
> +                region_size[nr_regions] = size;
> +                nr_regions++;
> +            }
> +        }
>      }
>  
>      /*
> @@ -1565,16 +1649,12 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>      set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>                GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>  
> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> -        if (region_size[i] < EXT_REGION_MIN_SIZE)
> -            continue;
> -
> +    for (i = 0; i < nr_regions; i++) {
>          LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
> -            nr_regions, region_base[i], region_base[i] + region_size[i]);
> +            i, region_base[i], region_base[i] + region_size[i]);
>  
>          set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>                    region_base[i], region_size[i]);
> -        nr_regions++;
>      }
>  
>      if (!nr_regions)
> @@ -1626,7 +1706,7 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>  
>      }
>  
> -    res = finalize_hypervisor_node(gc, dom);
> +    res = finalize_hypervisor_node(gc, &d_config->b_info, dom);
>      if (res)
>          return res;
>  
> -- 
> 2.49.0
> 
> 

