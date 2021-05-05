Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD33739AE
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 13:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123047.232136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leG2c-0005dd-Bh; Wed, 05 May 2021 11:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123047.232136; Wed, 05 May 2021 11:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leG2c-0005al-7J; Wed, 05 May 2021 11:50:10 +0000
Received: by outflank-mailman (input) for mailman id 123047;
 Wed, 05 May 2021 11:50:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leG2b-0005aS-8X
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:50:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leG2a-0000Uc-7h; Wed, 05 May 2021 11:50:08 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leG2a-0005AN-15; Wed, 05 May 2021 11:50:08 +0000
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
	bh=leW/vPVQUAgcKVCqD2t9+AhymmGmdPEmE7kqUXRoE9Q=; b=aSrtavGjwcKcYYmPy2+5E5XvBQ
	wxMpw4Q9gDPcMT1+kWyctk/OLz/HX11LV0n2fzwlS3qjQXVGGHEvtAq71yps1e0dMQ3KinpEdEi6J
	jh+fL0MKqzUhShfG5ARuiODgRq4Yrd+I8lUDMpkivqf3SOcKuDUZGKnQCVqdE2XZ2Ln0=;
Subject: Re: [PATCH] public/gnttab: relax v2 recommendation
To: Jan Beulich <jbeulich@suse.com>
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
 <7d55a2c1-f630-3e43-fb6a-39f28f716bca@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00fa7de9-9f0c-1453-af7e-156d99bbd1f3@xen.org>
Date: Wed, 5 May 2021 12:50:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7d55a2c1-f630-3e43-fb6a-39f28f716bca@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/05/2021 11:57, Jan Beulich wrote:
> On 05.05.2021 10:51, Julien Grall wrote:
>> On 05/05/2021 09:24, Jan Beulich wrote:
>>> On 05.05.2021 10:12, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 30/04/2021 09:36, Jan Beulich wrote:
>>>>> On 30.04.2021 10:19, Julien Grall wrote:
>>>>>> On 29/04/2021 14:10, Jan Beulich wrote:
>>>>>>> With there being a way to disable v2 support, telling new guests to use
>>>>>>> v2 exclusively is not a good suggestion.
>>>>>>>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> --- a/xen/include/public/grant_table.h
>>>>>>> +++ b/xen/include/public/grant_table.h
>>>>>>> @@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
>>>>>>>       */
>>>>>>>      
>>>>>>>      /*
>>>>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>>> + * Version 1 of the grant table entry structure is maintained largely for
>>>>>>> + * backwards compatibility.  New guests are recommended to support using
>>>>>>> + * version 2 to overcome version 1 limitations, but to be able to fall back
>>>>>>> + * to version 1.
>>>>>>
>>>>>> v2 is not supported on Arm and I don't see it coming anytime soon.
>>>>>> AFAIK, Linux will also not use grant table v2 unless the guest has a
>>>>>> address space larger than 44 (?) bits.
>>>>>
>>>>> Yes, as soon as there are frame numbers not representable in 32 bits.
>>>>>
>>>>>> I can't remember why Linux decided to not use it everywhere, but this is
>>>>>> a sign that v2 is not always desired.
>>>>>>
>>>>>> So I think it would be better to recommend new guest to use v1 unless
>>>>>> they hit the limitations (to be details).
>>>>>
>>>>> IOW you'd prefer s/be able to fall back/default/? I'd be fine that way
>>>>
>>>> Yes.
>>>
>>> Okay, I've changed that part, but ...
>>>
>>>> We would also need to document the limitations as they don't seem
>>>> to be (clearly?) written down in the headers.
>>>
>>> ... I'm struggling to see where (and perhaps even why) this would be
>>> needed. The v1 and v2 grant table entry formats are all there. I'm
>>> inclined to consider this an orthogonal addition to make by whoever
>>> thinks such an addition is needed in the first place.
>>
>> The current comment is not mentionning about limitations but instead say
>> "new OS should use v2". Your proposal is to say "default to v1 but use
>> v2 if you hit limitations".
> 
> I've intentionally not said "if you hit limitations".

This doesn't really change the point I made. :)

>> This is not a very friendly way to work on Xen. FAOD, I am not saying
>> that the other headers are perfect... Instead, I am saying we ought to
>> improve new wording to make the project a bit more welcoming.
> 
> I don't think the public header is the place to go into such lengths,
> especially when all the information is already there. Textually
> describing the same aspects should be done elsewhere imo.

The goal of comments is to document anything that cannot be easily 
inferred. This is the case of the limitations you mention but don't 
describe.

  I'm of the
> firm opinion that the patch as is represents an improvement. 

I haven't suggested that patch wasn't improvement. However, I think it 
can easily be improved further.

> There's
> no suggestion anywhere that things couldn't be further improved, as
> is the case about always.
> 
> Since I created this patch only because my request to correct the
> statement led to me being asked to provide the suggested new text,
> may I suggest that you pick up this patch or create one from scratch
> to accommodate all your wishes, if you believe this extra information
> really belongs there? All I'm after is to correct a statement that's
> actively misleading.

I am a bit confused with this answer. Are you saying you are not willing 
to write it but if someone else does you will accept it?

Cheers,

-- 
Julien Grall

