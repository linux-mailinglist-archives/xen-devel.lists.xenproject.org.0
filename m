Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAFB2C3B08
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37413.69761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khq6q-00010q-8o; Wed, 25 Nov 2020 08:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37413.69761; Wed, 25 Nov 2020 08:25:04 +0000
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
	id 1khq6q-00010R-5B; Wed, 25 Nov 2020 08:25:04 +0000
Received: by outflank-mailman (input) for mailman id 37413;
 Wed, 25 Nov 2020 08:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khq6o-00010M-Lt
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:25:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 684dd49f-fbb8-4395-8681-68770bb2c1cd;
 Wed, 25 Nov 2020 08:25:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02523AF33;
 Wed, 25 Nov 2020 08:25:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khq6o-00010M-Lt
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:25:02 +0000
X-Inumbo-ID: 684dd49f-fbb8-4395-8681-68770bb2c1cd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 684dd49f-fbb8-4395-8681-68770bb2c1cd;
	Wed, 25 Nov 2020 08:25:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606292700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e802/OwdX5CYRWaRzUWRYN2PrzGYFf/d6gxBpboHu8A=;
	b=C/OHRJpoIJOOScLSztOp3EsPsaWk8rNu2UeMfHUYUsfqurOOhVoLr+37CSkbNLSEj1LOvz
	OrDQf4fvEZSeoa3KfFybvfChtyMbmVpxKurMYnljIiyBG9lOcQN34UvwVw+8oSlhsvf3AY
	F/wsB2UmL77e9bO7sEqoPcwCwGvkG70=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 02523AF33;
	Wed, 25 Nov 2020 08:25:00 +0000 (UTC)
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
 <c3091b91-b594-7a5e-f008-6df10db227ec@suse.com>
 <a1b7307a-f825-091f-8499-10e47046ff07@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10293fd3-2893-2dee-c022-a36bec3fc87f@suse.com>
Date: Wed, 25 Nov 2020 09:25:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a1b7307a-f825-091f-8499-10e47046ff07@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.11.2020 09:08, Jürgen Groß wrote:
> On 25.11.20 08:42, Jan Beulich wrote:
>> On 25.11.2020 06:23, Jürgen Groß wrote:
>>> On 24.11.20 17:32, Jan Beulich wrote:
>>>> On 24.11.2020 15:49, Jürgen Groß wrote:
>>>>> On 24.11.20 15:02, Jan Beulich wrote:
>>>>>> On 24.11.2020 08:01, Juergen Gross wrote:
>>>>>>> Two cpus entering evtchn_fifo_set_pending() for the same event channel
>>>>>>> can race in case the first one gets interrupted after setting
>>>>>>> EVTCHN_FIFO_PENDING and when the other one manages to set
>>>>>>> EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
>>>>>>> lead to evtchn_check_pollers() being called before the event is put
>>>>>>> properly into the queue, resulting eventually in the guest not seeing
>>>>>>> the event pending and thus blocking forever afterwards.
>>>>>>>
>>>>>>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel
>>>>>>> lock") made the race just more obvious, while the fifo event channel
>>>>>>> implementation had this race from the beginning when an unmask operation
>>>>>>> was running in parallel with an event channel send operation.
>>>>>>
>>>>>> Ah yes, but then also only for inter-domain channels, as it was
>>>>>> only in that case that the "wrong" domain's event lock was held.
>>>>>> IOW there was a much earlier change already where this issue
>>>>>> got widened (when the per-channel locking got introduced). This
>>>>>> then got reduced to the original scope by XSA-343's adding of
>>>>>> locking to evtchn_unmask(). (Not sure how much of this history
>>>>>> wants actually adding here. I'm writing it down not the least to
>>>>>> make sure I have a complete enough picture.)
>>>>>
>>>>> I think we both agree that this race was possible for quite some time.
>>>>> And I even think one customer bug I've been looking into recently
>>>>> might be exactly this problem (a dom0 was occasionally hanging in
>>>>> cross-cpu function calls, but switching to 2-level events made the
>>>>> problem disappear).
>>>>
>>>> IPIs weren't affected earlier on (i.e. in any released version),
>>>> if my analysis above is correct.
>>>
>>> I don't think it is correct.
>>>
>>> An unmask operation in parallel with set_pending will have had the
>>> same race for IPIs.
>>
>> Why? When FIFO locks were introduced, the event lock got acquired
>> around the call to evtchn_unmask(), and IPIs got sent with that
>> lock similarly held. Likewise after XSA-343 evtchn_unmask() as
>> well as the sending of IPIs acquire the per-channel lock (which at
>> that point was still an ordinary spin lock).
> 
> Oh, I think we are talking about different paths.
> 
> I'm talking about EVTCHNOP_unmask. There is no lock involved when
> calling evtchn_unmask().

Above I said "When FIFO locks were introduced, the event lock got
acquired around the call to evtchn_unmask()" and further "Likewise
after XSA-343 evtchn_unmask() ..." I can't see how we're talking
of different paths here. The situation has changed from back then
(lock in the callers of evtchn_unmask()) to after XSA-343 (lock in
evtchn_unmask()), but there was suitable locking. There was a
(large) window in time prior to XSA-343 where there was indeed no
locking, but that was introduced by the conversion to per-channel
locks and addressed by one of the XSA-343 changes. The issue then
got re-introduced by converting spin_lock() to read_lock().

Jan

