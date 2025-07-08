Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E3AFD9C3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037286.1409936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFoj-0003uW-VK; Tue, 08 Jul 2025 21:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037286.1409936; Tue, 08 Jul 2025 21:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFoj-0003sJ-S6; Tue, 08 Jul 2025 21:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1037286;
 Tue, 08 Jul 2025 21:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFoi-0003qV-13
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:25:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2418::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10406ead-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:25:29 +0200 (CEST)
Received: from PH0PR07CA0063.namprd07.prod.outlook.com (2603:10b6:510:f::8) by
 DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Tue, 8 Jul 2025 21:25:22 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::98) by PH0PR07CA0063.outlook.office365.com
 (2603:10b6:510:f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:25:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:25:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:25:21 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:25:21 -0500
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
X-Inumbo-ID: 10406ead-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qob8fz/q3txBa29nlCUBI2t9eexdHXuza5SS0O5HAnUTJGpH2pT7iZ9z844qyo0Ksx/LNzKciJW/EoHdcD32NSmhSovUmF/A1OLBvusMb0evJTVKJAhsKwj3tJcJJEcLtrOjq09tVQERZ6Sf1WgOBWzoQQLNGbKYblVK7CpHFE/uj00K5D1PxwKouEk6J29z622GxIebT69JPjFCsLoBjuGKHATZMbtPO5GuzEdhg6DQDZwmndrGxTfTIM+JfrcEVAWEfy6um86JEGfCVvwF6J7WNNvy4GylWz7TOM9KxfVVdNT4oGXRP5w/YtHWJ2UxFYcR9K/iidgQG8lozj6C+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb1kqx5rUCJb1ZS+RZdt8tIxRlT37cKG7j5JGmxq4E8=;
 b=lLA4klX+lXieVWP8CRhel+sGZmz9V3ErEIqbDBRZlJNWapR8XjytumRoba57I7AJXSelUUsQj4hCwy/Yp8+CugVqUfzYDGZUgrz9m2gW0HCI+a1tIk5pELmRHh/7jesy4TbRv3NCR//bhHCmc285ur3g/TO5zX9ykWkFVhLUUaMumFREvgRAC8JBlbmcD/tlqMOMat87U79rFDfUi8amgZOS/iphsgQKjyUrfd4d1cHA+zYqU3JICOsVw4rFDQLQfq6Q399pMYG+IOLxC39y6eqdRwyemV3/1dSYDwfc/n2FQSDklzMOMLCjF/pmbIpgADYP3CZsnYFzc82Ek+uV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb1kqx5rUCJb1ZS+RZdt8tIxRlT37cKG7j5JGmxq4E8=;
 b=DfxDb21EM/VOuiLbaJd3X0NXT3YB9wM2S6gP4E82Xgs4HU5jogFOcM4sSHV7KPFhxnsIFRaw7iHTysLpP6Pe/AtrA4+rpJKYisr/ebY5mYXmtHNhUYFH3LzVqYAKKlbZedwl2DxwV1aMdBaGQNwbLq+KcaORbnN9A6wjQMcEAos=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <39479269-3bcb-4a68-85e2-37abf79478ba@amd.com>
Date: Tue, 8 Jul 2025 17:08:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 01/19] setup: add global pointer for struct
 hvm_start_info
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c09eb86-27d7-4b5b-86c4-08ddbe65f254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzFkVVVMTW05ZGRPY0xCVHJBQngrOHVmSVZINlVDNzdRU2FSeVdtdi9VRHF4?=
 =?utf-8?B?S3JwZDNUNjB3ZUJrVTI5QllzQU9xUzY3UU1HVFQ2a1AwRGJiWDdEUFQzTGhY?=
 =?utf-8?B?aVVxMnRSU3lWNUpSRStGeXNyZWF0ZzY4WUNqUVJIV21xWHl1dW50UGlJSm1w?=
 =?utf-8?B?c0gyM1BMRlk4TWh2TklldGNGK3RrOWRrMUVIZEt6SG5sT1ZkYXFaKzJLNDNy?=
 =?utf-8?B?ZnNIbTBjaEEzVnpqZS9iYVY3Yytla2tMbWp4cmptYUY3MEN3Y3RFcCtLRXo2?=
 =?utf-8?B?NFAwNm80WkI2eHhiZDAxU1g2V1llWStmR3phdVUyNWhOb3hsOEN3dmhDdHk0?=
 =?utf-8?B?K2lLMU1uVndZdnFCbzA0em4vZG5SeUV1MTlWdXk4ZGlVcGtkNy9pamtSQXB2?=
 =?utf-8?B?dzI2VEJaeGRzNm01K2RZb25qeGE5dllpZkhNRmpFenM5V0IvUWNYTUVrRUpG?=
 =?utf-8?B?WTI4bkJtWkFLUTZnM3kveGRjdGgydmRPZnd5R1VBRHpaTFMwQ0dvU0dKMVUx?=
 =?utf-8?B?UVoraFNUR3I5NTRaNEJ0RndaSTNnb04vUEsvZGVMNFZ4ZjRzQWRMeWF0MFEz?=
 =?utf-8?B?YVdTWVhzUWRnMTFFMk8yMVlXK2FQL0NxaDZTN0Z1NjhYUkVVbmpLSkZYVURD?=
 =?utf-8?B?V1Q3ZURyaFYzRHhLOXpEQVZhY0trOVhGekRKSi9ZRFJNVXh0NVA3VDZwTEZY?=
 =?utf-8?B?Nys4Y3ZZamVGL2Y0MFR6b3dWdjR6YndaRzB2QUpYN25PTGN3SXE2Tmc3R0xa?=
 =?utf-8?B?b215QjZsdE1jRXZ2aDI2SzJyRTVISlYyOVZYRXg0Vm90WTJJT2hpRDlzRlJS?=
 =?utf-8?B?UUlCWHFZZjVrc3A1bzlwL3UwK1JVK2FuRkp6RW1RSlhlcit3dHBjNUMycUo4?=
 =?utf-8?B?SlBCc3FjVFZXOFJRZHQ1UENNZ3lWN1daVVpXdU1wdkx2T1VwTmlJTnVJZ0hz?=
 =?utf-8?B?WVVEWWZadmt0d2NVRHY3NVdncmdndmNXbXoyYVEwUDFicHQ1YVRwVlEvdVR3?=
 =?utf-8?B?YndJOUFpUFB4N1dxVWhMVzdDRzUzSzNGeDVRdWxpSkp4VWN6MTd1Nm4xVE9R?=
 =?utf-8?B?elZlaGk1VFVrcjczeUxCWk1qQ1JXQm5pamlQQzJWalhDZEJRYndHeWFjNVE3?=
 =?utf-8?B?ZlFyOEVRSGVndlpSUmZWSUFXeENoTGhVSmFBRE9CMkhjQlJkTTJtSkJGSlBW?=
 =?utf-8?B?L0JhTXIxWmFWcER2Y0I0dUZ4TWw3Qk9ydVhPZXhvL04zY2dTUUgrbXRiYzkw?=
 =?utf-8?B?VmdwTWlKMVBQMk9FZE8xMFFCS1Jvek9JUHBZeGxLa0xlbUlzaityMnNhQi9R?=
 =?utf-8?B?TmRnWE9YVGlSY0dMMy9Ld2l2QTd4RE12RGFYZHN2OTdpYWw3YjdaaEpha3d1?=
 =?utf-8?B?QnNjUHYrVTk2M2hOOVVUcFg3bzZFNVhiUzcxRFlpZGY3LzJpSTY0UzByeitr?=
 =?utf-8?B?SDhjWFgxUEpJdHhoSmlGb3Q2M0xMcnlYV1VCN2lhYU9uWWh0eTdub0d6MFk4?=
 =?utf-8?B?UnFrRHRyZjNqYXZKMTdwckNrM1J0am9TVElBeE9uYmR6M0IyZzNpYitmZThn?=
 =?utf-8?B?aE9BL3RzMDZQQjJ1Z3NlZ0Fnek1EaDZXLzVpcm9UMW94RVlRcy9pSmRiSzRU?=
 =?utf-8?B?LzZaSzZLS2UyN0grakViNjRFR2NDUnVURFBlbjBhM25lMFRpcTg2QkNTa05P?=
 =?utf-8?B?MTIrdWhTTmlnaWZDbXk5TlNxOHkvcWE0YmdTb2ttbXZ3VmFXZ2QvRlJTVStl?=
 =?utf-8?B?OG1rYWJqaGZXY3dNV3EwWnROWjNIYjJCSW03ajBzelhaUytwaG4wSi81Zi9J?=
 =?utf-8?B?eW04WDhyVmJraTBqRHl4bjcrUlk5LzdnWml5dzJiRzJ6Qm5Pa0ZKMGtrTWVO?=
 =?utf-8?B?N29OMXAyUytUSTJSOVpWd1hnVVZZbmdsK2ZzZjc0d0RJYWJoaGd3OURZZDEw?=
 =?utf-8?B?SWZ4T25MaUx1ZWV6cTlsYlczcXZiWXJlb3hGVS9DMFB6d2NFWnE2K0k2ZnFD?=
 =?utf-8?B?SElvTlY0UWE3OVJEbGp6Q2laZkJXVWJCZlVoMHJ6WVMxd29sclJhV3FLcXQv?=
 =?utf-8?Q?WHZHCk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:25:22.2189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c09eb86-27d7-4b5b-86c4-08ddbe65f254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448

On 2025-07-02 04:12, Juergen Gross wrote:
> Similar to start_info_ptr for PV provide hvm_start_info_ptr for PVH.
> 
> Add a generic function to set the pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

