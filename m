Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B536E8EC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 12:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119871.226639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc41c-0002bI-Dh; Thu, 29 Apr 2021 10:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119871.226639; Thu, 29 Apr 2021 10:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc41c-0002at-AF; Thu, 29 Apr 2021 10:36:04 +0000
Received: by outflank-mailman (input) for mailman id 119871;
 Thu, 29 Apr 2021 10:36:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc41a-0002aj-9d
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 10:36:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc41X-0002Cx-Kw; Thu, 29 Apr 2021 10:35:59 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc41X-0005ys-Cw; Thu, 29 Apr 2021 10:35:59 +0000
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
	bh=XniPsPk20xrjYoIPkNxgwdKtaJBQN/X11+WKVNigLew=; b=gPFPJNbSn6aVA08yYBhIfMSz4V
	CaU+UEyTvePLRuZgWue6LLzgm1+/k6NRs3umNyKdyLxPyO4JN5BWQUbITbTB5md+FcqbyBIluhV9o
	4fGrqD7DmT9oVCNKBs/rmqyM/END5zvmd89Pr4NSWS8Ds0nvHHeR2j00YUox5suQZIhI=;
Subject: Re: [PATCH v2 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Tamas K Lengyel <tamas@tklengyel.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-11-michal.orzel@arm.com>
 <f414e061-7afa-d781-e6ae-e6293f29cd40@xen.org>
 <0c90579b-4861-8f90-2978-9e7f9015fae3@arm.com>
 <CABfawhndnBQZtiRXXy_Xys5LWDqmz1VaquMxTPBY2ii+d8ATEQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c27347d7-4dfb-7251-c819-ca7ca176f7c0@xen.org>
Date: Thu, 29 Apr 2021 11:35:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABfawhndnBQZtiRXXy_Xys5LWDqmz1VaquMxTPBY2ii+d8ATEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 29/04/2021 11:31, Tamas K Lengyel wrote:
> On Thu, Apr 29, 2021, 4:53 AM Michal Orzel <michal.orzel@arm.com 
> <mailto:michal.orzel@arm.com>> wrote:
> 
>     Hi Julien,
> 
>     On 27.04.2021 13:09, Julien Grall wrote:
>      > Hi Michal,
>      >
>      > On 27/04/2021 10:35, Michal Orzel wrote:
>      >> AArch64 registers are 64bit whereas AArch32 registers
>      >> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>      >> we should get rid of helpers READ/WRITE_SYSREG32
>      >> in favour of using READ/WRITE_SYSREG.
>      >> We should also use register_t type when reading sysregs
>      >> which can correspond to uint64_t or uint32_t.
>      >> Even though many AArch64 registers have upper 32bit reserved
>      >> it does not mean that they can't be widen in the future.
>      >>
>      >> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
>      >
>      > As I pointed out in v1, the access to SPSR_EL1 has been quite
>     fragile because we relied on the padding afterwards. I think this
>     was ought to be explain in the commit message because it explain why
>     the access in the assembly code is not modified.
>      >
>     How about:
>     "
>     Modify type of hsr, cpsr, spsr_el1 to uint64_t.
>     Previously we relied on the padding after SPSR_EL1. As we removed
>     the padding, modify the union to be 64bit
>     so we don't corrupt SPSR_FIQ.
>     No need to modify the assembly code becuase the accesses were based
>     on 64bit registers as there was a 32bit padding after SPSR_EL1.
>     "
>      >>
>      >> Add 32bit RES0 members to structures inside hsr union.
>      >>
>      >> Remove 32bit padding in cpu_user_regs before spsr_fiq
>      >> as it is no longer needed due to upper union being 64bit now.
>      >>
>      >> Add 64bit padding in cpu_user_regs before spsr_el1
>      >> because offset of spsr_el1 must be a multiple of 8.
>      >>
>      >> Signed-off-by: Michal Orzel <michal.orzel@arm.com
>     <mailto:michal.orzel@arm.com>>
>      >> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
>      >> index 29d4531f40..fb4a3b1274 100644
>      >> --- a/xen/include/asm-arm/hsr.h
>      >> +++ b/xen/include/asm-arm/hsr.h
>      >> @@ -16,11 +16,12 @@ enum dabt_size {
>      >>   };
>      >>     union hsr {
>      >> -    uint32_t bits;
>      >> +    register_t bits;
>      >>       struct {
>      >>           unsigned long iss:25;  /* Instruction Specific Syndrome */
>      >>           unsigned long len:1;   /* Instruction length */
>      >>           unsigned long ec:6;    /* Exception Class */
>      >> +        unsigned long _res0:32;
>      >
>      > Sorry I wasn't clear in my original comment, what I meant I would
>     rather not add this field (and also the _res0) because they are not
>     strictly necessary.
>      >
>     Ok I'll remove _res0 members. But bits can be of type register_t, right?
>      >> diff --git a/xen/include/public/arch-arm.h
>     b/xen/include/public/arch-arm.h
>      >> index 713fd65317..c49bce2983 100644
>      >> --- a/xen/include/public/arch-arm.h
>      >> +++ b/xen/include/public/arch-arm.h
>      >> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>      >>         /* Return address and mode */
>      >>       __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>      >> -    uint32_t cpsr;                              /* SPSR_EL2 */
>      >> +    register_t cpsr;                            /* SPSR_EL2 */
>      >
>      > You can't use register_t here because this is a public header (we
>     don't export register_t) and the header should be bitness agnostic.
>      >
>      > Also, because this is a public header, you ought to explain why
>     breaking the ABI is fine.
>      >
>      > In this case, this is an ABI between the tools and this is not
>     stable. However, we would still need to bump
>     XEN_DOMCTL_INTERFACE_VERSION as I think this wasn't done for this
>     development cycle.
>      >
>      > Of course, this will also need a suitable mention in the commit
>     message (I can help with that).
>      >
>     Ok so I'll increment XEN_DOMCTL_INTERFACE_VERSION and write in
>     commit msg:
>     "
>     Change type of cpsr to uint64_t in the public outside interface
>     "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
>     Increment XEN_DOMCTL_INTERFACE_VERSION.
>     "
>      >>         union {
>      >> -        uint32_t spsr_el1;       /* AArch64 */
>      >> +        uint64_t spsr_el1;       /* AArch64 */
>      >>           uint32_t spsr_svc;       /* AArch32 */
>      >>       };
>      >>   diff --git a/xen/include/public/vm_event.h
>     b/xen/include/public/vm_event.h
>      >> index 36135ba4f1..ad3d141fe8 100644
>      >> --- a/xen/include/public/vm_event.h
>      >> +++ b/xen/include/public/vm_event.h
>      >> @@ -266,8 +266,12 @@ struct vm_event_regs_arm {
>      >>       uint64_t ttbr1;
>      >>       uint64_t ttbcr;
>      >>       uint64_t pc;
>      >> +#ifdef CONFIG_ARM_32
>      >>       uint32_t cpsr;
>      >>       uint32_t _pad;
>      >> +#else
>      >> +    uint64_t cpsr;
>      >> +#endif
>      >
>      > CONFIG_ARM_32 is not defined for public header. They also should
>     be bitness agnostic. So cpsr should always be uint64_t.
>      >
>      > Also, similar to public/arch-arm.h, this is not a stable ABI but
>     you will need to bump VM_EVENT_INTERFACE_VERSION if this hasn't been
>     done for this development cycle.
>      >
>     Ok so I will change type of cpsr here to uint64_t, increment
>     VM_EVENT_INTERFACE_VERSION and write in commit msg:
>     "
>     Change type of cpsr to uint64_t in the public outside interface
>     "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
>     Increment VM_EVENT_INTERFACE_VERSION.
>     "
>     Ok?
> 
> 
> There is no need to bump the interface version for this, you are not 
> changing the layout or size of the structure since there was already 
> 64bit space there for cspr for both 32bit and 64bit builds. You are just 
> folding that padding field into cspr on 32bit builds.

Ah I didn't realize the padding was already there. Although, is it 
always zeroed?

If not, then this is would technically be an ABI breakage if you build a 
vm event tool using public/vm_event.h from Xen 4.16 and use it on Xen 4.15.

Cheers,

-- 
Julien Grall

