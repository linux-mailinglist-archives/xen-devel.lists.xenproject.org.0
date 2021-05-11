Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD88379FC1
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 08:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125624.236450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgM1M-0000zH-0N; Tue, 11 May 2021 06:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125624.236450; Tue, 11 May 2021 06:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgM1L-0000wn-SC; Tue, 11 May 2021 06:37:31 +0000
Received: by outflank-mailman (input) for mailman id 125624;
 Tue, 11 May 2021 06:37:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y2t=KG=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lgM1K-0000wb-CA
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 06:37:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 90517df5-5487-40cc-981c-df11108319f4;
 Tue, 11 May 2021 06:37:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CFC9168F;
 Mon, 10 May 2021 23:37:28 -0700 (PDT)
Received: from [10.57.3.172] (unknown [10.57.3.172])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDCF63F718;
 Mon, 10 May 2021 23:37:25 -0700 (PDT)
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
X-Inumbo-ID: 90517df5-5487-40cc-981c-df11108319f4
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-11-michal.orzel@arm.com>
 <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <1ff4f9fb-0eca-189a-2b47-b910dc6b3639@arm.com>
Date: Tue, 11 May 2021 08:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05.05.2021 10:00, Jan Beulich wrote:
> On 05.05.2021 09:43, Michal Orzel wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>>  
>>      /* Return address and mode */
>>      __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>> +    uint64_t cpsr;                              /* SPSR_EL2 */
>>  
>>      union {
>> -        uint32_t spsr_el1;       /* AArch64 */
>> +        uint64_t spsr_el1;       /* AArch64 */
>>          uint32_t spsr_svc;       /* AArch32 */
>>      };
> 
> This change affects, besides domctl, also default_initialise_vcpu(),
> which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
> only allows two unrelated VCPUOP_* to pass, but then I don't
> understand why arch_initialise_vcpu() doesn't simply return e.g.
> -EOPNOTSUPP. Hence I suspect I'm missing something.
> 
I agree that do_arm_vcpu_op only allows two VCPUOP* to pass and
arch_initialise_vcpu being called in case of VCPUOP_initialise
has no sense as VCPUOP_initialise is not supported on arm.
It makes sense that it should return -EOPNOTSUPP.
However do_arm_vcpu_op will not accept VCPUOP_initialise and will return
-EINVAL. So arch_initialise_vcpu for arm will not be called.
Do you think that changing this behaviour so that arch_initialise_vcpu returns
-EOPNOTSUPP should be part of this patch?

>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -38,7 +38,7 @@
>>  #include "hvm/save.h"
>>  #include "memory.h"
>>  
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> 
> So this is to cover for the struct vcpu_guest_core_regs change.
> 
>> --- a/xen/include/public/vm_event.h
>> +++ b/xen/include/public/vm_event.h
>> @@ -266,8 +266,7 @@ struct vm_event_regs_arm {
>>      uint64_t ttbr1;
>>      uint64_t ttbcr;
>>      uint64_t pc;
>> -    uint32_t cpsr;
>> -    uint32_t _pad;
>> +    uint64_t cpsr;
>>  };
> 
> Then I wonder why this isn't accompanied by a similar bump of
> VM_EVENT_INTERFACE_VERSION. I don't see you drop any checking /
> filling of the _pad field, so existing callers may pass garbage
> there, and new callers need to be prevented from looking at the
> upper half when running on an older hypervisor.
> 
> Jan
> 
Cheers,
Michal

