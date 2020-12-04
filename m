Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F332CEAD3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44271.79363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7Md-00030w-RH; Fri, 04 Dec 2020 09:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44271.79363; Fri, 04 Dec 2020 09:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7Md-00030X-OB; Fri, 04 Dec 2020 09:26:55 +0000
Received: by outflank-mailman (input) for mailman id 44271;
 Fri, 04 Dec 2020 09:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl7Mc-00030S-8e
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl7Mb-00054X-3e; Fri, 04 Dec 2020 09:26:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl7Ma-0001xR-RQ; Fri, 04 Dec 2020 09:26:52 +0000
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
	bh=VBQgBosC98HgPuxZ5XdIOh7Zj4Homg+IA64bM0PEdC0=; b=qxcOusCRdowinX/e2J5je7CbHn
	lCdlwChg5fUQFEVRY/aVBGChnPc77Opo9zFA6dbmpYaw7zCcjgcagERs8rsR4RRCR3t+R8r0L8ssR
	FJBC49hdDjilRPypugm/79jtMgi7GE3lQcVFn0KG1TzKoPBQxlTkhrQPPdhT7Q5RUpfw=;
Subject: Re: [PATCH 1/2] include: don't use asm/page.h from common headers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <04276039-a5d0-fefd-260e-ffaa8272fd6a@suse.com>
 <a35fb176-e729-a542-4416-7040d6c80964@xen.org>
 <bdf294d9-e021-36d3-7e04-1c148e34701f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56063ac8-f771-0269-62f5-8076ec714c96@xen.org>
Date: Fri, 4 Dec 2020 09:26:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <bdf294d9-e021-36d3-7e04-1c148e34701f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/12/2020 09:27, Jan Beulich wrote:
> On 02.12.2020 18:14, Julien Grall wrote:
>> Hi Jan,
>>
>> On 02/12/2020 14:49, Jan Beulich wrote:
>>> Doing so limits what can be done in (in particular included by) this per-
>>> arch header. Abstract out page shift/size related #define-s, which is all
>>> the repsecitve headers care about. Extend the replacement / removal to
>>
>> s/repsecitve/respective/
>>
>>> some x86 headers as well; some others now need to include page.h (and
>>> they really should have before).
>>>
>>> Arm's VADDR_BITS gets restricted to 32-bit, as its current value is
>>> clearly wrong for 64-bit, but the constant also isn't used anywhere
>>> right now (i.e. the #define could also be dropped altogether).
>>
>> Whoops. Thankfully this is not used.
>>
>>>
>>> I wasn't sure about Arm's use of vaddr_t in PAGE_OFFSET(), and hence I
>>> kept it and provided a way to override the #define in the common header.
>>
>> vaddr_t is defined to 32-bit for arm32 or 64-bit for arm64. So I think
>> it would be fine to use the generic PAGE_OFFSET() implementation.
> 
> Will switch.
> 
>>> --- /dev/null
>>> +++ b/xen/include/asm-arm/page-shift.h
>>
>> The name of the file looks a bit odd given that *_BITS are also defined
>> in it. So how about renaming to page-size.h?
> 
> I was initially meaning to use that name, but these headers
> specifically don't define any sizes - *_BITS are still shift
> values, at least in a way. If the current name isn't liked, my
> next best suggestion would then be page-bits.h.

I would be happy with page-bits.h.

> 
>>> @@ -0,0 +1,15 @@
>>> +#ifndef __ARM_PAGE_SHIFT_H__
>>> +#define __ARM_PAGE_SHIFT_H__
>>> +
>>> +#define PAGE_SHIFT              12
>>> +
>>> +#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
>>> +
>>> +#ifdef CONFIG_ARM_64
>>> +#define PADDR_BITS              48
>>
>> Shouldn't we define VADDR_BITS here?
> 
> See the description - it's unused anyway. I'm fine any of the three
> possible ways:
> 1) keep as is in v1
> 2) drop altogether
> 3) also #define for 64-bit (but then you need to tell me whether 64
>     is the right value to use, or what the correct one would be)

I would go with 2).

> 
>> But I wonder whether VADDR_BITS
>> should be defined as sizeof(vaddr_t) * 8.
>>
>> This would require to include asm/types.h.
> 
> Which I'd specifically like to avoid. Plus use of sizeof() also
> precludes the use of respective #define-s in #if-s.

Fair point!

>>> --- a/xen/include/asm-x86/desc.h
>>> +++ b/xen/include/asm-x86/desc.h
>>> @@ -1,6 +1,8 @@
>>>    #ifndef __ARCH_DESC_H
>>>    #define __ARCH_DESC_H
>>>    
>>> +#include <asm/page.h>
>>
>> May I ask why you are including <asm/page.h> and not <xen/page-size.h> here?
> 
> Because of
> 
> DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
> 
> and
> 
> DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
> 
> at least (didn't check further).
Thanks for the explanation!


> Jan
> 

Cheers,

-- 
Julien Grall

