Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C1667F6B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 20:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476383.738520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG3Os-0004vU-Sk; Thu, 12 Jan 2023 19:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476383.738520; Thu, 12 Jan 2023 19:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG3Os-0004t0-Q6; Thu, 12 Jan 2023 19:38:10 +0000
Received: by outflank-mailman (input) for mailman id 476383;
 Thu, 12 Jan 2023 19:38:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pG3Or-0004su-7H
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 19:38:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG3Oq-0001WR-Oo; Thu, 12 Jan 2023 19:38:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.96]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG3Oq-0004nL-G9; Thu, 12 Jan 2023 19:38:08 +0000
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
	bh=KUTTMef6bEj0+C46UuMyREIKXuTlXvdMNg+BvFhrPCU=; b=bjJay9eDf4n/vXfnbYXMWWgR12
	GDcx5CWO2UwMagh1I15GwrvNPtEBcVgNUC68moDx9zjhRlS5JXAYjQ/lxqVchgDSeNm5Ql2FUCkdc
	zGb1HDiyFcW3Qge8zHnPtRBLQUw8Qhk10MmxkDXPTv5Dt5ZOjJVQ52ya7jJUb9IA0Ec4=;
Message-ID: <f7ae4b88-1dff-3b47-36e4-84fc3c1f80e1@xen.org>
Date: Thu, 12 Jan 2023 19:38:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/18] xen/arm32: head: Introduce an helper to flush
 the TLBs
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-9-julien@xen.org>
 <95e9eff5-038d-923f-1afe-4f2d72bde5b3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <95e9eff5-038d-923f-1afe-4f2d72bde5b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/12/2022 14:24, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 12/12/2022 10:55, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The sequence for flushing the TLBs is 4 instruction long and often
>> requires an explanation how it works.
>>
>> So create an helper and use it in the boot code (switch_ttbr() is left
> Here and in title: s/an helper/a helper/

Done.

>> alone for now).
> Could you explain why?

So we need to decide how we expect switch_ttbr(). E.g. if Xen is 
relocated at a different, should the caller take care of the 
instruction/branch predictor flush?

I have expanded to "switch_ttbr() is left alone until we decided the 
semantic of the call".

>>
>> Note that in secondary_switched, we were also flushing the instruction
>> cache and branch predictor. Neither of them was necessary because:
>>      * We are only supporting IVIPT cache on arm32, so the instruction
>>        cache flush is only necessary when executable code is modified.
>>        None of the boot code is doing that.
>>      * The instruction cache is not invalidated and misprediction is not
>>        a problem at boot.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Apart from that, the patch is good, so:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Thanks!

> 
>>
>> ---
>>      Changes in v3:
>>          * Fix typo
>>          * Update the documentation
>>          * Rename the argument from tmp1 to tmp
>> ---
>>   xen/arch/arm/arm32/head.S | 30 +++++++++++++++++-------------
>>   1 file changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 40c1d7502007..315abbbaebec 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -66,6 +66,20 @@
>>           add   \rb, \rb, r10
>>   .endm
>>
>> +/*
>> + * Flush local TLBs
>> + *
>> + * @tmp:    Scratch register
> As you are respinning a series anyway, could you add just one space after @tmp:?

Ok.

Cheers,

-- 
Julien Grall

