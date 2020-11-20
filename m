Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565572BABE4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 15:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32264.63299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Sx-0002Y3-Ja; Fri, 20 Nov 2020 14:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32264.63299; Fri, 20 Nov 2020 14:32:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Sx-0002Xe-GO; Fri, 20 Nov 2020 14:32:47 +0000
Received: by outflank-mailman (input) for mailman id 32264;
 Fri, 20 Nov 2020 14:32:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg7Sw-0002XZ-8o
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:32:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66ffa606-67d9-49c6-84c8-9344ccc0c705;
 Fri, 20 Nov 2020 14:32:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CF12AC23;
 Fri, 20 Nov 2020 14:32:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg7Sw-0002XZ-8o
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:32:46 +0000
X-Inumbo-ID: 66ffa606-67d9-49c6-84c8-9344ccc0c705
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 66ffa606-67d9-49c6-84c8-9344ccc0c705;
	Fri, 20 Nov 2020 14:32:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605882764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61pizMgb5lNHjux2ICoE/P5vIGQSORAcFMQOpQT2y5k=;
	b=UD9XwTegXfLHTsxDDutZ4zSgys8zFepaDsun53+lySVGOVz0S6QAsfJ6zWXaWWGW2iA/0z
	1uYGu5ycSP07bn9lzahjeK4jutNOWQngTqYkKuaRxMRhs3SpZG1Y1NovzvOyaWD6xdmmBd
	64dGa8WuUI0Wz/H02gArUg+wcfNwwrg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0CF12AC23;
	Fri, 20 Nov 2020 14:32:44 +0000 (UTC)
Subject: Re: [PATCH] amd-iommu: Fix Guest CR3 Table following c/s 3a7947b6901
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>
References: <20201120141951.13742-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc7a4158-2c8e-5aaf-cc68-ab7f15454c77@suse.com>
Date: Fri, 20 Nov 2020 15:32:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120141951.13742-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 15:19, Andrew Cooper wrote:
> "amd-iommu: use a bitfield for DTE" renamed iommu_dte_set_guest_cr3()'s gcr3
> parameter to gcr3_mfn but ended up with an off-by-PAGE_SIZE error when
> extracting bits from the address.
> 
> First of all, get_guest_cr3_from_dte() and iommu_dte_set_guest_cr3()
> are (almost) getters and setters for the same field, so should live together.
> 
> Rename them to dte_{get,set}_gcr3_table() to specifically avoid 'guest_cr3' in
> the name.  This field actually points to a table in memory containing an array
> of guest CR3 values.  As these functions are used for different logical
> indirections, they shouldn't use gfn/mfn terminology for their parameters.
> Switch them to use straight uint64_t full addresses.

All of this still looks to belong to "First of all ..." - did you
mean to have more in here, but forgot to actually put it in?

> --- a/xen/drivers/passthrough/amd/iommu_guest.c
> +++ b/xen/drivers/passthrough/amd/iommu_guest.c
> @@ -68,11 +68,39 @@ static void guest_iommu_disable(struct guest_iommu *iommu)
>      iommu->enabled = 0;
>  }
>  
> -static uint64_t get_guest_cr3_from_dte(struct amd_iommu_dte *dte)
> +/*
> + * The Guest CR3 Table is a table written by the guest kernel, pointing at
> + * gCR3 values for PASID transactions to use.  The Device Table Entry points
> + * at a system physical address.
> + *
> + * However, these helpers deliberately use untyped parameters without
> + * reference to gfn/mfn because they are used both for programming the real
> + * IOMMU, and interpreting a guests programming of its vIOMMU.
> + */
> +static uint64_t dte_get_gcr3_table(const struct amd_iommu_dte *dte)
>  {
>      return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
>              (dte->gcr3_trp_30_15 << 15) |
> -            (dte->gcr3_trp_14_12 << 12)) >> PAGE_SHIFT;
> +            (dte->gcr3_trp_14_12 << 12));
> +}
> +
> +static void dte_set_gcr3_table(struct amd_iommu_dte *dte, uint16_t dom_id,
> +                               uint64_t addr, bool gv, uint8_t glx)
> +{
> +#define GCR3_MASK(hi, lo) (((1ul << ((hi) + 1)) - 1) & ~((1ul << (lo)) - 1))
> +
> +    /* I bit must be set when gcr3 is enabled */
> +    dte->i = true;
> +
> +    dte->gcr3_trp_14_12 = MASK_EXTR(addr, GCR3_MASK(14, 12));
> +    dte->gcr3_trp_30_15 = MASK_EXTR(addr, GCR3_MASK(30, 15));
> +    dte->gcr3_trp_51_31 = MASK_EXTR(addr, GCR3_MASK(51, 31));
> +
> +    dte->domain_id = dom_id;
> +    dte->glx = glx;
> +    dte->gv = gv;
> +
> +#undef GCR3_MASK
>  }

I realize the question is somewhat unrelated, but aren't we updating
a live DTE here? If so, are there no ordering requirements between the
writes? Might be worth putting in barrier(s) right on this occasion.

Jan

