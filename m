Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D04BDB15
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 18:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276369.472506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMC8W-00011s-AA; Mon, 21 Feb 2022 17:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276369.472506; Mon, 21 Feb 2022 17:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMC8W-0000zU-75; Mon, 21 Feb 2022 17:06:08 +0000
Received: by outflank-mailman (input) for mailman id 276369;
 Mon, 21 Feb 2022 17:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nr+1=TE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nMC8U-0000xl-30
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 17:06:06 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e83::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a56e9aa-9338-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 18:06:00 +0100 (CET)
Received: from BN9PR03CA0198.namprd03.prod.outlook.com (2603:10b6:408:f9::23)
 by SA2PR02MB7579.namprd02.prod.outlook.com (2603:10b6:806:144::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 17:05:57 +0000
Received: from BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::f8) by BN9PR03CA0198.outlook.office365.com
 (2603:10b6:408:f9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Mon, 21 Feb 2022 17:05:57 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT043.mail.protection.outlook.com (10.13.2.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.19 via Frontend Transport; Mon, 21 Feb 2022 17:05:56 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 21 Feb 2022 17:05:55 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 21 Feb 2022 17:05:55 +0000
Received: from [10.71.117.205] (port=12515)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nMC8I-0002CM-Qc; Mon, 21 Feb 2022 17:05:55 +0000
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
X-Inumbo-ID: 8a56e9aa-9338-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM5wurANEL7HFq+6MmfMEZ1WQJRkMFnuB8lOJwwI9Qs2/rrp8m3ocQ5HZR6ZDmzPJ6mhtKW5eG5nXzJNFyIlIwLSV//Ql45wuSGNc+n3xX8X9XIQeE3AdK7askx8xMEICY0MKnBxcri8Hd6KqdJuLc2CshiPf59Ut1l1VTmfqfMUzxsMbj5dTVmMX7mY0tuT+rwUZWt+I6iuB3Mqif9GA7yhK8YI3UYnzyY8kFDxsHM+fMpwxLBqn/Lu+DRrQ0XDo2cwrcKbUBS10p1jx3nxqCQssl7DVxDqLZB1I3N9xwh2sY5p7UDFhRTh+2rkR2GcLvxkAoKcbsjFjQ9MEX9Rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imW2pRAvC1J980x5pxuH6SKoABMyPwAvYEvZdAryobQ=;
 b=l65fgXBHpOL3TLZxLCGq85g96pEV19NAsLBjpWg+YpnwRMacCCRQo+1gQGOUJIdIxbigc/T9DYlWfpQCEB4q0ROCrY/XS1+dANbDORv660L/LkDlVGv5Nb9LmECBf362/R0iN3B3pQ5g5m9Vwa8ekGg33p3czauR6HhB6bTGPZJGgf6p473BqVAeN9f5LLEoMzRxj9jY6muOIy/nrOdeLtPv4U3bQa3H3it2wrXnb9JlkNK6ckFqaIqtirlNHG2X2EEfXP6HJYhC9G3POFFOCOvczqZCTPUGTtm6s+lXzCLLTozwnqpF2xv3DK6bzjLH4ULFe7/kdt9mUTo0AacUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imW2pRAvC1J980x5pxuH6SKoABMyPwAvYEvZdAryobQ=;
 b=UyJQSyScOQo1HR1ezhk6C2PVOBUr3Bt39Ih5O6R9KA0RhYacTX6S83jC2dZsqAhcrMUw4Y/aqJgV/PkliH74yhYCdpvJGUu6F0/cN1H8NWPo05UQTg0ZO6tP5qmPcHa5CzbRypBXVjUCCV/n6F1hNAZ54LtIaTYKcunTuKZc79I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <10cf253b-fc58-1afc-66ec-33ac3008bb0f@xilinx.com>
Date: Mon, 21 Feb 2022 17:05:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [XEN v8 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220212233433.46018-1-ayankuma@xilinx.com>
 <20220212233433.46018-3-ayankuma@xilinx.com>
 <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 955af48d-d35c-49d3-b544-08d9f55c6d53
X-MS-TrafficTypeDiagnostic: SA2PR02MB7579:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR02MB757910F64D7084F42187E32BB23A9@SA2PR02MB7579.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MCsOXBJ49SUCTYEOlcgYqh4pdN0vCsRMQyhChYB8uFe9SDiY5armwwuaZO6mFc4dQv+aG3uSu12j4UpxqocnxXOU6ueKjdZAiYCtz8wYdaL38euxdp8PPMpKN1Lmy/wrWXiq6By+Ti6qcbB7LOdGTctAMK2n0pnrNk+L5PiquSBxMjGvkJlSXWn70bgvyjtnIPQ89mr9JqUb8+qzazVrPgxdCn82pGj9Yn+1PIn2nbMd1wQ0xP3onKac1zK7xzCxcsuK8ON8gCfcUj6Z+je2QXiVNuQGzlwQEPOFgvG1GcJwwYUqBccKQcS1476vF9byx+IAzGo98CPhKWcGipXCiX5fEnBeWJln0mRksJ83Vu5zOF6hFkaOs8uzfjO7mvzp/Bd/7M/zd0Y0E9LxBy6P/yE3jf05XpbKq/UvJCcpAh6sG4lu099JbQWN3QiqvpoStJzGSSNqNqyePk2jdBmjRDgoIRandF0SwBtp0jWv8K++sd8ZYnXN+Zh53lCq1EUapiZjcFLNnwxgxDerBL5JiZkdjYXu+WDe2GJ5UAFPnWdDw0+S4mGnGye5iI2599/Kf2C2eZ1m0HJxsTcaM/xfIU7mh44QMpOSf2WqIKVDXfuJ5UoBIQo4QCB8l9E8EfkhoLdI6dth5D44tD1hgWKXPqSQG5M3vrmZDHhIuNz2guJlwqeREN9DOCljLSoOqS4Mwqh6uQuG8TmXm0mHed0d7upTBFwVdIsML7Emvgwp6tpizRppqMC1XnAGmdMvxOGa+XUnwEJkVixZFINtIwAkKw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(53546011)(70206006)(40460700003)(31686004)(30864003)(70586007)(9786002)(8936002)(36756003)(83380400001)(336012)(186003)(4326008)(426003)(2616005)(5660300002)(8676002)(26005)(82310400004)(31696002)(36860700001)(110136005)(316002)(54906003)(47076005)(508600001)(356005)(2906002)(7636003)(50156003)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 17:05:56.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 955af48d-d35c-49d3-b544-08d9f55c6d53
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7579

Hi Julien,

Apprecciate your continuous help on this. Most of your comments make 
sense, but I need few clarifications as below :-

On 13/02/2022 12:19, Julien Grall wrote:
> Hi,
>
> On 12/02/2022 23:34, Ayan Kumar Halder wrote:
>>
>>   xen/arch/arm/arm32/traps.c        |  7 +++
>>   xen/arch/arm/arm64/traps.c        | 47 +++++++++++++++
>>   xen/arch/arm/decode.c             |  1 +
>>   xen/arch/arm/include/asm/domain.h |  4 ++
>>   xen/arch/arm/include/asm/mmio.h   | 15 ++++-
>>   xen/arch/arm/include/asm/traps.h  |  2 +
>>   xen/arch/arm/io.c                 | 98 ++++++++++++++++++++-----------
>>   xen/arch/arm/ioreq.c              |  7 ++-
>>   xen/arch/arm/traps.c              | 80 +++++++++++++++++++++----
>>   xen/arch/x86/include/asm/ioreq.h  |  3 +
>
> This change technically needs an ack from the x86 maintainers. And...
>
>>   xen/include/xen/sched.h           |  2 +
>
> this one for anyone from THE REST (Stefano and I are part of it). 
> Please use scripts/add_maintainers.pl to automatically add the 
> relevant maintainers in CC.
>
>>   11 files changed, 217 insertions(+), 49 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
>> index 9c9790a6d1..70c6238196 100644
>> --- a/xen/arch/arm/arm32/traps.c
>> +++ b/xen/arch/arm/arm32/traps.c
>> @@ -18,9 +18,11 @@
>>     #include <xen/lib.h>
>>   #include <xen/kernel.h>
>> +#include <xen/sched.h>
>>     #include <public/xen.h>
>>   +#include <asm/mmio.h>
>>   #include <asm/processor.h>
>>   #include <asm/traps.h>
>>   @@ -82,6 +84,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>>           do_unexpected_trap("Data Abort", regs);
>>   }
>>   +void post_increment_register(const struct instr_details *instr)
>> +{
>> +    domain_crash(current->domain);
>
>
> Please add a comment explaning why this is resulting to a domain 
> crash. AFAICT, this is because this should not be reachable (yet) for 
> 32-bit.
>
>
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
>> index 9113a15c7a..a6766689b3 100644
>> --- a/xen/arch/arm/arm64/traps.c
>> +++ b/xen/arch/arm/arm64/traps.c
>> @@ -23,6 +23,7 @@
>>   #include <asm/processor.h>
>>     #include <public/xen.h>
>> +#include <xen/sched.h>
>
> The headers should ordered so <xen/*.h> are first, then <asm/*.h>, 
> then <public/*.h>. They should then be ordered alphabetically within 
> each of the category.
>
> So, this new header should be included right after <xen/lib.h>
>
> [...]
>
>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>> b/xen/arch/arm/include/asm/mmio.h
>> index 3354d9c635..745130b7fe 100644
>> --- a/xen/arch/arm/include/asm/mmio.h
>> +++ b/xen/arch/arm/include/asm/mmio.h
>> @@ -26,12 +26,22 @@
>>     #define MAX_IO_HANDLER  16
>>   +enum instr_decode_state
>> +{
>> +    INSTR_ERROR,                    /* Error encountered while 
>> decoding instr */
>> +    INSTR_VALID,                    /* ISS is valid, so no need to 
>> decode */
>> +    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded 
>> successfully.
>> +                                       It is ldr/str post indexing */
>
> Coding style: multiple-line comments for Xen should be:
>
> /*
>  * ...
>  * ...
>  */
>
> In this case, I would simply move the comment on top.
>
> [...]
>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index a289d393f9..203466b869 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -95,57 +95,87 @@ static const struct mmio_handler 
>> *find_mmio_handler(struct domain *d,
>>       return handler;
>>   }
>>   +void try_decode_instruction(const struct cpu_user_regs *regs,
>> +                            mmio_info_t *info)
>> +{
>> +    int rc;
>> +
>> +    /*
>> +     * Erratum 766422: Thumb store translation fault to Hypervisor may
>> +     * not have correct HSR Rt value.
>> +     */
>> +    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
>> +         info->dabt.write )
>> +    {
>> +        rc = decode_instruction(regs, info);
>> +        if ( rc )
>> +        {
>> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> +            info->dabt_instr.state = INSTR_ERROR;
>> +            return;
>> +        }
>> +    }
>
> At the moment, the errata would only be handled when the ISS is valid. 
> Now, you are moving it before we know if it is valid. Can you explain 
> why?
>
> [...]
>
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
>> +    handler = find_mmio_handler(v->domain, info->gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>> -        rc = try_fwd_ioserv(regs, v, &info);
>> +        rc = try_fwd_ioserv(regs, v, info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>>             return rc;
>>       }
>>   -    /* All the instructions used on emulated MMIO region should be 
>> valid */
>> -    if ( !dabt.valid )
>> -        return IO_ABORT;
>> -
>
> AFAIU, the assumption is now try_handle_mmio() and try_fwd_ioserv() 
> will always be called when dabt.valid == 1. I think it would still be 
> good to check that assumption.
>
> So I would move the check at the beginning of try_handle_mmio() and 
> add an ASSERT_UNREACHABLE in the if(). Something like:
>
> if ( !dabt.valid )
> {
>     ASSERT_UNREACHABLE();
>     return IO_ABORT;
> }
>
>>       /*
>> -     * Erratum 766422: Thumb store translation fault to Hypervisor may
>> -     * not have correct HSR Rt value.
>> +     * At this point, we know that the instruction is either valid 
>> or has been
>> +     * decoded successfully. Thus, Xen should be allowed to execute the
>> +     * instruction on the emulated MMIO region.
>>        */
>> -    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
>> -         dabt.write )
>> -    {
>> -        int rc;
>> -
>> -        rc = decode_instruction(regs, &info);
>> -        if ( rc )
>> -        {
>> -            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> -            return IO_ABORT;
>> -        }
>> -    }
>> -
>> -    if ( info.dabt.write )
>> -        return handle_write(handler, v, &info);
>> +    if ( info->dabt.write )
>> +        rc = handle_write(handler, v, info);
>>       else
>> -        return handle_read(handler, v, &info);
>> +        rc = handle_read(handler, v, info);
>> +
>> +    return rc;
>
> It looks like there are some left-over of the previous approach. It is 
> fine to return directly from each branch.
>
>
>>   }
>>     void register_mmio_handler(struct domain *d,
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index 308650b400..3c0a935ccf 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>                                struct vcpu *v, mmio_info_t *info)
>>   {
>>       struct vcpu_io *vio = &v->io;
>> +    struct dabt_instr instr = info->dabt_instr;
>>       ioreq_t p = {
>>           .type = IOREQ_TYPE_COPY,
>>           .addr = info->gpa,
>> @@ -76,10 +77,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>       if ( !s )
>>           return IO_UNHANDLED;
>>   -    if ( !info->dabt.valid )
>> -        return IO_ABORT;
>> -
>
> For this one, I would switch to ASSERT(dabt.valid);
I see that try_fwd_ioserv() is invoked from try_handle_mmio() only. 
Thus, if I follow your suggestion of adding a check for dabt.valid at 
the beginning of try_handle_mmio(), then this ASSERT() is not required. 
Let me know if you agree ?
>
>>       vio->req = p;
>> +    vio->info.dabt_instr = instr;
>>         rc = ioreq_send(s, &p, 0);
>>       if ( rc != IO_RETRY || v->domain->is_shutting_down )
>> @@ -95,6 +94,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>   bool arch_ioreq_complete_mmio(void)
>>   {
>>       struct vcpu *v = current;
>> +    struct instr_details dabt_instr = v->io.info.dabt_instr;
>>       struct cpu_user_regs *regs = guest_cpu_user_regs();
>>       const union hsr hsr = { .bits = regs->hsr };
>>   @@ -106,6 +106,7 @@ bool arch_ioreq_complete_mmio(void)
>>         if ( handle_ioserv(regs, v) == IO_HANDLED )
>>       {
>> +        post_increment_register(&dabt_instr);
>>           advance_pc(regs, hsr);
>>           return true;
>>       }
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 9339d12f58..455e51cdbe 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1893,6 +1893,21 @@ static bool try_map_mmio(gfn_t gfn)
>>       return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
>>   }
>>   +static inline bool check_p2m(bool is_data, paddr_t gpa)
>> +{
>> +    /*
>> +     * First check if the translation fault can be resolved by the 
>> P2M subsystem.
>> +     * If that's the case nothing else to do.
>> +     */
>> +    if ( 
>> p2m_resolve_translation_fault(current->domain,gaddr_to_gfn(gpa)) )
>
> Coding style: missing space before and after the comma.
>
>> +        return true;
>> +
>> +    if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>>   static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>>                                          const union hsr hsr)
>>   {
>> @@ -1906,6 +1921,7 @@ static void do_trap_stage2_abort_guest(struct 
>> cpu_user_regs *regs,
>>       paddr_t gpa;
>>       uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
>>       bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>> +    mmio_info_t info;
>>         /*
>>        * If this bit has been set, it means that this stage-2 abort 
>> is caused
>> @@ -1959,6 +1975,25 @@ static void do_trap_stage2_abort_guest(struct 
>> cpu_user_regs *regs,
>>           return;
>>       }
>>       case FSC_FLT_TRANS:
>> +    {
>> +        info.gpa = gpa;
>> +        info.dabt = hsr.dabt;
>> +
>> +        /* Check that the ISS is invalid and it is not data abort. */
>
> This comment looks a bit pointless. You are writing literally what the 
> check is doing. But you don't really explain why. I think you want to 
> move some of the commint with the if here.
>
> However,...
>
>> +        if ( !hsr.dabt.valid && !is_data )
>
> ... this code can be reached by Instruction Abort and Data Abort. So 
> you can't use hsr.dabt. Instead, you should use xabt (or check is_data 
> first).
>
> If you use xabt, you will notice that the 'valid' bit is not existent
> because the instruction syndrome only exists for data abort.
>
> But then, I don't understand why this is only restricted to 
> instruction abort. As I wrote in the previous versions and on IRC, 
> there are valid use cases to trap a data abort with invalid syndrome. 
> Below...
>
>
>> +        {
>> +
>> +            /*
>> +             * Assumption :- Most of the times when we get a 
>> translation fault
>> +             * and the ISS is invalid, the underlying cause is that 
>> the page
>> +             * tables have not been set up correctly.
>> +             */
>> +            if ( check_p2m(is_data, gpa) )
>> +                return;
>> +            else
>> +                goto inject_abt;
>> +        }
>> +
>>           /*
>>            * Attempt first to emulate the MMIO as the data abort will
>>            * likely happen in an emulated region.
>> @@ -1967,13 +2002,45 @@ static void do_trap_stage2_abort_guest(struct 
>> cpu_user_regs *regs,
>>            */
>>           if ( is_data )
>>           {
>> -            enum io_state state = try_handle_mmio(regs, hsr, gpa);
>> +            enum io_state state;
>> +
>> +            try_decode_instruction(regs, &info);
>> +
>> +            /*
>> +             * If Xen could not decode the instruction for any 
>> reason, then it
>> +             * should ask the caller to abort the guest.
>> +             */
>> +            if ( info.dabt_instr.state == INSTR_ERROR )
>> +                goto inject_abt;
>
> ... this will inject a data abort to the guest when we can't decode. 
> This is not what we want. We should check whether this is a P2M 
> translation fault or we need to map an MMIO region.
>
> In pseudo-code, this would look like:
>
> if ( !is_data || hsr.dabt.valid )

I think you mean if ( !is_data || !hsr.dabt.valid )

The reason being if there is an instruction abort or a data abort (with 
ISV == 0), then it should try to configure the page tables.

> {
>     if ( check_p2m() )
>       return;
>
>
>     if ( !is_data )
>        goto inject_dabt;
>
>     decode_instruction();
>     if ( !dabt.invalid )
>       goto inject_dabt;
> }
>
> try_handle_mmio();
>
> if ( instruction was not decoded )
>   check_p2m();

If the instruction was not decoded, then there is no need to configure 
the page tables again. We have already done this before. So, it should 
be safe to abort the guest ?


So my understanding is as follows :-

         /* Check that it is instruction abort or ISS is invalid. */
         if ( !is_data || !info.dabt.valid )
         {
             /*
              * If the instruction was trapped due to access to stage 1 
translation
              * then Xen should try to resolve the page table entry for 
the stage 1
              * translation table with the assumption that the page 
tables are
              * present in the non MMIO region. If it is successful, 
then it should
              * ask the guest to retry the instruction.
              */
             if ( is_data && info.dabt.s1ptw )
             {
                 info.dabt_instr.state = INSTR_RETRY;
                 /* The translation tables are assumed to be in non MMIO 
region. */
                 is_data = false;
             }

             /*
              * Assumption :- Most of the times when we get a 
translation fault
              * and the ISS is invalid, the underlying cause is that the 
page
              * tables have not been set up correctly.
              */
             if ( check_p2m(is_data, gpa) )
                 return;

             /*
              * If the instruction abort or the data abort due to access 
to stage 1
              * translation tables could not be resolved by setting the 
appropriate
              * bits in the translation table, then Xen should abort the 
guest.
              */
             if ( !is_data || (info.dabt_instr.state == INSTR_RETRY) )
                 goto inject_abt;

             try_decode_instruction(regs, &info);

             /* Instruction could not be decoded, then abort the guest */

             if ( info.dabt_instr.state == INSTR_ERROR)
                 goto inject_abt;
         }

         state = try_handle_mmio(regs, &info);

         switch ( state )
         {
             case IO_ABORT:
                 goto inject_abt;
             case IO_HANDLED:
                 /*
                  * If the instruction was decoded and has executed 
successfully
                  * on the MMIO region, then Xen should execute the next 
part of
                  * the instruction. (for eg increment the rn if it is a
                  * post-indexing instruction.
                  */
                 post_increment_register(&info.dabt_instr);
                 advance_pc(regs, hsr);
                 return;
             case IO_RETRY:
                 /* finish later */
                 return;
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
         }

         if ( check_p2m(is_data, gpa) )
             return;


Please letme know if I am misunderstanding something.

- Ayan

>
> Cheers,
>

