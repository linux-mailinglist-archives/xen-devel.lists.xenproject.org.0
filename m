Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006C87E364
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 06:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694458.1083251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm5wm-0006Zf-Rq; Mon, 18 Mar 2024 05:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694458.1083251; Mon, 18 Mar 2024 05:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm5wm-0006Wy-OI; Mon, 18 Mar 2024 05:54:08 +0000
Received: by outflank-mailman (input) for mailman id 694458;
 Mon, 18 Mar 2024 05:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/OQz=KY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rm5wl-0006Ws-Cb
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 05:54:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecfef91e-e4eb-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 06:54:04 +0100 (CET)
Received: from BN0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:408:e7::21)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 05:54:01 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::5b) by BN0PR03CA0046.outlook.office365.com
 (2603:10b6:408:e7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 05:54:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 05:54:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 00:54:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 00:54:00 -0500
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 00:53:57 -0500
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
X-Inumbo-ID: ecfef91e-e4eb-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RggYjv+ObU2LeHT9s5h5cWyuKwt0gflImJ37QhfnIhqYNojWMEI+WCuHgPZOZAHznkukncKNTcer0SJEqtdwRWPTeOO9xofNEmGS/WlmwvFAXfAYRBHNIVsZc0oOJRRN6zlCcUJP3A3T2X2ZeOMTO1Ivm68ysxAhSywGI5uQUa0EOs7fj+p/FcvL7pZH8zj3V4Qb8kYm7/6IAEqHXW5wUmNgRq5/ZSHvxlqe7W/spZhJOxbrRhVqGmtoe2Oa84LYKJPqHj8OXiE3AoSpw/W5taxMvsHYiBGHPXYnXcwQYkH47WGmVjqAKkV8qjElRsupQMHjTv7/OIMdmyZSPb21pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ibm2YtqLQ5URCqm23h2BHb2m1bmlA49TcqsiILZjzGI=;
 b=lsPfffCZhVkbYmrh0EJwuRvIhiyLnNQZcRr3CqqOnZb4dxlXwSDL1NWznjV0VjOXt6JYDbJC8AL8ndnYmgjQlA1G7IrM9yuCAgSFStY7xbmloy75bVnLZZJkZs6aObN/om7pdD5CLRQJfyqWAb6Z5saMkenBycUC2XpWWabWFdnNdz5A+GoNnceTEUJewuvUuQn/VBhkMcyguKtF4JUf9q2Yryu6mhFvsBUkP0aQF8AGSICx8s096ruCUNZgM5oxiSJwvRtcx0K+012zaB5aMvPhvMyjdY2Ijz5vvxJSpmeZwFnE498Ps2w1IQJFOuGOkrXCbjHI/7hI1Qe3JIT3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ibm2YtqLQ5URCqm23h2BHb2m1bmlA49TcqsiILZjzGI=;
 b=Eyk10lWeg5ZCumktiYUqUPn01BV704AZ4AFrpxiI6hES0BgIxmnHi72UCXF2Q5bTASuFmqGz1IOoYRZymA5pGL2mU9eKjtm3OI86rjf3NspYQ62bDMEOgvlXQC/ljy0ZnyZTVv2LQ/JgLLY3lwP6EPkU21pKgttbdtnXIH47y2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <86be78f4-cd4e-47aa-94e3-f6c7bf6b3316@amd.com>
Date: Mon, 18 Mar 2024 13:53:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>,
	Juergen Gross <jgross@suse.com>, <george.dunlap@cloud.com>
References: <20240228015822.56108-1-xin.wang2@amd.com>
 <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
 <16838c64-c633-4125-9388-af02e18a89be@amd.com>
 <dc0b86eb-e494-45c9-b1f3-31a9b9f84f77@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <dc0b86eb-e494-45c9-b1f3-31a9b9f84f77@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: cab6fc38-aeb4-42ba-0886-08dc470fcf43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	asWaubEVsnBGqgK71FvoOIWKIxRrM0CImlhQarMZmrWX0/DAjmeEuOlqtPZQJI+uCkIy1uGYvy006a6k53p/SQ5naVsNn5pPCbb+V42H7JG+8irmHD19Kkn1JMtqjTgTC4359/e0ABq96TLPBUF3Bg9m0pQxNutYca1foA8pyXiS9B5bbI4I0lHUTCFJ/SscRbKm2tsrTsJAvy8R3BljYP/J9Syejdvezf7SohtkEwrH1U8Ubvx5m1tFzri6dm1UYsy8Ek9mUsKFtDS/J7++WVrvkQxrTdV4wfeQc39uazVLBEt7E4VFPWb0rbMzrqAmAykhQZuq8y9e3tYQCPKZWUrqgx/Cf73YyWL1TeAsocFrIm0OuTQWvC4KkV5gSQXa8eSdVsVhwmJ92lJzeU/oiW1jD3u0pzpIok6zL9UbWYU4qa7OzHVRfo+6c+M0yImSyWrh77FVUQ8v9JtXkOA2xPJ28YoX2pfbHlCp+5XFQ0wKf0sqRG9HQ8YNVCI47YWESr421w+qQaKp0jbBiManes/O5ohR6v2s7JUeus5C29RxGuXWMPUtfnp3n2rkJw4vWgPQ2xeNBjDXvKpehI4hFoaa/i6pBwhYQ+2x1tuiq7TOomJoLap7HBILSU8/2Yyh/FnOy+Hgt62r/x6pi5dDQIFpDe3P/zU+D4082VNx6lfhilUDY++QOXxDiSF66cGmb+puRSPowj4v6z9ffPSv1eXVrJcCDisr1PwkkUBqidBqLuPeDyvOIHKdP4sgqfrO
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 05:54:00.6813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab6fc38-aeb4-42ba-0886-08dc470fcf43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456

Hi Julien,

On 3/15/2024 6:58 PM, Julien Grall wrote:
> On 14/03/2024 14:22, Henry Wang wrote:
>> Hi Julien,
> Hi,
>>>>   /* representing HT siblings of each logical CPU */
>>>>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>>>>   /* representing HT and core siblings of each logical CPU */
>>>> @@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
>>>>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>>>>       cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>>>>   +    /* Currently we assume there is no multithread. */
>>>
>>> I am not very familiar with the scheduling in Xen. Do you know 
>>> what's the consequence of not properly supporting MT? One thing I 
>>> can think of is security (I know there were plenty of security 
>>> issues with SMT).
>>
>> Unfortunately me neither, so adding George to this thread as I think 
>> he can bring us some insights on this topic from the scheduler 
>> perspective.
>
> +Juergen as he worked on co-scheduling.

Thanks.

>>
>>> Depending on the answer, I would consider to print a warning and 
>>> maybe add it in SUPPORT.MD in a separate patch.
>>
>> To be honest, as discussed in v1. I think I am quite tempted to add 
>> an ASSERT(system_cpuinfo.mpidr.mt == 0) to make sure we catch the 
>> multithread support stuff earlier. 
>
> ASSERT(...) is not the right solution. You may have user using a Xen 
> shipped by distros where this would be a NOP.
>
> We could try to hide MT completely from the scheduler. If that's too 
> difficult, then we could add use warning_add() to throw a warning (see 
> how we dealt with opt_hmp_unsafe).

Ok. Let's first see what George and Juergen will say, if MT cannot be 
hidden from scheduler for Arm, maybe we can add something like below:

if ( system_cpuinfo.mpidr.mt == 1 )
      warning_add("WARNING: MULTITHREADING HAS BEEN DETECTED ON THE 
PROCESSOR.\n"
                               "It might impact the security and 
stability of the system.\n");

Kind regards,
Henry

