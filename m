Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C04C38A9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 23:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278643.475973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNMSa-0006c9-Gw; Thu, 24 Feb 2022 22:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278643.475973; Thu, 24 Feb 2022 22:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNMSa-0006aJ-DR; Thu, 24 Feb 2022 22:19:40 +0000
Received: by outflank-mailman (input) for mailman id 278643;
 Thu, 24 Feb 2022 22:19:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNMSZ-0006aD-0C
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 22:19:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNMSY-0007xM-IC; Thu, 24 Feb 2022 22:19:38 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNMSY-0003Qt-CZ; Thu, 24 Feb 2022 22:19:38 +0000
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
	bh=oVgAEReLhxpkkDqDeb1VQ3F8qmoOSpR99aNRGsZBfis=; b=Q5Oo6Jb1OzNEQz2hF9v41k1rAe
	vKG8b7oTPyYAdL5o6n0ApaBAVWnXeHBHFW+CwXTrWxqfm6RMeMKWm38bdTv1cygFwmIaPtSkGWaOm
	JjbC2OQaR9zxxLbkmoWgu56V+P+nz14PLvlEUhQ+Jz0Uu61i2d2ZRdDFpjVM4oPC20xo=;
Message-ID: <2d7c7a16-f46f-7de1-0b9e-c5ec46bf54a7@xen.org>
Date: Thu, 24 Feb 2022 22:19:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 01/19] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to
 LPAE_ENTRY_MASK_GS
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-2-julien@xen.org>
 <c87e41d4-be73-665c-aa40-22798e254012@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c87e41d4-be73-665c-aa40-22798e254012@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/02/2022 13:30, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 21.02.2022 11:22, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 05031fa87357 "xen/arm: guest_walk: Only generate necessary
>> offsets/masks" introduced LPAE_ENTRIES_MASK_GS. In a follow-up patch,
>> we will use it for to define LPAE_ENTRY_MASK.
>>
> for is unneddded. Should be "we will use it to define..."

I fixed this one and ...

> 
>> This will lead to inconsistent naming. As LPAE_ENTRY_MASK is used in
>> many places, it is better to rename LPAE_ENTRIES_MASK_GS and avoid
>> some churn.
>>
>> So rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>> ---
>>   xen/arch/arm/include/asm/lpae.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
>> index e94de2e7d8e8..4fb9a40a4ca9 100644
>> --- a/xen/arch/arm/include/asm/lpae.h
>> +++ b/xen/arch/arm/include/asm/lpae.h
>> @@ -180,7 +180,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>>    */
>>   #define LPAE_SHIFT_GS(gs)         ((gs) - 3)
>>   #define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
>> -#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
>> +#define LPAE_ENTRY_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> 
> Incorrect indentation of (LPAE_ENTRIES_GS(gs) - 1)

... this one in my tree. I will commit it with Bertrand's reviewed-by.

Thank you for the review!

Cheers,

-- 
Julien Grall

