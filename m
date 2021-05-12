Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A015B37EBDA
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 00:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126452.238052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxGK-0000e5-1J; Wed, 12 May 2021 22:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126452.238052; Wed, 12 May 2021 22:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxGJ-0000bo-U7; Wed, 12 May 2021 22:23:27 +0000
Received: by outflank-mailman (input) for mailman id 126452;
 Wed, 12 May 2021 22:23:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgxGI-0000bi-To
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 22:23:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgxGH-0004l2-K6; Wed, 12 May 2021 22:23:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgxGH-0006mh-EF; Wed, 12 May 2021 22:23:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=YgBQnV6iBVWQl1Jac0X4gn8+2SozyVSztoo5d0oWYGY=; b=gGmZAku2Z5rMgcH4WZGsorB3fr
	Ej7wMoaF9xdx07kzZ9v9dYkCyNujdifinwxvtSn8Ot35lofHLGn81T+Q4vlV1PAAjkYSP5e5FPjlQ
	lu8Hxsvyha3npIz+1SpTR4zzsRr4JVh0GrEJXg+PLYmkKZTpYXj2vqHM1uRn1gWuDkV8=;
Subject: Re: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address
 is shared before updating it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-9-julien@xen.org>
 <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <caec9741-8c0e-b80a-1020-c985beb1e100@xen.org>
Date: Wed, 12 May 2021 23:23:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/05/2021 23:00, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Only the first 2GB of the virtual address space is shared between all
>> the page-tables on Arm32.
>>
>> There is a long outstanding TODO in xen_pt_update() stating that the
>> function is can only work with shared mapping. Nobody has ever called
>             ^ remove
> 
>> the function with private mapping, however as we add more callers
>> there is a risk to mess things up.
>>
>> Introduce a new define to mark the ened of the shared mappings and use
>                                       ^end
> 
>> it in xen_pt_update() to verify if the address is correct.
>>
>> Note that on Arm64, all the mappings are shared. Some compiler may
>> complain about an always true check, so the new define is not introduced
>> for arm64 and the code is protected with an #ifdef.
>   
> On arm64 we could maybe define SHARED_VIRT_END to an arbitrarely large
> value, such as:
> 
> #define SHARED_VIRT_END (1UL<<48)
> 
> or:
> 
> #define SHARED_VIRT_END DIRECTMAP_VIRT_END
> 
> ?

I thought about it but I didn't want to define to a random value... I 
felt not define it was better.

> 
> 
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>> ---
>>   xen/arch/arm/mm.c            | 11 +++++++++--
>>   xen/include/asm-arm/config.h |  4 ++++
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 8fac24d80086..5c17cafff847 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
>>        * For arm32, page-tables are different on each CPUs. Yet, they share
>>        * some common mappings. It is assumed that only common mappings
>>        * will be modified with this function.
>> -     *
>> -     * XXX: Add a check.
>>        */
>>       const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
>>   
>> +#ifdef SHARED_VIRT_END
>> +    if ( virt > SHARED_VIRT_END ||
>> +         (SHARED_VIRT_END - virt) < nr_mfns )
> 
> The following would be sufficient, right?
> 
>      if ( virt + nr_mfns > SHARED_VIRT_END )

This would not protect against an overflow. So I think it is best if we 
keep my version.

Cheers,

-- 
Julien Grall

