Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B5614730
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 10:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433395.686356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opnui-0002gF-8S; Tue, 01 Nov 2022 09:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433395.686356; Tue, 01 Nov 2022 09:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opnui-0002dK-5a; Tue, 01 Nov 2022 09:50:32 +0000
Received: by outflank-mailman (input) for mailman id 433395;
 Tue, 01 Nov 2022 09:50:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1opnuh-0002dE-FL
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 09:50:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1opnug-0003KN-C0; Tue, 01 Nov 2022 09:50:30 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.18.67]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1opnug-0007ff-3L; Tue, 01 Nov 2022 09:50:30 +0000
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
	bh=o0tHR/Chxdt9EgzDLGv94TBnplvlBFiaBmJXvadZ21Q=; b=HFnRtVR4Eove0Fgcc3kXEDs2r3
	XCUVmVQMJgvLHoiAahFwtmqm+Z9pXC+STh3ShNT9V1NbxHXC1mhXjWFEqGJ+Ybdyrx2ldRv7pvZxr
	Pun1/5n5XOIPiqKlEIl7qaUqDEcv8sD7BCrn9aXiBhsm9xGGMlYwvZmUI/ClKMy0caU8=;
Message-ID: <c2540768-93d7-5023-6203-3885b78d33a0@xen.org>
Date: Tue, 1 Nov 2022 09:50:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-12-ayankuma@amd.com>
 <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/11/2022 07:08, Xenia Ragiadakou wrote:
> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
>> This uses ldrd/strd instructions.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>> 2. No need to use le64_to_cpu() as the returned byte order is already 
>> in cpu
>> endianess.
>>
>>   xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>> b/xen/arch/arm/include/asm/arm32/io.h
>> index 73a879e9fb..d9d19ad764 100644
>> --- a/xen/arch/arm/include/asm/arm32/io.h
>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>> @@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile void 
>> __iomem *addr)
>>           return val;
>>   }
>> +static inline u64 __raw_readq(const volatile void __iomem *addr)
>> +{
>> +        u64 val;
>> +        asm volatile("ldrd %Q1, %R1, %0"
>> +                     : "+Qo" (*(volatile u64 __force *)addr),
>> +                       "=r" (val));
>> +        return val;
>> +}
>> +
>> +static inline void __raw_writeq(u64 val, const volatile void __iomem 
>> *addr)
>> +{
>> +    asm volatile("strd %Q1, %R1, %0"
>> +                 : "+Q" (*(volatile u64 __force *)addr)
>> +                 : "r" (val));
>> +}
>> +
>>   #define __iormb()               rmb()
>>   #define __iowmb()               wmb()
>> @@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile void 
>> __iomem *addr)
>>                                           __raw_readw(c)); __r; })
>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>                                           __raw_readl(c)); __r; })
>> +#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>> +                                        __raw_readq(c)); __r; })
>>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>>   #define writew_relaxed(v,c)     __raw_writew((__force u16) 
>> cpu_to_le16(v),c)
>>   #define writel_relaxed(v,c)     __raw_writel((__force u32) 
>> cpu_to_le32(v),c)
>> +#define writeq_relaxed(v,c)     __raw_writeq((__force u64) 
>> cpu_to_le64(v),c)
>>   #define readb(c)                ({ u8  __v = readb_relaxed(c); 
>> __iormb(); __v; })
>>   #define readw(c)                ({ u16 __v = readw_relaxed(c); 
>> __iormb(); __v; })
>>   #define readl(c)                ({ u32 __v = readl_relaxed(c); 
>> __iormb(); __v; })
>> +#define readq(c)                ({ u64 __v = readq_relaxed(c); 
>> __iormb(); __v; })
>>   #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
>> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
>>   #endif /* _ARM_ARM32_IO_H */
> 
> AFAIU, ldrd/strd accesses to MMIO are not guaranteed to be 64-bit 
> single-copy atomic. So, as Julien suggested, you still need to use a 
> different name to reflect this.
> Also, having nested virtualization in mind, since these instructions 
> can't be virtualized, maybe it would be better to avoid using them for 
> MMIO accesses.

+1. The previous version was actually using 32-bit access and it is not 
clear to me why the new version is using 64-bit access.

Cheers,

-- 
Julien Grall

