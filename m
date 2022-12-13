Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002664BE3F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461166.719212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cd0-0006fp-9X; Tue, 13 Dec 2022 21:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461166.719212; Tue, 13 Dec 2022 21:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cd0-0006dM-6G; Tue, 13 Dec 2022 21:15:54 +0000
Received: by outflank-mailman (input) for mailman id 461166;
 Tue, 13 Dec 2022 21:15:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Ccy-0006dG-UD
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:15:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Ccy-0003So-D7; Tue, 13 Dec 2022 21:15:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Ccy-0000Y9-6u; Tue, 13 Dec 2022 21:15:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=gjPsJ9WyooZ2dnLJb3vM2kvOmfn14KMOFW08ryIjlUQ=; b=01aLj2cAAuUGy/fbM7h4iWA1BU
	KdGrQZREC1Fleq1eIqYPfVq1uoPMFHJwrxs1phMt82JaQbQnDOisTJ/oYGX96udOBy8qmVjt+7/XU
	yAoM9rtXE9PG0I78jK1ygi5s9UaNSknnRuAzkrS/DBHK8GkSXsRkB5+9ZdvXrLMMIM5Q=;
Message-ID: <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org>
Date: Tue, 13 Dec 2022 21:15:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
Cc: "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm
In-Reply-To: <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2022 19:54, Smith, Jackson wrote:
> Updates xen_pt_update_entry function from xen/arch/arm/mm.c to
> automatically split superpages as needed.
Your signed-off-by is missing.

> ---
>   xen/arch/arm/mm.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 6301752..91b9c2b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -753,8 +753,78 @@ static int create_xen_table(lpae_t *entry)
>   }
>   
>   #define XEN_TABLE_MAP_FAILED 0
> -#define XEN_TABLE_SUPER_PAGE 1
> -#define XEN_TABLE_NORMAL_PAGE 2
> +#define XEN_TABLE_NORMAL_PAGE 1
> +
> +/* More or less taken from p2m_split_superpage, without the p2m stuff */
> +static bool xen_split_superpage(lpae_t *entry, unsigned int level,
> +                                unsigned int target, const unsigned int *offsets)
> +{
> +    struct page_info *page;
> +    lpae_t pte, *table;
> +    unsigned int i;
> +    bool rv = true;
> +
> +    mfn_t mfn = lpae_get_mfn(*entry);
> +    unsigned int next_level = level + 1;
> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
> +
> +    ASSERT(level < target);
> +    ASSERT(lpae_is_superpage(*entry, level));
> +
> +    page = alloc_domheap_page(NULL, 0);
Page-table may be allocated from the boot allocator. So you want to use 
create_xen_table().

> +    if ( !page )
> +        return false;
> +
> +    table = __map_domain_page(page);

You want to use xen_map_table().

> +
> +    /*
> +     * We are either splitting a first level 1G page into 512 second level
> +     * 2M pages, or a second level 2M page into 512 third level 4K pages.
> +     */
> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> +    {
> +        lpae_t *new_entry = table + i;
> +
> +        /*
> +         * Use the content of the superpage entry and override
> +         * the necessary fields. So the correct permission are kept.
> +         */
> +        pte = *entry;
> +        lpae_set_mfn(pte, mfn_add(mfn, i << level_order));
> +
> +        /*
> +         * First and second level pages set walk.table = 0, but third
> +         * level entries set walk.table = 1.
> +         */
> +        pte.walk.table = (next_level == 3);
> +
> +        write_pte(new_entry, pte);
> +    }
> +
> +    /*
> +     * Shatter superpage in the page to the level we want to make the
> +     * changes.
> +     * This is done outside the loop to avoid checking the offset to
> +     * know whether the entry should be shattered for every entry.
> +     */
> +    if ( next_level != target )
> +        rv = xen_split_superpage(table + offsets[next_level],
> +                                 level + 1, target, offsets);
> +
> +    clean_dcache_va_range(table, PAGE_SIZE);

Cleaning the cache is not necessary. This is done in the P2M case 
because it is shared with the IOMMU which may not support coherent access.

> +    unmap_domain_page(table);

This would be xen_map

> +
> +    /*
> +     * Generate the entry for this new table we created,
> +     * and write it back in place of the superpage entry.
> +     */

I am afraid this is not compliant with the Arm Arm. If you want to 
update valid entry (e.g. shattering a superpage), then you need to 
follow the break-before-make sequence. This means that:
   1. Replace the valid entry with an entry with an invalid one
   2. Flush the TLBs
   3. Write the new entry

Those steps will make your code compliant but it also means that a 
virtual address will be temporarily invalid so you could take a fault in 
the middle of your split if your stack or the table was part of the 
region. The same could happen for the other running CPUs but this is 
less problematic as they could spin on the page-table lock.

This is the main reason why we never implemented super-page shattering 
for the hypervisor.

So I would rather prefer if we can avoid shattering (I have made some 
suggestion in the cover letter). If we really need to shatter, then we 
should make sure this is only used in very limited use case by 
introducing a flag. So the caller will be reponsible to acknowledge it 
doesn't modify a region that may be used by itself or another CPU.

> +    pte = mfn_to_xen_entry(page_to_mfn(page), MT_NORMAL);
> +    pte.pt.table = 1;
> +    write_pte(entry, pte);
> +    clean_dcache(*entry);

Ditto about the cache cleaning.

Cheers,

-- 
Julien Grall

