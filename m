Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71063248D09
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 19:34:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k85V4-0005w7-8K; Tue, 18 Aug 2020 17:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k85V2-0005w2-Rt
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 17:34:16 +0000
X-Inumbo-ID: a819dd2f-90f5-4106-b638-184706a473e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a819dd2f-90f5-4106-b638-184706a473e4;
 Tue, 18 Aug 2020 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kI6U4rq8oCZ2qU6MqUIKWM4W5IHxs9H1gqT8TYh/4h0=; b=KnErkbahuxlra9tmu3tXO8sh9v
 hoGYfV3DydR5iJ0dpZqhQNXmlZ8UQiUgmg9rDiKqJ4LnUINNBANOc9irA4I3vs7gx36hPHxtQ/jGs
 osG62jaKRHAN9bV/ZHH6HXiri0xydcCjo6+om/YYRW49NQTL6f5Y35b5Ib2pWSNkCgis=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k85Uq-0002AK-Vv; Tue, 18 Aug 2020 17:34:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k85Uq-0004Mo-Hs; Tue, 18 Aug 2020 17:34:04 +0000
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "security@xenproject.org" <security@xenproject.org>,
 Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <jgrall@amazon.com>,
 nd <nd@arm.com>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
 <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
 <5a406d61-293b-8dd7-44c2-d4f5dde4856f@xen.org>
 <7EAB4E0A-338C-4DCF-80A4-A426BC95C051@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5dceeedf-9982-37c5-553e-76f22d9d6db2@xen.org>
Date: Tue, 18 Aug 2020 18:34:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7EAB4E0A-338C-4DCF-80A4-A426BC95C051@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 18/08/2020 18:06, Bertrand Marquis wrote:
> 
> 
>> On 18 Aug 2020, at 17:43, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 18/08/2020 17:35, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>> Somehow we stopped on this thread and you did already most of the work so I think we should try to finish what you started
>>
>> Sorry this fell-through the cracks. I have a new version for patch #1, but not yet patch #2.
> 
> No problem this came back while trying to reduce my todolist stack :-)
> 
>>
>> I am still debating with myself where the speculation barrier should be added after the SMC :).
> 
> I think that we should unless the SMC is in the context switch path (as all other calls should not have a performance impact).
I will introduce *_unsafe() helpers that will not contain the 
speculation barrier. It could then be used in place where we think the 
barrier is unnecessary.

> 
>>
>>>> On 4 Jul 2020, at 17:07, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> On 17/06/2020 17:23, Julien Grall wrote:
>>>>> Hi,
>>>>> On 16/06/2020 22:24, Stefano Stabellini wrote:
>>>>>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>>
>>>>>>> Some CPUs can speculate past a RET instruction and potentially perform
>>>>>>> speculative accesses to memory before processing the return.
>>>>>>>
>>>>>>> There is no known gadget available after the RET instruction today.
>>>>>>> However some of the registers (such as in check_pending_guest_serror())
>>>>>>> may contain a value provided the guest.
>>>>>>                                 ^ by
>>>>>>
>>>>>>
>>>>>>> In order to harden the code, it would be better to add a speculation
>>>>>>> barrier after each RET instruction. The performance is meant to be
>>>>>>> negligeable as the speculation barrier is not meant to be archicturally
>>>>>>> executed.
>>>>>>>
>>>>>>> Note that on arm32, the ldmia instruction will act as a return from the
>>>>>>> function __context_switch(). While the whitepaper doesn't suggest it is
>>>>>>> possible to speculate after the instruction, add preventively a
>>>>>>> speculation barrier after it as well.
>>>>>>>
>>>>>>> This is part of the work to mitigate straight-line speculation.
>>>>>>>
>>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>>
>>>>>> I did a compile-test on the patch too.
>>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> I am still unsure whether we preventively should add a speculation barrier
>>>>>>> preventively after all the RET instructions in arm*/lib/. The smc call be
>>>>>>> taken care in a follow-up patch.
>>>>>>
>>>>>> SMC is great to have but it seems to be overkill to do the ones under
>>>>>> lib/.
>>>>>  From my understanding, the compiler will add a speculation barrier preventively after each 'ret' when the mitigation are turned on.So it feels to me we want to follow the same approach.
>>>>> Obviously, we can avoid them but I would like to have a justification for not adding them (nothing is overkilled against speculation ;)).
>>>>
>>>> I finally found some time to look at arm*/lib in more details. Some of the helpers can definitely be called with guest inputs.
>>>>
>>>> For instance, memchr() is called from hypfs_get_path_user() with the 3rd argument controlled by the guest. In both 32-bit and 64-bit implementation, you will reach the end of the function memchr() with r2/w2 and r3/w3 (it contains a character from the buffer) controlled by the guest.
>>>>
>>>> As this is the only function in the unit, we don't know what will be the instructions right after RET. So it would be safer to add a speculation barrier there too.
>>> How about adding a speculation barrier directly in the ENDPROC macro ?
>>
>> This would unfortunately not cover all the cases because you can return in the middle of the function. I will have a look to see if we can leverage it.
> 
> I agree that it would not solve all of them but a big part would be solved by it.
> An other solution might be to have a RETURN macro encoded as "mov pc,lr; sb" and "ret; sb”.

This is a bit messy on Arm32 because not all the return are using "mov 
pc,lr".  Anyway, I will explore the two approaches.

> 
> The patch sounds good, i just need to find a way to analyse if you missed a ret or not which is not easy with such a patch :-)

I did struggle to find all the instances. The directory lib/ is actually 
quite difficult to go through on 32-bit because they are multiple way to
implement a return.

Finding a way to reduce manual speculation barrier would definitely be 
helpful. I will try to revise the patch during this week.

Cheers,

-- 
Julien Grall

