Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23381B38A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658783.1028151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGIr-00070z-CV; Thu, 21 Dec 2023 10:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658783.1028151; Thu, 21 Dec 2023 10:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGIr-0006ym-9P; Thu, 21 Dec 2023 10:29:21 +0000
Received: by outflank-mailman (input) for mailman id 658783;
 Thu, 21 Dec 2023 10:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+O=IA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rGGIp-0006wY-Fh
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:29:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe3be75-9feb-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 11:29:18 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 77DD04EE0742;
 Thu, 21 Dec 2023 11:29:17 +0100 (CET)
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
X-Inumbo-ID: cbe3be75-9feb-11ee-98eb-6d05b1d4d9a1
Message-ID: <6f3e64d1-5719-4960-9f60-0497a8ccea00@bugseng.com>
Date: Thu, 21 Dec 2023 11:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
 <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
 <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
 <alpine.DEB.2.22.394.2312201008070.685950@ubuntu-linux-20-04-desktop>
 <e5a812ab-faaf-47fd-bada-9b19e0c94bcc@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <e5a812ab-faaf-47fd-bada-9b19e0c94bcc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/12/23 22:23, Andrew Cooper wrote:
> On 20/12/2023 6:24 pm, Stefano Stabellini wrote:
>> On Wed, 20 Dec 2023, Federico Serafini wrote:
>>> On 20/12/23 12:55, Jan Beulich wrote:
>>>> On 20.12.2023 12:48, Julien Grall wrote:
>>>>> On 20/12/2023 11:03, Federico Serafini wrote:
>>>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>>             /* RO at EL0. RAZ/WI at EL1 */
>>>>>>             if ( regs_mode_is_user(regs) )
>>>>>>                 return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr,
>>>>>> 0);
>>>>>> -        else
>>>>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr,
>>>>>> 1);
>>>>>> +
>>>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>>> I don't 100% like this change (mostly because I find if/else clearer
>>>>> here).
>>>> While (it doesn't matter here) my view on this is different, I'm still
>>>> puzzled why the tool would complain / why a change here is necessary.
>>>> It is not _one_ return statement, but there's still (and obviously) no
>>>> way of falling through.
>>> The tool is configurable:
>>> if you prefer deviate these cases instead of refactoring the code
>>> I can update the configuration.
>>   
>> If you say "deviation", it implies that there is a violation. I think
>> Jan's point was that both code versions shouldn't be any different.
>>
>> # option-1
>> if (a)
>>    return f1();
>> else
>>    return f2();
>>
>> # option-2
>> if (a)
>>    return f1();
>> return f2();
>>
>> Both options are equally guaranteed to always return. It looks like a
>> peculiar limitation to only recognize option-2 as something that returns
>> 100% of the times. Also option-1 returns 100% of the times. What am I
>> missing?

I don't think this is necessarily a limitation because it highlights
cases where an if-else could be replaced with a simple if:
some may find an if-else clearer, other may find the single if clearer.

 From a safety point of view both options are safe because there
is no risk of unintentional fall through.

If you all agree on the fact that small code refactoring like the ones I
proposed are counterproductive, then I can update the tool configuration
to consider also option-1 as safe.

> 
> For completeness, it's worth saying that there is an option-3:
> 
>      return a ? f1() : f2();
> 
> which is very clearly only a single return, but I personally don't like
> this as I often find it to be less clear than either other option.

Option-3 is currently considered as safe.

> 
> All options have a guaranteed return, but there cases including this one
> where option-1 is clearest way to write the logic.
> 
> ~Andrew

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

