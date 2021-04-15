Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C453610E1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 19:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111440.213156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX5c4-0002Z2-IH; Thu, 15 Apr 2021 17:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111440.213156; Thu, 15 Apr 2021 17:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX5c4-0002Yd-Eh; Thu, 15 Apr 2021 17:17:08 +0000
Received: by outflank-mailman (input) for mailman id 111440;
 Thu, 15 Apr 2021 17:17:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX5c3-0002YY-Pi
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 17:17:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX5c3-0005Fh-Ee; Thu, 15 Apr 2021 17:17:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX5c3-0007ja-6U; Thu, 15 Apr 2021 17:17:07 +0000
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
	bh=FtpiYvwaV35MTuaioH/zUPTNobvubeCSJAJbMaENIbk=; b=N849VEWRhGSAAOPLx2XIY11lEG
	FSCJjxr0lKhHtyVuyO7qUs04B6rbWfK+0ZUdT4pG6qQZuVUD/kNc2QRiSn8bdMyGPH/zrXm7iuLeC
	9bJfMIy47NLFONk1zIFzfkYMdCKshScj33iytpLW8Fi8Uiy01n8B0HYy7g0tBCllDh6c=;
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
 <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
 <04326BA4-6E73-44BA-AB19-8F2B99000D8B@arm.com>
 <269e20a7-9f2c-f989-0ea0-7ab6c6bb9c11@xen.org>
 <F5760FAD-466F-46EC-A3A4-BAC2B5E73BC8@arm.com>
 <alpine.DEB.2.21.2104141334270.4885@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <e4d32712-3e02-10e6-3273-a8d0253ffcd7@xen.org>
Date: Thu, 15 Apr 2021 18:17:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104141334270.4885@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 14/04/2021 21:35, Stefano Stabellini wrote:
> On Wed, 14 Apr 2021, Luca Fancellu wrote:
>>> On 14 Apr 2021, at 14:45, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Luca,
>>>
>>> On 14/04/2021 12:29, Luca Fancellu wrote:
>>>>> On 14 Apr 2021, at 12:16, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> On 14/04/2021 10:14, Luca Fancellu wrote:
>>>>>> Among the common and arm codebase there are few cases where
>>>>>> the hardware_domain variable is checked to see if the current
>>>>>> domain is equal to the hardware_domain, change this cases to
>>>>>> use is_hardware_domain() function instead. >
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> v4 changes:
>>>>>> - removed unneeded check for domain NULL from is_hardware_domain
>>>>>>    introduced in v3
>>>>>
>>>>> After this change, this patch is only avoid to open-code is_hardware_domain(). Although, it adds an extra speculation barrier.
>>>>>
>>>>> I am not against the change, however I think the commit message needs to updated to match what the patch is doing.
>>>>>
>>>>> Can you propose a new commit message?
>>>> Hi Julien,
>>>> Yes I agree, what about:
>>>> xen/arm: Reinforce use of is_hardware_domain
>>>> Among the common and arm codebase there are few cases where
>>>
>>> I would drop 'common' because you are only modifying the arm codebase.
>>>
>>>> the hardware_domain variable is checked to see if the current
>>>> domain is equal to the hardware_domain, change this cases to
>>>> use is_hardware_domain() function instead.
>>>
>>>
>>>> In the eventuality that hardware_domain is NULL, is_hardware_domain
>>>> will return false because an analysis of the common and arm codebase
>>>> shows that is_hardware_domain is called always with a non NULL
>>>> domain pointer.
>>>
>>> This paragraph seems to come out of the blue. I would drop it.
>>>
>>> How about:
>>>
>>> "
>>> There are a few places on Arm where we use pretty much an open-coded version of is_hardware_domain(). The main difference, is the helper will also block speculation (not yet implemented on Arm).
>>>
>>> The existing users are not in hot path, so blocking speculation would not hurt when it is implemented. So remove the open-coded version within the arm codebase.
>>> "
>>>
>>> If you are happy with the commit message, I will commit it the series tomorrow (to give an opportunity to Stefano to review).
>>>
>>
>> Hi Julien,
>>
>> Yes your version is much better, thank you very much!
> 
> It looks great, thanks for your work on this!

I have committed the series. Thanks for the work!

Cheers,

-- 
Julien Grall

