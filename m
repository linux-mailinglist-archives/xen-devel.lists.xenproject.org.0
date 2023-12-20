Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA153819ED4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 13:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657765.1026844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvUD-0002xB-8d; Wed, 20 Dec 2023 12:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657765.1026844; Wed, 20 Dec 2023 12:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvUD-0002uI-5Q; Wed, 20 Dec 2023 12:15:41 +0000
Received: by outflank-mailman (input) for mailman id 657765;
 Wed, 20 Dec 2023 12:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFvUC-0002u9-L4
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 12:15:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c3c6cd8-9f31-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 13:15:38 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 92AF24EE0C91;
 Wed, 20 Dec 2023 13:15:37 +0100 (CET)
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
X-Inumbo-ID: 7c3c6cd8-9f31-11ee-9b0f-b553b5be7939
Message-ID: <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
Date: Wed, 20 Dec 2023 13:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
 <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
 <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/23 12:55, Jan Beulich wrote:
> On 20.12.2023 12:48, Julien Grall wrote:
>> On 20/12/2023 11:03, Federico Serafini wrote:
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>            /* RO at EL0. RAZ/WI at EL1 */
>>>            if ( regs_mode_is_user(regs) )
>>>                return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>> -        else
>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>> +
>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>
>> I don't 100% like this change (mostly because I find if/else clearer
>> here).
> 
> While (it doesn't matter here) my view on this is different, I'm still
> puzzled why the tool would complain / why a change here is necessary.
> It is not _one_ return statement, but there's still (and obviously) no
> way of falling through.

The tool is configurable:
if you prefer deviate these cases instead of refactoring the code
I can update the configuration.


>> But I have the feeling any other solution would probably be
>> worse.
> 
> Use the conditional operator?
> 
> Jan
> 
>> So:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>> Cheers,
>>
> 

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

