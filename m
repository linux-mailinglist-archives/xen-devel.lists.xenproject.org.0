Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD61F3F6C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:33:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigFZ-0004B7-VN; Tue, 09 Jun 2020 15:33:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jigFZ-0004B2-3h
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:33:17 +0000
X-Inumbo-ID: 8876a5b8-aa66-11ea-b335-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8876a5b8-aa66-11ea-b335-12813bfff9fa;
 Tue, 09 Jun 2020 15:33:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3529DAE35;
 Tue,  9 Jun 2020 15:33:17 +0000 (UTC)
Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
To: paul@xen.org
References: <20200608094619.28336-1-paul@xen.org>
 <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
 <002a01d63d84$9c351430$d49f3c90$@xen.org>
 <86e29001-4b33-de46-0675-0107a2e2b386@suse.com>
 <00c201d63e72$a9d28bb0$fd77a310$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7ce8147-149f-fe84-1923-4a436d127996@suse.com>
Date: Tue, 9 Jun 2020 17:33:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <00c201d63e72$a9d28bb0$fd77a310$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?Q?=27Marek_Marczykowski-G=c3=b3recki=27?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.06.2020 17:28, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 09 June 2020 16:08
>> To: paul@xen.org
>> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>; 'Marek Marczykowski-Górecki'
>> <marmarek@invisiblethingslab.com>
>> Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing with ioreq server destruction
>>
>> On 08.06.2020 13:04, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 08 June 2020 11:58
>>>>
>>>> On 08.06.2020 11:46, Paul Durrant wrote:
>>>>> --- a/xen/arch/x86/hvm/ioreq.c
>>>>> +++ b/xen/arch/x86/hvm/ioreq.c
>>>>> @@ -109,15 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu *sv, uint64_t data)
>>>>>      ioreq_t *ioreq = &v->arch.hvm.hvm_io.io_req;
>>>>>
>>>>>      if ( hvm_ioreq_needs_completion(ioreq) )
>>>>> -    {
>>>>> -        ioreq->state = STATE_IORESP_READY;
>>>>>          ioreq->data = data;
>>>>> -    }
>>>>> -    else
>>>>> -        ioreq->state = STATE_IOREQ_NONE;
>>>>> -
>>>>> -    msix_write_completion(v);
>>>>> -    vcpu_end_shutdown_deferral(v);
>>>>>
>>>>>      sv->pending = false;
>>>>>  }
>>>>
>>>> With this, is the function worth keeping at all?
>>>
>>> I did think about that, but it is called in more than one place. So,
>>> in the interest of trying to make back-porting straightforward, I
>>> thought it best to keep it simple.
>>
>> Fair enough, but going forward I still think it would be nice to get
>> rid of the function. To do this sufficiently cleanly, the main
>> question I have is: Why is hvm_wait_for_io() implemented as a loop?
> 
> I guess the idea is that it should tolerate the emulator kicking the
> event channel spuriously. I don't know whether this was the case at
> one time, but it seems reasonable to be robust against waking up
> from wait_on_xen_event_channel() before state has made it to
> IORESP_READY.

But such wakeup is taken care of by "goto recheck", not by the main
loop in the function.

Jan

>> Hasn't this become pointless with the XSA-262 fix? Switching this to
>> a do {} while(false) construct (seeing that the only caller has
>> already checked sv->pending) would look to allow moving what is now
>> in hvm_io_assist() immediately past this construct, at the expense
>> of a local variable holding ~0ul initially and then in the common
>> case p->data.
> 
> That sounds ok. We can do that even with the current while loop by just setting sv->pending to false when we see state == IORESP_READY. After the loop terminates then we can grab the result and set state back to IOREQ_NONE.
> 
>>
>> Thoughts? (I'll be happy to make such a patch, I'm just checking
>> whether I'm overlooking something crucial.)
>>
> 
> Only that I don't think we should use do {} while(false) just in case of early wakeup.
> 
>   Paul
> 
>> Jan
> 


