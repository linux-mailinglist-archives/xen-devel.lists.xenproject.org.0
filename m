Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3585A5DC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682907.1062143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4aR-0004ap-5P; Mon, 19 Feb 2024 14:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682907.1062143; Mon, 19 Feb 2024 14:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4aR-0004YK-2I; Mon, 19 Feb 2024 14:25:39 +0000
Received: by outflank-mailman (input) for mailman id 682907;
 Mon, 19 Feb 2024 14:25:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc4aQ-0004YE-5t
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:25:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc4aP-0008C3-Gc; Mon, 19 Feb 2024 14:25:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc4aP-0004FN-4J; Mon, 19 Feb 2024 14:25:37 +0000
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
	bh=iLCEvlZKhvO/Kr/t8YTvRFm5jGo4UX7cjKzXwoRCQhQ=; b=NxCkBiCAkZ7xyE1kbHKxLCGMYP
	urNrorGBAs98W2ErhuJ3/Mm0AVKBl+WrRVRfWrQ9vBPIIngMqoGpz80BF00v9CHzb8dcGPrpOgpAr
	19yNrWunF3XArb4+ElGRHM+f6z4W4u8UpCfZ4WTK2psqHiLr1Cv6zFCbyxbuJjti8R/g=;
Message-ID: <91e90054-3e07-4aa5-a3bc-a95d7c4800cc@xen.org>
Date: Mon, 19 Feb 2024 14:25:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
 <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 19/02/2024 14:00, Oleksii wrote:
> On Sun, 2024-02-18 at 19:00 +0000, Julien Grall wrote:
>>
>>
>> On 05/02/2024 15:32, Oleksii Kurochko wrote:
>>> The header was taken from Linux kernl 6.4.0-rc1.
>>>
>>> Addionally, were updated:
>>> * add emulation of {cmp}xchg for 1/2 byte types
>>
>> This explaination is a little bit light. IIUC, you are implementing
>> them
>> using 32-bit atomic access. Is that correct? If so, please spell it
>> out.
> Sure, I'll update commit message.
> 
>>
>> Also, I wonder whether it would be better to try to get rid of the
>> 1/2
>> bytes access. Do you know where they are used?
> Right now, the issue is with test_and_clear_bool() which is used in
> common/sched/core.c:840
> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/sched/core.c?ref_type=heads#L840
> ]
> 
> I don't remember details, but in xen-devel chat someone told me that
> grant table requires 1/2 bytes access.

Ok :/. This would be part of the ABI then and therefore can't be easily 
changed.

> 
>>
>>> * replace tabs with spaces
>> Does this mean you are not planning to backport any Linux fixes?
> If it will be any fixes for sure I'll back port them, but it looks like
> this code is stable enough and not to many fixes will be done there, so
> it shouldn't be hard to backport them and switch to spaces.

Fair enough.

>>> +        "   and  %1, %0, %z4\n" \
>>> +        "   or   %1, %1, %z3\n" \
>>> +        "   sc.d %1, %1, %2\n" \
>>
>> ... respectively sc.w. The same applies for cmpxchg.
> 
> I agree that it would be better, and my initial attempt was to handle
> 4-byte or 8-byte boundary crossing during 2-byte access:
> 
> 0 1 2 3 4 5 6 7 8
> X X X 1 1 X X X X
> 
> In this case, if I align address 3 to address 0 and then read 4 bytes
> instead of 8 bytes, I will not process the byte at address 4. This was
> the reason why I started to read 8 bytes.

At least on Arm, the architecture doesn't support atomic operations if 
the access is not aligned to its size (this will send a data abort). On 
some architecture, this is supported but potentially very slow.

So all the common code should already use properly aligned address. 
Therefore, I don't really see the reason to add support for unaligned 
access.

Cheers,

-- 
Julien Grall

