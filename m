Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B803644BB6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455469.712950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cfM-0000CM-8M; Tue, 06 Dec 2022 18:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455469.712950; Tue, 06 Dec 2022 18:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cfM-00009a-5W; Tue, 06 Dec 2022 18:27:40 +0000
Received: by outflank-mailman (input) for mailman id 455469;
 Tue, 06 Dec 2022 18:27:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2cfK-00009U-H2
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:27:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cfI-00078w-Qe; Tue, 06 Dec 2022 18:27:36 +0000
Received: from [54.239.6.185] (helo=[192.168.22.87])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cfI-0003oc-Ko; Tue, 06 Dec 2022 18:27:36 +0000
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
	bh=nRVXz0iGu7R9CNf1yC7vJkFqKb2VttHAanboPMO18/s=; b=JDI9LrFkrFXTtRa9a+ofemfQu3
	UfA58QnFRYOYCAOs2glT/mebLJCbxo2c6xybNoQCHbN9RBxkyuzvt33nIiNLq8SYWdpLWRk2rZjEo
	ggrJmxMy8zGWTvBPZLkjF5fEnuhP9LkLEicCcWYaeHWaJodB52TgOCbMmHwQ7rHFOlu4=;
Message-ID: <7a66f7f3-174d-a9ce-ff5a-582de82843fb@xen.org>
Date: Tue, 6 Dec 2022 18:27:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <c8f79867-42b3-a23f-6fe0-de8b698c6b0c@suse.com>
 <ceb28c2f-d4c6-3190-ea84-d6f7c9acb4ad@xen.org>
 <d8ba56a3-3b3f-788c-620e-823d4e2e38ea@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d8ba56a3-3b3f-788c-620e-823d4e2e38ea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/11/2022 14:02, Jan Beulich wrote:
> On 29.11.2022 09:40, Julien Grall wrote:
>> On 28/11/2022 10:01, Jan Beulich wrote:
>>> On 24.11.2022 22:29, Julien Grall wrote:
>>>> On 19/10/2022 09:43, Jan Beulich wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>>>>                        struct guest_area *area,
>>>>>                        void (*populate)(void *dst, struct vcpu *v))
>>>>>     {
>>>>> -    return -EOPNOTSUPP;
>>>>> +    struct domain *currd = v->domain;
>>>>> +    void *map = NULL;
>>>>> +    struct page_info *pg = NULL;
>>>>> +    int rc = 0;
>>>>> +
>>>>> +    if ( gaddr )
>>>>
>>>> 0 is technically a valid (guest) physical address on Arm.
>>>
>>> I guess it is everywhere; it certainly also is on x86. While perhaps a
>>> little unfortunate in ordering, the public header changes coming only
>>> in the following patches was the best way I could think of to split
>>> this work into reasonable size pieces. There the special meaning of 0
>>> is clearly documented. And I don't really see it as a meaningful
>>> limitation to not allow guests to register such areas at address zero.
>> I would expect an OS to allocate the region using the generic physical
>> allocator. This allocator may decide that '0' is a valid address and
>> return it.
>>
>> So I think your approach could potentially complicate the OS
>> implementation. I think it would be better to use an all Fs value as
>> this cannot be valid for this hypercall (we require at least 4-byte
>> alignment).
> 
> Valid point, yet my avoiding of an all-Fs value was specifically with
> compat callers in mind - the values would be different for these and
> native ones, which would make the check more clumsy (otherwise it
> could simply be "if ( ~gaddr )").

Ah I forgot about compat. How about converting the 32-bit Fs to a 64-bit 
Fs in the compat code?

This will avoid to add restriction in the hypercall interface just 
because of compat.

> 
>>>>> @@ -1573,6 +1648,22 @@ int map_guest_area(struct vcpu *v, paddr
>>>>>      */
>>>>>     void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>>>>>     {
>>>>> +    struct domain *d = v->domain;
>>>>> +    void *map;
>>>>> +    struct page_info *pg;
>>>>
>>>> AFAIU, the assumption is the vCPU should be paused here.
>>>
>>> Yes, as the comment ahead of the function (introduced by an earlier
>>> patch) says.
>>
>> Ah, I missed that. Thanks!
>>
>>>
>>>> Should we add an ASSERT()?
>>>
>>> I was going from unmap_vcpu_info(), which had the same requirement,
>>> while also only recording it by way of a comment. I certainly could
>>> add an ASSERT(), but besides this being questionable as to the rules
>>> set forth in ./CODING_STYLE I also view assertions of "paused" state
>>> as being of limited use - the entity in question may become unpaused
>>> on the clock cycle after the check was done.
>>
>> That's correct. However, that race you mention is unlikely to happen
>> *every* time. So there are a very high chance the ASSERT() will hit if
>> miscalled.
>>
>>> (But yes, such are no
>>> different from e.g. the fair number of spin_is_locked() checks we
>>> have scattered around, which don't really provide guarantees either.)
>> And that's fine to not provide the full guarantee. You are still
>> probably going to catch 95% (if not more) of the callers that forgot to
>> call it with the spin lock held.
>>
>> At least for me, those ASSERTs() were super helpful during development
>> in more than a few cases.
> 
> Okay, I'll add one then, but in the earlier patch, matching the comment
> that's introduced there.

Thanks! I still owe you a review for the rest of the series.

Cheers,

-- 
Julien Grall

