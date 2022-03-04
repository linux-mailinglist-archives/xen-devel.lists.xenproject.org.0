Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4204CD369
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 12:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284190.483386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ66H-00070w-5S; Fri, 04 Mar 2022 11:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284190.483386; Fri, 04 Mar 2022 11:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ66H-0006yr-29; Fri, 04 Mar 2022 11:27:57 +0000
Received: by outflank-mailman (input) for mailman id 284190;
 Fri, 04 Mar 2022 11:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zc/n=TP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nQ66F-0006yl-DL
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 11:27:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208ada2f-9bae-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 12:27:52 +0100 (CET)
Received: from BN6PR1401CA0008.namprd14.prod.outlook.com
 (2603:10b6:405:4b::18) by SN4PR0201MB3408.namprd02.prod.outlook.com
 (2603:10b6:803:50::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 11:27:48 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::3) by BN6PR1401CA0008.outlook.office365.com
 (2603:10b6:405:4b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Fri, 4 Mar 2022 11:27:48 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 11:27:48 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 4 Mar 2022 11:27:47 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 4 Mar 2022 11:27:46 +0000
Received: from [10.71.117.182] (port=31989)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nQ665-0000tn-9l; Fri, 04 Mar 2022 11:27:45 +0000
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
X-Inumbo-ID: 208ada2f-9bae-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alu5ozSd3udqTS/D9JOh5tkyS/i8a3AW5/9bnqr30d0r+o6LL1Yoc1NejuNXH+8cjaWm83hzNyqNuBsyWONEgZ1uWJVfPBUIh4gTVg8MObgWz2KMVpQ4BAPf70TyLGoR1zyru/CYmV8dv+y2jpsjmbri/oX4KuOe1cYxnpL+LqdnxwLCC6evCm/E+adNFjvZaXAgn0AQP37pRCY/j17A/LIkAEZL8WULE+Pig4AN/6pcjiraV2x5/AiDcacrK9bRJSepJI+5UZg2oxzjMxqCbZ7ujS4P0j9ULmaPyZUI1A4nM5s8rkCWnus7cHX7PQFvX14RTmZ0XNZy6gPul4QEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWdXdxJAxpiiBhIaqM4O7szg4GBHjeVO1CWpQUmALUE=;
 b=mweoiOGMF0vqcCtPVcijzZ4iogDi+oMLNjX9EG0gi9kEHZJeia8OlvSwOOYPSeKmYYD2U0gUa8qyWIBjvREXmKuxDaP5JVzNdO2WPuxdTgouj/rOKBCVfaJkdMR7ux1mGYfg4Oa3xwLRYcjLUAFDZw07UzyZKJIoprMoiXwcq2qcs9VlOTRs9aQ7ICMlUCzV9GMigqMepo0YvEdeIM4uNwSVXD7qWdh0gCFCQcmKMQBnpt4u5KK/6Mv5DVot7KooEJRC7v/KwUqNfeAsxK2QfBFoCHlWPZ109huZNtkBC1yfwmHW8SCQ54Wh1sQ5f8JFZyfyQRlSw2duP6ethQ6ntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWdXdxJAxpiiBhIaqM4O7szg4GBHjeVO1CWpQUmALUE=;
 b=nMXZQn94uj7G7bwovP8/J5+VjpRCpRnM+fLWv4tLpjDzhHSVwXDTGPq/NDbGLuSETcNo22RzPjfnxI9hIvdB4Kb/IomfhVrAQcc21pCH9GXchIvLmmyST1OZjjUA4XfIkPn/cqdvITNgxhcDMoHJ/+jFgaO4UZrBZKLsGWTpQGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <e4cb625d-5f2a-7e93-85ad-701e01e95e7f@xilinx.com>
Date: Fri, 4 Mar 2022 11:27:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-3-ayankuma@xilinx.com>
 <d41241f9-de9d-e681-2768-d44531722069@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <d41241f9-de9d-e681-2768-d44531722069@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ac028d4-a60b-4e40-6d53-08d9fdd202d6
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3408:EE_
X-Microsoft-Antispam-PRVS:
	<SN4PR0201MB340822D7F090FBAAA4C81EA6B2059@SN4PR0201MB3408.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EVp48K42o6Hz/GAU3F9kQmnDw2n4PhOYTwP0eM3kkEqlBPDs1uQpTNaxLOntTwXy4JISS2JpQFY4OlVDz+qMxrnrNnSWJlpsXTS7J+6HdMHH9GmH/s9mBMyxZZt1q7IhGMrJijxTsBKwoLb6mrtJM3fUx8kWN3V8/zLn3JjkAOiylcOTnUaefaGw5khUR69OyMl38jW8BnYyx1PpEIu18Q5ddq+s8fRYafNdLj9EVwqblAon9WRorrFR1ClN6ClNRhTopWwknQYjAfxbhxAYhYj3zmxiIKRZQ0yEFkGf1s8cr9W4rExaVuHix0p8b0uBd7ZjrrOmElmS4qC4aDQSF0BCLy9sbqh3eJEIOjcarp1slArecomdG61DyI1PkjrAx2aKyRPbdOw/g38lepv4jdPm+15XnD7fx+Ms0J3EZnsqJd1oS0eoglUY8b8k3p6P/DnnkRIOofdK+dokQ5VNuSqHCeUSXWO4H+3dj0KqGWc4PxuMS8t7xbzgC4/gl3wcKgWT0DbvY35hBpN72Id63pO+Rj6naA7zFMeex53FfSXctGbcu0LHp8w5BbPQ72xbVui6t+4MqThtwz2KwR8m7LLxM0tlKrCysH5AWbPHSOkTszmtFpBSkh2dEJ+/SxT6kEuuUo62iwOlk6LdZJ4aQ5lG5Tk0A9YZvKYHtR4g8gtprDGWJCkIPOXXZ0JGDLYjVoIk5pNaI88uOgy5ctWFmIpO21Ei4v/dh6jGbevf8RjzBFKkMHlOLWdc9u/H9y4NaQAMymGKL3AxQ5c/ZJRpHA==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(508600001)(83380400001)(47076005)(7636003)(356005)(5660300002)(70586007)(2906002)(70206006)(8676002)(31686004)(7416002)(36756003)(4326008)(9786002)(8936002)(26005)(426003)(2616005)(82310400004)(336012)(316002)(54906003)(110136005)(186003)(31696002)(40460700003)(53546011)(50156003)(461764006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:27:48.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac028d4-a60b-4e40-6d53-08d9fdd202d6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3408

Hi Julien,

Many thanks for the feedback.

I have some clarifications.

On 04/03/2022 10:28, Julien Grall wrote:
> Hi Ayan,
>
> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>> +void post_increment_register(const struct instr_details *instr)
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    register_t val = 0;
>> +
>> +    /* Currently, we handle only ldr/str post indexing instructions */
>> +    if ( instr->state != INSTR_LDR_STR_POSTINDEXING )
>> +        return;
>> +
>> +    /*
>> +     * Handle when rn = SP
>> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer 
>> register
>> +     * selection"
>> +     * t = SP_EL0
>> +     * h = SP_ELx
>> +     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 
>> state:")
>> +     */
>> +    if (instr->rn == 31 )
>> +    {
>> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
>> +            val = regs->sp_el1;
>> +        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
>> +                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )
>
> You are using 3 times regs->cpsr & PSR_MODE_MASK. Can you introduce a 
> temporary variable?
>
> Alternatively, a switch could be used here.
Yes, a switch is better. I will address that in v10.
>
> [...]
>
>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>> b/xen/arch/arm/include/asm/mmio.h
>> index 3354d9c635..ef2c57a2d5 100644
>> --- a/xen/arch/arm/include/asm/mmio.h
>> +++ b/xen/arch/arm/include/asm/mmio.h
>> @@ -26,12 +26,24 @@
>>     #define MAX_IO_HANDLER  16
>>   +enum instr_decode_state
>> +{
>> +    INSTR_ERROR,                    /* Error encountered while 
>> decoding instr */
>> +    INSTR_VALID,                    /* ISS is valid, so no need to 
>> decode */
>> +    /*
>> +     * Instruction is decoded successfully. It is a ldr/str post 
>> indexing
>> +     * instruction.
>> +     */
>> +    INSTR_LDR_STR_POSTINDEXING
>
> NIT: Please add ',' even for the last item. This would reduce the diff 
> if we add new one.
Ack (To be addressed in v10)
>
>> +};
>> +
>>   typedef struct
>>   {
>>       struct hsr_dabt dabt;
>>       struct instr_details {
>>           unsigned long rn:5;
>>           signed int imm9:9;
>> +        enum instr_decode_state state;
>>       } dabt_instr;
>>       paddr_t gpa;
>>   } mmio_info_t;
>> @@ -69,14 +81,15 @@ struct vmmio {
>>   };
>>     enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>> -                              const union hsr hsr,
>> -                              paddr_t gpa);
>> +                              mmio_info_t *info);
>>   void register_mmio_handler(struct domain *d,
>>                              const struct mmio_handler_ops *ops,
>>                              paddr_t addr, paddr_t size, void *priv);
>>   int domain_io_init(struct domain *d, int max_count);
>>   void domain_io_free(struct domain *d);
>>   +void try_decode_instruction(const struct cpu_user_regs *regs,
>> +                            mmio_info_t *info);
>>     #endif  /* __ASM_ARM_MMIO_H__ */
>>   diff --git a/xen/arch/arm/include/asm/traps.h 
>> b/xen/arch/arm/include/asm/traps.h
>> index 2ed2b85c6f..95c46ad391 100644
>> --- a/xen/arch/arm/include/asm/traps.h
>> +++ b/xen/arch/arm/include/asm/traps.h
>> @@ -109,6 +109,8 @@ static inline register_t sign_extend(const struct 
>> hsr_dabt dabt, register_t r)
>>       return r;
>>   }
>>   +void post_increment_register(const struct instr_details *instr);
>> +
>>   #endif /* __ASM_ARM_TRAPS__ */
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index fad103bdbd..bea69ffb08 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -102,57 +102,79 @@ static const struct mmio_handler 
>> *find_mmio_handler(struct domain *d,
>>       return handler;
>>   }
>>   +void try_decode_instruction(const struct cpu_user_regs *regs,
>> +                            mmio_info_t *info)
>> +{
>> +    int rc;
>> +
>> +    if ( info->dabt.valid )
>> +    {
>> +        info->dabt_instr.state = INSTR_VALID;
>> +
>> +        /*
>> +         * Erratum 766422: Thumb store translation fault to 
>> Hypervisor may
>> +         * not have correct HSR Rt value.
>> +         */
>> +        if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
>> +             info->dabt.write )
>
> This change is not explained in the commit message. TBH, I think it 
> should be separate but I am not going to request that at v9.
I will leave this as it is then. I will explain in the commit message 
that the logic to infer the type of instruction has been moved from 
try_handle_mmio() to try_decode_instruction() which is called before. 
try_handle_mmio() is solely responsible for handling the mmio operation.
>
>> +        {
>> +            rc = decode_instruction(regs, info);
>> +            if ( rc )
>> +            {
>> +                gprintk(XENLOG_DEBUG, "Unable to decode 
>> instruction\n");
>> +                info->dabt_instr.state = INSTR_ERROR;
>> +        }
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Armv8 processor does not provide a valid syndrome for 
>> decoding some
>> +     * instructions. So in order to process these instructions, Xen 
>> must
>> +     * decode them.
>> +     */
>> +    rc = decode_instruction(regs, info);
>> +    if ( rc )
>> +    {
>> +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
>> +        info->dabt_instr.state = INSTR_ERROR;
>> +    }
>> +}
>> +
>>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>> -                              const union hsr hsr,
>> -                              paddr_t gpa)
>> +                              mmio_info_t *info)
>>   {
>>       struct vcpu *v = current;
>>       const struct mmio_handler *handler = NULL;
>> -    const struct hsr_dabt dabt = hsr.dabt;
>> -    mmio_info_t info = {
>> -        .gpa = gpa,
>> -        .dabt = dabt
>> -    };
>> +    int rc;
>>   -    ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>> +    ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>   -    handler = find_mmio_handler(v->domain, info.gpa);
>> -    if ( !handler )
>> +    if ( !((info->dabt_instr.state == INSTR_VALID) || 
>> (info->dabt_instr.state == INSTR_LDR_STR_POSTINDEXING)) )
>
> This check will become quite large if we decode more class. I would 
> instead set the dabt.valid bit whenever we successfully decoded the 
> instruction and check that if dabt.valid here.

Actually the main reason to introduce INSTR_LDR_STR_POSTINDEXING is to 
distinguish the scenario where the ISS was valid vs when instruction was 
decoded manually.

In the later scenario, one would need to do the post increment of the rn.

It makes sense to me to have a unque 'info->dabt_instr.state' for each 
type of instruction decoded as the post processing will vary. In this 
case, the post processing logic checks that the instruction is 
ldr_str_postindexing.

However your concern that the check will become large is valid. I would 
introduce a function as follows :-

bool check_instr_is_valid(enum instr_decode_state state)

{

     if (state == INSTR_VALID) || (state == INSTR_LDR_STR_POSTINDEXING) 
|| ...)

         return true;

     else

         return false;

}

And then in

enum io_state try_handle_mmio(struct cpu_user_regs *regs, ...)

{

...

     if ( !check_instr_is_valid(info->dabt_instr.state) )

     {

         ASSERT_UNREACHABLE();
         return IO_ABORT;

     }

...

}

Please let me know your thoughts,

>
>>       {
>> -        int rc;
>> +        ASSERT_UNREACHABLE();
>> +        return IO_ABORT;
>> +    }
>
> [...]
>
>> @@ -1982,21 +2030,18 @@ static void do_trap_stage2_abort_guest(struct 
>> cpu_user_regs *regs,
>>               case IO_UNHANDLED:
>>                   /* IO unhandled, try another way to handle it. */
>>                   break;
>> -            }
>>           }
>>             /*
>> -         * First check if the translation fault can be resolved by the
>> -         * P2M subsystem. If that's the case nothing else to do.
>> +         * If the instruction syndrome was invalid, then we already 
>> checked if
>> +         * this was due to a P2M fault. So no point to check again 
>> as the result
>> +         * will be the same.
>>            */
>> -        if ( p2m_resolve_translation_fault(current->domain,
>> -                                           gaddr_to_gfn(gpa)) )
>> -            return;
>> -
>> -        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
>> +        if ( info.dabt.valid && check_p2m(is_data, gpa) )
>
> This check would need to be adjusted to check the instruction state is 
> INSTR_VALID.

Ack (To be addressed in v10).

- Ayan

>
> Cheers,
>

