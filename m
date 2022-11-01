Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61669614A25
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 12:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433465.686423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppu6-0003Qd-Sl; Tue, 01 Nov 2022 11:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433465.686423; Tue, 01 Nov 2022 11:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppu6-0003Nf-Pp; Tue, 01 Nov 2022 11:58:02 +0000
Received: by outflank-mailman (input) for mailman id 433465;
 Tue, 01 Nov 2022 11:58:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oppu5-0003NZ-IQ
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 11:58:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oppu5-0005SK-4j; Tue, 01 Nov 2022 11:58:01 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.18.67]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oppu4-0004yf-S8; Tue, 01 Nov 2022 11:58:01 +0000
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
	bh=BWiPBULFzFkGLvElLtqT+C9OQ+xir0x8h/71rV+M2jc=; b=NtlTHV81a1qLLBTSjxZd3i8Zmf
	+fI9XvdLFSI5AYramHva0MKChpTXzzDB/btAnBpCE/mYR4WDd1HCqoB6GoA4Yjb1mkVo4XR7PdeKm
	CLShwX+OuT5x84g3o4cz62kGKbinGioPFJl1iQ8s0uAMsM+YZpVFC58X0HrxcBS/NeKk=;
Message-ID: <01a22605-4ae4-d5ba-205c-ab2c1f7d24c2@xen.org>
Date: Tue, 1 Nov 2022 11:57:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-12-ayankuma@amd.com>
 <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
 <c2540768-93d7-5023-6203-3885b78d33a0@xen.org>
 <5b5df2ee-b1b4-bfd8-b6bf-6bf5cb92f557@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5b5df2ee-b1b4-bfd8-b6bf-6bf5cb92f557@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 01/11/2022 10:59, Ayan Kumar Halder wrote:
> 
> On 01/11/2022 09:50, Julien Grall wrote:
>> Hi,
> 
> Hi Xenia, Julien,
> 
> I have few clarifications.
> 
>>
>> On 01/11/2022 07:08, Xenia Ragiadakou wrote:
>>> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>>>> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
>>>> This uses ldrd/strd instructions.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>
>>>> Changes from :-
>>>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>>>> 2. No need to use le64_to_cpu() as the returned byte order is 
>>>> already in cpu
>>>> endianess.
>>>>
>>>>   xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
>>>>   1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>>>> b/xen/arch/arm/include/asm/arm32/io.h
>>>> index 73a879e9fb..d9d19ad764 100644
>>>> --- a/xen/arch/arm/include/asm/arm32/io.h
>>>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>>>> @@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile void 
>>>> __iomem *addr)
>>>>           return val;
>>>>   }
>>>> +static inline u64 __raw_readq(const volatile void __iomem *addr)
> Rename this to __raw_readq_nonatomic()
>>>> +{
>>>> +        u64 val;
>>>> +        asm volatile("ldrd %Q1, %R1, %0"
>>>> +                     : "+Qo" (*(volatile u64 __force *)addr),
>>>> +                       "=r" (val));
>>>> +        return val;
>>>> +}
>>>> +
>>>> +static inline void __raw_writeq(u64 val, const volatile void 
>>>> __iomem *addr)
> Rename to __raw_writeq_nonatomic()
>>>> +{
>>>> +    asm volatile("strd %Q1, %R1, %0"
>>>> +                 : "+Q" (*(volatile u64 __force *)addr)
>>>> +                 : "r" (val));
>>>> +}
>>>> +
>>>>   #define __iormb()               rmb()
>>>>   #define __iowmb()               wmb()
>>>> @@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile 
>>>> void __iomem *addr)
>>>>                                           __raw_readw(c)); __r; })
>>>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>>>                                           __raw_readl(c)); __r; })
>>>> +#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>>>> +                                        __raw_readq(c)); __r; })
>>>>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>>>>   #define writew_relaxed(v,c)     __raw_writew((__force u16) 
>>>> cpu_to_le16(v),c)
>>>>   #define writel_relaxed(v,c)     __raw_writel((__force u32) 
>>>> cpu_to_le32(v),c)
>>>> +#define writeq_relaxed(v,c)     __raw_writeq((__force u64) 
>>>> cpu_to_le64(v),c)
>>>>   #define readb(c)                ({ u8  __v = readb_relaxed(c); 
>>>> __iormb(); __v; })
>>>>   #define readw(c)                ({ u16 __v = readw_relaxed(c); 
>>>> __iormb(); __v; })
>>>>   #define readl(c)                ({ u32 __v = readl_relaxed(c); 
>>>> __iormb(); __v; })
>>>> +#define readq(c)                ({ u64 __v = readq_relaxed(c); 
>>>> __iormb(); __v; })
>>>>   #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>>>>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>>>>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
>>>> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
>>>>   #endif /* _ARM_ARM32_IO_H */
>>>
>>> AFAIU, ldrd/strd accesses to MMIO are not guaranteed to be 64-bit 
>>> single-copy atomic. So, as Julien suggested, you still need to use a 
>>> different name to reflect this.
> 
> Yes you are correct, ldrd/strd for system ram are guaranteed to be 
> atomic. Here we are accessing MMIO, so atomicity is not guaranteed.
> 
> I wasn't very sure if {read/write}*_relaxed are always atomic.

All the current use are atomic.
> #define writeq_relaxed(v,c) __raw_writeq_nonatomic((__force u64) 
> cpu_to_le64(v),c)
> 
> #define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>                                          __raw_readq_nonatomic(c)); __r; })
> 
> We can remove "#define readq()/writeq() ..." as they are not used.
> 
>>> Also, having nested virtualization in mind, since these instructions 
>>> can't be virtualized, maybe it would be better to avoid using them 
>>> for MMIO accesses.
> 
> Does nested virtualization apply to Arm ?

This is supported by the Architecture although not implemented in Xen.

> 
> Reading https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen , 
> I find two points of interest
> 
> "Only 64-bit hypervisors are supported at this time."
> 
> "See below for more details on tested hypervisior / guest combinations, 
> and known issues on Intel CPUs"
> 
> Thus, I understand that nested virtualization is supported only on x86 
> machines and that too 64bit only. Thus, it does not apply to AArch32.

The wiki page is describing the case where another hypervisor is running 
on top of Xen. But there is no support necessary in Xen to run it on top 
of another hypervisor.

I haven't looked whether the architecture allows to use nested on 32-bit 
though...

> 
> Let me know if I misunderstood something.
> 
>>
>> +1. The previous version was actually using 32-bit access and it is 
>> not clear to me why the new version is using 64-bit access.
> 
> IMO, I made a mistake in my previous patch of using 2 32bit access for a 
> 64 bit register.
> 
> ldrd/strd is not supported for AArch32 guests in EL1 mode when they 
> access emulated MMIO region (which traps to EL2).
> 
> However, ldrd/strd is supported for AArch32 hypervisors running in EL2 
> mode.

That's not what I understood from previous discussion [1]. ldrd/strd 
would be atomic on system RAM but there is no guarantee they would be 
for MMIO access.

I know this was Andre's interpretation. However, the HW architects may 
have interpreted the same way...

So I think we should be convervative in Xen. AFAICT, in the case of 
GICv3, we don't need the atomicity for the 64-bit registers. Therefore, 
I would rather prefer if we introduce an helper that do two 32-bit read.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20221027153632.0cf7d004@donnerap.cambridge.arm.com/

-- 
Julien Grall

