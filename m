Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0997312F76
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82762.152974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l948c-0003CQ-Gy; Mon, 08 Feb 2021 10:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82762.152974; Mon, 08 Feb 2021 10:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l948c-0003C1-DO; Mon, 08 Feb 2021 10:51:26 +0000
Received: by outflank-mailman (input) for mailman id 82762;
 Mon, 08 Feb 2021 10:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l948b-0003Bw-Bj
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:51:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b9dc084-37a9-4b2a-b62b-de959e808245;
 Mon, 08 Feb 2021 10:51:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AA6AAD57;
 Mon,  8 Feb 2021 10:51:23 +0000 (UTC)
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
X-Inumbo-ID: 0b9dc084-37a9-4b2a-b62b-de959e808245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612781483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKk2PET/f9qNuvf7nanooRSg83l7JBZ1VosjaVLv5Ps=;
	b=e9UtpokbF6fi0pxElC4p1PwXwmOVndw2KQt7dhC6iEVrMSf9LpjM1icoierv4AJKNlcWWB
	m/mrsmy3iycBc2AW0di72WG7yB5xOLvH9OlRuud6i5L+6nayIOxAoGOFKnDHpXbMvP6rDS
	/IXghosceH/GCA5VWljWQmL16eiLCKM=
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
 <72334160-cffe-2d8a-23b7-2ea9ab1d803a@suse.com>
 <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e88526ac-6972-fe08-c58f-ea872cbdcc14@suse.com>
Date: Mon, 8 Feb 2021 11:51:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.02.2021 11:41, Jürgen Groß wrote:
> On 08.02.21 10:48, Jan Beulich wrote:
>> On 06.02.2021 11:49, Juergen Gross wrote:
>>> In evtchn_read() use READ_ONCE() for reading the producer index in
>>> order to avoid the compiler generating multiple accesses.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   drivers/xen/evtchn.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>>> index 421382c73d88..f6b199b597bf 100644
>>> --- a/drivers/xen/evtchn.c
>>> +++ b/drivers/xen/evtchn.c
>>> @@ -211,7 +211,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
>>>   			goto unlock_out;
>>>   
>>>   		c = u->ring_cons;
>>> -		p = u->ring_prod;
>>> +		p = READ_ONCE(u->ring_prod);
>>>   		if (c != p)
>>>   			break;
>>
>> Why only here and not also in
>>
>> 		rc = wait_event_interruptible(u->evtchn_wait,
>> 					      u->ring_cons != u->ring_prod);
>>
>> or in evtchn_poll()? I understand it's not needed when
>> ring_prod_lock is held, but that's not the case in the two
>> afaics named places. Plus isn't the same then true for
>> ring_cons and ring_cons_mutex, i.e. aren't the two named
>> places plus evtchn_interrupt() also in need of READ_ONCE()
>> for ring_cons?
> 
> The problem solved here is the further processing using "p" multiple
> times. p must not be silently replaced with u->ring_prod by the
> compiler, so I probably should reword the commit message to say:
> 
> ... in order to not allow the compiler to refetch p.

I still wouldn't understand the change (and the lack of
further changes) then: The first further use of p is
outside the loop, alongside one of c. IOW why would c
then not need treating the same as p?

I also still don't see the difference between latching a
value into a local variable vs a "freestanding" access -
neither are guaranteed to result in exactly one memory
access afaict.

And of course there's also our beloved topic of access
tearing here: READ_ONCE() also excludes that (at least as
per its intentions aiui).

Jan

