Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85177F184
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585196.916242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXnw-0000x3-88; Thu, 17 Aug 2023 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585196.916242; Thu, 17 Aug 2023 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXnw-0000ti-5A; Thu, 17 Aug 2023 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 585196;
 Thu, 17 Aug 2023 07:52:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWXnv-0000tc-7f
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:52:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWXns-0004vE-9A; Thu, 17 Aug 2023 07:52:24 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWXnr-0001Gl-W2; Thu, 17 Aug 2023 07:52:24 +0000
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
	bh=sKwX6GE3rPdykahZ9VOA4qvqjVKD60tHixw42a9+Quc=; b=kZMoNLJG/fSsV56a3hNJbfd0qL
	U40rLDKkAu072qQd7QOeZ5cSawhCrp8HL7rPi7uwJrRTL2I8yTowH7YU5NTPs4/Ur0qExjW3vRP4D
	OMX2yje7EL9g2TivUvLss2ERw/xx8TulOF4oO/+jxQzqav6jSZVC3eVSHUqloZvRSx0Q=;
Message-ID: <670cbe2b-1b19-4376-9c02-1bc7657c8509@xen.org>
Date: Thu, 17 Aug 2023 08:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
 <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
 <3ad06a1c-2337-fd66-cf2f-9151544dc8db@suse.com>
 <3b15eb0c-eada-4729-aff6-e1daf67fc6ba@xen.org>
 <adeccc9d-52e2-8c5f-30f6-5dfa67047740@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <adeccc9d-52e2-8c5f-30f6-5dfa67047740@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/08/2023 08:25, Jan Beulich wrote:
> On 17.08.2023 09:06, Julien Grall wrote:
>> On 17/08/2023 07:39, Jan Beulich wrote:
>>> On 16.08.2023 18:57, Julien Grall wrote:
>>>> On 16/08/2023 10:51, Jan Beulich wrote:
>>>>> Old gcc won't cope with initializers involving unnamed struct/union
>>>>
>>>> Can you specify the newest version of GCC that breaks? This would help
>>>> to reproduce your problem in case someone complain about this change.
>>>
>>> I can't, without actually putting in effort to find out. I'm observing
>>> these problems with 4.3.x iirc.
>>
>> You are proving my point. :) If you can't already remember which version
>> of GCC was breaking. How can you expect someone in a few months time to
>> figure out why this was added and whether and it can reworked differently?
> 
> Well, I know for sure that this doesn't work with the version recorded in
> ./README. Imo that's sufficient to justify submitting patches like this,
> and without going into version details. Once that baseline version is
> bumped, much more than just this code can and wants to be re-evaluated,
> by simply trying with the then-lowest supported version (which imo really
> ought to be part of what is tested in CI, to not always leave it to me to
> find and fix such issues).

Right, but to do it efficiently, you will want to know when the issue 
was introduced. So you have a rough idea whether it is worth 
investigating to remove. For instance, this may be a bug in GCC 4.8 but 
we only bump the requirement to GCC 4.5. If you know it was in GCC 4.8 
then you don't need to re-assess.

> 
>>>   And of course this isn't the first such
>>> change, and I don't think we ever bothered writing down precise version
>>> boundaries in any of the commits.
>>
>> I am not looking at a precise boundary. What I meant by the 'newest' is
>> the newest one you try.
> 
> Okay, that's slightly different and hence possible to record. I can do
> so here just to please you, but as per above I don't think that ought to
> be a requirement 

It is not about pleasing me here. It is for us to save time and argument 
in the future.

I still have in mind an optimization we tried to revert recently because 
it wasn't one. But one of the maintainer were not willing to revert as 
it may have helped in some situation which were not documented and 
nobody could reproduced it.

This is not an optimization here. But I am concerned, this would end up 
to a similar situation. This we could easily be prevented by been a bit 
more verbose up front...

 > (and as said earlier it also hasn't been in the past).

Which is fine. Process evolved based on experience.

> 
>> With 'old', it is not clear what this really mean. For instance,
>> technically the previous GCC version is already old. So a bit more
>> information about the GCC version you tried on would be useful.
> 
> Hmm, no, that's not really my interpretation of "old".

'old' doesn't really have any exact time other than been in the past. It 
doesn't hurt to qualify it properly...

At the end of the day, this is x86 code. So feel free to ignore it. 
Hopefully, I will not be the person reporting an issue related to this 
change :).

Cheers,

-- 
Julien Grall

