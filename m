Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545184A76F3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 18:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264396.457489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJZw-0007yo-MK; Wed, 02 Feb 2022 17:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264396.457489; Wed, 02 Feb 2022 17:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJZw-0007vY-JE; Wed, 02 Feb 2022 17:38:00 +0000
Received: by outflank-mailman (input) for mailman id 264396;
 Wed, 02 Feb 2022 17:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFJZv-0007vS-G0
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 17:37:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e89::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db7de41e-844e-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 18:37:58 +0100 (CET)
Received: from BN6PR18CA0003.namprd18.prod.outlook.com (2603:10b6:404:121::13)
 by MWHPR02MB3262.namprd02.prod.outlook.com (2603:10b6:301:66::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 17:37:54 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::5f) by BN6PR18CA0003.outlook.office365.com
 (2603:10b6:404:121::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:37:53 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:37:53 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 17:37:51 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 17:37:51 +0000
Received: from [10.71.116.197] (port=62189)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFJZn-0004jd-1M; Wed, 02 Feb 2022 17:37:51 +0000
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
X-Inumbo-ID: db7de41e-844e-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3lnTgVlhKDuKDtLqOVMNhMzCegZaSqazPoGDlbqzE/i/0rCdG7NufNn/M6nUpCqdMosFOD/JWdhCSAD6zCc5a/YvlV1DEit6Rmiv+2KMjxSgoEy0vHbAtM50TgWBB8LKqF62jISZxfD9B5yfvLxr1xT7PMY+VqtXB0kbmxLU8RUwZtiJViU8HSImURcAWGKI06VNj20BM2vLJ8/Mw/3vtLirYHfiG0WZK2fhj8pbOUyVc7fC9ddbAEaG2IuT5wAV6kpsw6KEQnkX6NttFT5o6vNTGPpyxQqmqsIlUZRG41Btt+rrTQab/RuImySNpDUlX4azbgghN4TcAoYjBtKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR6Dld2R5zdgQ6q7r/fIFkr6ym1F5HYIxbrTSkx++dU=;
 b=kkxuFAkZbQPquZ0QAklFj6ijZyChyc+LXi3F5S0FRmg/bNEAr858O8Yk8M7Vd/ai72uwkjRJWsKbarRhYNYMsvO3Dp2FTOIgyA5nfKzdJPhKYgnKN0grcX8X/MG7r4XSO7wdpzDSVdnfSaEvtI/c9EyXufofKX+BCrmjvb478dRVrZXo+AOl1ORutvqPjW4ptJ0sxHADHdiTxAuRu/G1vCIk1q5f8EEengu4zQUAAX4aB+o293LC+hKUIVYJe9TXP3ssjEqNUpb2+VWrmsKiXH/Up279jrPmUfmW1HabuUs3geFE7ZGcsE2cE+LPKhDkJjIWUzMGYoE7mBtjd2ItBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR6Dld2R5zdgQ6q7r/fIFkr6ym1F5HYIxbrTSkx++dU=;
 b=pKyB+nA5QwJfyY4B8H59PihnH8L8aluOg3+T24y9GlC9K0IgO7ujd+WsqCToh4Dwio0EWlu985PFGdwanJ2EvheUiUx9ZPJDDdH+leoNNdzsm7z1pdVvvmzBobXfRS1xs/yuEoz/xJu422Oo9wOYRTdbWNDluCJBpb2zibd9p1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <409713cc-10e0-728f-0498-116292faa8b7@xilinx.com>
Date: Wed, 2 Feb 2022 17:37:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220131193728.2980-1-ayankuma@xilinx.com>
 <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
 <453fa8d1-6d12-ea23-6b35-e556f72fe0cf@xilinx.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <453fa8d1-6d12-ea23-6b35-e556f72fe0cf@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648d3378-5706-48fd-b6d0-08d9e672bda0
X-MS-TrafficTypeDiagnostic: MWHPR02MB3262:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB3262F74D413999FA1C4D844EB2279@MWHPR02MB3262.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F13P8m7Iky9MOkE7I2WQVDTgK89HdvuMfWwzlrErKqFGfc9wNsalhMzkjlN2VIz9npvshrrXuXAvZB1ebjVnZMusVM2fwb8Rt7qpMhg+6Pliq8sZkKoOXdpsgRSUzcgdDIknIiMZWgBeevUYYPs7y8C/4i48Xc9uDpvJZFsrTBRt29JZsCN/JC7rimYvJqK5jrjj8GzWzvld3DU+5yP+qAsQOo5ZPT3uTKZeCOyqvKw10ZmH58tc3mj6l+v/mZ8lqqYdiSf9FI8THoQDEbex3AyZ+HiUsZWmCzovDHzaeH+gJRWsfabWhOxwtzPnJJl65YhD4ahhBObBEHgc00LFXBjG0b10T2UcEKVOrf7kOnfrTXvFoxmTheEykin2xluy1TeWH4vQYBKF3HxU2CqyVcuVJbcMs4UE7N+DENzQ54mLTwNmWCgdiw82A+hpeeldgG1Z1ucwU4ZQh9F9Fny2ccdGvCIYIIxzXWgVITCPjfYKdh1FUwQl5K0n+/OOM+PAHCR5xDfuPkQ2mbwPHzqdtwbKrT37Y40DS0yCipsFn4TI3iGzNh+OHLX+eY2NnziHE4oNk2L4q/21pvoAx4/0VzQDmgRwl/B3DgSbXo2y58e22iFFo5JOy92IIh/Ce7KGZ1OkRDjn2sL0ZgNKYHI0VAmboU8Ih/b/FHaaTB/u7PXVMn0m/UWYHVPveNUKkUeIR7MSF+FP70pN6ItImodi1g==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(36756003)(5660300002)(70586007)(70206006)(4326008)(8936002)(31696002)(83380400001)(53546011)(356005)(9786002)(8676002)(82310400004)(7636003)(110136005)(336012)(36860700001)(31686004)(47076005)(426003)(54906003)(2616005)(508600001)(26005)(186003)(316002)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:37:53.0003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648d3378-5706-48fd-b6d0-08d9e672bda0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3262

Hi Julien/Stefano,

On 02/02/2022 13:05, Ayan Kumar Halder wrote:
> Hi Julien,
>
> I have a question.
>
> On 31/01/2022 19:37, Ayan Kumar Halder wrote:
>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>> index 308650b400..f19fb46f72 100644
>>> --- a/xen/arch/arm/ioreq.c
>>> +++ b/xen/arch/arm/ioreq.c
>>> @@ -23,16 +23,35 @@
>>>     #include <public/hvm/ioreq.h>
>>>   +#include "decode.h"
>>> +
>>>   enum io_state handle_ioserv(struct cpu_user_regs *regs, struct 
>>> vcpu *v)
>>>   {
>>>       const union hsr hsr = { .bits = regs->hsr };
>>> -    const struct hsr_dabt dabt = hsr.dabt;
>>> +    struct hsr_dabt dabt = hsr.dabt;
>>> +
>>>       /* Code is similar to handle_read */
>>>       register_t r = v->io.req.data;
>>>         /* We are done with the IO */
>>>       v->io.req.state = STATE_IOREQ_NONE;
>>>   +    /*
>>> +     * Note that we have already decoded the instruction in 
>>> try_fwd_ioserv().
>>> +     * We decode the instruction again to obtain rn and imm9. This 
>>> will be used
>>> +     * to do the post increment.
>>> +     * Also there is no need to check whether the instruction can 
>>> be decoded or
>>> +     * was successfully decoded. The reason being if there was an 
>>> error, then
>>> +     * try_fwd_ioserv() would have returned error and this function 
>>> would not
>>> +     * have been called. Thus, there is an assumption that 
>>> handle_iosev() is
>>> +     * invoked when try_fwd_ioserv() has returned successfully.
>>
>> I am afraid this is not a correct assumption. Another vCPU can modify 
>> the instruction between the two decoding. So the right solution is to 
>> stash the information for latter consumption.
>>
>>> +     */
>>> +    if ( !dabt.valid )
>>> +    {
>>> +        decode_instruction(regs, &dabt);
>>> +        post_increment_register(&dabt.dabt_instr);
>>> +    }
>>> +
>>>       if ( dabt.write )
>>>           return IO_HANDLED;
>>>   @@ -65,6 +84,8 @@ enum io_state try_fwd_ioserv(struct 
>>> cpu_user_regs *regs,
>>>       };
>>>       struct ioreq_server *s = NULL;
>>>       enum io_state rc;
>>> +    bool instr_decoded = false;
>>> +    const union hsr hsr = { .bits = regs->hsr };
>>>         if ( vio->req.state != STATE_IOREQ_NONE )
>>>       {
>>> @@ -76,8 +97,18 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>> *regs,
>>>       if ( !s )
>>>           return IO_UNHANDLED;
>>>   +    /*
>>> +     * Armv8 processor does not provide a valid syndrome for 
>>> decoding some
>>> +     * instructions (for eg post-indexing ldr/str instructions). So 
>>> in order to
>>> +     * process these instructions, Xen must decode them.
>>> +     */
>>>       if ( !info->dabt.valid )
>>> -        return IO_ABORT;
>>> +    {
>>> +        rc = try_decode_instruction_invalid_iss(regs, &info->dabt);
>>> +
>>> +        if ( rc != IO_HANDLED)
>>> +            return rc;
>>> +    }
>>
>> As you pointed out previously, the field SAS (Syndrome Access Size) 
>> is invalid when the ISV=0. So the decoding needs to be done *before* 
>> we select the IOREQ server.
>>
>> But as I said, this would result to decode the instruciton when this 
>> is not necessary. This is where Stefano's suggestion in [1] is useful.
>>
>> For ISV=0, it will be a lot more common to trap because of a P2M 
>> translation fault (of the MMIO is not mapped). So we should call that 
>> first and then, if it still not resolved, try to decode the instruction.
>>
>> With that in place, you are avoiding the issue in try_fwd_ioserv().
>>
>> Can you please coordinate with Stefano?
>
> I am a bit confused regarding where we need to handle to post 
> increment of Rn in case of ioreq.
>
> I can see the following two places where PC gets incremented :-
>
> 1. handle_ioserv() returns IO_HANDLED via try_handle_mmio(). And then 
> in "case IO_HANDLED:", PC is incremented.
>
> 2. leave_hypervisor_to_guest() ---> check_for_vcpu_work() --> 
> vcpu_ioreq_handle_completion() --> arch_ioreq_complete_mmio(). Here PC 
> is incremented as well.
>
> So, do I need to update Rn in both the above places.
>
> And if I understood your previous comment "Another vCPU can modify the 
> instruction between the two decoding....", you are suggesting to save 
> the instruction opcode (from PC) before invoking try_fwd_ioserv(). So, 
> that it can be decoded again in arch_ioreq_complete_mmio() without 
> reading PC.
>
> - Ayan

I have sent out the v6 patch  "[XEN v6 0/3] xen/arm64: io: Decode 
ldr/str post-indexing instruction".

- Ayan

>
>>
>> [1] alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop
>>

