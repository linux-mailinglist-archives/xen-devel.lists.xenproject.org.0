Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1A3693D7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116369.222118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZw2P-0007HM-K1; Fri, 23 Apr 2021 13:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116369.222118; Fri, 23 Apr 2021 13:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZw2P-0007Eq-GQ; Fri, 23 Apr 2021 13:40:05 +0000
Received: by outflank-mailman (input) for mailman id 116369;
 Fri, 23 Apr 2021 13:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZw2N-0006yk-Ev
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 13:40:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 127b2cdc-7bee-43ad-b4be-d8a73e2f12a2;
 Fri, 23 Apr 2021 13:40:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93370AECD;
 Fri, 23 Apr 2021 13:40:01 +0000 (UTC)
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
X-Inumbo-ID: 127b2cdc-7bee-43ad-b4be-d8a73e2f12a2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619185201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxyV6rigVW3ooS9I7J7VaPdcEyC+YuZAYRQuOTJCg5I=;
	b=a8JQsvmYC2AGVFW0QrzV6+ZAaDlPVuvBHZ5d6eYscg6l5Fi+todh7CSb1kzUpefM786FmV
	hUJKnS9PKEDwN9katmQkR+agUYxThuuzZ4A4gKwYpW7hHnOYAMW68YsPyAA6G14ZT2kzG/
	ClM+XBIiUduIXvm24AgFZyWMrZJnZPE=
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JfQsNC50YbQtdCy?= <zaytsevgu@gmail.com>
Cc: xen-devel@lists.xen.org, Sergey Kovalev <valor@list.ru>
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
 <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <57478641-ed64-32bd-a577-428a50c880e2@suse.com>
 <33f08c57-08f7-b6c3-02ed-2b66c35665f2@list.ru>
 <CADyHojEFuM8mrdyBpQCO+_OJsijfi6nR5YjbHxE3dkTqbAq23Q@mail.gmail.com>
 <3fa1051f-705c-fdf9-272d-69dd9e7dc01d@suse.com>
 <CADyHojFyzqRKHp4aWUFysnHbb3i0tMvM6wEAEd8Y1HHwGkncyQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4fcc303-24c0-6f35-f3d1-d514eeea022c@suse.com>
Date: Fri, 23 Apr 2021 15:40:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CADyHojFyzqRKHp4aWUFysnHbb3i0tMvM6wEAEd8Y1HHwGkncyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 15:30, Георгий Зайцев wrote:
> Thanks, but now I'll need to understand what your quoted "frozen" and
>> "unfrozen" mean. Plus obviously comparators and main counter are also
>> different, and it's there where I suspect the issue is
> 
> "frozen" - this is initial snapshot which takes about from 30 seconds to 1
> minute after restore to start dispatching timer interrupts to windows guest
> "unfrozen" - this is state which taken after restoring "frozen" one and
> waiting 90 seconds when guest start receiving interrupts and starts working
> as expected

So I misunderstood Sergey's original mail - HPET_TN_PERIODIC is clear
immediately after restore, and becomes set some time later. That's
still nothing we can do behind the OSes back. If the OS has cleared
the bit, we need to keep it clear.

Jan

> we also made some another snapshots (again after restoring from initial
> "frozen" one) when system still in 'freezed" state (about ~20-30 seconds
> from start of restore process) and in this snapshots HPET state stays the
> same as in initial "frozen" state except mc64 field:
> capabiliy: f424008086a201
> res0: 0
> config: 3
> res1: 0
> isr: 0
> res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0]
> mc64: 9bafb6e4e
> res3: 0
> timer0:
>         config: f0000000002934
>         cmp: fd4aa84c
>         fsb: 0
>         res4: 0
> timer1:
>         config: f0000000000130
>         cmp: ffffffff
>         fsb: 0
>         res4: 0
> timer2:
>         config: f0000000000130
>         cmp: ffffffff
>         fsb: 0
>         res4: 0
> period[0] = ee6b2
> period[1] = 0
> period[2] = 0
> 
> пт, 23 апр. 2021 г. в 16:21, Jan Beulich <jbeulich@suse.com>:
> 
>> On 23.04.2021 15:10, Георгий Зайцев wrote:
>>>>
>>>> Since
>>>> you've taken apart saved state, could you supply the full set of
>>>> values (ideally multiple ones, if you happen to have them, plus
>>>> ones where the problem didn't occur, to allow someone perhaps
>>>> spot a pattern)?
>>>>
>>>
>>> Here is full HPET state from "frozen" snapshot according to hvm_hw_hpet
>>> structure:
>>>
>>> capabiliy: f424008086a201
>>> res0: 0
>>> config: 3
>>> res1: 0
>>> isr: 0
>>> res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>> 0,
>>> 0, 0]
>>> mc64: 97b90bc74
>>> res3: 0
>>> timer0:
>>>         config: f0000000002934
>>>         cmp: fd4aa84c
>>>         fsb: 0
>>>         res4: 0
>>> timer1:
>>>         config: f0000000000130
>>>         cmp: ffffffff
>>>         fsb: 0
>>>         res4: 0
>>> timer2:
>>>         config: f0000000000130
>>>         cmp: ffffffff
>>>         fsb: 0
>>>         res4: 0
>>> period[0] = ee6b2
>>> period[1] = 0
>>> period[2] = 0
>>>
>>> This one taken from snapshot of "unfrozen" one:
>>>
>>> capabiliy: f424008086a201
>>> res0: 0
>>> config: 3
>>> res1: 0
>>> isr: 0
>>> res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>> 0,
>>> 0, 0]
>>> mc64: acbd23c57
>>> res3: 0
>>> timer0:
>>>         config: f000000000293c
>>>         cmp: acbd3761b
>>>         fsb: 0
>>>         res4: 0
>>> timer1:
>>>         config: f0000000000130
>>>         cmp: ffffffff
>>>         fsb: 0
>>>         res4: 0
>>> timer2:
>>>         config: f0000000000130
>>>         cmp: ffffffff
>>>         fsb: 0
>>>         res4: 0
>>> period[0] = ee6b2
>>> period[1] = 0
>>> period[2] = 0
>>>
>>> The only difference is HPET_TN_PERIODIC flag for timers[0].config value
>>
>> Thanks, but now I'll need to understand what your quoted "frozen" and
>> "unfrozen" mean. Plus obviously comparators and main counter are also
>> different, and it's there where I suspect the issue is.
>>
>> Jan
>>
> 


