Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CAC8D16AF
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 10:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731046.1136358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsaR-0002mR-7c; Tue, 28 May 2024 08:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731046.1136358; Tue, 28 May 2024 08:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsaR-0002k7-4q; Tue, 28 May 2024 08:53:39 +0000
Received: by outflank-mailman (input) for mailman id 731046;
 Tue, 28 May 2024 08:53:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sBsaQ-0002k1-D4
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 08:53:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBsaJ-00019p-S9; Tue, 28 May 2024 08:53:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBsaJ-0003Ku-Kh; Tue, 28 May 2024 08:53:31 +0000
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
	bh=mIApNu2+YKmSjAOSkzaCtu5hTXIYSB/3p0oKKfEAhJ4=; b=ciuCuDIhvWOUUaxJ6EPCAi7PAG
	VGcVy0amPl5tJJjqatADcpRG0JQk5qhhRL5v6pA3MHsWUTp64X7k9ahRJumMwxrW1s+FQ/kZXfduS
	Qch9Ml3lOCLPjuxVwt2ePt/EYa/nsV4ADQAteQm0RkUssOjrOisKa6p6JxDIV2Jca1eI=;
Message-ID: <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
Date: Tue, 28 May 2024 09:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 28/05/2024 09:37, Oleksii K. wrote:
> On Tue, 2024-05-28 at 08:20 +0200, Jan Beulich wrote:
>> On 24.05.2024 13:08, Oleksii Kurochko wrote:
>>> The following generic functions were introduced:
>>> * test_bit
>>> * generic__test_and_set_bit
>>> * generic__test_and_clear_bit
>>> * generic__test_and_change_bit
>>>
>>> These functions and macros can be useful for architectures
>>> that don't have corresponding arch-specific instructions.
>>>
>>> Also, the patch introduces the following generics which are
>>> used by the functions mentioned above:
>>> * BITOP_BITS_PER_WORD
>>> * BITOP_MASK
>>> * BITOP_WORD
>>> * BITOP_TYPE
>>>
>>> BITS_PER_BYTE was moved to xen/bitops.h as BITS_PER_BYTE is the
>>> same
>>> across architectures.
>>>
>>> The following approach was chosen for generic*() and arch*() bit
>>> operation functions:
>>> If the bit operation function that is going to be generic starts
>>> with the prefix "__", then the corresponding generic/arch function
>>> will also contain the "__" prefix. For example:
>>>   * test_bit() will be defined using arch_test_bit() and
>>>     generic_test_bit().
>>>   * __test_and_set_bit() will be defined using
>>>     arch__test_and_set_bit() and generic__test_and_set_bit().
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>   Reviewed-by: Jan Beulich jbeulich@suse.com? Jan gave his R-by for
>>> the previous
>>>   version of the patch, but some changes were done, so I wasn't sure
>>> if I could
>>>   use the R-by in this patch version.
>>
>> That really depends on the nature of the changes. Seeing the pretty
>> long list below, I think it was appropriate to drop the R-b.
>>
>>> ---
>>> Changes in V11:
>>>   - fix identation in generic_test_bit() function.
>>>   - move definition of BITS_PER_BYTE from <arch>/bitops.h to
>>> xen/bitops.h
>>
>> I realize you were asked to do this, but I'm not overly happy with
>> it.
>> BITS_PER_BYTE is far more similar to BITS_PER_LONG than to
>> BITOP_BITS_PER_WORD. Plus in any event that change is entirely
>> unrelated
>> here.
> So where then it should be introduced? x86 introduces that in config.h,
> Arm in asm/bitops.h.

I would be fine if it is defined in config.h for Arm.

> I am okay to revert this change and make a separate patch.

[...]


>> Also did Julien(?) really ask that these comments be reproduced on
>> both the functions supposed to be used throughout the codebase _and_
>> the generic_*() ones (being merely internal helpers/fallbacks)?
> At least, I understood that in this way.

I suggested to duplicate. But I also proposed an alternative to move the 
comment:

"I think this comment should be duplicated (or moved to) on top of"

I don't have a strong preference which one is used.

> 
>>
>>> +/**
>>> + * generic_test_bit - Determine whether a bit is set
>>> + * @nr: bit number to test
>>> + * @addr: Address to start counting from
>>> + *
>>> + * This operation is non-atomic and can be reordered.
>>> + * If two examples of this operation race, one can appear to
>>> succeed
>>> + * but actually fail.  You must protect multiple accesses with a
>>> lock.
>>> + */
>>
>> You got carried away updating comments - there's no raciness for
>> simple test_bit(). As is also expressed by its name not having those
>> double underscores that the others have.
> Then it is true for every function in this header. Based on the naming
> the conclusion can be done if it is atomic/npn-atomic and can/can't be
> reordered. 

So let me start with that my only request is to keep the existing 
comments as you move it. It looks like there were none of test_bit() before.

 > So the comments aren't seem very useful.

The comments *are* useful. We had several instances where non-Arm folks 
thought all the operations were atomic on Arm as well. And the usual 
suggestion is to add barriers in the Arm version which is a no-go.

Cheers,

-- 
Julien Grall

