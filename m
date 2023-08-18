Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7978067D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 09:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585808.916997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWu5W-0007Z0-PT; Fri, 18 Aug 2023 07:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585808.916997; Fri, 18 Aug 2023 07:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWu5W-0007XS-MG; Fri, 18 Aug 2023 07:40:06 +0000
Received: by outflank-mailman (input) for mailman id 585808;
 Fri, 18 Aug 2023 07:40:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWu5U-0007Ny-V5
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 07:40:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWu5Q-0001iJ-UV; Fri, 18 Aug 2023 07:40:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWu5Q-0002Cl-P5; Fri, 18 Aug 2023 07:40:00 +0000
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
	bh=Yz8SETrEZyp6MJrk8B4mT7pBvj+zRphxHx1Z+F9cDis=; b=m1DotbjSMedwOmp0REZs5D5vrj
	NfdSDelFgUiJlXnIJfC+0ZEggOGBdqbEAsN9Ptm0RuDUit3XlsfB/RwH7i4iGukbmawRayjzm3FeF
	s0r2vdU3BmeUKM7O6Ou5jqsRTWJLwY5u6CO4jUyPDyR2NLcZ/4fVKZeO+YaV9wLA7GXw=;
Message-ID: <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
Date: Fri, 18 Aug 2023 08:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/08/2023 07:33, Jan Beulich wrote:
> On 17.08.2023 23:43, Julien Grall wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -339,36 +339,36 @@ typedef uint64_t xen_callback_t;
>>   
>>   /* PSR bits (CPSR, SPSR) */
>>   
>> -#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
>> -#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
>> -#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
>> -#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
>> -#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
>> -#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
>> -#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>> -#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
>> -#define PSR_Z           (1<<30)       /* Zero condition flag */
>> +#define PSR_THUMB       (1U <<5)      /* Thumb Mode enable */
>> +#define PSR_FIQ_MASK    (1U <<6)      /* Fast Interrupt mask */
>> +#define PSR_IRQ_MASK    (1U <<7)      /* Interrupt mask */
>> +#define PSR_ABT_MASK    (1U <<8)      /* Asynchronous Abort mask */
> 
> Nit: Did you mean to insert blanks also on the rhs of the <<, like you ...
> 
>> +#define PSR_BIG_ENDIAN  (1U << 9)     /* arm32: Big Endian Mode */
>> +#define PSR_DBG_MASK    (1U << 9)     /* arm64: Debug Exception mask */
>> +#define PSR_IT_MASK     (0x0600fc00U) /* Thumb If-Then Mask */
>> +#define PSR_JAZELLE     (1U << 24)    /* Jazelle Mode */
>> +#define PSR_Z           (1U << 30)    /* Zero condition flag */
> 
> ... did everywhere here?

Yes I did. I will update the patch.

> 
> As an aside I wonder why they're here: They look like definitions of
> processor registers, which aren't under our (Xen's) control.

I agree they are not under Xen's control. However, they are used by the 
toolstack and IIRC back then they were not available in any other headers.

Note that they are only available by the tools and the hypervisor (see 
#ifdef above).

> I ask in
> part because the presence of such constants may then be taken as
> justification to add similar things in new ports. Yet such definitions
> shouldn't be put here.

 From my understanding we are using the public headers to provide 
macros/defines that are used by both the toolstack and the hypervisor. 
If they are not meant to be exposed to the guest, then they will be 
protected with "#if defined(__XEN__) || defined(__XEN_TOOLS__)".

I think we are in a similar situation here. So it is not clear where 
they should be put if we need to share them between the hypervisor and 
the toolstack.

Cheers,

-- 
Julien Grall

