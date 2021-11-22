Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F12459017
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228901.396138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAAi-00039w-Po; Mon, 22 Nov 2021 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228901.396138; Mon, 22 Nov 2021 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAAi-00037J-MW; Mon, 22 Nov 2021 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 228901;
 Mon, 22 Nov 2021 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3RN=QJ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mpAAh-00036z-B6
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:19:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb09997-4b9f-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 15:19:49 +0100 (CET)
Received: from BN6PR12CA0047.namprd12.prod.outlook.com (2603:10b6:405:70::33)
 by SA2PR02MB7577.namprd02.prod.outlook.com (2603:10b6:806:134::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:19:46 +0000
Received: from BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::40) by BN6PR12CA0047.outlook.office365.com
 (2603:10b6:405:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Mon, 22 Nov 2021 14:19:45 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT015.mail.protection.outlook.com (10.13.2.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 14:19:43 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 14:19:42 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 14:19:42 +0000
Received: from [10.71.118.182] (port=49762)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mpAAX-0005Kk-Lz; Mon, 22 Nov 2021 14:19:42 +0000
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
X-Inumbo-ID: 3fb09997-4b9f-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2qq7Q1t4oRLBHngVk6DnLXgF5bqtDAV8JiTrM/K4KkAxBotJSbvCE2f38DLutX9+EPkvtGYT+AWI1ED4yHpH4M3cjlQ9ikeXLNBLTOxL5/swESj77Go4fcJcUiWkKM6PcreZbN6oY8ndCv159vNGDkQKXmKqqot/y83GhnRdMVAlw0CDAPSisP6DKwf7Q6LXGIjK12dbbFQoS/7FkFtdtAnkA0tmbLO1Tljv0SScG6ZWsMop7BT1I2XKZw0dadwnmIKU9bGpHzdj6OFGK/qAMS74b90glg3LsL9oRLiC+jkEUOxOByyvtGqxOgV3edoXP9K5xnE7BEaaZTuYY/k5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYL2Dlt4TbBTnT/juakRIf0jyz3Yh+XInVEk9Yj7yog=;
 b=aILtdGwH7KZ6MG3pq3qvgxvXc/GnRcY0WTXAA0S2uM6/zTizNnkgL79QbMwSytXAsMIdD+fx2AfuhTEnJE4lJVAy65GW3b5e/dtVDnfDodKC4MFvj3ZevYWl7qeqXgCBwNLZdd+onTnSnHA5CQZqjksTdaH/IBpb3NxFCQC3lrfun901TMpkcOXp1uTN+CLGwEo5xoW32ZxKmZ8gxz6/WarZEmIAu7cNTNw301XUiivCFxwkcunN23xTKAXKIkTyTMnnnlS5+MXmOguNTgyLcpYqvxZJ5KRHHQhbkB1B2WnquoGRR8OEOv8SZ7toEoK8rMmQRgh8Ea18oA7LwrcruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYL2Dlt4TbBTnT/juakRIf0jyz3Yh+XInVEk9Yj7yog=;
 b=R4bWHnwl8JpUp/jRAqqkKI1ZRD0OLMwCO/nK/STetmcM4uedaortDOT2zi3GiQKd42In0KJyuOWh6yanPO7HVNmOQ8TuG0flDTruPJFk2kYwltWrJa7wuTRjnFW/UCiGR/WJfHispf9Ks5c2fCuK3bSttXani/a3G5ACQHikQbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
Date: Mon, 22 Nov 2021 14:19:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>,
	<wei.chen@arm.com>, <stefano.stabellini@xilinx.com>,
	<sstabellini@kernel.org>, <jbeulich@suse.com>
CC: <Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8101f58c-a123-483a-6ee9-08d9adc3216d
X-MS-TrafficTypeDiagnostic: SA2PR02MB7577:
X-Microsoft-Antispam-PRVS:
	<SA2PR02MB75776CB9D68B8F6F9E61FA1EB29F9@SA2PR02MB7577.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/NvxwKiby+DwmgaFNQFwyRoBDg+9uua4hJ+itqidG4XJyS6IXKLZhFNsiX7iicR1h+yOASmZiabRJh3VMz1mvlNCm4ttHg6vDHTEj3VFj5TLciMyT5DjwByhsx3cIn0Ui94FjzlqMDdhM8LMzR+FLvTgRk/LbpwBP2wYkY6U9E9FZdWMX9aNOQ8fwdS3rQC68tb7fm0v1lIO01tSZQ1amby5omMu2OJX5+TDzxkxpqhxvm/85J8q7LyAiFJJQAgJDDAvfSrTcmheUCO91FJGslcrYHtHdUX4u9R2S9IuUSucyFvWn1VgHjPHtYi3+tTzv9xgnN52hFQ5tqpkGJJVrg9JUPrsyd2StYPktZZ4Fj731MWM/AbPJNIiy+mRISd4X/c2rS4sjli083suEPrw8YVSQvex2fenFAljwnlD2EqgvUZKzH6xyMI0RcF7XaTeRQu4ej8ebC1vntSwksUsmcPFgpwNY7STFfMJNgXadGp/h17hyf7hbS9GtZtuK1wwW2HgdbU5NTffsq+PWm7+OOemqvscun1xmo6D8ONjezI6kGJsrBmIEVqS+/JfHQFNRXM35Yv87HV+df0l9igu1aIFSubIGuAOY69KSnV3BfwB4+j3rLZ/qy1pDWhNpAD86bIo0QCUG9zyerEDWk62z+0iDTfJ9e+3SfhOIJm/KVLKfRkk+hcatLF4T/T3dg+N6WoDpUQyHgjeJK0qdzNCCvtVybbiPLjbNCRRYSB6cHchYjCy1kSEOqrWVqOuSrXsFEqLGVBrZLRj/71gxQeOzmmCdzQiUgjhLc1rK7nvA2ubITCM2Iu/TZANUVokJvsULcIbmO7iLatpzLE83m48XR9Of6mzdrgw8ErfIuS/d+3S4NX8rg417DQB7Hv6BuNTdn0x3P5SqAJW6KmD5ajlMQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:ErrorRetry;CAT:NONE;SFS:(36840700001)(46966006)(83380400001)(47076005)(4326008)(2906002)(31696002)(9786002)(966005)(356005)(110136005)(316002)(81166007)(8676002)(2616005)(82310400003)(26005)(508600001)(54906003)(336012)(36860700001)(5660300002)(186003)(53546011)(31686004)(70206006)(8936002)(426003)(36756003)(70586007)(50156003)(2101003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:19:43.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8101f58c-a123-483a-6ee9-08d9adc3216d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7577

Hi Julien/Stefano/Wei/Jan,

Many thanks for your review.

As some of the comments were inter-related, I have consolidated my 
response to all the comments below.

On 19/11/2021 17:26, Julien Grall wrote:
> Hi Ayan,
> 
> On 19/11/2021 16:52, Ayan Kumar Halder wrote:
>> At present, post indexing instructions are not emulated by Xen.
> 
> Can you explain in the commit message why this is a problem?

Yes, I will update the message as below :-
Armv8 hardware does not provide the correct syndrome for decoding post 
indexing ldr/str instructions. Thus any post indexing ldr/str 
instruction at EL1 results in a data abort with ISV=0. As a result, Xen 
needs to decode the instruction.

Thus, DomU will be able to read/write to ioreg space with post indexing 
instructions for 32 bit.

> 
>> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
>> result, data abort is triggered.
>>
>> Added the logic to decode ldr/str post indexing instructions.
>> With this, Xen can decode instructions like these:-
>> ldr w2, [x1], #4
>> Thus, domU can read ioreg with post indexing instructions.
> Hmmm.... Don't you also need to update the register x1 after the 
> instruction was emulated?

Yes, this is a mistake. X1 needs to be incremented by 4 after W2 is written.
> 
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>> Note to reviewer:-
>> This patch is based on an issue discussed in
>> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html 
>>
>> "Xen/ARM - Query about a data abort seen while reading GICD registers"
>>
>>
>>   xen/arch/arm/decode.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>>   xen/arch/arm/io.c     | 14 ++++++--
>>   2 files changed, 88 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 792c2e92a7..7b60bedbc5 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,80 @@ bad_thumb2:
>>       return 1;
>>   }
>> +static inline int32_t extract32(uint32_t value, int start, int length)
> 
> Any reason to have start and length signed?

Again a mistake. There is no reason to use signed types here or in the 
other places.
As Jan Beulich has pointed out, I should be using unsigned int as per 
the CODING_STYLE.
> 
>> +{
>> +    int32_t ret;
>> +
>> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
>> +        return -EINVAL;
>> +
>> +    ret = (value >> start) & (~0U >> (32 - length));
> 
> This would be easier to read if you use GENMASK().

I see that GENMASK returns a register mask. In my scenario, I wish to 
compare the offsets 10, 21, 24 and 27 to some fixed value.

So, instead of using GENMASK four times, I can try the following
instr & MASK_for_10_21_24_27 == VALID_for_10_21_24_27 (Wei Chen's 
suggestion)


Also for size, v and opc, I can defined another bitmask to compare with 
VALID_for_32bit_LDR | VALID_for_32bit_STR.

Wei Chen, You had suggested using vreg_regx_extract(). However, I see 
that it is used to extract the complete u64 register value. In this 
case, I wish to compare certain offsets within a 32 bit register to some 
expected values. So, vreg_regx_extract() might not be appropriate and we 
can use the method mentioned before.

> 
>> +
>> +    return ret;
>> +}
>> +
>> +static int decode_64bit_loadstore_postindexing(register_t pc, struct 
>> hsr_dabt *dabt)
>> +{
>> +    uint32_t instr;
>> +    int size;
>> +    int v;
>> +    int opc;
>> +    int rt;
>> +    int imm9;
> 
> Should all those variables need to be signed?

A mistake. I will change them to unsigned int.
> 
>> +
>> +    /* For details on decoding, refer to Armv8 Architecture reference 
>> manual
>> +     * Section - "Load/store register (immediate post-indexed)", Pg 318
> The page number varies between revision of the Armv8 spec. So can you 
> specify which version you used?

Ack. I will mention the version.
> 
>> +    */
> 
> The coding style for comment in Xen is:
> 
> /*
>   * Foo
>   * Bar
>   */
Ack
> 
>> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof 
>> (instr)) )
>> +        return -EFAULT;
>> +
>> +    /* First, let's check for the fixed values */
>> +
>> +    /*  As per the "Encoding table for the Loads and Stores group", 
>> Pg 299
> 
> Same question here about the version.
Ack, I will mention the version.

> 
>> +     * op4 = 1 - Load/store register (immediate post-indexed)
>> +     */
> 
> Coding style.
Ack

> 
>> +    if ( extract32(instr, 10, 2) != 1 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    /* For the following, refer to "Load/store register (immediate 
>> post-indexed)"
>> +     * to get the fixed values at various bit positions.
>> +     */
>> +    if ( extract32(instr, 21, 1) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 24, 2) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 27, 3) != 7 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    size = extract32(instr, 30, 2);
>> +    v = extract32(instr, 26, 1);
>> +    opc = extract32(instr, 22, 1);

Stefano:- Thanks for catching my mistake. opc is 2 bits (bits 22, 23). I 
will fix this.

>> +
>> +    /* At the moment, we support STR(immediate) - 32 bit variant and
>> +     * LDR(immediate) - 32 bit variant only.
>> +     */
> 
> Coding style.
Ack

> 
>> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>>
> 
> The coding style for this should be:
> 
> if ( !(( size == 2 ) && ( ... ) ... ) )
Ack

> 
>   +        goto bad_64bit_loadstore;
>> +
>> +    rt = extract32(instr, 0, 5);
>> +    imm9 = extract32(instr, 12, 9);
>> +
>> +    if ( imm9 < 0 )
>> +        update_dabt(dabt, rt, size, true);
>> +    else
>> +        update_dabt(dabt, rt, size, false);
> 
> This could be simplified with:
> 
> update_dabt(dabt, rt, size, imm9 < 0);
Ack

> 
>> +
>> +    dabt->valid = 1;
>> +
>> +
>> +    return 0;
>> +bad_64bit_loadstore:
>> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
>> +    return 1;
>> +}
>> +
>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>   {
>>       uint16_t instr;
>> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs 
>> *regs, struct hsr_dabt *dabt)
>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>           return decode_thumb(regs->pc, dabt);
>> +    if ( is_64bit_domain(current->domain) )
> 
> You can still run 32-bit code in 64-bit domain. So I think you want to 
> check the SPSR mode.

Do you mean the following check :-
if ( (is_64bit_domain(current->domain) && (!(regs->spsr & PSR_MODE_BIT)) )

> 
>> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
>> +
>>       /* TODO: Handle ARM instruction */
>>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> 
> I think this comment should now be updated to "unhandled 32-bit ...".

Ack
> 
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..49e80358c0 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>           .gpa = gpa,
>>           .dabt = dabt
>>       };
>> +    int rc;
>>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>>           rc = try_fwd_ioserv(regs, v, &info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>       /* All the instructions used on emulated MMIO region should be 
>> valid */
>>       if ( !dabt.valid )
>> -        return IO_ABORT;
>> +    {
>> +        /*
>> +         * Post indexing ldr/str instructions are not emulated by 
>> Xen. So, the
>> +         * ISS is invalid. In such a scenario, we try to manually 
>> decode the
>> +         * instruction from the program counter.
> 
> I am afraid this is wrong. The problem here is the processor didn't 
> provide a valid syndrom for post-indexing ldr/str instructions. So in 
> order to support them, Xen must decode.

Ack
> 
>> +         */
>> +        rc = decode_instruction(regs, &info.dabt);
> 
> I actually expect this to also be useful when forwarding the I/O to 
> device-model. So I would move the decoding earlier in the code and the 
> check of dabt.valid earlier.

You mean I will move decode_instruction() before find_mmio_handler() ?

Stefano > It doesn't look like we are setting dabt->write anywhere.

Ayan > Yes, this is a miss. Depending on the opc, this should be 
upadeted accordingly in decode_64bit_loadstore_postindexing().

Stefano > Also, is info.gpa in try_handle_mmio already updated in the 
pre-index
case? If not, do we need to apply the offset manually here?

Ayan > Sorry, I did not understand you. This patch is only related to 
the post indexing ldr/str issue. Why do we need to check for pre-indexing ?

Stefano > In the post-index case, we need to update the base address in 
the Rn
register?

Ayan > Yes this is a mistake, As Julien pointed out before, the register 
x1 ie Rn needs to the incremented.

Jan > In addition to Julien's comment regarding the function parameters 
- why
is the return type int32_t and not uint32_t? Plus as per ./CODING_STYLE
it really shouldn't be a fixed width type anyway, but e.g. unsigned int.

Ayan > Yes, this is a mistake. I will update int32_t to unsigned int in 
all the places.
However for extract32(), I don't think we need this function. Rather 
Wei's suggestion (ie instr & MASK_for_10_21_24_27 == 
VALID_for_10_21_24_27 ) makes the code simpler and shorter.

- Ayan

> 
>> +        if ( rc )
>> +            return IO_ABORT;
>> +    }
>>       /*
>>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>>
> 
> Cheers,
> 

