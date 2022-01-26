Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74949C983
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260860.451025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChIw-0003DN-MI; Wed, 26 Jan 2022 12:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260860.451025; Wed, 26 Jan 2022 12:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChIw-0003Al-JM; Wed, 26 Jan 2022 12:21:38 +0000
Received: by outflank-mailman (input) for mailman id 260860;
 Wed, 26 Jan 2022 12:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MeDS=SK=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nChIu-0003Af-Pi
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:21:37 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e83::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5a44f7-7ea2-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:21:34 +0100 (CET)
Received: from BN9P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::6)
 by DM6PR02MB6457.namprd02.prod.outlook.com (2603:10b6:5:1fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 12:21:29 +0000
Received: from BN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::a6) by BN9P222CA0001.outlook.office365.com
 (2603:10b6:408:10c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 26 Jan 2022 12:21:29 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT008.mail.protection.outlook.com (10.13.2.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 12:21:28 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 26 Jan 2022 12:21:27 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 26 Jan 2022 12:21:27 +0000
Received: from [10.71.117.101] (port=49686)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nChIk-0006vo-Gu; Wed, 26 Jan 2022 12:21:26 +0000
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
X-Inumbo-ID: 7f5a44f7-7ea2-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTQRWfP6FFmbZK2/VgSSOs+AmFyf0L6175wc0V2gXYBuOT+c1pZsnP9u86Zo2gK5D97eQxLBqc+LdYw/la2f3Ld+w94eV4NUlIzmCulroB0zWE0dTL+lJlQRFdIhmrCbNcg2OnFZDcqR3IWNPU0S5uArKEMvCNUJh3Qefmjwrezq6C+OeyZUyeFxqkda/yzgjj+Hx0p9z3Ir1cA7zVPIHwpPDdZpxF0bMi/bJ1B6eoO05RWZZ2s6mzOeqfzHUAJK7itjGnBTMtcySebUuX5YV1IPpvccDl+i1Y3XfU9/9FLGDH7VhNdgy/6ow2lsTZLt92bcKuRV2VBxSvqwhsF48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXUuvTYxWPm4IBtlsgLQZTuvg1lUIFZmPoNNdspbnGM=;
 b=VSiNQuoc3momXIL/8UEjrJ3E9ME4CbAlkCi2Im8HQ5tt6EJyqD2sexNpNHQswrJq+fjD0PewSkoq3bKmqdJp/UQtzOtPLXRgt8ku0qePMvz/YTOW6WMf45Pp3eqslqxAOczDK8bz6na8gR/9r7fOcVKSegY2JYubylBPWH4FtYYelFQMbhaP0fcNwPIhDmgMFidwdFniihvSdlWQh19RUg+zn6GkEo1OpjQiRJ6GDS8mQgPU+BQr/jxeaWei5j/kv4/IoEJL3HhfrV637bXzq1RuLlnfNJemXoVHFUZiDTnHga9iInxchioAmrNZZ6rlK/gngCaOUvgpyqpBMzMCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXUuvTYxWPm4IBtlsgLQZTuvg1lUIFZmPoNNdspbnGM=;
 b=QY5I2hIKX3JL6SchE5tC6B1x1dlMXerUlrwybWtjQoURcvGYLOoscqntDot+YNrLIptkqQuNX1SWRpus+hg3Y56dDm4c5/B3D+gO0l6k6kj+MJugkv9Uua0/uHZCZuZJoYycHZrOoj7BAdFSSEET8QhfJIYreamtgsjcap/GRPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <eebecd4f-1656-7488-b35c-d4778e9788c5@xilinx.com>
Date: Wed, 26 Jan 2022 12:21:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <jbeulich@suse.com>, <wei.chen@arm.com>
References: <20220125211808.23810-1-ayankuma@xilinx.com>
 <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fd0d58-e53e-4cd4-dd46-08d9e0c66151
X-MS-TrafficTypeDiagnostic: DM6PR02MB6457:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB6457B9B81FC44223EB6B195AB2209@DM6PR02MB6457.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0OdPeY1KlpfUp4otHt6/O2kIOJQQOHnd1ANxGhc+6VqlEPNkaTcGkVY30/hJUphM+FO1gdL01A30J+wisMsPNj/oBDw6NUniJIpC175vmu8lgUCb9o6L4YuL6zjMQDvmaPzIrkdVj+o831RHHvFfW65fd/Y2KpLBwXr2OgwSsb+sCamzuinPabhBtgOHisSLlCng4cAxBSInugBIqVPyToxr+3P1JEOqZtzM0lEGe+Aku544vv+oqETJtbGKuxfl6AY3UMlumcDSqy5EqGSdv9fNxRYeB2i+f1wvX1bUGQgGbw4U1bNoOElNpsJGofx2lD1IodySS3Ad9rSd4bdYqHSEQnyiW5m2cDS9nwNcD9RaSvu/UPhyN0qXbVT7uwxzqu39CvT7wJBRLAWNolD2icWNnPaoqZbs5pgk6Pe5lf7mc81BfzJOvoCs34tLX483ac7pNca+6x7lAmc7jcb69itD1AmOQpt/5eHvMYk1JYXvfpXjG6t4sTGNqYCyTpIvXXTayBvBGjLLIRay02m42ctJDRL6HUfFkhNYxFmS5ztTN/6N/VwnLApuFWT1A8yubw1WwwYFdr5irngGM5lzuKVc7Ck5+Jz2ah3Kh34CvrcMGKDmW8PM0ko8a9pGTlglJ+WYE4OxOE0r71ilWdfzUolUe7TJnQR3Oo6q4cbEMfVFV7QT4IRbNL8RZhX4Nh/tAxZyuEd/hA0RRIdrVARiiZ89N3AcJAAOAoktVBlR1X1xfAQa8cTv+yQGCG+3Iz+PEcG0vA3z573oHfeqFhNnwcEMxjg+i+dS93nlkcLu4a0OWc1Et7rtQrKYZ2e5tnyEO4YlgHtBPp+DH5hRmipXRgtfj03z3XQECXtysw3w3+Oj5bbqh4NdZA3z1YACi0gzd0SkaiIzZU82Fu2DgeLQtRvpWBreJwdXFnQzWRPhFnxP+JNAufZ8786wTCF3jQBO
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(8676002)(36756003)(356005)(83380400001)(2906002)(40460700003)(82310400004)(30864003)(31686004)(4326008)(186003)(5660300002)(47076005)(36860700001)(70586007)(336012)(70206006)(31696002)(426003)(508600001)(966005)(9786002)(110136005)(53546011)(316002)(54906003)(2616005)(26005)(7636003)(8936002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:21:28.8818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fd0d58-e53e-4cd4-dd46-08d9e0c66151
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6457

Hi Julien/Stefano,

Thanks for your feedback. The comments are useful.

I need a couple clarifications and then I can send the pre-patch and v5 
(with the fixes suggested).


On 25/01/2022 23:02, Julien Grall wrote:
> Hi,
>
> On 25/01/2022 21:18, Ayan Kumar Halder wrote:
>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>> could use to access MMIO regions.
>>
>> For instance, a baremetal OS can use any of the following 
>> instructions, where
>> x1 contains the address of the MMIO region:
>>
>> 1.      ldr     x2,    [x1],    #8
>> 2.      ldr     w2,    [x1],    #-4
>> 3.      ldr     x2,    [x1],    #-8
>> 4.      ldr     w2,    [x1],    #4
>> 5.      ldrh    w2,    [x1],    #2
>> 6.      ldrb    w2,    [x1],    #1
>> 7.      str     x2,    [x1],    #8
>> 8.      str     w2,    [x1],    #-4
>> 9.      strh    w2,    [x1],    #2
>> 10.     strb    w2,    [x1],    #1
>>
>> In the following two instructions, Rn could theoretically be stack 
>> pointer which
>> might contain the address of the MMIO region:-
>> 11.     ldrb    w2,    [Rn],    #1
>> 12.     ldrb    wzr,   [Rn],    #1
>>
>> In order to handle post-indexing store/load instructions (like those 
>> mentioned
>> above), Xen will need to fetch and decode the instruction.
>>
>> This patch only cover post-index store/load instructions from AArch64 
>> mode.
>> For now, this is left unimplemented for trap from AArch32 mode.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Changelog :-
>> v2 - 1. Updated the rn register after reading from it. (Pointed by 
>> Julien,
>>          Stefano)
>>       2. Used a union to represent the instruction opcode (Suggestd 
>> by Bertrand)
>>       3. Fixed coding style issues (Pointed by Julien)
>>       4. In the previous patch, I was updating dabt->sign based on 
>> the signedness
>>          of imm9. This was incorrect. As mentioned in ARMv8 ARM DDI 
>> 0487G.b,
>>          Page 3221, SSE indicates the signedness of the data item 
>> loaded. In our
>>          case, the data item loaded is always unsigned.
>>
>> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit 
>> variants).
>>         Thus, I have removed the check for "instr->code.opc == 0" 
>> (Suggested by
>>         Andre)
>>      2. Handled the scenario when rn = SP, rt = XZR (Suggested by 
>> Jan, Andre)
>>      3. Added restriction for "rt != rn" (Suggested by Andre)
>>      4. Moved union ldr_str_instr_class {} to decode.h. This is the 
>> header included
>>         by io.c and decode.c (where the union is referred). 
>> (Suggested by Jan)
>>      5. Indentation and typo fixes (Suggested by Jan)
>>
>> v4- 1. Fixed the patch as per Stefano's comments on v3. They are as 
>> follows :-
>>          1.1 Use macros to determine the fixed values in the 
>> instruction opcode
>>          1.2 Checked if instr != NULL
>>          1.3 Changed some data types and added #define ARM_64 for 
>> AArch64 specific
>>              code
>>          1.4 Moved post_increment_register() to decode.c so that the 
>> decoding
>>              logic is confined to a single file.
>>          1.5 Moved some checks from post_increment_register() to
>>              decode_loadstore_postindexing()
>>          1.6 Removed a duplicate check
>>      2. Updated the commit message as per Andre's comments.
>>      3. Changed the names of a label and some comments. *32bit* was 
>> erroneously
>>         mentioned in a label and comments in 
>> decode_loadstore_postindexing()
>>         although the function handled all variants of ldr/str post 
>> indexing.
>>
>>   xen/arch/arm/decode.c | 124 +++++++++++++++++++++++++++++++++++++++++-
>>   xen/arch/arm/decode.h |  41 +++++++++++++-
>>   xen/arch/arm/io.c     |  41 +++++++++++---
>>   3 files changed, 195 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 792c2e92a7..0c12af7afa 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,101 @@ bad_thumb2:
>>       return 1;
>>   }
>>   +static int decode_loadstore_postindexing(register_t pc,
>
> This is only handling AArch64 instruction. So please add aarch64 (or 
> arm64) in the name.
>
>> + struct hsr_dabt *dabt,
>> +                                         union ldr_str_instr_class 
>> *instr)
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +
>> +    if ( instr == NULL )
>
> Wouldn't it be a programming error? If so, should it be ASSERT(...)?
>
>> +    {
>> +        gprintk(XENLOG_ERR, "instr should not be NULL\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, 
>> sizeof (instr)) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Could not copy the instruction from 
>> PC\n");
>> +        return -EFAULT;
>> +    }
>> +
>> +    /*
>> +     * Rn -ne Rt for ldr/str instruction.
>> +     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
>> +     * (Register restrictions)
>
> I find a bit odd that you are pointing to 3 different spec (Compiler, 
> Cortex-A, Arm Arm). Can we please use only the Arm Arm? It should 
> contain everything we need...
>
>> +     *
>> +     * The only exception for this is when rn = 31. It denotes SP 
>> ("Use of SP")
>> +     *
>> +     * And when rt = 31, it denotes wzr/xzr. (Refer
>> +     * 
>> https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers
>
> Same here.
>
> Also, please avoid URL and use the document reference (e.g. ARM DDI 
> 0487F.c for the Arm Arm) are they are easy to find on google.
>
>> +     * "There is no register called X31 or W31. Many instructions 
>> are encoded
>> +     * such that the number 31 represents the zero register, ZR 
>> (WZR/XZR)."
>> +     */
>> +    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for 
>> r31\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* First, let's check for the fixed values */
>> +    if ( (instr->value & POST_INDEX_FIXED_MASK) != 
>> POST_INDEX_FIXED_VALUE )
>> +    {
>> +        gprintk(XENLOG_ERR, "Cannot decode instruction 
>> 0x%x",instr->value);
>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions 
>> other than"
>> +            " ldr/str post indexing\n");
>
> Please don't split the message. Instead, it should be:
>
> gprintk(XENLOG_ERR,
>         "...");
>
> But I would combine the two messages and simply write:
>
> "Decoding instruction 0x%x is not supported". Not need to say that we 
> support only ldr/str post indexing.
>
>> +        goto bad_loadstore;
>
> I am a bit confused why some of the error path is using error and 
> other goto. Can you clarify it?
Sorry, this is my carelessness. I was thinking to return an error 
(immediately) for issues un-related to decoding (For eg instr == NULL, 
copy_from_guest()). But on re-thinking, it does not sound sane. I will 
use goto for all the errors as it is important to display the error 
message for the user.
>
>> +    }
>> +
>> +    /*
>> +     * Handle when rn = SP
>> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer 
>> register selection"
>> +     * As we are interested in handling exceptions only from EL1 in 
>> AArch64 state,
>> +     * thus M[3:0] == EL1h (Page - C5-480 "When exception taken from 
>> AArch64 state:")
>
> I read the last sentence as "We only support decoding from instruction 
> run at EL1". But I can't find a check guarantee that.
Sorry, the check below does that but is used only for rn == 31. I should 
move ((regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h) ) into a separate 
check of its own.
>
>> +     */
>> +    if ( (instr->code.rn == 31) && ((regs->cpsr & PSR_MODE_MASK) != 
>> PSR_MODE_EL1h) )
>> +    {
>> +        gprintk(XENLOG_ERR, "SP is valid only for EL1h\n");
>> +        goto bad_loadstore;
>> +    }
>> +
>> +    if ( instr->code.v != 0 )
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "ldr/str post indexing for vector types are not 
>> supported\n");
>> +        goto bad_loadstore;
>> +    }
>> +
>> +    /* Check for STR (immediate) */
>> +    if ( instr->code.opc == 0 )
>> +    {
>> +        dabt->write = 1;
>> +    }
>
> Coding style: We don't use {} for single line. In this case, it would 
> also result to have a more readable code.
>
>> +    /* Check for LDR (immediate) */
>> +    else if ( instr->code.opc == 1 )
>> +    {
>> +        dabt->write = 0;
>> +    }
>
> Same.
>
>> +    else
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "Decoding ldr/str post indexing is not supported for 
>> this variant\n");
>
> The indentation looks wrong here.
>
>> +        goto bad_loadstore;
>> +    }
>> +
>> +    gprintk(XENLOG_INFO,
>> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, 
>> instr->code.imm9 = %d\n",
>> +        instr->code.rt, instr->code.size, instr->code.imm9);
>
> The indentation looks wrong here.
>
>> +
>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
>> +    dabt->valid = 1;
>> +
>> +    return 0;
>> +
>> + bad_loadstore:
>> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", 
>> instr->value);
>> +    return 1;
>> +}
>> +
>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>   {
>>       uint16_t instr;
>> @@ -150,17 +245,44 @@ bad_thumb:
>>       return 1;
>>   }
>>   -int decode_instruction(const struct cpu_user_regs *regs, struct 
>> hsr_dabt *dabt)
>> +int decode_instruction(const struct cpu_user_regs *regs, struct 
>> hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr)
>
> I would like to avoid make the assumption that the instr we decode 
> will always be a store/load. So please rename it to something more 
> generic.

A difference of thought. Should we not name it as per the current usage 
? This will avoid any ambiguity. Later, if this gets extended, then it 
can be named more appropriately depending on the usage.

Also, the bit-pattern in "union ldr_str_instr_class" is very much 
specific to ldr/str. So changing the name to something generic seems 
incorrect imo.

>
>>   {
>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>           return decode_thumb(regs->pc, dabt);
>>   +    if ( (is_64bit_domain(current->domain) && 
>> !psr_mode_is_32bit(regs)) )
>
> The first part could be dropped because if psr_mode_is_32bit returns 0 
> then it must mean the domain is 64-bit.
>
>> +    {
>> +        return decode_loadstore_postindexing(regs->pc, dabt, instr);
>> +    }
>
> Coding style: Please drop the {}.
>
>> +
>>       /* TODO: Handle ARM instruction */
>>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>         return 1;
>>   }
>>   +#if CONFIG_ARM_64
>> +void post_increment_register(union ldr_str_instr_class *instr)
>
> instr should not be modified, so please use const. Also, it would be 
> preferrable to pass the regs in parameter. So the none of the decoding 
> code relies on the current regs.
>
> Furthermore, decode.c should only contain code to update the syndrome 
> and in theory Arm could decide to provide an valid syndrome in future 
> revision. So I would move this code in io.c (or maybe traps.c).
@Stefano/Julien - Can we all agree on traps.c ?
>
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    register_t val;
>> +
>> +    /* handle when rn = SP */
>> +    if ( instr->code.rn == 31 )
>> +        val = regs->sp_el1;
>> +    else
>> +        val = get_user_reg(regs, instr->code.rn);
>> +
>> +    val += instr->code.imm9;
>> +
>> +    if ( instr->code.rn == 31 )
>> +        regs->sp_el1 = val;
>> +    else
>> +        set_user_reg(regs, instr->code.rn, val);
>> +}
>> +#endif
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>> index 4613763bdb..511cd4a05f 100644
>> --- a/xen/arch/arm/decode.h
>> +++ b/xen/arch/arm/decode.h
>> @@ -23,6 +23,35 @@
>>   #include <asm/regs.h>
>>   #include <asm/processor.h>
>>   +/*
>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and 
>> Stores
>> + * Page 318 specifies the following bit pattern for
>> + * "load/store register (immediate post-indexed)".
>> + *
>> + * 31 30 29  27 26 25  23   21 20              11   9 4       0
>> + * ___________________________________________________________________
>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn |  Rt   |
>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>> + */
>> +union ldr_str_instr_class {
>> +    uint32_t value;
>> +    struct ldr_str {
>> +        unsigned int rt:5;     /* Rt register */
>> +        unsigned int rn:5;     /* Rn register */
>> +        unsigned int fixed1:2; /* value == 01b */
>> +        signed int imm9:9;            /* imm9 */
>> +        unsigned int fixed2:1; /* value == 0b */
>> +        unsigned int opc:2;    /* opc */
>> +        unsigned int fixed3:2; /* value == 00b */
>> +        unsigned int v:1;      /* vector */
>> +        unsigned int fixed4:3; /* value == 111b */
>> +        unsigned int size:2;   /* size */
>> +    } code;
>> +};
>
> Looking at the code, post_increment_register() only care about 'rn' 
> and 'imm9'. So rather than exposing the full instruction, could we 
> instead provide the strict minimum? I.e something like:
>
> struct
> {
>      enum instr_type; /* Unknown, ldr/str post increment */
>      union
>      {
>          struct
>          {
>            register; /* Register to increment */
>            imm;      /* Immediate to add */
>          } ldr_str;
>      }
>      uint64_t register;
> }
>
>> +
>> +#define POST_INDEX_FIXED_MASK   0x3B200C00
>> +#define POST_INDEX_FIXED_VALUE  0x38000400
>> +
>>   /**
>>    * Decode an instruction from pc
>>    * /!\ This function is not intended to fully decode an 
>> instruction. It
>> @@ -35,8 +64,18 @@
>>    */
>>     int decode_instruction(const struct cpu_user_regs *regs,
>> -                       struct hsr_dabt *dabt);
>> +                       struct hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr);
>>   +/**
>> + * Update the register value for Rn
>> + * /!\ This function is used to update the register value for Rn when a
>
> NIT: I would drop /!\ because this looks more the description of the 
> function rather than a warning.
>
>> + * post indexing ldr/str instruction is decoded.
>> + *
>> + * This function will get:
>> + * - The post indexing ldr/str instruction opcode
>> + */
>> +void post_increment_register(union ldr_str_instr_class *instr);
>>   #endif /* __ARCH_ARM_DECODE_H_ */
>>     /*
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..b9c15e1fe7 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -106,14 +106,29 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>           .gpa = gpa,
>>           .dabt = dabt
>>       };
>> +    int rc;
>> +    union ldr_str_instr_class instr = {0};
>>         ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>   +    /*
>> +     * Armv8 processor does not provide a valid syndrome for 
>> post-indexing
>> +     * ldr/str instructions. So in order to process these instructions,
>> +     * Xen must decode them.
>> +     */
>
> This sort of comments will become stall if we decide to add more 
> decoding. So I would keep the comments in io.c generic (i.e. no 
> mention of load/store).
Yes, I can remove ldr/str from comments
>
>> +    if ( !info.dabt.valid )
>
> I would rather prefer if we keep using dabt.valid here rather than 
> info.dabt.valid. It is shorter and keep consistent with how it was 
> checked before.
>
>> +    {
>> +        rc = decode_instruction(regs, &info.dabt, &instr);
>> +        if ( rc )
>> +        {
>> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> +            return IO_ABORT;
>> +        }
>> +    }
>> +
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>>           rc = try_fwd_ioserv(regs, v, &info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>> @@ -121,10 +136,6 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>           return rc;
>>       }
>>   -    /* All the instructions used on emulated MMIO region should be 
>> valid */
>> -    if ( !dabt.valid )
>> -        return IO_ABORT;
>> -
>
> I think moving if ( !dabt.valid ) earlier should be part of a 
> pre-patch. This would allows us to backport it as we don't want to 
> forward the I/O to an IOREQ server if ISV=0.
I would say that in the pre-patch, we should move "if ( !dabt.valid )" 
before "find_mmio_handler()". The reason being if the intruction was not 
decoded successfully (ie ISV=0), then there is no need to find the mmio 
handler corresponding to the gpa. Please let me know your thoughts and I 
can send the pre-patch.
>
>>       /*
>>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>>        * not have correct HSR Rt value.
>> @@ -134,7 +145,7 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>       {
>>           int rc;
>>   -        rc = decode_instruction(regs, &info.dabt);
>> +        rc = decode_instruction(regs, &info.dabt, NULL);
>
> Could we combine the two decode_instruction()?

Do you mean something like this :-

if ( (!info.dabt.valid ) || (( check_workaround_766422() && (regs->cpsr 
& PSR_THUMB) &&
          dabt.write) )

{

         rc = decode_instruction(regs, &info.dabt, &instr); // We know 
that for PSR_THUMB, instr is ignored.
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
             return IO_ABORT;
         }

}

>
>>           if ( rc )
>>           {
>>               gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> @@ -143,9 +154,21 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>       }
>>         if ( info.dabt.write )
>> -        return handle_write(handler, v, &info);
>> +        rc = handle_write(handler, v, &info);
>>       else
>> -        return handle_read(handler, v, &info);
>> +        rc = handle_read(handler, v, &info);
>> +
>> +#if CONFIG_ARM_64
>
> Rather than using #ifdef here, I prefer if provide a stub for 
> post_increment_register() that contains ASSERT_UNREACHABLE(). So the 
> code in io.c is more arch-agnostic.

So you mean something like this (in traps.c):-

#if CONFIG_ARM_64

void post_increment_register(union ldr_str_instr_class *instr)

{

     // handle the post increment

}

#else

void post_increment_register(union ldr_str_instr_class *instr)

{

     ASSERT_UNREACHABLE();

}

#endif

If so, I am fine with this.

>
>> +    if ( (is_64bit_domain(current->domain) && 
>> !psr_mode_is_32bit(regs)) )
>
> This is a fairly expensive check. Can we avoid it and instead rely on 
> the instruction to be decoded?

yes, as this has already been checked in decode_instruction(), so we can 
just rely on instr.

- Ayan

>
>> +    {
>> +        if ( instr.value != 0 )
>
> I would prefer if we carry a boolean to indicate whether we manually 
> decoded the instruction. The main advantage is one doesn't need to 
> check in the Arm Arm to figure out that the 0x0 will never result to a 
> valid instruction (it is thankfully used for UDF).
>
>> +        {
>> +            post_increment_register(&instr);
>> +        }
>> +    }
>> +#endif
>> +
>> +    return rc;
>>   }
>>     void register_mmio_handler(struct domain *d,
>
> Cheers,
>

