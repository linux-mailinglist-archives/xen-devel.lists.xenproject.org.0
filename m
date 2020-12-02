Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C22CC48F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 19:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42950.77294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWaq-0000kH-8B; Wed, 02 Dec 2020 18:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42950.77294; Wed, 02 Dec 2020 18:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWaq-0000js-4Y; Wed, 02 Dec 2020 18:11:08 +0000
Received: by outflank-mailman (input) for mailman id 42950;
 Wed, 02 Dec 2020 18:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkWao-0000ji-U5
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 18:11:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWao-0008Go-Lk; Wed, 02 Dec 2020 18:11:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWao-0006th-74; Wed, 02 Dec 2020 18:11:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lWlr9lkqrxC598c5YlkM0v2pBVs1jhg/f08ORjhLjRg=; b=O+5fMO5gCB/OmGQCQKHBg0YKDX
	VDx7G403j6A3F0TnFebVBtI909pIuj6IxDnf9GZLzyU5ysSYOs2MmUP5NIrB+D/aDAyNWblw/RMDh
	SyCQpluS5cSjXXZdttUKF2CyUSvVhwhkIc81xARuHnI8aCV9QxyJGDaxYhTip5xWzwR0=;
Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 nd <nd@arm.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
 <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
 <AM0PR08MB3747912905438DA6D7FF969C9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <8f47313a-f47a-520d-3845-3f2198fce5b4@xen.org>
 <AM0PR08MB37478D884057C8720ED1023D9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0a272ffd-24de-2db4-5751-9161cc57cec3@xen.org>
Date: Wed, 2 Dec 2020 18:11:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB37478D884057C8720ED1023D9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 26/11/2020 11:27, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2020年11月26日 18:55
>> To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> Andre Przywara <Andre.Przywara@arm.com>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Kaly Xin <Kaly.Xin@arm.com>; nd
>> <nd@arm.com>
>> Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
>>
>> Hi Wei,
>>
>> Your e-mail font seems to be different to the usual plain text one. Are
>> you sending the e-mail using HTML by any chance?
>>
> 
> It's strange, I always use the plain text.

Maybe exchange decided to mangle the e-mail :). Anyway, this new message 
looks fine.

> 
>> On 26/11/2020 02:07, Wei Chen wrote:
>>> Hi Stefano,
>>>
>>>> -----Original Message-----
>>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>>> Sent: 2020��11��26�� 8:00
>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>> Cc: Julien Grall <julien@xen.org>; Penny Zheng <Penny.Zheng@arm.com>;
>> xen-
>>>> devel@lists.xenproject.org; sstabellini@kernel.org; Andre Przywara
>>>> <Andre.Przywara@arm.com>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>;
>>>> Kaly Xin <Kaly.Xin@arm.com>; nd <nd@arm.com>
>>>> Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
>>>>
>>>> Resuming this old thread.
>>>>
>>>> On Fri, 13 Nov 2020, Wei Chen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 09/11/2020 08:21, Penny Zheng wrote:
>>>>>>> CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
>>>>>>> might return a wrong value when the counter crosses a 32bit boundary.
>>>>>>>
>>>>>>> Until now, there is no case for Xen itself to access CNTVCT_EL0,
>>>>>>> and it also should be the Guest OS's responsibility to deal with
>>>>>>> this part.
>>>>>>>
>>>>>>> But for CNTPCT, there exists several cases in Xen involving reading
>>>>>>> CNTPCT, so a possible workaround is that performing the read twice,
>>>>>>> and to return one or the other depending on whether a transition has
>>>>>>> taken place.
>>>>>>>
>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>
>>>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> On a related topic, do we need a fix similar to Linux commit
>>>>>> 75a19a0202db "arm64: arch_timer: Ensure counter register reads occur
>>>>>> with seqlock held"?
>>>>>>
>>>>>
>>>>> I take a look at this Linux commit, it seems to prevent the seq-lock to be
>>>>> speculated.  Using an enforce ordering instead of ISB after the read counter
>>>>> operation seems to be for performance reasons.
>>>>>
>>>>> I have found that you had placed an ISB before read counter in get_cycles
>>>>> to prevent counter value to be speculated. But you haven't placed the
>> second
>>>>> ISB after reading. Is it because we haven't used the get_cycles in seq lock
>>>>> critical context (Maybe I didn't find the right place)? So should we need to
>> fix it
>>>>> now, or you prefer to fix it now for future usage?
>>>>
>>>> Looking at the call sites, it doesn't look like we need any ISB after
>>>> get_cycles as it is not used in any critical context. There is also a
>>>> data dependency with the value returned by it.
>>
>> I am assuming you looked at all the users of NOW(). Is that right?
>>
>>>>
>>>> So I am thinking we don't need any fix. At most we need an in-code comment?
>>>
>>> I agree with you to add an in-code comment. It will remind us in future when
>> we
>>> use the get_cycles in critical context. Adding it now will probably only lead to
>>> meaningless performance degradation.
>>
>> I read this as there would be no perfomance impact if we add the
>> ordering it now. Did you intend to say?
> 
> Sorry about my English. I intended to say "Adding it now may introduce some
> performance cost. And this performance cost may be not worth. Because Xen
> may never use it in a similar scenario "

Don't worry! I think the performance should not be noticeable if we use 
the same trick as Linux.

>> In addition, AFAICT, the x86 version of get_cycles() is already able to
>> provide that ordering. So there are chances that code may rely on it.
>>
>> While I don't necessarily agree to add barriers everywhere by default
>> (this may have big impact on the platform). I think it is better to have
>> an accurate number of cycles.
>>
> 
> As x86 had done it, I think it’s ok to do it for Arm. This will keep a function
> behaves the same on different architectures.

Just to be clear, I am not 100% sure this is what Intel is doing. 
Although this is my understanding of the comment in the code.

@Stefano, what do you think?

@Wei, assuming Stefano is happy with the proposal, would you be happy to 
send a patch for that?

Best regards,

-- 
Julien Grall

