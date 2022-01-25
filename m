Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4269C49BDD1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 22:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260564.450276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTFW-0007hP-0Q; Tue, 25 Jan 2022 21:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260564.450276; Tue, 25 Jan 2022 21:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTFV-0007fZ-TV; Tue, 25 Jan 2022 21:21:09 +0000
Received: by outflank-mailman (input) for mailman id 260564;
 Tue, 25 Jan 2022 21:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B39K=SJ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nCTFU-0007fP-HO
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 21:21:08 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b46ca1d6-7e24-11ec-8eb8-a37418f5ba1a;
 Tue, 25 Jan 2022 22:21:07 +0100 (CET)
Received: from SN7PR04CA0238.namprd04.prod.outlook.com (2603:10b6:806:127::33)
 by SJ0PR02MB8483.namprd02.prod.outlook.com (2603:10b6:a03:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 21:21:02 +0000
Received: from SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:127:cafe::1) by SN7PR04CA0238.outlook.office365.com
 (2603:10b6:806:127::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Tue, 25 Jan 2022 21:21:02 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0055.mail.protection.outlook.com (10.97.5.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 21:21:02 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 25 Jan 2022 21:21:00 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 25 Jan 2022 21:21:00 +0000
Received: from [10.71.118.159] (port=56131)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nCTFM-0004zT-0p; Tue, 25 Jan 2022 21:21:00 +0000
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
X-Inumbo-ID: b46ca1d6-7e24-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChgSb4NfgPhqYpiZYvMBjjeQ0o7TDrEdDXzb5yGenkZ0wR8YawSZ6UOzJ/TfxedSlWmMaJeyJ4EunGuZHLpmxTHbOYskoGWeMJ8Rye6ijX0+FB7N/tXMehis9i6u5/w9h419eeCa60PjYxB0tSsU2+QeH3GlW3AtpECod4gP0xoZLSxLfyBxEXxrgLFzWgK1bSdvzc9cZJAHkP9+vl6i8AG1g9YBdn4/AeS/omXX0S8o+XoqjePjjYyuVUHhhX4KLYg+bpVNfguZKNbtWN1oqcMCwV0faOwoVPrS4Hbques07sbagy5rNnAGz8PYOTk+89+ZE9WuaYL/W1ew8OIePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lyvjPoGGiPi/2bBwL6YmCw0FFmV5osqfLeBhomSjAY=;
 b=XiMp098/Cy+LuSBkHfuMbeXcICZ5mcWF1RYnviUeS1PTj//1TlNVAYUp1RA2WTO2vagjQc3mKMxODESVz8+rF388bwTq5QVaO+LA7TiAB+3djIP9jstX1BTKJj0q4CDAPYIbko+lcOJTLzDmI+weN+dcAN7YDDtuyPcYUm9J899HB2aWi+pg8qg2OQt5+6vrtp0hVoLnxIyHmNNqTka91qglFl1+uQSWzImv2qqdGMoZIIr/CzMklDivRet/H8bSoGRLcpJogj7xAgD7z9Onu4YQwVy2AzguB+ib7vWPTcEuCmEipl84yiBv5fRr6R1pBj+54rsqVcRMLyOOLyp37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lyvjPoGGiPi/2bBwL6YmCw0FFmV5osqfLeBhomSjAY=;
 b=j0HkgL2d9DyfnUAEIQunV5xBJV9ZNCKn5zwZKsWEmafQFPk/i7vdt1NuJu9WeFOe+tgs9nJynm8VAtKReF4emdsNmoHQ88Snlf6mlXxQFadegts/Q1dPjyFs3abkHUMxrGaUAXsYEJ9zmCL2d6Q+y49YaYCye2RHfgFOku0z05M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <9adffa0d-8370-939a-1ba1-fba7082d05b0@xilinx.com>
Date: Tue, 25 Jan 2022 21:20:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <jbeulich@suse.com>, <wei.chen@arm.com>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2201211613530.27308@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <alpine.DEB.2.22.394.2201211613530.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3468bd8-6627-4afb-7e0c-08d9e04896ef
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8483:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8483272FC9E58A8FE7E1C947B25F9@SJ0PR02MB8483.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PaKmIpdzQGujimoECfk1wAnwz+5FogwevVtlmm2Proa59iw+iCfMZPXrmwHBMPod0PiSDlWiTWsskT4CdnN9wA1EYOn/WO2xlIiAu6cG8JEVMy6HZ/ixqd9/6+XqvhGW5wVCQWtEBuu3gda+Updu5Y9gLv7767wtDvIxUWvr5DCjkwCPKBAstU/znZ6b3+2WkeZxY8D4n1bpaZiEqpyPJd9WKqq6Vic3rDstqL78A8v2JJFVFxY7zrBjaIGAbb7g25c/5Xzjtks0CiKGRdNUiF67EN5FiyEVS8N7osQhmWqJx+CIeuildGrVApUIS7n8JpNyJtgCCvD3G0lNvu9VRveq9kvL2W37J5uhYlNsiJvonLHH5ZrH7AFMx+H7MVfkC+BmILMfxZ4rDnjRgkWyOwV9AxFSuAJlZVZsBTOJ7XDnjB9Citcu6BcPrA/j3luIB5595e7nUhcmLWCtyzrhxBXbeT1/4QuFs+yrbDytma6stR2ReCTw8hr+A63ZPdnoflvCE4Y4XUfHfHtScX2y5vB60AnuZVCvYn6uxIfGZtq9mr6Y7sJy3ySprOqQIhHYCFdRu9/NuiwithXlLN00YaMMtAZDo8N0fD4ZOk/Dnua0al1o7apPd60/eJDC0E3cu+oSYlaYZNKlrrC1rPrcfNDNgJjwUqMQN97jnzkxXBBkhPxh7eKqoyJfBe/J7MBemo6hkNESChaz2A941u1GnNWB9j7WmTLNjyIs1jRIBcEvnvQT8Ww2iAJwYR2hu29R5R8RnHsEgWQJY9yx4NXbxEGIbJONVaZahrGUf5vHuXlQrLsMnVGA+njsljOorIfjSkEzRu0qasxGz8jNmqlazgy2+iANJcCzDGupQ1QDQjsD5JR68xJ6vl6o0bPD+WJKAjQknc5fboDGGhZOo7j0wr13HHQJdmmo4jlLCpGhWNnKzz8A9K4ZraUhVWiUuM5l
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(30864003)(110136005)(9786002)(186003)(36860700001)(83380400001)(8676002)(31686004)(26005)(8936002)(40460700003)(36756003)(82310400004)(54906003)(5660300002)(426003)(508600001)(70206006)(70586007)(966005)(7636003)(356005)(47076005)(2906002)(31696002)(336012)(4326008)(316002)(53546011)(2616005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:21:02.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3468bd8-6627-4afb-7e0c-08d9e04896ef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8483

Hi Stefano/Andre/All,

Thanks for the feedback.

On 22/01/2022 01:04, Stefano Stabellini wrote:
> On Thu, 20 Jan 2022, Ayan Kumar Halder wrote:
>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>> could use to access MMIO regions.
>>
>> For instance, a baremetal OS can use any of the following instructions, where
>> x1 contains the address of the MMIO region:
>>
>> 1.      ldr     x2,    [x1],    #4
>> 2.      ldr     w2,    [x1],    #-4
>> 3.      ldr     x2,    [x1],    #-8
>> 4.      ldr     w2,    [x1],    #4
>> 5.      ldrh    w2,    [x1],    #8
>> 6.      ldrb    w2,    [x1],    #16
>> 7.      str     x2,    [x1],    #4
>> 8.      str     w2,    [x1],    #-4
>> 9.      strh    w2,    [x1],    #8
>> 10.     strb    w2,    [x1],    #16
>>
>> In the following two instructions, sp contains the address of the MMIO region:-
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
> This is a lot better, thanks!
>
>
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
>>         Refer https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/IC--Instruction-Cache-operation--an-alias-of-SYS-?lang=en#sa_ic_op
>>         So, this patch assumes that the I/D caches are coherent.
>>
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
>>
>> +    /* First, let's check for the fixed values */
>> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
>> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
>> +            " ldr/str post indexing\n");
>> +        goto bad_32bit_loadstore;
>> +    }
> Maybe this is a useless optimization but I would write this using masks
> and bitwise opts:
>
> #define POST_INDX_FIXED_MASK  0x38200c00

Good suggestion. This should be 0x3B200c00

> #define POST_INDX_FIXED_VALUE 0x38000400
>
> if ( (instr->value & POST_INDX_FIXED_MASK) != POST_INDX_FIXED_VALUE )
>      goto bad_32bit_loadstore;

Done in v4.

>
>
>
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
> We should also check that instr != NULL either here or at the beginning
> of decode_loadstore_postindexing

Done at the beginning of decode_loadstore_postindexing()

>
>
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
> register_t val

Done

>
>
>> +    /* handle when rn = SP */
>> +    if ( instr->code.rn == 31 )
>> +    {
>> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
>> +        {
>> +            val = regs->sp_el1;
> I think you need to #ifdef ARM64 the entire function because sp_el1 is
> aarch64 only. Also, it might be better to move post_increment_register
> to decode.c to keep is closer to the other half of the relevant code. I
> don't feel strongly about it though, if other reviewers prefer to keep
> it here, it is only fine by me.

Makes sense as this is a part of the decoding logic. I haved moved this to decode.c as well.

>
>
>> +        }
>> +        else
>> +        {
>> +            BUG();
> BUG is not a good idea in this code path because it might allow a guest
> to cause a hypervisor crash. Instead you could print an error and
> call:
>
>      domain_crash(current->domain);
>
> But I think it would be even better to add a check:
>
> if ( (regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h )
> {
>      goto bad_32bit_loadstore;
> }
>
> in decode_loadstore_postindexing or in decode_instruction so that if get
> here we are sure that we can handle the post-indexing instruction
> completely.

That is a good suggestion. I will move the check to decode_loadstore_postindexing
(). Yes, Xen should not crash because of the guest.

>
>> +        }
>> +    }
>> +    else
>> +    {
>> +        val = get_user_reg(regs, instr->code.rn);
>> +    }
>> +    val += instr->code.imm9;
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
> Is this check still necessary given the new info.dabt.valid check above?

Yes, this check is redundant. I will remove this.
I have sent out a v4 patch with all these fixes.
Please review "[XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions"

- Ayan

>
>
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

