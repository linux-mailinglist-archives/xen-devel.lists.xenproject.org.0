Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53B4A7133
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264123.457113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFKF-00056l-Lg; Wed, 02 Feb 2022 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264123.457113; Wed, 02 Feb 2022 13:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFKF-00053L-Ht; Wed, 02 Feb 2022 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 264123;
 Wed, 02 Feb 2022 13:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFFKE-00053F-Bl
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:05:30 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca863ec2-8428-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:05:29 +0100 (CET)
Received: from BN6PR19CA0103.namprd19.prod.outlook.com (2603:10b6:404:a0::17)
 by SN6PR02MB4654.namprd02.prod.outlook.com (2603:10b6:805:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 13:05:24 +0000
Received: from BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::53) by BN6PR19CA0103.outlook.office365.com
 (2603:10b6:404:a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 13:05:24 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT042.mail.protection.outlook.com (10.13.2.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 13:05:24 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 13:05:23 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 13:05:23 +0000
Received: from [10.71.118.184] (port=11473)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFFK6-0007ac-LU; Wed, 02 Feb 2022 13:05:22 +0000
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
X-Inumbo-ID: ca863ec2-8428-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfcZYzjJFawgkCu+j7KmfxzyIsK1me+DjJT91PW8HvmjDDCD+JWVvMR/It1/7DFBDbBwe+x9ZCQy00N2tIl0gAi49soiJGqaJzfJ1H1fbgPhGZvXL3lbZu+7Hwgqg0GhiCRoD/+2j6vE3FVpqYC4dFMm3+3sCIEeVYj4nAoT0JBIH0jWiWF/c+H2v2W7qdWc2ZzLiKHOoIiPt646KrSf32buezCbO01WkiowZShuZN6WsKLfomziWd8Zx050rnBw4ikRpzw2li1BdyoctvMEdthSTxukGEZUSyjFgPFbivnCM7MF0fyPX17MG/JMe2zQv86L2pABWa/IgPDdjPKfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM/Hm2dDrulzU4PiPd7pKZq0LqWuFnahVAuLDnzu5zo=;
 b=m02K6GCwWV/hLN8lcCI+V28BxNHQi2Cpo9HnDup9dkKZ3aOBGFsCi0aU3T+TmzzYwSQYy91qG4NPk//3TTWH684Gkg9ktyQMwaZJpoDjsOqCE7/WFfGu9h7MqL20bcb2gcuL27Mydfw4Ty4m+JgaAmFUDZ7kO/KR750DTfiTHFct6201ruL/r7sS7bxAQ+Dh2jM4aWAeUDqYSyK6NUeTtszHdB2nhMtSD4+OtSyNDG8v1crZ1KRnXjYQhnwgAunF3NgiYSkvmMCdSxkaPQ1wL2pa6ekbU9noG5a7VNFwNcQ29Pi+XLgUj8WkIuBFnCH7ljlNix42tFHU6hwrKxn0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM/Hm2dDrulzU4PiPd7pKZq0LqWuFnahVAuLDnzu5zo=;
 b=GkNv0Co40wD7KTvz5FdTADO9RS7Y6IMMXTc1McstKIEzReGeQQTyemi65isoHozq+3dH3FtiKTvMnpXZbKNmSsb41e20e23t0CKArBb+yAGAJibSOcRhtKF2wY6DiC2asXfbAWnpCkWciPaH9w1ZVhH8/yd8qN2KOmZ2HxhFfwg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <453fa8d1-6d12-ea23-6b35-e556f72fe0cf@xilinx.com>
Date: Wed, 2 Feb 2022 13:05:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220131193728.2980-1-ayankuma@xilinx.com>
 <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c5ba134-1440-48ba-a6a7-08d9e64cace1
X-MS-TrafficTypeDiagnostic: SN6PR02MB4654:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB465466ADA461D4A1FD84B1ABB2279@SN6PR02MB4654.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q6US5tDiebB0A7j0CvXEXiUIig+zFSGF7k4iP/R9IfiF8UM892tcgo16BUFb6CzPrfYQNsFtIaC/X/Do9S6eDsAfn0p8K8sv2jyHJoaSG2SX/8z+S+AuX87EODt1BYMBhFUVdNi4n86AufhxLIBm97tNwFlCaWAVspEe+cozl4sqUysdhlgltNjY4W0zQi5dg4xAOnEeGAezqt6n8SEu+0pUEx8OUDSeLF6kCRwLqkMHtujI4Fyaqjv8jmAPaK6pdNUszUQEvzBV67UlwIBR0RYRRbz7zLYjfKZYq8FCpCgXUuf4niFNiq8gxc/DLNYFLvWyHfwJpYn+6bcHchtI7nIi27PdGIZGcT1pyD1qdNmcPYZAje+olAIcO2AZwztgYTx3WQIkhULu6Cc7CakPVWdag0wZ2bqSbNv9XGmaZQzRCwb5qXAlqcg9wDDPRzAd8dO+becwJhUinKadT5mRWk/cDEqe7hG/aX6a5TihO29IFCe/jqJHHEr8//Ucr9R3MKhf7iCmL7zopnTpiwK2KGaHVm+1AtL+YeXeMMwI4O7kfNYE8hVowBLgp9LAy/au7lSIn9iCLD99zMv9aBl2HessGO3rYeIo36X3CMGMmvSucmwsSxjz1n9UhqsC40c/XXHQeKFkpsTJfR6skscakiBtXQZVYbGeWKNJNzxI9zIYCqK9RMN8PFUKbCif5N+PUqsigAAcIh5mow2TzhdNpw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(4326008)(36860700001)(70586007)(7636003)(426003)(8676002)(82310400004)(8936002)(5660300002)(47076005)(70206006)(508600001)(53546011)(9786002)(316002)(36756003)(31686004)(110136005)(2906002)(186003)(2616005)(31696002)(83380400001)(356005)(26005)(336012)(54906003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 13:05:24.0289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ba134-1440-48ba-a6a7-08d9e64cace1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4654

Hi Julien,

I have a question.

On 31/01/2022 19:37, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index 308650b400..f19fb46f72 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -23,16 +23,35 @@
>>     #include <public/hvm/ioreq.h>
>>   +#include "decode.h"
>> +
>>   enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu 
>> *v)
>>   {
>>       const union hsr hsr = { .bits = regs->hsr };
>> -    const struct hsr_dabt dabt = hsr.dabt;
>> +    struct hsr_dabt dabt = hsr.dabt;
>> +
>>       /* Code is similar to handle_read */
>>       register_t r = v->io.req.data;
>>         /* We are done with the IO */
>>       v->io.req.state = STATE_IOREQ_NONE;
>>   +    /*
>> +     * Note that we have already decoded the instruction in 
>> try_fwd_ioserv().
>> +     * We decode the instruction again to obtain rn and imm9. This 
>> will be used
>> +     * to do the post increment.
>> +     * Also there is no need to check whether the instruction can be 
>> decoded or
>> +     * was successfully decoded. The reason being if there was an 
>> error, then
>> +     * try_fwd_ioserv() would have returned error and this function 
>> would not
>> +     * have been called. Thus, there is an assumption that 
>> handle_iosev() is
>> +     * invoked when try_fwd_ioserv() has returned successfully.
>
> I am afraid this is not a correct assumption. Another vCPU can modify 
> the instruction between the two decoding. So the right solution is to 
> stash the information for latter consumption.
>
>> +     */
>> +    if ( !dabt.valid )
>> +    {
>> +        decode_instruction(regs, &dabt);
>> +        post_increment_register(&dabt.dabt_instr);
>> +    }
>> +
>>       if ( dabt.write )
>>           return IO_HANDLED;
>>   @@ -65,6 +84,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>       };
>>       struct ioreq_server *s = NULL;
>>       enum io_state rc;
>> +    bool instr_decoded = false;
>> +    const union hsr hsr = { .bits = regs->hsr };
>>         if ( vio->req.state != STATE_IOREQ_NONE )
>>       {
>> @@ -76,8 +97,18 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>       if ( !s )
>>           return IO_UNHANDLED;
>>   +    /*
>> +     * Armv8 processor does not provide a valid syndrome for 
>> decoding some
>> +     * instructions (for eg post-indexing ldr/str instructions). So 
>> in order to
>> +     * process these instructions, Xen must decode them.
>> +     */
>>       if ( !info->dabt.valid )
>> -        return IO_ABORT;
>> +    {
>> +        rc = try_decode_instruction_invalid_iss(regs, &info->dabt);
>> +
>> +        if ( rc != IO_HANDLED)
>> +            return rc;
>> +    }
>
> As you pointed out previously, the field SAS (Syndrome Access Size) is 
> invalid when the ISV=0. So the decoding needs to be done *before* we 
> select the IOREQ server.
>
> But as I said, this would result to decode the instruciton when this 
> is not necessary. This is where Stefano's suggestion in [1] is useful.
>
> For ISV=0, it will be a lot more common to trap because of a P2M 
> translation fault (of the MMIO is not mapped). So we should call that 
> first and then, if it still not resolved, try to decode the instruction.
>
> With that in place, you are avoiding the issue in try_fwd_ioserv().
>
> Can you please coordinate with Stefano?

I am a bit confused regarding where we need to handle to post increment 
of Rn in case of ioreq.

I can see the following two places where PC gets incremented :-

1. handle_ioserv() returns IO_HANDLED via try_handle_mmio(). And then in 
"case IO_HANDLED:", PC is incremented.

2. leave_hypervisor_to_guest() ---> check_for_vcpu_work() --> 
vcpu_ioreq_handle_completion() --> arch_ioreq_complete_mmio(). Here PC 
is incremented as well.

So, do I need to update Rn in both the above places.

And if I understood your previous comment "Another vCPU can modify the 
instruction between the two decoding....", you are suggesting to save 
the instruction opcode (from PC) before invoking try_fwd_ioserv(). So, 
that it can be decoded again in arch_ioreq_complete_mmio() without 
reading PC.

- Ayan

>
> [1] alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop
>

