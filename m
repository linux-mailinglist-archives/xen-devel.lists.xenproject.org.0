Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6228D017
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6251.16658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSL9p-0001UN-Vj; Tue, 13 Oct 2020 14:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6251.16658; Tue, 13 Oct 2020 14:20:05 +0000
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
	id 1kSL9p-0001T1-RM; Tue, 13 Oct 2020 14:20:05 +0000
Received: by outflank-mailman (input) for mailman id 6251;
 Tue, 13 Oct 2020 14:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSL9o-0001IO-QQ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:20:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7afde62f-5295-4950-b80f-2a41db215f08;
 Tue, 13 Oct 2020 14:20:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FAF2ACBA;
 Tue, 13 Oct 2020 14:20:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSL9o-0001IO-QQ
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:20:04 +0000
X-Inumbo-ID: 7afde62f-5295-4950-b80f-2a41db215f08
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7afde62f-5295-4950-b80f-2a41db215f08;
	Tue, 13 Oct 2020 14:20:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602598802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4nTWGEmb2KFqdqVBpRUOQww36Is/9stM1L4kjlUj9w=;
	b=T8bfPcdqJPQzK4fQZ85f3XyDqg4VPoSec8Vs2TpICcGN9gnu5A/jKDNb8ErFFIK9aWD0wT
	Ejr+cIb/XSP9oKRu7mSkCb/pteBDNQSOPyz2xwsNUKfxAFJJla4hN8UxDPBWbA/KvcWYOE
	7KiN7+vkwyx8QbjCPGUlaEflLahaP88=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6FAF2ACBA;
	Tue, 13 Oct 2020 14:20:02 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <821a77d3-7e37-d1d2-d904-94db0177893a@suse.com>
Date: Tue, 13 Oct 2020 16:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.20 15:58, Jan Beulich wrote:
> On 12.10.2020 11:27, Juergen Gross wrote:
>> The queue for a fifo event is depending on the vcpu_id and the
>> priority of the event. When sending an event it might happen the
>> event needs to change queues and the old queue needs to be kept for
>> keeping the links between queue elements intact. For this purpose
>> the event channel contains last_priority and last_vcpu_id values
>> elements for being able to identify the old queue.
>>
>> In order to avoid races always access last_priority and last_vcpu_id
>> with a single atomic operation avoiding any inconsistencies.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> I seem to vaguely recall that at the time this seemingly racy
> access was done on purpose by David. Did you go look at the
> old commits to understand whether there really is a race which
> can't be tolerated within the spec?

At least the comments in the code tell us that the race regarding
the writing of priority (not last_priority) is acceptable.

Especially Julien was rather worried by the current situation. In
case you can convince him the current handling is fine, we can
easily drop this patch.

> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -114,8 +114,7 @@ struct evtchn
>>           u16 virq;      /* state == ECS_VIRQ */
>>       } u;
>>       u8 priority;
>> -    u8 last_priority;
>> -    u16 last_vcpu_id;
>> +    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
> 
> This grows struct evtchn's size on at least 32-bit Arm. I'd
> like to suggest including "priority" in the union, and call the
> new field simply "fifo" or some such.

This will add quite some complexity as suddenly all writes to the
union will need to be made through a cmpxchg() scheme.

Regarding the growth: struct evtchn is aligned to 64 bytes. So there
is no growth at all, as the size will not be larger than those 64
bytes.


Juergen

