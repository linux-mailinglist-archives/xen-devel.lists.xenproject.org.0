Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B23838E4
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 18:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128403.241063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifiY-0006wl-HT; Mon, 17 May 2021 16:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128403.241063; Mon, 17 May 2021 16:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lifiY-0006uu-EK; Mon, 17 May 2021 16:03:42 +0000
Received: by outflank-mailman (input) for mailman id 128403;
 Mon, 17 May 2021 16:03:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lifiX-0006uo-DE
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 16:03:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lifiV-0007S0-Bu; Mon, 17 May 2021 16:03:39 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lifiV-0001jf-4w; Mon, 17 May 2021 16:03:39 +0000
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
	bh=XetJgpg7ogIfiyXCh6Kea/AMzHx5/dYOss+zsrZSEQo=; b=woqgGPCON0u3UrwFmvvxSdW+vI
	3w/IXyB5wehdN5ZWTKmyYxQeLOvzcw0CpV93b+rqLRbAdyNKfkMgRbOz9UorgOnJ69wztXNys7sBC
	AqMBsUYqY5qaGQWN9tUUQxZLcnCCzFfPFcaug3DgtIGS40bbjDc6R31qUS8d51w2jxA4=;
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-11-michal.orzel@arm.com>
 <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
 <1ff4f9fb-0eca-189a-2b47-b910dc6b3639@arm.com>
 <42a998be-2f99-a1b6-ace6-4c5d42af7046@xen.org>
 <54e845e1-f283-d70c-a0c2-73e768e5a56e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8a14892-0290-3aff-c4b5-6d363b884db7@xen.org>
Date: Mon, 17 May 2021 17:03:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <54e845e1-f283-d70c-a0c2-73e768e5a56e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 17/05/2021 08:01, Jan Beulich wrote:
> On 12.05.2021 19:59, Julien Grall wrote:
>> Hi,
>>
>> On 11/05/2021 07:37, Michal Orzel wrote:
>>> On 05.05.2021 10:00, Jan Beulich wrote:
>>>> On 05.05.2021 09:43, Michal Orzel wrote:
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>>>>>    
>>>>>        /* Return address and mode */
>>>>>        __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>>>>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>>>>> +    uint64_t cpsr;                              /* SPSR_EL2 */
>>>>>    
>>>>>        union {
>>>>> -        uint32_t spsr_el1;       /* AArch64 */
>>>>> +        uint64_t spsr_el1;       /* AArch64 */
>>>>>            uint32_t spsr_svc;       /* AArch32 */
>>>>>        };
>>>>
>>>> This change affects, besides domctl, also default_initialise_vcpu(),
>>>> which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
>>>> only allows two unrelated VCPUOP_* to pass, but then I don't
>>>> understand why arch_initialise_vcpu() doesn't simply return e.g.
>>>> -EOPNOTSUPP. Hence I suspect I'm missing something.
>>
>> I think it is just an overlooked when reviewing the following commit:
>>
>> commit 192df6f9122ddebc21d0a632c10da3453aeee1c2
>> Author: Roger Pau Monné <roger.pau@citrix.com>
>> Date:   Tue Dec 15 14:12:32 2015 +0100
>>
>>       x86: allow HVM guests to use hypercalls to bring up vCPUs
>>
>>       Allow the usage of the VCPUOP_initialise, VCPUOP_up, VCPUOP_down,
>>       VCPUOP_is_up, VCPUOP_get_physid and VCPUOP_send_nmi hypercalls from HVM
>>       guests.
>>
>>       This patch introduces a new structure (vcpu_hvm_context) that
>> should be used
>>       in conjuction with the VCPUOP_initialise hypercall in order to
>> initialize
>>       vCPUs for HVM guests.
>>
>>       Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>       Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>       Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>       Acked-by: Ian Campbell <ian.campbell@citrix.com>
>>
>> On Arm, the structure vcpu_guest_context is not exposed outside of Xen
>> and the tools. Interestingly vcpu_guest_core_regs is but it should only
>> be used within vcpu_guest_context.
>>
>> So as this is not used by stable ABI, it is fine to break it.
>>
>>>>
>>> I agree that do_arm_vcpu_op only allows two VCPUOP* to pass and
>>> arch_initialise_vcpu being called in case of VCPUOP_initialise
>>> has no sense as VCPUOP_initialise is not supported on arm.
>>> It makes sense that it should return -EOPNOTSUPP.
>>> However do_arm_vcpu_op will not accept VCPUOP_initialise and will return
>>> -EINVAL. So arch_initialise_vcpu for arm will not be called.
>>> Do you think that changing this behaviour so that arch_initialise_vcpu returns
>>> -EOPNOTSUPP should be part of this patch?
>>
>> I think this change is unrelated. So it should be handled in a follow-up
>> patch.
> 
> My only difference in viewing this is that I'd say the adjustment
> would better be a prereq patch to this one, such that the one here
> ends up being more obviously correct.

The function is already not reachable so I felt it was unfair to require 
the clean-up for merging this code.

> Also, if the function is
> indeed not meant to be reachable, besides making it return
> -EOPNOTSUPP (or alike) it should probably also have
> ASSERT_UNREACHABLE() added.

+1 on the idea.

Cheers,

-- 
Julien Grall

