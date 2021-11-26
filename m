Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8745F0AD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233200.404513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd99-0000yP-Ie; Fri, 26 Nov 2021 15:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233200.404513; Fri, 26 Nov 2021 15:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd99-0000vn-FV; Fri, 26 Nov 2021 15:28:19 +0000
Received: by outflank-mailman (input) for mailman id 233200;
 Fri, 26 Nov 2021 15:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ffxt=QN=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mqd97-0000vh-HE
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:28:17 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e83::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 794e945b-4ecd-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:28:15 +0100 (CET)
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by MWHPR0201MB3596.namprd02.prod.outlook.com (2603:10b6:301:79::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 15:28:09 +0000
Received: from BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::8f) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 15:28:09 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT029.mail.protection.outlook.com (10.13.2.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 15:28:09 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 15:28:08 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 26 Nov 2021 15:28:08 +0000
Received: from [10.71.119.170] (port=6428)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mqd8x-0003SD-5F; Fri, 26 Nov 2021 15:28:07 +0000
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
X-Inumbo-ID: 794e945b-4ecd-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNNr+qB/9ZEZlsRhr62lLRhI4jk+xTaRFGr5flsVIQqoBHuCfV9EzSP3kJM4sxA8MhazIZKx9EJFbFJvVJaddPiiCyd7MuegXr6vmvKctIJyzGbDtG0bzoqC+XgWKeviDW2mcRbqRO8JJAoiYj/FcUdhJwtI8/KWhNHltt8BmnESa66cHCRdpf/kswN9tSZA94gt/mM7aRO8E7cK0b3Z93WBQjMTaTGGKJNTjFbHqai8u5jCTN2KOGWqO3qI0rK/UZdRXpSHRTxVk0ieXmbL8HtIraQebRmUYU3+98eulCTHeX6wc4Z443W75ijKcjT0iyfOHMqh3CbsawNGGKY4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1DOFrJB97afL5zbCaY0doj+ZP/5QM9KxCUVvLfmgac=;
 b=Zy9oNoW4XcxVEwlEJlOvEvChxWxpzPjK8TLVfsGInPaqeh4nmrk5H2YOSqTokofMmMPZCz4Dzwa/aLHcm1ckiofwdlIDxN7CCwaX36sLxgpQFM9fjkUrMBTBPy8pD20Jf1grohg9sVVb4V9TcHsywwkzmfbBwRR5ClSQ8jTofJYsPh2RnLZcHE1k7kSlQIBNEu+FD0NcbaGZLuSQZvua3pqI6d5QjWLSaF5K19mrNjYRbHPXRmlY2AUN9mo1Yl+ehx+Zmx2kZsrzPPy1cS7iMrLtro+egrhexFGO6x+iQrOxwmOBssbPHF9o8cIGziLq7Nw7O38LO5yK0Eaazfzi/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1DOFrJB97afL5zbCaY0doj+ZP/5QM9KxCUVvLfmgac=;
 b=Zis9NNmCnVHaYUXuwwmhOgYzXcacmC2LP/iog8n2TMxwSAnsnJVHMIhrek8wqdvIl7NxJhVsBWvp5yEUC19+Og3A+6L/N3RQ7pnruFtQ6v7uS0vfUHoTC2AixN63Hp6D9jDoBQqkw1sajS6rm3J4kIfLJD42kc7koZHNmbjtsxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <5d72345d-3236-0fa6-24fc-652385f41b54@xilinx.com>
Date: Fri, 26 Nov 2021 15:28:06 +0000
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
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20211126131459.2bbc81ad@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc337427-2148-46ac-70ab-08d9b0f15a1f
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3596:
X-Microsoft-Antispam-PRVS:
	<MWHPR0201MB35961B5C457FA4B18A7F8034B2639@MWHPR0201MB3596.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dJ3a1hVEWSsLDozm+4CNFYoNcOSdPx3bqdGGMADDtFT2/Ucx+hPfQAA8Ij3ToE7MFNOAHtTXdHSuQ5VV5Oef/RtZcg5hsaQRDBYZw0JBDynOznJVRj3u4RSqtcOlHmLQVyaweefx/c5KE8H2fqg72ecB8EUVVxF81cI7Jvabdmol0WkYvgJl4HFKIfU0PPadCyWflxKs2vN+HHRG+9EWsH2nm934TXA7OKeXW/ROb425bluE7p8lh77MTyqomSiqJvwDQWyLGKjabiiu65nSQOvXmbb4cCOb4vKrVI2bWmEaxYc5gw2C1WLmSM20TcpMVHx+/b43xB4w8dsCU5YmiP9ARO4Yx+GI5L0GpUGMnZLjvY9Iwhu23ZdH5DmCoqsHjYVeDeWOYwSh5zDP+udEAYC9zOiVPer7dgceCrzArz1UEuyP62FOgr7ufe2+1l6r1JI452gl3dsVSAMq59/B0Mbt/6vjhA7vZU1nn0FPrngpRggFxp7JLfHQJF9/2Z8BgE/YxrjqRLvvHSpIbgC4u4qAz9F5JoR2yA5AaGKnFmEPcagOBPX2/dXeiRjAtvEc1FN8q6i32iv1ght0khSGYu2xN7OEuK21B4+LHjVqCVdTYciaYhehYE5Vn2WLeRYBj97fwJ5qpKvN9s4Cq6yFsAAUBQF9YCZM5QUMxBOfGrCyj1mXBzSwfQIV3mhftXLEPgBeVbHYqYCZrFWsUbCzEH3bzI5e2LF8GcoUyhgvSyYqx2WP/jgWh0StKPocGwSIC790C4AJlKr8YB/eLsBJoLGoP6HVci8qn07Zk4BvbT+JVsxD/2NydyraOFUgyREHXabGdlFzzXK4TDlpA5L6xSzpElHJI9R8JVUklikPLgdRxAzB4clNaY3MwU9+GnDS
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(47076005)(508600001)(2906002)(5660300002)(54906003)(316002)(31686004)(36756003)(36860700001)(83380400001)(53546011)(70586007)(8676002)(31696002)(26005)(186003)(966005)(7636003)(4326008)(70206006)(426003)(82310400004)(2616005)(110136005)(8936002)(356005)(9786002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 15:28:09.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc337427-2148-46ac-70ab-08d9b0f15a1f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3596

Hi Andre,

Many thanks for your inputs.
Apologies if I sound dumb, but I need a few clarifications.

On 26/11/2021 13:14, Andre Przywara wrote:
> On Fri, 19 Nov 2021 16:52:02 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> 
> Hi,
> 
>> At present, post indexing instructions are not emulated by Xen.
>> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
>> result, data abort is triggered.
>>
>> Added the logic to decode ldr/str post indexing instructions.
>> With this, Xen can decode instructions like these:-
>> ldr w2, [x1], #4
>> Thus, domU can read ioreg with post indexing instructions.
> 
> Where do those instructions come from? A (C) compiler? (Some mail in
> another thread from Stefano suggests so)
> If yes, I would argue that is broken:
> IIUC C compilers assume normal memory attributes for every pointer they
> handle, so they are free to use unaligned accesses, load/store exclusives,
> split accesses (two halfword reads) and what not when generating code.
> The GIC needs to be mapped as device memory, which explicitly forbids
> unaligned accesses and exclusives (as in: always traps), so you cannot let
> compiler-generated code access the GIC (or most other MMIO devices, for
> that matter).
> I know, this somewhat works(TM) in practise, because a uint32_t assignment
> is very likely to end up in an ldr/str, but please let me know which car
> this code ends up in, so that can I avoid this brand ;-)
> 
> You can tell the compiler to avoid unaligned accesses with -mstrict-align
> (and should definitely do so when you are running C code with the MMU
> off), but that still leaves exclusives and split accesses at the
> compiler's discretion. A variation on the topic of split access is merged
> writes, where the compiler uses NEON or SVE instructions, for instance, to
> cover multiple words at once, possibly via some memset()/memcpy() routine.

I understand that we should be using inline assembly instructions to 
access any MMIO region. This is to prevent the compiler doing any tricks.

But is there a restriction that post indexing instructions can never be 
used to access MMIO region ?

> 
> On top there is this architectural restriction of the ARMv7/v8
> virtualisation extension to not decode many "advanced" load/store
> instructions in ESR_EL2.
Where do I find this restriction ?

Are you telling me that load/store with post indexing is an "advanced" 
instruction and ArmV8 does not allow decoding of these instructions in 
ESR_EL2 ? Isn't that a very strong limitation ?

Also what is your opinion on Xen decoding these instructions ?

- Ayan

> Linux deliberately coded readl/writel using inline assembly, to only use
> instructions that provide syndrome information, plus guarantee
> device-memory compatible semantics.
> Check out https://lwn.net/Articles/698014/ for a comprehensive discussion
> of this whole MMIO topic.
> 
> So I think you should do the same in your guest/bare metal code: define
> {read,write}{b,h,l,q} as inline assembly functions, using ldr?/str? only.
> See xen/include/asm-arm/arm64/io.h for an example that uses static inline
> functions in a header file, to generate most optimal code. Then always do
> MMIO only via those accessors. That prevents any future compiler
> surprises, plus makes you perfectly virtualisable.
> 
> Cheers,
> Andre.
> 
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>> Note to reviewer:-
>> This patch is based on an issue discussed in
>> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
>> "Xen/ARM - Query about a data abort seen while reading GICD registers"
>>
>>
>>   xen/arch/arm/decode.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>>   xen/arch/arm/io.c     | 14 ++++++--
>>   2 files changed, 88 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 792c2e92a7..7b60bedbc5 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,80 @@ bad_thumb2:
>>       return 1;
>>   }
>>   
>> +static inline int32_t extract32(uint32_t value, int start, int length)
>> +{
>> +    int32_t ret;
>> +
>> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
>> +        return -EINVAL;
>> +
>> +    ret = (value >> start) & (~0U >> (32 - length));
>> +
>> +    return ret;
>> +}
>> +
>> +static int decode_64bit_loadstore_postindexing(register_t pc, struct hsr_dabt *dabt)
>> +{
>> +    uint32_t instr;
>> +    int size;
>> +    int v;
>> +    int opc;
>> +    int rt;
>> +    int imm9;
>> +
>> +    /* For details on decoding, refer to Armv8 Architecture reference manual
>> +     * Section - "Load/store register (immediate post-indexed)", Pg 318
>> +    */
>> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
>> +        return -EFAULT;
>> +
>> +    /* First, let's check for the fixed values */
>> +
>> +    /*  As per the "Encoding table for the Loads and Stores group", Pg 299
>> +     * op4 = 1 - Load/store register (immediate post-indexed)
>> +     */
>> +    if ( extract32(instr, 10, 2) != 1 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    /* For the following, refer to "Load/store register (immediate post-indexed)"
>> +     * to get the fixed values at various bit positions.
>> +     */
>> +    if ( extract32(instr, 21, 1) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 24, 2) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 27, 3) != 7 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    size = extract32(instr, 30, 2);
>> +    v = extract32(instr, 26, 1);
>> +    opc = extract32(instr, 22, 1);
>> +
>> +    /* At the moment, we support STR(immediate) - 32 bit variant and
>> +     * LDR(immediate) - 32 bit variant only.
>> +     */
>> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>> +        goto bad_64bit_loadstore;
>> +
>> +    rt = extract32(instr, 0, 5);
>> +    imm9 = extract32(instr, 12, 9);
>> +
>> +    if ( imm9 < 0 )
>> +        update_dabt(dabt, rt, size, true);
>> +    else
>> +        update_dabt(dabt, rt, size, false);
>> +
>> +    dabt->valid = 1;
>> +
>> +
>> +    return 0;
>> +bad_64bit_loadstore:
>> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
>> +    return 1;
>> +}
>> +
>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>   {
>>       uint16_t instr;
>> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>           return decode_thumb(regs->pc, dabt);
>>   
>> +    if ( is_64bit_domain(current->domain) )
>> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
>> +
>>       /* TODO: Handle ARM instruction */
>>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>   
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..49e80358c0 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>           .gpa = gpa,
>>           .dabt = dabt
>>       };
>> +    int rc;
>>   
>>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>   
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>>           rc = try_fwd_ioserv(regs, v, &info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>   
>>       /* All the instructions used on emulated MMIO region should be valid */
>>       if ( !dabt.valid )
>> -        return IO_ABORT;
>> +    {
>> +        /*
>> +         * Post indexing ldr/str instructions are not emulated by Xen. So, the
>> +         * ISS is invalid. In such a scenario, we try to manually decode the
>> +         * instruction from the program counter.
>> +         */
>> +        rc = decode_instruction(regs, &info.dabt);
>> +        if ( rc )
>> +            return IO_ABORT;
>> +    }
>>   
>>       /*
>>        * Erratum 766422: Thumb store translation fault to Hypervisor may
> 

