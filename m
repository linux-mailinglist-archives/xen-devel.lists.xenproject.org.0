Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88D7EF070
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635046.990747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3w73-0000MN-G3; Fri, 17 Nov 2023 10:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635046.990747; Fri, 17 Nov 2023 10:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3w73-0000Jh-D8; Fri, 17 Nov 2023 10:30:13 +0000
Received: by outflank-mailman (input) for mailman id 635046;
 Fri, 17 Nov 2023 10:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3w72-0000JZ-Ds
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:30:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49302574-8534-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 11:30:11 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id 87FDB4EE0744;
 Fri, 17 Nov 2023 11:30:09 +0100 (CET)
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
X-Inumbo-ID: 49302574-8534-11ee-98dc-6d05b1d4d9a1
Message-ID: <30cec2c7-5fac-458b-be90-e43a66b78058@bugseng.com>
Date: Fri, 17 Nov 2023 11:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: introduce function type bug_fn_t.
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <3942021ff51b117ab2b50aecd6e75353cd73ab20.1700158707.git.federico.serafini@bugseng.com>
 <82bd029b-4c26-4eb3-9e93-1d34fab40db3@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <82bd029b-4c26-4eb3-9e93-1d34fab40db3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/23 11:12, Julien Grall wrote:
> Hi Federico,
> 
> On 17/11/2023 08:28, Federico Serafini wrote:
>> Introduce function type bug_fn_t. This improves readability and helps
>> to validate that the function passed to run_in_exception_handle() has
>> the expected prototype.
> Hmmm... I read the second part as you will validate the type in 
> run_in_exception_handle(). But I can't find such change. How about:
> 
> "and could be used to help validating that ..."
> 
> No need to send a new revision for that. I can do it on commit.
> 
>>
>> Use the newly-intoduced type to address a violation of MISRA
>> C:2012 Rule 8.2.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>>   xen/arch/arm/traps.c  | 2 +-
>>   xen/include/xen/bug.h | 5 +++--
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index ce89f16404..8492e2b7bb 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs 
>> *regs, vaddr_t pc)
>>       if ( id == BUGFRAME_run_fn )
>>       {
>> -        void (*fn)(const struct cpu_user_regs *) = (void 
>> *)regs->BUG_FN_REG;
>> +        bug_fn_t *fn = (void *)regs->BUG_FN_REG;
>>           fn(regs);
>>           return 0;
>> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
>> index e8a4eea71a..cb5138410e 100644
>> --- a/xen/include/xen/bug.h
>> +++ b/xen/include/xen/bug.h
>> @@ -99,6 +99,9 @@ struct bug_frame {
>>   #endif
>> +struct cpu_user_regs;
>> +typedef void bug_fn_t(const struct cpu_user_regs *regs);
>> +
> 
> If your aim is to validate the type in run_in_exception_handler(), then 
> this is defined too late. You will need to define it before "asm/bug.h" 
> is included so arch-specific implementations of run_in_exception_handler 
> can use it.
> 
> Note that for Arm we are using a macro, but others may use a static inline.

Thanks for the information!

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

