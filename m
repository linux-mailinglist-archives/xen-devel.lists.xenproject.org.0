Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A14D624B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 14:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289028.490314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfCn-0006br-IZ; Fri, 11 Mar 2022 13:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289028.490314; Fri, 11 Mar 2022 13:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfCn-0006Zi-FX; Fri, 11 Mar 2022 13:21:17 +0000
Received: by outflank-mailman (input) for mailman id 289028;
 Fri, 11 Mar 2022 13:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bq6s=TW=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nSfCl-0006Zc-5j
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 13:21:15 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e2728db-a13e-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 14:21:12 +0100 (CET)
Received: from SN4PR0401CA0020.namprd04.prod.outlook.com
 (2603:10b6:803:21::30) by DM5PR02MB2441.namprd02.prod.outlook.com
 (2603:10b6:3:46::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Fri, 11 Mar
 2022 13:21:08 +0000
Received: from SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::26) by SN4PR0401CA0020.outlook.office365.com
 (2603:10b6:803:21::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 13:21:08 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0024.mail.protection.outlook.com (10.97.5.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 13:21:08 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 11 Mar 2022 13:21:06 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 11 Mar 2022 13:21:03 +0000
Received: from [10.71.118.106] (port=50548)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nSfCX-0003ny-Hc; Fri, 11 Mar 2022 13:21:02 +0000
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
X-Inumbo-ID: 1e2728db-a13e-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+hx8picdgtl7Ei59bbHggVQlwZSfmUqrvzTBjWZwLlq59LFUrsPEMlNjrxodGCyDVUZCZe1qzO5DfFJ6zLLMdCdlUx7wYrx36a2Yhp4+tupgXIOmGQkIfzO6IggBqdN2spa6dQL23VemyQ5U/pyN5hISuSuysEYdMLmtQTHYqajZ/GVOWoidHRRmNmhTgez0mXNqPI+InPDeUrWwmYK13lJAQFZtfMtMT7ohlVsAIlv3fZwpRLsJk0U18A/zLPJb33/Rs6RTBeKyHkf4Yvg7O4t6H0R512XHpfLCIfae80eoO3lBb0TwE803vPz4CZEoKajgD+C8LkkhlZIZRvrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+k1d2AlhUFlWXWJZs1e/Mul6hrSF5nctiIMio6BAy4=;
 b=LC4itbbNQXbrZ9SvfrYhCGcKgD8njJGnHUleGfQQYCCaI6VRb5Hl0VrFw8uQdscgqgC7rTfqntq5vmrz+W7V6LEdaWEe/bV2hOp0on9AZ7KQks1G2G+7cNA+BbLFSBetWK8ncpwEhmtBmR8RYrLMnS5y6Gg67pank7aVN48GdNwkqYwkIyqFalpliBniUpJrrPTeGYalkj1fXQb7WQxhSnfhPWcFcJsAVVsU+OnDpfd2Cl+HAlokiw821ewf1DFrHE5H8Xg3YouPolLozP9gRfxl0Mu1KEPdbOrsasxkd07okbSzK9eR7aLWKGhHdn3SDp0tlgmPqP3QheNFXb/LeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+k1d2AlhUFlWXWJZs1e/Mul6hrSF5nctiIMio6BAy4=;
 b=ixCADxwRMRKGe/KzxRo8a+1mqymVUO2wMAdZNWslF3wp0lkE2ACj+K9PftpvlXis1Kpi66xKVBkRl0pr/q/4PkAYj7RqJwSHX5bKrpo7mfT9zJrEkCCPGrvTJ8ssi7kvIsqNTe6BABjNXHtF98Z7+fqDndWxyTkEbeYFdGk4ulg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <347bda39-2eed-6139-222d-3924bf286f08@xilinx.com>
Date: Fri, 11 Mar 2022 13:21:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-5-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2203101813030.3261@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <alpine.DEB.2.22.394.2203101813030.3261@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c3f42f2-6c29-4e8b-8320-08da036200f0
X-MS-TrafficTypeDiagnostic: DM5PR02MB2441:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR02MB244119C260B8167BDBBF026CB20C9@DM5PR02MB2441.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZeezdIP/xvC+uqPqjMpIgJSPpft0M8T5Owxg2mLMVgYVaMvXx5atavg09Ig1GGPwu1J/+bL7DNspnzSndB3czv6TlNvNZMCTT05whENX/4KrqUQZ7astc6UBmjLxEEg/Us03RRbN7x3oakokgZXa4HCCSbobCQUDqD3iQdfAsDv94K3aXOulbG9NeDTnEhdx3CByKif5VDhe5TDeUiQTenzrL5yFkN/WHquoJD8ntcWQq3aakRGw3KBdJQmZvxAOnklUuUHZLDBmGrrlOydt5O2NFUqoHkCRda0oep9AHP490EQr1S/PDU8+kFtB/9seKpIzYkzbCSYvN2x4ZcKzOT6bi1bvl9sycYNejFLFEMaEL/GbUP2w/pW/rbtCf4JNkwA3XQArpe3zj85UIXq8PAXwWf2kg+fuDLZ0KSPkFkngBEGPWOiXo4SqqtkzcieXKRW8RSp+j8TaCcUzEjdMJTkI67eO7xYrD3tJuemQSD6q+wd9SxyaMwvRQTqbHDD0dVwCfDk17OnRhOyLegkcQJyHeGe12nEH8Pvfef5yuSJe0kMUfu3seq9YYRxlQ3aSUUwMXMmiD5bpKqJ0JTfsPnFLg204tQCfha5BVRiey8WLN+qF3/R1ML5vYgJm79wXY8j9F0Owd3rk8vihJYVqh55KjEViPgjNiulpiLPIPl4aO5pTpdPBFMBubTGaKBS9sfZoCdteWggebqI4wP8aSiA22dG37lNi7xpKyB8I4kQ=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(508600001)(31686004)(110136005)(54906003)(316002)(5660300002)(7636003)(8676002)(70586007)(47076005)(36860700001)(4326008)(7416002)(8936002)(70206006)(2616005)(336012)(186003)(26005)(40460700003)(53546011)(83380400001)(9786002)(36756003)(82310400004)(2906002)(426003)(31696002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 13:21:08.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3f42f2-6c29-4e8b-8320-08da036200f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2441

Hi Stefano,

On 11/03/2022 02:25, Stefano Stabellini wrote:
> On Thu, 10 Mar 2022, Ayan Kumar Halder wrote:
>> When the data abort is caused due to cache maintenance for an address,
>> there are three scenarios:-
>>
>> 1. Address belonging to a non emulated region - For this, Xen should
>> set the corresponding bit in the translation table entry to valid and
>> return to the guest to retry the instruction. This can happen sometimes
>> as Xen need to set the translation table entry to invalid. (for eg
>> 'Break-Before-Make' sequence). Xen returns to the guest to retry the
>> instruction.
>>
>> 2. Address belongs to an emulated region - Xen should ignore the
>> instruction (ie increment the PC) and return to the guest.
>>
>> 3. Address is invalid - Xen should forward the data abort to the guest.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Changelog:-
>>
>> v1...v8 - NA
>>
>> v9 - Extracted this change from "[XEN v7 2/2] xen/arm64: io: Support
>> instructions (for which ISS is not ..." into a separate patch of its
>> own. The reason being this addresses an existing bug in the codebase.
>>
>> v10 - 1. To check if the address belongs to an emulated region, one
>> needs to check if it has a mmio handler or an ioreq server. In this
>> case, Xen should increment the PC
>> 2. If the address is invalid (niether emulated MMIO nor the translation
>> could be resolved via p2m or mapping the MMIO region), then Xen should
>> forward the abort to the guest.
>>
>>   xen/arch/arm/include/asm/mmio.h |  1 +
>>   xen/arch/arm/io.c               | 20 ++++++++++++++++++++
>>   xen/arch/arm/ioreq.c            | 15 ++++++++++++++-
>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
>> index ca259a79c2..79e64d9af8 100644
>> --- a/xen/arch/arm/include/asm/mmio.h
>> +++ b/xen/arch/arm/include/asm/mmio.h
>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>        * instruction.
>>        */
>>       INSTR_LDR_STR_POSTINDEXING,
>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>   };
>>   
>>   typedef struct
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index e6c77e16bf..c5b2980a5f 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>>           return;
>>       }
>>   
>> +    /*
>> +     * When the data abort is caused due to cache maintenance, Xen should check
>> +     * if the address belongs to an emulated MMIO region or not. The behavior
>> +     * will differ accordingly.
>> +     */
>> +    if ( info->dabt.cache )
>> +    {
>> +        info->dabt_instr.state = INSTR_CACHE;
>> +        return;
>> +    }
>> +
>>       /*
>>        * Armv8 processor does not provide a valid syndrome for decoding some
>>        * instructions. So in order to process these instructions, Xen must
>> @@ -177,6 +188,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>           return rc;
>>       }
>>   
>> +    /*
>> +     * When the data abort is caused due to cache maintenance and the address
>> +     * belongs to an emulated region, Xen should ignore this instruction.
>> +     */
>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>> +    {
>> +        return IO_HANDLED;
>> +    }
>>       /*
>>        * At this point, we know that the instruction is either valid or has been
>>        * decoded successfully. Thus, Xen should be allowed to execute the
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index cc9bf23213..0dd2d452f7 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -29,10 +29,14 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>>       const struct hsr_dabt dabt = hsr.dabt;
>>       /* Code is similar to handle_read */
>>       register_t r = v->io.req.data;
>> +    const struct instr_details instr = v->io.info.dabt_instr;
>>   
>>       /* We are done with the IO */
>>       v->io.req.state = STATE_IOREQ_NONE;
>>   
>> +    if ( instr.state == INSTR_CACHE )
>> +        return IO_HANDLED;
> It might be possible to get rid of this check here by rearranging the
> code in try_handle_mmio a little bit so that handle_ioserv is not called
> when INSTR_CACHE. But I don't have an opinion about it.

AFAIU, we need to invoke ioreq_server_select()  to determine if there is 
a ioreq server for the faulting gpa. If so, then we know that the 
address is emulated. I think what you are suggesting is to check this 
before invoking try_fwd_ioserv() in try_handle_mmio().

If so, the code will look like this :-

enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               mmio_info_t *info)
{
     struct vcpu *v = current;
     const struct mmio_handler *handler = NULL;
     int rc;

     ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);

     if ( !info->dabt.valid )
     {
         ASSERT_UNREACHABLE();
         return IO_ABORT;
     }

     handler = find_mmio_handler(v->domain, info->gpa);
     if ( !handler )
     {

#ifdef CONFIG_IOREQ_SERVER

     struct vcpu_io *vio = &v->io;
     const struct instr_details instr = info->dabt_instr;
     struct hsr_dabt dabt = info->dabt;
     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
         .addr = info->gpa,
         .size = 1 << info->dabt.size,
         .count = 1,
         .dir = !info->dabt.write,
         /*
          * On x86, df is used by 'rep' instruction to tell the direction
          * to iterate (forward or backward).
          * On Arm, all the accesses to MMIO region will do a single
          * memory access. So for now, we can safely always set to 0.
          */
         .df = 0,
         .data = get_user_reg(regs, info->dabt.reg),
         .state = STATE_IOREQ_READY,
     };
     struct ioreq_server *s = NULL;
     enum io_state rc;

     if ( vio->req.state != STATE_IOREQ_NONE )
     {
         gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
         return IO_ABORT;
     }

     s = ioreq_server_select(v->domain, &p);
     if ( !s )
         return IO_UNHANDLED;

     if ( instr.state == INSTR_CACHE )
     {
         return IO_HANDLED;
     }

     rc = try_fwd_ioserv(vio, &p, s);
     if ( rc == IO_HANDLED )
         return handle_ioserv(regs, v);

#endif
         return rc;
     }

I am not be inclined to have "#ifdef CONFIG_IOREQ_SERVER" in 
xen/xen/arch/arm/io.c as the file is generic.

- Ayan

>
> The patch does what it says on the tin and as far as I can tell followed
> Julien's requests so:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

