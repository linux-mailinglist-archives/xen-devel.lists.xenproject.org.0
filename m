Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2978303AB1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 11:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74810.134488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ltu-0007CD-J0; Tue, 26 Jan 2021 10:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74810.134488; Tue, 26 Jan 2021 10:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ltu-0007Bq-Eu; Tue, 26 Jan 2021 10:48:46 +0000
Received: by outflank-mailman (input) for mailman id 74810;
 Tue, 26 Jan 2021 10:48:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Ltt-0007Bl-55
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 10:48:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdea3bb9-9bbd-4f30-91d0-7d24faf2dc44;
 Tue, 26 Jan 2021 10:48:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE51AACC6;
 Tue, 26 Jan 2021 10:48:39 +0000 (UTC)
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
X-Inumbo-ID: bdea3bb9-9bbd-4f30-91d0-7d24faf2dc44
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611658120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iirdp/1uqfKDN0ock16bPE3mSGwX/+yUu5Z7atGX1Ts=;
	b=S4ku8Q7UOVY+QkmXKL/TDU/xlUaQCKynX9qzpTb42Ze+5Mee0nSz4wqKLT3+7f/Ph6Tg+y
	4JoWyFh9YdfhSwAvR6piH9YG8P2YgZxJQ1wSeI9iJyIGX/MaZ3lI3tJzO3/c54FoDVfwEP
	dttQuevfm87KRm0LwssVQzoSnWAXwxg=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
 <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
 <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
 <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
 <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4dc987b-6a1e-6160-04c4-4f0bbc5ad3e4@suse.com>
Date: Tue, 26 Jan 2021 11:48:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.01.2021 18:59, Andrew Cooper wrote:
> On 20/01/2021 08:06, Jan Beulich wrote:
>> On 19.01.2021 19:09, Andrew Cooper wrote:
>>> On 19/01/2021 16:48, Jan Beulich wrote:
>>>> On 19.01.2021 14:02, Andrew Cooper wrote:
>>>>> This code has been copied in 3 places, but it is problematic.
>>>>>
>>>>> All cases will hit a BUG() later in domain teardown, when a the missing
>>>>> type/count reference is underflowed.
>>>> I'm afraid I could use some help with this: Why would there
>>>> be a missing reference, when the getting of one failed?
>>> Look at the cleanup logic for the associated fields.
>>>
>>> Either the plain ref fails (impossible without other fatal refcounting
>>> errors AFAICT), or the typeref fails (a concern, but impossible AFAICT).
>> In principle I would agree, if there wasn't the question of
>> count overflows. The type count presently is 56 bits wide,
>> while the general refcount has 54 bits. It'll be a long time
>> until they overflow, but it's not impossible. The underlying
>> problem there that I see is - where do we draw the line
>> between "can't possibly overflow in practice" (as we would
>> typically assume for 64-bit counters) and "is to be expected
>> to overflow (as we would typically assume for 32-bit
>> counters)?
> 
> Ok fine - I was treating 54 bits as "not going to happen in practice".
> 
> A PV guest needs 2^43 pages of RAM to turn into pagetables to approach
> the general refcount limit.  This is more RAM than most people can
> accord, and this is way in excess of our security supported limits.
> 
> 
> Errors in this area are already hit BUGs in loads of cases, because that
> is less bad than the alternatives.
> 
> In principle, and as previously discussed, some issues in this area
> could be fixed by porting refcount_t from PaX/Linux KSPP which will turn
> refcount overflows into memory leaks, which is an even less bad alternative.
> 
>>
>> Also, as far as "impossible" here goes - the constructs all
>> anyway exist only to deal with what we consider impossible.
>> The question therefore really is of almost exclusively
>> theoretical nature, and hence something like a counter
>> possibly overflowing imo needs to be accounted for as
>> theoretically possible, albeit impossible with today's
>> computers and realistic timing assumptions. If a counter
>> overflow occurred, it definitely wouldn't be because of a
>> bug in Xen, but because of abnormal behavior elsewhere.
>> Hence I remain unconvinced it is appropriate to deal with
>> the situation by BUG().
> 
> I'm not sure how to be any clearer.
> 
> I am literally not changing the current behaviour.  Xen *will* hit a
> BUG() if any of these domain_crash() paths are taken.
> 
> If you do not believe me, then please go and actually check what happens
> when simulating a ref-acquisition failure.

Well, okay, if you don't want to share the knowledge you've
gained, I will have to go this route. Will likely take
longer though than if you had tried to clarify how a ref
would go "missing" and hence allow for an underflow. This
isn't a matter of believing you, but one of wanting to
understand the situation you say you've run into.

Jan

> What I am doing is removing complexity (the point of the change) which
> gives a false sense of the error being survivable.
> 
> If you want to do something other than BUG() in these cases, then you
> need to figure some way for the teardown logic to identify which ref
> went missing, but this would be a different, follow-on patch.
> 
>> But yes, if otoh we assume the failure here to be the result
>> of a bug elsewhere in Xen (and not an overflow), then BUG()
>> may be warranted. Yet afaic these constructs weren't meant
>> to deal with bugs elsewhere in Xen, but with the
>> "impossible". So if we change our collective mind here, I
>> think the conversion to BUG() would then need accompanying
>> by respective commentary.
> 
> BUG() is, and has always been, Xen's way of dealing with impossibles,
> particularly when it comes to memory handling.
> 
> This isn't a "changing minds" occasion.  Removals of BUG()s elsewhere
> pertains to logical error based on guest state, which is indeed
> inappropriate error handling.
> 
> ~Andrew
> 


