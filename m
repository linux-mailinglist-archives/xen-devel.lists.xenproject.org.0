Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F988562A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696259.1087017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEJu-0004Si-Ng; Thu, 21 Mar 2024 09:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696259.1087017; Thu, 21 Mar 2024 09:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEJu-0004Qd-Ks; Thu, 21 Mar 2024 09:02:42 +0000
Received: by outflank-mailman (input) for mailman id 696259;
 Thu, 21 Mar 2024 09:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqq3=K3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rnEJt-0004QW-5w
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:02:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38795bd-e761-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 10:02:38 +0100 (CET)
Received: from BYAPR07CA0054.namprd07.prod.outlook.com (2603:10b6:a03:60::31)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Thu, 21 Mar
 2024 09:02:35 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::24) by BYAPR07CA0054.outlook.office365.com
 (2603:10b6:a03:60::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 09:02:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 09:02:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 04:02:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 04:02:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 21 Mar 2024 04:02:31 -0500
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
X-Inumbo-ID: c38795bd-e761-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D96gxX9HCXLRXxAh4xnlSEY8JcIdwzmHbl4QITlWHM1jTdwFkHFBweFvt+cqKyWEYa9bOiBgcwxvt1we115KlKL39Agoe/j4NCNJ46DnnLJokDEPAn4Qg22ZnWd8wBLibd/NIV71QjYPa6Vl9fisRw9/w3pl/1nsmTPWXbC/nF77zOFKkbW2Hxreu4cR0GpjxyLYrqe1AnyNeIBTpk1mqAe9kYADQKHMsftafCmHKUJFeldmz2bvjVTpvhUN/JCicQKCm64yWBfjRlIrx/9aX6favxvR7c+2vxOMd7wfil2bnvkCZ+XoXx2bFvE8Dihn1FA3G7azrbb4Q4Ly5gU7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYrAFQWW78PjnbM8VlrzHlBGUVcsNSReRu4Aft2X2aY=;
 b=iFyXPAai/6ZVWlfuAxtNgSh36x21KtMMFE3YHVBXKS7OVNO9papMazfr9tV+LuFBiysIN1tNAnP3U69nZi1K9HEBmNq5z+CT4Liz/hS2NxvuBZj+nBSbB9xo9v8P+if0lPM6VrX2OT5+HbzQ/Dd6i0CNVX5DhNzw+syu6dBKkDRSmIgmNdHDOM3qtG1bp12R6Vw6IQAWlHGx3uSAKhMsr4r8aiAPTMHHbLytWSH2wWg5JxOQMcR3gOGoTsFQK7EyyqeYeizNHPbtCoWYNYGXo6qpogHHL2877Gw/YHccR45SRFMcurXPTlL4n7nVMQdIrjxJWzwzjquHLvGbaWkrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYrAFQWW78PjnbM8VlrzHlBGUVcsNSReRu4Aft2X2aY=;
 b=nhG3KtPbsERaRtt9j+tS80s4rfsCwtDj/8FoM8xucekdXlm3iEYFIQSJouKghb0/95b9fRN8bepj13OhXu3W3jSH4lUM6l7S9HCqazOfDNCqc2Q+zXMsWyPfj3LK4UXahQiypExQhJ0z+iC3+3RcaqP6ctN2xI6Wfo6EHjxrPw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f435014a-b36c-48ef-b6ab-2713452afa41@amd.com>
Date: Thu, 21 Mar 2024 10:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] xen/arm: Avoid code duplication in
 find_unallocated_memory
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-7-luca.fancellu@arm.com>
 <3bd5d32c-d2e6-4e53-8b3e-aa7fdd058c71@amd.com>
 <280936E1-27DC-41FA-8E3B-080CA562A7B8@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <280936E1-27DC-41FA-8E3B-080CA562A7B8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9b496e-ce1a-4328-21db-08dc4985a625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iFw6r9FopXOwbe+5EGX0YoCV1iUCIcTE5rzcIOMw/XJb0n1LtQAhao/GeQUVSB1XPHB7QthN5ngeiOfzgdbUefBLvIbksLCjfQwZP/tD6ZAklV8NsOh51L/s3I6V6QFOWHBVeQyib33KISK50NTUhjCLM3oxGSUJWY0VZ9NusV3m3beufHBQ9nNYZH3cQ5mmZjPzekOb0U6AKf4Qs+Hf4DN2RMlalvoQ7JA9x23Crr7feEwI3v6vuky0CHgO65U6QKNFbmrAkM28YbDsS6eC9XcZ+YfTyMgMjhfwPJEqlleBQOvjk60Brny5kafytFUlhK8FeXjuuW37IHwKbljoioWVRLNtWHmggT24dBBWp35Br4RZMSn0EAQENcGW57DOp6zvu7qaUTzEpZz4vIPgt757XkjSWKk0nXJiNPeG1kFKGpVSK0hciuO61m0pxZPFZueUeJSYgw57o2QKIW0uu7dm1EOTY1RJloPyNI2hDsshcldSJH7AZdTNtkRGruuTt9bEbhiXd+vuyLH0viFkyjmSZx+6rttcQL1jAg8TvnOc3zkjVBZkFRo4qiio2PbYMFQVvHIk+Ud3le+YPrrYStNLaVOrKXoItbAg3juUtrEw7nEaI6+u0RmNWAI9mCq2p+gKJytSpWWJi9MHdWREnlmqbjLeG7lpheQOzxW4VMoW7G3ihsEeBoeEYGy4qCGcuzr8wLBIRQkhF5k62ARIMndMztvdJ1cQZFKV8CQG8/l0g1V3IhDzf6RmToZvMBaB
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 09:02:34.5290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b496e-ce1a-4328-21db-08dc4985a625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664

Hi Luca,

On 20/03/2024 15:53, Luca Fancellu wrote:
> 
> 
>> On 20 Mar 2024, at 10:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 12/03/2024 14:03, Luca Fancellu wrote:
>>>
>>>
>>> The function find_unallocated_memory is using the same code to
>>> loop through 3 structure of the same type, in order to avoid
>>> code duplication, rework the code to have only one loop that
>>> goes through all the structures.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/domain_build.c | 62 ++++++++++---------------------------
>>> 1 file changed, 17 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index b254f252e7cb..d0f2ac6060eb 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -869,12 +869,14 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>>> static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>>                                           struct membanks *ext_regions)
>>> {
>>> -    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
>>> -    const struct membanks *mem = bootinfo_get_mem();
>>> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
>>> +    const struct membanks *mem_banks[] = {
>>> +        bootinfo_get_mem(),
>>> +        kernel_info_get_mem(kinfo),
>>> +        bootinfo_get_reserved_mem(),
>>> +    };
>>>     struct rangeset *unalloc_mem;
>>>     paddr_t start, end;
>>> -    unsigned int i;
>>> +    unsigned int i, j;
>>>     int res;
>>>
>>>     dt_dprintk("Find unallocated memory for extended regions\n");
>>> @@ -883,50 +885,20 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>>     if ( !unalloc_mem )
>>>         return -ENOMEM;
>>>
>>> -    /* Start with all available RAM */
>>> -    for ( i = 0; i < mem->nr_banks; i++ )
>>> -    {
>>> -        start = mem->bank[i].start;
>>> -        end = mem->bank[i].start + mem->bank[i].size;
>>> -        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
>>> -                                 PFN_DOWN(end - 1));
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
>>> -                   start, end);
>>> -            goto out;
>>> -        }
>>> -    }
>>> -
>>> -    /* Remove RAM assigned to Dom0 */
>>> -    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
>>> -    {
>>> -        start = kinfo_mem->bank[i].start;
>>> -        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
>>> -        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
>>> -                                    PFN_DOWN(end - 1));
>>> -        if ( res )
>>> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
>>> +        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>> It might be a matter of personal opinion, but I would actually prefer the current code
>> that looks simpler/neater (the steps are clear) to me. I'd like to know other maintainers opinion.
> 
> Ok, I’ll wait the other maintainers then, I’m going to use this construct in other part
> of the code to simplify and remove duplication so it would be important to know if
> It’s desirable or not.
> 
> Maybe your opinion could change with a proper comment on top of the structure and the loop,
> listing the operation performed in order?
> 
> 1) Start with all available RAM
> 2) Remove RAM assigned to Dom0
> 3) Remove reserved mem
> <later>
> 4) Remove static shared memory regions
Yes, that would help with the overall readability.

~Michal

