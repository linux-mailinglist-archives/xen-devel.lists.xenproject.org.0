Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A5686EEC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 20:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488415.756500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNIkt-0003qQ-2q; Wed, 01 Feb 2023 19:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488415.756500; Wed, 01 Feb 2023 19:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNIks-0003of-WB; Wed, 01 Feb 2023 19:26:51 +0000
Received: by outflank-mailman (input) for mailman id 488415;
 Wed, 01 Feb 2023 19:26:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNIkr-0003oZ-IP
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 19:26:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNIkr-0000hH-4O; Wed, 01 Feb 2023 19:26:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.6.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNIkq-0001eo-UD; Wed, 01 Feb 2023 19:26:49 +0000
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
	bh=gyuImUdBmr1Ji/IiyVAftkCsRP2FpRMtSRol289FyCQ=; b=4X7Zg+O8x8o33uCx83S3+fBxWj
	K+I67zLp/x7dn9ll2NOWFzeov1FykczJThQgp98wh813g2T9wKvf9nWoyKkGJM5f5ztlUXE6ToVGk
	4jh+y7/GHgqEk3fhon/3VSY75GZqCRWh5lbHvlqEKCo7ijAYJsmR+8O0ePlSMXKdBSfY=;
Message-ID: <6e96eaa7-a8a3-eaf3-ca44-3432c88e71d1@xen.org>
Date: Wed, 1 Feb 2023 19:26:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
 <AM0PR08MB453026B268BA9FBEEE970090F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <49329992-3203-78a7-fc61-d6494e37705c@xen.org>
 <AM0PR08MB45305D27CA8353162445AE1EF7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <14f9c89a-6eea-204e-cd1b-6bc1cca99716@xen.org>
 <AM0PR08MB4530E442D03BCD5520FEF3EBF7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530E442D03BCD5520FEF3EBF7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/02/2023 05:36, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, January 31, 2023 5:42 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>> setup_early_uart to map early UART
>>
>> Hi Penny,
>>
>> On 31/01/2023 05:38, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Monday, January 30, 2023 6:00 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>> devel@lists.xenproject.org
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>
>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>> setup_early_uart to map early UART
>>>>
>>>>
>>>>
>>>> On 30/01/2023 06:24, Penny Zheng wrote:
>>>>> Hi, Julien
>>>>
>>>> Hi Penny,
>>>>
>>>>>> -----Original Message-----
>>>>>> From: Julien Grall <julien@xen.org>
>>>>>> Sent: Sunday, January 29, 2023 3:43 PM
>>>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>>>> devel@lists.xenproject.org
>>>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>>>> <Volodymyr_Babchuk@epam.com>
>>>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>>>> setup_early_uart to map early UART
>>>>>>
>>>>>> Hi Penny,
>>>>>>
>>>>>> On 29/01/2023 06:17, Penny Zheng wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Julien Grall <julien@xen.org>
>>>>>>>> Sent: Wednesday, January 25, 2023 3:09 AM
>>>>>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>>>>>> devel@lists.xenproject.org
>>>>>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>>>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>>>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>>>>>> <Volodymyr_Babchuk@epam.com>
>>>>>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>>>>>> setup_early_uart to map early UART
>>>>>>>>
>>>>>>>> Hi Peny,
>>>>>>>
>>>>>>> Hi Julien,
>>>>>>>
>>>>>>>>
>>>>>>>> On 13/01/2023 05:28, Penny Zheng wrote:
>>>>>>>>> In MMU system, we map the UART in the fixmap (when earlyprintk
>>>>>>>>> is
>>>>>> used).
>>>>>>>>> However in MPU system, we map the UART with a transient MPU
>>>>>> memory
>>>>>>>>> region.
>>>>>>>>>
>>>>>>>>> So we introduce a new unified function setup_early_uart to
>>>>>>>>> replace the previous setup_fixmap.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>>>>>> ---
>>>>>>>>>       xen/arch/arm/arm64/head.S               |  2 +-
>>>>>>>>>       xen/arch/arm/arm64/head_mmu.S           |  4 +-
>>>>>>>>>       xen/arch/arm/arm64/head_mpu.S           | 52
>>>>>>>> +++++++++++++++++++++++++
>>>>>>>>>       xen/arch/arm/include/asm/early_printk.h |  1 +
>>>>>>>>>       4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>>>>>
>>> Yes, I'll draw the layout for you:
>>
>> Thanks!
>>
>>> '''
>>>    Xen MPU Map before reorg:
>>>
>>> xen_mpumap[0] : Xen text
>>> xen_mpumap[1] : Xen read-only data
>>> xen_mpumap[2] : Xen read-only after init data xen_mpumap[3] : Xen
>>> read-write data xen_mpumap[4] : Xen BSS xen_mpumap[5] : Xen static
>>> heap ......
>>> xen_mpumap[max_xen_mpumap - 7]: Static shared memory section
>>> xen_mpumap[max_xen_mpumap - 6]: Boot Module memory
>> section(kernel,
>>> initramfs, etc) xen_mpumap[max_xen_mpumap - 5]: Device memory
>> section
>>> xen_mpumap[max_xen_mpumap - 4]: Guest memory section
>>> xen_mpumap[max_xen_mpumap - 3]: Early FDT
>> xen_mpumap[max_xen_mpumap -
>>> 2]: Xen init data xen_mpumap[max_xen_mpumap - 1]: Xen init text
>>>
>>> In the end of boot, function init_done will do the reorg and boot-only
>> region clean-up:
>>>
>>> Xen MPU Map after reorg(idle vcpu):
>>>
>>> xen_mpumap[0] : Xen text
>>> xen_mpumap[1] : Xen read-only data
>>> xen_mpumap[2] : Xen read-only after init data
>>
>> In theory 1 and 2 could be merged after boot. But I guess it might be
>> complicated?
>>
> 
> In theory, if in C merging codes, we do not use any read-only data or read-only-after-init
> data, then, ig, it will be ok.
> Since, In MPU system, when we implement C merging codes, we need to disable region 1 and 2
> firstly, and enable the merged region after. The reason is that two MPU regions with address overlapping
> is not allowed when MPU on.

Good to know! I think it should be feasible to avoid accessing read-only 
variable while doing the merge.

Anyway, this looks more like a potential optimization for the future.

>   
>>> xen_mpumap[3] : Xen read-write data
>>> xen_mpumap[4] : Xen BSS
>>> xen_mpumap[5] : Xen static heap
>>> xen_mpumap[6] : Guest memory section
>>
>> Why do you need to map the "Guest memory section" for the idle vCPU?
>>
> 
> Hmmm, "Guest memory section" here refers to *ALL* guest RAM address range with only EL2 read/write access.

For what purpose? Earlier, you said you had a setup with a limited 
number of MPU entries. So it may not be possible to map all the guests RAM.

Xen should only need to access the guest memory in hypercalls and 
scrubbing. In both cases you could map/unmap on demand.

> 
> For guest vcpu, this section will be replaced by guest itself own RAM with both EL1/EL2 access.
> 
> 
>>> xen_mpumap[7] : Device memory section
>>
>> I might be missing some context here. But why this section is not also
>> mapped in the context of the guest vCPU?
>>
>> For instance, how would you write to the serial console when the context is
>> the guest vCPU?
>>
> 
> I think, as Xen itself, it shall have access to all system device memory on EL2.
> Ik, it is not accurate in current MMU implementation, only devices with supported driver
> will get ioremap.

So in the MMU case, we are not mapping all the devices in Xen because we 
don't exactly know which memory attributes will be used by the guest.

If we are using different attributes, then we are risking to break 
coherency. Could the same issue happen with the MPU?

If so, then you should not mapped those regions in Xen.

> 
> But like we discussed before, if following the same strategy as MMU does, with limited
> MPU regions, we could not afford mapping a MPU region for each device.
> For example, On FVPv8R model, we have four uarts, and a GICv3. At most, we may provide
> four MPU regions for uarts, and two MPU regions for Distributor and one Redistributor region.
> So, I thought up this new device tree property “mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>;“
> to roughly map all system device memory for Xen itself.

Why do you say "roughly"? Is it possible that you have non-device region 
in the range?

> 
> For guest, it shall only see vgic, vpl011, and its own passthrough device. And here, to maintain safe and
> isolation, we will be mapping a MPU region for each device for guest vcpu.
> For example, vgic and vpl011 are emulated and direct-map in MPU. Relevant device

I am confused. If the vGIC/vPL011 is emulated then why do you need to 
map it in the MPU? IOW, wouldn't you receive a fault in the hypervisor 
if the guest is trying to access a region not present in the MPU?

> mapping(GFN == MFN with only EL2 access)will be added to its *P2M mapping table*, in vgic_v3_domain_init [1].
> 
> Later, on vcpu context switching, when switching from idle vcpu, device memory section gets disabled
> and switched out in ctxt_switch_from [2], later when switching into guest vcpu, vgic and vpl011 device mapping
> will be switched in along with the whole P2M mapping table [3].
> 
> Words might be ambiguous, but all related code implementation is on MPU patch serie part II - guest initialization, you may
> have to check the gitlab link:
> [1] https://gitlab.com/xen-project/people/weic/xen/-/commit/a51d5b25eb17a50a36b27987a2f48e14793ac585
> [2] https://gitlab.com/xen-project/people/weic/xen/-/commit/c6a069d777d9407aeda42b7e5b08a086a1c15976
> [3] https://gitlab.com/xen-project/people/weic/xen/-/commit/d8c6408b6eef1190d75c9bd4e58557d34fc8b4df

I have looked at the code and this doesn't entirely answer my question. 
So let me provide an example.

Xen can print to the serial console at any time. So Xen should be able 
to access the physical UART even when it has context switched to the 
guest vCPU.

But above you said that the physical device would not be accessible and 
instead you map the virtual UART. So how Xen is supported to access the 
physical UART?

Or by vpl011 did you actually mean the physical UART? If so, then if you 
map the device one by one in the MPU context, then it would likely mean 
to have space to map them one by one in the idle context.

> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> ( Fixed MPU region defined in assembly )
> --------------------------------------------------------------------------
> xen_mpumap[5]: Xen init data
> xen_mpumap[6]: Xen init text
> xen_mpumap[7]: Early FDT
> xen_mpumap[8]: Guest memory section
> xen_mpumap[9]: Device memory section
> xen_mpumap[10]: Static shared memory section
> ( boot-only and switching regions defined in C )
> --------------------------------------------------------------------------
> ...
> xen_mpumap[max_xen_mpumap - 1] : Xen static heap
> ( Fixed MPU region defined in C )
> --------------------------------------------------------------------------
> 
> After re-org:
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> ( Fixed MPU region defined in assembly )
> --------------------------------------------------------------------------
> xen_mpumap[8]: Guest memory section
> xen_mpumap[9]: Device memory section
> xen_mpumap[10]: Static shared memory section
> ( Switching region )
> --------------------------------------------------------------------------
> ...
> xen_mpumap[max_xen_mpumap - 1] : Xen static heap
> ( Fixed MPU region defined in C )
> 
> If you're fine with it, then next serie, I'll use this layout, to keep both
> simple assembly and re-org process.

I am ok in principle with the layout you propose. My main requirement is 
that the region used in assembly are fixed.

Cheers,

-- 
Julien Grall

