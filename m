Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFE2C3A3F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 08:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37369.69695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khpRh-0004n7-Hz; Wed, 25 Nov 2020 07:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37369.69695; Wed, 25 Nov 2020 07:42:33 +0000
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
	id 1khpRh-0004mi-El; Wed, 25 Nov 2020 07:42:33 +0000
Received: by outflank-mailman (input) for mailman id 37369;
 Wed, 25 Nov 2020 07:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khpRf-0004md-DM
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:42:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f19419f4-4388-4a41-817f-007d89e54115;
 Wed, 25 Nov 2020 07:42:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 491C3ABCE;
 Wed, 25 Nov 2020 07:42:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khpRf-0004md-DM
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:42:31 +0000
X-Inumbo-ID: f19419f4-4388-4a41-817f-007d89e54115
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f19419f4-4388-4a41-817f-007d89e54115;
	Wed, 25 Nov 2020 07:42:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606290149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzNZvDJCrng9xpCqfvz3Hpxclv9cnb+ur1jrb1jh5Tk=;
	b=UkKf78Dawy1wI1w4cmcJ1r+MGNGlLnAvem3cQfw0GZsMCeAlXRmsOLVJe+Tq7/AZbuxnM7
	aqOxDEcJQndScJjqyiyf8Ufos+wZdtGvZGhYkRdTJcU4sM0GZuNUUMi/VNU9RQC9soyKxu
	bzdUV4gr3j79ydgK0NL1WamyBAJfdBE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 491C3ABCE;
	Wed, 25 Nov 2020 07:42:29 +0000 (UTC)
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
 <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
 <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3091b91-b594-7a5e-f008-6df10db227ec@suse.com>
Date: Wed, 25 Nov 2020 08:42:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.11.2020 06:23, Jürgen Groß wrote:
> On 24.11.20 17:32, Jan Beulich wrote:
>> On 24.11.2020 15:49, Jürgen Groß wrote:
>>> On 24.11.20 15:02, Jan Beulich wrote:
>>>> On 24.11.2020 08:01, Juergen Gross wrote:
>>>>> Two cpus entering evtchn_fifo_set_pending() for the same event channel
>>>>> can race in case the first one gets interrupted after setting
>>>>> EVTCHN_FIFO_PENDING and when the other one manages to set
>>>>> EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
>>>>> lead to evtchn_check_pollers() being called before the event is put
>>>>> properly into the queue, resulting eventually in the guest not seeing
>>>>> the event pending and thus blocking forever afterwards.
>>>>>
>>>>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel
>>>>> lock") made the race just more obvious, while the fifo event channel
>>>>> implementation had this race from the beginning when an unmask operation
>>>>> was running in parallel with an event channel send operation.
>>>>
>>>> Ah yes, but then also only for inter-domain channels, as it was
>>>> only in that case that the "wrong" domain's event lock was held.
>>>> IOW there was a much earlier change already where this issue
>>>> got widened (when the per-channel locking got introduced). This
>>>> then got reduced to the original scope by XSA-343's adding of
>>>> locking to evtchn_unmask(). (Not sure how much of this history
>>>> wants actually adding here. I'm writing it down not the least to
>>>> make sure I have a complete enough picture.)
>>>
>>> I think we both agree that this race was possible for quite some time.
>>> And I even think one customer bug I've been looking into recently
>>> might be exactly this problem (a dom0 was occasionally hanging in
>>> cross-cpu function calls, but switching to 2-level events made the
>>> problem disappear).
>>
>> IPIs weren't affected earlier on (i.e. in any released version),
>> if my analysis above is correct.
> 
> I don't think it is correct.
> 
> An unmask operation in parallel with set_pending will have had the
> same race for IPIs.

Why? When FIFO locks were introduced, the event lock got acquired
around the call to evtchn_unmask(), and IPIs got sent with that
lock similarly held. Likewise after XSA-343 evtchn_unmask() as
well as the sending of IPIs acquire the per-channel lock (which at
that point was still an ordinary spin lock).

>>>>> Additionally when an
>>>>> event channel needs to change queues both queues need to be locked
>>>>> initially.
>>>>
>>>> Since this was (afaict) intentionally not the case before, I
>>>> think I would want to see a word spent on the "why", perhaps
>>>> better in a code comment than here. Even more so that you
>>>> delete a respective comment justifying the possible race as
>>>> permissible. And I have to admit right now I'm still uncertain
>>>> both ways, i.e. I neither have a clear understanding of why it
>>>> would have been considered fine the other way around before,
>>>> nor why the double locking is strictly needed.
>>>
>>> I need the double locking to avoid someone entering the locked region
>>> when dropping the lock for the old queue and taking the one for the
>>> new queue, as this would open the same race window again.
>>
>> Well, that's what have already said. Thing is that the code
>> prior to your change gives the impression as if this race was
>> benign.
> 
> The race regarding a queue change, yes. But not the race I'm fixing with
> this patch. I need to make sure that only one caller is inside the big
> if clause for a specific event. And dropping the lock inside this clause
> would violate that assumption.

IOW the presumed wrong assumption back then was that the function
would always be called with a lock already held which excludes
the region to be entered twice for the same channel. But - was
this a wrong assumption at the time? Thinking about this again I
now actually come to the conclusion that my analysis above was
wrong in the other direction: Even inter-domain channels did have
consistent locking (of the other side's event lock), preventing
any such race there. Which implies that imo one of the Fixes: tags
wants dropping, as the race became possible only when "downgrading"
some of the involved locks to rw ones. Obviously my "evtchn:
convert vIRQ lock to an r/w one" then extends this race to vIRQ-s.

Jan

