Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C048A61E543
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438623.692662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkAL-0003WQ-EP; Sun, 06 Nov 2022 18:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438623.692662; Sun, 06 Nov 2022 18:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkAL-0003UV-BU; Sun, 06 Nov 2022 18:14:41 +0000
Received: by outflank-mailman (input) for mailman id 438623;
 Sun, 06 Nov 2022 18:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkAJ-0003UP-OD
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkAJ-0005IT-AW; Sun, 06 Nov 2022 18:14:39 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkAJ-0000dm-4G; Sun, 06 Nov 2022 18:14:39 +0000
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
	bh=vXB6P//IrY6uAe6oNOdecrWhugkfQCUhKurgJ9wFONw=; b=MoeUs555gueiPKhkEjBkkevWYm
	hz+x+t8evQjRoy0OGUQ0ubATeRXlGZEgE9mgZhBj8m4veJXzuSWl67yPFKU/pXgstrFIYLYGykOOl
	Q3Tg/aT+G/BVMso5EO/9/rE6UMukC+C354sD+BWoWQdJ9esMsA22lgYmf6wm8IMlqp0o=;
Message-ID: <8fb32543-ba4d-44aa-b99d-759c6834ca3f@xen.org>
Date: Sun, 6 Nov 2022 18:14:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 07/12] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-8-ayankuma@amd.com>
 <b0e6c9e1-dcab-d60e-e912-1203dcb93e55@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b0e6c9e1-dcab-d60e-e912-1203dcb93e55@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/11/2022 12:13, Michal Orzel wrote:
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>>
>> Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers
>>
>> AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
>> mapped to AArch32 System register ICH_LR<n>[31:0].
>> AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
>> mapped to AArch32 System register ICH_LRC<n>[31:0].
>>
>> Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for Aarch32.
>> For AArch32, the link register is stored as :-
>> (((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2
>>
>> Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
>> AArch64.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Moved the coproc register definitions to asm/cpregs.h.
>> 2. Use GENMASK(31, 0) to represent 0xFFFFFFFF
>> 3. Use READ_CP32()/WRITE_CP32() instead of READ_SYSREG()/WRITE_SYSREG().
>> 4. Multi-line macro definitions should be enclosed within ({ }).
>>
>>   xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
>>   xen/arch/arm/include/asm/arm32/sysregs.h |  17 +++
>>   xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
>>   xen/arch/arm/include/asm/cpregs.h        |  42 ++++++++
>>   xen/arch/arm/include/asm/gic_v3_defs.h   |   6 +-
>>   5 files changed, 131 insertions(+), 69 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 6841d5de43..8a9a014bef 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -62,6 +62,23 @@
>>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>>
>> +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
>> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
> You could align to WRITE_SYSREG32(V, R).
> 
> Apart from that it would be good to add some comment before the code you added (ICH_LR_REG)
> to separate from the code above and its comment about registers coming in 3 types.
> Something like:
> /* Wrappers for accessing interrupt controller list registers. */
> 
>> +
>> +#define READ_SYSREG_LR(INDEX)    ({                         \
> Opening ({ should be placed one space after READ_SYSREG_LR(INDEX). It does not need to be aligned.
> 
>> +    uint64_t _val;                                          \
> val is not really necessary. You could directly return the ((uint64_t) _lrc << 32) | _lr;
> Just something to consider, no need to replace.
> 
>> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(INDEX));          \
>> +    uint32_t _lr = READ_CP32(ICH_LR_REG(INDEX));            \
>> +                                                            \
>> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
>> +    _val; })
> Here, you did put }) at the same line...
> 
>> +
>> +#define WRITE_SYSREG_LR(INDEX, V) ({                        \
>> +    uint64_t _val = (V);                                    \
>> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(INDEX)); \
>> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(INDEX));           \
> Please, align \

+1
> 
>> +});
> ... and here you did not.

FAOD, this is the correct approach. That said, the ';' should not be added.

> 
>> +
>>   /* MVFR2 is not defined on ARMv7 */
>>   #define MVFR2_MAYBE_UNDEFINED
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index 54670084c3..353f0eea29 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -471,6 +471,9 @@
>>
>>   #define READ_SYSREG(name)     READ_SYSREG64(name)
>>   #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
> Here, I would separate the below macros by adding the comment similar to the one I showed above.
> Or at least add a blank line.
> 
>> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
>> +#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
>> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
> I find it a bit odd that the macro param 'index' is written in lower case and for arm32 in upper cas
FWIW, I would prefer the lower case version. That said, the arm32 code 
match with the rest of the file.


Cheers,

-- 
Julien Grall

