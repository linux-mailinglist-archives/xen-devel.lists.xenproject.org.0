Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A43738E5
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 12:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123000.232042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFDV-0004ef-Cz; Wed, 05 May 2021 10:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123000.232042; Wed, 05 May 2021 10:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFDV-0004cW-8a; Wed, 05 May 2021 10:57:21 +0000
Received: by outflank-mailman (input) for mailman id 123000;
 Wed, 05 May 2021 10:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leFDT-0004cP-2z
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 10:57:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07912adf-9ee7-4154-b7a1-9c4f3b3ad2f0;
 Wed, 05 May 2021 10:57:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B660B008;
 Wed,  5 May 2021 10:57:17 +0000 (UTC)
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
X-Inumbo-ID: 07912adf-9ee7-4154-b7a1-9c4f3b3ad2f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620212237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNIUz+uee6Hj37SiZqFBZ4oIFLeTiPOCaSq5FTsNibo=;
	b=a0BVc9NIA151mrdAnbJnuBdo9kJDoshSiE+0fMgSBqwJJy1sNbs0I/d3MtiumueRnPApEj
	GhvGTQ0JrRqyZFY0HBAC5C46gr+xl08ePGFkXUUR4bHDO1nHlPeJI+5n9kgxxJvdkzmojC
	rZThExtXkndYBBxLmc9Qr4PEXGUH6q0=
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
 <51c29a91-8659-7525-a565-5b9fcfc935f3@suse.com>
 <9b8fb87c-a2fb-f371-5914-f0d175c18b02@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d55a2c1-f630-3e43-fb6a-39f28f716bca@suse.com>
Date: Wed, 5 May 2021 12:57:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9b8fb87c-a2fb-f371-5914-f0d175c18b02@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.05.2021 10:51, Julien Grall wrote:
> Hi Jan,
> 
> On 05/05/2021 09:24, Jan Beulich wrote:
>> On 05.05.2021 10:12, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 30/04/2021 09:36, Jan Beulich wrote:
>>>> On 30.04.2021 10:19, Julien Grall wrote:
>>>>> On 29/04/2021 14:10, Jan Beulich wrote:
>>>>>> With there being a way to disable v2 support, telling new guests to use
>>>>>> v2 exclusively is not a good suggestion.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> --- a/xen/include/public/grant_table.h
>>>>>> +++ b/xen/include/public/grant_table.h
>>>>>> @@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
>>>>>>      */
>>>>>>     
>>>>>>     /*
>>>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>> + * Version 1 of the grant table entry structure is maintained largely for
>>>>>> + * backwards compatibility.  New guests are recommended to support using
>>>>>> + * version 2 to overcome version 1 limitations, but to be able to fall back
>>>>>> + * to version 1.
>>>>>
>>>>> v2 is not supported on Arm and I don't see it coming anytime soon.
>>>>> AFAIK, Linux will also not use grant table v2 unless the guest has a
>>>>> address space larger than 44 (?) bits.
>>>>
>>>> Yes, as soon as there are frame numbers not representable in 32 bits.
>>>>
>>>>> I can't remember why Linux decided to not use it everywhere, but this is
>>>>> a sign that v2 is not always desired.
>>>>>
>>>>> So I think it would be better to recommend new guest to use v1 unless
>>>>> they hit the limitations (to be details).
>>>>
>>>> IOW you'd prefer s/be able to fall back/default/? I'd be fine that way
>>>
>>> Yes.
>>
>> Okay, I've changed that part, but ...
>>
>>> We would also need to document the limitations as they don't seem
>>> to be (clearly?) written down in the headers.
>>
>> ... I'm struggling to see where (and perhaps even why) this would be
>> needed. The v1 and v2 grant table entry formats are all there. I'm
>> inclined to consider this an orthogonal addition to make by whoever
>> thinks such an addition is needed in the first place.
> 
> The current comment is not mentionning about limitations but instead say 
> "new OS should use v2". Your proposal is to say "default to v1 but use 
> v2 if you hit limitations".

I've intentionally not said "if you hit limitations".

> As Xen developper, I am aware of a single limitation (the 44 bits). But 
> here you suggest there are multiple ones. I could probably figure out 
> the others if I dig into the code...
> 
> Now imagine, you are an OS developper new to Xen. I don't think this is 
> fair to say "there are limitations but I will not tell you directly. 
> Instead you should try to infer them from the definitions". There is a 
> chance, he/she may have missed some of the limitations and therefore the 
> decision to switch between v1 and v2 would be done incorrectly.
> 
> In addition to that, it also means she/he may end up to implement the 
> two versions when implementing v1 may just be sufficient (custom OSes 
> may never need 44 bits worth of address space).

This limitation is based on guest attributes only for HVM. For PV,
host properties matter, so PV guests strictly should be able to
fall back to v2, or they are liable to end up not working on large
hosts.

The other limitation is more a performance one - v2 separates grant
attributes from grant status.

> This is not a very friendly way to work on Xen. FAOD, I am not saying 
> that the other headers are perfect... Instead, I am saying we ought to 
> improve new wording to make the project a bit more welcoming.

I don't think the public header is the place to go into such lengths,
especially when all the information is already there. Textually
describing the same aspects should be done elsewhere imo. I'm of the
firm opinion that the patch as is represents an improvement. There's
no suggestion anywhere that things couldn't be further improved, as
is the case about always.

Since I created this patch only because my request to correct the
statement led to me being asked to provide the suggested new text,
may I suggest that you pick up this patch or create one from scratch
to accommodate all your wishes, if you believe this extra information
really belongs there? All I'm after is to correct a statement that's
actively misleading.

Jan

