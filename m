Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48082280D51
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 08:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1680.5088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOEIt-0003Tu-8f; Fri, 02 Oct 2020 06:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1680.5088; Fri, 02 Oct 2020 06:12:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOEIt-0003TU-4J; Fri, 02 Oct 2020 06:12:27 +0000
Received: by outflank-mailman (input) for mailman id 1680;
 Fri, 02 Oct 2020 06:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOEIr-0003TP-Bp
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:12:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 998311f9-3f0f-47fe-813d-7f903fea7e5b;
 Fri, 02 Oct 2020 06:12:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 502B8B312;
 Fri,  2 Oct 2020 06:12:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOEIr-0003TP-Bp
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:12:25 +0000
X-Inumbo-ID: 998311f9-3f0f-47fe-813d-7f903fea7e5b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 998311f9-3f0f-47fe-813d-7f903fea7e5b;
	Fri, 02 Oct 2020 06:12:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601619143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hw7ZlxAQw/pdvyez1KAKHCb7RLR/cvQxCiac0pD7MM=;
	b=ipE3kbU7FzZQkYcOYhQwb3h8S7qNCnkQG7dYE7Z4PJyKo4KtLkwcdJ/tPpNKFvCsSS2AYl
	pydYiuKT5NGONK3PK+rMk9JgZAG4zWjhunJX21rb3dW+3Lyoz3YUYYMnToUl/YBhk5MH72
	IdBoLprPvG9Mwx/ix8G1oGfY8cp/P60=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 502B8B312;
	Fri,  2 Oct 2020 06:12:23 +0000 (UTC)
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Julien Grall <julien@xen.org>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <004b01d696ff$76873e50$6395baf0$@xen.org>
 <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
 <006401d69707$062a5090$127ef1b0$@xen.org>
 <3626d65c-bd5d-f65e-61ca-451110761258@suse.com>
 <f55cb87f-418d-61fa-65f1-0e746071fe37@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60f2ae90-160f-d7fe-9d5f-f9cd4651a93c@suse.com>
Date: Fri, 2 Oct 2020 08:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f55cb87f-418d-61fa-65f1-0e746071fe37@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.10.2020 18:21, Julien Grall wrote:
> On 30/09/2020 11:16, Jan Beulich wrote:
>> On 30.09.2020 10:52, Paul Durrant wrote:
>>> Looking again, given that both send_guest_vcpu_virq() and
>>> send_guest_global_virq() (rightly) hold the evtchn lock before
>>> calling evtchn_port_set_pending() I think you could do away with
>>> the virq lock by adding checks in those functions to verify
>>> evtchn->state == ECS_VIRQ and u.virq == virq after having
>>> acquired the channel lock but before calling
>>> evtchn_port_set_pending().
>>
>> I don't think so: The adjustment of v->virq_to_evtchn[] in
>> evtchn_close() would then happen with just the domain's event
>> lock held, which the sending paths don't use at all. The per-
>> channel lock gets acquired in evtchn_close() a bit later only
>> (and this lock can't possibly protect per-vCPU state).
>>
>> In fact I'm now getting puzzled by evtchn_bind_virq() updating
>> this array with (just) the per-domain lock held. Since it's
>> the last thing in the function, there's technically no strict
>> need for acquiring the vIRQ lock,
> 
> Well, we at least need to prevent the compiler to tear the store/load. 
> If we don't use a lock, then we would should use ACCESS_ONCE() or 
> {read,write}_atomic() for all the usage.
> 
>> but holding the event lock
>> definitely doesn't help.
> 
> It helps because spin_unlock() and write_unlock() use the same barrier 
> (arch_lock_release_barrier()). So ...

I'm having trouble making this part of your reply fit ...

>> All that looks to be needed is the
>> barrier implied from write_unlock().
> 
> No barrier should be necessary. Although, I would suggest to add a 
> comment explaining it.

... this. If we moved the update of v->virq_to_evtchn[] out of the
locked region (as the lock doesn't protect anything anymore at that
point), I think a barrier would need adding, such that the sending
paths will observe the update by the time evtchn_bind_virq()
returns (and hence sending of a respective vIRQ event can
legitimately be expected to actually work). Or did you possibly
just misunderstand what I wrote before? By putting in question the
utility of holding the event lock, I implied the write could be
moved out of the locked region ...

Jan

