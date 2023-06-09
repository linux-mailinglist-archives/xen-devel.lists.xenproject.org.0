Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E38729B68
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 15:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546057.852659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7c1l-0005VN-AQ; Fri, 09 Jun 2023 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546057.852659; Fri, 09 Jun 2023 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7c1l-0005St-72; Fri, 09 Jun 2023 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 546057;
 Fri, 09 Jun 2023 13:19:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7c1j-0005Se-7r
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 13:19:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7c1g-0004EA-CV; Fri, 09 Jun 2023 13:19:36 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7c1g-0001nN-62; Fri, 09 Jun 2023 13:19:36 +0000
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
	bh=gmAa6+t7ceWiF+7N95hf8jBeMsq4KJMoZ11v3Yk8DaM=; b=bL6OtC22HzNzMvX2AbpsNwURrM
	Q7ota62jSNlXtb+eMw0x7IAmJEyCrfJpCzLgsd61sIKJwMz6ULmChJL0ZR5gpeGhd2YzC2XqolZGi
	8IGivj0qVcRWWWj2ntZI36+AiPNIFqeW6wN3kXmH7hnUjcFh2U3cyCpnR1PqJyI0Qqcg=;
Message-ID: <063e14e4-4f88-f4aa-56b4-0b450f69e73f@xen.org>
Date: Fri, 9 Jun 2023 14:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Roberto Bagnara <bagnara@cs.unipr.it>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/06/2023 09:54, Jan Beulich wrote:
> On 08.06.2023 14:18, Roberto Bagnara wrote:
>> On 07/06/23 09:39, Jan Beulich wrote:
>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>> You are right: here are a few examples for U2:
>>>>
>>>> xen/arch/arm/cpuerrata.c:92.12-92.35:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>> xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DEBUG'
>>>> xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_LOCK_UNLOCKED'
>>>> xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE_SPINLOCK'
>>>
>>> I'm afraid this is a bad example, as it goes hand-in-hand with using
>>> another extension. I don't think using a non-empty initialization list
>>> is going to work with
>>>
>>> union lock_debug { };
>>
>> Yes, this is C99 undefined behavior 58:
>> "A structure or union is defined as containing no named members (6.7.2.1)."
>>
>> Here is another example:
>>
>> lpae_t pte = {};
>>
>> whereas we have
>>
>> typedef union {
>>       uint64_t bits;
>>       lpae_pt_t pt;
>>       lpae_p2m_t p2m;
>>       lpae_walk_t walk;
>> } lpae_t;
>>
>>
>>>> xen/arch/arm/cpuerrata.c:678.5-678.6:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/cpufeature.c:33.5-33.6:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> Both of these are a common idiom we use: The "sentinel" of an array
>>> of compound type initializer.
>>
>> Wouldn't it be possible writing such sentinels in a standard-compliant
>> way, like {0} or similar, instead of {}?
> 
> I would be possible, sure, but the question is whether we want that. Iirc
> in review comments we've been asking to preferably use {}, for being
> shorter / less clutter without resulting in any ambiguity.
> 
>>>>>> U6) Empty declarations.
>>>>
>>>> Examples:
>>>>
>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> Looks like these could be taken care of by finally purging our
>>> EXPORT_SYMBOL() stub.
>>>
>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> I'm having trouble spotting anything suspicious there.
>>
>> The macro expands to definitions of inline functions
>> and after the macro invocation there is a ";".
>>
>> The preprocessed code is then:
>>
>> static inline void foo() { ... }
>> ;
>>
>> where the final ";" is an empty declaration not allowed by
>> the C99 language standard.
> 
> Oh, I see.
> 
>> Removing the ";" after the macro invocation is a possible solution,
>> but other possibilities exist if this is strongly unwanted.
> 
> We have other macros to instantiate functions, and there no stray
> semicolons are used. I think this wants doing the same way here, but it
> being Arm code the ultimate say is with the Arm maintainers.

I don't think there is a reason to keep the ";" after. So I would be 
fine if this is removed.

Cheers,

-- 
Julien Grall

