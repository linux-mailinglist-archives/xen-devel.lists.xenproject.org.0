Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE260CA3D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429759.680972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHNc-0002c2-Es; Tue, 25 Oct 2022 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429759.680972; Tue, 25 Oct 2022 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHNc-0002Zw-C2; Tue, 25 Oct 2022 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 429759;
 Tue, 25 Oct 2022 10:41:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onHNa-0002Zq-EM
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:41:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHNa-0000pN-00; Tue, 25 Oct 2022 10:41:54 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHNZ-0000X5-Oy; Tue, 25 Oct 2022 10:41:53 +0000
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
	bh=MF7mZZqvUSt1xgfJMx8Q3rZOLHgmvVGqPVadGreRhXU=; b=Py1xWnmSWQ/79CFZOmLPMI9lPZ
	ZlZyYsSAfee+EnqJpD8Q/d4ruwXR7CEwLGofkEc3UCjOwZAb88Dx0PwiSiqjKPgpMmrkNbgGLa2Ml
	q1NhP51VEP78cEhciGqvWXHLVZQjd5QDLkBhz+5eZmqHJ8PWwNMnz+gOZ8jlbCbllWx8=;
Message-ID: <06307d61-83b7-a01e-8782-0cf9976c5be6@xen.org>
Date: Tue, 25 Oct 2022 11:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC v2 03/12] xen/arm32: head: Introduce an helper to flush the
 TLBs
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-4-julien@xen.org>
 <f50c3f5c-fa71-3963-d95a-d48fe801ad9e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f50c3f5c-fa71-3963-d95a-d48fe801ad9e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2022 10:53, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 22/10/2022 17:04, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The sequence for flushing the TLBs is 4 instruction long and often
>> require an explanation how it works.
> s/require/requires/

Will fix it.

> 
>>
>> So create an helper and use it in the boot code (switch_ttbr() is left
>> alone for now).
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
>> ---
>>   xen/arch/arm/arm32/head.S | 31 ++++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 163bd6596dec..aeaa8d105aeb 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -66,6 +66,21 @@
>>           add   \rb, \rb, r10
>>   .endm
>>
>> +/*
>> + * Flush local TLBs
>> + *
>> + * tmp1:    Scratch register
> I would love to adhere to the way of describing macro params like you did in mov_w. This would mean:
> @tmp: scratch register

ok.

> 
> Apart from that, the change looks ok.
> 
> Question on the side:
> Why do we use nshst in assembly and ishst in TLB helper macro? > Is it because the latter is also used to flush the inner TLBs whereas 
the former only local ones?

nshst is sufficient for local TLBs flush.

The *_local helpers could also use 'nshst' but when they were introduced 
it wasn't clear whether 'nshst' was enough. I only got the confirmation 
after and never took the opportunity to update the code.

Cheers,

-- 
Julien Grall

