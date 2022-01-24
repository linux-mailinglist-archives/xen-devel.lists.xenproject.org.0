Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AE497E7A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 13:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259854.448557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBy8X-0004rU-OR; Mon, 24 Jan 2022 12:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259854.448557; Mon, 24 Jan 2022 12:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBy8X-0004oT-LF; Mon, 24 Jan 2022 12:07:53 +0000
Received: by outflank-mailman (input) for mailman id 259854;
 Mon, 24 Jan 2022 12:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9bCX=SI=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nBy8U-0004oN-Un
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 12:07:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e03f395-7d0e-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 13:07:49 +0100 (CET)
Received: from BN1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:408:e2::23)
 by SA0PR02MB7484.namprd02.prod.outlook.com (2603:10b6:806:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Mon, 24 Jan
 2022 12:07:44 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::f2) by BN1PR13CA0018.outlook.office365.com
 (2603:10b6:408:e2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.14 via Frontend
 Transport; Mon, 24 Jan 2022 12:07:44 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Mon, 24 Jan 2022 12:07:44 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 24 Jan 2022 12:07:43 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 24 Jan 2022 12:07:42 +0000
Received: from [10.71.118.129] (port=7329)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nBy8M-0005Vz-Qb; Mon, 24 Jan 2022 12:07:42 +0000
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
X-Inumbo-ID: 3e03f395-7d0e-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpnPrlGm37lfQrlv/7vHjw7+LzXv0RgDiJ00MBn3jYPV54ZiZkHsuojqH2NfkEZC0OvQYqAs1+kUFTNmKXM5m7XSxEpwCuWMj6eZpoUmutarFGFRLkDinFsliKV3yiXzflx9K2hTiJJsI/DTnxTzPsoUuw9jX3zwlR0v1oCXXikrOJnhLtNxQheumI5+dxvPYCcBkGKw+KtFKIkmXvAFPkPt6w4U7x9PgQNXszCS7uOm8NZpQ4vxfGGBiujbzHyZEmwMat2EjcgvqzCMupQv/boKEEey9mCMnsKAUzERtPIrLfdVMwY6mjMsr0or2C6aR0nVR+7weOZYXUujDUzBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DgWwIV/8oGFVuqKn4vHhFLJIEwBLNV98jsdtemweOM=;
 b=S0MAHhB8UfzLTGG1LhjvEfs+jsbNGozfYtQhOKYG9tx85Fin7yG7WOoO7FUlVjlrfxwbbaJf77usoifqjKWtnWjYAjlzRwzIGjqJpQwy+uhikn6qgTw3v8TvcOU7XHbd2Y0SR/lPvxNHUzKsndS92zGFZFy3Hup0xNSXmByMMBAZnh+06WV6tV1z9UXz8WafW4Rx0EnY7wDhHB3GaA3QGpx+Qk9OGr7AfvPZAKG+uUtqX4vFAvLpZTdWyfEI0tmTH3VLe99yBaO+6Q6D9CdPJB0ElNqPDs5zt3nkmb40pS32qt+LMu2eVQxrKTAS/4UQf1h+A5ZZFgY/ZhLGWbD4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DgWwIV/8oGFVuqKn4vHhFLJIEwBLNV98jsdtemweOM=;
 b=PyGbxBgqgUi1obZEMFh+sQNE7QUtR6d3g4fWeMtkDJ/tmiz3pkVik+ov24fyxE15C/vLP6G5RaduOWHbYBDBdoQSkee39cT79nuuJxFmdbw2BUk06Pdran9NogQXGUO+wO9dg5i5XEqcg4l6RKNA3g8HhDbnknc8hBgooOuNDYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
Date: Mon, 24 Jan 2022 12:07:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Andre Przywara <andre.przywara@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
	<bertrand.marquis@arm.com>, <jbeulich@suse.com>, <wei.chen@arm.com>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <20220122013046.6a786d3f@slackpad.fritz.box>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220122013046.6a786d3f@slackpad.fritz.box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 614d2146-fdc8-4e70-3445-08d9df3220f0
X-MS-TrafficTypeDiagnostic: SA0PR02MB7484:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR02MB748459DAFB70233CF73D1312B25E9@SA0PR02MB7484.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p5TZV5RfSmukRmvHtQvsSdyF+eRdN6WhiMrxk/B3ByJvHR00yypTSKL9bhLp+vYt02kl1j+Pj7c8tSMj+W4GhvkjZXkqgXms+Kj6GDcEBAU6VflzD0zI8X+WLT0Pn5f3/1n9myGvBcrvNjvlvMRf294zQ9HSbjJJ6oqy0lfahZeNMPgTnyAkuDEubOQSPSPOQ8h+6j8mlzRvQ3eaTF3ewYxGsBdf2KO2glQRFBH8zVVlcHZfXgTLTxsGeN7V43mdZPU0Q8FPJlynw8gI8InLQOre5RuWrrDel+LzSBlu9IJm7YwVtXbY4DLzS3YuKQs3cBgoVlhZRjpkudGVs5l1dl11qJqLomXmB29BMWLSHU+u6w6yJuUu2cQFGIgEcIN3/nrj7dskkCC1nDo6AjZNkAJlZWY2kajAM/jKwK5Mx06hxsONtjWVZHu73oKy1ubFZ2n3F0kPe6ZZGWwy1K1kwUAzEP9wJlHv1Pf7WK5dP/9gB7ZT/uhnOtM6TMsZOZI6USq2T+KVb3AQ0XUwruuHszwF5xCo2KCqjjglVGAyAs1apju1jv8mIppbHNGzl5nHwhK/r1mD/V1h7mWsMPcsFEV1VDFGgqFaRD4VCVKggTnaaOz5KGpDuk/KzLn8siZ4G2Ug/YcBXw/WDOn7+HcK1JdAULkQAXq9YB76S0opT0e0xDyfROf9Av6SR+c0CAygLv0DnTYghFQN9R4dsraxCN7cJIcYP9pi1sfg/olD7JYcil4LDwKESaPxiw4MKTzlANw2o78ZRjMGqEhZbbyKauSMAlMkxlo3w9UvA0YU1fPc32WtD1sLWdZUxwg6NujSpyU1gholnaGqjdW9UDc7qIFlme1cInCOJzW3wgqjoIZ/YIRJChVV6pC3jBx+cdMP
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(31696002)(5660300002)(30864003)(316002)(356005)(7636003)(508600001)(36860700001)(8936002)(2616005)(31686004)(47076005)(2906002)(426003)(336012)(70586007)(26005)(9786002)(82310400004)(4326008)(36756003)(966005)(83380400001)(110136005)(8676002)(53546011)(54906003)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 12:07:44.1888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614d2146-fdc8-4e70-3445-08d9df3220f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7484

Hi Andre,

Many thanks for your feedback. I have one clarification :-

On 22/01/2022 01:30, Andre Przywara wrote:
> On Thu, 20 Jan 2022 21:55:27 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>
> Hi,
>
>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>> could use to access MMIO regions.
>>
>> For instance, a baremetal OS can use any of the following instructions, where
>> x1 contains the address of the MMIO region:
>>
>> 1.      ldr     x2,    [x1],    #4
> That looks dodgy, since is misaligns the pointer afterwards. MMIO
> access typically go to device memory, which must be naturally aligned.
> Just don't give a bad example here and change that to a multiple of 8.
>
>> 2.      ldr     w2,    [x1],    #-4
> (this one is fine, btw, because it's a 32-bit read)
>
>> 3.      ldr     x2,    [x1],    #-8
>> 4.      ldr     w2,    [x1],    #4
>> 5.      ldrh    w2,    [x1],    #8
>> 6.      ldrb    w2,    [x1],    #16
> More naturally I'd use the data size of the postindex value ...
> ldr  x2 ... #-8
> ldr  w2 ... #4
> ldrh w2 ... #2
> ldrb w2 ... #1
>
>> 7.      str     x2,    [x1],    #4
> This is a again problematic, because x1 is not 8-byte aligned anymore
> after that.
>
>> 8.      str     w2,    [x1],    #-4
>> 9.      strh    w2,    [x1],    #8
>> 10.     strb    w2,    [x1],    #16
>>
>> In the following two instructions, sp contains the address of the MMIO region:-
> Really? I don't think you should give people funny ideas, just mention
> that the Rn register could theoretically be the stack pointer.
>
>> 11.     ldrb    w2,    [sp],    #16
>> 12.     ldrb    wzr,   [sp],    #16
>>
>> In order to handle post-indexing store/load instructions (like those mentioned
>> above), Xen will need to fetch and decode the instruction.
>>
>> This patch only cover post-index store/load instructions from AArch64 mode.
>> For now, this is left unimplemented for trap from AArch32 mode.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Changelog :-
>> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>>          Stefano)
>>       2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>>       3. Fixed coding style issues (Pointed by Julien)
>>       4. In the previous patch, I was updating dabt->sign based on the signedness
>>          of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>>          Page 3221, SSE indicates the signedness of the data item loaded. In our
>>          case, the data item loaded is always unsigned.
>>
>> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>>         Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>>         Andre)
>>      2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>>      3. Added restriction for "rt != rn" (Suggested by Andre)
>>      4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>>         by io.c and decode.c (where the union is referred). (Suggested by Jan)
>>      5. Indentation and typo fixes (Suggested by Jan)
>>
>> Changes suggested but could not be considered due to reasons :-
>>      1. Using accessor macros instead of bitfields for "ldr_str_instr_class". (Andre)
>>         Reason - I could not find a simple way to represent 9 bit signed integer
>>         (ie imm9) without using bitfields. If I use accessor macros, then I need
>>         to manually calculate two's complement to obtain the value when signed
>>         bit is present.
>>
>>      2. I/D cache cohenerncy (Andre)
>>         Reason :- I could not see any instruction to flush the I cache.
> First, please try to avoid the term "flush", because it is somewhat
> overloaded. The architecture speaks of "clean" and "invalidate", which
> are more precise.
> Assuming you mean "clean" here: conceptually there is no such thing for
> the I cache, because it's always clean. The I$ will only be read from
> the CPU side - from the instruction fetcher - there is nothing written
> back through it. Every store goes through the data path - always.
> That is the problem that I tried to sketch you previously: you don't
> have a guarantee that the instruction you read from memory is the same
> that the CPU executed. The guest could have changed the instruction
> after the I$ fetched that. So the CPU will execute (and trap) on
> instruction X, but you will read Y. I leave it up to your imagination
> if that could be exploited.

I see what you mean.

Refer Armv8 Arm DDI 0487G.b Page D1-2476, it says that (for instr/data 
abort) the faulting virtual address and IPA is saved in FAR_ELx and 
HPFAR_EL2 respectively. But, I do not see if the faulting instruction is 
saved in any special register. Is there something I am missing ?

Else, :( this is a limitation of the architecture (imo). A hypervisor 
can be interested to see which instruction caused the abort when ISV = 0.

Also, if an instruction is being modified by the guest (after it has 
been loaded in the I cache), and if the guest does not invalidate the I 
cache + ISB, then this is a malicious behavior by the guest. Is my 
understanding correct ?

- Ayan

>
>>         Refer https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/IC--Instruction-Cache-operation--an-alias-of-SYS-?lang=en#sa_ic_op
>>         So, this patch assumes that the I/D caches are coherent.
> Bold. ;-)
>
> Cheers,
> Andre
>
>>   xen/arch/arm/decode.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
>>   xen/arch/arm/decode.h | 29 +++++++++++++++-
>>   xen/arch/arm/io.c     | 66 ++++++++++++++++++++++++++++++++----
>>   3 files changed, 165 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 792c2e92a7..f1c59ddd1a 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,76 @@ bad_thumb2:
>>       return 1;
>>   }
>>   
>> +static int decode_loadstore_postindexing(register_t pc,
>> +                                         struct hsr_dabt *dabt,
>> +                                         union ldr_str_instr_class *instr)
>> +{
>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
>> +        return -EFAULT;
>> +
>> +    /*
>> +     * Rn -ne Rt for ldr/str instruction.
>> +     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
>> +     * (Register restrictions)
>> +     *
>> +     * The only exception for this is when rn = 31. It denotes SP ("Use of SP")
>> +     *
>> +     * And when rt = 31, it denotes wzr/xzr. (Refer
>> +     * https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers
>> +     * "There is no register called X31 or W31. Many instructions are encoded
>> +     * such that the number 31 represents the zero register, ZR (WZR/XZR)."
>> +     */
>> +    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
>> +        return -EINVAL;
>> +
>> +    /* First, let's check for the fixed values */
>> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
>> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
>> +            " ldr/str post indexing\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    if ( instr->code.v != 0 )
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "ldr/str post indexing for vector types are not supported\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    /* Check for STR (immediate) - 32 bit variant */
>> +    if ( instr->code.opc == 0 )
>> +    {
>> +        dabt->write = 1;
>> +    }
>> +    /* Check for LDR (immediate) - 32 bit variant */
>> +    else if ( instr->code.opc == 1 )
>> +    {
>> +        dabt->write = 0;
>> +    }
>> +    else
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "Decoding ldr/str post indexing is not supported for this variant\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    gprintk(XENLOG_INFO,
>> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
>> +        instr->code.rt, instr->code.size, instr->code.imm9);
>> +
>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
>> +    dabt->valid = 1;
>> +
>> +    return 0;
>> +
>> + bad_32bit_loadstore:
>> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
>> +    return 1;
>> +}
>> +
>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>   {
>>       uint16_t instr;
>> @@ -150,11 +220,17 @@ bad_thumb:
>>       return 1;
>>   }
>>   
>> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr)
>>   {
>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>           return decode_thumb(regs->pc, dabt);
>>   
>> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
>> +    {
>> +        return decode_loadstore_postindexing(regs->pc, dabt, instr);
>> +    }
>> +
>>       /* TODO: Handle ARM instruction */
>>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>   
>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>> index 4613763bdb..5c918c9bed 100644
>> --- a/xen/arch/arm/decode.h
>> +++ b/xen/arch/arm/decode.h
>> @@ -23,6 +23,32 @@
>>   #include <asm/regs.h>
>>   #include <asm/processor.h>
>>   
>> +/*
>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>> + * Page 318 specifies the following bit pattern for
>> + * "load/store register (immediate post-indexed)".
>> + *
>> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
>> + * ___________________________________________________________________
>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>> + */
>> +union ldr_str_instr_class {
>> +    uint32_t value;
>> +    struct ldr_str {
>> +        unsigned int rt:5;     /* Rt register */
>> +        unsigned int rn:5;     /* Rn register */
>> +        unsigned int fixed1:2; /* value == 01b */
>> +        signed int imm9:9;            /* imm9 */
>> +        unsigned int fixed2:1; /* value == 0b */
>> +        unsigned int opc:2;    /* opc */
>> +        unsigned int fixed3:2; /* value == 00b */
>> +        unsigned int v:1;      /* vector */
>> +        unsigned int fixed4:3; /* value == 111b */
>> +        unsigned int size:2;   /* size */
>> +    } code;
>> +};
>> +
>>   /**
>>    * Decode an instruction from pc
>>    * /!\ This function is not intended to fully decode an instruction. It
>> @@ -35,7 +61,8 @@
>>    */
>>   
>>   int decode_instruction(const struct cpu_user_regs *regs,
>> -                       struct hsr_dabt *dabt);
>> +                       struct hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr);
>>   
>>   #endif /* __ARCH_ARM_DECODE_H_ */
>>   
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..acb483f235 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -65,6 +65,39 @@ static enum io_state handle_write(const struct mmio_handler *handler,
>>       return ret ? IO_HANDLED : IO_ABORT;
>>   }
>>   
>> +static void post_increment_register(union ldr_str_instr_class *instr)
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    unsigned int val;
>> +
>> +    /* handle when rn = SP */
>> +    if ( instr->code.rn == 31 )
>> +    {
>> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
>> +        {
>> +            val = regs->sp_el1;
>> +        }
>> +        else
>> +        {
>> +            BUG();
>> +        }
>> +    }
>> +    else
>> +    {
>> +        val = get_user_reg(regs, instr->code.rn);
>> +    }
>> +    val += instr->code.imm9;
>> +
>> +    if ( instr->code.rn == 31 )
>> +    {
>> +        regs->sp_el1 = val;
>> +    }
>> +    else
>> +    {
>> +        set_user_reg(regs, instr->code.rn, val);
>> +    }
>> +}
>> +
>>   /* This function assumes that mmio regions are not overlapped */
>>   static int cmp_mmio_handler(const void *key, const void *elem)
>>   {
>> @@ -106,14 +139,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>           .gpa = gpa,
>>           .dabt = dabt
>>       };
>> +    int rc;
>> +    union ldr_str_instr_class instr = {0};
>>   
>>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>   
>> +    /*
>> +     * Armv8 processor does not provide a valid syndrome for post-indexing
>> +     * ldr/str instructions. So in order to process these instructions,
>> +     * Xen must decode them.
>> +     */
>> +    if ( !info.dabt.valid )
>> +    {
>> +        rc = decode_instruction(regs, &info.dabt, &instr);
>> +        if ( rc )
>> +        {
>> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> +            return IO_ABORT;
>> +        }
>> +    }
>> +
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>>           rc = try_fwd_ioserv(regs, v, &info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>> @@ -122,7 +170,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>       }
>>   
>>       /* All the instructions used on emulated MMIO region should be valid */
>> -    if ( !dabt.valid )
>> +    if ( !info.dabt.valid )
>>           return IO_ABORT;
>>   
>>       /*
>> @@ -134,7 +182,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>       {
>>           int rc;
>>   
>> -        rc = decode_instruction(regs, &info.dabt);
>> +        rc = decode_instruction(regs, &info.dabt, NULL);
>>           if ( rc )
>>           {
>>               gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> @@ -143,9 +191,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>       }
>>   
>>       if ( info.dabt.write )
>> -        return handle_write(handler, v, &info);
>> +        rc = handle_write(handler, v, &info);
>>       else
>> -        return handle_read(handler, v, &info);
>> +        rc = handle_read(handler, v, &info);
>> +
>> +    if ( instr.value != 0 )
>> +    {
>> +        post_increment_register(&instr);
>> +    }
>> +    return rc;
>>   }
>>   
>>   void register_mmio_handler(struct domain *d,

