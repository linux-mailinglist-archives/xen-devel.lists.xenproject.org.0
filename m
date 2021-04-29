Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B35A36EB74
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120033.226960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6u3-0004Wj-75; Thu, 29 Apr 2021 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120033.226960; Thu, 29 Apr 2021 13:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6u3-0004WK-3p; Thu, 29 Apr 2021 13:40:27 +0000
Received: by outflank-mailman (input) for mailman id 120033;
 Thu, 29 Apr 2021 13:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6u1-0004WF-EF
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:40:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cde30a05-ed0e-4ae1-b709-e53fd06200e7;
 Thu, 29 Apr 2021 13:40:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74330B293;
 Thu, 29 Apr 2021 13:40:23 +0000 (UTC)
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
X-Inumbo-ID: cde30a05-ed0e-4ae1-b709-e53fd06200e7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619703623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/BuXRS814jOEGBV0Sd0wSce8NKS3huwM2nKbpbHMvc=;
	b=uVffAl/b+3E53FD5OKtNlqfIVc6BfLZMFfGSAfC4/14QLh1VDX/JUjvop5zR1sHI5iR1Rd
	HRLzW9viVcjkaCkzIwh+EpGMoLp+aAts7uzpI3WS37oBYdm7wpJxGx/aCQRM/cZMoOvgHG
	NygEesmy3v4a02cYpx+0UGeurWTetL0=
Subject: Re: [PATCH v3] gnttab: defer allocation of status frame tracking
 array
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
 <581f843f-25de-bf8a-e8b9-7a407158bd4f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <150783e6-1bc5-d646-354b-9cddd2f236c2@suse.com>
Date: Thu, 29 Apr 2021 15:40:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <581f843f-25de-bf8a-e8b9-7a407158bd4f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 15:15, Julien Grall wrote:
> On 15/04/2021 10:41, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames().
> 
> Given the controversy of the change, I would suggest to summarize why 
> this approach is considered to be ok in the commit message.

I've added "While the delaying of the respective memory allocation adds
possible reasons for failure of the respective enclosing operations,
there are other memory allocations there already, so callers can't
expect these operations to always succeed anyway."

>> @@ -1767,18 +1778,23 @@ status_alloc_failed:
>>           free_xenheap_page(gt->status[i]);
>>           gt->status[i] = NULL;
>>       }
> 
> NIT: can you add a newline here and...
> 
>> +    if ( !nr_status_frames(gt) )
>> +    {
>> +        xfree(gt->status);
>> +        gt->status = ZERO_BLOCK_PTR;
>> +    }
> 
> ... here for readability.

Can do.

>> @@ -1833,12 +1849,11 @@ gnttab_unpopulate_status_frames(struct d
>>           page_set_owner(pg, NULL);
>>       }
>>   
>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>> -    {
>> -        free_xenheap_page(gt->status[i]);
>> -        gt->status[i] = NULL;
>> -    }
>>       gt->nr_status_frames = 0;
>> +    for ( i = 0; i < n; i++ )
>> +        free_xenheap_page(gt->status[i]);
>> +    xfree(gt->status);
>> +    gt->status = ZERO_BLOCK_PTR;
> The new position of the for loop seems unrelated to the purpose of the 
> patch. May I ask why this was done?

Since I was touching this anyway, I thought I could also bring it
into "canonical" order: Up-ing of an array's size should always
first populate the higher entries, then bump the upper bound.
Shrinking of an array's size should always first shrink the upper
bound, then un-populate the higher entries. This may not strictly
be needed here, but I think code we have would better not set bad
precedents (which may otherwise propagate elsewhere).

>> @@ -4047,11 +4062,12 @@ int gnttab_acquire_resource(
>>           if ( gt->gt_version != 2 )
>>               break;
>>   
>> +        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
> 
> NIT: It wasn't obvious to me why gnttab_get_status_frame_mfn() is moved 
> before gt->status. May I suggest to add a in-code comment abouve the 
> ordering?

I've added

        /* This may change gt->status, so has to happen before setting vaddrs. */ 

Jan

