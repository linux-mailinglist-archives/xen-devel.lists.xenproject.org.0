Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80005FEC61
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422662.668839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHgm-0008Ka-Op; Fri, 14 Oct 2022 10:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422662.668839; Fri, 14 Oct 2022 10:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHgm-0008Hm-MB; Fri, 14 Oct 2022 10:13:12 +0000
Received: by outflank-mailman (input) for mailman id 422662;
 Fri, 14 Oct 2022 10:13:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojHgl-0008Hg-0e
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:13:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojHgh-0006Iw-Mt; Fri, 14 Oct 2022 10:13:07 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojHgh-0004iR-GC; Fri, 14 Oct 2022 10:13:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XE/CvncOhDKZE/zf+AXzu82N8vm/UN3MSgLt3cuZ0Ts=; b=mLXQgbJeQ12aOnaB2Z6LMaS1T2
	Xmv7dfCpUWi/ngET3QcFSRmSiJvtoECgAncTgqZ+/EL2J5u5st06JR5iPasXJVd2vKOD8Ijcbyhnq
	WkCoXbejW8csGtS+rLpHOocoAwhmVBBAZyYrtVVunwYOIU4+H5hZed08+N4uib0D89jg=;
Message-ID: <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
Date: Fri, 14 Oct 2022 11:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/10/2022 10:28, Henry Wang wrote:
> Hi Jan,
> 
> Thanks for the review.
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
>> arch_domain_create()
>>
>> On 14.10.2022 10:09, Henry Wang wrote:
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>>>           BUG();
>>>       }
>>>
>>> +    /*
>>> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2
>> area
>>> +     * when the domain is created. Considering the worst case for page
>>> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool
>> here.
>>> +     * For GICv3, the above-mentioned P2M mapping is not necessary, but
>> since
>>> +     * the allocated 16 pages here would not be lost, hence populate these
>>> +     * pages unconditionally.
>>> +     */
>>> +    spin_lock(&d->arch.paging.lock);
>>> +    rc = p2m_set_allocation(d, 16, NULL);
>>> +    spin_unlock(&d->arch.paging.lock);
>>> +    if ( rc != 0 )
>>> +        goto fail;
>>
>> Putting this level of knowledge here feels like a layering violation to
>> me. My first suggestion would be to move this call somewhere under
>> p2m_init().
> 
> That is definitely possible. If Julien or other Arm maintainers are not
> against that I am happy to move this to p2m_init() in v3.
I understand both of Jan and your concern. I don't really have a strong 
opinion either way.

You are the author of the patch, so I will let you chose.

> 
> The reason why the above block is placed here is just I thought to use
> d->arch.vgic.version to only populate the 16 pages for GICv2 in the
> beginning, and d->arch.vgic.version is first assigned later after p2m_init(),
> but later we decided to populated the pages unconditionally so actually
> now we can move the part to p2m_init().
> 
>> If that's not possible for some reason, I'd like to suggest
>> passing 1 here as the count and then adding a min-acceptable check to
>> p2m_set_allocation() along the lines of x86'es shadow_set_allocation().
>> That way you'd also guarantee the minimum number of pages in case a
>> subsequent tiny allocation request came in via domctl.

I really dislike this. If the user ask for 1 pages and we only allow 16. 
Then this should be rejected (not bumped to 16).

However, the code in p2m_set_allocation() will only look at the free 
pages (like x86 does). So what you suggest would not do what you want.

>>
>>> @@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
>>>       if ( !p2m->domain )
>>>           return;
>>>
>>> +    if ( !page_list_empty(&p2m->pages) )
>>> +        p2m_teardown(d, false);
>>> +
>>> +    if ( d->arch.paging.p2m_total_pages != 0 )
>>> +    {
>>> +        spin_lock(&d->arch.paging.lock);
>>> +        p2m_set_allocation(d, 0, NULL);
>>> +        spin_unlock(&d->arch.paging.lock);
>>> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
>>> +    }
>>
>> Is it intentional to largely open-code p2m_teardown_allocation() here?
> 
> Yes, AFAICT p2m_teardown_allocation() is preemptible and we don't want
> any preemption here.

Like Jan, I would prefer if we can avoid the duplication. The loop 
suggested by Jan should work.

Cheers,

-- 
Julien Grall

