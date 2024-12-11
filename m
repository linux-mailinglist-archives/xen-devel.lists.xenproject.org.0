Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7419ECBA7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854678.1267835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLNX-000649-5E; Wed, 11 Dec 2024 11:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854678.1267835; Wed, 11 Dec 2024 11:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLNX-00061U-1P; Wed, 11 Dec 2024 11:59:43 +0000
Received: by outflank-mailman (input) for mailman id 854678;
 Wed, 11 Dec 2024 11:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HwW=TE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tLLNV-00061O-In
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:59:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 660b3054-b7b7-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 12:59:39 +0100 (CET)
Received: from PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::13)
 by SA1PR12MB8642.namprd12.prod.outlook.com (2603:10b6:806:383::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 11 Dec
 2024 11:59:35 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::a9) by PH7P220CA0007.outlook.office365.com
 (2603:10b6:510:326::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 11:59:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 11:59:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 05:59:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 05:59:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Dec 2024 05:59:16 -0600
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
X-Inumbo-ID: 660b3054-b7b7-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpSQDH3y0fYsH096SNJxkHtUFokDOmf6fYnN09bxj6a7iyBcj5B0BpldPRPNTw8UQEDrJLSEhb4tWSGnz8o3Hnag7VmRYKbaJp9+7nNqEuHKZ0FnRgRt79b2l8QA1T2vIn29TAjW9j/44OiLPfsgB/aD4vD9fCLmtUEcPiHBSR6IZmJd2CXhCGZy8ofsegJJkx+HtqVZQXDM0jOeBIlUPJGg4Ecs8Rt+KCQNQSCu+RLJSfrw+g+SWWI2gDKkMWFgJw3hlcSrqipSJ5/bO2OoHxHH/kWreS6tHnu0664WtRkxokgMA5YJ7irChaum2j1h1dikzWPNAfF4BnlLWToMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuRQHK89G/HNx5Gca97LlUCXEdGKy20FhP/9AKb8fkQ=;
 b=hpAJjJoTYjmkFBWOI3Qc7ZtzFQHbkFtcMtxL+PK1Pz2Q2YTSiWH+hD5vQKA+a7yBzIrB0/hskWHgJKHTY3hn6NLrZw/zn410Kpu0GGZyBefsSgD7c9N+d0mRNRQ7CSfsTfyqETlHvTrc6v5dWy8SXPNXAvY6nHlTUpQqaNNN/j+SuK5KZgVc4/Nfg6rY65U2eX0q6bEaEz3s1FrnUk54p1UxJP2JP3pGcBgrxWZZAQ+YnR0XZkk0MVngeEIULInRSt4hJGw6pPOlNL/3nUuw0tuoO7fCXkK8VgvXBDQztvZsKXbih/8PvaSWQhAmb4GfL+vuZ1t5uZYNlHrr4AhXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuRQHK89G/HNx5Gca97LlUCXEdGKy20FhP/9AKb8fkQ=;
 b=vEz6lwA5jHUA8Z3B7wBMWB7jYTHoTPZZ8bImPtRM5q42T8LpyFXN+D5xRZyZlzaUCjguP5yLXl1ZUtDWXLf0cefd0lH3GrmSUC1xL8vbQayTvhQLu7kZ7vatkKqo1qMvIcTDjTOmRHIZYOjOPevGMclf7CtpHEhvG8yE74Arq7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4dfbf14e-25b2-4d16-9323-b711e7e29752@amd.com>
Date: Wed, 11 Dec 2024 12:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm: Check for Static Heap feature when freeing
 resources
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Chen <wei.chen@arm.com>
References: <20241211111146.2827727-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241211111146.2827727-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR12MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ceca26-e7a5-45de-b21e-08dd19db4774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFaUnJOWk5TLytSMkw2S3ZVbU5ZdVAyRW12cGJYSkhzNW04b3JwYU55SHlk?=
 =?utf-8?B?blNaU2g2WkZMR3Y0MXBNTXJYaFZxdm5NN1J5bXFiaGltNEJvSysxMmo3aitN?=
 =?utf-8?B?b0EySy8rMnkrTzR2VFJndkpXaXZLQWVtMHAwNThYOVlsT0dqbXZEZVJCUkVk?=
 =?utf-8?B?K2s5UEhDMzhlOVNWeUI3cW9PZXFsRHVWMzdKNmkvaHdYNlU5RS8vUG54T25o?=
 =?utf-8?B?cktzaURjNzVhY3pyQmZpbGV3c0MyTUs1dE1PY21XQlZIS28zZ1VCeUFRN3U1?=
 =?utf-8?B?QnAyTmV2Z0dNa2xKMVBiWFhka3BjdWhLQWdkOU0wUlBGdXpZNk16VDU1bnk1?=
 =?utf-8?B?ZjRSbWtLUzRWSWVWQ1JzM05jZnU1S3F4NXo2cjRPT004SjBnckk0LzJEWEZF?=
 =?utf-8?B?KzFxY3M2cVBhZWFjTkw3NzhzbWRYaEU3WHRRSnN5eFRaVFJZMFdGQ0NsYlhK?=
 =?utf-8?B?YUZtcVBxelFDQktiUDhoUU9DbWpnck95U0UyOVdRTTRFUGl2Wk03M1JmQmdP?=
 =?utf-8?B?dzZUeGg4SFBta2VnWTl3bjlKRGQ0cG9HdW9rZlNvMUwxSVQ0c3dIaWFjNmE4?=
 =?utf-8?B?R2JzUUNXelhZUUlFYUFsUVNscms4MmErb3F2ZlNzUGd5b1RhNk1MWlJScE5t?=
 =?utf-8?B?V3RHcURLQk5DSnJJSnp6cmV3YkNuK0grUnN6VXRUZk9wUXNNam5wR1JmYTJm?=
 =?utf-8?B?UU5Dd1d3b3JpelIvYUxGY2ZBU0RaNWZFazdSVERWVXd2alhuUHQ4Q1NyUUxR?=
 =?utf-8?B?ajcwMzQvUVpPQlFHN25SdHlCM0greTEvZmp0aUtFejhuaXcyeXV6bHVFMldB?=
 =?utf-8?B?T1d3ZVg2bWZBM0RLcnZRSklWVmJCVkpIMDZKZ2hsTXBsc2s4eE9pcStQSzE5?=
 =?utf-8?B?UGIrL3VMUmJielZ1cEo3dGMwZGlwRFZwdkpTcHhlWHFJNmpSVCtybnBRaHlE?=
 =?utf-8?B?N1Evazl0RWcveGdMeGRWRG1wUVJXSnUxbDJOTWl4RGUrRm9ZdHpLZ0wrdzk2?=
 =?utf-8?B?WnY1V1hhYmpFK280b3J1cnJpWXpaOTdXYnRFbGZpVHdtbnRaM1dITGZ5VVY3?=
 =?utf-8?B?RzFzcGVic01Yc041NVFrRFJ6Vi92YW5OSVdDd0RlcVBsVm5BamE1UWxTOGd5?=
 =?utf-8?B?TVMvSGJBdW5XVUFsL3RTNUlsMllvU0hKejVnRm53VWtRN2hGaDBOMFJ0SnZJ?=
 =?utf-8?B?VUV3SWNVMGpWNXhVWEdtMVlvWUVBWDdYU01PSFVXSmk0bXkrRWZjTEpPV09t?=
 =?utf-8?B?Q2VCa0k5NEhHV3pkRFIzR25xMVh5eWtlZWhFN0l6QUxLRDJnNjBwNFlMamFQ?=
 =?utf-8?B?MlI4cXBzNnpmMEhIMjYzSlR2NFQzSVh2eFdQcllabGYrb2FxejhYQk5oMjk0?=
 =?utf-8?B?NjlhN1c3ZDFidzZTR2ptVzFybktYTndTbTB6bGhsMlBTZDhOZ0UzTzNLbElD?=
 =?utf-8?B?bnFMVnd4OE9iTTU3YjYyWE1GRWtCeVBJR2hQQVppVGpxMk1YZWhXbGRUODho?=
 =?utf-8?B?WVFzTDNySlMrTVJPWU8rSG42K0lldzAyQzh1ZllZbjJvK3BCR2ZaeHJBYkFm?=
 =?utf-8?B?NUxmbnUvRlR2cjFiNmE5empkNGxFYUhadUQ2WDBEZi9acW5QeW5Hc05RcmZ5?=
 =?utf-8?B?ZVhWRHhWalZ6YlhLNDVndjVPQTF0REphd0JPbi9qSEZ2WFk4RUlXYUhlVTBv?=
 =?utf-8?B?NXpDMjIyamdXbEN3K1pwclF1Y3g0bW50OTl6dXpTMm5aQWUwemhCcWtML2lQ?=
 =?utf-8?B?SEsxVFUzdTE0MW00NldKV3NOSm5xU3RaUGxXbmRYQlRWbWhGTEI2cExGV0Ju?=
 =?utf-8?B?WGZWbDhUSWpLdDJGQXY0SHNDSzNOZ1QySUxHRzNwZW9xOElINDh5NXh0Tkdw?=
 =?utf-8?B?Y3JsMGlqU09Cbm0vY05sc2dWQnczdUZjcmZzamI1TXZFZTZrZ1hzUUkvOHFn?=
 =?utf-8?Q?ImWHmqGENSakJUBn+ysQ7Gi3Ih/DHsNj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 11:59:34.2278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ceca26-e7a5-45de-b21e-08dd19db4774
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8642



On 11/12/2024 12:11, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> If the Xen heap is statically configured in Device Tree, its size is
> definite, so only the defined memory shall be given to the boot
> allocator. Have a check where init_domheap_pages() is called
> which takes into account if static heap feature is used.
> 
> Extract static_heap flag from init data bootinfo, as it will be needed
> after destroying the init data section, rename it to using_static_heap
> and use it to tell whether the Xen static heap feature is enabled.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common

[...]

> +#ifdef CONFIG_STATIC_MEMORY
> +extern bool using_static_heap;
> +#else
> +#define using_static_heap false
> +#endif
Why?

Static heap feature is not protected by CONFIG_STATIC_MEMORY today, so you would introduce a silent regression
(i.e. without config enabled, property would be ignored and there would be no static heap with no error message).

~Michal


