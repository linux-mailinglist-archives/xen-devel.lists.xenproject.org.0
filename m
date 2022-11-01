Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BA614C7F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 15:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434698.687080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsAo-0002aU-I3; Tue, 01 Nov 2022 14:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434698.687080; Tue, 01 Nov 2022 14:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsAo-0002Xo-Ea; Tue, 01 Nov 2022 14:23:26 +0000
Received: by outflank-mailman (input) for mailman id 434698;
 Tue, 01 Nov 2022 14:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Jvn=3B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1opsAn-0002Xi-4c
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 14:23:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdfc24a7-59f0-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 15:23:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id kt23so37368593ejc.7
 for <xen-devel@lists.xenproject.org>; Tue, 01 Nov 2022 07:23:23 -0700 (PDT)
Received: from [192.168.1.93] (adsl-235.109.242.227.tellas.gr.
 [109.242.227.235]) by smtp.gmail.com with ESMTPSA id
 ju26-20020a17090798ba00b0078d424e8c09sm4271797ejc.77.2022.11.01.07.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:23:22 -0700 (PDT)
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
X-Inumbo-ID: bdfc24a7-59f0-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNdMCET0AX6v76zQYGTGiQhfcBjxiSV/5Jz19I5He6s=;
        b=plLjzmtQcklzkxyQoWhQgZcI37UqM/N4ofaSwwKt6MSzz8CigrNb6lqiLPCs9TesKm
         i/Yc84vRKT82xKUWPSMGW63pBg1bsl+gaeIODDI3YPAejPq+s1QQ/uzj6GBCQIcN6sVs
         Dey44iz7WajkNBJP4anKxp7822GLwCgdL3Fda3wnCueZJnCFnlSst6spQq0+BU9kLThi
         SrTPDcS0CwemwA8rOps4quMq+6jVyv7+dXRGIbNIqOi2opGtQgOXFl5I3svbrDIgenZN
         uRAqeDAbdQKehFHUu0a2WBFGnapmPujwilRpuihfX79YkhNDfftnwq3tdG/meNQ8DaQr
         fpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNdMCET0AX6v76zQYGTGiQhfcBjxiSV/5Jz19I5He6s=;
        b=mVmHFcI01aah0ktFgusBUsPoLRfNxH8psI7RN3kWJGteHFUbyjrlxg5GTK1+3Qia4c
         T74pbJLoxFZxtVgRr05QLfMZ/4vf3IQnIytEHnZaoMmL1H3OtJEIbfOUYQ8GwzuhB0H4
         ZJAgFiOtfiP+THCB2/L8hBA+RnEDvEfR6Q4kQk8CgkfSAV+/FOsOkwGizibzghKm17gy
         SgkD7mxdNSNPUsU41F3QsLaCLR8WPeSP3kfiRp9knzJgav1HUzeqUKHVIDa/gsgSNRov
         VPfz4f6TaS4naakcZxpldXvzz02aHGD2rb69vSAsyerHBx3fdPwt3Gu7aHAQK55BVavD
         GFmg==
X-Gm-Message-State: ACrzQf388bQsfV56yodK8AnsaVRbe6KtnzCZgcHTZH9AH4693QmeNjOb
	i5DP1abY4cCFnCne+mmMbIQ=
X-Google-Smtp-Source: AMsMyM5CGywIEUWnqnt/+csJfJN4rkb66ER8comeLewKnNKDjNPkiRCoyie9fJC7IdkmSjA4dcW+9A==
X-Received: by 2002:a17:907:270b:b0:7ad:ae01:e0d9 with SMTP id w11-20020a170907270b00b007adae01e0d9mr17137485ejk.196.1667312602855;
        Tue, 01 Nov 2022 07:23:22 -0700 (PDT)
Message-ID: <acb8cac5-3378-30ee-8c3e-f6ff6bc0f178@gmail.com>
Date: Tue, 1 Nov 2022 16:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-12-ayankuma@amd.com>
 <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
 <c2540768-93d7-5023-6203-3885b78d33a0@xen.org>
 <5b5df2ee-b1b4-bfd8-b6bf-6bf5cb92f557@amd.com>
 <01a22605-4ae4-d5ba-205c-ab2c1f7d24c2@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <01a22605-4ae4-d5ba-205c-ab2c1f7d24c2@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/1/22 13:57, Julien Grall wrote:
> Hi Ayan,
> 
> On 01/11/2022 10:59, Ayan Kumar Halder wrote:
>>
>> On 01/11/2022 09:50, Julien Grall wrote:
>>> Hi,
>>
>> Hi Xenia, Julien,
>>
>> I have few clarifications.
>>
>>>
>>> On 01/11/2022 07:08, Xenia Ragiadakou wrote:
>>>> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>>>>> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit 
>>>>> regs.
>>>>> This uses ldrd/strd instructions.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>>> ---
>>>>>
>>>>> Changes from :-
>>>>> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
>>>>> 2. No need to use le64_to_cpu() as the returned byte order is 
>>>>> already in cpu
>>>>> endianess.
>>>>>
>>>>>   xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
>>>>>   1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/arm32/io.h 
>>>>> b/xen/arch/arm/include/asm/arm32/io.h
>>>>> index 73a879e9fb..d9d19ad764 100644
>>>>> --- a/xen/arch/arm/include/asm/arm32/io.h
>>>>> +++ b/xen/arch/arm/include/asm/arm32/io.h
>>>>> @@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile 
>>>>> void __iomem *addr)
>>>>>           return val;
>>>>>   }
>>>>> +static inline u64 __raw_readq(const volatile void __iomem *addr)
>> Rename this to __raw_readq_nonatomic()
>>>>> +{
>>>>> +        u64 val;
>>>>> +        asm volatile("ldrd %Q1, %R1, %0"
>>>>> +                     : "+Qo" (*(volatile u64 __force *)addr),
>>>>> +                       "=r" (val));
>>>>> +        return val;
>>>>> +}
>>>>> +
>>>>> +static inline void __raw_writeq(u64 val, const volatile void 
>>>>> __iomem *addr)
>> Rename to __raw_writeq_nonatomic()
>>>>> +{
>>>>> +    asm volatile("strd %Q1, %R1, %0"
>>>>> +                 : "+Q" (*(volatile u64 __force *)addr)
>>>>> +                 : "r" (val));
>>>>> +}
>>>>> +
>>>>>   #define __iormb()               rmb()
>>>>>   #define __iowmb()               wmb()
>>>>> @@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile 
>>>>> void __iomem *addr)
>>>>>                                           __raw_readw(c)); __r; })
>>>>>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>>>>>                                           __raw_readl(c)); __r; })
>>>>> +#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>>>>> +                                        __raw_readq(c)); __r; })
>>>>>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>>>>>   #define writew_relaxed(v,c)     __raw_writew((__force u16) 
>>>>> cpu_to_le16(v),c)
>>>>>   #define writel_relaxed(v,c)     __raw_writel((__force u32) 
>>>>> cpu_to_le32(v),c)
>>>>> +#define writeq_relaxed(v,c)     __raw_writeq((__force u64) 
>>>>> cpu_to_le64(v),c)
>>>>>   #define readb(c)                ({ u8  __v = readb_relaxed(c); 
>>>>> __iormb(); __v; })
>>>>>   #define readw(c)                ({ u16 __v = readw_relaxed(c); 
>>>>> __iormb(); __v; })
>>>>>   #define readl(c)                ({ u32 __v = readl_relaxed(c); 
>>>>> __iormb(); __v; })
>>>>> +#define readq(c)                ({ u64 __v = readq_relaxed(c); 
>>>>> __iormb(); __v; })
>>>>>   #define writeb(v,c)             ({ __iowmb(); 
>>>>> writeb_relaxed(v,c); })
>>>>>   #define writew(v,c)             ({ __iowmb(); 
>>>>> writew_relaxed(v,c); })
>>>>>   #define writel(v,c)             ({ __iowmb(); 
>>>>> writel_relaxed(v,c); })
>>>>> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
>>>>>   #endif /* _ARM_ARM32_IO_H */
>>>>
>>>> AFAIU, ldrd/strd accesses to MMIO are not guaranteed to be 64-bit 
>>>> single-copy atomic. So, as Julien suggested, you still need to use a 
>>>> different name to reflect this.
>>
>> Yes you are correct, ldrd/strd for system ram are guaranteed to be 
>> atomic. Here we are accessing MMIO, so atomicity is not guaranteed.
>>
>> I wasn't very sure if {read/write}*_relaxed are always atomic.
> 
> All the current use are atomic.
>> #define writeq_relaxed(v,c) __raw_writeq_nonatomic((__force u64) 
>> cpu_to_le64(v),c)
>>
>> #define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
>>                                          __raw_readq_nonatomic(c)); 
>> __r; })
>>
>> We can remove "#define readq()/writeq() ..." as they are not used.
>>
>>>> Also, having nested virtualization in mind, since these instructions 
>>>> can't be virtualized, maybe it would be better to avoid using them 
>>>> for MMIO accesses.
>>
>> Does nested virtualization apply to Arm ?
> 
> This is supported by the Architecture although not implemented in Xen.
> 
>>
>> Reading https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen 
>> , I find two points of interest
>>
>> "Only 64-bit hypervisors are supported at this time."
>>
>> "See below for more details on tested hypervisior / guest 
>> combinations, and known issues on Intel CPUs"
>>
>> Thus, I understand that nested virtualization is supported only on x86 
>> machines and that too 64bit only. Thus, it does not apply to AArch32.
> 
> The wiki page is describing the case where another hypervisor is running 
> on top of Xen. But there is no support necessary in Xen to run it on top 
> of another hypervisor.
> 
> I haven't looked whether the architecture allows to use nested on 32-bit 
> though...
> 

To clarify... what I had in mind was an aarch32 XEN (guest) hosted by an 
aarch64 hypervisor.

>>
>> Let me know if I misunderstood something.
>>
>>>
>>> +1. The previous version was actually using 32-bit access and it is 
>>> not clear to me why the new version is using 64-bit access.
>>
>> IMO, I made a mistake in my previous patch of using 2 32bit access for 
>> a 64 bit register.
>>
>> ldrd/strd is not supported for AArch32 guests in EL1 mode when they 
>> access emulated MMIO region (which traps to EL2).
>>
>> However, ldrd/strd is supported for AArch32 hypervisors running in EL2 
>> mode.
> 
> That's not what I understood from previous discussion [1]. ldrd/strd 
> would be atomic on system RAM but there is no guarantee they would be 
> for MMIO access.
> 
> I know this was Andre's interpretation. However, the HW architects may 
> have interpreted the same way...
> 
> So I think we should be convervative in Xen. AFAICT, in the case of 
> GICv3, we don't need the atomicity for the 64-bit registers. Therefore, 
> I would rather prefer if we introduce an helper that do two 32-bit read.
> 
> Cheers,
> 
> [1] 
> https://lore.kernel.org/xen-devel/20221027153632.0cf7d004@donnerap.cambridge.arm.com/ 
> 
> 

-- 
Xenia

