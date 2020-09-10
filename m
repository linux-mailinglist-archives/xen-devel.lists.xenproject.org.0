Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790732647E0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNQr-0003gl-K5; Thu, 10 Sep 2020 14:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGNQq-0003gg-N3
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:20:12 +0000
X-Inumbo-ID: 19ffdb04-2e3b-4a47-bf83-9b137dcae866
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19ffdb04-2e3b-4a47-bf83-9b137dcae866;
 Thu, 10 Sep 2020 14:20:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB5C3B313;
 Thu, 10 Sep 2020 14:20:26 +0000 (UTC)
Subject: Re: [PATCH v5 7/8] iommu: remove the share_p2m operation
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-8-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44d46ebd-1cdd-e7f9-5902-69be32bdb3ff@suse.com>
Date: Thu, 10 Sep 2020 16:20:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-8-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 09:40, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -318,6 +318,48 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
>      return pte_maddr;
>  }
>  
> +static uint64_t domain_pgd_maddr(struct domain *d, unsigned int nr_pt_levels)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +    uint64_t pgd_maddr;
> +    unsigned int agaw;
> +
> +    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> +
> +    if ( iommu_use_hap_pt(d) )
> +    {
> +        mfn_t pgd_mfn =
> +            pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
> +
> +        return pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));

I thought I had already asked about this odd going through a pagetable_t
a 2nd time without a clear need. Why not simply

    if ( iommu_use_hap_pt(d) )
    {
        pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));

        return pagetable_get_paddr(pgt);
    }

?

> +    }
> +
> +    if ( !hd->arch.vtd.pgd_maddr )
> +    {
> +        addr_to_dma_page_maddr(d, 0, 1);

Ahead of this, would you mind retaining ...

> @@ -1340,37 +1382,18 @@ int domain_context_mapping_one(
>      if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
>      {
>          context_set_translation_type(*context, CONTEXT_TT_PASS_THRU);
> -        agaw = level_to_agaw(iommu->nr_pt_levels);
>      }
>      else
>      {
>          spin_lock(&hd->arch.mapping_lock);
>  
> -        /* Ensure we have pagetables allocated down to leaf PTE. */
> -        if ( hd->arch.vtd.pgd_maddr == 0 )
> +        pgd_maddr = domain_pgd_maddr(domain, iommu->nr_pt_levels);
> +        if ( !pgd_maddr )
>          {
> -            addr_to_dma_page_maddr(domain, 0, 1);

... the comment you remove here?

With these adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

