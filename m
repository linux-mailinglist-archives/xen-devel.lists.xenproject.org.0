Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D628D313230
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 13:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82830.153148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l95Zl-0004e8-Sm; Mon, 08 Feb 2021 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82830.153148; Mon, 08 Feb 2021 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l95Zl-0004dj-PI; Mon, 08 Feb 2021 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 82830;
 Mon, 08 Feb 2021 12:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l95Zj-0004de-W0
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 12:23:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f06e92cf-5749-4bb3-aad2-c62a719224c2;
 Mon, 08 Feb 2021 12:23:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7690B0D1;
 Mon,  8 Feb 2021 12:23:25 +0000 (UTC)
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
X-Inumbo-ID: f06e92cf-5749-4bb3-aad2-c62a719224c2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612787006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAbphsKklSMr84x/HNHun/Cn+tfX3a8rPojN7H8+PsE=;
	b=R/yfEUNZkNfprRqDy4QV5LM9vEuMUPZfykspz1LaSTCgKYi56fpfwWc8UbtajswoWLFDTd
	A2t8imjBE3gNj90/nGueDuYq+YxMVAXlP5Yj9H/EVu1OdNOFzGkaKXBwdN5YqVf3Z+Z/0O
	3lugsKSYA0HJlL09fa4E22cCcOSeJdQ=
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
 <72334160-cffe-2d8a-23b7-2ea9ab1d803a@suse.com>
 <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
 <e88526ac-6972-fe08-c58f-ea872cbdcc14@suse.com>
 <d0ca217c-ecc9-55f7-abb1-30a687a46b31@suse.com>
 <a30db278-087b-554c-d5bf-1317e14e8508@suse.com>
 <9d725a1b-ec8e-c078-5ec6-9c4899d4c7aa@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58ec68aa-6d86-62dd-f28a-a4e5754b0fdf@suse.com>
Date: Mon, 8 Feb 2021 13:23:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9d725a1b-ec8e-c078-5ec6-9c4899d4c7aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.02.2021 13:15, Jürgen Groß wrote:
> On 08.02.21 12:54, Jan Beulich wrote:
>> On 08.02.2021 11:59, Jürgen Groß wrote:
>>> On 08.02.21 11:51, Jan Beulich wrote:
>>>> On 08.02.2021 11:41, Jürgen Groß wrote:
>>>>> On 08.02.21 10:48, Jan Beulich wrote:
>>>>>> On 06.02.2021 11:49, Juergen Gross wrote:
>>>>>>> In evtchn_read() use READ_ONCE() for reading the producer index in
>>>>>>> order to avoid the compiler generating multiple accesses.
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>> ---
>>>>>>>     drivers/xen/evtchn.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>>>>>>> index 421382c73d88..f6b199b597bf 100644
>>>>>>> --- a/drivers/xen/evtchn.c
>>>>>>> +++ b/drivers/xen/evtchn.c
>>>>>>> @@ -211,7 +211,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
>>>>>>>     			goto unlock_out;
>>>>>>>     
>>>>>>>     		c = u->ring_cons;
>>>>>>> -		p = u->ring_prod;
>>>>>>> +		p = READ_ONCE(u->ring_prod);
>>>>>>>     		if (c != p)
>>>>>>>     			break;
>>>>>>
>>>>>> Why only here and not also in
>>>>>>
>>>>>> 		rc = wait_event_interruptible(u->evtchn_wait,
>>>>>> 					      u->ring_cons != u->ring_prod);
>>>>>>
>>>>>> or in evtchn_poll()? I understand it's not needed when
>>>>>> ring_prod_lock is held, but that's not the case in the two
>>>>>> afaics named places. Plus isn't the same then true for
>>>>>> ring_cons and ring_cons_mutex, i.e. aren't the two named
>>>>>> places plus evtchn_interrupt() also in need of READ_ONCE()
>>>>>> for ring_cons?
>>>>>
>>>>> The problem solved here is the further processing using "p" multiple
>>>>> times. p must not be silently replaced with u->ring_prod by the
>>>>> compiler, so I probably should reword the commit message to say:
>>>>>
>>>>> ... in order to not allow the compiler to refetch p.
>>>>
>>>> I still wouldn't understand the change (and the lack of
>>>> further changes) then: The first further use of p is
>>>> outside the loop, alongside one of c. IOW why would c
>>>> then not need treating the same as p?
>>>
>>> Its value wouldn't change, as ring_cons is being modified only at
>>> the bottom of this function, and nowhere else (apart from the reset
>>> case, but this can't run concurrently due to ring_cons_mutex).
>>>
>>>> I also still don't see the difference between latching a
>>>> value into a local variable vs a "freestanding" access -
>>>> neither are guaranteed to result in exactly one memory
>>>> access afaict.
>>>
>>> READ_ONCE() is using a pointer to volatile, so any refetching by
>>> the compiler would be a bug.
>>
>> Of course, but this wasn't my point. I was contrasting
>>
>> 		c = u->ring_cons;
>> 		p = u->ring_prod;
>>
>> which you change with
>>
>> 		rc = wait_event_interruptible(u->evtchn_wait,
>> 					      u->ring_cons != u->ring_prod);
>>
>> which you leave alone.
> 
> Can you point out which problem might arise from that?

Not any particular active one. Yet enhancing some accesses
but not others seems to me like a recipe for new problems
down the road.

Jan

