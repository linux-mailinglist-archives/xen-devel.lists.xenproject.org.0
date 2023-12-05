Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE49805652
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647890.1011593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVkp-0006sc-7T; Tue, 05 Dec 2023 13:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647890.1011593; Tue, 05 Dec 2023 13:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVkp-0006px-3N; Tue, 05 Dec 2023 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 647890;
 Tue, 05 Dec 2023 13:46:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAVkn-0006pr-HF
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:46:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVkn-0006WK-7j; Tue, 05 Dec 2023 13:46:25 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVkm-0005ig-W6; Tue, 05 Dec 2023 13:46:25 +0000
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
	bh=7CsabIMiGe8A3VLGNd55kAYqfmJoncNT33iG05EDwXQ=; b=dzsV9upOuLiMwjdKSOcJrtpr9T
	srQMQvr/HzX2KiZhN7nzmZHOOotumuHr1SPF8VpgytXb5OoTcHfe2U94s9V5QExt7B7VinAHnJXZ2
	TKUFgn5D0IGmWQuhXEEYd7k5EIguOxawSjX3KPaXruaefeyPVczsNSEwz4UrL5+zE0IY=;
Message-ID: <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
Date: Tue, 5 Dec 2023 13:46:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2023 13:41, Juergen Gross wrote:
> On 05.12.23 14:31, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/12/2023 12:39, Juergen Gross wrote:
>>> On 05.12.23 12:53, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 05/12/2023 10:07, Juergen Gross wrote:
>>>>> Instead of defining get_unaligned() and put_unaligned() in a way that
>>>>> is only supporting architectures allowing unaligned accesses, use the
>>>>> same approach as the Linux kernel and let the compiler do the
>>>>> decision how to generate the code for probably unaligned data 
>>>>> accesses.
>>>>>
>>>>> Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
>>>>> the Linux kernel.
>>>>>
>>>>> The generated code has been checked to be the same on x86.
>>>>>
>>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>>> Origin: 
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>>>>> 803f4e1eab7a
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> Can you outline your end goal? At least on arm32, I believe this 
>>>> will result to abort because event if the architecture support 
>>>> unaligned access, we are preventing them on Arm32.
>>>
>>> I need something like that in Xen tools for supporting packed data 
>>> accesses
>>> on the 9pfs ring page, so I looked into the hypervisor for related 
>>> support.
>>
>> Did we really introduce an ABI requiring unaligned access??? Or is 
>> this something you are coming up with?
> 
> This is the 9pfs protocol (see [1]).

Urgh :(.

> 
>> Anyway, IIRC Linux allows unaligned access. So the problem I am 
>> describing is only for the hypervisor. Although, I would like to point 
>> out that unaligned access has no atomicity guarantee. I assume this is 
>> not going to be a concern for you?
> 
> Correct.
> 
>>
>>> I guess for arm32 using -mno-unaligned-access when building should 
>>> avoid any
>>> unaligned accesses?
>>
>> I am not sure. This is implies the compiler will be able to infer that 
>> the access will be unaligned. Is this always the case?
> 
> This should happen through the "__packed" attribute on the access 
> macros. As
> e.g. MIPS doesn't support unaligned accesses, but is working with those 
> access
> macros in the Linux kernel, I suspect the attribute is doing its job.

Someone will need to dig a bit deeper to confirm and also the impact on 
the rest of the hypervisor.

> 
>> Anyway, given you don't seem to have a use-case yet, I would simply to 
>> consider to surround the declaration with an a config which can be 
>> selected if unaligned access is supported.
> 
> Like in xen/common/lzo.c et al?

Just to clarify, I am suggesting to add in unaligned.h:

#ifdef CONFIG_HAS_UNALIGNED_ACCESS

your definitions

#endif

And then for X86, select CONFIG_HAS_UNALIGNED_ACCESS.

  Those are compiled with CONFIG_X86 only
> today,
> but I guess other archs might need the decompressors in future, too.
Possibly yes. But my point is that you don't have to solve the problem 
today. Yet I don't think it is wise to allow the header to be used on 
arm32 until we have done some investigation.

And to clarify, I am not asking you to do the investigation.

Cheers,

-- 
Julien Grall

