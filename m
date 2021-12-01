Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE7465539
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236174.409655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUCY-0007yt-1X; Wed, 01 Dec 2021 18:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236174.409655; Wed, 01 Dec 2021 18:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUCX-0007wy-Tw; Wed, 01 Dec 2021 18:19:29 +0000
Received: by outflank-mailman (input) for mailman id 236174;
 Wed, 01 Dec 2021 18:19:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msUCV-0007ws-GZ
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:19:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msUCS-0001iL-H1; Wed, 01 Dec 2021 18:19:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msUCS-0004Xu-AP; Wed, 01 Dec 2021 18:19:24 +0000
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
	bh=jIDgrpfhLiBYepKOW3385zBmGr3i7hktzvm0m0llYh4=; b=tr31nb5Fi7qSGWzc1xsyzQ3YOn
	5j1mfCWG2ZDLYVRNVpcZBfgK+tLJwpMxDkTCVfj6x3e37gwC7lKRRTUwNVHxu3J02NXzqjko7Qp4i
	bBsXVFBCMcGyFxVFd/PV2hO/nONIzRD3m6cwsiUjOwOVfhu4wWy/597tCZVLWK30OEY0=;
Message-ID: <cbe2a86c-0e2c-dbab-087b-f5c1188bd5aa@xen.org>
Date: Wed, 1 Dec 2021 18:19:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <da172ad3-47b8-8e60-c70a-4275aeb9efd7@xen.org>
 <a01c4d48-0a87-65bb-0593-efa9826e0e4e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a01c4d48-0a87-65bb-0593-efa9826e0e4e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2021 08:07, Jan Beulich wrote:
> On 25.11.2021 17:37, Julien Grall wrote:
>> On 13/09/2021 07:41, Jan Beulich wrote:
>>> Without holding appropriate locks, attempting to remove a prior mapping
>>> of the underlying page is pointless, as the same (or another) mapping
>>> could be re-established by a parallel request on another vCPU. Move the
>>> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
>>> doesn't improve things in any way as far as the security of grant status
>>> frame mappings goes (see XSA-379). Proper locking would be needed here
>>> to allow status frames to be mapped securely.
>>>
>>> In turn this then requires replacing the other use in
>>> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
>>> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
>>> guest_physmap_remove_page() combined with checking the GFN's mapping
>>> there against the passed in MFN, there then is no issue with the
>>> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
>>
>> Do you mean gnttab_get_frame_gfn()?
> 
> No, I don't think so; I do mean gnttab_set_frame_gfn(). Its return value
> directs the caller to do (or not) certain things.

Hmmm ok. I misundertood that comment then. Thanks for the clarification!

> 
>>> --- a/xen/include/asm-arm/grant_table.h
>>> +++ b/xen/include/asm-arm/grant_table.h
>>> @@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
>>>            XFREE((gt)->arch.status_gfn);                                    \
>>>        } while ( 0 )
>>>    
>>> -#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
>>> -    do {                                                                 \
>>> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
>>> -            (gfn);                                                       \
>>> -    } while ( 0 )
>>> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>>> +    ({                                                                   \
>>> +        int rc_ = 0;                                                     \
>>> +        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
>>> +             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
>>> +                                              0)) == 0 )                 \
>>> +            ((st) ? (gt)->arch.status_gfn                                \
>>> +                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
>>> +        rc_;                                                             \
>>> +    })
>>
>> I think using a function would make it a bit easier to understand what
>> it does.
> 
> I can convert it, but it's not very likely that it would be possible
> to make it an inline one. Not sure whether that's then still desirable.

So looking at Oleksandr series, I think we should be able to have the 
Arm helper matching the x86 one. At which point, I could deal with this 
version for now.

> 
>> However... The naming of the function is now quite confusing. The more
>> on x86...
>>
>>>    
>>>    #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
>>>       (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
>>> --- a/xen/include/asm-x86/grant_table.h
>>> +++ b/xen/include/asm-x86/grant_table.h
>>> @@ -37,7 +37,12 @@ static inline int replace_grant_host_map
>>>    
>>>    #define gnttab_init_arch(gt) 0
>>>    #define gnttab_destroy_arch(gt) do {} while ( 0 )
>>> -#define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
>>> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>>> +    (gfn_eq(gfn, INVALID_GFN)                                            \
>>> +     ? guest_physmap_remove_page((gt)->domain,                           \
>>> +                                 gnttab_get_frame_gfn(gt, st, idx),      \
>>> +                                 mfn, 0)                                 \
>>> +     : 0 /* Handled in add_to_physmap_one(). */)
>>
>> ... it will end up to remove the mapping. I don't have a better name at
>> the moment. However I think this would deserve some documentation in the
>> code so one can understand how to implement it for another arch.
> 
> Hmm, perhaps. But wouldn't we better document the final behavior (i.e.
> once the remaining Arm issue got addressed)?

Fair point. I don't expect Oleksandr's series to be committed long after 
yours.

> That may then also lead
> to overall simpler code, ideally with more suitable names (if the
> present ones are deemed unsuitable, which I'm not convinced of).
I don't have a better name so far. However, without any documentation 
this is very difficult to figure out what it is meant to do (I am not 
only referring to someone implementing it for another arch here).

Cheers,

-- 
Julien Grall

