Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933E366650
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 09:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114127.217361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7PR-0005CO-2K; Wed, 21 Apr 2021 07:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114127.217361; Wed, 21 Apr 2021 07:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7PQ-0005C3-VW; Wed, 21 Apr 2021 07:36:28 +0000
Received: by outflank-mailman (input) for mailman id 114127;
 Wed, 21 Apr 2021 07:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IQv=JS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lZ7PP-0005By-30
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 07:36:27 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5e800e74-b2dd-4701-9e46-d15ce1dbc91c;
 Wed, 21 Apr 2021 07:36:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9AA106F;
 Wed, 21 Apr 2021 00:36:24 -0700 (PDT)
Received: from [10.57.28.119] (unknown [10.57.28.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D743F774;
 Wed, 21 Apr 2021 00:36:23 -0700 (PDT)
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
X-Inumbo-ID: 5e800e74-b2dd-4701-9e46-d15ce1dbc91c
Subject: Re: [PATCH 2/9] arm/domain: Get rid of READ/WRITE_SYSREG32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-3-michal.orzel@arm.com>
 <80f89abe-d81f-8b56-583c-470289abae0b@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <fabfcd90-a46b-c496-2db4-258c47d0991f@arm.com>
Date: Wed, 21 Apr 2021 09:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80f89abe-d81f-8b56-583c-470289abae0b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 20.04.2021 15:12, Julien Grall wrote:
> Hi Michal,
> 
> On 20/04/2021 08:08, Michal Orzel wrote:
>> AArch64 system registers are 64bit whereas AArch32 ones
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 sysregs have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
>>
>> Modify type of registers: actlr, cntkctl to register_t.
> 
> ACTLR is implementation defined, so in theory there might already bits already defined in the range [32:63]. So I would consider to split it from the patch so we can backport it.
> 
You mean not to touch it at all in this series or to create a seperate patch only for ACTLR?
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/domain.c        | 20 ++++++++++----------
>>   xen/include/asm-arm/domain.h |  4 ++--
>>   2 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index bdd3d3e5b5..c021a03c61 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -113,13 +113,13 @@ static void ctxt_switch_from(struct vcpu *p)
>>       p->arch.tpidr_el1 = READ_SYSREG(TPIDR_EL1);
>>         /* Arch timer */
>> -    p->arch.cntkctl = READ_SYSREG32(CNTKCTL_EL1);
>> +    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
>>       virt_timer_save(p);
>>         if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
>>       {
>> -        p->arch.teecr = READ_SYSREG32(TEECR32_EL1);
>> -        p->arch.teehbr = READ_SYSREG32(TEEHBR32_EL1);
>> +        p->arch.teecr = READ_SYSREG(TEECR32_EL1);
>> +        p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
> 
> It feels strange you converted cntkctl and actlr to use register_t but not teecr and teehbr. Can you explain why?
> 
Because thumbee and its registers do not appear in any of ARMv8 ARM version.
This means that this code could be protected even with #ifdef CONFIG_ARM_32 as AArch64 do not have them.
> Cheers,
> 
Cheers,
Michal

