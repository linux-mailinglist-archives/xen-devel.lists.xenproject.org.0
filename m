Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53902A0343
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15652.38703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRyI-0003du-2u; Fri, 30 Oct 2020 10:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15652.38703; Fri, 30 Oct 2020 10:49:26 +0000
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
	id 1kYRyH-0003dX-Vp; Fri, 30 Oct 2020 10:49:25 +0000
Received: by outflank-mailman (input) for mailman id 15652;
 Fri, 30 Oct 2020 10:49:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYRyG-0003dS-GZ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:49:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90f427b3-43dc-44f7-a16d-c169e3bf6adf;
 Fri, 30 Oct 2020 10:49:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5699ACA3;
 Fri, 30 Oct 2020 10:49:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYRyG-0003dS-GZ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:49:24 +0000
X-Inumbo-ID: 90f427b3-43dc-44f7-a16d-c169e3bf6adf
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 90f427b3-43dc-44f7-a16d-c169e3bf6adf;
	Fri, 30 Oct 2020 10:49:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604054962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UWZMhaL5EMy8WOHwrNRwIWiRPHI5NUJ6uno6NfsPVlc=;
	b=o0ZAt1hxnsdy+atjREs2Xq4fg0ghDTlk2GtkuB/hQi6zJHtEmGawEVKRz8CRmk1HH0+8X0
	H8jsWOoS5KyL6CvYPSzkcKM/vmWchsR56xwEfCG8JTgAMuA1W/6w1UED9IbF84DRbGz6cA
	MzWTLe1uNCJnrqHBv1YD+id2bjbLk58=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B5699ACA3;
	Fri, 30 Oct 2020 10:49:22 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
 <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
 <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cfcda4c-4115-e057-f401-5103f5b5b8e8@suse.com>
Date: Fri, 30 Oct 2020 11:49:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.2020 11:38, Julien Grall wrote:
> On 22/10/2020 17:17, Jan Beulich wrote:
>> On 22.10.2020 18:00, Roger Pau Monné wrote:
>>> On Tue, Oct 20, 2020 at 04:10:09PM +0200, Jan Beulich wrote:
>>>> --- a/xen/include/xen/event.h
>>>> +++ b/xen/include/xen/event.h
>>>> @@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
>>>>    * Low-level event channel port ops.
>>>>    *
>>>>    * All hooks have to be called with a lock held which prevents the channel
>>>> - * from changing state. This may be the domain event lock, the per-channel
>>>> - * lock, or in the case of sending interdomain events also the other side's
>>>> - * per-channel lock. Exceptions apply in certain cases for the PV shim.
>>>> + * from changing state. This may be
>>>> + * - the domain event lock,
>>>> + * - the per-channel lock,
>>>> + * - in the case of sending interdomain events the other side's per-channel
>>>> + *   lock,
>>>> + * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
>>>> + *   combination with the ordering enforced through how the vCPU's
>>>> + *   virq_to_evtchn[] gets updated),
>>>> + * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
>>>> + * Exceptions apply in certain cases for the PV shim.
>>>
>>> Having such a wide locking discipline looks dangerous to me, it's easy
>>> to get things wrong without notice IMO.
>>
>> It is effectively only describing how things are (or were before
>> XSA-343, getting restored here).
> 
> I agree with Roger here, the new/old locking discipline is dangerous and 
> it is only a matter of time before it will bite us again.
> 
> I think we should consider Juergen's series because the locking for the 
> event channel is easier to understand.

We should, yes. The one thing I'm a little uneasy with is the
new lock "variant" that gets introduced. Custom locking methods
also are a common source of problems (which isn't to say I see
any here).

> With his series in place, this patch will become unecessary.

It'll become less important, but not pointless - any unnecessary
locking would better be removed imo.

I'd also like to note that the non-straightforward locking rules
wouldn't really change with his series; the benefit there really
is the dropping of the need for IRQ-safe locking.

Jan

