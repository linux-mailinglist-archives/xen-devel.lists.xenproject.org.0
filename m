Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951492C2CFA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 17:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36574.68527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbFF-00027m-4a; Tue, 24 Nov 2020 16:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36574.68527; Tue, 24 Nov 2020 16:32:45 +0000
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
	id 1khbFF-00027N-1K; Tue, 24 Nov 2020 16:32:45 +0000
Received: by outflank-mailman (input) for mailman id 36574;
 Tue, 24 Nov 2020 16:32:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khbFD-00027I-AV
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:32:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 187a57bf-2f6c-4773-b108-20a70d99ac53;
 Tue, 24 Nov 2020 16:32:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5EC96ACA8;
 Tue, 24 Nov 2020 16:32:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khbFD-00027I-AV
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:32:43 +0000
X-Inumbo-ID: 187a57bf-2f6c-4773-b108-20a70d99ac53
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 187a57bf-2f6c-4773-b108-20a70d99ac53;
	Tue, 24 Nov 2020 16:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606235561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhH01bDe6Xjioh8ImKumhNUknUT+Ni63eIuad5SFLbk=;
	b=KItxWpQKS0QD2Hn9eD75oz7vusYrgRgd4r11c+XlynV+r+rak9rapcnyE+on4Z64XO7+O0
	AURrv55wdprdsT/xrgzoUFHaxxUiqGBbHIoixibt/zoVw8Lpuhsiuye/rd8CXvHi3Zi3EF
	XotI0AaZyGaXvF0mvluHbh0aBrpdgZM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5EC96ACA8;
	Tue, 24 Nov 2020 16:32:41 +0000 (UTC)
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
 <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
Date: Tue, 24 Nov 2020 17:32:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 15:49, Jürgen Groß wrote:
> On 24.11.20 15:02, Jan Beulich wrote:
>> On 24.11.2020 08:01, Juergen Gross wrote:
>>> Two cpus entering evtchn_fifo_set_pending() for the same event channel
>>> can race in case the first one gets interrupted after setting
>>> EVTCHN_FIFO_PENDING and when the other one manages to set
>>> EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
>>> lead to evtchn_check_pollers() being called before the event is put
>>> properly into the queue, resulting eventually in the guest not seeing
>>> the event pending and thus blocking forever afterwards.
>>>
>>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel
>>> lock") made the race just more obvious, while the fifo event channel
>>> implementation had this race from the beginning when an unmask operation
>>> was running in parallel with an event channel send operation.
>>
>> Ah yes, but then also only for inter-domain channels, as it was
>> only in that case that the "wrong" domain's event lock was held.
>> IOW there was a much earlier change already where this issue
>> got widened (when the per-channel locking got introduced). This
>> then got reduced to the original scope by XSA-343's adding of
>> locking to evtchn_unmask(). (Not sure how much of this history
>> wants actually adding here. I'm writing it down not the least to
>> make sure I have a complete enough picture.)
> 
> I think we both agree that this race was possible for quite some time.
> And I even think one customer bug I've been looking into recently
> might be exactly this problem (a dom0 was occasionally hanging in
> cross-cpu function calls, but switching to 2-level events made the
> problem disappear).

IPIs weren't affected earlier on (i.e. in any released version),
if my analysis above is correct.

>>> Additionally when an
>>> event channel needs to change queues both queues need to be locked
>>> initially.
>>
>> Since this was (afaict) intentionally not the case before, I
>> think I would want to see a word spent on the "why", perhaps
>> better in a code comment than here. Even more so that you
>> delete a respective comment justifying the possible race as
>> permissible. And I have to admit right now I'm still uncertain
>> both ways, i.e. I neither have a clear understanding of why it
>> would have been considered fine the other way around before,
>> nor why the double locking is strictly needed.
> 
> I need the double locking to avoid someone entering the locked region
> when dropping the lock for the old queue and taking the one for the
> new queue, as this would open the same race window again.

Well, that's what have already said. Thing is that the code
prior to your change gives the impression as if this race was
benign.

>>> +        lastq.raw = read_atomic(&evtchn->fifo_lastq);
>>> +        old_v = d->vcpu[lastq.last_vcpu_id];
>>> +        if ( q == &v->evtchn_fifo->queue[evtchn->priority] &&
>>> +             old_q == &old_v->evtchn_fifo->queue[lastq.last_priority] )
>>> +            break;
>>> +
>>> +        if ( q != old_q )
>>> +            spin_unlock(&old_q->lock);
>>> +        spin_unlock_irqrestore(&q->lock, flags);
>>> +
>>> +        if ( try == 3 )
>>> +        {
>>> +            gprintk(XENLOG_WARNING,
>>> +                    "dom%d port %d lost event (too many queue changes)\n",
>>> +                    d->domain_id, evtchn->port);
>>> +            return;
>>
>> Originally evtchn_check_pollers() would still have been called
>> in this case. Wouldn't you better retain this, or else justify
>> the possibly observable change in behavior?
> 
> I could retain it, but without having set the event to be pending
> I don't see the value in doing so.

But that's part of my concern - you now don't set PENDING when
bailing here.

Jan

