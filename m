Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF836F6EC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 10:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120388.227661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcODH-0008Cq-Og; Fri, 30 Apr 2021 08:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120388.227661; Fri, 30 Apr 2021 08:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcODH-0008CR-LE; Fri, 30 Apr 2021 08:09:27 +0000
Received: by outflank-mailman (input) for mailman id 120388;
 Fri, 30 Apr 2021 08:09:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lcODG-0008CM-2q
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 08:09:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lcODE-00067g-T9; Fri, 30 Apr 2021 08:09:24 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lcODE-00075Q-J1; Fri, 30 Apr 2021 08:09:24 +0000
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
	bh=dnZQBjJf/E8Q3K9FmB6B0nE9Gm3pGkM0l3lx/H6fGlg=; b=a8FkICAV3wTxTuiT9hZFGCR9EO
	/I9AP6zW/FfmklJcWCI0lmxfFdbVUKgYAavTL4XmU3h984+ZqB5CXu/5xYCPmeLf7/xx2UVSpfsmr
	9U7iCqI1WFHfX1oN/e0to9IxsU3wKlBAEn72S9DTHREiyco+KPCIFAPRhTL8aA398jBQ=;
Subject: Re: [PATCH v3] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
 <581f843f-25de-bf8a-e8b9-7a407158bd4f@xen.org>
 <150783e6-1bc5-d646-354b-9cddd2f236c2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3f13d19e-3104-f71b-386a-9e768654238a@xen.org>
Date: Fri, 30 Apr 2021 09:09:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <150783e6-1bc5-d646-354b-9cddd2f236c2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/04/2021 14:40, Jan Beulich wrote:
> On 29.04.2021 15:15, Julien Grall wrote:
>> On 15/04/2021 10:41, Jan Beulich wrote:
>>> This array can be large when many grant frames are permitted; avoid
>>> allocating it when it's not going to be used anyway, by doing this only
>>> in gnttab_populate_status_frames().
>>
>> Given the controversy of the change, I would suggest to summarize why
>> this approach is considered to be ok in the commit message.
> 
> I've added "While the delaying of the respective memory allocation adds
> possible reasons for failure of the respective enclosing operations,
> there are other memory allocations there already, so callers can't
> expect these operations to always succeed anyway."

Looks good to me, thanks!

> 
>>> @@ -1767,18 +1778,23 @@ status_alloc_failed:
>>>            free_xenheap_page(gt->status[i]);
>>>            gt->status[i] = NULL;
>>>        }
>>
>> NIT: can you add a newline here and...
>>
>>> +    if ( !nr_status_frames(gt) )
>>> +    {
>>> +        xfree(gt->status);
>>> +        gt->status = ZERO_BLOCK_PTR;
>>> +    }
>>
>> ... here for readability.
> 
> Can do.
> 
>>> @@ -1833,12 +1849,11 @@ gnttab_unpopulate_status_frames(struct d
>>>            page_set_owner(pg, NULL);
>>>        }
>>>    
>>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>>> -    {
>>> -        free_xenheap_page(gt->status[i]);
>>> -        gt->status[i] = NULL;
>>> -    }
>>>        gt->nr_status_frames = 0;
>>> +    for ( i = 0; i < n; i++ )
>>> +        free_xenheap_page(gt->status[i]);
>>> +    xfree(gt->status);
>>> +    gt->status = ZERO_BLOCK_PTR;
>> The new position of the for loop seems unrelated to the purpose of the
>> patch. May I ask why this was done?
> 
> Since I was touching this anyway, I thought I could also bring it
> into "canonical" order: Up-ing of an array's size should always
> first populate the higher entries, then bump the upper bound.
> Shrinking of an array's size should always first shrink the upper
> bound, then un-populate the higher entries. This may not strictly
> be needed here, but I think code we have would better not set bad
> precedents (which may otherwise propagate elsewhere).

I am assuming the concern here would be concurrent access. In which 
case, neither of the two versions would be actually be safe.

Anyway, I can see the theory so I am OK with it. However, this is more a 
clean-up than something strictly necessary for this patch. I can live 
with the code beeing modified here, but this at least ought to be 
explained in the commit message.

>>> @@ -4047,11 +4062,12 @@ int gnttab_acquire_resource(
>>>            if ( gt->gt_version != 2 )
>>>                break;
>>>    
>>> +        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
>>
>> NIT: It wasn't obvious to me why gnttab_get_status_frame_mfn() is moved
>> before gt->status. May I suggest to add a in-code comment abouve the
>> ordering?
> 
> I've added
> 
>          /* This may change gt->status, so has to happen before setting vaddrs. */

Sounds good to me!

Cheers,

-- 
Julien Grall

