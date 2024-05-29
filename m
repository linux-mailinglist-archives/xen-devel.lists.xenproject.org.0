Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C36A8D3D3F
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 19:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732279.1138203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMtg-0007NG-Oq; Wed, 29 May 2024 17:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732279.1138203; Wed, 29 May 2024 17:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMtg-0007Kn-LF; Wed, 29 May 2024 17:15:32 +0000
Received: by outflank-mailman (input) for mailman id 732279;
 Wed, 29 May 2024 17:15:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCMtf-0007Kh-P0
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 17:15:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCMta-0003gg-Vh; Wed, 29 May 2024 17:15:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCMta-0006Qf-Nm; Wed, 29 May 2024 17:15:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=9vBy5Q27dCX+E0y7NfJbQrgKRcT+F44lMaupc9twbPc=; b=EbNOnVuEqNPTgoFop2xDPFUZgD
	iFMRO6Zykr9yByKc30DCd8vRvnpsxjBEMGf5g6tPxIof6qNtmqfFt+TP2B1KgRyZuj3CD6GIsIza1
	d9UGiGwfmScOEoY4th398J9hy/dVmEF/Zs4nl22JsPvV94lYbgU0lyviIVO/B4GgfEwA=;
Message-ID: <c53db088-d829-476d-b1cb-e8c8a1cdca63@xen.org>
Date: Wed, 29 May 2024 18:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
 <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
 <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
 <23790bd6-e06a-4adc-90a9-517f947be00a@suse.com>
 <1b301099b71c61c8e537ec6eb8fe064c3c2348f3.camel@gmail.com>
 <3c33c0cc45a8c3b21e5cf8addf2cd34ae017a648.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c33c0cc45a8c3b21e5cf8addf2cd34ae017a648.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/05/2024 17:36, Oleksii K. wrote:
> On Wed, 2024-05-29 at 18:29 +0200, Oleksii K. wrote:
>> On Wed, 2024-05-29 at 17:22 +0200, Jan Beulich wrote:
>>> On 29.05.2024 16:58, Oleksii K. wrote:
>>>> static always_inline bool test_bit(int nr, const volatile void
>>>> *addr)On
>>>> Wed, 2024-05-29 at 12:06 +0200, Jan Beulich wrote:
>>>>> On 29.05.2024 11:59, Julien Grall wrote:
>>>>>> I didn't realise this was an existing comment. I think the
>>>>>> suggestion is
>>>>>> a little bit odd because you could use the atomic version of
>>>>>> the
>>>>>> helper.
>>>>>>
>>>>>> Looking at Linux, the second sentence was dropped. But not
>>>>>> the
>>>>>> first
>>>>>> one. I would suggest to do the same. IOW keep:
>>>>>>
>>>>>> "
>>>>>> If two examples of this operation race, one can appear to
>>>>>> succeed
>>>>>> but
>>>>>> actually fail.
>>>>>> "
>>>>>
>>>>> As indicated, I'm okay with that being retained, but only in a
>>>>> form
>>>>> that
>>>>> actually makes sense. I've explained before (to Oleksii) what I
>>>>> consider
>>>>> wrong in this way of wording things.
>>>>
>>>> Would it be suitable to rephrase it in the following way:
>>>>       * This operation is non-atomic and can be reordered.
>>>>     - * If two examples of this operation race, one can appear to
>>>>     succeed
>>>>     - * but actually fail.  You must protect multiple accesses
>>>> with
>>>> a
>>>>     lock.
>>>>     + * If two instances of this operation race, one may succeed
>>>> in
>>>>     updating
>>>>     + * the bit in memory, but actually fail. It should be
>>>> protected
>>>>     from
>>>>     + * potentially racy behavior.
>>>>       */
>>>>      static always_inline bool
>>>>      __test_and_set_bit(int nr, volatile void *addr)
>>>
>>> You've lost the "appear to" ahead of "succeed". Yet even with the
>>> adjustment
>>> I still don't see what the "appear to succeed" really is supposed
>>> to
>>> mean
>>> here. The issue (imo) isn't with success or failure, but with the
>>> write of
>>> one CPU potentially being immediately overwritten by another CPU,
>>> not
>>> observing the bit change that the first CPU did. IOW both will
>>> succeed (or
>>> appear to succeed), but one update may end up being lost. Maybe
>>> "...,
>>> both
>>> may update memory with their view of the new value, not taking into
>>> account
>>> the update the respectively other one did"? Or "..., both will
>>> appear
>>> to
>>> succeed, but one of the updates may be lost"?
>> For me, the first one is clearer.

I actually find the second better because it explicitely spell out the 
issue. I can live with the first one though.

> If then this part of the comment is needed for test_bit() as it is
> doing only reading?

I don't think so. As Jan said, test_bit() is not a read-modify-write 
operation.

Cheers,

-- 
Julien Grall

