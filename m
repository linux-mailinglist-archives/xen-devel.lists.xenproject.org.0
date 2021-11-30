Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6F463DE4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235462.408459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7zC-0005QF-TH; Tue, 30 Nov 2021 18:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235462.408459; Tue, 30 Nov 2021 18:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7zC-0005NI-PC; Tue, 30 Nov 2021 18:36:14 +0000
Received: by outflank-mailman (input) for mailman id 235462;
 Tue, 30 Nov 2021 18:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSNa=QR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1ms7zB-0005NC-59
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:36:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eae::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f44da67-520c-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 19:36:04 +0100 (CET)
Received: from DS7P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::28) by
 BY5PR02MB6210.namprd02.prod.outlook.com (2603:10b6:a03:1fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 18:36:00 +0000
Received: from DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::61) by DS7P222CA0029.outlook.office365.com
 (2603:10b6:8:2e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 18:36:00 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT026.mail.protection.outlook.com (10.13.5.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 18:36:00 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 18:35:58 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 30 Nov 2021 18:35:58 +0000
Received: from [10.71.116.21] (port=48761)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1ms7yw-0001Kt-44; Tue, 30 Nov 2021 18:35:58 +0000
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
X-Inumbo-ID: 5f44da67-520c-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRFO+BBpNfUJYeaYum9qUXJiPaYSVJuiqZcDenWX3nv2XbVVxY4esGWNyJWZNasYUqS+KguuQpe1tGz8t8jK79G+S43AMJVSzjWrHeWPPq5mliX5clW6WvIid1U0HDkm0uPqrd+Dzh/+XpZGd9yde6ax4Br1cp2+9aOYhNIu5yyLBNN8h0PmXXFk24e15+vKLJnyIllcTZp1x0d9FcLfYckQ8zeg0CtITYGvPhtEQvVfYBsNqdMW+f1MGiQLQhdUPn80M1ct1tyynVtBDbwqRSeQxqeF43qWIxPoVfNP5nmVuRDvq7e3jYtJKDsUazxYCd0BJ+8kGKPlJuMqhCBKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liMsyiSFST6cp916Z8BZ0rXhjtoZX7r/6tRfCYQtd3g=;
 b=Ei7Lka5shTiKhj2GVscggPJpsD1TFB2vO/V4yWfjTsAa6hpPUT5FPDKhmlzI7xFhUtUFC21GRbBpn4m8O7ANDVz2LK9chy4b5mwGdwH0Y75Q/UqslDwm/N4MDr3T0TTriPts1Mkb1C5FiQQhWqhnBwohwMo+OOPI2EF/hceVmcO9kfuO9PgKGnN/yqiL7lKReiToP+RVqVh1343aLUT05hqOfjZm6aYEryW44TYsShynZxzsbN5aouc7NAsu1x08+BK+wRyDVgDV0BErk4KVRNz0VvO10BfZZ3kNdVTrSwMqo0eFWsqOZdjUKNSiJ08iLU3TQsWhCOOrnMmOYd4p8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=suse.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liMsyiSFST6cp916Z8BZ0rXhjtoZX7r/6tRfCYQtd3g=;
 b=bnoVLSX8e1J+zshc3ss/3w2p3miOA5XRSh+SUU/oKVO+wWyGXEqCtmAwbgjhM4+qIhOebetZQdCGJyUJ9xhHbrC0NZkXjT/17H8j927CGd+ByGFfh9zJJxlo+v1u5uruHKr8/6/umhrfUBd+F1aLD0j+SfyXMw5axrpA2qnVjBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <cb6d5e10-c37f-58a6-e1be-7dd326e2d826@xilinx.com>
Date: Tue, 30 Nov 2021 18:35:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <xen-devel@lists.xenproject.org>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <7224343c-0af9-6610-a58b-291778183a53@suse.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <7224343c-0af9-6610-a58b-291778183a53@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1fcee09-741b-4210-6f12-08d9b43041d7
X-MS-TrafficTypeDiagnostic: BY5PR02MB6210:
X-Microsoft-Antispam-PRVS:
	<BY5PR02MB6210C58A7E32DAB01E0B7F92B2679@BY5PR02MB6210.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s7irKKo4kqZjzQjgm5oGdpgGA2JiN2K3Btz5O9fQJ+FFItnwhnU40y0DYUGRyqgYSQZ6fqgOb07enShVRpMeSoZiMY/PNxp7GaCBcuF+/134uchV4i1GDeuWZU6TfKAHP6QVIjG6fr0xUCqnBbnMuUOaLqLjnEJT8UFgJclbNojhNI1Pl8dKEIgt2m9VTwFox72om52UD3urW55/Wr5HHsVslvoqDe+KPt1rKvNiNJRqSZYOQSBgM4ZJ4BA2fi6e2P/D2TDHTMFU6VUgz1988489NCrKvsifduTGIXIXMuHxOypearVfmRUDB/VJnF9hpqjMypgS5Bw9BbPa92fqNxympJjRMGdayIU5lmgQWvQpzsxEMnLcr/q279l0exghEC9oRLSJVYsycvqWMMJIpZbWe8ayQL+EOsCCBXpeIDpBLgsWSwcND82JgI9uJwlyPkyw2ZH2mO51ZdJgJ5WeppwlTcd/Gd/DsNcQlOOw1xARbdiyIAnCpu6Zr/IqXiDc4cHBFpCWJcX//8d9/NKijgsu97t3NfiN3ujgN6AFIsytSFScktXCJrVeBUozjxrbLhFuFVEiphYtmX3CSG5ryHQgnZJL5V9Lc1lwKzwtYYrpEAwJ7ShzWXarhSDXcu1EqyK74zCOLFCeu5B/jtXwrwFz1vs+A/LatyGwpH9ZwEGJaIneXCXOuMGkOjnZNLPkF8yfMB3C1ZeBIo4AikyqA4JLHtzV+G9MQZvoc5zh4Cgk0dVJWzgX9GPyFDZhSvVLgg4jEXojefvhH+7dhTIK4TeIF3PYeioiZyAiPDZOaUoJQbH25sHnV+ScyJPuuBcG3zZLZTZNJDhQ//LBkQL0RK9FNOpi3o615gTDLvlCo/o=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36860700001)(9786002)(2616005)(336012)(426003)(4326008)(36756003)(8936002)(31686004)(508600001)(966005)(8676002)(5660300002)(2906002)(31696002)(53546011)(47076005)(26005)(54906003)(83380400001)(7636003)(70586007)(110136005)(356005)(186003)(82310400004)(316002)(70206006)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 18:36:00.3384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fcee09-741b-4210-6f12-08d9b43041d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6210

Hi Jan,

Thanks a lot for the feedback.
I need a clarification.

On 30/11/2021 07:57, Jan Beulich wrote:
> On 29.11.2021 20:16, Ayan Kumar Halder wrote:
>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>> could use to access MMIO regions.
>>
>> For instance, Xilinx baremetal OS will use:
>>
>>          volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>          *LocalAddr = Value;
>>
>> This leave the compiler to decide which store instructions to use. This
>> may be a post-index store instruction where the HW will not provide a
>> valid syndrome.
>>
>> In order to handle post-indexing store/load instructions, Xen will need
>> to fetch and decode the instruction.
>>
>> This patch only cover post-index store/load instructions from AArch64 mode.
>> For now, this is left unimplemented for trap from AArch32 mode.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> 
> Just a couple of general remarks, with no judgement towards its use
> in the codebase, and leaving out several obvious style issues.
> 
>> Changelog :-
>>
>> v2 :- 1. Updated the rn register after reading from it. (Pointed by Julien,
>>   Stefano)
>> 2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>> 3. Fixed coding style issues (Pointed by Julien)
>> 4. In the previous patch, I was updating dabt->sign based on the signedness of
>> imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b, Page 3221,
>> SSE indicates the signedness of the data item loaded. In our case, the data item
>> loaded is always unsigned.
>>
>> This has been tested for the following cases :-
>> ldr x2, [x1], #4
> 
> DYM "ldr w2, [x1], #4" or "ldr x2, [x1], #8" here?
Yes, you are correct.
It is "ldr w2, [x1], #4"

> 
>> ldr w2, [x1], #-4
>>
>> str x2, [x1], #4
> 
> Similar aspect here.
"str w2, [x1], #4"

> 
>> str w2, [x1], #-4
>>
>> The reason being  I am testing on 32bit MMIO registers only. I don't see a 8bit
>> or 16bit MMIO register.
> 
> As per this, perhaps the former of the two.
> 
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,66 @@ bad_thumb2:
>>       return 1;
>>   }
>>   
>> +static int decode_32bit_loadstore_postindexing(register_t pc,
>> +                                               struct hsr_dabt *dabt,
>> +                                               union ldr_str_instr_class *instr)
>> +{
>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
>> +        return -EFAULT;
>> +
>> +    /* First, let's check for the fixed values */
>> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
>> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
>> +            " ldr/str post indexing\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    if ( instr->code.size != 2 )
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "ldr/str post indexing is supported for 32 bit variant only\n");
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
>> +bad_32bit_loadstore:
> 
> Please indent labels by at least a blank. I also think this would
> benefit from a preceding blank line.
Ack

> 
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -65,6 +65,16 @@ static enum io_state handle_write(const struct mmio_handler *handler,
>>       return ret ? IO_HANDLED : IO_ABORT;
>>   }
>>   
>> +static void post_incremenet_register(union ldr_str_instr_class *instr)
> 
> I think you mean post_increment_register()?
Ack. Sorry for my carelessness. :(

> 
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    unsigned int val;
>> +
>> +    val = get_user_reg(regs, instr->code.rn);
>> +    val += instr->code.imm9;
>> +    set_user_reg(regs, instr->code.rn, val);
> 
> I don't think this handles the SP case correctly, and I also don't see
> that case getting rejected elsewhere.

Sorry, I did not understand you. Can you explain a bit more ?

Following 
https://www.keil.com/support/man/docs/armasm/armasm_dom1361289873425.htm 
, Are you saying that we need to handle this restriction
"You can use SP for Rt in non-word instructions in ARM code but this is 
deprecated in ARMv6T2 and above"


> 
>> --- a/xen/include/asm-arm/hsr.h
>> +++ b/xen/include/asm-arm/hsr.h
>> @@ -15,6 +15,32 @@ enum dabt_size {
>>       DABT_DOUBLE_WORD = 3,
>>   };
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
>> +        int imm9:9;            /* imm9 */
> 
> Plain int bitfields are, iirc, signed or unsigned at the compiler's
> discretion. Hence I think you mean explicitly "signed int" here.
> 
>> +        unsigned int fixed2:1; /* value == 0b */
>> +        unsigned int opc:2;    /* opc */
>> +        unsigned int fixed3:2; /* value == 00b */
>> +        unsigned int v:1;      /* vector */
>> +        unsigned int fixed4:3; /* value == 111b */
>> +        unsigned int size:2;   /* size */
>> +    } code;
>> +};
> 
> I'd recommend types needed in just one CU to live there, rather than
> getting exposed to every source file including this header (even more
> so when - aiui - this is entirely unrelated to HSR). When used in
> just a single function, it might even want to live here (i.e. as
> close as possible to the [only] use).

Ack. I will try to use bitmask as Andre suggested.

- Ayan
> 
> Jan
> 

