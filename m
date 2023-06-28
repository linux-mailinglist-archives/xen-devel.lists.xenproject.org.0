Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03D7417D6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 20:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556536.869128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZf9-0000Jl-Gx; Wed, 28 Jun 2023 18:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556536.869128; Wed, 28 Jun 2023 18:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZf9-0000GX-E8; Wed, 28 Jun 2023 18:13:07 +0000
Received: by outflank-mailman (input) for mailman id 556536;
 Wed, 28 Jun 2023 18:13:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEZf7-0000GK-Bv
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 18:13:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEZf4-0002DG-Dw; Wed, 28 Jun 2023 18:13:02 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.5.86])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEZf4-0001wB-7x; Wed, 28 Jun 2023 18:13:02 +0000
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
	bh=EbQSYKSnDxAjzUfGzm/E4uMZ/kBfSrWn6I7gcmllw4Y=; b=AG6zUmz8aB79OzqqqOWGlW12wj
	0QPmTBMOWDBk5O3nsUzJRdJmeI3RJLs/9ErVyd1yHbyQtHPcm1SwJ4+mhEfgJ+C6TEkAaHj0IPnrV
	gDHDcG0Ua98iuFKwp9kIesffw2uY7rHNsybr+kxBBA45RjwSZ8GIGuTLogLZROrO37eU=;
Message-ID: <0a3c05b5-246a-7e7a-c95c-fef726f7426a@xen.org>
Date: Wed, 28 Jun 2023 19:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/9] xen/arm: Check Xen size when linking
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-2-julien@xen.org>
 <e54f278b-8305-e278-6669-04857f50f38f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e54f278b-8305-e278-6669-04857f50f38f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 26/06/2023 12:24, Michal Orzel wrote:
> 
> 
> On 25/06/2023 22:48, Julien Grall wrote:
>>
>>
>> The linker will happily link Xen if it is bigger than what we can handle
>> (e.g 2MB). This will result to unexpected failure after boot.
>>
>> This unexpected failure can be prevented by forbidding linking if Xen is
>> bigger than the area we reversed.
> s/reversed/reserved
> 
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> ---
>>   xen/arch/arm/xen.lds.S | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index be58c2c39514..c5d8c6201423 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -241,3 +241,4 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
>>   ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
>>   ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
>>   ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
>> +ASSERT((_end - start) <= XEN_VIRT_SIZE, "Xen is too big")
> Would it be possible to use _start so that we can have a consolidated way of calculating xen size
> across arch linker scripts and C code? It makes it easier for grepping.

Fair point. I have renamed to _start.

> 
> All in all,
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

