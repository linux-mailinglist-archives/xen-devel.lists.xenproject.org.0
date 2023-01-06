Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A06603A4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472782.733147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDot5-0002UG-Qq; Fri, 06 Jan 2023 15:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472782.733147; Fri, 06 Jan 2023 15:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDot5-0002Re-NN; Fri, 06 Jan 2023 15:44:07 +0000
Received: by outflank-mailman (input) for mailman id 472782;
 Fri, 06 Jan 2023 15:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDot4-0002RY-EZ
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDot4-0002Xv-4Z; Fri, 06 Jan 2023 15:44:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDot3-0006RU-Uf; Fri, 06 Jan 2023 15:44:06 +0000
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
	bh=yRY9qGHE9XSyQSDaaF/j9f3fr2k+NbzXeokeIUubZSU=; b=pvV0i8P2cfFYmDriFmPBrFO9J8
	gQlfBNAmICSRM8+kk0rsu5Km98tkUxxyec/LZw87A+bB5gPtJJ2NwwEEjBuBJfxoJUwVeapeumJOI
	JOR9oq61TTcQkxSJi/B9wGYtxRz7g/GpQOMGgvPQzhwY7h2b3H1dKdUlmtzZ5OiHPnIg=;
Message-ID: <9c9099e2-dd7a-db37-4d0c-38f1dd8d3e48@xen.org>
Date: Fri, 6 Jan 2023 15:44:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-21-julien@xen.org>
 <AS8PR08MB7991125F288492FFD81F02BA92FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991125F288492FFD81F02BA92FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 06/01/2023 14:54, Henry Wang wrote:
>> -----Original Message-----
>> Subject: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, on Arm64, every pCPU are sharing the same page-tables.
> 
> Nit: s/every pCPU are/ every pCPU is/

I will fix it.

> 
>>
>>   /*
>> diff --git a/xen/arch/arm/include/asm/domain_page.h
>> b/xen/arch/arm/include/asm/domain_page.h
>> new file mode 100644
>> index 000000000000..e9f52685e2ec
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/domain_page.h
>> @@ -0,0 +1,13 @@
>> +#ifndef __ASM_ARM_DOMAIN_PAGE_H__
>> +#define __ASM_ARM_DOMAIN_PAGE_H__
>> +
>> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
>> +bool init_domheap_mappings(unsigned int cpu);
> 
> I wonder if we can make this function "__init" as IIRC this function is only
> used at Xen boot time, but since the original init_domheap_mappings()
> is not "__init" anyway so this is not a strong argument.

While this is not yet supported on Xen on Arm, CPUs can be 
onlined/offlined at runtime. So you want to keep init_domheap_mappings() 
around.

We could consider to provide a new attribute that will be match __init 
if hotplug is supported otherwirse it would be a NOP. But I don't think 
this is related to this series (most of the function used for bringup 
are not in __init).

>> +static inline bool init_domheap_mappings(unsigned int cpu)
> 
> (and also here)
> 
> Either you agree with above "__init" comment or not:
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

