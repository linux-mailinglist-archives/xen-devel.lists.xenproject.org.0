Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B0342CFC
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 14:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99496.189256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNbQ8-0005rV-81; Sat, 20 Mar 2021 13:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99496.189256; Sat, 20 Mar 2021 13:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNbQ8-0005r6-4u; Sat, 20 Mar 2021 13:13:36 +0000
Received: by outflank-mailman (input) for mailman id 99496;
 Sat, 20 Mar 2021 13:13:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNbQ7-0005r1-8a
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 13:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNbPz-0006ie-PE; Sat, 20 Mar 2021 13:13:27 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNbPz-0001Ys-GX; Sat, 20 Mar 2021 13:13:27 +0000
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
	bh=epyuPrJiv1ZCy4VoJ1gJhDE9ctAryyrGcCx+X4ZfE5k=; b=RQH8pI7xMZ9PZmPRSi4Yjrv3ez
	j0pFa+no2XMxgwtth1FLfnBsKFe8tKxeI+vgm+UgvWyRQcUb1oq0uhHs9IHfGJ30jk510I1Bu9d23
	m81NcgId9u3X1uC76p+Cof/zzEDMjAKY0CRNEQu02kK9S42LWMRCiFMwa+PH+jzSc1y8=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <50175d48-6f0b-2d96-8ea9-33f4f65f920f@xen.org>
Date: Sat, 20 Mar 2021 13:13:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <C0FD2269-4D00-480A-94AC-61663E0C9E94@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Security)


On 17/03/2021 14:56, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Some CPUs can speculate past a RET instruction and potentially perform
>> speculative accesses to memory before processing the return.
>>
>> There is no known gadget available after the RET instruction today.
>> However some of the registers (such as in check_pending_guest_serror())
>> may contain a value provided by the guest.
>>
>> In order to harden the code, it would be better to add a speculation
>> barrier after each RET instruction. The performance impact is meant to
>> be negligeable as the speculation barrier is not meant to be
>> architecturally executed.
>>
>> Rather than manually inserting a speculation barrier, use a macro
>> which overrides the mnemonic RET and replace with RET + SB. We need to
>> use the opcode for RET to prevent any macro recursion.
>>
>> This patch is only covering the assembly code. C code would need to be
>> covered separately using the compiler support.
>>
>> This is part of the work to mitigate straight-line speculation.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> The macro solution is definitely a great improvement compared to v1 and I could
> confirm the presence of the sb in the generated code.

Thanks for testing! It is indeed a lot nicer and less error-prone. We 
can thansk Jan for the idea as he originally introduced it on x86 :).

> 
> I also think that the mitigation on arm32/v7 would be messy to do.

It is messy but not impossible :). Some of the assembly function could 
be rewritten in C to take advantage of the compiler mitigations.

I went through the paper again today. Straight-line mitigation only 
refers to unconditional control flow change (e.g. RET) on AArch64 Armv8.

A recent submission to LLVM seems to suggest that Armv7 and AArch32 
Armv8 is also affected [2].

So I think we only need to care of unconditional return instruction 
(e.g. mov pc, lr).

For conditional return instructions, they would be treated as spectre v2 
which we already mitigate.

> Shall we mark v7/aarch32 as not security supported ?
This would have consequence beyond just speculation. There might be 
processor out which are not affected by straight-line speculation and we 
would not issue any security update for them. So I am not in favor with 
this approach.

What we could consider is mentioning in SUPPORT.MD that speculation 
attack using Straight-Line speculation are not security support on Arm 
(the 64-bit is not fully mitigated).

Cheers,

[1] https://reviews.llvm.org/D92395

-- 
Julien Grall

