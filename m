Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4087BED0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693281.1081181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklz5-0002Mn-VQ; Thu, 14 Mar 2024 14:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693281.1081181; Thu, 14 Mar 2024 14:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklz5-0002Jj-SN; Thu, 14 Mar 2024 14:23:03 +0000
Received: by outflank-mailman (input) for mailman id 693281;
 Thu, 14 Mar 2024 14:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=95xY=KU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rklz4-0002Jd-Bj
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:23:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d10820-e20e-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 15:23:01 +0100 (CET)
Received: from BN9P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::21)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 14:22:52 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::1c) by BN9P221CA0027.outlook.office365.com
 (2603:10b6:408:10a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 14 Mar 2024 14:22:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 14:22:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 09:22:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 07:22:51 -0700
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 09:22:49 -0500
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
X-Inumbo-ID: 59d10820-e20e-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wjz7BtwncGPKeICgjbJ2O+KTIsRtbl6x+dQmYxsup/BGwmaxsmFMkEWNBzRWWWGzkSoGTzfVQDkXmTdXxSh+WEh5tIWcn0RzNTKjbKmZ7n2CvijpYEl6FskOmE4/uksFqw1ulRqV9tjpANJm3h09MspLf0Zy4NxLBnSQ09Bve0vRa75zqDHQsNbj141FMPIUVAz9iQm+lUPztETcEmsBMheHw5cnGr9dNe86mjfif3gdqdvJ+CuP68IUcheCXrBOBEhcwNLFSKfSYxdU4UsyHJv/ud3+5c6EDTGNCuneHq14s1y8xltkkVdXJ4TiwXZoJPdqHzpH780zybO/JJWegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7kvXzE3vgZ5ZBPCne65+lAl7sJC9Zn4ki+5/yEAF4A=;
 b=WKmtrqGkJR3X+In0+gWCHvW8d6ajQpWHl6kbQFU5umEHZexe6KHw+xg07di4IyV7BvsfUFHQnys3qikavg4lzQcHyKaM8GdHvYAAB0AFizAwUpbx61DpIHNesIl63Jscet/ZwMQlCueHO3AxnL39xZZres2huLC7E1EeFQs/CKlCvjb1/HcGADHWdWNvy0KStdGm21ZwITZQx7fKhc+m99bUsqkQmy5qjB2m5UYQbWeKfHz18W+UYy6j0zsknmkVG1VM62f+QKG8/MwotItXMxxF2WYz2Fw5x+l20Bo3k/LFbTrO8lAYTpT65C6bVkBwag8u1cbDASGyq8DPO/yoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7kvXzE3vgZ5ZBPCne65+lAl7sJC9Zn4ki+5/yEAF4A=;
 b=MwDEb64+Mb3gU8NRGQ+2Hi3EAaPpEza6hlj1gbjTW7EZcAmPqO3toF6OriBQCVljgIV3sdpjFgQPpRFWNBNUAZenwwsDRfd0i72icWcNy13X+tk7q8f+P1zXI19ZR/Ti6cKTC1scDBZJinHh33AmcQawV9I77W45lvY4nI3qsDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <16838c64-c633-4125-9388-af02e18a89be@amd.com>
Date: Thu, 14 Mar 2024 22:22:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>,
	<george.dunlap@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
References: <20240228015822.56108-1-xin.wang2@amd.com>
 <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 523380af-343a-4f7d-53d6-08dc44323bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQpNxn2UTDEMqrVLrd5gcy4pM5QflLZkzmLsp5vnUTDL10QIUtFAVbpVDmv9jS4dMxkNZ5qp7cYWYnshOQEV3b+lo2ypBCu3kzIK79cwGZEltmc46JAIRI9BrMLqgE+FKHkvQg4ZdnedOuoiTGZp0DGi7US7BPfIFVgLdgiPP8KipknJdON0X8BZ3DSra2q58fSm3hP/yB6q5vng8Avscp+tt1AhW8W/dnpH9kjbBTBmSXzPY6+i5PBU9xd9G8FiT0A91kgEmGU7x7YHpIAaWwmCyQaS8k2WB39kierOQTeU7EjwmniEfq0om6UO0qjybtgcTeLQbdq3C5VJosX0FS4yaPV/qHHO1lCBbf4YpECYsfKv3FAvioBBO8nHdfza9Jm8yjPSswT4qZCpRgkkW42xo9M/mn0xwb/QFuUpI26/9lIS6wp6E7Wz2+Te/fWCSOFav/KqoqyOU3K+vL43nJmjhlUx3v8gQo30jRv3ZwUoiJwbL2i/+tujCusgifrGtnl1f4N6Ks6/mTMW57nMzvHPe/TZvUv01/5oDMrh+foTjn2PbNolZiXQMV/YL1bSHZDOZBCiVZrSs4OhTMW5b+PI3CwZ9OsGd4reySvMQHrXqulhE0bsj1efnE3OChRntWmzg1fQgfN8bmXZpO1NRDZWz+O0qee6vut+tzAuCprFiC1DOb/JnKkcJ3AtbG3Hzp7u3e+ynG6aLMNgd5xAFhDmk4HBfyf14xXUVtt8SBG3aY/nKdloH74MegbS5sQ7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 14:22:52.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 523380af-343a-4f7d-53d6-08dc44323bc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

Hi Julien,

On 3/14/2024 9:27 PM, Julien Grall wrote:
> Hi Henry,
>
> On 28/02/2024 01:58, Henry Wang wrote:
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index a84e706d77..d9ebd55d4a 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -66,7 +66,6 @@ static bool cpu_is_dead;
>>     /* ID of the PCPU we're running on */
>>   DEFINE_PER_CPU(unsigned int, cpu_id);
>> -/* XXX these seem awfully x86ish... */
>
> :). I guess at the time we didn't realize that MT was supported on 
> Arm. It is at least part of the spec, but as Michal pointed out it 
> doesn't look like a lot of processors supports it.

Yep. Do you think changing the content of this line to something like 
"Although multithread is part of the Arm spec, there are not many 
processors support multithread and current Xen on Arm assumes there is 
no multithread" makes sense to you?

>>   /* representing HT siblings of each logical CPU */
>>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>>   /* representing HT and core siblings of each logical CPU */
>> @@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
>>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>>       cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>>   +    /* Currently we assume there is no multithread. */
>
> I am not very familiar with the scheduling in Xen. Do you know what's 
> the consequence of not properly supporting MT? One thing I can think 
> of is security (I know there were plenty of security issues with SMT).

Unfortunately me neither, so adding George to this thread as I think he 
can bring us some insights on this topic from the scheduler perspective.

> Depending on the answer, I would consider to print a warning and maybe 
> add it in SUPPORT.MD in a separate patch.

To be honest, as discussed in v1. I think I am quite tempted to add an 
ASSERT(system_cpuinfo.mpidr.mt == 0) to make sure we catch the 
multithread support stuff earlier. I don't really know what will happen 
if running current Xen on top of a multithread-implemented processor, 
probably it will be fine, but probably some strange behavior will happen 
after the boot time which I think will be difficult to debug...

> Also, looking at the v1 discussion, it sounds like even 
> cpu_sibling_mask would not be correct. So I think it would make sense 
> to move the comment on top of setup_cpu_sibling_map.

Sounds good. I will move it in v3.

>> +    cpumask_or(per_cpu(cpu_core_mask, cpu),
>> +               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
>
> AFIACT, per_cpu(cpu_core_mask, ...) will now be equal to 
> cpu_possible_map. In that case, wouldn't it be better to simply copy 
> the cpumask?

You mean cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map)? 
Good question...I forgot if there was a reason behind this back to the 
time I wrote this patch (it is likely just me being silly). But yes 
definitely I can do this way in v3.

> This would also allow to drop cpumask_set_cpu(..., cpu_core_mask) above.

Good point. I will drop in v3.

Kind regards,
Henry

>
> Cheers,
>


