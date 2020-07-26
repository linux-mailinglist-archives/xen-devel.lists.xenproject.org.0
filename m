Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DDD22DD59
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 10:51:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzcMZ-0002o2-HY; Sun, 26 Jul 2020 08:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzcMY-0002nw-28
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:50:30 +0000
X-Inumbo-ID: 0df4d18a-cf1d-11ea-8a03-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0df4d18a-cf1d-11ea-8a03-bc764e2007e4;
 Sun, 26 Jul 2020 08:50:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63ACDAC79;
 Sun, 26 Jul 2020 08:50:37 +0000 (UTC)
Subject: Re: [PATCH 5/6] iommu: remove the share_p2m operation
To: Paul Durrant <paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d005885d-d983-7328-ee36-efd6032e8c96@suse.com>
Date: Sun, 26 Jul 2020 10:50:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-6-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 18:46, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -313,6 +313,26 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
>      return pte_maddr;
>  }
>  
> +static u64 domain_pgd_maddr(struct domain *d)

uint64_t please.

> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +
> +    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> +
> +    if ( iommu_use_hap_pt(d) )
> +    {
> +        mfn_t pgd_mfn =
> +            pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
> +
> +        return pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));
> +    }
> +
> +    if ( !hd->arch.vtd.pgd_maddr )
> +        addr_to_dma_page_maddr(d, 0, 1);
> +
> +    return hd->arch.vtd.pgd_maddr;
> +}
> +
>  static void iommu_flush_write_buffer(struct vtd_iommu *iommu)
>  {
>      u32 val;
> @@ -1347,22 +1367,17 @@ int domain_context_mapping_one(
>      {
>          spin_lock(&hd->arch.mapping_lock);
>  
> -        /* Ensure we have pagetables allocated down to leaf PTE. */
> -        if ( hd->arch.vtd.pgd_maddr == 0 )
> +        pgd_maddr = domain_pgd_maddr(domain);
> +        if ( !pgd_maddr )
>          {
> -            addr_to_dma_page_maddr(domain, 0, 1);
> -            if ( hd->arch.vtd.pgd_maddr == 0 )
> -            {
> -            nomem:
> -                spin_unlock(&hd->arch.mapping_lock);
> -                spin_unlock(&iommu->lock);
> -                unmap_vtd_domain_page(context_entries);
> -                return -ENOMEM;
> -            }
> +        nomem:
> +            spin_unlock(&hd->arch.mapping_lock);
> +            spin_unlock(&iommu->lock);
> +            unmap_vtd_domain_page(context_entries);
> +            return -ENOMEM;
>          }

This renders all calls bogus in shared mode - the function, if
it ended up getting called nevertheless, would then still alloc
the root table. Therefore I'd like to suggest that at least all
its callers get an explicit check. That's really just
dma_pte_clear_one() as it looks.

Jan

