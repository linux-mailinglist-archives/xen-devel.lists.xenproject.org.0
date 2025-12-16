Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A59CC1C5F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187765.1509096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRKO-0005e7-3Y; Tue, 16 Dec 2025 09:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187765.1509096; Tue, 16 Dec 2025 09:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRKO-0005bk-0M; Tue, 16 Dec 2025 09:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1187765;
 Tue, 16 Dec 2025 09:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qh75=6W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vVRKM-0005be-81
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:26:42 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 513aeb9e-da61-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:26:36 +0100 (CET)
Received: from CH2PR04CA0002.namprd04.prod.outlook.com (2603:10b6:610:52::12)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:26:29 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::ec) by CH2PR04CA0002.outlook.office365.com
 (2603:10b6:610:52::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 09:26:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 16 Dec 2025 09:26:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 03:26:28 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 01:26:28 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Dec 2025 01:26:27 -0800
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
X-Inumbo-ID: 513aeb9e-da61-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tie2pdiHibN+I12iHa4Cr+Snnc9C2ZjG1Ew46DD1Mk3qJwPVk16Xn+9Ba1QCVgL8yoxwRll7/q77DbIRtw7aH3dr9C4dAyCm8clhNqzofX4E2WH2QcapGzGtgv1OztkI4Nmkdbsx6x+ANcVDVP7anz17aEvoeWZ79mgAyZ7VKfz1rrG9Tlc9nhv6mkeuaV4mmZfJnH5azQF3GeUVzmkLt4+NMxci3ZDQuNkDgjkrg3pWsefT6CJl1ai501ST47Xe/WqM/Wew/99Fm1iR3PQxf5/qeYSAoD5V0ywd+BECwRjREOWgNcZrVr8k0CeS9LT4FjD6UvIYyBVm3trHnnjCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0zSox3Fcge1kaCdDnHEiRUV5iYkipp7h6L5uMIJHGk=;
 b=JW8lhtYTg8nUyXEIrBoQ0M4mzx11pjygND/QpB9iDGLfkELJ+URNeHwaIxiJ4eEfg0GI9jT4robdB5RLyA2NAaZb+gPktJB7svwzLgaMbSjIsT70VkLjsbzkTaAw8MEBB2PRhhrYxaaXoiFhebS23GXI0TZOLFpbRpf04Rvecu0GgcvFQtgblZCZ6AuI2uXbToSYI6R5wMFlmABraXA7VBDxQMEQzGSIbLXsLlbQgsF9g4d3iW4SkItR+wz38DEIlKA4p2rlli/cP04Frci+aarDqc7J5I4aCFRyR7p01Q71jsTBUzuq5DVLJyGgedfAcFMoAezouwTlXnErC9Qs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0zSox3Fcge1kaCdDnHEiRUV5iYkipp7h6L5uMIJHGk=;
 b=3RN4VUOYTswxGqGO3Ommqgvj8bMs9oVA41k40QdQbV3KcZERVx+I4I6O7RYs3msJnf/zxGORC0ay2aaRI0mqJo+fRO8cyyij+TWjMpQNchL/RAAXmsrp3S4LERhSWy+bTuYYRawEChrZDadr9Viabr6ZLMCvZQzONaIpdHq7s/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4c3f8be6-2525-4387-9dc4-b5dfdbf41a77@amd.com>
Date: Tue, 16 Dec 2025 10:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-7-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-7-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fafb017-81ac-4f3b-d7c6-08de3c853184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlg1L0FQa2wvUWZMQjJmYURYYnRwRU5td1hFbnZwTGdESnYzYnFJOXlwbGxp?=
 =?utf-8?B?R293OGxSelkrVG1FWVZFTThlVDNhamZ2SWJ5TDhEb2MzNElzQURKVThacHhE?=
 =?utf-8?B?SWlQZWNJOEFPVkxtcWZHZmQyUU5halpES0pWSUZDOEM0My9jRStHa2ZZSnBG?=
 =?utf-8?B?MGVwSVkrVWhaQnZianozZXU4OCs1K09VNHk1R2h4dmgvWHVuNjI1bmlTSklP?=
 =?utf-8?B?ZDZraitzWng3RDFTdzFVSXFiU0JDV1N4Wll4cWIyWlB4a0Jxa0ZHWmlXYUtY?=
 =?utf-8?B?RERzVWJyM0NBdExmRzg4SXc2YlVmbHdoT3pVNi8zMnNFdWV6Myt0cVV5Y1g0?=
 =?utf-8?B?dEwwem5yaUYyOTlUMERnYnQ1QVJicUpFZVE2L3VMeE12TGJUcDB5Yjk4ZER1?=
 =?utf-8?B?b1VnWjhsOGR4dEVZb1J4WHR1TGRBb3pIUnA1U2tKczFIZUxtOHcwM1BMVHFn?=
 =?utf-8?B?Y29GN2Y1MC9pamt2VUViNk84SUcwQ1VaekplSFhjL2R4NVRKb0ttdDFaMDFW?=
 =?utf-8?B?aVBKSXZ4engzUFVJUStMd3M1TEwwSUNqeTN3TEx0amQ3S0REdmxVL2tEZ1JK?=
 =?utf-8?B?QkNUT1hTTjM5ejVZYWpwR3B2cDRSMWVJK0pQbExUVWJlbmd4cFM1cUdHQUtW?=
 =?utf-8?B?VWo0dEViekp3MUVFZDZnODloc01GNEwwL292a2RvVXkwWWd0bHFVSjJJa05j?=
 =?utf-8?B?STg2ZFlLbzJPOERxc2M1Z05xa1MvNjdXVjFQTGo0TWNrWkZ2TnJ3SnUxZm1F?=
 =?utf-8?B?ZE9YeCt2bXd4eHNFVlJIcHY3alJCRE5NeUp5d29QT1BxTnVMOTdtZ09DSlFT?=
 =?utf-8?B?Z1dhQXhxT01EVEhTVVdOelBhWFNoNXBoL2UzRDRrUEtPSEgrbEN5TXlBanVH?=
 =?utf-8?B?dkpVTWd2Q0ZGWkl6WXdOTDFDSDdhRHlTYmtSU1B5MFBrc0RKVHZlTzYycWhM?=
 =?utf-8?B?VHEwVDNONzBGb0xvK2pWaWJoRlRaWDhxOFlCclYwRDB4Zmc2YXphTzZHNk5K?=
 =?utf-8?B?TXRacWZvL2N6WVg3L3BBbnVCRjYyakJMVVVpMUtJaXFjWk16aWxrTVhyS2pC?=
 =?utf-8?B?eUVSaGJuMnJUZEJvMkhValJ1ekc2VlA5SkdkeUVIREN2UG8yUHI3UjNOZW9q?=
 =?utf-8?B?blJHSmpVaWFoTlhRTmJ2MWhMRlVWRll1aXZySGRkUWp0Y1JQdFVQR2ZKaFZU?=
 =?utf-8?B?bUpyK2RjaXd1U1JmTGROYnNKZXgrMjA0cC9hVGxvei9NMUFNbnpPNnVJZWxv?=
 =?utf-8?B?NkNGRmV0T2hDTGFQZlVZVmxlSnFXN2lNWERMcnJodCsxWEVIZVorbVJqTHBM?=
 =?utf-8?B?bW9jTXlnT00zWFJPeEVVRzlQckhpcUhYNGRYUnpON2ROKzBvR08yVk14cnpr?=
 =?utf-8?B?RnFxbVR2clphV0Z6dWZHSFNjSEtFNlZudktIa3h6VTRXR2FXdWJ3ZEx0VkJK?=
 =?utf-8?B?ajFBUmdPOWxvUTlobkgyVzdPUUFtdEVTOUhRUFVNaHNJLzZaa2l5TW5QQ3dm?=
 =?utf-8?B?SnBtOUcvOFRnUzRVaVIxR2RpcWJHeCtkNlBiclYyNUR5VHFhMFZubWc3MXZx?=
 =?utf-8?B?OHVuT3BzeFNNc0FJdXNjdDRIMjVPS3NlODV3bzNUMkNaSk1uZ2FFcEN2a2lI?=
 =?utf-8?B?TWd2K2RQbVBpVlpaTGZnTkcxdmN2Qi9zR3M4SVNzb25kT252RkdQc2F5RUZv?=
 =?utf-8?B?SXZ2OU5YcDJYSjR5UFYyb09ZSzZ3Q0xnUXIrR1FYZjdZMndLbUNkWmpJYXRG?=
 =?utf-8?B?STBsYkZzTXgxenpJakxxaldYdmtocFdkNW1QTXIxc1N6TE53d3UrZngwait4?=
 =?utf-8?B?RlBhK0FnWGR3MGdFdCtGcXpyU0cxOEEzcHdQVnZFM0pKS1pTZXl2NU5tQWlz?=
 =?utf-8?B?bEtETTg4cUlqTW9UR093Ylc4S3VUYmd4V096QnBmaGc3Q3BjWStsRUJqdk1o?=
 =?utf-8?B?S0pTWE55SXVzbDgyZC8vS25ySVJubkUrbzA5d3BmcklEbmFXSnBpTFc5REJ3?=
 =?utf-8?B?S1hHQ3RNUkVEaVdOdmdKWm1Jb1A1aWljWWUzTFAxcGY1K0ZaTmVIQlZJSjd6?=
 =?utf-8?B?R2dBU2dGTmF2Sm1QRFN2V3VDSWdtOHF4eUdpVHdvMDZ2YzhyUjhqZXhpdTdV?=
 =?utf-8?Q?iMzw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:26:29.1973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fafb017-81ac-4f3b-d7c6-08de3c853184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In MPU systems, we implement map_domain_page()/unmap_domain_page()
> through mapping the domain page with a MPU region on demand.
What prevents you from implementing the remaining few helpers?

~Michal

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/Kconfig           |  1 +
>  xen/arch/arm/mpu/Makefile      |  1 +
>  xen/arch/arm/mpu/domain-page.c | 53 ++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 xen/arch/arm/mpu/domain-page.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a5c111e08e..dac9a16c28 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -91,6 +91,7 @@ config MMU
>  
>  config MPU
>  	bool "MPU" if UNSUPPORTED
> +	select ARCH_MAP_DOMAIN_PAGE if ARM_64
>  	select ARM_SECURE_STATE if ARM_64
>  	select STATIC_MEMORY
>  	help
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 4963c8b550..940297af3f 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> +obj-$(CONFIG_ARM_64) += domain-page.o
>  obj-y += mm.o
>  obj-y += p2m.o
>  obj-y += setup.init.o
> diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/domain-page.c
> new file mode 100644
> index 0000000000..9248053ff5
> --- /dev/null
> +++ b/xen/arch/arm/mpu/domain-page.c
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/mm.h>
> +#include <xen/mm-frame.h>
> +#include <xen/types.h>
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
> +    paddr_t pa = mfn_to_maddr(mfn);
> +
> +    if ( map_pages_to_xen((unsigned long)pa, mfn, 1, PAGE_HYPERVISOR_RW) )
> +        return NULL;
> +
> +    return maddr_to_virt(pa);
> +}
> +
> +/* Release a mapping taken with map_domain_page() */
> +void unmap_domain_page(const void *ptr)
> +{
> +    paddr_t base = virt_to_maddr(ptr);
> +
> +    if ( destroy_entire_xen_mapping(base) )
> +        panic("Failed to unmap domain page\n");
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


