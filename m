Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEBF8C9812
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 04:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725800.1130133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8tDi-0006Vy-8U; Mon, 20 May 2024 02:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725800.1130133; Mon, 20 May 2024 02:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8tDi-0006Sr-5g; Mon, 20 May 2024 02:57:50 +0000
Received: by outflank-mailman (input) for mailman id 725800;
 Mon, 20 May 2024 02:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8tDg-0006Sl-K9
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 02:57:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba2177f3-1654-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 04:57:43 +0200 (CEST)
Received: from MW4PR04CA0245.namprd04.prod.outlook.com (2603:10b6:303:88::10)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Mon, 20 May
 2024 02:57:40 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:88:cafe::67) by MW4PR04CA0245.outlook.office365.com
 (2603:10b6:303:88::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31 via Frontend
 Transport; Mon, 20 May 2024 02:57:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.0 via Frontend Transport; Mon, 20 May 2024 02:57:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 21:57:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 21:57:38 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 19 May 2024 21:57:36 -0500
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
X-Inumbo-ID: ba2177f3-1654-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB83k6Zp9lrH/EEKcJM33MSk5dM14P4VbHlKsl1oJVlwtXqN2/hbSUjLL+NiV5Q4N9IIABy66XnbPbV2QN6t4wzdiBp6R1Qo8FSGHtYg67iXhQu08V8dI4HPuZvPQfFw3GrHDc4+OEGFe+8FHVxhxoCGDj473QyTFaHmLYYD9eaKfsjiA8uyc6KAXsA5i6e9WYauqJUvwdyjmxZe80D+hTWHzr//xkD01oYqleAD0xpeuciRkucLLuWVEGAWnMhnsqxv9iYZDAnSkMLFNgRa7EpGFsOt0fmEBFjIWa+ejuOxU3NaMo9mCTQeMr+24tspGUM3CJf5RM+DO4UanfVBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF50HH6PrPfTAjlX9fenu08DnzjytRDXcilNX+Rd5HQ=;
 b=c0rac++A2sIBx/52m4xsyw7ItqyF+gES+25SaGvZWvleaUEPhToHA1NB49PV/aT7EYe1xCQLUEK40pr+Cb/UJks+AMp5VJMvnIJvgrtHzauyWHphdcsjBn1PEosTmlyq1tXE0CrYMXUsKvc9wzxASs15NmU6Fq3R8g9sbaO7Ab3E8IQtHBDxLZutnEG7RWtUqqsSHG2dha5QV6hZ+5B3UemDx+UlTVSGwOh+8xaC2JOdzWMHxCCyBfMq3kPC9hXB0lhjPMbNofgkYFM/oyLxY1mi4jQHTB7pS1VC+w+6sc5AixVi5G2+/5bOzliHH4ESH/gtqPshREBY/J7kDCVR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gF50HH6PrPfTAjlX9fenu08DnzjytRDXcilNX+Rd5HQ=;
 b=CInDUVa69L65fOybHkoBIcKb7iVYh52wnDMTGRoLJu2LowaqDZjMJUXoSCtvSTO1Bg0ynQAkrhXPITkTNnHH499PQLht1sQB6E8M6QNAfu/dRulO51hbLjFohMwYAjQxYtQg2PDpAGoKNnTpdzjI+AJihQzgss+iKWP7Gq2uOG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9deeb66d-1a69-442e-a860-08006067ff44@amd.com>
Date: Mon, 20 May 2024 10:57:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Set correct per-cpu cpu_core_mask
To: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
References: <20240321035706.165253-1-xin.wang2@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <20240321035706.165253-1-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: f7612c30-13d8-4096-15fe-08dc78789c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0FLMlBrb1VCSTI5Y24wUFVZd1ZPTlZOZUJ4clFJUS9Ja1M0aXFhRjYvVXBp?=
 =?utf-8?B?Y2xvSGRaM3VMUk4xemhQSXR6U3R4NlNISFEyWGJKNCtaV0tIUHR1WGVkUUJz?=
 =?utf-8?B?a3VyanNQWTFPRHFacjJLZzEyMjVOcmJjZUFEUUZqTzVLUHBnUUpWUGVhR0cy?=
 =?utf-8?B?OG1TMHJoU3hxVEdrQVBadmQ1dXphVDhZSVVCODQ3QVRDVEdJWnN1STZ1UGtN?=
 =?utf-8?B?VlFsNXgxcnArS2FzUlViTnd2TURjZ3lkTWJaMVZsdjM4alZvQzZlRHc4aFRP?=
 =?utf-8?B?UDl6ejFZenpCZnJvSjd0dDl3NDFxbzZicFhaZEk5RXVaQVRpenNPOXpkdlBJ?=
 =?utf-8?B?SjdZclE5SG1pa05DMWVBcWdwQms0dERDQmM1cXdqamI4b1ZZRDRMMjFuQ3Iv?=
 =?utf-8?B?am1tZXZ2N0VPb2t1Q2YyRmpyM09YNmp0cjVEU2Jvay95VEpUZll4T2RobkV1?=
 =?utf-8?B?SzFMTVpiQUdaUlpUcGhFdmdQWld1b0VwcmdsSjdGQUU2SUJJb3hCUXgyZXlK?=
 =?utf-8?B?NHJoZDdQTWo2STVrM3RWZmFCWUhoaW5sam1HK3ZlVGtKY0xTa25HUDRGNDJk?=
 =?utf-8?B?S0liYklIS0lqUS9ReDJkdm42c0RiNjlGSk41NkhFbnowNk1vUXpjdnFKWTJr?=
 =?utf-8?B?UVFFK0RxcnM3VndHOGExNUtveTNKL25QYmI3ckdBdk1NSEQ1by9NL2RLZlpa?=
 =?utf-8?B?MXVibmZjU0ExR09YZVdHZWpkbW16Y1ZpWUJaYkIwRUtGZDdtRTduV1FWWHgx?=
 =?utf-8?B?S3V5WjVNOHNDaTZudTBMSWFMRWE2MnNFdlZZbzdPRzNYVjk3WHUvRXlXNkdp?=
 =?utf-8?B?MHpXb21udHVpNWw5TVBaM09VZ2NJNGxKZGJ3b29hN3k0UXUvLzh3NzhaeGNX?=
 =?utf-8?B?ZTVrVkVJaU80bmNXR1FWcXA0ckZFdkdhKzVXOExEeThFZTJFelhOZEFXdHlq?=
 =?utf-8?B?ck9xN1ZRYjRiYUU1QjhHS2F4cnQvQ3NTQTlnZ3l5SEoxeUZseG9XdUNuMmRH?=
 =?utf-8?B?SHN5NU1lN2NwZlNZcllxWGs5cFV5YkNpSWUxSGJiOTdyL1cvcStQdUNWUjhy?=
 =?utf-8?B?RlhGaFNTc0cyTmFqNWVGUzgwQzVQTnUyMTZJYm5KQzNoM2RveFZvbDE5RjhX?=
 =?utf-8?B?NU9GTlNEdFVtUHozc2pCUHJnU2dubXhpSDczRW05eS9nbFY4WDF4M0lPeTg5?=
 =?utf-8?B?emRnR21ZTGhSQUI1QktmQytGbTFWSlk3VTBWb2g0WnZkaXJ1RFRmWWw3MWli?=
 =?utf-8?B?Tm4zbk9CRmR2dXl5MVk0clN6cUx5S1o3cE1tc0VHbjFoMEpRazJnUE92VlZt?=
 =?utf-8?B?Q0RXVi91NlVzTzQ1KzNFODZXeFBXaDVoYzFrSlhoeUdXdVNqVUJGdWozOGRv?=
 =?utf-8?B?bXBKajk2bklPcGpydEpZOVZ6dFc0eGFPT0JEcXNaRkE3TVJvQ3NkRk14SVA1?=
 =?utf-8?B?Si8rbWlOWUdWTFNFeFFEVW5lc09vTVAyNFNVNTN1aTZMQTJxL0hYZm03RVlO?=
 =?utf-8?B?UVhTYnVQcXBMbDBRNHFPN3o4bVQzWFA5eXFsWTh5OFV0dUNVSUFJU09pQjlo?=
 =?utf-8?B?MWVMOC9GRlFCZ0RFTXFFemdEYktVUjd5ZHVwTUhabFY5L1NGZzVCM2c0N0xs?=
 =?utf-8?B?ZXBiUUJHSHFXS2RVY0xYdTFWTkI3VnY2NzJveE1xenpZekN5M3FZdnpJOURJ?=
 =?utf-8?B?THZHbUxXNERrVzFZYllEWWF2TzlLRURhTU04VkU2d1JxZDFDcEEzRnlLdys2?=
 =?utf-8?B?R25kZ0V3QWV1dzY1TnZyb2IrdnZGa3FiNllxaDh3eVYxaEtGbnVxSWY4eXk4?=
 =?utf-8?B?Vkh5dWR2Zzk5UElZbjE5RGQ1V3ZaUVo2TEJCWFlhWXppNEJBZnNibkw1TTdn?=
 =?utf-8?Q?4NzA/UeUvTDDK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 02:57:39.4427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7612c30-13d8-4096-15fe-08dc78789c71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137

Hi All,

Gentle ping since it has been a couple of months, any comments on this 
updated patch? Thanks!

Kind regards,
Henry

On 3/21/2024 11:57 AM, Henry Wang wrote:
> In the common sysctl command XEN_SYSCTL_physinfo, the value of
> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
> Currently on Arm this is a fixed value 1 (can be checked via xl info),
> which is not correct. This is because during the Arm CPU online
> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
> cpu_core_mask for itself.
>
> cores_per_socket refers to the number of cores that belong to the same
> socket (NUMA node). Currently Xen on Arm does not support physical
> CPU hotplug and NUMA, also we assume there is no multithread. Therefore
> cores_per_socket means all possible CPUs detected from the device
> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
> accordingly. Modify the in-code comment which seems to be outdated. Add
> a warning to users if Xen is running on processors with multithread
> support.
>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v3:
> - Use cpumask_copy() to set cpu_core_mask and drop the unnecessary
>    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu)).
> - In-code comment adjustments.
> - Add a warning for multithread.
> v2:
> - Do not do the multithread check.
> ---
>   xen/arch/arm/smpboot.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index a84e706d77..b6268be27a 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -66,7 +66,11 @@ static bool cpu_is_dead;
>   
>   /* ID of the PCPU we're running on */
>   DEFINE_PER_CPU(unsigned int, cpu_id);
> -/* XXX these seem awfully x86ish... */
> +/*
> + * Although multithread is part of the Arm spec, there are not many
> + * processors support multithread and current Xen on Arm assumes there
> + * is no multithread.
> + */
>   /* representing HT siblings of each logical CPU */
>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>   /* representing HT and core siblings of each logical CPU */
> @@ -85,9 +89,13 @@ static int setup_cpu_sibling_map(int cpu)
>            !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>           return -ENOMEM;
>   
> -    /* A CPU is a sibling with itself and is always on its own core. */
> +    /*
> +     * Currently we assume there is no multithread and NUMA, so
> +     * a CPU is a sibling with itself, and the all possible CPUs
> +     * are supposed to belong to the same socket (NUMA node).
> +     */
>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> -    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
> +    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
>   
>       return 0;
>   }
> @@ -277,6 +285,10 @@ void __init smp_init_cpus(void)
>           warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
>                       "It has implications on the security and stability of the system,\n"
>                       "unless the cpu affinity of all domains is specified.\n");
> +
> +    if ( system_cpuinfo.mpidr.mt == 1 )
> +        warning_add("WARNING: MULTITHREADING HAS BEEN DETECTED ON THE PROCESSOR.\n"
> +                    "It might impact the security of the system.\n");
>   }
>   
>   unsigned int __init smp_get_max_cpus(void)


