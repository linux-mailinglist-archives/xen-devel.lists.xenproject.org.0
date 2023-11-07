Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270667E47B2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 18:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628961.980939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0QKm-0002OD-V5; Tue, 07 Nov 2023 17:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628961.980939; Tue, 07 Nov 2023 17:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0QKm-0002M9-Rl; Tue, 07 Nov 2023 17:57:52 +0000
Received: by outflank-mailman (input) for mailman id 628961;
 Tue, 07 Nov 2023 17:57:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0QKl-0002M3-OI
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 17:57:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0QKk-0001uW-RV; Tue, 07 Nov 2023 17:57:50 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0QKk-0007bz-K9; Tue, 07 Nov 2023 17:57:50 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=fS/lDKQ+ZuVGMdcQjvHBJKfxZCHVvRlh860QLiETbXY=; b=29Wy6c2MUhUUeMwHXk5RnPPTvQ
	U3QhYzZrwhCa7oHCh0wkaShs/QpgML9kkpqNVhcJPkEUtODzpYqqDfXWTERVChc42VtjZTvF+Z835
	f7bwFsIcUMH4ZeklpMsq2Sw2leLvqVBqd0qNUrw09+m+BSRq6RHGX3ySbZ9J17udy880=;
Message-ID: <18a1bb98-0eb4-4fc9-89e1-b32707cdcf9e@xen.org>
Date: Tue, 7 Nov 2023 17:57:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/10] arm/traps: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
 <7db6d930-8a06-4a1b-b668-94df62972caa@xen.org>
In-Reply-To: <7db6d930-8a06-4a1b-b668-94df62972caa@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 16/10/2023 10:02, Julien Grall wrote:
> Hi,
> 
> On 13/10/2023 16:24, Federico Serafini wrote:
>> Add missing parameter name, no functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/arm/traps.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index ce89f16404..5aa14d4707 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs 
>> *regs, vaddr_t pc)
>>       if ( id == BUGFRAME_run_fn )
>>       {
>> -        void (*fn)(const struct cpu_user_regs *) = (void 
>> *)regs->BUG_FN_REG;
>> +        void (*fn)(const struct cpu_user_regs *regs) = (void 
>> *)regs->BUG_FN_REG;
> 
> Now the line will be over 80 characters. I think we should introduce a 
> typedef. This would also help in the longer run to validate that the 
> function passed to run_in_exception_handle() has the expected prototype.

I see this patch was committed in your for-4.19 branch. But this comment 
was unaddressed. Can you drop the patch because your branch is committed 
in staging?

Cheers,

-- 
Julien Grall

