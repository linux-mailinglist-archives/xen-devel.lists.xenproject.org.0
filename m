Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89754E440D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 17:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293580.498758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWhBh-0006PI-Pe; Tue, 22 Mar 2022 16:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293580.498758; Tue, 22 Mar 2022 16:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWhBh-0006NF-MA; Tue, 22 Mar 2022 16:16:49 +0000
Received: by outflank-mailman (input) for mailman id 293580;
 Tue, 22 Mar 2022 16:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ed4I=UB=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nWhBg-0006N7-7X
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 16:16:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77bc8d9f-a9fb-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 17:16:46 +0100 (CET)
Received: from BN9PR03CA0802.namprd03.prod.outlook.com (2603:10b6:408:13f::27)
 by MN2PR02MB6079.namprd02.prod.outlook.com (2603:10b6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 16:16:43 +0000
Received: from BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::94) by BN9PR03CA0802.outlook.office365.com
 (2603:10b6:408:13f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Tue, 22 Mar 2022 16:16:43 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT029.mail.protection.outlook.com (10.13.2.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 16:16:42 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 22 Mar 2022 16:16:41 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 22 Mar 2022 16:16:41 +0000
Received: from [10.71.116.49] (port=60610)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nWhBY-0007tG-Ve; Tue, 22 Mar 2022 16:16:41 +0000
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
X-Inumbo-ID: 77bc8d9f-a9fb-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk18KJ1ezbzN6e4EEeU/XL1dzKhSdU+leFCgCRtWIl70oUhefnOhKf24U9g7NhM4AbuUf0wWbUdcFQXpHqP8SM/UevIwGluvFj4IR0abBKO2YRgs48NeE44tVO0XwOOeURcZSZuniM63wWhBgtAva4nMmwGHWMkILjDYyKr91Hdl/C2AXNEinqm5OfO2BJY/1nG+YXV9eXAg7XmuK/lrzJLIbAzwBZA51VU+DUjlKwf+XsUKPVT9NG6J0ZuA/tTD6ZUEZqU4gkPd7We0T/89M2v1oWnXrqaAWMhWxz2HixARVj9VPfjGKWCwJllPuTX5LDl33mmtQsw3wpeF1zhRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8csOx1lAskIARzGghth/FfaFB8R/uwOmnUfVqZdjng=;
 b=MleMXjAMPqPqOjzKvLmbVXJ+vTg2BT2qSZoDtZan9V9Svy0/Foz0hNNSLBFyFoWwqypfxUyFZ4MMSty3WDWBE4MXq0mfSIovTCXAn025FMiqJhx+6F4b+7qioBHAW+GZg4gAx7ICmwC5ZeMv8Qgurg6tdMnHvWTIv56THcvQA4WY9aaQZvhXgNmRPw9jR2G9apff0L7OLJEMeNZBM2jNUlzoiB7fYUTpjpZhUvMl3HBsbucoq6yRBX8TVcl9Jo11FRfQny037bp8smbBTk2A0UHmKO6bZ6Kxq0nC+vHRpJs6CfN4RAcpPJzTqevkRjKjSbKcNXUNQCPVPuar7/w0Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8csOx1lAskIARzGghth/FfaFB8R/uwOmnUfVqZdjng=;
 b=NvAQ6f19gxIjsX1hhmNrvcc2vCkTH4Cq0tUhezH0TB1X0CdwcQJp63RqVqG9+p38e/zzgvsbk1SI5YzhZV033reMopQYn4vC5wEGrKQrrXZET3ve5jGkRuZ3xc5R5tWBsXCAbh1D2AZC3wZ3X7Qir2fJQ18gvvOIrTStP2ZlsPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <981cb69d-5bec-875f-a921-bc0fa0c11782@xilinx.com>
Date: Tue, 22 Mar 2022 16:16:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
 <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
 <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
 <9bcab961-8ae1-9e9a-c6da-682aecf2a138@xilinx.com>
 <c7296ea0-5236-1a10-8ef1-74ec83456ce5@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <c7296ea0-5236-1a10-8ef1-74ec83456ce5@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f37bd239-bf61-4afd-7628-08da0c1f5aad
X-MS-TrafficTypeDiagnostic: MN2PR02MB6079:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB607951CA336E352D827EC979B2179@MN2PR02MB6079.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQBckeJF3y5CuWmn5Onk3pFgcFGkzGIZOvLJdTbaCKYIUUJpNhWJwT7mi7WY9NbMGQi85/m09Lxqv4TNwo+dCgCjoJCm82yq9WnBkweYHZw3ryT7YQwu6wx6keH3oG90NF/1u611owUSv/e30lX55PT0KKavQtjg97bILvJMLgwZJyPypltM3A6O1pojlvPh4iTB4fKXHnjLIXWSgaP76sNvGMRtaiCcH7oFtSVx2AHY95yjx8TDW1o1To/XWKzeauvaZycJprfCg3fjhfHKH8jjGel3dhC+nU1ZTWqEF1/lk8lffebpfR9sqPx4Vux2c4M7/9DltkfCH0ZhJGGtKxBFsbNT97CpzbrHXXwsAJdKBzU93wUtsLQ9GNyA33e7/Nuo1u3fopGco1lxetq3iW9UVOAX5i/BTg6PEnDuwqpLmpDUcSeiYWGZNjH2SrWXju7U2JbeIqu1pX7tBZyfrh57+zU+zNysiNMDvCOARKBB73ZfnzcAG+d0Owil+SNMUA2LfKN3XoOeJKHGvYVrcK7sukG0aN3SzreE1katOihGAVw0zCflHDivU+iABrHqMY9/AIUniStxjnVi24taDf37JVZilvRgo2pOPvwd+JYy4p9cHWAfYcs0EeRQpyb3g74BTej1/vqyYk1higOcQghTXiBjQOBTU4Sjj3Td2jocO1D3ctHwJd/Vb9IIJ53SgbnYl7QKgzpmuzBSlJCbXNpXKHdfw9UcaLn6iooaRkA=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(9786002)(8936002)(36860700001)(4326008)(7416002)(31686004)(40460700003)(5660300002)(2906002)(8676002)(70586007)(70206006)(508600001)(7636003)(53546011)(2616005)(356005)(110136005)(54906003)(31696002)(36756003)(336012)(316002)(47076005)(426003)(186003)(26005)(82310400004)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 16:16:42.9464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37bd239-bf61-4afd-7628-08da0c1f5aad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6079

Hi Julien,

On 22/03/2022 13:22, Julien Grall wrote:
> Hi Ayan,
>
> On 22/03/2022 12:38, Ayan Kumar Halder wrote:
>>
>> On 22/03/2022 12:06, Ayan Kumar Halder wrote:
>>>
>>> On 18/03/2022 18:26, Julien Grall wrote:
>>>> Hi Ayan,
>>> Hi Julien,
>>>>
>>>> On 17/03/2022 14:00, Ayan Kumar Halder wrote:
>>>>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>>>>> b/xen/arch/arm/include/asm/mmio.h
>>>>> index ca259a79c2..79e64d9af8 100644
>>>>> --- a/xen/arch/arm/include/asm/mmio.h
>>>>> +++ b/xen/arch/arm/include/asm/mmio.h
>>>>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>>>>        * instruction.
>>>>>        */
>>>>>       INSTR_LDR_STR_POSTINDEXING,
>>>>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>>>>   };
>>>>>     typedef struct
>>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>>> index 6f458ee7fd..26c716b4a5 100644
>>>>> --- a/xen/arch/arm/io.c
>>>>> +++ b/xen/arch/arm/io.c
>>>>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct 
>>>>> cpu_user_regs *regs,
>>>>>           return;
>>>>>       }
>>>>>   +    /*
>>>>> +     * When the data abort is caused due to cache maintenance, 
>>>>> Xen should check
>>>>> +     * if the address belongs to an emulated MMIO region or not. 
>>>>> The behavior
>>>>> +     * will differ accordingly.
>>>>> +     */
>>>>> +    if ( info->dabt.cache )
>>>>> +    {
>>>>> +        info->dabt_instr.state = INSTR_CACHE;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>>       /*
>>>>>        * Armv8 processor does not provide a valid syndrome for 
>>>>> decoding some
>>>>>        * instructions. So in order to process these instructions, 
>>>>> Xen must
>>>>> @@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct 
>>>>> cpu_user_regs *regs,
>>>>>           return rc;
>>>>>       }
>>>>>   +    /*
>>>>> +     * When the data abort is caused due to cache maintenance and 
>>>>> the address
>>>>> +     * belongs to an emulated region, Xen should ignore this 
>>>>> instruction.
>>>>> +     */
>>>>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>>>>
>>>> Reading the Arm Arm, the ISS should be invalid for cache 
>>>> instructions. So, I think the check at the beginning of 
>>>> try_handle_mmio() would prevent us to reach this check.
>>>>
>>>> Can you check that cache instructions on emulated region will 
>>>> effectively be ignored?
>>>
>>> Yes, you are correct.
>>>
>>> I tested with the following (dis)assembly snippet :-
>>>
>>> 0x3001000 is the base address of GIC Distributor base.
>>>
>>>     __asm__ __volatile__("ldr x1, =0x3001000");
>>>     40000ca8:   58000301    ldr x1, 40000d08 <main+0x70>
>>>     __asm __volatile__("DC CVAU, x1");
>>>     40000cac:   d50b7b21    dc  cvau, x1
>>>
>>> This resulting in hitting the assertion :-
>>>
>>> (XEN) Assertion 'unreachable' failed at arch/arm/io.c:178
>>>
>>> I dumped the registers as follows, to determine that the fault is 
>>> caused by the instruction at 40000cac.
>>>
>>> HSR=0x00000092000147  regs->pc = 0x40000cac info.gpa = 0x3001000
>>>
>>>
>>> So, my patch needs to be modified as follows:-
>>>
>>> @@ -172,7 +173,7 @@ enum io_state try_handle_mmio(struct 
>>> cpu_user_regs *regs,
>>>
>>>      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>>
>>> -    if ( !info->dabt.valid )
>>> +    if ( !(info->dabt.valid || (info->dabt_instr.state == 
>>> INSTR_CACHE)) )
>>
>> Actually this is not needed.
>>
>> The following change is sufficient :-
>>
>> @@ -146,7 +146,9 @@ void try_decode_instruction(const struct 
>> cpu_user_regs *regs,
>>        */
>>       if ( info->dabt.cache )
>>       {
>>           info->dabt_instr.state = INSTR_CACHE;
>> +        info->dabt.valid = 1;
>
> To me, 'info->dabt.valid' indicates whether the syndrome is valid. We 
> set to 1 for emulated instruction because the syndrome will be updated.
>
> But this is not the case for the cache instructions. So I would prefer 
> if it is kept as 0 and use your previous suggestion.
>
> Furthermore, I think try_fwd_ioserv() need to be adapted because the 
> function will use the fields SAS and SRT. From the Arm Arm they are 
> RES0, so while they are 0 today, we should not rely on this.
>
> Therefore, to be fully compliant with the Arm, we want to reorder a 
> bit the code:
>
>  * The field data could be set past ioreq_select_server().
>  * The field size should be set to the cache line size.

I am assuming that we need to invoke  dcache_line_size() (from 
xen/arch/arm/arm64/cache.S ) to get the cache line size.

I think the cache line may be 32 or 64 bytes. In which case, this cannot 
be represented by SAS (as it can represent 1, 2, 4 and 8 bytes).

Also, we are invoking ioreq_select_server() to determine if the address 
is emulated or not. So, can we use an assumed size (= 1 byte) ?

If it is emulated, Xen will ignore the instruction. If it is not 
emulated, Xen will forward the abort to the guest.

Thus, Xen will never execute the instruction. So the correctness of the 
size should not matter here.

- Ayan

>
> Cheers,
>

