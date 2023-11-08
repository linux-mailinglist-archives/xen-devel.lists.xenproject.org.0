Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102007E5B32
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 17:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629360.981532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lRN-0002jX-GG; Wed, 08 Nov 2023 16:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629360.981532; Wed, 08 Nov 2023 16:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lRN-0002hy-DA; Wed, 08 Nov 2023 16:30:05 +0000
Received: by outflank-mailman (input) for mailman id 629360;
 Wed, 08 Nov 2023 16:30:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0lRL-0002KK-Ar
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 16:30:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0lRK-0000ux-LK; Wed, 08 Nov 2023 16:30:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[10.95.129.229]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0lRK-0000Sn-ES; Wed, 08 Nov 2023 16:30:02 +0000
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
	bh=yLO1462J0nmYSHxPSh+JlOsb4A8CsewHBL5e1/gQp0c=; b=5s5XRuFvqbYjGwlIVnKKckJ61R
	4m8lZE7AihL/IGT3NWCKk4hJGkx2x/yYUhFuYXkRr7q6YCBgqzufgPKe6JozhbXqhR4tiojjt6zRw
	S4G1QVQ3e1m2ahwexhsHqc7pDdQK6yqU09uop+joh52F8YnZXCbRLZ33zu+wWPpQnmb0=;
Message-ID: <77d031a6-3981-4267-9121-818ff0daa259@xen.org>
Date: Wed, 8 Nov 2023 16:30:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arm: traps: address a violation of MISRA
 C:2012 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
 <454b02cd-e8ac-4378-95e9-afec4b852065@xen.org>
 <1e12721b-4b82-44e0-bd41-bda91f9735f0@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e12721b-4b82-44e0-bd41-bda91f9735f0@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Federico,

On 08/11/2023 16:21, Federico Serafini wrote:
> On 08/11/23 17:04, Julien Grall wrote:
>> Hi,
>>
>> On 08/11/2023 15:42, Federico Serafini wrote:
>>> Add missing parameter name "regs" and introduce function type
>>> bug_fn_t: this improves readability and helps to validate that the
>>> function passed to run_in_exception_handle() has the expected
>>> prototype.
>>> No functional change.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>> Changes in v2:
>>>    - adjusted tag;
>>>    - avoided exceeding the 80-character limit.
>>> ---
>>>   xen/arch/arm/traps.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index ce89f16404..1264eab087 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -1236,7 +1236,8 @@ int do_bug_frame(const struct cpu_user_regs 
>>> *regs, vaddr_t pc)
>>>       if ( id == BUGFRAME_run_fn )
>>>       {
>>> -        void (*fn)(const struct cpu_user_regs *) = (void 
>>> *)regs->BUG_FN_REG;
>>> +        typedef void (*bug_fn_t)(const struct cpu_user_regs *regs);
>>
>> Thanks for sending a new version. This should be defined in asm/bug.h 
>> or maybe xen/bug.h as this is generic enough.
> 
> I see some uses of run_in_exception_handle() in common/bug.c and I guess
> the type of the actual parameter should be changed to bug_fn_t.
> Am I missing some other places where such change is needed?

Just to clarify, right now, I haven't suggested to replace all the 
open-coding version of the typedef. I am only asking to define the 
typedef in an header.

Note that run_in_exception_handler() is a macro. So you can't really 
change the type. But you could check that the type of the argument 
matches bug_fn_t.

Cheers,

-- 
Julien Grall

