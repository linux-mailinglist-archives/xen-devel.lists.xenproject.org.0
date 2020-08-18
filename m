Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C42481D5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:23:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xpr-0007NB-PU; Tue, 18 Aug 2020 09:23:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7xpp-0007N5-Oq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:23:13 +0000
X-Inumbo-ID: 883725f0-10c2-4534-816b-14b2e085f2fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 883725f0-10c2-4534-816b-14b2e085f2fa;
 Tue, 18 Aug 2020 09:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=JUT3sIfbs3to288cMcv8TbCEgO5l19orxkbshVR/CQk=; b=U2YvC51ufgtfkJHKse7doEJsK+
 RZJU2jXuc4xfpoqDG70a34FO69Sp8dt7bvPlztDppHIx14usqEO2euWJynj8XLHLCYQ0EpylrSgoT
 7wONERXyCuxq1iYsS3AT32B2haod+8X3RomBzUVdoXzUdvp1YDaS63O3+gPRcmjCy2ew=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xpi-0007zQ-MH; Tue, 18 Aug 2020 09:23:06 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xpi-0000L6-Br; Tue, 18 Aug 2020 09:23:06 +0000
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, nd <nd@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
 <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
 <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
 <2F8934A8-A334-4D11-A986-71E2081419B9@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4f2982bb-c352-46a0-da73-58b9db45c28a@xen.org>
Date: Tue, 18 Aug 2020 10:23:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2F8934A8-A334-4D11-A986-71E2081419B9@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/08/2020 10:05, Bertrand Marquis wrote:
> 
> 
>> On 18 Aug 2020, at 09:58, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 18/08/2020 09:50, Jan Beulich wrote:
>>> On 14.08.2020 21:07, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 31/07/2020 12:36, Jan Beulich wrote:
>>>>> On 30.07.2020 20:18, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Only a few places are actually including asm/guest_access.h. While this
>>>>>> is fine today, a follow-up patch will want to move most of the helpers
>>>>>> from asm/guest_access.h to xen/guest_access.h.
>>>>>>
>>>>>> To prepare the move, everyone should include xen/guest_access.h rather
>>>>>> than asm/guest_access.h.
>>>>>>
>>>>>> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
>>>>>> inclusion is now removed as no-one but the latter should include the
>>>>>> former.
>>>>>>
>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Is there any chance you could take measures to avoid new inclusions
>>>>> of asm/guest_access.h to appear?
>>>>
>>>> It should be possible.
>>>>
>>>> How about this:
>>>>
>>>> diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
>>>> index b9a89c495527..d8dbc7c973b4 100644
>>>> --- a/xen/include/asm-arm/guest_access.h
>>>> +++ b/xen/include/asm-arm/guest_access.h
>>>> @@ -1,3 +1,7 @@
>>>> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>> +#error "asm/guest_access.h should not be included directly"
>>>> +#endif
>>>> +
>>>>   #ifndef __ASM_ARM_GUEST_ACCESS_H__
>>>>   #define __ASM_ARM_GUEST_ACCESS_H__
>>>>
>>>> diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
>>>> index 369676f31ac3..e665ca3a27af 100644
>>>> --- a/xen/include/asm-x86/guest_access.h
>>>> +++ b/xen/include/asm-x86/guest_access.h
>>>> @@ -4,6 +4,10 @@
>>>>    * Copyright (c) 2006, K A Fraser
>>>>    */
>>>>
>>>> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>> +#error "asm/guest_access.h should not be included directly"
>>>> +#endif
>>>> +
>>>>   #ifndef __ASM_X86_GUEST_ACCESS_H__
>>>>   #define __ASM_X86_GUEST_ACCESS_H__
>>>>
>>>> diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
>>>> index 75103d30c8be..814e31329de9 100644
>>>> --- a/xen/include/xen/guest_access.h
>>>> +++ b/xen/include/xen/guest_access.h
>>>> @@ -7,7 +7,9 @@
>>>>   #ifndef __XEN_GUEST_ACCESS_H__
>>>>   #define __XEN_GUEST_ACCESS_H__
>>>>
>>>> +#define ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>>   #include <asm/guest_access.h>
>>>> +#undef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>>   #include <xen/types.h>
>>>>   #include <public/xen.h>
>>> One option. Personally I'd prefer to avoid introduction of yet another
>>> constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.
>>
>> I thought about it but it doesn't prevent new inclusions of asm/guest_access.h. For instance, the following would still compile:
>>
>> #include <xen/guest_access.h>
>>
>> [...]
>>
>> #include <asm/guest_access.h>
>>
>> If we want to completely prevent new inclusion, then we need a new temporary constant.
> 
> I would think that this would not handle all cases but would at least prevent someone from including directly the asm header.

It is not entirely clear what you mean by "including directly" given 
that my example above a C file would include <asm/guest_access.h>

To make it more obvious <xen/guest_access.h> may have been included via 
another header.

The solution suggested by Jan would only prevent the following case:

#include <asm/guest_access.h>

[...]

#include <xen/guest_access.h>

But this should never happen given that we request <xen/*> to be before 
<asm/*>.

> 
> The solution with the define and undef does not look really nice and headers could become really ugly if we start doing that for
> all asm headers that should not be included directly.

It is not but that's the price to pay if we want to enforce the rule.

Cheers,

-- 
Julien Grall

