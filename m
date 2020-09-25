Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A45278AE8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 16:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLonR-0005pH-3o; Fri, 25 Sep 2020 14:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O9+A=DC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLonP-0005pC-D2
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 14:33:59 +0000
X-Inumbo-ID: 9d1c90f7-a85f-4448-9ad8-902d31cc482e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d1c90f7-a85f-4448-9ad8-902d31cc482e;
 Fri, 25 Sep 2020 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=r4rcXD54XBavbEAE9wiHYvRdd2l/4vSl11R4OuXXtbk=; b=rFCO2/rn7TR/sdhviDvvVSrlfs
 hJb4DidCCVIflQeeVpYfhubnuZNB9fLQ4Fgu7x7BeceMWCegIUVSGOLfHdIoCG9S9vPFcP8M6B7o4
 QH7J/K5DDXfB4dvwCq5xmSVz+yBVHSoB3XYdMW5CnbwVHe2GiwQU3AxCgF23hNrWbjHI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLonI-0004mk-Mm; Fri, 25 Sep 2020 14:33:52 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLonI-00084H-DN; Fri, 25 Sep 2020 14:33:52 +0000
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
Date: Fri, 25 Sep 2020 15:33:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 25/09/2020 14:58, Jan Beulich wrote:
> On 25.09.2020 15:16, Julien Grall wrote:
>> Hi Jan,
>>
>> On 25/09/2020 13:21, Jan Beulich wrote:
>>> On 25.09.2020 12:34, Julien Grall wrote:
>>>> On 24/09/2020 11:53, Jan Beulich wrote:
>>>>> xmalloc() & Co may not be called with IRQs off, or else check_lock()
>>>>> will have its assertion trigger about locks getting acquired
>>>>> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
>>>>> very reasonable, especially since the per-channel lock was introduced to
>>>>> avoid acquiring the per-domain event lock on the send paths. Issue a
>>>>> second call to xsm_evtchn_send() instead, before acquiring the lock, to
>>>>> give XSM / Flask a chance to pre-allocate whatever it may need.
>>>>
>>>> This is the sort of fall-out I was expecting when we decide to turn off
>>>> the interrupts for big chunk of code. I couldn't find any at the time
>>>> though...
>>>>
>>>> Can you remind which caller of send_guest{global, vcpu}_virq() will call
>>>> them with interrupts off?
>>>
>>> I don't recall which one of the two it was that I hit; we wanted
>>> both to use the lock anyway. send_guest_pirq() very clearly also
>>> gets called with IRQs off.
>>>
>>>> Would it be possible to consider deferring the call to a softirq
>>>> taslket? If so, this would allow us to turn the interrupts again.
>>>
>>> Of course this is in principle possible; the question is how
>>> involved this is going to get.
>>> However, on x86 oprofile's call to
>>> send_guest_vcpu_virq() can't easily be replaced - it's dangerous
>>> enough already that in involves locks in NMI context. I don't
>>> fancy seeing it use more commonly used ones.
>>
>> Fair enough. I would still like to consider a way where we could avoid
>> to hack xsm_* because we have the interrupts disabled.
> 
> Well, from a conceptual pov it's at least questionable for XSM to
> need any memory allocations at all when merely being asked for
> permission. And indeed the need for it arises solely from its
> desire to cache the result, for the sake of subsequent lookups.
> 
> I also find it odd that there's an XSM check on the send path in
> the first place. This isn't just because it would seem to me that
> it should be decided at binding time whether sending is permitted
> - I may easily be missing something in the conceptual model here.
> It's also because __domain_finalise_shutdown() too uses
> evtchn_send(), and I didn't think this one should be subject to
> any XSM check (just like send_guest_*() aren't).

Maybe this is the first question we need to answer?

> 
>> AFAICT, we don't need send_guest_global_virq() and evtchn_send() to be
>> mutually exclusive. Is that correct?
> 
> Yes, any number of sends (even to the same port) could in principle
> run concurrently, I think. Or else the FIFO code would have been
> broken from the very point where the per-channel lock was
> introduced and acquiring of the per-domain one then dropped from
> evtchn_send() (other sending paths weren't using the per-domain one
> anyway already before that).
> 
>> So how about splitting the lock in two? One would be used when the
>> interrupts have to be disabled while the other would be used when we can
>> keep interrupts enabled.
> 
> Now that's an interesting proposal. I thought one lock per channel
> was already pretty fine-grained. Now you propose making it two.
> 
>> The two locks would have to be taken when the event channel needs to be
>> modified.
> 
> Requiring a total of 6 locks to be acquired when fiddling with
> interdomain channels... Wow. Definitely more intrusive overall than
> the change here.

Well hacks are always more self-contained but long term they are a 
nightmare to maintain :).

6 locks is indeed a lot, but the discussion here shows that the current 
locking is probably not suitable for the current uses.

I don't have a better solution so far, but I will have a think about it. 
Meanwhile, it would be good to figure out why xsm_evtchn_send() is needed.

Cheers,

-- 
Julien Grall

