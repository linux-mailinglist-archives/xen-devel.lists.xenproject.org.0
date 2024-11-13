Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10499C79E8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 18:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835938.1251806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBH6r-0000iP-DC; Wed, 13 Nov 2024 17:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835938.1251806; Wed, 13 Nov 2024 17:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBH6r-0000fh-AU; Wed, 13 Nov 2024 17:24:53 +0000
Received: by outflank-mailman (input) for mailman id 835938;
 Wed, 13 Nov 2024 17:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBH6p-0000fb-Gr
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 17:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBH6o-003LIc-2V;
 Wed, 13 Nov 2024 17:24:51 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBH6o-003LNd-2a;
 Wed, 13 Nov 2024 17:24:50 +0000
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
	bh=9AftGS72GNn16imIorFWBxhHYSjQ0uCLlM1fbSrZPCk=; b=O3S1/6nL5jw8IUsFEa22lyoZuv
	aChhd6/pn0DIa1AwxB70Dddu5SD3P4TQ86eq99NdjLyyLFnCVxP9iOLyk2kPGGW04LTe6Db81aeeJ
	XVuTqimLeQ1L9df1szsKcE65p1GbEcVkYiQ2O6+CW7NbsezicvOiRRDh/UHg49WfPR2E=;
Message-ID: <5ea6430a-cd9c-4c5f-83e8-b0a71d333847@xen.org>
Date: Wed, 13 Nov 2024 17:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <3cef1b1a-d17c-498c-a482-6ef01d781392@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3cef1b1a-d17c-498c-a482-6ef01d781392@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/11/2024 16:56, Michal Orzel wrote:
>>>>> For things that Xen can be interested in, only region for ramdisk for dom0 can match the /memreserve/ region.
>>>>> Providing a generic solution (like Luca did) would want providing an example of sth else that can match which I'm not aware of.
>>>>
>>>> I would argue this is the other way around. If we are not certain that
>>>> /memreserve/ will not be used for any other boot module, then we should
>>>> have a generic solution. Otherwise, we will end up with similar weird
>>>> issue in the future.
>>> We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and ramdisk. The first 2 are not described in DT so I'm not sure
>>> what are your examples of bootmodules for which you want kernel know about memory reservation other than ramdisk.
>>
>> The DTB is not described but the kernel is. We also have XSM modules.
>> All of which could in theory be in memreserve if for some reasons the
>> bootloader wanted to preserve the modules for future use (think
>> Live-Update)...
>>
>> Anyway, to be honest, I don't understand why you are pushing back at a
>> more generic solution... Yes this may be what we just notice today, but
>> I haven't seen any evidence that it never happen.
>>
>> So I would rather go with the generic solution.
> My reluctance comes from the fact that it's difficult for me to later justify (if someone asks) a code like that
> in the port we maintain because I can't answer the question about the rationale of other modules.

You also can't answer why it can't happen. So between the choice of 
trying to be future-proof or handling in an emergency, I would chose the 
former. If you want to handle differently in the AMD port, so be it.

 > All you wrote is just a theory.

Hu, seriously? You are basing your decision on observation on a few 
platforms and then you tell me I theorized?

The main source of truth is the specification. This is ...

> Neither you nor anyone seen a code where a bootloader sets up /memreserve/
> for sth else than initrd. That's it.

the only way we can confirm something doesn't happen is based on the 
specification. If it is not written anywhere then it can happen.

I will Nack any patch/approach that is not attempting to look at the 
specification (if any) unless obviously this will break the guest OSes. 
At which point I will weight the pros and cons.

I don't believe this is the case here. So there is no excuses to try to 
take short cut...

Cheers,

-- 
Julien Grall


