Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEE77596C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580879.909341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgvF-0005eg-5a; Wed, 09 Aug 2023 11:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580879.909341; Wed, 09 Aug 2023 11:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgvF-0005cZ-2U; Wed, 09 Aug 2023 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 580879;
 Wed, 09 Aug 2023 11:00:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgvD-0005cA-L0
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:00:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgv6-0005xS-IT; Wed, 09 Aug 2023 11:00:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgv6-0002MQ-7r; Wed, 09 Aug 2023 11:00:04 +0000
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
	bh=ZxNB12wNpny7r9ud8OtR3ATVISScB3GPuEO1v1d7kwA=; b=Uu5CxjfIy9b0jPd3h2Dpjiu9uG
	mn1x0sbFqo6JkGfJ7pYqjI+I4qNvamQbthr9NuXoAwVJ5pn6NUZXGv9TjhhgW2PLl4neRu0/2Cm+j
	Zg84lEHNaZPstxaFywlnu1VeH0eRpSVKI75lFqe03bDPOnwT6d1nPWv0cQ6ychuAfQTk=;
Message-ID: <58ea791e-5d9e-4e60-afae-602f39316cf2@xen.org>
Date: Wed, 9 Aug 2023 12:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
 <115e080e-ecba-4117-9d43-9888f82c8d5f@xen.org>
 <ea592a24-bc29-b1ab-33ca-5ec3d59c050c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ea592a24-bc29-b1ab-33ca-5ec3d59c050c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2023 11:58, Jan Beulich wrote:
> On 09.08.2023 12:49, Julien Grall wrote:
>> On 04/08/2023 07:08, Jan Beulich wrote:
>>> Have these in one place, for all architectures to use. Also use the C99
>>> types as the "original" ones, and derive the Linux compatible ones
>>> (which we're trying to phase out). For __s<N>, seeing that no uses exist
>>> anymore, move them to a new Linux compatibility header (as an act of
>>> precaution - as said, we don't have any uses of these types right now).
>>>
>>> In some Flask sources inclusion of asm/byteorder.h needs moving later.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> With one remark:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks.
> 
>>> --- a/xen/arch/arm/include/asm/types.h
>>> +++ b/xen/arch/arm/include/asm/types.h
>>> @@ -1,18 +1,7 @@
>>>    #ifndef __ARM_TYPES_H__
>>>    #define __ARM_TYPES_H__
>>>    
>>> -typedef signed char s8;
>>> -typedef unsigned char u8;
>>> -
>>> -typedef signed short s16;
>>> -typedef unsigned short u16;
>>> -
>>> -typedef signed int s32;
>>> -typedef unsigned int u32;
>>> -
>>>    #if defined(CONFIG_ARM_32)
>>> -typedef signed long long s64;
>>> -typedef unsigned long long u64;
>>>    typedef u32 vaddr_t;
>>>    #define PRIvaddr PRIx32
>>>    #if defined(CONFIG_PHYS_ADDR_T_32)
>>> @@ -34,9 +23,9 @@ typedef u64 paddr_t;
>>>    #endif
>>
>> I find odd that you don't add a newline before/after #endif here but...
>>
>>>    typedef u32 register_t;
>>>    #define PRIregister "08x"
>>> -#elif defined (CONFIG_ARM_64)
>>> -typedef signed long s64;
>>> -typedef unsigned long u64;
>>> +
>>> +#elif defined(CONFIG_ARM_64)
>>> +
>>>    typedef u64 vaddr_t;
>>>    #define PRIvaddr PRIx64
>>>    typedef u64 paddr_t;
>>> @@ -44,6 +33,7 @@ typedef u64 paddr_t;
>>>    #define PRIpaddr "016lx"
>>>    typedef u64 register_t;
>>>    #define PRIregister "016lx"
>>> +
>>
>> .. you add one here. But this change looks a bit unrelated and IMHO of
>> out context.
>>
>>>    #endif
>>>    
>>>    #endif /* __ARM_TYPES_H__ */
> 
> Hmm, I think I was mistaking the blank line after
> 
> #if defined(CONFIG_PHYS_ADDR_T_32)
> 
> as the matching one. Which way would you prefer me to resolve the
> inconsistency: Add the missing blank line, or drop again the three ones
> I'm presently adding?

I would be ok with adding the missing blank line.

Cheers,

-- 
Julien Grall

