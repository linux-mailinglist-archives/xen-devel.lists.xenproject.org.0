Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C249A31B95B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 13:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85229.159801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBd7a-0004fx-Kp; Mon, 15 Feb 2021 12:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85229.159801; Mon, 15 Feb 2021 12:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBd7a-0004fX-HN; Mon, 15 Feb 2021 12:36:58 +0000
Received: by outflank-mailman (input) for mailman id 85229;
 Mon, 15 Feb 2021 12:36:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBd7Y-0004fS-No
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 12:36:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1907643d-8205-443d-88be-65ba63d13eed;
 Mon, 15 Feb 2021 12:36:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFB47AC32;
 Mon, 15 Feb 2021 12:36:54 +0000 (UTC)
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
X-Inumbo-ID: 1907643d-8205-443d-88be-65ba63d13eed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613392615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0nUKBi1kY1NyjDocwmWML3EhkrFRPb0UgcYYprp/F4=;
	b=p+TTTVcNIfb5htzy2G/20udAs0rMo2OOx0p9hJKTHLw0jkrtLY9NVCO8yts/4ehdPwx7nt
	Ql+gQzk5vTgfCHLMEU7Tx6jfPSZeBxYPFXwZ4ogeg8q59x9mtn3bwoy1Yw/7edqRAS5Nth
	K1Fh++lVRsjq276m3RXaECrxx3YeHE0=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org>
 <d2485d44-180e-499c-d917-80da3486d98e@suse.com>
 <797ac673-9c7b-ff39-1266-94c96bde0f26@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d394dc9c-d02c-f24a-7414-ec626ac5e82b@suse.com>
Date: Mon, 15 Feb 2021 13:36:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <797ac673-9c7b-ff39-1266-94c96bde0f26@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.02.2021 12:38, Julien Grall wrote:
> On 10/02/2021 11:26, Jan Beulich wrote:
>> On 09.02.2021 16:28, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Currently, the IOMMU page-tables will be populated early in the domain
>>> creation if the hardware is able to virtualize the local APIC. However,
>>> the IOMMU page tables will not be freed during early failure and will
>>> result to a leak.
>>>
>>> An assigned device should not need to DMA into the vLAPIC page, so we
>>> can avoid to map the page in the IOMMU page-tables.
>>
>> Here and below, may I ask that you use the correct term "APIC
>> access page", as there are other pages involved in vLAPIC
>> handling (in particular the virtual APIC page, which is where
>> accesses actually go to that translate to the APIC access page
>> in EPT).
>>
>>> This statement is also true for any special pages (the vLAPIC page is
>>> one of them). So to take the opportunity to prevent the mapping for all
>>> of them.
>>
>> I probably should have realized this earlier, but there is a
>> downside to this: A guest wanting to core dump itself may want
>> to dump e.g. shared info and vcpu info pages. Hence ...
>>
>>> --- a/xen/include/asm-x86/p2m.h
>>> +++ b/xen/include/asm-x86/p2m.h
>>> @@ -919,6 +919,10 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
>>>   {
>>>       unsigned int flags;
>>>   
>>> +    /* Don't map special pages in the IOMMU page-tables. */
>>> +    if ( mfn_valid(mfn) && is_special_page(mfn_to_page(mfn)) )
>>> +        return 0;
>>
>> ... instead of is_special_page() I think you want to limit the
>> check here to seeing whether PGC_extra is set.
>>
>> But as said on irc, since this crude way of setting up the APIC
>> access page is now firmly a problem, I intend to try to redo it.
> 
> Given this series needs to go in 4.15 (we would introduce a 0-day 
> otherwise), could you clarify whether your patch [1] is intended to 
> replace this one in 4.15?

Yes, that or a cut down variant (simply moving the invocation of
set_mmio_p2m_entry()). The more that there the controversy
continued regarding the adjustment to p2m_get_iommu_flags(). I
did indicate there that I've dropped it for v2.

> [1] <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>

Given the context I was able to guess what mail you refer to, but
I would very much like to ask you and anyone else to provide links
rather than mail IDs as references. Not every mail UI allows
looking up by ID.

Jan

