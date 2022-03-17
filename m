Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC614DC3C4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291478.494704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUn91-0000Rx-NW; Thu, 17 Mar 2022 10:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291478.494704; Thu, 17 Mar 2022 10:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUn91-0000Pk-K6; Thu, 17 Mar 2022 10:14:11 +0000
Received: by outflank-mailman (input) for mailman id 291478;
 Thu, 17 Mar 2022 10:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfHd=T4=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nUn8z-0000Pe-Ra
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:14:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e89::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0b009f-a5da-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 11:14:07 +0100 (CET)
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by SA0PR02MB7465.namprd02.prod.outlook.com (2603:10b6:806:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Thu, 17 Mar
 2022 10:14:03 +0000
Received: from SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:23::4) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.8 via Frontend
 Transport; Thu, 17 Mar 2022 10:14:03 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0017.mail.protection.outlook.com (10.97.4.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 10:14:02 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 17 Mar 2022 10:14:01 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 17 Mar 2022 10:14:01 +0000
Received: from [10.71.116.176] (port=50246)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nUn8q-0003zQ-SN; Thu, 17 Mar 2022 10:14:00 +0000
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
X-Inumbo-ID: fa0b009f-a5da-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/hgkIqGKEDLH9i5U8hpPFKsVsz71l/VXyYsG2SlykOQlDkofVvpyW3l3CGsVFdpAXlbZv7UmQl9WTYfv6FiOL8olnnr+xVqHaMju2Z8HZ+Hz7yNniHRMxodKFeX5i051YrlYprRwP6Xa9zUNuk66Q7ZnZ4/aMGbslVk2ZuvGCXTFRrsbbPPl1w2i46HrIPAHo7VnAhypCoyEFLmJkwFTbSdyzCg3/aj36q0VLoGx67Mzgv6nu+0eDoJi0vCBHIPHdncPw7HQh9ha2f1PPO40MhPMiugQmdGFOfdRikJCzbT4B+fdlQ1oFmN/v3IBtjmaptD5vUyeQ91JUl+l8+5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKBTZdQQRPJtHpu9l0SxEbny6Hp2HGcwAWG6Jm43HQs=;
 b=ISQJcFUiO9EFKLcz4Rkd5kGxGAwlhnER4y498LT1vyD1mBUq8lGbZFF3WRRzMdMuehFnbbXA7ZbbhlRyjZhTNS2BbRXSbDA38U/XyU5eF5AONHRmWhmcdG2NvRV9CNuTg2CVK4ZVSHsQM0ygDbUuc1JGvehEnrZXE+huFAFTEinp/6X8J37S7l5r+KeT/Bk8Fny2+kqmaN+viHzA1ltQzzeN8q8qLXOuNTGjvNgpmIonxj6TmfWQqLpLi1edmOSrOlwD6DgXEJlkfRQ6hYS/eqNcdVUHqGVQFFbmsaH3UIyQV5i469G7Wh7OHSPLS/SPflIF7Qj4UZwR1TFRAVmqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKBTZdQQRPJtHpu9l0SxEbny6Hp2HGcwAWG6Jm43HQs=;
 b=SxakPK1U8zPUIvZYbvU46BYfC4m6yjJLrAqlPSWDmt4H28Iq/wIP/uTkVPgD/9HoGcym8+K596MKFoDSod9SfFpABX61fi/vTwu3k8p0GV5Wirf3/26TwhPeGWQoiUoPBKyZaqNV2F6gX2Ak/Bb0xoFUk4L1A1In2N4p/KZsDnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <dcf6b9ad-ce47-1862-5499-35fe122f538b@xilinx.com>
Date: Thu, 17 Mar 2022 10:14:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-5-ayankuma@xilinx.com>
 <e2e27a6d-3339-d312-455c-0e61fe410462@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <e2e27a6d-3339-d312-455c-0e61fe410462@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 281dd2e1-c4c1-4f89-795c-08da07fedc6e
X-MS-TrafficTypeDiagnostic: SA0PR02MB7465:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR02MB7465B4B726CF54FA6D8C8BC5B2129@SA0PR02MB7465.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9tQtkpNi1u3bli3La5LSH7ohxa3LFDnlG7lDv8cs45to3G+EvXHaeEz9GwjpehtWz/xapnYuF6dXW7ZYl6P1++zsx7iEBFmVDq7EU7KsLLTYeDVseHwdVz755t154pZstH77zj+uX0xW/i0ZDECpiGQaXmhTUwpoK1/pdLNkgHfZohrbo/lYBIy3lH+ZvJSXqOOr2GqkRwQVU+q6LX8rxVEnnehtA4PNtiom/STc0DqVpGehD2YbbPN9bsyfbfSkLcP9ZizNAlfSw13oHF811PNnTl+VkgAZYh9WDYU9v6lUJZMQG/w/61ZdXGT9NjrF2vXvUFNpZa+9v/ZWVgA55SA9AT9qJwa7OQmZN+98+7suLxwujpkKM82PA01ndqBdPB0fOUufwVaLExOcpEIVj6XtxXlMbkJ4zXIlTwbi5Us9NtRDqBo0fw+ztsiPQ/l7JcNJMVREqkCssS9THykMBR/0Q7eUetPYlzfds6KAiJimyT9UDlep/B4hKMe8mtAIVaj1R3ikaUENAJG8GgfKiHuwcJSGkaXVo4wglOsN+jWniNTiKOdUahjs7gUxuea9HFaUyvL33e0jM8Osj4MatV/BXQzIf+dsRyTMzZGeiZX8KjWO38KnANq5D5kcloTHA6DE/GcI5kWjcnISPgGg0ZH1U0WQkh5CGymEXqapNYORYNNuN1I5dHav9VprsgPEEfUFMduH0cCYCIMkiBTIgQy4wkwrF0xb32fB3AkJIwM=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(54906003)(4326008)(316002)(53546011)(70586007)(8676002)(31696002)(70206006)(508600001)(31686004)(47076005)(5660300002)(36860700001)(36756003)(40460700003)(7416002)(336012)(9786002)(8936002)(356005)(426003)(83380400001)(82310400004)(2906002)(26005)(186003)(2616005)(7636003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:14:02.5005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281dd2e1-c4c1-4f89-795c-08da07fedc6e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7465

Hi Julien,

On 11/03/2022 18:34, Julien Grall wrote:
> Hi,
>
> On 10/03/2022 17:45, Ayan Kumar Halder wrote:
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
>>   xen/arch/arm/include/asm/mmio.h |  1 +
>>   xen/arch/arm/io.c               | 20 ++++++++++++++++++++
>>   xen/arch/arm/ioreq.c            | 15 ++++++++++++++-
>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>> b/xen/arch/arm/include/asm/mmio.h
>> index ca259a79c2..79e64d9af8 100644
>> --- a/xen/arch/arm/include/asm/mmio.h
>> +++ b/xen/arch/arm/include/asm/mmio.h
>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>        * instruction.
>>        */
>>       INSTR_LDR_STR_POSTINDEXING,
>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>   };
>>     typedef struct
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index e6c77e16bf..c5b2980a5f 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct 
>> cpu_user_regs *regs,
>>           return;
>>       }
>>   +    /*
>> +     * When the data abort is caused due to cache maintenance, Xen 
>> should check
>> +     * if the address belongs to an emulated MMIO region or not. The 
>> behavior
>> +     * will differ accordingly.
>> +     */
>> +    if ( info->dabt.cache )
>> +    {
>> +        info->dabt_instr.state = INSTR_CACHE;
>> +        return;
>> +    }
>> +
>>       /*
>>        * Armv8 processor does not provide a valid syndrome for 
>> decoding some
>>        * instructions. So in order to process these instructions, Xen 
>> must
>> @@ -177,6 +188,15 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>           return rc;
>>       }
>>   +    /*
>> +     * When the data abort is caused due to cache maintenance and 
>> the address
>> +     * belongs to an emulated region, Xen should ignore this 
>> instruction.
>> +     */
>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>> +    {
>> +        return IO_HANDLED;
>> +    }
>> +
>>       /*
>>        * At this point, we know that the instruction is either valid 
>> or has been
>>        * decoded successfully. Thus, Xen should be allowed to execute 
>> the
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index cc9bf23213..0dd2d452f7 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -29,10 +29,14 @@ enum io_state handle_ioserv(struct cpu_user_regs 
>> *regs, struct vcpu *v)
>>       const struct hsr_dabt dabt = hsr.dabt;
>>       /* Code is similar to handle_read */
>>       register_t r = v->io.req.data;
>> +    const struct instr_details instr = v->io.info.dabt_instr;
>>         /* We are done with the IO */
>>       v->io.req.state = STATE_IOREQ_NONE;
>>   +    if ( instr.state == INSTR_CACHE )
>> +        return IO_HANDLED;
>
> The request will not be forwarded to the IOREQ, so why do we need 
> check instr.state here?

I think it is not needed for the following reason.

leave_hypervisor_to_guest() ---> check_for_vcpu_work() --> 
vcpu_ioreq_handle_completion() --> get_pending_vcpu(v, &s) will return 
NULL. Is my understanding correct ?

- Ayan

>
>> +
>>       if ( dabt.write )
>>           return IO_HANDLED;
>>   @@ -47,7 +51,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>                                struct vcpu *v, mmio_info_t *info)
>>   {
>>       struct vcpu_io *vio = &v->io;
>> -    struct instr_details instr = info->dabt_instr;
>> +    const struct instr_details instr = info->dabt_instr; >       
>> struct hsr_dabt dabt = info->dabt;
>>       ioreq_t p = {
>>           .type = IOREQ_TYPE_COPY,
>> @@ -78,6 +82,15 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>> *regs,
>>       if ( !s )
>>           return IO_UNHANDLED;
>>   +    /*
>> +     * When the data abort is caused due to cache maintenance and 
>> the address
>> +     * belongs to an emulated region, Xen should ignore this 
>> instruction.
>> +     */
>> +    if ( instr.state == INSTR_CACHE )
>> +    {
>> +        return IO_HANDLED;
>> +    }
>> +
>>       ASSERT(dabt.valid);
>>         vio->req = p;
>
> Cheers,
>

