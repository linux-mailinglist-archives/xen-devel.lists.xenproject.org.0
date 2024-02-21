Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56685D7D7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683999.1063630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rclac-0002aN-9H; Wed, 21 Feb 2024 12:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683999.1063630; Wed, 21 Feb 2024 12:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rclac-0002Xw-6M; Wed, 21 Feb 2024 12:20:42 +0000
Received: by outflank-mailman (input) for mailman id 683999;
 Wed, 21 Feb 2024 12:20:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rclaa-0002Xq-Im
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:20:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rclaW-00030k-N0; Wed, 21 Feb 2024 12:20:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rclaW-00058t-GT; Wed, 21 Feb 2024 12:20:36 +0000
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
	bh=hcj4fMldxUZ/Ct5Kb6EqPXji4TnklCL+6XMbONF2EBk=; b=K+2AmZVbTNzYs+KWiz2TWLD9+5
	gJFtDFqxSkTD0VFox+CmZ62QkjuUfgxzBhJEEobFSzwwvaBAqqkgQ0sBPXvsKBhxKaMLOXeN+UWbJ
	yZvLORplNiyDXBDbvalrB++1PXH3EImaGkm5qdZXPvqOh4AzJkwakFW2Jmi8oian4CqY=;
Message-ID: <10e8a485-61b7-4c9d-930f-975e25e8ec45@xen.org>
Date: Wed, 21 Feb 2024 12:20:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
 <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
 <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
 <e7c4b08f-724a-4419-977a-caa1342c47eb@suse.com>
 <62e047c5-a913-410d-9b24-e9a26d555d78@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62e047c5-a913-410d-9b24-e9a26d555d78@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/02/2024 11:33, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 21/02/2024 07:09, Jan Beulich wrote:
>> On 20.02.2024 16:22, Ayan Kumar Halder wrote:
>>> On 20/02/2024 12:33, Jan Beulich wrote:
>>>> On 20.02.2024 13:17, Ayan Kumar Halder wrote:
>>>>> --- a/SUPPORT.md
>>>>> +++ b/SUPPORT.md
>>>>> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to 
>>>>> support MSI.
>>>>>        Status: Experimental
>>>>> +### ARM/Partial Emulation
>>>>> +
>>>>> +Enable partial emulation of registers, otherwise considered 
>>>>> unimplemented,
>>>>> +that would normally trigger a fault injection.
>>>>> +
>>>>> +    Status: Supported, with caveats
>>>>> +
>>>>> +Bugs allowing the userspace to attack the guest OS will not be 
>>>>> considered
>>>>> +security vulnerabilities.
>>>>> +
>>>>> +Bugs that could compromise Xen will be considered security 
>>>>> vulnerabilities.
>>>> ... the odd statement regarding in-guest vulnerabilities that might be
>>>> introduced. I see only two ways of treating this as supported: Either
>>>> you simply refuse emulation when the access is from user space,
>>> I am wondering how do we enforce that.
>>>
>>> Let me try to understand this with the current implementation of partial
>>> emulation for system registers.
>>>
>>> 1. DBGDTRTX_EL0 :- I understand that EL0 access to this register will
>>> cause a trap to EL2. The reason being MDCR_EL2.TDA == 1.
>>>
>>> In that case, if we refuse emulation then an undef exception is injected
>>> to the guest (this is the behavior as of today even without this patch).
>>>
>>> So, are you saying that the undef exception is to be injected to the
>>> user space process. This may be possible for Arm64 guests
>>> (inject_undef64_exception() needs to be changed).
>> No, injection is always to the guest, not to a specific entity within the
>> guest. That ought to be the same on bare hardware: An exception when
>> raised has an architecturally defined entry point for handling. That'll
>> typically be kernel code. The handler then figures out whether the source
>> of the exception was in user or kernel mode. For user mode code, the
>> kernel may or may not try to handle the exception and then continue the
>> user mode process. If it can't or doesn't want to handle it, it'll raise
>> (in UNIX terms) a signal to the process. That signal, in turn, may or may
>> not be fatal to the process. But such an exception from user mode should
>> never be fatal to the guest as a whole.
> Thanks for explaining it so well.
>>
>>> However for Arm32 guests, this may not be possible as the mode changes
>>> to PSR_MODE_UND.
>> I'm afraid my Arm foo isn't good enough to understand this. On the 
>> surface
>> it looks to violate above outlined principle.
>>
>>> Let me know if I understood you correctly.
>>>
>>>> or you
>>>> support that mode of emulation as much as that of kernel space 
>>>> accesses.
>>> Do you mean we support partial emulation only for traps from EL1 mode ?
>> Possibly.
> 
> Now, I understand you. We will allow partial_emulation only from kernel 
> mode.
> 
> So we need to do sth :-
> 
> if ( 'partial_emulation == true' && '!regs_mode_is_user(regs)' )
> 
> {
> 
>       /* partial_emulation logic */
> 
> }
> 
> I am ok with this.

The helpers take a min_el. So you can have simpler code and set the 
value to 1 (rather than 0 today).

> 
> And the updates message will be
> 
> ### ARM/Partial Emulation
> 
> Enable partial emulation of registers, otherwise considered unimplemented,
> that would normally trigger a fault injection.
> 
>      Status: Supported, with caveats
> 
> Partial emulation for traps from userspace is not allowed.

I am not sure how this helps...
> 
> Bugs that could compromise Xen will be considered security vulnerabilities.

... you are still implying that any userland breaching the kernel will 
not be supported because of a bug.

But, I don't see how preventing the userland to access a register will 
help. In theory you could have a register that can only be accessed by 
EL1 but has an impact to EL0.

By definition, it means that we don't faithfully follow the Arm Arm and 
anything can happen. Which is why I wanted to exclude security support 
from userland and kernel.

I think the current registers are low risk. But I am under the 
impression that you may wan to add more partial emulation. So we need to 
make some sort of statement that doesn't put any burden to the security 
team for future registers.

An option would be to explicitly list the registers in SUPPORT.md. As I 
mentioned above, I think the registers you currently emulate are 
low-risk to introduce a security bug. So I would be ok to fully security 
support them. This would need to be re-assessed for new registers.

I am open to other suggestions.

Cheers,

-- 
Julien Grall

