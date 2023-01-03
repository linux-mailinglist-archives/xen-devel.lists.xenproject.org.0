Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905165BD5B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 10:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470518.730046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdqx-0007nA-6Z; Tue, 03 Jan 2023 09:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470518.730046; Tue, 03 Jan 2023 09:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdqx-0007ku-1u; Tue, 03 Jan 2023 09:45:03 +0000
Received: by outflank-mailman (input) for mailman id 470518;
 Tue, 03 Jan 2023 09:45:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pCdqv-0007ko-Sq
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 09:45:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCdqv-0005MU-LU; Tue, 03 Jan 2023 09:45:01 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.2.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCdqv-0001LC-EP; Tue, 03 Jan 2023 09:45:01 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=UNZIIxpcYI8SXohcSlee+JrQs+hB8zr/zTLdkwPGu6U=; b=vXxNb5bT7zMh005sKxH5BTj6ZP
	8kqheebd0ivh1efYQKu5xfDyk0P1bsKqcrCzkQPB8WQwJpueVetAG4xwJlQ7tGX7iJqR0y9pxYnbF
	j7FgOItpEL6pyP0Twc2diHDfHX2nlkJBLN07qlu9No/doBiYWty62vW6zJM1J2vR9vgk=;
Message-ID: <57a19b1b-7078-7653-978a-d4b72e564d1a@xen.org>
Date: Tue, 3 Jan 2023 09:44:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
References: <20230102144904.17619-1-michal.orzel@amd.com>
 <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 03/01/2023 09:21, Ayan Kumar Halder wrote:
> On 02/01/2023 14:49, Michal Orzel wrote:
>> Printing domain's memory size in hex without even prepending it
>> with 0x is not very useful and can be misleading. Switch to decimal
>> notation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/domain_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 829cea8de84f..7e204372368c 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>>       if ( rc != 0 )
>>           return rc;
>> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", 
>> d->max_vcpus, mem);
>> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", 
>> d->max_vcpus, mem);
> 
> I will prefer it to be printed in hex format with 0x prefixed. The 
> reason being the mem is obtained from device-tree domU's 'memory' prop 
> where the values are in hex. >
> It will help the user to debug easily without requiring the the person 
> to manually calculate the hex equivalent and then trying to correlate it 
> with what is written in dts.

I am a bit confused with your reasoning. The value stored in the 
device-tree is a 64-bit value. This is then up to the consumer to decide 
whether the output provided is in hexadecimal or decimal.

So are you saying that the tool dumping the device-tree will show the 
values in hexadecimal?

If so, the argument is the same for the number of CPUs (you could have 
more than 15 vCPUs). So I think this argument to be used here.

TBH, I am a bit split between using hexadecimal and decimal here. For 
smaller values, decimal is definitely easier to read but for larger one 
(i.e. GB), then the hexadecimal would help (it is easier to do the math).

So I would leaning towards using hexadecimal for the memory (so adding 
the 0x).

Cheers,

-- 
Julien Grall

