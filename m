Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5893FF9B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 22:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767132.1177717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYX7t-0005CJ-K1; Mon, 29 Jul 2024 20:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767132.1177717; Mon, 29 Jul 2024 20:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYX7t-00059U-HF; Mon, 29 Jul 2024 20:37:49 +0000
Received: by outflank-mailman (input) for mailman id 767132;
 Mon, 29 Jul 2024 20:37:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sYX7s-00059O-7T
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 20:37:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYX7r-0006iq-EL; Mon, 29 Jul 2024 20:37:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYX7r-0000ZM-8i; Mon, 29 Jul 2024 20:37:47 +0000
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
	bh=WxX+aslObCObf1hAUxfWsrJcVgPzOA2xLC/B+a390kY=; b=cnM9aIOFddHtkX3dm4CI+u6aGD
	8ANCk8OkvUONcGMSfRnInSmWuXbrmyQfqm7CU3IX/bpqxr1NFg+Ga73B7Z8oYQtfM74aSPiX5aG5c
	8ut6UEk5a5BMtansi9tM8NryjHeKBoB9BE3+4l+Dgcq01B7t+nFWk9zRqOreGEYGItMs=;
Message-ID: <8c013f47-56c9-4b43-8ec2-79230897fedb@xen.org>
Date: Mon, 29 Jul 2024 21:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <e49e00d0-0986-4382-a8c9-1934417eaffc@xen.org>
 <1cf7f9d4-9df8-423b-a033-8c93acb3cfce@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <1cf7f9d4-9df8-423b-a033-8c93acb3cfce@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/07/2024 20:40, Stewart Hildebrand wrote:
> On 7/29/24 14:50, Julien Grall wrote:
>> Hi again,
>>
>> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index aac6c599f878..b4890eec7ec4 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>>>            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>>>    }
>>>    +#ifdef CONFIG_DEBUG
>>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>>> +DEFINE_PER_CPU(unsigned char *, stack_base);
>>
>> While looking at the code, I just realized that this should be equivalent to current->arch.base.
> 
> current->arch.stack
> 
> That's true only after the idle vcpu stacks have been allocated.
> 
>> So do we actually need stack_base?
> 
> This is a way to enable stack instrumentation much earlier during boot
> when we are still using the static boot stack.

Sure. But we are only partially checking the static boot stack. I am not 
entirely sure if there is any value for that because at that point the 
stack would be barely used.

Anyway, this is only for debug build so far, so I am ok to keep it.

Cheers,

-- 
Julien Grall

