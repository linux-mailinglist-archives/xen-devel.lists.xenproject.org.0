Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A098C3169B6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83642.156166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9r2a-0007JY-FT; Wed, 10 Feb 2021 15:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83642.156166; Wed, 10 Feb 2021 15:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9r2a-0007J9-CN; Wed, 10 Feb 2021 15:04:28 +0000
Received: by outflank-mailman (input) for mailman id 83642;
 Wed, 10 Feb 2021 15:04:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9r2Y-0007J4-W0
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:04:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9r2X-0003N6-MA; Wed, 10 Feb 2021 15:04:25 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9r2X-0000fT-Bz; Wed, 10 Feb 2021 15:04:25 +0000
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
	bh=KOiB/6xxDi9jogBpACkvMAO94VY+jJlBx/xkrOZWoLA=; b=Hc1waZW5aZrAQElmFMEnXp1tRJ
	GstEa7F4EpxlanykFAU3oFMLzo2fr2MD+sojb12XgkAhM/iIlDcqlRUoVcl94JA/JOjH8ut/p1cwy
	UzH8Dpao/i1PHnUMQotnTtqcvv4bYZY8vBo2mYEygNmWCrWjjSXotPKsPdvW4QIFPGa0=;
Subject: Re: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-5-julien@xen.org>
 <62a791cb-a880-4097-5fec-4f728751b58b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <712042bf-bec6-dc0f-67ee-b0807887772f@xen.org>
Date: Wed, 10 Feb 2021 15:04:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <62a791cb-a880-4097-5fec-4f728751b58b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/02/2021 14:32, Jan Beulich wrote:
> On 09.02.2021 16:28, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new IOMMU page-tables allocator will release the pages when
>> relinquish the domain resources. However, this is not sufficient when
>> the domain is dying because nothing prevents page-table to be allocated.
>>
>> iommu_alloc_pgtable() is now checking if the domain is dying before
>> adding the page in the list. We are relying on &hd->arch.pgtables.lock
>> to synchronize d->is_dying.
> 
> As said in reply to an earlier patch, I think suppressing
> (really: ignoring) new mappings would be better.

This is exactly what I suggested in v1 but you wrote:

"Ignoring requests there seems fragile to me. Paul - what are your
thoughts about bailing early from hvm_add_ioreq_gfn() when the
domain is dying?"

Are you know saying that the following snipped would be fine:

if ( d->is_dying )
   return 0;

> You could
> utilize the same lock, but you'd need to duplicate the
> checking in {amd,intel}_iommu_map_page().
> 
> I'm not entirely certain in the case about unmap requests:
> It may be possible to also suppress/ignore them, but this
> may require some further thought.

I think the unmap part is quite risky to d->is_dying because the PCI 
devices may not quiesced and still assigned to the domain.

> 
> Apart from this, just in case we settle on your current
> approach, a few spelling nits:
> 
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>>   
>>   void arch_iommu_domain_destroy(struct domain *d)
>>   {
>> +    /*
>> +     * There should be not page-tables left allocated by the time the
> 
> ... should be no ...
> 
>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>> +     * called unconditionally, so pgtables may be unitialized.
> 
> uninitialized
> 
>> @@ -303,9 +317,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>       unmap_domain_page(p);
>>   
>>       spin_lock(&hd->arch.pgtables.lock);
>> -    page_list_add(pg, &hd->arch.pgtables.list);
>> +    /*
>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>> +     * nothing prevent allocation to happen afterwards. There is no valid
> 
> prevents
> 
>> +     * reasons to continue to update the IOMMU page-tables while the
> 
> reason
> 
>> +     * domain is dying.
>> +     *
>> +     * So prevent page-table allocation when the domain is dying.
>> +     *
>> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
> 
> rely
> 
> Jan
> 

-- 
Julien Grall

