Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046A31DD59
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86344.162058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPi0-0001f5-HB; Wed, 17 Feb 2021 16:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86344.162058; Wed, 17 Feb 2021 16:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPi0-0001eg-Dy; Wed, 17 Feb 2021 16:29:48 +0000
Received: by outflank-mailman (input) for mailman id 86344;
 Wed, 17 Feb 2021 16:29:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCPhz-0001eb-3Y
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:29:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPhx-0007EK-TV; Wed, 17 Feb 2021 16:29:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPhx-00071v-Ic; Wed, 17 Feb 2021 16:29:45 +0000
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
	bh=Ac7GcIC4jmtgcfioE38Gw/EadoejlB+Xws4jOjnk3do=; b=xBvVfLikMwkMQvglC9qBLmYqvm
	DsP+IUfbKVkcw6ZWqVxdlwbHZO0/0xMnYKK/sY2tCSrlpP7bbs9rbn86TN2SzH8+xV1HQmRkHOvs7
	hVk07gw24+TktH2G3pVJQVf1WmUFtUgnabm2nwJ69N9S/8QQX975cQwl0/n6I+kCRF4c=;
Subject: Re: [for-4.15][PATCH v3 3/3] xen/iommu: x86: Harden the IOMMU
 page-table allocator
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-4-julien@xen.org>
 <cf303aee-3d89-5608-f358-6bef5c32d706@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <51618338-daff-5b9a-5214-e0788d95992b@xen.org>
Date: Wed, 17 Feb 2021 16:29:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cf303aee-3d89-5608-f358-6bef5c32d706@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/02/2021 15:13, Jan Beulich wrote:
> On 17.02.2021 15:24, Julien Grall wrote:> --- a/xen/drivers/passthrough/x86/iommu.c> +++ b/xen/drivers/passthrough/x86/iommu.c> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)>  >  void arch_iommu_domain_destroy(struct domain *d)>  {> +    /*> +     * There should be not page-tables left allocated by the time the
> Nit: s/not/no/ ?
> 
>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>> +     * called unconditionally, so pgtables may be unitialized.
>> +     */
>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
>> +           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
>>   }
>>   
>>   static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>> @@ -279,6 +286,9 @@ int iommu_free_pgtables(struct domain *d)
>>        */
>>       hd->platform_ops->clear_root_pgtable(d);
>>   
>> +    /* After this barrier no new page allocations can occur. */
>> +    spin_barrier(&hd->arch.pgtables.lock);
> 
> Didn't patch 2 utilize the call to ->clear_root_pgtable() itself as
> the barrier? Why introduce another one (with a similar comment)
> explicitly now?
The barriers act differently, one will get against any IOMMU page-tables 
modification. The other one will gate against allocation.

There is no guarantee that the former will prevent the latter.

> 
>> @@ -315,9 +326,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>       unmap_domain_page(p);
>>   
>>       spin_lock(&hd->arch.pgtables.lock);
>> -    page_list_add(pg, &hd->arch.pgtables.list);
>> +    /*
>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>> +     * nothing prevent allocation to happen afterwards. There is no valid
>> +     * reasons to continue to update the IOMMU page-tables while the
>> +     * domain is dying.
>> +     *
>> +     * So prevent page-table allocation when the domain is dying.
>> +     *
>> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
>> +     */
>> +    if ( likely(!d->is_dying) )
>> +    {
>> +        alive = true;
>> +        page_list_add(pg, &hd->arch.pgtables.list);
>> +    }
>>       spin_unlock(&hd->arch.pgtables.lock);
>>   
>> +    if ( unlikely(!alive) )
>> +    {
>> +        free_domheap_page(pg);
>> +        pg = NULL;
>> +    }
>> +
>>       return pg;
>>   }
> 
> As before I'm concerned of this forcing error paths to be taken
> elsewhere, in case an allocation still happens (e.g. from unmap
> once super page mappings are supported). Considering some of the
> error handling in the IOMMU code is to invoke domain_crash(), it
> would be quite unfortunate if we ended up crashing a domain
> while it is being cleaned up after.

It is unfortunate, but I think this is better than having to leak page 
tables.

> 
> Additionally, the (at present still hypothetical) unmap case, if
> failing because of the change here, would then again chance to
> leave mappings in place while the underlying pages get freed. As
> this would likely require an XSA, the change doesn't feel like
> "hardening" to me.

I would agree with this if memory allocations could never fail. That's 
not that case and will become worse as we use IOMMU pool.

Do you have callers in mind that doesn't check the returns of iommu_unmap()?

Cheers,


-- 
Julien Grall

