Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7161FCC9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 19:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439556.693580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6W2-0000JS-UN; Mon, 07 Nov 2022 18:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439556.693580; Mon, 07 Nov 2022 18:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6W2-0000GZ-Qn; Mon, 07 Nov 2022 18:06:34 +0000
Received: by outflank-mailman (input) for mailman id 439556;
 Mon, 07 Nov 2022 18:06:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os6W1-0000GT-39
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 18:06:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os6W1-0005Zk-29
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 18:06:33 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os6W0-0002iJ-R0; Mon, 07 Nov 2022 18:06:32 +0000
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
	bh=TEFbjhQ7r78CCH9agleS2kBNdvGVrpH1qsQR6QEJJbw=; b=yhE0oCIcShW/J9HR5K7lWh/nFY
	KOdzhvQ+7Cps/eHsJY+GBHNmUwou5EHe4+nTXZJjG8tm9cXQ+HEFdQrISoLQvdlSl+kD9ecbwTXdE
	zMa25K1PVWdHhES038s6c5cv5ea9lhKE71b0hhwABUwtk5HYKlhwXTWN428cGN29PCwE=;
Message-ID: <74b1c6af-d6de-2728-9d59-2d561a521793@xen.org>
Date: Mon, 7 Nov 2022 18:06:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
 <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
 <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
 <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/11/2022 12:49, Ayan Kumar Halder wrote:
> 
> On 07/11/2022 10:44, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 07/11/2022 10:36, Ayan Kumar Halder wrote:
>>>
>>> On 06/11/2022 17:54, Julien Grall wrote:
>>>> Hi Ayan,
>>>
>>> Hi Julien,
>>>
>>> I need some clarification.
>>>
>>>>
>>>> To me the title and the explaination below suggests...
>>>>
>>>> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>>>>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>>>>
>>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>>> "Requirements for single-copy atomicity
>>>>>
>>>>> - A read that is generated by a load instruction that loads a single
>>>>> general-purpose register and is aligned to the size of the read in the
>>>>> instruction is single-copy atomic.
>>>>>
>>>>> -A write that is generated by a store instruction that stores a single
>>>>> general-purpose register and is aligned to the size of the write in 
>>>>> the
>>>>> instruction is single-copy atomic"
>>>>>
>>>>> On AArch32, the alignment check is enabled at boot time by setting 
>>>>> HSCTLR.A bit.
>>>>> ("HSCTLR, Hyp System Control Register").
>>>>> However in AArch64, alignment check is not enabled at boot time.
>>>>
>>>> ... you want to enable the alignment check on AArch64 always. 
>>>
>>> I want to enable alignment check *only* for atomic access.
>>>
>>> May be I should remove this line --> "However in AArch64, alignment 
>>> check is not enabled at boot time.".
>>>
>>>> However, this is not possible to do because memcpy() is using 
>>>> unaligned access.
>>> This is a non atomic access. So the commit does not apply here.
>>
>> Right, but your commit message refers to the alignment check on arm32. 
>> You wrote too much for someone to wonder but not enough to explain why 
>> we can't enable the alignment check on arm64.
>>
>>>>
>>>> I think the commit message/title should clarify that the check is 
>>>> *only* done during debug build. IOW, there are no enforcement in 
>>>> producation build.
>>>
>>> AFAICS read_atomic()/write_atomic() is enabled during non debug 
>>> builds (ie CONFIG_DEBUG=n) as well.
>>
>> My point was that ASSERT() is a NOP in production build. So you 
>> effectively the enforcement happens only in debug build.
>>
>> IOW, unless you test exhaustively with a debug build, you may never 
>> notice that the access was not atomic.
> 
> This makes sense.
> 
> Does the following commit message look better ?
> 
> xen/Arm: Enforce alignment check for atomic read/write

title:

xen/arm: Enforce alignment check in debug build for {read, write}_atomic

> 
> Refer ARM DDI 0487I.a ID081822, B2.2.1
> "Requirements for single-copy atomicity
> 
> - A read that is generated by a load instruction that loads a single
> general-purpose register and is aligned to the size of the read in the
> instruction is single-copy atomic.
> 
> -A write that is generated by a store instruction that stores a single
> general-purpose register and is aligned to the size of the write in the
> instruction is single-copy atomic"
> 
> Thus, one needs to check for alignment when performing atomic operations.
> However, as ASSERT() are disabled in production builds, so one needs to

This seems to be a bit out of context because you don't really explain 
that ASSERT() would be used. Also...

> run the debug builds to catch any unaligned access during atomic 
> operations.
> Enforcing alignment checks during production build has quite a high 
> overhead.
> 
> On AArch32, the alignment check is enabled at boot time by setting 
> HSCTLR.A bit.
> ("HSCTLR, Hyp System Control Register").
> However, on AArch64, memcpy()/memset() may be used on 64bit unaligned 
> addresses.
> Thus, one does not wish to enable alignment check at boot time.

... to me this paragraph should be first because this explained why we 
can't check in production. So how about the following commit message:

"
xen/arm: Enforce alignment check in debug build for {read, write}_atomic

Xen provides helper to atomically read/write memory (see {read, 
write}_atomic()). Those helpers can only work if the address is aligned 
to the size of the access (see B2.2.1 ARM DDI 08476I.a).

On Arm32, the alignment is already enforced by the processor because 
HSCTLR.A bit is set (it enforce alignment for every access). For Arm64, 
this bit is not set because memcpy()/memset() can use unaligned access 
for performance reason (the implementation is taken from the Cortex 
library).

To avoid any overhead in production build, the alignment will only be 
checked using an ASSERT. Note that it might be possible to do it in 
production build using the acquire/exclusive version of load/store. But 
this is left to a follow-up (if wanted).
"

While trying to find a justification for the debug version. I was 
wondering whether we could actually use the acquire or exclusive 
version. I am not entirely sure about the overhead.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I think I can keep R-b as there is no code change ?

My signed-off-by will need to be added for the commit message I proposed 
above. So I would like Bertrand/Michal to confirm they are happy with it 
(I don't usually add my reviewed-by/acked-by for patch where my 
signed-off-by is added).

Cheers,

-- 
Julien Grall

