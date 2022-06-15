Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBAB54D14C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 21:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350294.576592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1YGi-0006qS-Ul; Wed, 15 Jun 2022 19:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350294.576592; Wed, 15 Jun 2022 19:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1YGi-0006nf-R3; Wed, 15 Jun 2022 19:01:32 +0000
Received: by outflank-mailman (input) for mailman id 350294;
 Wed, 15 Jun 2022 19:01:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1YGh-0006nZ-HQ
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 19:01:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1YGg-0000TB-5w; Wed, 15 Jun 2022 19:01:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.191]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1YGg-0008TW-0D; Wed, 15 Jun 2022 19:01:30 +0000
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
	bh=LTtOR01RoncP8K6/pfJ+xyBfBKFTlHwLxpgpw4eKwA8=; b=j7vpj4zA6Jt/lJ8MyNzG1DS4oX
	TMf2vadAQSPrE/20sHGvyKco6LqoPoC0rnzU6QSFS5kcARgvEwXpwAZWasPq1JOuwYyEHbyktugVW
	vIxNDoq1/3aA8LZZGxEupOKeIh8IUa7oZsnlfsGAz1cxQkga13wKMT88mdPfI8WrHlNc=;
Message-ID: <588f9903-2a0e-a546-912a-24d2a13c3c6f@xen.org>
Date: Wed, 15 Jun 2022 20:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-2-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
 <20220615155825.GA30639@jade>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220615155825.GA30639@jade>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2022 16:58, Jens Wiklander wrote:
> On Fri, Jun 10, 2022 at 05:41:33PM -0700, Stefano Stabellini wrote:
>>>   #endif /* __ASSEMBLY__ */
>>>   
>>>   /*
>>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>>> index 676740ef1520..6f90c08a6304 100644
>>> --- a/xen/arch/arm/vsmc.c
>>> +++ b/xen/arch/arm/vsmc.c
>>> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>>>       switch ( fid )
>>>       {
>>>       case ARM_SMCCC_VERSION_FID:
>>> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
>>> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>>>           return true;
>>    
>> This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
>> is unimplemented on ARM32. If there is an ARM32 implementation in Linux
>> for ARM_SMCCC_VERSION_1_2 you might as well import it too.
>>
>> Otherwise we'll have to abstract it away, e.g.:
>>
>> #ifdef CONFIG_ARM_64
>> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
>> #else
>> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
>> #endif
> 
> I couldn't find an ARM32 implementation for ARM_SMCCC_VERSION_1_2. But
> I'm not sure it's needed at this point. From what I've understood r4-17
> are either preserved or updated by the function ID in question. So
> claiming ARM_SMCCC_VERSION_1_2 shouldn't break anything. 

So in Xen, we always take a snapshot of the registers on entry to the 
hypervisor and only touch it when necessary. Therefore, it doesn't 
matter whether we claim to be complaient with 1.1 or 1.2 based on the 
argument passing convention.

However, the spec is not only about arguments. For instance, SMCCC v1.1 
also added some mandatory functions (e.g. detection the version). I 
haven't looked closely on whether the SMCCC v1.2 introduced such thing. 
Can you confirm what mandatory feature comes with 1.2?

Furthermore, your commit message explain why arm_smccc_1_2_smc() was 
introduced. But it seems to miss some words about exposing SMCCC v2.1 to 
the VM.

In general, I think it is better to split the host support from the VM 
support. The two are technically not independent (caller vs 
implementation) and there are different problematics for each (see above 
for an example). I don't think there are a lot to add here, so I would 
be OK to keep it in the same patch with a few words.

Lastly, can you provide a link to the spec in the commit message? This 
would help to find the pdf easily. I think in this case, you are using
ARM DEN 0028C (this is not the latest but describe 1.2):

https://developer.arm.com/documentation/den0028/c/?lang=en

Cheers,

-- 
Julien Grall

