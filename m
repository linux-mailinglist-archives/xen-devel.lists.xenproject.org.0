Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7CCB14B3
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 23:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182277.1505177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6EE-0004W2-Lh; Tue, 09 Dec 2025 22:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182277.1505177; Tue, 09 Dec 2025 22:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6EE-0004TO-IM; Tue, 09 Dec 2025 22:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1182277;
 Tue, 09 Dec 2025 22:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT6ED-0004TI-BC
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 22:30:41 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aff46bd7-d54e-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 23:30:39 +0100 (CET)
Received: from BN8PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:d4::13)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 22:30:34 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::eb) by BN8PR04CA0039.outlook.office365.com
 (2603:10b6:408:d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Tue, 9
 Dec 2025 22:30:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 22:30:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:30:33 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 14:30:32 -0800
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
X-Inumbo-ID: aff46bd7-d54e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYD7E7iE+BoZNY6NdkW0V7UUkdUxu3LMQkVTcOGyeCAtQfZodR5XnImmXAFMx8Zd/7TXrLGgwj73lcCeO6o9w7z0h37oW4EI5eVdyyUrfHEYMlGdNYKQihLwf6SKsJH/5l28DEBuYdyYlbR3RoyoYGbzEBRz9O9+rZHflSIy2ud0AdUnAZzsokjrhsgAfuMhyNkrnFJrXMw6PGiOevieaJPGHfVdqNV2FxYuard2LAEcuUcoefa/n5blSjGXmQR9uB8IRSs2HL8DTby5hv0Si5eUwdfBMpJjO7QMV+NT8Urj21AIFg+e26qHhMetJgJT8FGhfaA1fcYd169cYXzobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOSKOhB9Uh50SUCYA9S45RoHyTm6kIqe2zEweHtRT8Y=;
 b=iSTbVxV7BVupTdgWWzo/NDxR8yi3Kc9xL2GxTbSTQHB0hFrZ5CYIDwkxJeP/xCcw6UQ0mTiox4N2G+HqpBxnS3GDpmXjAJblivqZRsd3XdEhSro5nAhAkDlGKluauBeoxVuIAl066TJo7SBU+fWIye9UchsoCEShhoqUbpvf5hd34Wb4aiApTmYPVRwkUpQenYrQ35amDnT2T0WWTNWq1dgDiIiWQCh7ij+6BnMnuc+EnhwiH1DrqIN4tYnnkAMnvUnnUEQwmHfEcQir8K+4zidzohF5eTLZ7zYv4BGobBNneFTs13V6l2py+lSWoUGaSi5OaNFhRQpu4ELztgiyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOSKOhB9Uh50SUCYA9S45RoHyTm6kIqe2zEweHtRT8Y=;
 b=sOj7eF/JVUzlNta0uyDvx1kaGyLpCfMPxDrabNnCf+/jaTaNr1IbS3UhMhsNpB8uX8Sg3EQbrEPFZynWCZbeH7Nw3g1E/sBhCVt9rqL2pKGOg3Kqrx7vdJwsbaFLFFB1+JTU6bHG8u6Imdqn/9WIFAK7erF36MZeR8mh09h9jVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <481fa1c1-c27c-42ef-b0c3-22fad5c71e2f@amd.com>
Date: Tue, 9 Dec 2025 17:30:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] x86/Intel: use host CPU policy for ARAT checking
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <bb5fef0f-a2a9-49ab-97bc-871486a44f89@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <bb5fef0f-a2a9-49ab-97bc-871486a44f89@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ad6cda-41a7-4e99-825f-08de3772915f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a21PVDcvL25kcmFZODNQdnlRTk56cE43WjRjb3hNK0czRmN0c3JpYzJYVXFw?=
 =?utf-8?B?OGpHYTVwaEMvSVB5UUttOTk4dTFYMGtxTm1heU56YnJoN3gzbW03UWZBbFNP?=
 =?utf-8?B?Vk1adUZVTUZRRnN0ay9LOFczWGxIMzFrU2xpeE0rV3JkWUtVSGk5U3BUbFAv?=
 =?utf-8?B?ZVJFUmJhZ1paODUxdDJrc0xoT1JxSkplRjYyeUNWR3p5bWtpd1U1ODBJdksz?=
 =?utf-8?B?dXVQMU9Ed0lHMjFWMTNiS3RDQ1Vsd1NROVBnd1p2Uk5wZlpQVmxneDlzaTJW?=
 =?utf-8?B?NzJSQXZ4K3BJL1BiWkQyYXQ3Sm93NTZ0c3gxcGNZOXVzMGc2ZUE4a0pYdVY5?=
 =?utf-8?B?aXBHTG9yekNRYlJUWUNPVE1uek1aY0x0MlZrSTZDWXgxK1NWTGJIT05oUEh1?=
 =?utf-8?B?MmtVdkpkdVpleHZKS1RnQytFRDBENjBiVStxTThSVTlOMGZQeDRYMUwrUlBu?=
 =?utf-8?B?QTNVUHlZazZSNzJVdHR3QjR0bzIwRmFZYzViWHgvTEJJUmpLWG9QcCt2MWxS?=
 =?utf-8?B?ODhnVDR1YTRqbHB2UGdkOXF3YTQ3SUpzNGxOdi8ybzVxOTVHcU9mdDNtdGdn?=
 =?utf-8?B?bW5EU1pCd29EaW9BQmVQWGNha2pUSTdFUzdFU0VKMVhHMngwTHRpaUR0enRs?=
 =?utf-8?B?a1QwSFoyUWM5M21xQU1iTTJIWm1sMzR6WDFlVExWMVZTVHZXZ2FEN21qWmgx?=
 =?utf-8?B?TitWYzdPdGhuaitrOTR6cjV0UVl6bmh5anJWa3JZRnJweThSaVF3WUg0a1hT?=
 =?utf-8?B?b28xNmozWmN2ZkwyTzgyc1o5MzBDUVBkR3lpcHY5M2JyYmZGSmRLUkluVzJO?=
 =?utf-8?B?ZWlnNHl5UWVVcnRPY3loY2hnVTB0K21NMEMrYkpsRWIwWkFhTzEyMWlieDRY?=
 =?utf-8?B?YURWRzJ5VVF6UmovS1RNOW9QaE1sZVZ6VkZYVVdqekRwdVFFOHB6YmgxbTZY?=
 =?utf-8?B?WjUwNFJYd2t1a1AyeS9yZllQOGtlNEFSQ2YvUG9LQzByRW5YbmZuclVNNEdW?=
 =?utf-8?B?VnR1Ky9sMzkwR1A1WEhhcmNxZCtjQ3V2Z01JQ3hKS2JXNXNSOFd1TDVLcnR0?=
 =?utf-8?B?NXpGeEs5WVBQWXhoVUlIdVd3NDU3V2lzU1R4ZGM5WHVDeXpJWjBtQkxpa0NC?=
 =?utf-8?B?QWpuNEFFRHNjSDNBSU1udkR3ZVN5VUdhNHpxRHJGbnVwYkM2U0l4QzErbWln?=
 =?utf-8?B?Ti95TFRacnFDVC9LOVBQbldHNTE1dXVrTURBVHhFL3MzS1V2YzE0bmgyZkN6?=
 =?utf-8?B?cnlRYml5VmdGTExpVW55ZTFBeW9LU1UxbG1Bd2YzZzRjVnlON2RaajFSMXN0?=
 =?utf-8?B?OG1pSWw5c2dVNW5reklWenBqQ3hsWHlWcXdKV3BUTzhaNGRxQkQ3eFlRR0hZ?=
 =?utf-8?B?enloUlJTYkFVVkJwOHM1cHVBYWEwb0kxdXhrQW8yRWFPTDV6YjBEdk8zYUxn?=
 =?utf-8?B?eGlKeWs5WkQyR1hmSUdHcC8rUXZTdFVweXV0SExSNG5DRGdtY05UWGdKT0NY?=
 =?utf-8?B?L013aWdZT3ZsRXVnZzlGNktDdUlKQldyNWhNZnFCQU5JWUE4a2V1MWwxNkZO?=
 =?utf-8?B?QmN4ZUtrS0FoMFQxRnlYam1iUm1QOTRWK3hsNTZpTDZHaExVOUh5SW02V0NZ?=
 =?utf-8?B?QWNwZGNnM1k3U3dsZUM2eTNsLzZoVUVscFJNSENzbXMrNVJFOTVtVnhVSG9h?=
 =?utf-8?B?L214aEMwL1I3Z1RvWVJ1VklKZGliQ1h3cURsVmFEVWRGcjJZNHJvajZPUVgr?=
 =?utf-8?B?OVBYS2VhSlRtUk1peVl3UTVpTFpnWjhVWFd3TVlZQytRUUdmVjByb3lhQSt0?=
 =?utf-8?B?OEhEdkRJcGFjVXJveTBDWXBrbVc2SnhuS3d5SmlySzR3YW44TkFoelVwclVZ?=
 =?utf-8?B?c0dDUWxMbElnZDAzV0dlRjhKTXR2cVJXNWx2WjlUanFYT3NZNS9wVEczdFVS?=
 =?utf-8?B?OEpkUUlwK2RzVTFnM2R3bE1rdmlDMk5tbGo1ZGZYSldYQm94aDh6aW1PMktk?=
 =?utf-8?B?eWV2eWlrM0daYjQyNzNOZzdwWjJmMkVvY2h6QWI0ZFlsVTNsc2tYV0JsMFJz?=
 =?utf-8?B?ai9HbFc1SjFwQnk3VnBEL0ZDUWlpR3V1ak1WZ3pJaTNGc0pxRnVzc25BMlBH?=
 =?utf-8?Q?VteU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:30:33.7468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ad6cda-41a7-4e99-825f-08de3772915f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

On 2025-11-24 07:24, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. However, as the host CPU
> policy is set up only shortly after init_intel() ran on the BSP, defer the
> logic to a pre-SMP initcall. This can't be (a new) one in cpu/intel.c
> though, as that's linked after acpi/cpu_idle.c (which is where we already
> need the feature set). Since opt_arat is local to the cpu/ subtree,
> introduce a new Intel-specific helper to hold the code needed.
> 
> Further, as we assume symmetry anyway, use setup_force_cpu_cap() and hence
> limit the checking to the boot CPU.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

