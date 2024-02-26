Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D369B866EAE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685395.1066026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXPM-0000Vk-B6; Mon, 26 Feb 2024 09:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685395.1066026; Mon, 26 Feb 2024 09:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXPM-0000TX-7P; Mon, 26 Feb 2024 09:36:24 +0000
Received: by outflank-mailman (input) for mailman id 685395;
 Mon, 26 Feb 2024 09:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KjY=KD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1reXPL-0000TR-3T
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:36:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e88::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801b2452-d48a-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 10:36:21 +0100 (CET)
Received: from DM5PR07CA0103.namprd07.prod.outlook.com (2603:10b6:4:ae::32) by
 CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 09:36:18 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::fb) by DM5PR07CA0103.outlook.office365.com
 (2603:10b6:4:ae::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 09:36:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 09:36:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 03:36:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 03:36:17 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 03:36:16 -0600
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
X-Inumbo-ID: 801b2452-d48a-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk00NATOWNnFmGXLhzoRlt3HkvcycrYCF7+ZGjHkkAaTrE/XwWVweVOo0m/OFZuNIyyXza+YlRUYtXIG51sYaEYSvEPHbXqXnPLbOJQkD/P2PKS7zbKkO1MnZHEsTEZBsoKIsiYTxkrLRJgaLHG5/7EHcF0R4gjMTG0QFp3C0l7W8v+U8m45ANLrWrtPPQRjuviriqLl86J9dQBweTyZMJmCvDFaCRKJG8Mf3UdftQ1nbSn9MF1kg9PIpq22susOZbWxCPZdRvjRko+3x2ih4taSxyIHIZqrBwsU3JHZYeYCxQtIWK+cqb7bxE5CVBNMOK7EAgqBoLKx5NS3hD6SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taLG4QqoH00++xQxst8hZ3E49YmE4cpGqdAFRdF/X78=;
 b=l3074/+6gJoipYfZrIDKyF+jWUk9CP+CKo+HW5SUPYbQqG5q1EzxtsoERxDGG91vJlMF5091nEBGOUgbcUC57crF96T2BVteCrF0r1dCofYfMCsy/V5ByBxNw/CsCmlRfAvhTpMAmBKHJv+1PhnReiK9/qZGwRJIYuxOq2vrCpd3WCVNwoZI3d9ElCAJPtvsO5VbwOILcE1qWin/s3vH4uI3/6PmBpV6rk29KLSR4wdw1fitCYtJMQfhenmVHECVaVkv7JViwRHyqAYZrI8EoNhUMT/0oDuqLJI7kwrHuXGCt0T8Ge+Y+ulHAXN1p/Bkt199QtHI0R+66btK46MyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taLG4QqoH00++xQxst8hZ3E49YmE4cpGqdAFRdF/X78=;
 b=ysVuEukFCu+amSa4A+uqGjbTQY6Q460G2R16eCaQzRMmO1ykAsYrWUS/UZTudzLx/YHuX66235/EyEV4UDMQooclngJwAA/MABEfKtAqfj0emQKxxxOI+HSAYTdAR1/iYjexWR+QCqi0LqVVcY3r2zF26Tf3+BWJ2m2wnezxi+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
Date: Mon, 26 Feb 2024 10:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240226030146.179465-1-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|CH3PR12MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8199e3-997e-4961-7238-08dc36ae6253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4JRKg8l5PnhvH0H37Fg9wevagcO3amLFsELLkfZQLwtiO1Qn0BjVjc10g9C5gxsh4QF1nucdiI0XCPW47aAUc4ZUTvbHnX8Kr2yxkTDY4jUfPaosetz+igepkEhUVaN0NDr28D/ZVEqjNj9271Y8mgKHioP8pbSsG9NwMJnYFZoMXUZew0Kbv9xLSRVeyrRPOE7GaV019dUEzuLCF8Ao+g34DoPBrrCsZFOWvLMwnoHa+HMZToESRrcPb2Qep1L3ZyGiC0aWkTGxsCw8u1mPD5AOYgTbXyMhP+LVYzP152LHRQ9mUOgtDiPpPujVnIRUixf8k06eQT8WfAEypUCU2io85iBWcVbjhAAQqSBYd5zmUNfW600NUmpflBjD3SNxI9nUKmaSBUtle6mzyXwoYLdSwSri3nFLJY1Y393vyptTQ34ri9f1HqpQCT247vilq2qEY3sTvnfHLLUXOiVUFcJ9XU//9WWFKSIZH5tQ26d7jR1WWA5eQr9DWzyzhnzqlttMF1oRUxF/rmeAWWyop0LwHMhk553FTLkDLx7dLxqH8jBDNaQAoEsW6QpNFOCpV+SZFsqYVDN8TgjYkuiaOyImT+j1C2EaNdasUd+vZLKXe9U6gjJLGwqIhRw+F27AsKrIx2BGtI9C5YKnjpRBS515iW5C/idnvhDua6vnMHuw7NdAcmtbaB/fuKDdISyyFC0Vp1mmDGJM+pb/RAFZvwB1sS9/YY3zIZAj31eGsws4nwUZ0DEApI89euiRkALb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 09:36:18.0831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8199e3-997e-4961-7238-08dc36ae6253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725

Hi Henry,

On 26/02/2024 04:01, Henry Wang wrote:
> In the common sysctl command XEN_SYSCTL_physinfo, the value of
> cores_per_socket is calculated based on the cpu_core_mask of CPU0.
> Currently on Arm this is a fixed value 1 (can be checked via xl info),
> which is not correct. This is because during the Arm CPU online
> process at boot time, setup_cpu_sibling_map() only sets the per-cpu
> cpu_core_mask for itself.
> 
> cores_per_socket refers to the number of cores that belong to the same
> socket (NUMA node). Currently Xen on Arm does not support physical
> CPU hotplug and NUMA. Therefore if the MT bit (bit 24) in MPIDR_EL1
> is 0, cores_per_socket means all possible CPUs detected from the device
> tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
> accordingly. Drop the in-code comment which seems to be outdated.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
NIT: You first sent this patch as part of NUMA series:
https://lore.kernel.org/xen-devel/20231120025431.14845-16-Henry.Wang@arm.com/
Shouldn't you retain the Arm's authorship?

> ---
>  xen/arch/arm/smpboot.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index a84e706d77..d616778655 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -66,7 +66,6 @@ static bool cpu_is_dead;
>  
>  /* ID of the PCPU we're running on */
>  DEFINE_PER_CPU(unsigned int, cpu_id);
> -/* XXX these seem awfully x86ish... */
>  /* representing HT siblings of each logical CPU */
>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>  /* representing HT and core siblings of each logical CPU */
> @@ -89,6 +88,11 @@ static int setup_cpu_sibling_map(int cpu)
>      cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>      cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>  
> +    /* PE not implemented using a multithreading type approach. */
> +    if ( system_cpuinfo.mpidr.mt == 0 )
Do we need this check? It mt was true, cpu_sibling_mask would be incorrect anyway (it would still be 1).

~Michal

