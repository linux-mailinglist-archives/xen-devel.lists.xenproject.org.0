Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C638BF72
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 08:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131127.245239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljyjI-0002St-Ur; Fri, 21 May 2021 06:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131127.245239; Fri, 21 May 2021 06:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljyjI-0002Q4-Qo; Fri, 21 May 2021 06:33:52 +0000
Received: by outflank-mailman (input) for mailman id 131127;
 Fri, 21 May 2021 06:33:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eRHa=KQ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1ljyjG-0002Px-NN
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 06:33:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c1cba710-067a-49ca-97c6-4db6c1cebdf7;
 Fri, 21 May 2021 06:33:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C789211B3;
 Thu, 20 May 2021 23:33:47 -0700 (PDT)
Received: from [10.57.6.192] (unknown [10.57.6.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7450B3F719;
 Thu, 20 May 2021 23:33:45 -0700 (PDT)
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
X-Inumbo-ID: c1cba710-067a-49ca-97c6-4db6c1cebdf7
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
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
 <b8a14892-0290-3aff-c4b5-6d363b884db7@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <f65babea-bd4f-f1fa-07db-78d83727b155@arm.com>
Date: Fri, 21 May 2021 08:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b8a14892-0290-3aff-c4b5-6d363b884db7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi guys,

On 17.05.2021 18:03, Julien Grall wrote:
> Hi Jan,
> 
> On 17/05/2021 08:01, Jan Beulich wrote:
>> On 12.05.2021 19:59, Julien Grall wrote:
>>> Hi,
>>>
>>> On 11/05/2021 07:37, Michal Orzel wrote:
>>>> On 05.05.2021 10:00, Jan Beulich wrote:
>>>>> On 05.05.2021 09:43, Michal Orzel wrote:
>>>>>> --- a/xen/include/public/arch-arm.h
>>>>>> +++ b/xen/include/public/arch-arm.h
>>>>>> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>>>>>>           /* Return address and mode */
>>>>>>        __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>>>>>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>>>>>> +    uint64_t cpsr;                              /* SPSR_EL2 */
>>>>>>           union {
>>>>>> -        uint32_t spsr_el1;       /* AArch64 */
>>>>>> +        uint64_t spsr_el1;       /* AArch64 */
>>>>>>            uint32_t spsr_svc;       /* AArch32 */
>>>>>>        };
>>>>>
>>>>> This change affects, besides domctl, also default_initialise_vcpu(),
>>>>> which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
>>>>> only allows two unrelated VCPUOP_* to pass, but then I don't
>>>>> understand why arch_initialise_vcpu() doesn't simply return e.g.
>>>>> -EOPNOTSUPP. Hence I suspect I'm missing something.
>>>
>>> I think it is just an overlooked when reviewing the following commit:
>>>
>>> commit 192df6f9122ddebc21d0a632c10da3453aeee1c2
>>> Author: Roger Pau Monné <roger.pau@citrix.com>
>>> Date:   Tue Dec 15 14:12:32 2015 +0100
>>>
>>>       x86: allow HVM guests to use hypercalls to bring up vCPUs
>>>
>>>       Allow the usage of the VCPUOP_initialise, VCPUOP_up, VCPUOP_down,
>>>       VCPUOP_is_up, VCPUOP_get_physid and VCPUOP_send_nmi hypercalls from HVM
>>>       guests.
>>>
>>>       This patch introduces a new structure (vcpu_hvm_context) that
>>> should be used
>>>       in conjuction with the VCPUOP_initialise hypercall in order to
>>> initialize
>>>       vCPUs for HVM guests.
>>>
>>>       Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>       Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>       Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>       Acked-by: Ian Campbell <ian.campbell@citrix.com>
>>>
>>> On Arm, the structure vcpu_guest_context is not exposed outside of Xen
>>> and the tools. Interestingly vcpu_guest_core_regs is but it should only
>>> be used within vcpu_guest_context.
>>>
>>> So as this is not used by stable ABI, it is fine to break it.
>>>
>>>>>
>>>> I agree that do_arm_vcpu_op only allows two VCPUOP* to pass and
>>>> arch_initialise_vcpu being called in case of VCPUOP_initialise
>>>> has no sense as VCPUOP_initialise is not supported on arm.
>>>> It makes sense that it should return -EOPNOTSUPP.
>>>> However do_arm_vcpu_op will not accept VCPUOP_initialise and will return
>>>> -EINVAL. So arch_initialise_vcpu for arm will not be called.
>>>> Do you think that changing this behaviour so that arch_initialise_vcpu returns
>>>> -EOPNOTSUPP should be part of this patch?
>>>
>>> I think this change is unrelated. So it should be handled in a follow-up
>>> patch.
>>
>> My only difference in viewing this is that I'd say the adjustment
>> would better be a prereq patch to this one, such that the one here
>> ends up being more obviously correct.
> 
> The function is already not reachable so I felt it was unfair to require the clean-up for merging this code.
> 
>> Also, if the function is
>> indeed not meant to be reachable, besides making it return
>> -EOPNOTSUPP (or alike) it should probably also have
>> ASSERT_UNREACHABLE() added.
> 
> +1 on the idea.
> 
> Cheers,
> 
FWICS, all the discussion is about creating the next patch fixing the VCPUOP_initialise function.
Is there anything left to do in this patch or are you going to ack it?

Cheers,
Michal

