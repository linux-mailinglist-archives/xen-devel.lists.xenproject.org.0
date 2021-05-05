Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34137363A
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122911.231886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCpj-0001hF-Li; Wed, 05 May 2021 08:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122911.231886; Wed, 05 May 2021 08:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCpj-0001fM-HR; Wed, 05 May 2021 08:24:39 +0000
Received: by outflank-mailman (input) for mailman id 122911;
 Wed, 05 May 2021 08:24:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leCpi-0001f2-8h
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:24:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293a5942-290a-4657-aed7-7e8127dd1f97;
 Wed, 05 May 2021 08:24:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77758AFE5;
 Wed,  5 May 2021 08:24:36 +0000 (UTC)
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
X-Inumbo-ID: 293a5942-290a-4657-aed7-7e8127dd1f97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620203076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qicOdkTTJPaozAM3rqiyMeblEujBuIYyS6yjkix4UEs=;
	b=lVdT2ySjtWxou3MzRuufORMTIrZ1IcoKyRWmeDhhijWVEODDZUcPIkWirM7B6xuJk2zw6x
	iM/8PkfqJQTX4Jjt12F6XU5xHiH+ddJxJ95T4iqEDfsADVyTQsI619N/0GjY9pOIqFcbbA
	X3qa9P3yU3FGCKnrrpfoz2VaP2uzGxM=
Subject: Re: [PATCH] public/gnttab: relax v2 recommendation
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
 <8eac6f09-4d1d-6fcc-4218-8c9a0760a6bb@xen.org>
 <71e61d09-5d92-94dc-ae0c-ce09cb49b4ce@suse.com>
 <c468856b-8ac6-2ab1-0f5f-eabc26d47293@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51c29a91-8659-7525-a565-5b9fcfc935f3@suse.com>
Date: Wed, 5 May 2021 10:24:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c468856b-8ac6-2ab1-0f5f-eabc26d47293@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.05.2021 10:12, Julien Grall wrote:
> Hi Jan,
> 
> On 30/04/2021 09:36, Jan Beulich wrote:
>> On 30.04.2021 10:19, Julien Grall wrote:
>>> On 29/04/2021 14:10, Jan Beulich wrote:
>>>> With there being a way to disable v2 support, telling new guests to use
>>>> v2 exclusively is not a good suggestion.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/include/public/grant_table.h
>>>> +++ b/xen/include/public/grant_table.h
>>>> @@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
>>>>     */
>>>>    
>>>>    /*
>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>> - * for backwards compatibility.  New guests should use version 2.
>>>> + * Version 1 of the grant table entry structure is maintained largely for
>>>> + * backwards compatibility.  New guests are recommended to support using
>>>> + * version 2 to overcome version 1 limitations, but to be able to fall back
>>>> + * to version 1.
>>>
>>> v2 is not supported on Arm and I don't see it coming anytime soon.
>>> AFAIK, Linux will also not use grant table v2 unless the guest has a
>>> address space larger than 44 (?) bits.
>>
>> Yes, as soon as there are frame numbers not representable in 32 bits.
>>
>>> I can't remember why Linux decided to not use it everywhere, but this is
>>> a sign that v2 is not always desired.
>>>
>>> So I think it would be better to recommend new guest to use v1 unless
>>> they hit the limitations (to be details).
>>
>> IOW you'd prefer s/be able to fall back/default/? I'd be fine that way
> 
> Yes.

Okay, I've changed that part, but ...

> We would also need to document the limitations as they don't seem 
> to be (clearly?) written down in the headers.

... I'm struggling to see where (and perhaps even why) this would be
needed. The v1 and v2 grant table entry formats are all there. I'm
inclined to consider this an orthogonal addition to make by whoever
thinks such an addition is needed in the first place.

Jan

