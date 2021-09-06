Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58D401F39
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 19:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180135.326641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIY1-00087J-Rj; Mon, 06 Sep 2021 17:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180135.326641; Mon, 06 Sep 2021 17:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIY1-00084V-O9; Mon, 06 Sep 2021 17:36:45 +0000
Received: by outflank-mailman (input) for mailman id 180135;
 Mon, 06 Sep 2021 17:36:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNIY0-00084P-NE
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 17:36:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNIY0-00019c-7Y; Mon, 06 Sep 2021 17:36:44 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNIY0-0003cC-12; Mon, 06 Sep 2021 17:36:44 +0000
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
	bh=pfsAuKPr2auWUICkRafD2Xiy/uvIwmtJIwYIY7f4TAk=; b=wJtyMdrzHWQK6ZAa4IRuSE4Z3a
	SlbWGc8jfPzzDAOFtcZzZtNypBcL9z7GDOolAq8V9GtWQ+ZTQtLlN7TNeAnpCRMyxo2cXgs0l6dTq
	g/tHed8xO9LW7VqF2ikte83D8D/i3+d8fCc6Itrd0KSvCSZfCbCWeL3Ts9RtgXPXYgH8=;
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
 <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
 <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
 <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
 <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s>
 <D0CCB87F-1CC1-450B-A612-E4B505B36B5B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7fc6e6b6-464a-a305-2693-42cba40ad869@xen.org>
Date: Mon, 6 Sep 2021 18:36:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <D0CCB87F-1CC1-450B-A612-E4B505B36B5B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 06/09/2021 09:29, Bertrand Marquis wrote:
>> On 3 Sep 2021, at 23:49, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 31 Aug 2021, Bertrand Marquis wrote:
>>> Hi Julien,
>>>
>>>> On 31 Aug 2021, at 15:47, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 31/08/2021 14:17, Bertrand Marquis wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Bertrand,
>>>>
>>>>>> On 27 Aug 2021, at 16:05, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi Bertrand,
>>>>>>
>>>>>> On 25/08/2021 14:18, Bertrand Marquis wrote:
>>>>>>> Sanitize CTR_EL0 value between cores.
>>>>>>> In most cases different values will taint Xen but if different
>>>>>>> i-cache policies are found, we choose the one which will be compatible
>>>>>>> between all cores in terms of invalidation/data cache flushing strategy.
>>>>>>
>>>>>> I understand that all the CPUs in Xen needs to agree on the cache flush strategy. However...
>>>>>>
>>>>>>> In this case we need to activate the TID2 bit in HCR to emulate the
>>>>>>> TCR_EL0 register for guests. This patch is not activating TID2 bit all
>>>>>>> the time to limit the overhead when possible.
>>>>>>
>>>>>> as we discussed in an earlier version, a vCPU is unlikely (at least in short/medium) to be able move across pCPU of different type. So the vCPU would be pinned to a set of pCPUs. IOW, the guest would have to be big.LITTLE aware and therefore would be able to do its own strategy decision.
>>>>>>
>>>>>> So I think we should be able to get away from trappings the registers.
>>>>> I do agree that we should be able to get away from that in the long term once
>>>>> we have cpupools properly set but right now this is the only way to have
>>>>> something useable (I will not say right).
>>>>> I will work on finding a way to setup properly cpupools (or something else as
>>>>> we discussed earlier) but in the short term I think this is the best we can do.
>>>>
>>>> My concern is you are making look like Xen will be able to deal nicely with big.LITTLE when in fact there are a lot more potential issue by allow a vCPU moving accross pCPU of different type (the errata is one example).
>>>
>>> I agree and this is why Xen is tainted.
>>>
>>>>
>>>>> An other solution would be to discard this patch from the serie for now until
>>>>> I have worked a proper solution for this case.
>>>>> Should we discard or merge or do you have an other idea ?
>>>> Please correct me if I am wrong, at the moment, it doesn't look like this patch will be part of the longer plan. If so, then I think it should be parked for now.
>>>
>>> Not sure it depends on what the final solution would be but this is highly possible I agree.
>>>
>>>>
>>>> This would also have the advantage to avoid spending too much time on resolving the emulation issue I mentioned in my previous answer.
>>>>
>>>> No need to resend a new version of this series yet. You can wait until the rest of the series get more feedback.
>>>
>>> Ok, I will wait for feedback and next serie will not include this patch anymore.
>>
>> Would it be worth keeping just the part that sanitizes ctr, without any
>> of the emulation stuff? That way we could still detect cases where there
>> is a mismatch between CPUs, print a useful message and taint Xen.
> 
> That’s a good idea, it means removing the emulation part and just keep the sanitization.
> 
> @Julien: would you be ok with that ?

I actually thought about suggesting it before Stefano did it. So I am OK 
with that.

> 
> Should I send a v4 or should we use Stefano’s patch directly instead ?

I would suggest to send a v4. This needs a signed-off-by from Stefano 
and a new commit message.

Cheers,

-- 
Julien Grall

