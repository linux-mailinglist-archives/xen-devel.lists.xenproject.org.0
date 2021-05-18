Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A38387765
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129087.242321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixoh-0007gI-PW; Tue, 18 May 2021 11:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129087.242321; Tue, 18 May 2021 11:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixoh-0007eN-Lw; Tue, 18 May 2021 11:23:15 +0000
Received: by outflank-mailman (input) for mailman id 129087;
 Tue, 18 May 2021 11:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lixog-0007eF-44
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:23:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2910118f-e4b4-4d84-bdd9-9a5f8c485ae2;
 Tue, 18 May 2021 11:23:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A0D9B14A;
 Tue, 18 May 2021 11:23:12 +0000 (UTC)
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
X-Inumbo-ID: 2910118f-e4b4-4d84-bdd9-9a5f8c485ae2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621336992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LHncvE37mvvOoWzc5htVTSDCCpPNb++UpyH4ulyEkU=;
	b=s15lzLOsBL1ZmCC/heO8IdIbOt1wce9wHuu0TvKz7E8zAt/2duCg8Y90o4fghdmNOWuVhb
	rFLWN/Jqgj0EP7U+TjG+xIqZCsk65ut81KESwsdCjcoj3IaRZ3s6/ptPjw7Q/btdHwkMk1
	RE079ALKwngXJfCwhANNmhJwzeBqb4E=
Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4389b5be-7d23-31d7-67e0-0068cba79934@suse.com>
Date: Tue, 18 May 2021 13:23:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 10:57, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 3:35 PM
>>
>> On 18.05.2021 07:21, Penny Zheng wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2447,6 +2447,9 @@ int assign_pages(
>>>      {
>>>          ASSERT(page_get_owner(&pg[i]) == NULL);
>>>          page_set_owner(&pg[i], d);
>>> +        /* use page_set_reserved_owner to set its reserved domain owner.
>> */
>>> +        if ( (pg[i].count_info & PGC_reserved) )
>>> +            page_set_reserved_owner(&pg[i], d);
>>
>> Now this is puzzling: What's the point of setting two owner fields to the same
>> value? I also don't recall you having introduced
>> page_set_reserved_owner() for x86, so how is this going to build there?
>>
> 
> Thanks for pointing out that it will fail on x86.
> As for the same value, sure, I shall change it to domid_t domid to record its reserved owner.
> Only domid is enough for differentiate. 
> And even when domain get rebooted, struct domain may be destroyed, but domid will stays
> The same.

Will it? Are you intending to put in place restrictions that make it
impossible for the ID to get re-used by another domain?

> Major user cases for domain on static allocation are referring to the whole system are static,
> No runtime creation.

Right, but that's not currently enforced afaics. If you would
enforce it, it may simplify a number of things.

>>> @@ -2509,6 +2512,56 @@ struct page_info *alloc_domheap_pages(
>>>      return pg;
>>>  }
>>>
>>> +/*
>>> + * Allocate nr_pfns contiguous pages, starting at #start, of static
>>> +memory,
>>> + * then assign them to one specific domain #d.
>>> + * It is the equivalent of alloc_domheap_pages for static memory.
>>> + */
>>> +struct page_info *alloc_domstatic_pages(
>>> +        struct domain *d, unsigned long nr_pfns, paddr_t start,
>>> +        unsigned int memflags)
>>> +{
>>> +    struct page_info *pg = NULL;
>>> +    unsigned long dma_size;
>>> +
>>> +    ASSERT(!in_irq());
>>> +
>>> +    if ( memflags & MEMF_no_owner )
>>> +        memflags |= MEMF_no_refcount;
>>> +
>>> +    if ( !dma_bitsize )
>>> +        memflags &= ~MEMF_no_dma;
>>> +    else
>>> +    {
>>> +        dma_size = 1ul << bits_to_zone(dma_bitsize);
>>> +        /* Starting address shall meet the DMA limitation. */
>>> +        if ( dma_size && start < dma_size )
>>> +            return NULL;
>>
>> It is the entire range (i.e. in particular the last byte) which needs to meet such
>> a restriction. I'm not convinced though that DMA width restrictions and static
>> allocation are sensible to coexist.
>>
> 
> FWIT, if starting address meets the limitation, the last byte, greater than starting
> address shall meet it too.

I'm afraid I don't know what you're meaning to tell me here.

Jan

