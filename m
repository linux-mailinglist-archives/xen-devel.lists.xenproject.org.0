Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92F65E114
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 00:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471536.731421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDSm-0006zy-3w; Wed, 04 Jan 2023 23:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471536.731421; Wed, 04 Jan 2023 23:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDSl-0006yC-WE; Wed, 04 Jan 2023 23:46:28 +0000
Received: by outflank-mailman (input) for mailman id 471536;
 Wed, 04 Jan 2023 23:46:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDDSk-0006y6-KQ
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 23:46:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDDSi-0004aK-ND; Wed, 04 Jan 2023 23:46:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDDSi-0007lI-9M; Wed, 04 Jan 2023 23:46:24 +0000
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
	bh=gmGTuusN/Cw77oybOwaLhW7XmTlkAMPzqinnHBSTdxg=; b=tYnmNNAk9EcGInkeuV7IWS/4yf
	xgx4FW5Jy8IZm7kO7iBuuv15RxiMUO+aR+2xzncu8Cche+m0nXKjhcQBlcoxWoRRrQkGB6EEV3247
	EgNUa72ObOt25KWLqzjnIjEGIw/9TGYuHmSvrhZKyVGn29oR6VbrrH/0hZCvIIlgUsI0=;
Message-ID: <2a343532-d324-e1ac-418c-5b34967d8de2@xen.org>
Date: Wed, 4 Jan 2023 23:46:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230102144904.17619-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041541260.4079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301041541260.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/01/2023 23:41, Stefano Stabellini wrote:
> On Mon, 2 Jan 2023, Michal Orzel wrote:
>> Printing domain's memory size in hex without even prepending it
>> with 0x is not very useful and can be misleading. Switch to decimal
>> notation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Was this intended for v2 rather than v1?

Cheers,

> 
> 
>> ---
>>   xen/arch/arm/domain_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 829cea8de84f..7e204372368c 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>>       if ( rc != 0 )
>>           return rc;
>>   
>> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
>> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
>>   
>>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>>   
>> -- 
>> 2.25.1
>>

-- 
Julien Grall

