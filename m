Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420FAC3EB7
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 13:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997502.1378348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJWCQ-0000IG-9t; Mon, 26 May 2025 11:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997502.1378348; Mon, 26 May 2025 11:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJWCQ-0000FY-7G; Mon, 26 May 2025 11:40:58 +0000
Received: by outflank-mailman (input) for mailman id 997502;
 Mon, 26 May 2025 11:40:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJWCO-0000FS-Vz
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 11:40:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJWCO-003L8R-12;
 Mon, 26 May 2025 11:40:56 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJWCO-007ZHg-1a;
 Mon, 26 May 2025 11:40:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=5AGsV5efjr3mZOxDQLdBN5qaFWI/pprCRN+A6/BZmdQ=; b=PbuvZjIZkiseEDIdaxNct3g5/D
	+9BnOP+lUaFoZHbF1aP0Owuuaq4LBuxihCpL1yqQoQzRdFERhULXjqYwq5BrtuRyE3aJuk6AdLb7U
	pJb3c82TxtqL/sWB6cydHhMn+7N43jFRE0uEZSRr5rREKlTWzvdWbInFTLbisDioAh08=;
Date: Mon, 26 May 2025 13:40:54 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/2] tools/arm: exclude iomem from domU extended
 regions
Message-ID: <aDRTRgmGNCrP4zh0@l14>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513195452.699600-3-stewart.hildebrand@amd.com>

On Tue, May 13, 2025 at 03:54:50PM -0400, Stewart Hildebrand wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 75c811053c7c..8ae16a1726fc 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
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

Instead of a `continue` and a comment that I don't understand what it is
supposed to mean, you could just do if-else:

if (iomem.start <= unallocated.start) {
    // code before this continue
} else { // we have: iomem.start > unallocated.start
    // the block of code bellow.
}

> +                }
> +
> +                if (iomem.start > unallocated.start) {
> +                    assert(unallocated.end > unallocated.start);

I think this assert should be removed.

Instead, you could check that this property hold true every time there's
a modification to `unallocated.start` in this function.

Maybe one way to make the algo easier to read, and to check that this
property is still true, is to rewrite:

    unallocated.start = iomem.end + 1;
    if (iomem.end >= unallocated.end)
        // discard `unallocated`
        break;

with

    unallocated.start = iomem.end + 1;
    if (unallocated.start > unallocated.end)
        // obvious: all allocated already
        break;

Because checking for:
    iomem.end >= unallocated.end
is the same as checking for:
    iomem.end + 1 > unallocated.end
    unallocated.start > unallocated.end

> +                    size = iomem.start - unallocated.start;

Isn't `size` the size of the unallocated region? Why is it recalculated
with `iomem`? I think it would be better to create a new variable.

> +
> +                    if (size >= EXT_REGION_MIN_SIZE) {
> +                        region_base[nr_regions] = unallocated.start;
> +                        region_size[nr_regions] = size;
> +                        nr_regions++;
> +                    }
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

Shouldn't we print "base + size - 1" for the end address?

Thanks,

-- 
Anthony PERARD

