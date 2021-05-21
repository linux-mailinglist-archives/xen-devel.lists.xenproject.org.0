Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6238C06A
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 09:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131150.245272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzHX-00078N-BP; Fri, 21 May 2021 07:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131150.245272; Fri, 21 May 2021 07:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzHX-00075J-7m; Fri, 21 May 2021 07:09:15 +0000
Received: by outflank-mailman (input) for mailman id 131150;
 Fri, 21 May 2021 07:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qZ6I=KQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljzHW-00075B-Dw
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 07:09:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a34dee3b-569b-483e-9970-04c1d595f8fe;
 Fri, 21 May 2021 07:09:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6094ABED;
 Fri, 21 May 2021 07:09:12 +0000 (UTC)
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
X-Inumbo-ID: a34dee3b-569b-483e-9970-04c1d595f8fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621580952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TsMbFp7m4npdtuj+D1y0vmkSecJLSvOEkXcaz5d1N1U=;
	b=hYdHwiZqVUaRxid3TsxSWmZD9jkl8cnQAVNqphOoM1LEUeFh9LfOY0kEV0sPoFQSjtqmXz
	idnabPxg6Z8fplZN8gwE/mKGM/7usa5XsO6qO4hvcgjbTr1E6cOmv3sPfBdhba/XGjNHUO
	3WBdvDecK4oNmQYuIEOXUj9eMGC6qkg=
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
 <4389b5be-7d23-31d7-67e0-0068cba79934@suse.com>
 <VE1PR08MB521538B39E6290BBA0842F97F7299@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc03d9d9-227a-0788-1a88-b35a77f5f18d@suse.com>
Date: Fri, 21 May 2021 09:09:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521538B39E6290BBA0842F97F7299@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.05.2021 08:41, Penny Zheng wrote:
> Hi Jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 7:23 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
>>
>> On 18.05.2021 10:57, Penny Zheng wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, May 18, 2021 3:35 PM
>>>>
>>>> On 18.05.2021 07:21, Penny Zheng wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -2447,6 +2447,9 @@ int assign_pages(
>>>>>      {
>>>>>          ASSERT(page_get_owner(&pg[i]) == NULL);
>>>>>          page_set_owner(&pg[i], d);
>>>>> +        /* use page_set_reserved_owner to set its reserved domain owner.
>>>> */
>>>>> +        if ( (pg[i].count_info & PGC_reserved) )
>>>>> +            page_set_reserved_owner(&pg[i], d);
>>>>
>>>> Now this is puzzling: What's the point of setting two owner fields to
>>>> the same value? I also don't recall you having introduced
>>>> page_set_reserved_owner() for x86, so how is this going to build there?
>>>>
>>>
>>> Thanks for pointing out that it will fail on x86.
>>> As for the same value, sure, I shall change it to domid_t domid to record its
>> reserved owner.
>>> Only domid is enough for differentiate.
>>> And even when domain get rebooted, struct domain may be destroyed, but
>>> domid will stays The same.
>>
>> Will it? Are you intending to put in place restrictions that make it impossible
>> for the ID to get re-used by another domain?
>>
>>> Major user cases for domain on static allocation are referring to the
>>> whole system are static, No runtime creation.
>>
>> Right, but that's not currently enforced afaics. If you would enforce it, it may
>> simplify a number of things.
>>
>>>>> @@ -2509,6 +2512,56 @@ struct page_info *alloc_domheap_pages(
>>>>>      return pg;
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * Allocate nr_pfns contiguous pages, starting at #start, of static
>>>>> +memory,
>>>>> + * then assign them to one specific domain #d.
>>>>> + * It is the equivalent of alloc_domheap_pages for static memory.
>>>>> + */
>>>>> +struct page_info *alloc_domstatic_pages(
>>>>> +        struct domain *d, unsigned long nr_pfns, paddr_t start,
>>>>> +        unsigned int memflags)
>>>>> +{
>>>>> +    struct page_info *pg = NULL;
>>>>> +    unsigned long dma_size;
>>>>> +
>>>>> +    ASSERT(!in_irq());
>>>>> +
>>>>> +    if ( memflags & MEMF_no_owner )
>>>>> +        memflags |= MEMF_no_refcount;
>>>>> +
>>>>> +    if ( !dma_bitsize )
>>>>> +        memflags &= ~MEMF_no_dma;
>>>>> +    else
>>>>> +    {
>>>>> +        dma_size = 1ul << bits_to_zone(dma_bitsize);
>>>>> +        /* Starting address shall meet the DMA limitation. */
>>>>> +        if ( dma_size && start < dma_size )
>>>>> +            return NULL;
>>>>
>>>> It is the entire range (i.e. in particular the last byte) which needs
>>>> to meet such a restriction. I'm not convinced though that DMA width
>>>> restrictions and static allocation are sensible to coexist.
>>>>
>>>
>>> FWIT, if starting address meets the limitation, the last byte, greater
>>> than starting address shall meet it too.
>>
>> I'm afraid I don't know what you're meaning to tell me here.
>>
> 
> Referring to alloc_domheap_pages, if `dma_bitsize` is none-zero value, 
> it will use  alloc_heap_pages to allocate pages from [dma_zone + 1,
> zone_hi], `dma_zone + 1` pointing to address larger than 2^(dma_zone + 1).
> So I was setting address limitation for the starting address.   

But does this zone concept apply to static pages at all?

Jan

