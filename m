Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DEBA87FEF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950014.1346435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IXh-0004F6-4S; Mon, 14 Apr 2025 12:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950014.1346435; Mon, 14 Apr 2025 12:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IXh-0004DE-1t; Mon, 14 Apr 2025 12:04:01 +0000
Received: by outflank-mailman (input) for mailman id 950014;
 Mon, 14 Apr 2025 12:03:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4IXf-0004AK-K8
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:03:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IXf-00Epik-0I;
 Mon, 14 Apr 2025 12:03:59 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IXe-00DIZN-29;
 Mon, 14 Apr 2025 12:03:59 +0000
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
	bh=23AunWhcPaxmWWt9h3GmQTb3myy7/7Zs++h/aE1DJ7k=; b=wxZ8mPZJxRO5x5bCWYN3QNiNuf
	TYRSo2nEQHodrFmHdgGZLkfUbRdMqZAuoU4njIyhOxbNRnWcTijoU1Jo+/ld8hTDbIK8jpMISMheK
	Ry6crkCPSzsQKcfuB+mPIRqTxT4mBe/q75Q5xQluE3Bh8GSpO3pJ5arF4LdDjaTqgxtM=;
Message-ID: <b691741d-85de-4120-8077-07df50948525@xen.org>
Date: Mon, 14 Apr 2025 21:03:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
 <b401f18a-f32a-46c2-8e2f-343a4eb134b8@xen.org>
 <614002cc-4dfe-44f7-8ab5-ff7d4f1e694f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <614002cc-4dfe-44f7-8ab5-ff7d4f1e694f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 14/04/2025 20:54, Ayan Kumar Halder wrote:
> 
> On 14/04/2025 12:21, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> A few clarifications.
> 
>>
>> On 11/04/2025 20:04, Ayan Kumar Halder wrote:
>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/ 
>>> include/asm/arm32/sysregs.h
>>> index 22871999af..8d7b95d982 100644
>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> @@ -20,6 +20,15 @@
>>>    * uses r0 as a placeholder register. */
>>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>>   +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>>> +
>>> +#ifdef __ASSEMBLY__
>>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
>>> +#endif /* __ASSEMBLY__ */
>>> +
>>>   #ifndef __ASSEMBLY__
>>>     /* C wrappers */
>>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/ 
>>> include/asm/cpregs.h
>>> index aec9e8f329..a7503a190f 100644
>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>> @@ -1,6 +1,8 @@
>>>   #ifndef __ASM_ARM_CPREGS_H
>>>   #define __ASM_ARM_CPREGS_H
>>>   +#include <asm/mpu/cpregs.h>
>>
>> Just to confirm, the CP registers used by the MPU will never be used 
>> for an other purpose on MMU systems, is that correct?
> Yes, this is correct. The registers are specific to PMSAv8-32 which will 
> not be present on MMU systems.

I am not entirely sure this is answering my question. I was asking 
whether the encoding could be re-used for a non-MPU specific register in 
the future? IOW, is the encoding reserved for PMSAv8-32 only?

>>
>>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/ 
>>> include/asm/mpu/cpregs.h
>>> new file mode 100644
>>> index 0000000000..e2f3b2264c
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ASM_ARM_MPU_CPREGS_H
>>> +#define __ASM_ARM_MPU_CPREGS_H
>>> +
>>> +#ifdef CONFIG_ARM_32
>>
>> I am not sure I agree with the placement of this ifdef. Is the 
>> implication that 32-bit domain will never be supported on arm64? If 
>> not, then everything but the aliases should be available for 64-bit 
>> (like we already do in asm/cpregs.h).
> Yes, I will enclose the alias only.
>>
>>> +
>>> +/* CP15 CR0: MPU Type Register */
>>> +#define HMPUIR          p15,4,c0,c0,4
>>> +
>>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address 
>>> Register */
>>> +#define HPRSELR         p15,4,c6,c2,1
>>> +#define PRBAR_EL2       p15,4,c6,c3,0
>>> +#define PRLAR_EL2       p15,4,c6,c8,1
>>
>> I am a little bit surprised the registers have _EL2 in their name. By 
>> any chance are you using the aarch64 naming? 
> yes.
>> If so, please provide the 32-bit name and add an alias below.
> 
> yes, sorry this is a bit mixed up. I did not understand the purpose for 
> defining alias , so I used the common name.
> 
> I will use HPRBAR and HPRLAR here and ....
> 
>>
>>> +
>>> +#define MPUIR_EL2       HMPUIR
>>> +#define PRSELR_EL2      HPRSELR
> 
> #define PRBAR_EL2 HPRBAR
> 
> #define PRLAR_EL2 HPRLAR
> 
>>
>> Please add a comment on top explaining why we have the aliases (see in 
>> cpregs.h).
> 
> Actually, that comment (in asm/cpregs.h) did not make sense to me
> 
> "/* Aliases of AArch64 names for use in common code when building for 
> AArch32 */"
> 
> Do you mean the common code is used for building both AArch64 and AArch32 ?

The goal of the comment is to explain why we are defining AArch64. So I 
think...

 > > If so, then the comment I should put here
> 
> /* Aliases of AArch32 names for use in common code */
> 
> Does this sound correct ?

it wants to be s/AArch32/AArch64/ in your proposed comment.

Cheers,

-- 
Julien Grall


