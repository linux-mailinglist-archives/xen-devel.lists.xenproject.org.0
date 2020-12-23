Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC62E1F57
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58476.102870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6nd-0006hK-8N; Wed, 23 Dec 2020 16:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58476.102870; Wed, 23 Dec 2020 16:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6nd-0006gv-4l; Wed, 23 Dec 2020 16:15:41 +0000
Received: by outflank-mailman (input) for mailman id 58476;
 Wed, 23 Dec 2020 16:15:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks6nb-0006gn-IS
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:15:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63940683-3ab9-4399-b66e-86dcf70e4ed6;
 Wed, 23 Dec 2020 16:15:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9852AACF1;
 Wed, 23 Dec 2020 16:15:37 +0000 (UTC)
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
X-Inumbo-ID: 63940683-3ab9-4399-b66e-86dcf70e4ed6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608740137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UD3TiecV8KTtQuZJoK9Hq7/gCbZVr22JSzPjiqdkr5U=;
	b=dbqg/2TfiiXw9wyTuGN4OQfdxPAn6/QndDBEpoMKGxnHQDOKT5g28lv635ei7nnP8qclaR
	8ulWUTGUoJFOwWTsEPh+M3fXyTu5z4daWIlRLb+Fb1m6ex+7KqXDnrG5Kd/fbO4IwHTmsu
	nO0EuN9K2PIQ94AWzHrKZphEyFMsI+Y=
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
 <beb22b59-701e-462c-5080-e99033079204@suse.com>
 <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e897e1bf-9c17-f8a9-274a-673ff7f1a009@suse.com>
Date: Wed, 23 Dec 2020 17:15:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:07, Julien Grall wrote:
> On 23/12/2020 14:34, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The new IOMMU page-tables allocator will release the pages when
>>> relinquish the domain resources. However, this is not sufficient in two
>>> cases:
>>>      1) domain_relinquish_resources() is not called when the domain
>>>      creation fails.
>>
>> Could you remind me of what IOMMU page table insertions there
>> are during domain creation? No memory got allocated to the
>> domain at that point yet, so it would seem to me there simply
>> is nothing to map.
> 
> The P2M is first modified in hvm_domain_initialise():
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04026b9ec>] R iommu_alloc_pgtable+0x11/0x137
> (XEN)    [<ffff82d04025f9f5>] F 
> drivers/passthrough/vtd/iommu.c#addr_to_dma_page_maddr+0x146/0x1d8
> (XEN)    [<ffff82d04025fcc5>] F 
> drivers/passthrough/vtd/iommu.c#intel_iommu_map_page+0x6a/0x14b
> (XEN)    [<ffff82d04026d949>] F iommu_map+0x6d/0x16f
> (XEN)    [<ffff82d04026da71>] F iommu_legacy_map+0x26/0x63
> (XEN)    [<ffff82d040301bdc>] F 
> arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
> (XEN)    [<ffff82d0402f67e7>] F p2m_set_entry+0x91/0x128
> (XEN)    [<ffff82d0402f6b5c>] F 
> arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfe/0x3f7
> (XEN)    [<ffff82d0402f7f4c>] F set_mmio_p2m_entry+0x65/0x6e
> (XEN)    [<ffff82d04029a080>] F 
> arch/x86/hvm/vmx/vmx.c#vmx_domain_initialise+0xf6/0x137
> (XEN)    [<ffff82d0402af421>] F hvm_domain_initialise+0x357/0x4c7

Oh, the infamous APIC access page again.

>>> @@ -305,6 +320,19 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>>           memflags = MEMF_node(hd->node);
>>>   #endif
>>>   
>>> +    /*
>>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>>> +     * nothing prevent allocation to happen afterwards. There is no valid
>>> +     * reasons to continue to update the IOMMU page-tables while the
>>> +     * domain is dying.
>>> +     *
>>> +     * So prevent page-table allocation when the domain is dying. Note
>>> +     * this doesn't fully prevent the race because d->is_dying may not
>>> +     * yet be seen.
>>> +     */
>>> +    if ( d->is_dying )
>>> +        return NULL;
>>> +
>>>       pg = alloc_domheap_page(NULL, memflags);
>>>       if ( !pg )
>>>           return NULL;
>>
>> As said in reply to an earlier patch - with a suitable
>> spin_barrier() you can place your check further down, along the
>> lines of
>>
>>      spin_lock(&hd->arch.pgtables.lock);
>>      if ( likely(!d->is_dying) )
>>      {
>>          page_list_add(pg, &hd->arch.pgtables.list);
>>          p = NULL;
>>      }
>>      spin_unlock(&hd->arch.pgtables.lock);
>>
>>      if ( p )
>>      {
>>          free_domheap_page(pg);
>>          pg = NULL;
>>      }
>>
>> (albeit I'm relatively sure you won't like the re-purposing of
>> p, but that's a minor detail). (FREE_DOMHEAP_PAGE() would be
>> nice to use here, but we seem to only have FREE_XENHEAP_PAGE()
>> so far.)
> 
> In fact I don't mind the re-purposing of p. However, I dislike the 
> allocation and then freeing when the domain is dying.
> 
> I think I prefer the small race introduced (the pages will still be 
> freed) over this solution.

The "will still be freed" is because of the 2nd round of freeing
you add in an earlier patch? I'd prefer to avoid the race to in
turn avoid that 2nd round of freeing.

Jan

