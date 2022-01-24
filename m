Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE124986C1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 18:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259939.448766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC38D-0002rm-B9; Mon, 24 Jan 2022 17:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259939.448766; Mon, 24 Jan 2022 17:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC38D-0002pe-7P; Mon, 24 Jan 2022 17:27:53 +0000
Received: by outflank-mailman (input) for mailman id 259939;
 Mon, 24 Jan 2022 17:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9bCX=SI=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nC38B-0002pY-SC
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 17:27:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eae::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29c0eac-7d3a-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 18:27:49 +0100 (CET)
Received: from SN1PR12CA0094.namprd12.prod.outlook.com (2603:10b6:802:21::29)
 by BYAPR02MB4919.namprd02.prod.outlook.com (2603:10b6:a03:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Mon, 24 Jan
 2022 17:27:44 +0000
Received: from SN1NAM02FT0040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::5) by SN1PR12CA0094.outlook.office365.com
 (2603:10b6:802:21::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13 via Frontend
 Transport; Mon, 24 Jan 2022 17:27:43 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0040.mail.protection.outlook.com (10.97.5.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Mon, 24 Jan 2022 17:27:43 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 24 Jan 2022 17:27:42 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 24 Jan 2022 17:27:42 +0000
Received: from [10.71.117.234] (port=50848)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nC381-00074o-8G; Mon, 24 Jan 2022 17:27:41 +0000
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
X-Inumbo-ID: f29c0eac-7d3a-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh2MCFETA6aY80GH0/et4bb0k8GeQVELJNlvAPDsbSkeNdq+0JRSdmbWrcjTV+iNV3OJ+qTZX7fU2i4L9v9H7SaTJZxvNkljNFEwgZWbrZi02+RBnpKWyMxkeMj0iIroc8r0dsGWwI/tJyc2tS8dyGNYOcXqkxpgkU76olUnvLonPpB+OyNXAu0SqSK0emf/qAsZddc0niCx0PTzqD5WJ8bTQZSXBv9SwAdm5GlmZQ3J+nuA781/WPwKmJRZ+VEzZgHhursF91mvv96KAE085rDa/fniQErYX6EWOsD2Tc00AWZihryNexx92v50yh5QEMQPSqJig90MFZAlY9grCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL72+Gx3LQfeZ53IXdpz7SbRkZcKsipOK1KzS/A5pzs=;
 b=G5qdoZbHyg3wvUFokUZ9nyPWUyAXRh7i/Fidxem6HDRKjKdnatv57StTWDM0sKkR+xEVi3tWwOqsSD27oBfcOxWfKiL8W49l9YhA7HCZr77kx4+ivKt+Oh1udo9I/4Vmxf+hBUoXE9SQYPiO6r/Vk+lQKyGWIKTmE6HHthzF5k/D3lI+Gc6ptGay1g3J5ENquCbCOp1RMRZcQZT0WmP9QLBflgHDarq5JWtisrjfmW+H7/K7SoTYw7IgU347NBzC6QRf02Y11FiU9xSD0Caq4ZqQuk75PUWsT7GgDRoLU5kE0asWYllDybdVcL1kHAqM6HmEDZ3oMoQA5JwaSyaiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL72+Gx3LQfeZ53IXdpz7SbRkZcKsipOK1KzS/A5pzs=;
 b=mGNB0IZRCE5GohQZBSCSRjtSHZm6CTs1NgKiXNw05HSNvamCZlFvJE1lC7a4B0cWQ9imcbJdxtW9PgDAi3xMWomvzH29kWEE3SWk24wD19apDWAg/PR1LQ0wFHdKXRwYTz6pj5vbQVgWivxSVpcRDp0h+uXSDWD5ik2ILQ3stqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <bae9a35f-be42-2ebe-5ce0-30e08001ae97@xilinx.com>
Date: Mon, 24 Jan 2022 17:27:40 +0000
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
 <18e715ae-111d-58e6-55f9-a48a521e99b3@xilinx.com>
 <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220124143601.3e2ac6ac@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31766db1-03c8-4482-f5f0-08d9df5ed4ab
X-MS-TrafficTypeDiagnostic: BYAPR02MB4919:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB49195C3BD6D09DE616EBADBFB25E9@BYAPR02MB4919.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SCeuzluiI1diZFHKSbMck/hJ9Hhr7LcnqQ4wLE4yViyXVGUFtvh4yCwtZ2TA3kOLeatC5/NXFqroBNkx7PLA1yHh6vu0GV+3L+6lwB3OAuLSka8DzhVjwvOT4ALLrUkmHlg6MRLkivv7sEu9kcYzeHP2ltUSE63OE4ZY2sHInLMVORE/guBheoOpgGGSnz7uhwgEKzigpOxWttLxIjng6p3PUNZ1gd4qc55T6wB30kM4Rt2gffsy+k2qhjOzCdk1hKBGvCYJWP9izXGfZ7PSnE9AMYanAoUoFohEc5iDnMSFr3TEbbarO7300D9IseS0NBH5+OTDjJtFlfN0QeLJPYBnu+jXUYTm6/7ZBj8xrExW4BK1BiZfBnIAHMc1fcGswt5udOVQfxFqkyul0/6a0h049SaLK+DLpkZ9//1lxUAC2lyzR7NxFVpaMzengk9TaGIk1fGrUWf8FM3BDdt1IVjvCVOtj+g/PF+4iGNCzNFs8pkfim8eKpgwL+eJxcZNlS2Kzo66fZ6a1NXwe5orqO3jysoJqLhrptWguJxejNBWaXKJ1ldTN1N5U4vIIopDlrHfes2O4wsws7oEqnQqk8Aa7nzYwrYqndDb5JHo/G1wTzvIYIoUPgmSqAPo1e8CZJ3AxeVrxbTWAHPdCmXId28IfjQ6bJJb0tlAZPnIpV0fGLNjJl3bjR1+zwc+HagbzywEy+iT76/oaCPMQE2EJm8sv90y2Mee3GdMibacHEFF3VF18tJyrsT6BPROUYWGMeXpwit9Lm68oH6Ff/j25pOWAUMjGCZtCmO2zky9Y7bNiLJ1QqYOZl2btWH/gHUU0eLpu2zxbEFQwUgNN68BKUl5drtFUaFWmznMm0kJId/Qtlku10o2TZB9i4+vv5sU
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(70206006)(9786002)(30864003)(316002)(356005)(7636003)(31696002)(8936002)(2616005)(426003)(2906002)(26005)(336012)(47076005)(31686004)(70586007)(4326008)(36756003)(966005)(110136005)(186003)(82310400004)(53546011)(8676002)(5660300002)(54906003)(508600001)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:27:43.4782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31766db1-03c8-4482-f5f0-08d9df5ed4ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4919

Hi Andre,

Thanks forn your comments.

On 24/01/2022 14:36, Andre Przywara wrote:
> On Mon, 24 Jan 2022 12:07:42 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>
> Hi Ayan,
>
>> Many thanks for your feedback. I have one clarification :-
>>
>> On 22/01/2022 01:30, Andre Przywara wrote:
>>> On Thu, 20 Jan 2022 21:55:27 +0000
>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>
>>> Hi,
>>>   
>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>> could use to access MMIO regions.
>>>>
>>>> For instance, a baremetal OS can use any of the following instructions, where
>>>> x1 contains the address of the MMIO region:
>>>>
>>>> 1.      ldr     x2,    [x1],    #4
>>> That looks dodgy, since is misaligns the pointer afterwards. MMIO
>>> access typically go to device memory, which must be naturally aligned.
>>> Just don't give a bad example here and change that to a multiple of 8.
>>>   
>>>> 2.      ldr     w2,    [x1],    #-4
>>> (this one is fine, btw, because it's a 32-bit read)
>>>   
>>>> 3.      ldr     x2,    [x1],    #-8
>>>> 4.      ldr     w2,    [x1],    #4
>>>> 5.      ldrh    w2,    [x1],    #8
>>>> 6.      ldrb    w2,    [x1],    #16
>>> More naturally I'd use the data size of the postindex value ...
>>> ldr  x2 ... #-8
>>> ldr  w2 ... #4
>>> ldrh w2 ... #2
>>> ldrb w2 ... #1
>>>   
>>>> 7.      str     x2,    [x1],    #4
>>> This is a again problematic, because x1 is not 8-byte aligned anymore
>>> after that.
>>>   
>>>> 8.      str     w2,    [x1],    #-4
>>>> 9.      strh    w2,    [x1],    #8
>>>> 10.     strb    w2,    [x1],    #16
>>>>
>>>> In the following two instructions, sp contains the address of the MMIO region:-
>>> Really? I don't think you should give people funny ideas, just mention
>>> that the Rn register could theoretically be the stack pointer.
>>>   
>>>> 11.     ldrb    w2,    [sp],    #16
>>>> 12.     ldrb    wzr,   [sp],    #16
>>>>
>>>> In order to handle post-indexing store/load instructions (like those mentioned
>>>> above), Xen will need to fetch and decode the instruction.
>>>>
>>>> This patch only cover post-index store/load instructions from AArch64 mode.
>>>> For now, this is left unimplemented for trap from AArch32 mode.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>>> ---
>>>>
>>>> Changelog :-
>>>> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>>>>           Stefano)
>>>>        2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>>>>        3. Fixed coding style issues (Pointed by Julien)
>>>>        4. In the previous patch, I was updating dabt->sign based on the signedness
>>>>           of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>>>>           Page 3221, SSE indicates the signedness of the data item loaded. In our
>>>>           case, the data item loaded is always unsigned.
>>>>
>>>> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>>>>          Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>>>>          Andre)
>>>>       2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>>>>       3. Added restriction for "rt != rn" (Suggested by Andre)
>>>>       4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>>>>          by io.c and decode.c (where the union is referred). (Suggested by Jan)
>>>>       5. Indentation and typo fixes (Suggested by Jan)
>>>>
>>>> Changes suggested but could not be considered due to reasons :-
>>>>       1. Using accessor macros instead of bitfields for "ldr_str_instr_class". (Andre)
>>>>          Reason - I could not find a simple way to represent 9 bit signed integer
>>>>          (ie imm9) without using bitfields. If I use accessor macros, then I need
>>>>          to manually calculate two's complement to obtain the value when signed
>>>>          bit is present.
>>>>
>>>>       2. I/D cache cohenerncy (Andre)
>>>>          Reason :- I could not see any instruction to flush the I cache.
>>> First, please try to avoid the term "flush", because it is somewhat
>>> overloaded. The architecture speaks of "clean" and "invalidate", which
>>> are more precise.
>>> Assuming you mean "clean" here: conceptually there is no such thing for
>>> the I cache, because it's always clean. The I$ will only be read from
>>> the CPU side - from the instruction fetcher - there is nothing written
>>> back through it. Every store goes through the data path - always.
>>> That is the problem that I tried to sketch you previously: you don't
>>> have a guarantee that the instruction you read from memory is the same
>>> that the CPU executed. The guest could have changed the instruction
>>> after the I$ fetched that. So the CPU will execute (and trap) on
>>> instruction X, but you will read Y. I leave it up to your imagination
>>> if that could be exploited.
>> I see what you mean.
>>
>> Refer Armv8 Arm DDI 0487G.b Page D1-2476, it says that (for instr/data
>> abort) the faulting virtual address and IPA is saved in FAR_ELx and
>> HPFAR_EL2 respectively. But, I do not see if the faulting instruction is
>> saved in any special register. Is there something I am missing ?
> No, indeed there is no such thing. You get the address, but not the
> faulting instruction. It would indeed be nice to have from a software
> developer's point of view, but the architecture does not support it.
> One reason might be that it's potentially hard to implement, because it
> could be tricky to reconstruct the original instruction, when it has been
> broken down to something different in the actual pipelines.

Is it possible for Arm to implement such a register which will hold the 
instruction that caused the exception, in the future architecture 
revision ? This would be useful given that the faulting address (PC) can 
not be trusted to get to the original faulting instruction (as it can be 
changed after being loaded in I cache). I could imagine this being 
useful in any scenario when the user wants to know which instruction 
caused the fault.

Stefano/Julien/Bertrand/Volodymyr :- I would love to hear your inputs on 
this as well.

As for the patch, I will mention this issue (as a comment in the code) 
where we are loading the instruction from PC. 
Stefano/Julien/Bertrand/Volodymyr:- Does it look fine with you ?

- Ayan

>
>> Else, :( this is a limitation of the architecture (imo). A hypervisor
>> can be interested to see which instruction caused the abort when ISV = 0.
> One of the reasons I suggested to just avoid those instructions for MMIO
> in the first place, especially if their usage was somewhat questionable to
> begin with.
>
>> Also, if an instruction is being modified by the guest (after it has
>> been loaded in the I cache), and if the guest does not invalidate the I
>> cache + ISB, then this is a malicious behavior by the guest. Is my
>> understanding correct ?
> I wouldn't say malicious per se, there might be legitimate reasons to do
> so, but in the Xen context this is mostly irrelevant, since we don't trust
> the guest anyway. So whether it's malicious or accidental, the hypervisor
> might be mislead.
>
> Cheers,
> Andre
>
>>>   
>>>>          Refer https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/IC--Instruction-Cache-operation--an-alias-of-SYS-?lang=en#sa_ic_op
>>>>          So, this patch assumes that the I/D caches are coherent.
>>> Bold. ;-)
>>>
>>> Cheers,
>>> Andre
>>>   
>>>>    xen/arch/arm/decode.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
>>>>    xen/arch/arm/decode.h | 29 +++++++++++++++-
>>>>    xen/arch/arm/io.c     | 66 ++++++++++++++++++++++++++++++++----
>>>>    3 files changed, 165 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>>> index 792c2e92a7..f1c59ddd1a 100644
>>>> --- a/xen/arch/arm/decode.c
>>>> +++ b/xen/arch/arm/decode.c
>>>> @@ -84,6 +84,76 @@ bad_thumb2:
>>>>        return 1;
>>>>    }
>>>>    
>>>> +static int decode_loadstore_postindexing(register_t pc,
>>>> +                                         struct hsr_dabt *dabt,
>>>> +                                         union ldr_str_instr_class *instr)
>>>> +{
>>>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
>>>> +        return -EFAULT;
>>>> +
>>>> +    /*
>>>> +     * Rn -ne Rt for ldr/str instruction.
>>>> +     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
>>>> +     * (Register restrictions)
>>>> +     *
>>>> +     * The only exception for this is when rn = 31. It denotes SP ("Use of SP")
>>>> +     *
>>>> +     * And when rt = 31, it denotes wzr/xzr. (Refer
>>>> +     * https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers
>>>> +     * "There is no register called X31 or W31. Many instructions are encoded
>>>> +     * such that the number 31 represents the zero register, ZR (WZR/XZR)."
>>>> +     */
>>>> +    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
>>>> +        return -EINVAL;
>>>> +
>>>> +    /* First, let's check for the fixed values */
>>>> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
>>>> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
>>>> +    {
>>>> +        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
>>>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
>>>> +            " ldr/str post indexing\n");
>>>> +        goto bad_32bit_loadstore;
>>>> +    }
>>>> +
>>>> +    if ( instr->code.v != 0 )
>>>> +    {
>>>> +        gprintk(XENLOG_ERR,
>>>> +            "ldr/str post indexing for vector types are not supported\n");
>>>> +        goto bad_32bit_loadstore;
>>>> +    }
>>>> +
>>>> +    /* Check for STR (immediate) - 32 bit variant */
>>>> +    if ( instr->code.opc == 0 )
>>>> +    {
>>>> +        dabt->write = 1;
>>>> +    }
>>>> +    /* Check for LDR (immediate) - 32 bit variant */
>>>> +    else if ( instr->code.opc == 1 )
>>>> +    {
>>>> +        dabt->write = 0;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        gprintk(XENLOG_ERR,
>>>> +            "Decoding ldr/str post indexing is not supported for this variant\n");
>>>> +        goto bad_32bit_loadstore;
>>>> +    }
>>>> +
>>>> +    gprintk(XENLOG_INFO,
>>>> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
>>>> +        instr->code.rt, instr->code.size, instr->code.imm9);
>>>> +
>>>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
>>>> +    dabt->valid = 1;
>>>> +
>>>> +    return 0;
>>>> +
>>>> + bad_32bit_loadstore:
>>>> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
>>>> +    return 1;
>>>> +}
>>>> +
>>>>    static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>>>    {
>>>>        uint16_t instr;
>>>> @@ -150,11 +220,17 @@ bad_thumb:
>>>>        return 1;
>>>>    }
>>>>    
>>>> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>>>> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
>>>> +                       union ldr_str_instr_class *instr)
>>>>    {
>>>>        if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>>>            return decode_thumb(regs->pc, dabt);
>>>>    
>>>> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
>>>> +    {
>>>> +        return decode_loadstore_postindexing(regs->pc, dabt, instr);
>>>> +    }
>>>> +
>>>>        /* TODO: Handle ARM instruction */
>>>>        gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>>>    
>>>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>>>> index 4613763bdb..5c918c9bed 100644
>>>> --- a/xen/arch/arm/decode.h
>>>> +++ b/xen/arch/arm/decode.h
>>>> @@ -23,6 +23,32 @@
>>>>    #include <asm/regs.h>
>>>>    #include <asm/processor.h>
>>>>    
>>>> +/*
>>>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>>>> + * Page 318 specifies the following bit pattern for
>>>> + * "load/store register (immediate post-indexed)".
>>>> + *
>>>> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
>>>> + * ___________________________________________________________________
>>>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>>>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>>>> + */
>>>> +union ldr_str_instr_class {
>>>> +    uint32_t value;
>>>> +    struct ldr_str {
>>>> +        unsigned int rt:5;     /* Rt register */
>>>> +        unsigned int rn:5;     /* Rn register */
>>>> +        unsigned int fixed1:2; /* value == 01b */
>>>> +        signed int imm9:9;            /* imm9 */
>>>> +        unsigned int fixed2:1; /* value == 0b */
>>>> +        unsigned int opc:2;    /* opc */
>>>> +        unsigned int fixed3:2; /* value == 00b */
>>>> +        unsigned int v:1;      /* vector */
>>>> +        unsigned int fixed4:3; /* value == 111b */
>>>> +        unsigned int size:2;   /* size */
>>>> +    } code;
>>>> +};
>>>> +
>>>>    /**
>>>>     * Decode an instruction from pc
>>>>     * /!\ This function is not intended to fully decode an instruction. It
>>>> @@ -35,7 +61,8 @@
>>>>     */
>>>>    
>>>>    int decode_instruction(const struct cpu_user_regs *regs,
>>>> -                       struct hsr_dabt *dabt);
>>>> +                       struct hsr_dabt *dabt,
>>>> +                       union ldr_str_instr_class *instr);
>>>>    
>>>>    #endif /* __ARCH_ARM_DECODE_H_ */
>>>>    
>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>> index 729287e37c..acb483f235 100644
>>>> --- a/xen/arch/arm/io.c
>>>> +++ b/xen/arch/arm/io.c
>>>> @@ -65,6 +65,39 @@ static enum io_state handle_write(const struct mmio_handler *handler,
>>>>        return ret ? IO_HANDLED : IO_ABORT;
>>>>    }
>>>>    
>>>> +static void post_increment_register(union ldr_str_instr_class *instr)
>>>> +{
>>>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>>>> +    unsigned int val;
>>>> +
>>>> +    /* handle when rn = SP */
>>>> +    if ( instr->code.rn == 31 )
>>>> +    {
>>>> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
>>>> +        {
>>>> +            val = regs->sp_el1;
>>>> +        }
>>>> +        else
>>>> +        {
>>>> +            BUG();
>>>> +        }
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        val = get_user_reg(regs, instr->code.rn);
>>>> +    }
>>>> +    val += instr->code.imm9;
>>>> +
>>>> +    if ( instr->code.rn == 31 )
>>>> +    {
>>>> +        regs->sp_el1 = val;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        set_user_reg(regs, instr->code.rn, val);
>>>> +    }
>>>> +}
>>>> +
>>>>    /* This function assumes that mmio regions are not overlapped */
>>>>    static int cmp_mmio_handler(const void *key, const void *elem)
>>>>    {
>>>> @@ -106,14 +139,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>>>            .gpa = gpa,
>>>>            .dabt = dabt
>>>>        };
>>>> +    int rc;
>>>> +    union ldr_str_instr_class instr = {0};
>>>>    
>>>>        ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>>>    
>>>> +    /*
>>>> +     * Armv8 processor does not provide a valid syndrome for post-indexing
>>>> +     * ldr/str instructions. So in order to process these instructions,
>>>> +     * Xen must decode them.
>>>> +     */
>>>> +    if ( !info.dabt.valid )
>>>> +    {
>>>> +        rc = decode_instruction(regs, &info.dabt, &instr);
>>>> +        if ( rc )
>>>> +        {
>>>> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>>>> +            return IO_ABORT;
>>>> +        }
>>>> +    }
>>>> +
>>>>        handler = find_mmio_handler(v->domain, info.gpa);
>>>>        if ( !handler )
>>>>        {
>>>> -        int rc;
>>>> -
>>>>            rc = try_fwd_ioserv(regs, v, &info);
>>>>            if ( rc == IO_HANDLED )
>>>>                return handle_ioserv(regs, v);
>>>> @@ -122,7 +170,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>>>        }
>>>>    
>>>>        /* All the instructions used on emulated MMIO region should be valid */
>>>> -    if ( !dabt.valid )
>>>> +    if ( !info.dabt.valid )
>>>>            return IO_ABORT;
>>>>    
>>>>        /*
>>>> @@ -134,7 +182,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>>>        {
>>>>            int rc;
>>>>    
>>>> -        rc = decode_instruction(regs, &info.dabt);
>>>> +        rc = decode_instruction(regs, &info.dabt, NULL);
>>>>            if ( rc )
>>>>            {
>>>>                gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>>>> @@ -143,9 +191,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>>>        }
>>>>    
>>>>        if ( info.dabt.write )
>>>> -        return handle_write(handler, v, &info);
>>>> +        rc = handle_write(handler, v, &info);
>>>>        else
>>>> -        return handle_read(handler, v, &info);
>>>> +        rc = handle_read(handler, v, &info);
>>>> +
>>>> +    if ( instr.value != 0 )
>>>> +    {
>>>> +        post_increment_register(&instr);
>>>> +    }
>>>> +    return rc;
>>>>    }
>>>>    
>>>>    void register_mmio_handler(struct domain *d,

