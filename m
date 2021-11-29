Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B646206A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 20:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234816.407477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrmGr-00060D-2B; Mon, 29 Nov 2021 19:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234816.407477; Mon, 29 Nov 2021 19:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrmGq-0005y3-VE; Mon, 29 Nov 2021 19:25:00 +0000
Received: by outflank-mailman (input) for mailman id 234816;
 Mon, 29 Nov 2021 19:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=le4t=QQ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mrmGp-0005xx-3y
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 19:24:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e56a05-514a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 20:24:57 +0100 (CET)
Received: from DM6PR02CA0040.namprd02.prod.outlook.com (2603:10b6:5:177::17)
 by SA1PR02MB8574.namprd02.prod.outlook.com (2603:10b6:806:1fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 19:24:53 +0000
Received: from DM3NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::2c) by DM6PR02CA0040.outlook.office365.com
 (2603:10b6:5:177::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Mon, 29 Nov 2021 19:24:52 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT003.mail.protection.outlook.com (10.13.4.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 19:24:52 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 29 Nov 2021 19:24:51 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 29 Nov 2021 19:24:51 +0000
Received: from [10.71.119.80] (port=25136)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mrmGa-00062J-3j; Mon, 29 Nov 2021 19:24:50 +0000
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
X-Inumbo-ID: 08e56a05-514a-11ec-b941-1df2895da90e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJVhzEP3Bi/Lg/jqg0UYzRazqRHKbX7LO8BcYeTI/2tlM0/L2qgsKUoWxUntMvNufQT8EDZIw5SRNVNEczZOWCI7YhLjz3UbzTuPLgTma8YQL0srhg4BAzbJoVQMPqMXfKAYDFPP4hgY2yVSn1g72ynxJAoXEQVk0B6uV4X1To4LPERdAAYomrAd5jS3beZhzN1kyZJi50X7zVZqVsBMU+iK4NnwtW/Hg3MFRdM8qIzV64BLXw7Le2DLoR4MyyvsmCdgqYOR07uiG2FyjUcnVb5C5NYF9gPQHWypcD60rosazFWUp4TzBtGXVIFnB31JadTuf10dWSrFpta+PVzk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEDP4xPMkvRndMj75mi0OiNjmr4A32Gzx6+HAepgcB0=;
 b=R3XKekTNhuxH1hmYK8oGtEgM3a65cjKSYzSBQaQV6kJ2qlgLag27gXCUiUt7l4vPCagg8xuLxsNpjHGS+BeoScmVsXo91orW6Sh9naPr5fD/BMO+wAzrYCAd+urLfqoYZYLlIJ+s1moYPsXskjgN55KiMWRjXQQN6WQaBLOK4saR9ZiZ84i5bfxc69/vqcJnu5yxd1/2XHxziheprWa5gzIhb299N+R1rscg7/jLF6L1wNZlc7V5nx9LZg+9u7z96EYWRDXreS9W1eyekMPuFyyH6yQkHeRhhRQjp/a1i/4aNmJXR8LLIkIBePGNNU/X5lZmkvT4szNCvdyqa0HrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEDP4xPMkvRndMj75mi0OiNjmr4A32Gzx6+HAepgcB0=;
 b=U1BwwVFRCzQIkFC+QKi3f4Xc8YhF6VIrMLsJEQr9824l8hq5kYa+EqfEJnmcE89665R9m1W9A7IRFrTS9RTzMoCqr9LaA6nFSzG9O3XN6n7UXiHupfDNelMt/AXoAgb3HPkEXgL3GBl/hgBXqQRoAb+98NtNbzeS3OK72Wdp7Z0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <7a655592-5954-7593-a155-537292897294@xilinx.com>
Date: Mon, 29 Nov 2021 19:24:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
To: Andre Przywara <andre.przywara@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<stefano.stabellini@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <20211126131459.2bbc81ad@donnerap.cambridge.arm.com>
 <5d72345d-3236-0fa6-24fc-652385f41b54@xilinx.com>
 <20211126173937.2d28c47d@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20211126173937.2d28c47d@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf1d412-6fc6-4e55-e8ae-08d9b36deb2c
X-MS-TrafficTypeDiagnostic: SA1PR02MB8574:
X-Microsoft-Antispam-PRVS:
	<SA1PR02MB8574E901D246407ADD997206B2669@SA1PR02MB8574.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SvXEonasvW3BAC+9DXypFbeCjwuYYSNld8ieXmOzIhBKseAK87MfrTOLp8ls06pE27yZUoMqzx7lCu/Xr07HD8naFKMGteUUgUbt4RnsOIebN7s3w9rItuVhNsGkjNiLx+ELG6HwweYah4RSIhDA7GeBDNZmY/6cZVJC1JRR7AoGIQkV8AdChdPkxuiRLSMfQ7ehbFPJ+6exrNG1s27Da8hjblgUbZrHGtByUp2z4dS+j3241enVo6P9n2sm4Gp64KMMEJqopQaJOHBuHOwAcPhoLvsUNclmGcFilGJZyj99zomsv3Qf5fKSwXIE2SSew9qPYEmOWXAY2DvI69Re59APrdx09OQEGJOZkKKWzbqNrVJ4qVO1WKW/JJ2E7GJaHwcaqLnQ+shnPQpQXghEA3uF7VVVekWEiX3cKriMItzHMzMXlIeaeIMDvIsBoIxe+1HJAu5YwB1U18BJvoY6NKMuq6u6x32L00WceuyNmmkXZTcutfYZJiHLKhGkPxowFKrCsWnNvEZwnRY84VrOh11xxrHU5uDD3MlrA7HxtU3P1bidDCx+UDM999F4tMy385ojorE4z5EAmeVp3xmvjYwQq2I7HDi0DHwJnkd4+YgNktdx4DMnvwjRGCm1v89+NeGa8o1Vni1SM28DVhDEJxbp7DO/eAJXB5jGKFiqlbjWuRsLmO70b7qwWVVMd+5AGmphFQGHnTprFDq7g8N4u8FWq7wa9WHYnzxlqkoBP1blwODMtDE8Vx7QaW+qumUowb8RAAQ2gZOiXC9pDsdUvF9Ahkshhq9g3CcCvYYJLnRbcV2SLee0a5nd3Yu+2MUIYfOjeQTKZJ4WwOxU49HekY8gIGQew846yyIIthekkW2xYAeZcipJOpPImnARzIzN
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(47076005)(8676002)(508600001)(2616005)(336012)(54906003)(70206006)(36860700001)(26005)(9786002)(356005)(110136005)(36756003)(31686004)(7636003)(83380400001)(70586007)(966005)(4326008)(30864003)(8936002)(53546011)(186003)(426003)(6666004)(2906002)(82310400004)(5660300002)(316002)(31696002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 19:24:52.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf1d412-6fc6-4e55-e8ae-08d9b36deb2c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8574

Hi All,

Thanks for giving your inputs.

On 26/11/2021 17:39, Andre Przywara wrote:
> On Fri, 26 Nov 2021 15:28:06 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> 
> Hi Ayan,
> 
>> Many thanks for your inputs.
>> Apologies if I sound dumb, but I need a few clarifications.
>>
>> On 26/11/2021 13:14, Andre Przywara wrote:
>>> On Fri, 19 Nov 2021 16:52:02 +0000
>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>
>>> Hi,
>>>    
>>>> At present, post indexing instructions are not emulated by Xen.
>>>> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
>>>> result, data abort is triggered.
>>>>
>>>> Added the logic to decode ldr/str post indexing instructions.
>>>> With this, Xen can decode instructions like these:-
>>>> ldr w2, [x1], #4
>>>> Thus, domU can read ioreg with post indexing instructions.
>>>
>>> Where do those instructions come from? A (C) compiler? (Some mail in
>>> another thread from Stefano suggests so)
>>> If yes, I would argue that is broken:
>>> IIUC C compilers assume normal memory attributes for every pointer they
>>> handle, so they are free to use unaligned accesses, load/store exclusives,
>>> split accesses (two halfword reads) and what not when generating code.
>>> The GIC needs to be mapped as device memory, which explicitly forbids
>>> unaligned accesses and exclusives (as in: always traps), so you cannot let
>>> compiler-generated code access the GIC (or most other MMIO devices, for
>>> that matter).
>>> I know, this somewhat works(TM) in practise, because a uint32_t assignment
>>> is very likely to end up in an ldr/str, but please let me know which car
>>> this code ends up in, so that can I avoid this brand ;-)
>>>
>>> You can tell the compiler to avoid unaligned accesses with -mstrict-align
>>> (and should definitely do so when you are running C code with the MMU
>>> off), but that still leaves exclusives and split accesses at the
>>> compiler's discretion. A variation on the topic of split access is merged
>>> writes, where the compiler uses NEON or SVE instructions, for instance, to
>>> cover multiple words at once, possibly via some memset()/memcpy() routine.
>>
>> I understand that we should be using inline assembly instructions to
>> access any MMIO region. This is to prevent the compiler doing any tricks.
>>
>> But is there a restriction that post indexing instructions can never be
>> used to access MMIO region ?
> 
> No, this is a pure virtualisation restriction, see below. On real
> hardware/bare-metal, ldr/str with post or pre-indexing works and is fine
> to use for MMIO.
> But we need to have the right access width, matching the MMIO device's
> expectation. So ldp/stp would probably be problematic, for instance.
> 
>>> On top there is this architectural restriction of the ARMv7/v8
>>> virtualisation extension to not decode many "advanced" load/store
>>> instructions in ESR_EL2.
>> Where do I find this restriction ?
> 
> That's described in the ESR_ELx syndrome description in the ARMv8 ARM (DDI
> 0487G.b), section "ISS encoding for an exception from a Data Abort" (page
> D13-3219 in my Issue G.b copy):
> "For other faults reported in ESR_EL2, ISV is 0 except for the following stage 2 aborts: ...."
> 
>> Are you telling me that load/store with post indexing is an "advanced"
>> instruction and ArmV8 does not allow decoding of these instructions in
>> ESR_EL2 ?
> 
> Yes, it is in the group of instructions for which the hardware does not
> provide syndrome information in ESR_EL2: " .... but excluding Load
> Exclusive or Store Exclusive and excluding those with writeback)."
> 
>> Isn't that a very strong limitation ?
> 
> I don't know about that, it's what it is and what it was for years. Linux
> deliberately chose ldr/str only for readl/writel to be able to trap and
> handle MMIO aborts in hypervisors.
> 
> If you do MMIO accesses the right way, using (inline) assembly only, then
> you don't have the problem, and also avoid many others, see my previous
> mail.
> 
> If you think of it from an architectural and implementation point of view
> (and keep the RISC idea in mind): it should happen rarely, but would
> require many gates for something that you can do in software as well.
> 
>> Also what is your opinion on Xen decoding these instructions ?
> 
> I would be careful, we deliberately avoid this in KVM. This bubbles up
> from time to time, though, so we now allow delegating this case to
> userland, so the VMM can do the decoding there.
> In Xen you have less issues with walking the guest's page tables,
> though (a major problem in KVM), but it still adds complexity to a
> hypervisor which aims to be lean by design.
> Another argument would be that just post/pre does not cover everything, and
> the cases start to pile up quickly: what about the immediate versions,
> ldxr, stp, NEON/SVE load/stores, etc. Since many of those are not safe for
> MMIO anyway, you add a lot of code for little use (and which gets little
> testing!).

Many thanks for your explanation. It makes some sense. Unfortunately, I 
don't have much experience with hypervisors. So I will rely on you and 
other experts opinions on this. :)

I have sent out a v2 patch "[XEN v2] xen/arm64: io: Decode 32-bit 
ldr/str post-indexing instructions". Please have a look.

Stefano/Julien/Bertrand/Jan :- Please have a look at my v2 patch and let 
me know if it makes sense to add the decoding logic to Xen or if it 
makes the codebase very complex.

- Ayan

> 
> Cheers,
> Andre
> 
>>> Linux deliberately coded readl/writel using inline assembly, to only
>>> use instructions that provide syndrome information, plus guarantee
>>> device-memory compatible semantics.
>>> Check out https://lwn.net/Articles/698014/ for a comprehensive
>>> discussion of this whole MMIO topic.
>>>
>>> So I think you should do the same in your guest/bare metal code: define
>>> {read,write}{b,h,l,q} as inline assembly functions, using ldr?/str?
>>> only. See xen/include/asm-arm/arm64/io.h for an example that uses
>>> static inline functions in a header file, to generate most optimal
>>> code. Then always do MMIO only via those accessors. That prevents any
>>> future compiler surprises, plus makes you perfectly virtualisable.
>>>
>>> Cheers,
>>> Andre.
>>>    
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>>> ---
>>>> Note to reviewer:-
>>>> This patch is based on an issue discussed in
>>>> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
>>>> "Xen/ARM - Query about a data abort seen while reading GICD registers"
>>>>
>>>>
>>>>    xen/arch/arm/decode.c | 77
>>>> +++++++++++++++++++++++++++++++++++++++++++ xen/arch/arm/io.c     |
>>>> 14 ++++++-- 2 files changed, 88 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>>> index 792c2e92a7..7b60bedbc5 100644
>>>> --- a/xen/arch/arm/decode.c
>>>> +++ b/xen/arch/arm/decode.c
>>>> @@ -84,6 +84,80 @@ bad_thumb2:
>>>>        return 1;
>>>>    }
>>>>    
>>>> +static inline int32_t extract32(uint32_t value, int start, int
>>>> length) +{
>>>> +    int32_t ret;
>>>> +
>>>> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
>>>> +        return -EINVAL;
>>>> +
>>>> +    ret = (value >> start) & (~0U >> (32 - length));
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int decode_64bit_loadstore_postindexing(register_t pc, struct
>>>> hsr_dabt *dabt) +{
>>>> +    uint32_t instr;
>>>> +    int size;
>>>> +    int v;
>>>> +    int opc;
>>>> +    int rt;
>>>> +    int imm9;
>>>> +
>>>> +    /* For details on decoding, refer to Armv8 Architecture
>>>> reference manual
>>>> +     * Section - "Load/store register (immediate post-indexed)", Pg
>>>> 318
>>>> +    */
>>>> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof
>>>> (instr)) )
>>>> +        return -EFAULT;
>>>> +
>>>> +    /* First, let's check for the fixed values */
>>>> +
>>>> +    /*  As per the "Encoding table for the Loads and Stores group",
>>>> Pg 299
>>>> +     * op4 = 1 - Load/store register (immediate post-indexed)
>>>> +     */
>>>> +    if ( extract32(instr, 10, 2) != 1 )
>>>> +        goto bad_64bit_loadstore;
>>>> +
>>>> +    /* For the following, refer to "Load/store register (immediate
>>>> post-indexed)"
>>>> +     * to get the fixed values at various bit positions.
>>>> +     */
>>>> +    if ( extract32(instr, 21, 1) != 0 )
>>>> +        goto bad_64bit_loadstore;
>>>> +
>>>> +    if ( extract32(instr, 24, 2) != 0 )
>>>> +        goto bad_64bit_loadstore;
>>>> +
>>>> +    if ( extract32(instr, 27, 3) != 7 )
>>>> +        goto bad_64bit_loadstore;
>>>> +
>>>> +    size = extract32(instr, 30, 2);
>>>> +    v = extract32(instr, 26, 1);
>>>> +    opc = extract32(instr, 22, 1);
>>>> +
>>>> +    /* At the moment, we support STR(immediate) - 32 bit variant and
>>>> +     * LDR(immediate) - 32 bit variant only.
>>>> +     */
>>>> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>>>> +        goto bad_64bit_loadstore;
>>>> +
>>>> +    rt = extract32(instr, 0, 5);
>>>> +    imm9 = extract32(instr, 12, 9);
>>>> +
>>>> +    if ( imm9 < 0 )
>>>> +        update_dabt(dabt, rt, size, true);
>>>> +    else
>>>> +        update_dabt(dabt, rt, size, false);
>>>> +
>>>> +    dabt->valid = 1;
>>>> +
>>>> +
>>>> +    return 0;
>>>> +bad_64bit_loadstore:
>>>> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
>>>> +    return 1;
>>>> +}
>>>> +
>>>>    static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>>>    {
>>>>        uint16_t instr;
>>>> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs
>>>> *regs, struct hsr_dabt *dabt) if ( is_32bit_domain(current->domain)
>>>> && regs->cpsr & PSR_THUMB ) return decode_thumb(regs->pc, dabt);
>>>>    
>>>> +    if ( is_64bit_domain(current->domain) )
>>>> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
>>>> +
>>>>        /* TODO: Handle ARM instruction */
>>>>        gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>>>    
>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>> index 729287e37c..49e80358c0 100644
>>>> --- a/xen/arch/arm/io.c
>>>> +++ b/xen/arch/arm/io.c
>>>> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct
>>>> cpu_user_regs *regs, .gpa = gpa,
>>>>            .dabt = dabt
>>>>        };
>>>> +    int rc;
>>>>    
>>>>        ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>>>    
>>>>        handler = find_mmio_handler(v->domain, info.gpa);
>>>>        if ( !handler )
>>>>        {
>>>> -        int rc;
>>>> -
>>>>            rc = try_fwd_ioserv(regs, v, &info);
>>>>            if ( rc == IO_HANDLED )
>>>>                return handle_ioserv(regs, v);
>>>> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct
>>>> cpu_user_regs *regs,
>>>>        /* All the instructions used on emulated MMIO region should be
>>>> valid */ if ( !dabt.valid )
>>>> -        return IO_ABORT;
>>>> +    {
>>>> +        /*
>>>> +         * Post indexing ldr/str instructions are not emulated by
>>>> Xen. So, the
>>>> +         * ISS is invalid. In such a scenario, we try to manually
>>>> decode the
>>>> +         * instruction from the program counter.
>>>> +         */
>>>> +        rc = decode_instruction(regs, &info.dabt);
>>>> +        if ( rc )
>>>> +            return IO_ABORT;
>>>> +    }
>>>>    
>>>>        /*
>>>>         * Erratum 766422: Thumb store translation fault to Hypervisor
>>>> may
>>>    
> 

