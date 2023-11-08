Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C737E5B10
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 17:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629346.981501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lJY-0007uG-9D; Wed, 08 Nov 2023 16:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629346.981501; Wed, 08 Nov 2023 16:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lJY-0007rt-6d; Wed, 08 Nov 2023 16:22:00 +0000
Received: by outflank-mailman (input) for mailman id 629346;
 Wed, 08 Nov 2023 16:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/Mx=GV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r0lJX-0007rn-78
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 16:21:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef91fbee-7e52-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 17:21:56 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.161.104.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 698644EE0737;
 Wed,  8 Nov 2023 17:21:55 +0100 (CET)
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
X-Inumbo-ID: ef91fbee-7e52-11ee-9b0e-b553b5be7939
Message-ID: <1e12721b-4b82-44e0-bd41-bda91f9735f0@bugseng.com>
Date: Wed, 8 Nov 2023 17:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arm: traps: address a violation of MISRA
 C:2012 Rule 8.2
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
 <454b02cd-e8ac-4378-95e9-afec4b852065@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <454b02cd-e8ac-4378-95e9-afec4b852065@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/11/23 17:04, Julien Grall wrote:
> Hi,
> 
> On 08/11/2023 15:42, Federico Serafini wrote:
>> Add missing parameter name "regs" and introduce function type
>> bug_fn_t: this improves readability and helps to validate that the
>> function passed to run_in_exception_handle() has the expected
>> prototype.
>> No functional change.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>>    - adjusted tag;
>>    - avoided exceeding the 80-character limit.
>> ---
>>   xen/arch/arm/traps.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index ce89f16404..1264eab087 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1236,7 +1236,8 @@ int do_bug_frame(const struct cpu_user_regs 
>> *regs, vaddr_t pc)
>>       if ( id == BUGFRAME_run_fn )
>>       {
>> -        void (*fn)(const struct cpu_user_regs *) = (void 
>> *)regs->BUG_FN_REG;
>> +        typedef void (*bug_fn_t)(const struct cpu_user_regs *regs);
> 
> Thanks for sending a new version. This should be defined in asm/bug.h or 
> maybe xen/bug.h as this is generic enough.

I see some uses of run_in_exception_handle() in common/bug.c and I guess
the type of the actual parameter should be changed to bug_fn_t.
Am I missing some other places where such change is needed?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

