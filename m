Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D213A205646
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 17:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnl89-00083V-HG; Tue, 23 Jun 2020 15:46:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaA/=AE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnl88-00083Q-1W
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 15:46:36 +0000
X-Inumbo-ID: b7903668-b568-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7903668-b568-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=10fkYMFOBveJA9zTT6wsUzs7b/kffJbQ0JNTtZg9gEo=; b=rRM8xr07vemolnznjBxB9+ABEn
 cX0PGg3EB/qefJwZUXf1B4S9FQcf+rtnxLwY6cF2CNPcWUDjZRadKTkckz1KrXbYaQq/Ftf7CaGUK
 vyRTEyKEvZ5SwbhHXwdfB46yahr1PLcwCdjpk1K7/ctxUIA/iQcebvVXng4jMguXjR6k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnl84-0007ZK-GJ; Tue, 23 Jun 2020 15:46:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnl84-0006Z1-9d; Tue, 23 Jun 2020 15:46:32 +0000
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200623145006.66723-1-roger.pau@citrix.com>
 <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
 <20200623151542.GR735@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <a3e73ebe-44ee-31a7-05ee-dd115af3414f@xen.org>
Date: Tue, 23 Jun 2020 16:46:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623151542.GR735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 23/06/2020 16:15, Roger Pau Monné wrote:
> On Tue, Jun 23, 2020 at 04:08:06PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 23/06/2020 15:50, Roger Pau Monne wrote:
>>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>>> index 9b62087be1..f360166f00 100644
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
>>>        }
>>>    }
>>> -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
>>> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
>>> +                                           bool sync)
>>
>> I read the commit message and went through the code, but it is still not
>> clear what "sync" means in a non-architectural way.
>>
>> As an Arm developper, I would assume this means we don't wait for the TLB
>> flush to complete. But I am sure this would result to some unexpected
>> behavior.
> 
> No, when we return from filtered_flush_tlb_mask the flush has been
> performed (either with sync or without), but I understand the
> confusion given the parameter name.
> 
>> So can you explain on non-x86 words what this really mean?
> 
> sync (in this context) means to force the usage of an IPI (if built
> with PV or shadow paging support) in order to perform the flush.

This is compare to?

> AFAICT on Arm you always avoid an IPI when performing a flush, and
> that's fine because you don't have PV or shadow, and then you don't
> require this.

Arm provides instructions to broadcast TLB flush, so by the time one of 
instruction is completed there is all the TLB entry associated to the 
translation doesn't exist.

I don't think using PV or shadow would change anything here in the way 
we do the flush.

> Also I'm not sure Arm has the concept of a spurious
> page fault.

So if I understand correctly, the HW may raise a fault even if the 
mapping was in the page-tables. Is it correct?

We have a spurious page fault handler for stage-2 (aka EPT on x86) as we 
need to have an invalid mapping to transition for certain page-tables 
update (e.g. superpage shattering). We are using the same rwlock with 
the page fault handler and the page-table update, so there is no way the 
two can run concurrently.

> 
> I could rename to force_ipi (or require_ipi) if that's better?

Hmmm, based on what I wrote above, I don't think this name would be more 
suitable. However, regardless the name, it is not clear to me when a 
caller should use false or true.

Have you considered a rwlock to synchronize the two?

Cheers,

-- 
Julien Grall

