Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839855E59F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357212.585714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cyr-0005ql-NZ; Tue, 28 Jun 2022 15:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357212.585714; Tue, 28 Jun 2022 15:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cyr-0005nu-Kf; Tue, 28 Jun 2022 15:18:21 +0000
Received: by outflank-mailman (input) for mailman id 357212;
 Tue, 28 Jun 2022 15:18:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6Cyq-0005no-H2
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:18:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Cyp-0001Yr-Ki; Tue, 28 Jun 2022 15:18:19 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.252]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Cyp-00006R-E5; Tue, 28 Jun 2022 15:18:19 +0000
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
	bh=crtC6Ga16gTJ62ZJDhD7WuSz1o1voCcNtctTikjsDyc=; b=XU9P1kw27uCG4RveYaH0W7fLpk
	ptkggeVvRn5FxmZ5BvFAR18RbOy2RSzpquEAzaP5gi8V3eSuAzE/4KKF4h4YxKy7MnaoumeuhgE5a
	uaL6sF+lo8RSIgkjsB+HRY9rzif3mSYr6/vGXz4IbIcohQmwkapujK1l6fsNR6XZTALc=;
Message-ID: <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
Date: Tue, 28 Jun 2022 16:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/06/2022 15:52, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 28 Jun 2022, at 15:26, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 28/06/2022 14:53, Rahul Singh wrote:
>>> Hi Julien
>>
>> Hi Rahul,
>>
>>>> On 23 Jun 2022, at 4:30 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 23/06/2022 16:10, Rahul Singh wrote:
>>>>> Hi Julien,
>>>>>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 22/06/2022 15:38, Rahul Singh wrote:
>>>>>>> Guest can request the Xen to close the event channels. Ignore the
>>>>>>> request from guest to close the static channels as static event channels
>>>>>>> should not be closed.
>>>>>>
>>>>>> Why do you want to prevent the guest to close static ports? The problem I can see is...
>>>>> As a static event channel should be available during the lifetime of the guest we want to prevent
>>>>> the guest to close the static ports.
>>>> I don't think it is Xen job to prevent a guest to close a static port. If the guest decide to do it, then it will just break itself and not Xen.
>>> It is okay for the guest to close a port, port is not allocated by the guest in case of a static event channel.
>> As I wrote before, the OS will need to know that the port is statically allocated when initializing the port (we don't want to call the hypercall to bind the event channel). By extend, the OS should be able to know that when closing it and skip the hypercall.
>>
>>> Xen has nothing to do for close the static event channel and just return 0.
>>
>> Xen would not need to be modified if the OS was doing the right (i.e. no calling close).
>>
>> So it is still unclear why papering over the issue in Xen is the best solution.
> 
> It is not that a static event channel cannot be closed, it is just that during a close there is nothing to do for Xen as the event channel is static and hence is never removed so none of the operations to be done for a non static one are needed (maybe some day some will be, who knows).

I feel there are some disagreement on the meaning of "close" here. In 
the context of event channel, "close" means that the port is marked as 
ECS_FREE.

So I think this is wrong to say that there is nothing to do for "close" 
because after this operation the port will still be "open" (the port 
state will be ECS_INTERDOMAIN).

In fact, to me, a "static" port is the same as if the event channel was 
allocated from the toolstack (for instance this is the case for 
Xenstored). In such case, we are still allowing the guest to close the 
port and then re-opening. So I don't really see why we should diverge here.

> 
> Why requiring the OS to have the knowledge of the fact that an event channel is static or not and introduce some complexity on guest code if we can prevent it ?

I am confused. Your OS already need to know that this is a static port 
(so it doesn't call the hypercall to "open" the port). So why is it a 
non-issue for "opening" but one for "closing" ?

> 
> Doing so would need to have a specific binding in device tree (not to mention the issue on ACPI), 

You already need to create a Device-Tree binding to expose the static 
event-channel. So why is this a new problem?

Likewise for ACPI, you already have this issue with your current proposal.

> a new driver in linux kernel, etc where right now we just need to introduce an extra IOCTL in linux to support this feature.

I don't understand why would need a new driver, etc. Given that you are 
introducing a new IOCTL you could pass a flag to say "This is a static 
event channel so don't close it".

Cheers,

-- 
Julien Grall

