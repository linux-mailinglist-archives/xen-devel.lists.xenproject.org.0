Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215682071DD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 13:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo3Ir-0008Mf-L8; Wed, 24 Jun 2020 11:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ah2w=AF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jo3Iq-0008Ma-4D
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 11:10:52 +0000
X-Inumbo-ID: 5d367c60-b60b-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d367c60-b60b-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IVtI968zP5h1FRwwueFx/lewWfrfbMMK2WW89QgSsKo=; b=bvhznejiG5aUmUea4RRuRatfnw
 oS/ntUJsYn0MMgKhTotoIvd/xAf49UjSCqrJpCywVVbwzN5glbMUPcf/DCI/BzLFtL9q9pV7sNFkv
 jp1yCPzUxvgg2DjYroEpeQ+VWnvmBAPtfSAS5Y/EdprySRzAY2n6tk4OKU9Xw6SA0atQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo3Im-0007qb-7b; Wed, 24 Jun 2020 11:10:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo3Il-0002Lf-Tt; Wed, 24 Jun 2020 11:10:48 +0000
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200623145006.66723-1-roger.pau@citrix.com>
 <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
 <20200623151542.GR735@Air-de-Roger>
 <a3e73ebe-44ee-31a7-05ee-dd115af3414f@xen.org>
 <20200623161607.GT735@Air-de-Roger>
Message-ID: <d148e407-6c7f-92ee-2abd-1d06560dca08@xen.org>
Date: Wed, 24 Jun 2020 12:10:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623161607.GT735@Air-de-Roger>
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

Hi Roger,

On 23/06/2020 17:16, Roger Pau Monné wrote:
> On Tue, Jun 23, 2020 at 04:46:29PM +0100, Julien Grall wrote:
>>
>>
>> On 23/06/2020 16:15, Roger Pau Monné wrote:
>>> On Tue, Jun 23, 2020 at 04:08:06PM +0100, Julien Grall wrote:
>>>> Hi Roger,
>>>>
>>>> On 23/06/2020 15:50, Roger Pau Monne wrote:
>>>>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>>>>> index 9b62087be1..f360166f00 100644
>>>>> --- a/xen/include/xen/mm.h
>>>>> +++ b/xen/include/xen/mm.h
>>>>> @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
>>>>>         }
>>>>>     }
>>>>> -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
>>>>> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
>>>>> +                                           bool sync)
>>>>
>>>> I read the commit message and went through the code, but it is still not
>>>> clear what "sync" means in a non-architectural way.
>>>>
>>>> As an Arm developper, I would assume this means we don't wait for the TLB
>>>> flush to complete. But I am sure this would result to some unexpected
>>>> behavior.
>>>
>>> No, when we return from filtered_flush_tlb_mask the flush has been
>>> performed (either with sync or without), but I understand the
>>> confusion given the parameter name.
>>>
>>>> So can you explain on non-x86 words what this really mean?
>>>
>>> sync (in this context) means to force the usage of an IPI (if built
>>> with PV or shadow paging support) in order to perform the flush.
>>
>> This is compare to?
> 
> Using assisted flushes, like you do on Arm, where you don't send an
> IPI in order to achieve a TLB flush on a remote pCPU.

AFAICT, the assisted flushes only happen when running a nested Xen. Is 
that correct?

> 
>>> AFAICT on Arm you always avoid an IPI when performing a flush, and
>>> that's fine because you don't have PV or shadow, and then you don't
>>> require this.
>>
>> Arm provides instructions to broadcast TLB flush, so by the time one of
>> instruction is completed there is all the TLB entry associated to the
>> translation doesn't exist.
>>
>> I don't think using PV or shadow would change anything here in the way we do
>> the flush.
> 
> TBH, I'm not sure how this applies to Arm. There's no PV or shadow
> implementation, so I have no idea whether this would apply or not.

Yes there is none. However, my point was that if we had to implement 
PV/shadow on Arm then an IPI would definitely be my last choice.

>>>
>>> I could rename to force_ipi (or require_ipi) if that's better?
>>
>> Hmmm, based on what I wrote above, I don't think this name would be more
>> suitable. However, regardless the name, it is not clear to me when a caller
>> should use false or true.
>>
>> Have you considered a rwlock to synchronize the two?
> 
> Yes, the performance drop is huge when I tried. I could try to refine,
> but I think there's always going to be a performance drop, as you then
> require mutual exclusion when modifying the page tables (you take the
> lock in write mode). Right now modification of the page tables can be
> done concurrently.

Fair enough. I will scratch that suggestion then. Thanks for the 
explanation!

So now getting back to filtered_flush_tlb(). AFAICT, the only two 
callers are in common code. The two are used for allocation purpose, so 
may I ask why they need to use different kind of flush?

> 
> FWIW Xen explicitly moved from using a lock into this model in
> 3203345bb13 apparently due to some deadlock situation. I'm not sure
> if that still holds.

The old classic major change with limited explanation :/.

Cheers,

-- 
Julien Grall

