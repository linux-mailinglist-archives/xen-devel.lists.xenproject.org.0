Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79D22CD89
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 20:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2Mt-0004bF-SL; Fri, 24 Jul 2020 18:24:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jz2Ms-0004bA-84
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:24:26 +0000
X-Inumbo-ID: e703382a-cdda-11ea-a453-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e703382a-cdda-11ea-a453-12813bfff9fa;
 Fri, 24 Jul 2020 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595615065;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ivCc5rAae+Bh4wYGC4+w9YCtlJkwRabBZjJXCziX/Q4=;
 b=NqQMvKM0AysO1+xs7XHp0G/LnE6qdeGuccsBoE7mGc6oqc2FzRsz0DNH
 sDOvEegKUUvurduXnAZ6tUZbgkGi4doJlLXW66ubk4gfTYikrqNtywb3k
 UXN9250U2zc2NwgLBORJ2YyU13QUz6Q5byacUVd+DkmeBvyOkSghhoD/9 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RhSL3m/N3qMC3bIZsCvUEY6lHZXgRDQakIO1tb7xbGIHV0S5CNsM+v3aaaKRV71KCYR4xRjP5G
 xkW0EaWkFbFLfxQ5QuWr0vab2WncTd1XSR8OOdeQE/OetNuH5tIpa/KvjaaUs4SR0qP9Ldqcar
 TiBpcaxQiOneytMAORLP/bYUPIu9RSYxsSzHpyBMJ59EBib0MOxeHfasrijcfQgKN4Eed7r1AM
 mbE9zIDR8yPOUYstvoop3IKW1keN3peiLfHhp9YdIfgBK6t7CcE/w5ktu3+EU21FZS+U8l1Fqn
 8Zk=
X-SBRS: 2.7
X-MesageID: 23343864
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23343864"
Subject: Re: [PATCH 2/6] x86/iommu: add common page-table allocator
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-3-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
Date: Fri, 24 Jul 2020 19:24:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-3-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 17:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Instead of having separate page table allocation functions in VT-d and AMD
> IOMMU code, use a common allocation function in the general x86 code.
> Also, rather than walking the page tables and using a tasklet to free them
> during iommu_domain_destroy(), add allocated page table pages to a list and
> then simply walk the list to free them. This saves ~90 lines of code overall.
>
> NOTE: There is no need to clear and sync PTEs during teardown since the per-
>       device root entries will have already been cleared (when devices were
>       de-assigned) so the page tables can no longer be accessed by the IOMMU.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Oh wow - I don't have any polite words for how that code was organised
before.

Instead of discussing the ~90 lines saved, what about the removal of a
global bottleneck (the tasklet) or expand on the removal of redundant
TLB/cache maintenance?

> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index c386dc4387..fd9b1e7bd5 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -378,64 +380,9 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
>      return reassign_device(pdev->domain, d, devfn, pdev);
>  }
>  
> -static void deallocate_next_page_table(struct page_info *pg, int level)
> -{
> -    PFN_ORDER(pg) = level;
> -    spin_lock(&iommu_pt_cleanup_lock);
> -    page_list_add_tail(pg, &iommu_pt_cleanup_list);
> -    spin_unlock(&iommu_pt_cleanup_lock);
> -}
> -
> -static void deallocate_page_table(struct page_info *pg)
> -{
> -    struct amd_iommu_pte *table_vaddr;
> -    unsigned int index, level = PFN_ORDER(pg);
> -
> -    PFN_ORDER(pg) = 0;
> -
> -    if ( level <= 1 )
> -    {
> -        free_amd_iommu_pgtable(pg);
> -        return;
> -    }
> -
> -    table_vaddr = __map_domain_page(pg);
> -
> -    for ( index = 0; index < PTE_PER_TABLE_SIZE; index++ )
> -    {
> -        struct amd_iommu_pte *pde = &table_vaddr[index];
> -
> -        if ( pde->mfn && pde->next_level && pde->pr )
> -        {
> -            /* We do not support skip levels yet */
> -            ASSERT(pde->next_level == level - 1);
> -            deallocate_next_page_table(mfn_to_page(_mfn(pde->mfn)),
> -                                       pde->next_level);
> -        }
> -    }
> -
> -    unmap_domain_page(table_vaddr);
> -    free_amd_iommu_pgtable(pg);
> -}
> -
> -static void deallocate_iommu_page_tables(struct domain *d)
> -{
> -    struct domain_iommu *hd = dom_iommu(d);
> -
> -    spin_lock(&hd->arch.mapping_lock);
> -    if ( hd->arch.amd_iommu.root_table )
> -    {
> -        deallocate_next_page_table(hd->arch.amd_iommu.root_table,
> -                                   hd->arch.amd_iommu.paging_mode);

I really need to dust off my patch fixing up several bits of dubious
logic, including the name "paging_mode" which is actually simply the
number of levels.

At this point, it will probably be best to get this series in first, and
for me to rebase.

> -        hd->arch.amd_iommu.root_table = NULL;
> -    }
> -    spin_unlock(&hd->arch.mapping_lock);
> -}
> -
> -
>  static void amd_iommu_domain_destroy(struct domain *d)
>  {
> -    deallocate_iommu_page_tables(d);
> +    dom_iommu(d)->arch.amd_iommu.root_table = NULL;
>      amd_iommu_flush_all_pages(d);

Per your NOTE:, shouldn't this flush call be dropped?

> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index a12109a1de..b3c7da0fe2 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -140,11 +140,19 @@ int arch_iommu_domain_init(struct domain *d)
>  
>      spin_lock_init(&hd->arch.mapping_lock);
>  
> +    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
> +    spin_lock_init(&hd->arch.pgtables.lock);
> +
>      return 0;
>  }
>  
>  void arch_iommu_domain_destroy(struct domain *d)
>  {
> +    struct domain_iommu *hd = dom_iommu(d);
> +    struct page_info *pg;
> +
> +    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
> +        free_domheap_page(pg);

Some of those 90 lines saved were the logic to not suffer a watchdog
timeout here.

To do it like this, it needs plumbing into the relinquish resources path.

>  }
>  
>  static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> @@ -257,6 +265,39 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>          return;
>  }
>  
> +struct page_info *iommu_alloc_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +#ifdef CONFIG_NUMA
> +    unsigned int memflags = (hd->node == NUMA_NO_NODE) ?
> +        0 : MEMF_node(hd->node);
> +#else
> +    unsigned int memflags = 0;
> +#endif
> +    struct page_info *pg;
> +    void *p;

The memflags code is very awkward.  How about initialising it to 0, and
having:

#ifdef CONFIG_NUMA
    if ( hd->node != NUMA_NO_NODE )
        memflags = MEMF_node(hd->node);
#endif

here?

> +
> +    BUG_ON(!iommu_enabled);

Is this really necessary?  Can we plausibly end up in this function
otherwise?


Overall, I wonder if this patch would better be split into several.  One
which introduces the common alloc/free implementation, two which switch
the VT-d and AMD implementations over, and possibly one clean-up on the end?

~Andrew

