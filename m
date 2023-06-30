Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58544743890
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 11:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557401.870718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFAfU-0002kW-E3; Fri, 30 Jun 2023 09:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557401.870718; Fri, 30 Jun 2023 09:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFAfU-0002hs-BI; Fri, 30 Jun 2023 09:43:56 +0000
Received: by outflank-mailman (input) for mailman id 557401;
 Fri, 30 Jun 2023 09:43:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qFAfS-0002hm-RT
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 09:43:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFAfS-0001z8-CC; Fri, 30 Jun 2023 09:43:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFAfS-0002Nd-6d; Fri, 30 Jun 2023 09:43:54 +0000
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
	bh=Krq3Rh9oPAnzdk42Tuznp22Eou70ZfaQFy5yzDA++tI=; b=2NXX+Egk/QGYKNdojBMIB7Kkt3
	k6YZZcqHbMUFfcwfmP7A46KBJe7JRVA7Nf3V73mi6CKzS/7FDYrbvhimT9UFF/MF7702rVSeEnTiS
	64SHrOu4Xm/HWBqHhnFBnxzfM5+IvfnlxAw9cNuNrchPEjPkxBcAVBXXH6W8tCGMwgY4=;
Message-ID: <99e28fa1-b702-a4c4-47e7-b023237f5817@xen.org>
Date: Fri, 30 Jun 2023 10:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
 <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
 <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
 <6a06868f-beea-13c3-5d18-23930c7dd971@xen.org>
 <5ae6e98a-2bfe-b48d-0dae-96ae1d76f79e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ae6e98a-2bfe-b48d-0dae-96ae1d76f79e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/06/2023 10:26, Ayan Kumar Halder wrote:
> On 29/06/2023 12:55, Julien Grall wrote:
>>>> Furthermore, from my understanding, at least on Armv8-A, there are 
>>>> caching problem because you will need to save some registers (for 
>>>> the call to set_boot_mpumap()) on the stack with cache disabled. 
>>>> This means the cache will be bypassed. But you may then restore the 
>>>> registers with the cache enabled (the compiler could decide that it 
>>>> is not necessary to read the stack before hand). So you could read 
>>>> the wrong data if there is a stale cacheline.
>>>
>>> Yes, this makes some sense. So will the following make it correct :-
>>
>> I am confused. In a previous answer, I voiced my concerned with trying 
>> to replace the full MPU table. So it is not clear to me why you are 
>> asking me if the following work. Do you still want to do it? If so, why?
> 
> I completely agree with you to set up the MPU table in assembly with the 
> correct permissions for each section (as done by Penny's patch). That 
> would atleast ensure that we don't need to reset the MPU sections for 
> Xen again.
> 
> What I was trying to understand deeper was some of the objections you 
> had raised and if any sort of mitigations are possible.
> 
> Again I am not saying that we need to apply the mitigations (if 
> available) in this particular scenario.
> 
>>
>>>
>>> 1. Execute 'dmb' before invoking enable_mpu(). This will ensure that 
>>> the registers are strictly restored in set_boot_mpumap() before the 
>>> HSCTLR is read.
>>
>> I am afraid I don't know how the DMB will enforce that. Can you clarify?
> 
> pop {r4}  /* As part of set_boot_mpumap() */
> 
> dmb /* This should ensure that r4 is fully restored from the stack 
> before the next instruction. At this point, the D cache is still 
> disabled. */

I don't really see how this helps because the C instruction:

  set_boot_mpumap(....)

could also require to read/write the stack for saving r0-r3. And AFAIK, 
you can't control when this would happen.

Cheers,

-- 
Julien Grall

