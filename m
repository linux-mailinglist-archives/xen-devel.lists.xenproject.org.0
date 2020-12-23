Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C042E1F45
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58464.102834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6gF-0005YO-Vt; Wed, 23 Dec 2020 16:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58464.102834; Wed, 23 Dec 2020 16:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6gF-0005Xz-SM; Wed, 23 Dec 2020 16:08:03 +0000
Received: by outflank-mailman (input) for mailman id 58464;
 Wed, 23 Dec 2020 16:08:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks6gE-0005Xu-FL
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:08:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6gD-00025h-Jt; Wed, 23 Dec 2020 16:08:01 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6gD-00076i-7m; Wed, 23 Dec 2020 16:08:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=s+60IexXiUolqy8XRvL8J+jmzDMc6K5mUc89JEwWjJM=; b=Qrl4jxatJGi9Jjne4xMbFbdZK3
	syFb4mN4b97qbPKHoozSCFWkn7a+E3G1EfUFScr6ON5FjO48MigzCrAxvGQ1ypFSKNHcdsFNkXHHu
	nhsEzM0rThDi+b1+NwPcAS6T4g+R6/7j0YUPfr71otBNWwDYi27q741tO1Z/IGMgvwiM=;
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
 <beb22b59-701e-462c-5080-e99033079204@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
Date: Wed, 23 Dec 2020 16:07:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <beb22b59-701e-462c-5080-e99033079204@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/12/2020 14:34, Jan Beulich wrote:
> On 22.12.2020 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new IOMMU page-tables allocator will release the pages when
>> relinquish the domain resources. However, this is not sufficient in two
>> cases:
>>      1) domain_relinquish_resources() is not called when the domain
>>      creation fails.
> 
> Could you remind me of what IOMMU page table insertions there
> are during domain creation? No memory got allocated to the
> domain at that point yet, so it would seem to me there simply
> is nothing to map.

The P2M is first modified in hvm_domain_initialise():

(XEN) Xen call trace:
(XEN)    [<ffff82d04026b9ec>] R iommu_alloc_pgtable+0x11/0x137
(XEN)    [<ffff82d04025f9f5>] F 
drivers/passthrough/vtd/iommu.c#addr_to_dma_page_maddr+0x146/0x1d8
(XEN)    [<ffff82d04025fcc5>] F 
drivers/passthrough/vtd/iommu.c#intel_iommu_map_page+0x6a/0x14b
(XEN)    [<ffff82d04026d949>] F iommu_map+0x6d/0x16f
(XEN)    [<ffff82d04026da71>] F iommu_legacy_map+0x26/0x63
(XEN)    [<ffff82d040301bdc>] F 
arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
(XEN)    [<ffff82d0402f67e7>] F p2m_set_entry+0x91/0x128
(XEN)    [<ffff82d0402f6b5c>] F 
arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfe/0x3f7
(XEN)    [<ffff82d0402f7f4c>] F set_mmio_p2m_entry+0x65/0x6e
(XEN)    [<ffff82d04029a080>] F 
arch/x86/hvm/vmx/vmx.c#vmx_domain_initialise+0xf6/0x137
(XEN)    [<ffff82d0402af421>] F hvm_domain_initialise+0x357/0x4c7
(XEN)    [<ffff82d04031eae7>] F arch_domain_create+0x478/0x4ff
(XEN)    [<ffff82d04020476e>] F domain_create+0x4f2/0x778
(XEN)    [<ffff82d04023b0d2>] F do_domctl+0xb1e/0x18b8
(XEN)    [<ffff82d040311dbf>] F pv_hypercall+0x2f0/0x55f
(XEN)    [<ffff82d040390432>] F lstar_enter+0x112/0x120

> 
>>      2) There is nothing preventing page-table allocations when the
>>      domain is dying.
>>
>> In both cases, this can be solved by freeing the page-tables again
>> when the domain destruction. Although, this may result to an high
>> number of page-tables to free.
> 
> Since I've seen this before in this series, and despite me also
> not being a native speaker, as a nit: I don't think it can
> typically be other than "result in".

I think you are right.

> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2290,7 +2290,7 @@ int domain_relinquish_resources(struct domain *d)
>>   
>>       PROGRESS(iommu_pagetables):
>>   
>> -        ret = iommu_free_pgtables(d);
>> +        ret = iommu_free_pgtables(d, false);
> 
> I suppose you mean "true" here, but I also think the other
> approach (checking for DOMDYING_dead, which you don't seem to
> like very much) is better, if for no other reason than it
> already being used elsewhere.

I think "don't like very much" is an understatement :). There seems to 
be more function using an extra parameter (such as hap_set_allocation() 
which was introduced before your DOMDYING_dead). So I only followed what 
they did.

> 
>> @@ -305,6 +320,19 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>           memflags = MEMF_node(hd->node);
>>   #endif
>>   
>> +    /*
>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>> +     * nothing prevent allocation to happen afterwards. There is no valid
>> +     * reasons to continue to update the IOMMU page-tables while the
>> +     * domain is dying.
>> +     *
>> +     * So prevent page-table allocation when the domain is dying. Note
>> +     * this doesn't fully prevent the race because d->is_dying may not
>> +     * yet be seen.
>> +     */
>> +    if ( d->is_dying )
>> +        return NULL;
>> +
>>       pg = alloc_domheap_page(NULL, memflags);
>>       if ( !pg )
>>           return NULL;
> 
> As said in reply to an earlier patch - with a suitable
> spin_barrier() you can place your check further down, along the
> lines of
> 
>      spin_lock(&hd->arch.pgtables.lock);
>      if ( likely(!d->is_dying) )
>      {
>          page_list_add(pg, &hd->arch.pgtables.list);
>          p = NULL;
>      }
>      spin_unlock(&hd->arch.pgtables.lock);
> 
>      if ( p )
>      {
>          free_domheap_page(pg);
>          pg = NULL;
>      }
> 
> (albeit I'm relatively sure you won't like the re-purposing of
> p, but that's a minor detail). (FREE_DOMHEAP_PAGE() would be
> nice to use here, but we seem to only have FREE_XENHEAP_PAGE()
> so far.)

In fact I don't mind the re-purposing of p. However, I dislike the 
allocation and then freeing when the domain is dying.

I think I prefer the small race introduced (the pages will still be 
freed) over this solution.

Note that Paul's IOMMU series will completely rework the function. So 
this is only temporary.

Cheers,

-- 
Julien Grall

