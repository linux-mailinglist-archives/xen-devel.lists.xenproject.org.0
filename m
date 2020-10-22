Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76098295B10
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10285.27301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWOS-0007cI-Nf; Thu, 22 Oct 2020 08:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10285.27301; Thu, 22 Oct 2020 08:56:20 +0000
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
	id 1kVWOS-0007bt-KN; Thu, 22 Oct 2020 08:56:20 +0000
Received: by outflank-mailman (input) for mailman id 10285;
 Thu, 22 Oct 2020 08:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVWOQ-0007bN-7e
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:56:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35c70d9a-87f0-4fb9-b743-cbc7a57f3a85;
 Thu, 22 Oct 2020 08:56:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34B45AC82;
 Thu, 22 Oct 2020 08:56:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVWOQ-0007bN-7e
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:56:18 +0000
X-Inumbo-ID: 35c70d9a-87f0-4fb9-b743-cbc7a57f3a85
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 35c70d9a-87f0-4fb9-b743-cbc7a57f3a85;
	Thu, 22 Oct 2020 08:56:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603356975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffs8HVQOl285t4ppCdKCO8F+D0WzOhc8a+9BPoe5kE0=;
	b=FNMxUkIX2Cc0okDFSJ4KIbOPkURaV72SDFVT3TdQaXaBXjhJz3nbxpNfz3sLBiU0Dj2w+O
	kRko8jDaowthsJvyNPrns1KrttHfiwlo7gRn2+YsV1Bm/2MDnEzUL9l4t4VNFsp+XW18wp
	4SeTAAQOUDyyC+rfnGza+fG4EFpb5Ys=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 34B45AC82;
	Thu, 22 Oct 2020 08:56:15 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
 <20201021154650.zz77ircyuedr7gpm@Air-de-Roger>
 <3fd4c197-617e-dd48-6781-9ff0b1a82bf8@suse.com>
 <20201022081100.bedkkvuqf7ymjpbl@Air-de-Roger>
 <2172763f-9f3d-588e-b4f2-0f9187a40ff9@suse.com>
 <20201022082938.jnpw7wvzuvxqa6iy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bc15e6b-cc53-3092-2a56-492a302fbc1e@suse.com>
Date: Thu, 22 Oct 2020 10:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022082938.jnpw7wvzuvxqa6iy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.10.2020 10:29, Roger Pau Monné wrote:
> On Thu, Oct 22, 2020 at 10:15:45AM +0200, Jan Beulich wrote:
>> On 22.10.2020 10:11, Roger Pau Monné wrote:
>>> On Thu, Oct 22, 2020 at 09:33:27AM +0200, Jan Beulich wrote:
>>>> On 21.10.2020 17:46, Roger Pau Monné wrote:
>>>>> On Tue, Oct 20, 2020 at 04:08:13PM +0200, Jan Beulich wrote:
>>>>>> @@ -80,8 +81,9 @@ static uint8_t get_xen_consumer(xen_even
>>>>>>  
>>>>>>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
>>>>>>      {
>>>>>> +        /* Use cmpxchgptr() in lieu of a global lock. */
>>>>>>          if ( xen_consumers[i] == NULL )
>>>>>> -            xen_consumers[i] = fn;
>>>>>> +            cmpxchgptr(&xen_consumers[i], NULL, fn);
>>>>>>          if ( xen_consumers[i] == fn )
>>>>>>              break;
>>>>>
>>>>> I think you could join it as:
>>>>>
>>>>> if ( !xen_consumers[i] &&
>>>>>      !cmpxchgptr(&xen_consumers[i], NULL, fn) )
>>>>>     break;
>>>>>
>>>>> As cmpxchgptr will return the previous value of &xen_consumers[i]?
>>>>
>>>> But then you also have to check whether the returned value is
>>>> fn (or retain the 2nd if()).
>>>
>>> __cmpxchg comment says that success of the operation is indicated when
>>> the returned value equals the old value, so it's my understanding that
>>> cmpxchgptr returning NULL would mean the exchange has succeed and that
>>> xen_consumers[i] == fn?
>>
>> Correct. But if xen_consumers[i] == fn before the call, the return
>> value will be fn. The cmpxchg() wasn't "successful" in this case
>> (it didn't update anything), but the state of the array slot is what
>> we want.
> 
> Oh, I get it now. You don't want the same fn populating more than one
> slot.

FAOD it's not just "want", it's a strict requirement.

> I assume the reads of xen_consumers are not using ACCESS_ONCE or
> read_atomic because we rely on the compiler performing such reads as
> single instructions?

Yes, as in so many other places in the code base.

Jan

