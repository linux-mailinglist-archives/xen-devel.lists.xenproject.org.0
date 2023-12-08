Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0680A2C9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 13:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650599.1016284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZbp-0005xD-5y; Fri, 08 Dec 2023 12:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650599.1016284; Fri, 08 Dec 2023 12:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZbp-0005v1-3A; Fri, 08 Dec 2023 12:05:33 +0000
Received: by outflank-mailman (input) for mailman id 650599;
 Fri, 08 Dec 2023 12:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBZbo-0005uv-4C
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 12:05:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBZbn-0005ti-Fr; Fri, 08 Dec 2023 12:05:31 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBZbn-0000Ip-6z; Fri, 08 Dec 2023 12:05:31 +0000
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
	bh=4eqN/7ztqqNjke1hpK2OK9EhZDSJm1aW2ryPKfCkv/8=; b=R6wFuzDLcsoO+wYuQt3K3WbAEo
	ApVjwm7mQW0aOv8A6kC32U89txDoRd3a8DZ0hBXrOHM/gRRHT9zhIFcwl28F+kOP0+BYw4+yb1fql
	YXRbzjoEfQZp3Z6FtEaH6JqPr0yy6qMyAdhx2ai03gMfArQx75pT8Xmft4l8pDxGDvG0=;
Message-ID: <8f0a66e9-70bc-421e-8069-88fed9dee4ed@xen.org>
Date: Fri, 8 Dec 2023 12:05:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
 <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/12/2023 09:50, Michal Orzel wrote:
> On 08/12/2023 10:21, Henry Wang wrote:
>>> On Dec 8, 2023, at 17:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>> On 08/12/2023 10:05, Henry Wang wrote:
>>>>
>>>> Hi Michal,
>>>>
>>>>> On Dec 8, 2023, at 16:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>> Hi Henry,
>>>>>
>>>>> On 08/12/2023 06:46, Henry Wang wrote:
>>>>>> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>>> new file mode 100755
>>>>>> index 0000000000..25d9a5f81c
>>>>>> --- /dev/null
>>>>>> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>>> @@ -0,0 +1,73 @@
>>>>>> +#!/usr/bin/expect
>>>>>> +
>>>>>> +set timeout 2000
>>>>> Do we really need such a big timeout (~30 min)?
>>>>> Looking at your test job, it took 16 mins (quite a lot but I know FVP is slow
>>>>> + send_slow slows things down)
>>>>
>>>> This is a really good question. I did have the same question while working on
>>>> the negative test today. The timeout 2000 indeed will fail the job at about 30min,
>>>> and waiting for it is indeed not really pleasant.
>>>>
>>>> But my second thought would be - from my observation, the overall time now
>>>> would vary between 15min ~ 20min, and having a 10min margin is not that crazy
>>>> given that we probably will do more testing from the job in the future, and if the
>>>> GitLab Arm worker is high loaded, FVP will probably become slower. And normally
>>>> we don’t even trigger the timeout as the job will normally pass. So I decided
>>>> to keep this.
>>>>
>>>> Mind sharing your thoughts about the better value of the timeout? Probably 25min?
>>>  From what you said that the average is 15-20, I think we can leave it set to 30.
>>> But I wonder if we can do something to decrease the average time. ~20 min is a lot
>>> even for FVP :) Have you tried setting send_slow to something lower than 100ms?
>>> That said, we don't send too many chars to FVP, so I doubt it would play a major role
>>> in the overall time.
>>
>> I agree with the send_slow part. Actually I do have the same concern, here are my current
>> understanding and I think you will definitely help with your knowledge:
>> If you check the full log of Dom0 booting, for example [1], you will find that we wasted so
>> much time in starting the services of the OS (modloop, udev-settle, etc). All of these services
>> are retried many times but in the end they are still not up, and from my understanding they
>> won’t affect the actual test(?) If we can somehow get rid of these services from rootfs, I think
>> we can save a lot of time.
>>
>> And honestly, I noticed that qemu-alpine-arm64-gcc suffers from the same problem and it also
>> takes around 15min to finish. So if we managed to tailor the services from the filesystem, we
>> can save a lot of time.
> That is not true. Qemu runs the tests relatively fast within few minutes. The reason you see e.g. 12 mins
> for some Qemu jobs comes from the timeout we set in Qemu scripts. We don't have yet the solution (we could
> do the same as Qubes script) to detect the test success early and exit before timeout. That is why currently
> the only way for Qemu tests to finish is by reaching the timeout.
> 
> So the problem is not with the rootfs and services (the improvement would not be significant) but with
> the simulation being slow.

 From my experience with the FVP improvement would be significant. A 
normal boot distribution will start a lot of services. I end up to write 
my own initscript doing the bare minimum for creating a guest. This 
saves me a lot of time everytime I needed to test on FVP.

I think we can do the same for the gitlab. Maybe not to the point of 
writing your initscript but cutting down anything unnecessary.

This will avoid the FVP test to become the bottlneck in the gitlab CI.

Chers,

-- 
Julien Grall

