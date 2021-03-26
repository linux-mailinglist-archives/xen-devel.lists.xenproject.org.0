Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8DF34A6AA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101733.194729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl4g-0002IF-0n; Fri, 26 Mar 2021 11:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101733.194729; Fri, 26 Mar 2021 11:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl4f-0002Hn-Tp; Fri, 26 Mar 2021 11:56:21 +0000
Received: by outflank-mailman (input) for mailman id 101733;
 Fri, 26 Mar 2021 11:56:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPl4e-0002Hh-7C
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:56:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPl4W-0005vn-Fv; Fri, 26 Mar 2021 11:56:12 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPl4W-00008N-AQ; Fri, 26 Mar 2021 11:56:12 +0000
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
	bh=unXj0uiO50G30n+3QelLpUREJQwtOcnuPyn99KqDsIs=; b=cfay5yX2LQZ8FuTbsaoOilbaSu
	i1T2rf8APfkbhqtMqBROD6I/ov2kXeKSx8Nl4QMk8rpQQnRUuw2KuBEJvjtNxP7lcROWIOwZtUQRi
	hlxK7u8rh+V6p3pSUgHy82BkniYf4wOtcsg3ReANfxD4hX4gjPqEGDYeJHMGAAwt3/Ys=;
Subject: Re: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Xen.org security team" <security@xen.org>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-3-julien@xen.org>
 <C0FD2269-4D00-480A-94AC-61663E0C9E94@arm.com>
 <50175d48-6f0b-2d96-8ea9-33f4f65f920f@xen.org>
 <342BA51C-80BE-4393-997E-6C5830CB57A1@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4dd05515-b65e-e690-1891-5fd24400e385@xen.org>
Date: Fri, 26 Mar 2021 11:56:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <342BA51C-80BE-4393-997E-6C5830CB57A1@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 26/03/2021 11:13, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 20 Mar 2021, at 13:13, Julien Grall <julien@xen.org> wrote:
>>
>> (+ Security)
>>
>>
>> On 17/03/2021 14:56, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Some CPUs can speculate past a RET instruction and potentially perform
>>>> speculative accesses to memory before processing the return.
>>>>
>>>> There is no known gadget available after the RET instruction today.
>>>> However some of the registers (such as in check_pending_guest_serror())
>>>> may contain a value provided by the guest.
>>>>
>>>> In order to harden the code, it would be better to add a speculation
>>>> barrier after each RET instruction. The performance impact is meant to
>>>> be negligeable as the speculation barrier is not meant to be
>>>> architecturally executed.
>>>>
>>>> Rather than manually inserting a speculation barrier, use a macro
>>>> which overrides the mnemonic RET and replace with RET + SB. We need to
>>>> use the opcode for RET to prevent any macro recursion.
>>>>
>>>> This patch is only covering the assembly code. C code would need to be
>>>> covered separately using the compiler support.
>>>>
>>>> This is part of the work to mitigate straight-line speculation.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> The macro solution is definitely a great improvement compared to v1 and I could
>>> confirm the presence of the sb in the generated code.
>>
>> Thanks for testing! It is indeed a lot nicer and less error-prone. We can thansk Jan for the idea as he originally introduced it on x86 :).
>>
>>> I also think that the mitigation on arm32/v7 would be messy to do.
>>
>> It is messy but not impossible :). Some of the assembly function could be rewritten in C to take advantage of the compiler mitigations.
>>
>> I went through the paper again today. Straight-line mitigation only refers to unconditional control flow change (e.g. RET) on AArch64 Armv8.
>>
>> A recent submission to LLVM seems to suggest that Armv7 and AArch32 Armv8 is also affected [2].
> 
> Thanks for the pointer :-)
> 
>>
>> So I think we only need to care of unconditional return instruction (e.g. mov pc, lr).
>>
>> For conditional return instructions, they would be treated as spectre v2 which we already mitigate.
> 
> That would be a good idea but that would mean lots of invasive changes on armv7 and
It is not quite clear which change you think is invasive... The change 
for adding a barrier after all unconditional return instruction is 
pretty straight-forward.

Regarding conditional return instructions, then is nothing to do for 
straight-line speculation.

> this is not the mostly tested architecture with Xen.
To me this looks very subjective, how do you define "mostly tested"?

 From Xen Project perspective, we run the same test suite on arm64 and 
arm32 multiple time daily. I couldn't say the same for some of the Arm 
drivers in the tree.

> Anyway I am happy to help reviewing this if it is done.
> 
>>
>>> Shall we mark v7/aarch32 as not security supported ?
>> This would have consequence beyond just speculation. There might be processor out which are not affected by straight-line speculation and we would not issue any security update for them. So I am not in favor with this approach.
>>
>> What we could consider is mentioning in SUPPORT.MD that speculation attack using Straight-Line speculation are not security support on Arm (the 64-bit is not fully mitigated).
> 
> Weird to say “not security supported” maybe saying not mitigated by Xen would be more clear.

I am open for the wording :).

Cheers,

-- 
Julien Grall

