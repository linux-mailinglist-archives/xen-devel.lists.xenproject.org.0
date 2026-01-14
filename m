Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94037D1FFA5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203387.1518602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3Dv-0002uC-FP; Wed, 14 Jan 2026 15:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203387.1518602; Wed, 14 Jan 2026 15:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3Dv-0002sl-Cg; Wed, 14 Jan 2026 15:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1203387;
 Wed, 14 Jan 2026 15:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToIK=7T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vg3Dt-0002sf-4p
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:55:53 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a613a8-f161-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 16:55:42 +0100 (CET)
Received: from PH8PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:2cd::26)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 15:55:30 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:2cd:cafe::4) by PH8PR07CA0001.outlook.office365.com
 (2603:10b6:510:2cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 15:55:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 15:55:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 09:55:29 -0600
Received: from [10.71.192.102] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 09:55:27 -0600
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
X-Inumbo-ID: 79a613a8-f161-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkDp0Ulu0YElK+9fRp4ujMWFvtvgeuI9cC6bsJU/6C4sWmtMBK2BgdH71i2ewm+VdV88mrrY6yQHzwNp9oySRtXeZhVO2jQsoDzhkubP/bamd3fZ2OrNSw9z1Y90kbCpIcq0EIZw9PnJ3XMa9vOX2MJqxwexh+AAvHOIpyWGxCVmPzvrNZHhd5uwr5blPMKW1Wr+nttJMDZb6ayBf764EVxxGo871QffvLpkVeOyk37wHrXRfOO8/TaWrloiquflXDz0sEoemEpz8VR5mUQi03MnJU+0+q1hRgBnQ2HErUw9Ss/nmwglcAWJ7WuLJOmULYVu6MlMAuB5s9xbbZ4N1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CnlhtRyB3A1U7H1J3lVb0lcSHBAMx5OHvUHpMWtq3I=;
 b=Ynttu8Utd9DiLbm235LNyPfJLSqMpbVAwRdjny1PePc2HtpmwLHHz8fpmnBMZP9bv2iB2rm7zDW9ymJ5HEVW/2fKNJS3ThNpQDYVJIVpD/NuCMUzSJk3MMobPr0Eieg9TWpNtuw4N0kMyeYOm2c1Ir0LBQNYe8ilo0mI7ED14vHTtNU1R1SkNk7S86WnK8thVmgusslpTl2RlijsoUcIRXPEadYQPOThPe3l9pyhSjBnxMjQmDg49hEjpKRM7YN7BhOSxYmi2LCrPNnIKzZpK9zYxTOe7roZCbACTIgkw81HAD951j2xMrqLDSxdvTP4jXplBLjl6tfBkfFjd4d7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CnlhtRyB3A1U7H1J3lVb0lcSHBAMx5OHvUHpMWtq3I=;
 b=3sV6ChJzji+CCnvQk9MIxVhGAd2Jh8vL8YJqE7kR+kVRNxszhMpBXjmo2DqEgIQ8ZHL5Mniuso35ClJagrAhHmRgEcNrLsqYTAgBya+CX4dlZU1H4YByWEy8tBIHbAkGAC8GLitEgVnBDc6CbRKWIONj0pWSo82p3Rv7szccR8U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c9330c5d-1cbe-4277-b784-9be86b87f149@amd.com>
Date: Wed, 14 Jan 2026 15:55:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm/mpu: Map domain page in AArch64 MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <wei.chen@arm.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
 <20260114142734.239197-7-harry.ramsey@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260114142734.239197-7-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fcc6b3-94aa-41be-d547-08de538557b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlBMMlpRTVVmWGIxZmdrU1BOTWhkV0REbGJHZWdyTXdYVEw5ZmNYSXJpWUFK?=
 =?utf-8?B?aTJUbDViNkVVQ3J2N0hQanR1WkJQQ3o0aUhzdDlIKy9HWE9LSEJvWlMrRXNk?=
 =?utf-8?B?cFQ2cnJSYjZIVm1peFl0ZUNrdmxhckpOVnBvdG8reFFwaVhMejhBWVE0a0M1?=
 =?utf-8?B?dGF0b1FFNG5sdkN6cEQvVENvYXpuVTYvOGVaZEl4enltT05DSm5aM0lzODNk?=
 =?utf-8?B?TlRWS3I5N3NJSkNFUTgwWmxPdG8yV3dVY0pBYkE4RklZYVNWZkIwblYydTEr?=
 =?utf-8?B?YXVkSmJZTlRaWWw0RkplTTdtd1U2WTlyRXRNUHJ6aVRFMlhuZlFiUkV6UzF0?=
 =?utf-8?B?bjl6Z0FOejE2SmJrWUxISzNreExoTnBvaUNUYS8wWGVKUENqcVdyRm5iLzYz?=
 =?utf-8?B?UXdnRDVSeTB3bk50eFZZbzhMOVduZkV0R2JlN29ZY240cDZPWW9KUkV5RnNF?=
 =?utf-8?B?aUw0dFVxL2U0a2ZMU1Vrd05EcUV5L2NwOFZ4MUNSN3A4dHVtdzVYWTJLNGp5?=
 =?utf-8?B?My82cGFBd2Y3aE41cXU5ejdHNXVROHhDMXZQeHVkamMvY0c1NjU5cCsvMitZ?=
 =?utf-8?B?TDRoblVTcmFVcDFQMHd4NUJnT3RMNVlKSTRvdEliUmZyQ2FNcllIUXJwZG9x?=
 =?utf-8?B?K3F5YzhyeFc5V3JvcTNxTmlGMnEyNEdiWmpqekhFdkxnVXRMaFAwRTlkM1lq?=
 =?utf-8?B?R2hxYkpDbFdmcnc2QkZJQXFyeTlUUjlzK3RwaVl4Z09LbkZXK1Y4YVpWaUVD?=
 =?utf-8?B?ZUlzLzlsa0daWWRNVHNSaUFiUUR2QmVDRVU2WDZiOXpHY0d4QUwvQnhjV2F2?=
 =?utf-8?B?VXBvN0hTL2JLdkpXOXhxNXpEeUtqUzNiaU1kTElMWDRORFd1R2RzV2JvNVRN?=
 =?utf-8?B?bzBCelRBdXFVWWVuRXJxSHM5YXJ5ODVnM1BYWEs0NEY1SzFOdGVZQVRPNzRz?=
 =?utf-8?B?QngxT2pOUTBHaTFLSmo5ZnY2dk9zbFdGMkxWWEFKNG9IcUdJZWx1YXRCc3BT?=
 =?utf-8?B?MUJpaUM0aFBHZkl6eUFGa0M2U3RCVDhNSjBiR0E5K0NhVzUrR3E2d1BNbm9s?=
 =?utf-8?B?ZW5Qclp4ZkVtNHJGNU4yVGNrMlByWHU1allqaGtaeGllTDhmMFNOd3dxVnd1?=
 =?utf-8?B?ZzZRR2YyTFhkU2tkODF3eEkyM0RKb0MyVHVJVWNVTkFIYjlJeEs2VFMvUmRZ?=
 =?utf-8?B?V3UxMXFHMWQ3ejBQdzNOdjVQeW1GUitmWHhoeXdnYXdNNFhPb2xJWGhPeHBH?=
 =?utf-8?B?NGN3dlRDVzJjbzFiUnBPd0tJTEN3OEhDZ1U2WktZa3JOQ1FGaUltK2s3SXEr?=
 =?utf-8?B?ZU0wYm9xNXZwYzJoWkV1R1ppVjFTdkNQaHNacFNlZ1BNQUhrdU1uRnNBeWRJ?=
 =?utf-8?B?ck56UVlEWFBvbjc3YS9RK2IxYUpjSUpkV0FzaWJDdkJaeWphdlN4WXRpUUFH?=
 =?utf-8?B?YXhJb3hJRlA5UG9hRXlvU0lmSEgzYVF6WWJlWGsxL0E2WVoyR0hKbUJSUnEx?=
 =?utf-8?B?OWo4SkJQaWpVaDlsbUhQK0ZXMmRwdWJtazVUN2ZHdEFpRHM1OTJMZW82dWNZ?=
 =?utf-8?B?OHNBbGRTVnY2VmpsU1BhRS92V2RBTzFISHcxelU5SmRNR01qN1lUV0RvM1Nm?=
 =?utf-8?B?NW8wdW11ZExiNk1sL1NPdUF2K3ZJMmh6NDZUM2NvT1FJVEs5L1IxcUdhN25S?=
 =?utf-8?B?NjFJYzdMdXdDaUpzcmNkRkFETlk2MEhjODdabXkxc2dLTzJSZUdIQ21lK1ky?=
 =?utf-8?B?LzZhMHNtM3JZUkd0VzZVMHpYbitiajVMbEJ1T3pKWDJqY0MxMlBWL0lnTldI?=
 =?utf-8?B?RUdYU3Rja2VKL0RzSXRoYUZwdndKekluUnVjaDBMZmE0S2NOMGFHRUx6S3Rj?=
 =?utf-8?B?Mng3NlNHZmtaK2txV3JSQU12VGVkcDhRMnpWMU9qQXNVUll3cmE3c0NzY29x?=
 =?utf-8?B?d3VMaDNuejgrUnEzOW9JaElVdzJONTg4d1grUG55d3RoZVRoc2lvUFA3c3J4?=
 =?utf-8?B?UU5IK1E0T3Z0WitZdjFOR1dIcXQ3Mm1rNU9CczluQUlJRjJPSS94azJlRVpy?=
 =?utf-8?B?SjZVb2FvS1lHSWNkMWI5TnoyODlKcysvaUdhRzR4bW5sWkRDNHplcVk0ekpo?=
 =?utf-8?B?SkFneHFxaDh5K3Q2cW93T2o4OVI5WkhYMHNSSmozSWs5OXdiVWtmbFExd2pz?=
 =?utf-8?B?dWpyM2VTU2o5dEVoYkJCR0g4K3l0cTBIUnRMTFRvanphSm1VRkFxOXljb01Z?=
 =?utf-8?B?RFF4Ym96TEdLb2lKbWx5d3hoZk9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:55:29.9194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fcc6b3-94aa-41be-d547-08de538557b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

Hi Harry,

Can we expand this to cover Arm32 as well ? I did some test and both 
Arm32 and Arm64 get to the same point.

On 14/01/2026 14:27, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> In MPU systems, we implement map_domain_page()/unmap_domain_page()
> through mapping the domain page with a MPU region on demand.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v4:
> - Remove duplicate code by having `map_domain_page` and
>    `unmap_domain_page` use `vmap_contig` and `vunmap`
> v3:
> - No changes
> v2:
> - No changes
> ---
>   xen/arch/arm/Kconfig           |  1 +
>   xen/arch/arm/mpu/Makefile      |  1 +
>   xen/arch/arm/mpu/domain-page.c | 46 ++++++++++++++++++++++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100644 xen/arch/arm/mpu/domain-page.c
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..baa6c4cf15 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -91,6 +91,7 @@ config MMU
>   
>   config MPU
>   	bool "MPU" if UNSUPPORTED
> +	select ARCH_MAP_DOMAIN_PAGE if ARM_64
Remove ARM_64
>   	select STATIC_MEMORY
>   	help
>   	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 4963c8b550..940297af3f 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,5 +1,6 @@
>   obj-$(CONFIG_ARM_32) += arm32/
>   obj-$(CONFIG_ARM_64) += arm64/
> +obj-$(CONFIG_ARM_64) += domain-page.o
obj-y += domain-page.o
>   obj-y += mm.o
>   obj-y += p2m.o
>   obj-y += setup.init.o
> diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/domain-page.c
> new file mode 100644
> index 0000000000..b79afc493b
> --- /dev/null
> +++ b/xen/arch/arm/mpu/domain-page.c
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/mm.h>
> +#include <xen/mm-frame.h>
> +#include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +void *map_domain_page_global(mfn_t mfn)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/* Map a page of domheap memory */
> +void *map_domain_page(mfn_t mfn)
> +{
> +    return vmap_contig(mfn, 1);
> +}
> +
> +/* Release a mapping taken with map_domain_page() */
> +void unmap_domain_page(const void *ptr)
> +{
> +    vunmap(ptr);
> +}
> +
> +mfn_t domain_page_map_to_mfn(const void *ptr)
> +{
> +    BUG_ON("unimplemented");
> +    return INVALID_MFN;
> +}
> +
> +void unmap_domain_page_global(const void *va)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

The rest LGTM.

With this, one can see R52 booting to the same level as R82.

(XEN) load tracking window length 1073741824 ns
(XEN) Allocated console ring of 16 KiB.
(XEN) VFP implementer 0x41 architecture 3 part 0x40 variant 0x2 rev 0x3
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain
(XEN) Brought up 1 CPUs
(XEN) Xen BUG at arch/arm/arm32/mpu/p2m.c:9

- Ayan


