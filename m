Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B4641873
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 19:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452739.710525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1XM1-0005Bu-DD; Sat, 03 Dec 2022 18:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452739.710525; Sat, 03 Dec 2022 18:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1XM1-0005AB-9T; Sat, 03 Dec 2022 18:35:13 +0000
Received: by outflank-mailman (input) for mailman id 452739;
 Sat, 03 Dec 2022 18:35:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1XLz-000594-AH
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 18:35:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1XLy-0000Lx-Pq; Sat, 03 Dec 2022 18:35:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1XLy-0006Cd-JR; Sat, 03 Dec 2022 18:35:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=oQHIqaT5OJeI+CdBzT3fuSTDKlG3tz6Em5l2cu6qsb8=; b=ET94HRPKevLx6TiUlRhTWZVhA4
	MGNT01w8FIQIeIFNI8FtrjBlzXo5ea1tT1pfVJkLHTzHxRhly7HHbGs0J/4R0/Qh48FTWDxRIhUGO
	fMnBWxZDjD8DGuB7MqivdPehhN7gO5hJ+VDq4BPzOVdJlcyTvjcI9DcS9PPXfSqvzfgE=;
Message-ID: <bd197b39-a558-7b88-d10d-053846cd5dab@xen.org>
Date: Sat, 3 Dec 2022 18:35:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-8-ayan.kumar.halder@amd.com>
 <0ccfe5e6-960d-2f60-f782-e321c1ea7786@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
In-Reply-To: <0ccfe5e6-960d-2f60-f782-e321c1ea7786@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2022 14:33, Michal Orzel wrote:
>> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>>       if ( v == current )
>>       {
>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>> -            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
>> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
> 1. We do not usually add spaces between " and PRIx.

I don't have a strong preference on this one.

> 
>>       }
>>       else
>>       {
>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>> -            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
>> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
>>       }
>>   }
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 6841d5de43..22871999af 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -62,6 +62,25 @@
>>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>>
>> +/* Wrappers for accessing interrupt controller list registers. */
>> +#define ICH_LR_REG(index)       ICH_LR ## index ## _EL2
>> +#define ICH_LRC_REG(index)      ICH_LRC ## index ## _EL2
>> +
>> +#define READ_SYSREG_LR(index) ({                            \
>> +    uint64_t _val;                                          \
>> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(index));          \
>> +    uint32_t _lr = READ_CP32(ICH_LR_REG(index));            \
>> +                                                            \
>> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
>> +    _val;                                                   \
>> +})
>> +
>> +#define WRITE_SYSREG_LR(v, index) ({                        \
>> +    uint64_t _val = (v);                                    \
>> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(index));   \
>> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(index));             \
>> +})
>> +
>>   /* MVFR2 is not defined on ARMv7 */
>>   #define MVFR2_MAYBE_UNDEFINED
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index 54670084c3..4638999514 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -472,6 +472,11 @@
>>   #define READ_SYSREG(name)     READ_SYSREG64(name)
>>   #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
>>
>> +/* Wrappers for accessing interrupt controller list registers. */
>> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
>> +#define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
>> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
>> +
>>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>>
>>   /*
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index 6daf2b1a30..b85e811f51 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -8,6 +8,8 @@
>>    * support 32-bit guests.
>>    */
>>
>> +#define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
> 2. As you are using ___CP32 much later in this file, it could be moved...

__CP32() is already defined in arm32/sysregs.h which includes cpregs.h. 
We should not define __CP32() twice and the only reason the compiler 
doesn't complain is because the definition is the same

So one of the two needs to be dropped. Also, I think __CP32(), __CP64(), 
CP32() and CP64() should be defined together because they are all related.

However...

>> +
>>   #define __HSR_CPREG_c0  0
>>   #define __HSR_CPREG_c1  1
>>   #define __HSR_CPREG_c2  2
>> @@ -259,6 +261,48 @@
>>   #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
>>   #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
> 
> ...here, before first use. The remark I gave in v3 was that the definition should occur before use,
> but it does not mean placing the macro at the top of the file.
> 
>>
>> +/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>> +#define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
>> +#define __LR8(x)        ___CP32(p15, 4, c12, c13, x)

... I don't understand why you need to use __CP32 here and everywhere 
else in this header. In fact I have replaced in my tree all the 
__CP32(foo) with foo and it still compiles.

So can you explain why they are necessary?

Cheers,

-- 
Julien Grall

