Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CD2A0625
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 14:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15807.38983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYU3H-00015n-27; Fri, 30 Oct 2020 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15807.38983; Fri, 30 Oct 2020 13:02:43 +0000
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
	id 1kYU3G-00015O-Uy; Fri, 30 Oct 2020 13:02:42 +0000
Received: by outflank-mailman (input) for mailman id 15807;
 Fri, 30 Oct 2020 13:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kYU3F-00015J-NE
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:02:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab15d3a3-c083-4a22-99ec-a9b9d638c634;
 Fri, 30 Oct 2020 13:02:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50BF6AD8C;
 Fri, 30 Oct 2020 13:02:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kYU3F-00015J-NE
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:02:41 +0000
X-Inumbo-ID: ab15d3a3-c083-4a22-99ec-a9b9d638c634
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab15d3a3-c083-4a22-99ec-a9b9d638c634;
	Fri, 30 Oct 2020 13:02:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604062959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iV3Cb9zvHsPX7b6ab2O9GBxeolEMTUCe1B+5yU2dZtY=;
	b=a7NWJF6KiyuccoOgXK9+mfdbJOqNA5NI/9QfIImWCuh++AxblODJEg70Qkuj0OrFuXWhBO
	7GzRjRBgFQEYvgaYDT5bWwIgklmdQkDfHzJIgQ/cjAWCsA19llM8ridn7G+GwSHNK/g7bq
	TadAw3SvaF2HNFkGA6bTriqk9t+L5Fg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 50BF6AD8C;
	Fri, 30 Oct 2020 13:02:39 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
 <20201022160055.nlucvj2bsxolxd5o@Air-de-Roger>
 <dc7de861-a94c-3ef9-8dbd-ee7a5ba293c4@suse.com>
 <dbb776ad-5b0c-c0a7-8f01-66e60fd7fad9@xen.org>
 <2cfcda4c-4115-e057-f401-5103f5b5b8e8@suse.com>
 <08108cd3-530f-3fe9-e1b2-41c7da9f98b7@xen.org>
 <693bb422-ed13-9327-5f22-12bd6f192916@suse.com>
 <46d5f9cf-c01d-c0c2-777a-c97736633120@suse.com>
 <dc870eaa-6021-1c3e-c2ef-99e3cdb4fcc5@suse.com>
 <53b9685c-92ed-15a5-2ade-d17fd5d398c2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c3c41eb8-de3d-3331-1db1-f86706544d82@suse.com>
Date: Fri, 30 Oct 2020 14:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <53b9685c-92ed-15a5-2ade-d17fd5d398c2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.10.20 13:52, Jan Beulich wrote:
> On 30.10.2020 13:27, Jürgen Groß wrote:
>> On 30.10.20 12:55, Jan Beulich wrote:
>>> On 30.10.2020 12:15, Jürgen Groß wrote:
>>>> On 30.10.20 11:57, Julien Grall wrote:
>>>>> On 30/10/2020 10:49, Jan Beulich wrote:
>>>>>> On 30.10.2020 11:38, Julien Grall wrote:
>>>>>>> I think we should consider Juergen's series because the locking for the
>>>>>>> event channel is easier to understand.
>>>>>>
>>>>>> We should, yes. The one thing I'm a little uneasy with is the
>>>>>> new lock "variant" that gets introduced. Custom locking methods
>>>>>> also are a common source of problems (which isn't to say I see
>>>>>> any here).
>>>>>
>>>>> I am also unease with a new lock "variant". However, this is the best
>>>>> proposal I have seen so far to unblock the issue.
>>>>>
>>>>> I am open to other suggestion with simple locking discipline.
>>>>
>>>> In theory my new lock variant could easily be replaced by a rwlock and
>>>> using the try-variant for the readers only.
>>>
>>> Well, only until we would add check_lock() there, which I think
>>> we should really have (not just on the slow paths, thanks to
>>> the use of spin_lock() there). The read-vs-write properties
>>> you're utilizing aren't applicable in the general case afaict,
>>> and hence such checking would get in the way.
>>
>> No, I don't think so.
>>
>> As long as there is no read_lock() user with interrupts off we should be
>> fine. read_trylock() is no problem as it can't block.
> 
> How would check_lock() notice the difference? It would be all the
> same for read and write acquires of the lock, I think, and hence
> it would still get unhappy about uses from IRQ paths afaict.

check_lock() isn't applicable here, at least not without modification.

I think our spinlock implementation is wrong in this regard in case a
lock is entered via spin_trylock(), BTW. Using spin_trylock() with
interrupts off for a lock normally taken with interrupts enabled is
perfectly fine IMO.


Juergen


