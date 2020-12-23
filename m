Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01042E1F5E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58484.102893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6r8-0006zM-Vv; Wed, 23 Dec 2020 16:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58484.102893; Wed, 23 Dec 2020 16:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6r8-0006z0-SN; Wed, 23 Dec 2020 16:19:18 +0000
Received: by outflank-mailman (input) for mailman id 58484;
 Wed, 23 Dec 2020 16:19:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks6r7-0006yv-6r
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:19:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6r6-0002HU-R7; Wed, 23 Dec 2020 16:19:16 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks6r6-0007pp-Ib; Wed, 23 Dec 2020 16:19:16 +0000
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
	bh=E7ngH0xCBjA58rx+yWP69MxE0tP2V3ZusYLPOG7Sys8=; b=PY03xiM3OjkW2Do1151AJWPvji
	S1G3aEDhU4V0v2dZr/0yZFpGQGkKL9qO0yixyJhbXvAIYX5J/VwGmiprMwY8yQ8GEjlEydsBsr9yl
	Nj7UMLpNiUdE9TsZJi1HaGeUZKmY/jeOpv9NIllWp81e2kWkbHUa0TVLi6kpnNjqxqjk=;
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
 <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
 <e897e1bf-9c17-f8a9-274a-673ff7f1a009@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0ff629b1-25e6-6ce4-43ab-d50af52ecb8c@xen.org>
Date: Wed, 23 Dec 2020 16:19:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e897e1bf-9c17-f8a9-274a-673ff7f1a009@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/12/2020 16:15, Jan Beulich wrote:
> On 23.12.2020 17:07, Julien Grall wrote:
>> On 23/12/2020 14:34, Jan Beulich wrote:
>>> On 22.12.2020 16:43, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The new IOMMU page-tables allocator will release the pages when
>>>> relinquish the domain resources. However, this is not sufficient in two
>>>> cases:
>>>>       1) domain_relinquish_resources() is not called when the domain
>>>>       creation fails.
>>>
>>> Could you remind me of what IOMMU page table insertions there
>>> are during domain creation? No memory got allocated to the
>>> domain at that point yet, so it would seem to me there simply
>>> is nothing to map.
>>
>> The P2M is first modified in hvm_domain_initialise():
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04026b9ec>] R iommu_alloc_pgtable+0x11/0x137
>> (XEN)    [<ffff82d04025f9f5>] F
>> drivers/passthrough/vtd/iommu.c#addr_to_dma_page_maddr+0x146/0x1d8
>> (XEN)    [<ffff82d04025fcc5>] F
>> drivers/passthrough/vtd/iommu.c#intel_iommu_map_page+0x6a/0x14b
>> (XEN)    [<ffff82d04026d949>] F iommu_map+0x6d/0x16f
>> (XEN)    [<ffff82d04026da71>] F iommu_legacy_map+0x26/0x63
>> (XEN)    [<ffff82d040301bdc>] F
>> arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
>> (XEN)    [<ffff82d0402f67e7>] F p2m_set_entry+0x91/0x128
>> (XEN)    [<ffff82d0402f6b5c>] F
>> arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfe/0x3f7
>> (XEN)    [<ffff82d0402f7f4c>] F set_mmio_p2m_entry+0x65/0x6e
>> (XEN)    [<ffff82d04029a080>] F
>> arch/x86/hvm/vmx/vmx.c#vmx_domain_initialise+0xf6/0x137
>> (XEN)    [<ffff82d0402af421>] F hvm_domain_initialise+0x357/0x4c7
> 
> Oh, the infamous APIC access page again.
> 
>>>> @@ -305,6 +320,19 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>>>            memflags = MEMF_node(hd->node);
>>>>    #endif
>>>>    
>>>> +    /*
>>>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>>>> +     * nothing prevent allocation to happen afterwards. There is no valid
>>>> +     * reasons to continue to update the IOMMU page-tables while the
>>>> +     * domain is dying.
>>>> +     *
>>>> +     * So prevent page-table allocation when the domain is dying. Note
>>>> +     * this doesn't fully prevent the race because d->is_dying may not
>>>> +     * yet be seen.
>>>> +     */
>>>> +    if ( d->is_dying )
>>>> +        return NULL;
>>>> +
>>>>        pg = alloc_domheap_page(NULL, memflags);
>>>>        if ( !pg )
>>>>            return NULL;
>>>
>>> As said in reply to an earlier patch - with a suitable
>>> spin_barrier() you can place your check further down, along the
>>> lines of
>>>
>>>       spin_lock(&hd->arch.pgtables.lock);
>>>       if ( likely(!d->is_dying) )
>>>       {
>>>           page_list_add(pg, &hd->arch.pgtables.list);
>>>           p = NULL;
>>>       }
>>>       spin_unlock(&hd->arch.pgtables.lock);
>>>
>>>       if ( p )
>>>       {
>>>           free_domheap_page(pg);
>>>           pg = NULL;
>>>       }
>>>
>>> (albeit I'm relatively sure you won't like the re-purposing of
>>> p, but that's a minor detail). (FREE_DOMHEAP_PAGE() would be
>>> nice to use here, but we seem to only have FREE_XENHEAP_PAGE()
>>> so far.)
>>
>> In fact I don't mind the re-purposing of p. However, I dislike the
>> allocation and then freeing when the domain is dying.
>>
>> I think I prefer the small race introduced (the pages will still be
>> freed) over this solution.
> 
> The "will still be freed" is because of the 2nd round of freeing
> you add in an earlier patch? I'd prefer to avoid the race to in
> turn avoid that 2nd round of freeing.

The "2nd round" of freeing is necessary at least for the domain creation 
failure case (it would be the 1rst round).

If we can avoid IOMMU page-table allocation in the domain creation path, 
then yes I agree that we want to avoid that "2nd round". Otherwise, I 
think it is best to take advantage of it.

Cheers,

-- 
Julien Grall

