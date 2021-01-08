Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0A2EF0FE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63327.112445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpUm-0006Uc-LG; Fri, 08 Jan 2021 10:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63327.112445; Fri, 08 Jan 2021 10:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpUm-0006UF-IE; Fri, 08 Jan 2021 10:59:52 +0000
Received: by outflank-mailman (input) for mailman id 63327;
 Fri, 08 Jan 2021 10:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxpUl-0006Tr-G8
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 10:59:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbfd965b-6ca6-45b4-b855-ee1b9e4358cf;
 Fri, 08 Jan 2021 10:59:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 867E2ACC6;
 Fri,  8 Jan 2021 10:59:49 +0000 (UTC)
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
X-Inumbo-ID: fbfd965b-6ca6-45b4-b855-ee1b9e4358cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610103589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6qgAC1gkXngWYJVkfjhxssI62MTT+yUu7eKAyV2t6CQ=;
	b=M2H2eSbr5Fk4bwzeA96HdJ1Rkfc1n133T33xSrN2I7y2oWFeVw4h/pDZzUUnPo9x+pIkEl
	UxYMc22v6ac9QigDdmJZxhyLEWS5aNoFj1A/IqNrq6Z5eCvY2UbRqc9BxBp9mssd/keDY0
	q8QKNJuN7ybvlHK4Dw4hKm0ulK84X6E=
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
 <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
 <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
 <e991cf59-89fb-3d5f-98eb-21ba16b0910c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26c3a8ca-37e6-c783-4d98-d5caeb680dd1@suse.com>
Date: Fri, 8 Jan 2021 11:59:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e991cf59-89fb-3d5f-98eb-21ba16b0910c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.01.2021 11:17, Julien Grall wrote:
> Hi Andrew and Jan,
> 
> On 04/01/2021 15:41, Andrew Cooper wrote:
>> On 04/01/2021 15:22, Jan Beulich wrote:
>>> On 04.01.2021 16:04, Andrew Cooper wrote:
>>>> On 23/12/2020 15:13, Jan Beulich wrote:
>>>>> This array can be large when many grant frames are permitted; avoid
>>>>> allocating it when it's not going to be used anyway, by doing this only
>>>>> in gnttab_populate_status_frames().
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>>>      API.
>>>> I see this as a backwards step.  It turns a build-time -ENOMEM into a
>>>> runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
>>>> drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
>>>> but it is in the field now.)
> 
> During yesterday call, Paul pointed that this is a behavior from old 
> Windows driver. New Windows PV driver will not use Grant Table v2.
> 
> However, AFAICT, there is already runtime -ENOMEM failure in set_version 
> when trying to populate the status frame (see the call to 
> gnttab_populate_status_frames()).
> 
>>> Well, if this was the only source of -ENOMEM (i.e. none was there
>>> previously), I'd surely understand the concern. But there have been
>>> memory allocations before on this path.
>>
>> ... you're literally writing a patch saying "avoid large allocation at
>> domain create time, and make it at runtime instead" and then trying to
>> argue that it isn't a concern because there are other memory allocations.
>>
>> It is very definitely a backwards step irrespective of the size of the
>> allocation, even if the current behaviour isn't necessarily perfect.
>>
>>>   In any event, this will
>>> need settling between you and Julien, as it was him to request the
>>> change.
>>
>> Well - that's because gnttab v2 is disabled in general on ARM.
> 
> I didn't have Arm in mind when I originally requested Jan the change.
> 
> Instead, the request was based on the fact that most of the guests don't 
> use of grant-table v2. To me this feels a waste of memory and if it can 
> be avoid then it is best.
> 
>>
>> Conditionally avoiding the allocation because of opt_gnttab_max_version
>> being 1 would be ok, because it doesn't introduce new runtime failures
>> for guests.
> 
> Based on my answer above, I would not consider it as a new runtime 
> failure -ENOMEM is already possible when switching from v1 to v2.
> 
> In fact, the allocation is going to be much smaller than the other 
> allocations (we may be allocating multiple pages). So if we are 
> concerned about this, then we should already be concerned about the 
> existings one.

I agree with all arguments further up, but I'd like to correct this
aspect as well as ...

> Anyway, the array itself is likely going to be small (I haven't computed 
> the size) so I would be OK to not defer the allocation.

... this implication: Strictly speaking there's no correlation
between the allocation sizes. The one getting moved here has its
size depend on the maximum number of grants a domain is allowed
to use. The pre-existing allocation is dependent on the number of
grants the domain has or had already in use. Therefore if the
maximum is much larger than the in-use count, the new allocation
may turn out to be larger than the existing one. Yet I agree this
may not be very likely.

Jan

