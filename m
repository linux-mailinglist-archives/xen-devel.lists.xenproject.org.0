Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B920A31B9D9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 13:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85235.159811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBdOk-0006Qt-4v; Mon, 15 Feb 2021 12:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85235.159811; Mon, 15 Feb 2021 12:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBdOk-0006QX-1o; Mon, 15 Feb 2021 12:54:42 +0000
Received: by outflank-mailman (input) for mailman id 85235;
 Mon, 15 Feb 2021 12:54:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBdOh-0006QS-Rx
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 12:54:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBdOg-000674-OL; Mon, 15 Feb 2021 12:54:38 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBdOg-0003m2-D5; Mon, 15 Feb 2021 12:54:38 +0000
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
	bh=EijVhNi2kvori+/sMggkz8otUpdHhzbDaoiFWULhLMY=; b=HCEarl/G8nH3TpEbnaIYVdmu6M
	6ZafW0YAejjkJ1+6e0OSwiwwY8gC75dns6PzhcyLt/Lm/5EdhATVETA90p7FuyR/ryzT/C9/VUYOn
	DJVYZhAYKXOfYnwF7EY2JTRNcMpOnNHjaBzSd6XMQ2sMqV+LsGl7k7PJ+eSX5iex7AOU=;
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org>
 <d2485d44-180e-499c-d917-80da3486d98e@suse.com>
 <797ac673-9c7b-ff39-1266-94c96bde0f26@xen.org>
 <d394dc9c-d02c-f24a-7414-ec626ac5e82b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4ddf0f24-0379-e724-84e1-9b296167e000@xen.org>
Date: Mon, 15 Feb 2021 12:54:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d394dc9c-d02c-f24a-7414-ec626ac5e82b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/02/2021 12:36, Jan Beulich wrote:
> On 15.02.2021 12:38, Julien Grall wrote:
>> On 10/02/2021 11:26, Jan Beulich wrote:
>>> On 09.02.2021 16:28, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Currently, the IOMMU page-tables will be populated early in the domain
>>>> creation if the hardware is able to virtualize the local APIC. However,
>>>> the IOMMU page tables will not be freed during early failure and will
>>>> result to a leak.
>>>>
>>>> An assigned device should not need to DMA into the vLAPIC page, so we
>>>> can avoid to map the page in the IOMMU page-tables.
>>>
>>> Here and below, may I ask that you use the correct term "APIC
>>> access page", as there are other pages involved in vLAPIC
>>> handling (in particular the virtual APIC page, which is where
>>> accesses actually go to that translate to the APIC access page
>>> in EPT).
>>>
>>>> This statement is also true for any special pages (the vLAPIC page is
>>>> one of them). So to take the opportunity to prevent the mapping for all
>>>> of them.
>>>
>>> I probably should have realized this earlier, but there is a
>>> downside to this: A guest wanting to core dump itself may want
>>> to dump e.g. shared info and vcpu info pages. Hence ...
>>>
>>>> --- a/xen/include/asm-x86/p2m.h
>>>> +++ b/xen/include/asm-x86/p2m.h
>>>> @@ -919,6 +919,10 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
>>>>    {
>>>>        unsigned int flags;
>>>>    
>>>> +    /* Don't map special pages in the IOMMU page-tables. */
>>>> +    if ( mfn_valid(mfn) && is_special_page(mfn_to_page(mfn)) )
>>>> +        return 0;
>>>
>>> ... instead of is_special_page() I think you want to limit the
>>> check here to seeing whether PGC_extra is set.
>>>
>>> But as said on irc, since this crude way of setting up the APIC
>>> access page is now firmly a problem, I intend to try to redo it.
>>
>> Given this series needs to go in 4.15 (we would introduce a 0-day
>> otherwise), could you clarify whether your patch [1] is intended to
>> replace this one in 4.15?
> 
> Yes, that or a cut down variant (simply moving the invocation of
> set_mmio_p2m_entry()). The more that there the controversy
> continued regarding the adjustment to p2m_get_iommu_flags(). I
> did indicate there that I've dropped it for v2.

Do you have a link to v2? I would like to try with my series.

> 
>> [1] <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
> 
> Given the context I was able to guess what mail you refer to, but
> I would very much like to ask you and anyone else to provide links
> rather than mail IDs as references. Not every mail UI allows
> looking up by ID.
It is pretty trivial nowadays to search for a message by ID online:

https://lore.kernel.org/xen-devel/<message-id>

Cheers,

-- 
Julien Grall

