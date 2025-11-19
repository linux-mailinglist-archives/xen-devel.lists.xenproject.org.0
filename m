Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F1C6D46F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 09:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165646.1492340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd74-0003lD-S5; Wed, 19 Nov 2025 08:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165646.1492340; Wed, 19 Nov 2025 08:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd74-0003i9-Od; Wed, 19 Nov 2025 08:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1165646;
 Wed, 19 Nov 2025 08:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vLd73-0003hy-Cv
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 08:00:25 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca4dddc-c51d-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 09:00:23 +0100 (CET)
Received: from CYZPR19CA0014.namprd19.prod.outlook.com (2603:10b6:930:8e::6)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 08:00:18 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:8e:cafe::52) by CYZPR19CA0014.outlook.office365.com
 (2603:10b6:930:8e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:00:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 08:00:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 00:00:18 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 02:00:17 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 00:00:16 -0800
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
X-Inumbo-ID: cca4dddc-c51d-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKC9ScUUWAbgUDrIT7IJDgTEubK+UhSzSKV34k0v4+GN38k7dI7EUG8Fo7zDFMYppiQbTnEJE4lHvnIkyvILqwMP0qvZx7B9LJLwNUxXmuabDxPq98oIpmmpx5FVNFFXLPgttAhG2p/zRmP16oocQhzjqakBQxyQutFrWHRAHyNnaJFur2MIJGF8rsQiC26Hwrc3A1+WIKJGUtBaGK+SYIrQ2akT2Jxtk1K6tikUOtZHJoRr3MsPFGvdHQr8I+nI52bMvera92oER574NHa8Qf9561SeQHogQMYWR0/G2mlXsGSVUSHtkbZfqhBbxxkHz/4ND/otj3mxtDV5uVgFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pnjg58ED52tQYY4R8dFccSNs/F3BvlCXEtxSOFEnWA=;
 b=zCOqKpQv/diU/ncsheywEMgb27+zmHqiHKvuMIP3yErTThRrjvRLLV7/y5PdljaDc10DipWSCaKZaV4I5Le9ndztjwYUngV0Hk+xemIWnnyYD2RTSLL4wQMqSzxTSjzMhXoTCBXSfvMNgOqMblFO4xMFbC5NUBpjadd3wmaFlJWqVEWS4lGdD/N1tvHt+XaaRairbsavtbjJDf3ficFIBjpv2wEEleROPeysE2clAvAj3k4GsIKt5pGwhCLRoGph+zRPTM536+c2AalY8Wsb8M75TKhJo4EkyOJVOqDiyKVTXEAm8Iix/5RAfeue3TZGpeu1eZpe4Nkd9hU1oH31qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pnjg58ED52tQYY4R8dFccSNs/F3BvlCXEtxSOFEnWA=;
 b=upmi6mqmFSjo/d/0BpDG474X7UrKysl+8avOf6P0I3QAg+BP7yNgX8D7wZ2alOoMQK+hBS9Wonos8G1fZ4Ee4gpaTb65UEp/B2Pcgwzlc6lkVKSkDKcQ1pQBu2scG39IzXaLMO3nDqhnmVzaXqFNJFeISSUbKzvbKYF1o9gOlFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5fb909a9-7dee-4f31-adb3-d0c35d1ad2a2@amd.com>
Date: Wed, 19 Nov 2025 09:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm/mpu: Implement ioremap_attr for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251119075351.3926690-1-harry.ramsey@arm.com>
 <20251119075351.3926690-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251119075351.3926690-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 9568d600-2d65-4e03-f968-08de2741ae50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0V6VUhndVJ6NWpqVUF1aDV5YWFXWnJraUFxd3FOL2RFa2Z2cG9mZENYUlZD?=
 =?utf-8?B?MmxuaDNVTThZUzlhbnBUZ3B6YlVDb0lxdHp1bDB0UEtiVE0reTRZcWRpZmRs?=
 =?utf-8?B?U25LTHdYWjJKRzZ4MnFqL1V5RU1YS2UxeWd2Q0VvaTNldktTZDFQUmRBeFpm?=
 =?utf-8?B?SFVJQmJoNXc4RkNiblViVC9DRlhDTERNT3RocEFFUHV3NnhFSFpqWkxMdkFq?=
 =?utf-8?B?eTlaUUJNNlg1WHpzakxDOU9rek1Wd2xaVThHMmtKOGRRSWU3NmdhODVmNjkx?=
 =?utf-8?B?S2JqTE9NaDVqWG5WYndZK2ZSR2ZSMWtmVWZvMENJY0ZqUWNTL3VTMDZyTmZG?=
 =?utf-8?B?cGsrdVByTThQSlN1NGkwSStJZS9uUDMrODUzMWMzaTBWKzNtRGZnU0dNbW5W?=
 =?utf-8?B?Q2NMZ3l3MVBUZkpyRjQ5V3JEejM5bVpDR3lxQmVkT3kyZVo4M3A2ZHE3TWsz?=
 =?utf-8?B?TFY1c3pwQXIwb3BIN1ZpUHZMQTFCRndHd3YzTWltRW5SQlk4VWl5UENzZVpz?=
 =?utf-8?B?eVRvQ2FqckZ6N1BEUnU0TnlINkY0djMvRGlJMWVsc2dFTFhLQ3BSczR5YmxH?=
 =?utf-8?B?MDZJVVZLTmlpTWtBY2M3SFBoVHNFZittRkxIYnlJc2krc2M0R3oveXBlakR2?=
 =?utf-8?B?aUtxUWlFN3FBc3MvQXVya2Jia2hDcjVkT3o3Z21IaVZUdm9kdmM1MlZPb0ow?=
 =?utf-8?B?bDFBZ1lVOVVwTWY1TjFrVkJQQjVXN3Y3aExKT3BUSXU3S2R0eUUrNlNkaDUr?=
 =?utf-8?B?c0JtQkNSRG1KZmU2anVLUi9DOTcwQmh3WG5QSld5S0g5MDBrU2RNcHRtaXlR?=
 =?utf-8?B?YzYweGpOUVM3UXFUQmVWU1RlWVNrc1NPZE9lNVJvMVJJWXk1Q0NZRndpUGJ5?=
 =?utf-8?B?RTByN2RXQXYyRVpITTJ4d1hzVzVxRTE5VXYzYkpPa1pQM3NkVDcvMDJzQUM5?=
 =?utf-8?B?NElnRDdIZHpUcFhobGsrNkJ5b1hCajZEOENlOThoNmgvZTVQdTRGSWZMMmho?=
 =?utf-8?B?enI1L0FxdFRTMWpYcEl5bDZZaTZrSVI1a0FnY3B5dHJhdWZrNHd1TVZZWUJy?=
 =?utf-8?B?QUdwNHBWMVNiK0pJUzFTZVY5WDNTY3V3MnZjKzdTNU00eThFOHhQK0UxRFJ4?=
 =?utf-8?B?cVgyS2xqWVkwVnZhS1lUYVZaQWNnVlI2cWY2QWFZZDI0YVZYZDVuVjdUY0Nx?=
 =?utf-8?B?YkFsaSszZVkrZy9oZUFZSzFoaXJPU3QwWURtSEcrREVIWXkxSEwzSEoxK3ln?=
 =?utf-8?B?VGQycWNmR3dQM04yR09VdzBQcmtENDlsemlKRSs2ZFVNNmtEWHF6YitLdy9S?=
 =?utf-8?B?cWVWZFhoTVhPeHhYMTVIYzNBTk11cWI5Rll2Wm03MlhsSFBFREpWMEZiZmF4?=
 =?utf-8?B?YytrTUZHcy9qSXF0OFNZSUoyT3ZOL0ZXR0NYdDEwRktqYmJ5WUxsOXFHNXFW?=
 =?utf-8?B?ZGREbVh3aGI1b05BaHFXSVg0MzVINUdEK1MzN1o3dk9pbDZJajNkblN6dTg0?=
 =?utf-8?B?dXVWUHlrczdnKzVQRzc1a1NJcnJoVFM0bFZ0UmxjeGZ6OXVJWU1pa3lYRito?=
 =?utf-8?B?ODhpNkZFVzJnN25ZSDBLVFYxejlmemliRVZaZ0xPamxBQTl4aXBIMytjcEJD?=
 =?utf-8?B?dGFnQXpHN3BTTEdCUDJyNnVUenN4YnkvVXpTVVNBaGI1ZFVhNVV6THV6ZE1G?=
 =?utf-8?B?VmU0dW44YWFycG1SZm01KzQ4c0w3TjVJT1A0eUhZTU8rWTY3ZDJwRUtJTnB4?=
 =?utf-8?B?RnMwcHFsd0t2aW1HR2JDVk1PejJwZU9YYllncWpFdnJVTWJTOUgxanROWnNt?=
 =?utf-8?B?VE00SzNGQ1Yrd2twUmFQMnp6OGtSdC9vcnU0aVQzbDYreHF4NkRQeEFKWDVB?=
 =?utf-8?B?NnYrSHdPY0JFWE5NMzU3VnROekxlb0g5aU9qb0ZUSlRxVksvVVgxQ3h5V0FV?=
 =?utf-8?B?N0t4OGo5OHVJbG5wY3J3NmdPUUduV21ZYVhZRFJPdFhocGxkZ2FJeSt3Vjh0?=
 =?utf-8?B?U3dpckJ5OUxPWWtvQlpGU0J4TitGeFowNlE4Z1RGVFZiZXlNQnZJSjBGZS9Y?=
 =?utf-8?B?QUxFV2hSSUV3aE9TeUFFbm43MnpPVlhzRmFrR3BzQ1JuNDhYaUJ0Zm1rSlR3?=
 =?utf-8?Q?2KAk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:00:18.3255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9568d600-2d65-4e03-f968-08de2741ae50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678



On 19/11/2025 08:53, Harry Ramsey wrote:
> Implement the function `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/mpu/mm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 29dd8c4622..f25560d746 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -473,8 +473,13 @@ void free_init_memory(void)
>  
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    paddr_t start_pg = round_pgdown(start);
> +    paddr_t end_pg = round_pgup(start_pg + len);
NIT (can be done on commit): There should be a space between initializers and
rest of code. I missed that previously.

~Michal

> +    if ( xen_mpumap_update(start_pg, end_pg, flags) )
> +        return NULL;
> +
> +    /* Mapped or already mapped */
> +    return maddr_to_virt(start_pg);
>  }
>  
>  /*


