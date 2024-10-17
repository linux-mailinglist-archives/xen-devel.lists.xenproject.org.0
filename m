Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5C9A2E3F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 22:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821295.1235047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Wnm-0008CS-Ir; Thu, 17 Oct 2024 20:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821295.1235047; Thu, 17 Oct 2024 20:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Wnm-0008AD-G1; Thu, 17 Oct 2024 20:08:54 +0000
Received: by outflank-mailman (input) for mailman id 821295;
 Thu, 17 Oct 2024 20:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1Wnl-0007In-Dr
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 20:08:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:200a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f911df8-8cc3-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 22:08:51 +0200 (CEST)
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 20:08:46 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::68) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Thu, 17 Oct 2024 20:08:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 20:08:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 15:08:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 15:08:42 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 15:08:41 -0500
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
X-Inumbo-ID: 9f911df8-8cc3-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxec8+yUAO5vfUzIfaR+7ahhf19vixPzKRE+ZXcak4CzAJc2Qv1CRVdMTdfMAj0skkaLB8KmGecv3WzuA98cGGAR4ulw09FL6N1yT4y4/Gw7aPp8bOrOetFgMm1lM7JV+WYHv1PGXGn4feJl01Wn03ZBdAP80Rdm2NtygJC7NXYDP3S1ypB2BqcshiG4zlLsPCRYFBZa/hDXuLQHi9waMhAC0eF9VLCknMz0pvBEbjZMhIhZV+EUUx7kPrWy1DQR9bxYL0Stom3R8esrDWFKqsNcCFXdF3TlWIXLVUN+XTENZirCgDgomqi0NcGTxdbR2A3dy82C0BC9/erAFJcbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqqPW2W+OPGRcNbC/wVa0vqFEz+QLEn0XYEmsjLlp4A=;
 b=Tip0xHbXJi5IOdT3yuiCRkv6Lxk4TcjCSp69lzWFOdauLMlRxWLh0gBPw8+Jg5mxMPolFD4LWAgkcBoUSA4ef7hNCUSvb0aWYkvuBwIi+/eo7QvsJPImWCGBrrOZQw+Yk6qaNobFriu1CwHp0G0N7/ldwbIYeCOsGZXAAFTCYWFATc1wRuRt13xDpKhLiNrWsUkI5FLdAYxT7hwtnG9BMs8eOldBV43GgTns88K9Ib89/ti+1hMaVsstAOpmPRNMekr6fqJsbAiNis2EJCX4ir/uIuunFXYKPQy8k7/PYbmSIuijBDHi020uK9q2/fOBPYMXo4P7QX/8WUvo6TcADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqqPW2W+OPGRcNbC/wVa0vqFEz+QLEn0XYEmsjLlp4A=;
 b=cA+wIct5W0ya2GkZhhggJR+l6VQiEMcvMWqOe4vAZS1vIpM8w8gvgYHdkQweknJOOF+1o6Bc+zfWBC/Atn6qnjQWXGJG89qz32mnJEdGAgjsUJFsHHzUbgIWzSHCfJASjSCVQd5K2l4KXwshMiBLwISQJH4YqufuQHNUZYPoJ34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <80976965-8c47-4827-a3a0-db58d9d6f8d8@amd.com>
Date: Thu, 17 Oct 2024 16:08:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/44] x86/boot: move boot loader name to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-3-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|PH7PR12MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 8430e926-85de-4260-c26b-08dceee7813e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amcyR2V2TkROQWRKL21KeEM1L0wyb3JEZzdIME1ESlFLQ1lBb2ttNEtrb0hJ?=
 =?utf-8?B?c1VrNTNGSk8vN1dZYmFQNFlLVyt1bTV0eHU3aHV4SFZmdWRUdmxTVzYxOFpR?=
 =?utf-8?B?UlhjWXM3dHMxbXFiUVUzaEJVYmdaQUo3bWhtQmNRRlBYc2VWQUtZWm1xaktT?=
 =?utf-8?B?M3JOQklTd08yQ2RnK0MrRTlwQUhWQVUrT0hORVgxQjQvckRaZGNCUXhXMGVn?=
 =?utf-8?B?ZGcxMTNmOEd4WGFiYTNDd0pEYyt6YTlJNldxYzdkbW53eWIvWVMyRHh5VEtm?=
 =?utf-8?B?MElrcy9saUdKNDZ5TDc2Ti9KOHNKVzgvczIxeGpUM2RQYU1IdnNnL1dIWnBv?=
 =?utf-8?B?WVkxMTh4elcvQS9UZjlPbnVTUnBLRWhYWGVSeDJrY1gzR09aZE9nblJYbU1x?=
 =?utf-8?B?dk9HQzc5YVJLclBTamhFU3FINWRTdXphRnU2b0UvM1pjbHhBM3o0V2dwWGZT?=
 =?utf-8?B?TDQ1OXBEYWVjWjVuZE9WN0I5TUlRdWMybnh4RXJSYXhvRHZqTnlVSThudDVm?=
 =?utf-8?B?WU8vT2lmVXllOFVpTWRUdWxsVVF6MzBvMnlUWmYxZGdKS1FrVDhUWlBUWmVv?=
 =?utf-8?B?WmZ3UTI1SElJTG9PY3c0MlBzdGZHUG1sMGFPOVlwMmd4WkgwTzdhQW1uVVdj?=
 =?utf-8?B?TEJQeGUvN1pHWHNPY2Y4NXZZUFVMK1drcEZKNHc2ME50M2ptQUdadzZaN0R1?=
 =?utf-8?B?bTU1bElqWXg4d2FETzJhU3RPeGwwR3hxN0tSNzVhV0VWUkxOMlZvZms5Z1lm?=
 =?utf-8?B?dFBVVUh0cmhHZ2xodURtSnJqZk56VDZtVGR6aDVlS2pPKytCdGVweWZoa2JR?=
 =?utf-8?B?T2x0dkN5L0cwM3I4dTBpeGIxYVc4NWRnUHNTTUxqUFZPZUdVd0crMDdzMkhi?=
 =?utf-8?B?MVB3SmNkSDhPeEo3a2NXaEFsRTdyam52RXc2UGY1Y1gzdjZRVjZBUzlNNXFC?=
 =?utf-8?B?MGE4R1JHYnVMRC9WWnl6QlNQWVVWaGcwSDJiUEdwdGVuc0RSQy9vcWlqZnZD?=
 =?utf-8?B?M1lFYzBIMW1ib3VQS2VRMHRwb0p4WVRJR3BxYmNrZ1F4TXZoN3E0SlBSZE9L?=
 =?utf-8?B?Wlp5bXp1MGU3SVVlTktSS3RoME4vcVh4Q0hRSVROd2EzSXVyekxEcGtocnVN?=
 =?utf-8?B?QzcrMkpqTER3QXJYcXYyZVpsNmNTTWlMNGREYTg3OFVrcXE3QklraGwyYTc1?=
 =?utf-8?B?cC9WTm5RWG9RaWlSTE1oQjUwZTd0NnVxeU9HQ0JzWkQ1MkVFNG8yRGtaclYw?=
 =?utf-8?B?a2gyQy9HSHRLWjlSelVPTkFXZk9oaE12SGtBVk9tWGhNbHRJUXJxajk4azJJ?=
 =?utf-8?B?UFhPR1ZTRldHRGJkSkw1ZGowVmJLSVRZWnF4QVhyQjhNcW1lSitaY2pFUjNC?=
 =?utf-8?B?TEVucUtoQzBiNkQxR05VK2U5T25vMjRTUldtclpMTDhscjlrbkI4R01HNDRG?=
 =?utf-8?B?NnNDdW1GUjNSdldOVGFxNWtxTy9JamxsUHBGcDkxMDIrZ0N1YUZONjRFcS9D?=
 =?utf-8?B?YTN6NnIrVzRzUnpGNmpmVndZOS9sL01UNFlaZ0pNU3Bhbi9TL2svS3ZxQ1RK?=
 =?utf-8?B?RjlnWEw4UFl6OFlaRlBOY2pmOTkwZGFzS29qY1M2VGV3Q2NUVWtzQWVScFdh?=
 =?utf-8?B?VHJmVzVBMmxkdUwrRFp5Rnp1WlhDQ2RFdHBQekkrdXVlWkdVTERNQldWZzZ6?=
 =?utf-8?B?bG9kOTljUjZ2VVBWa3Q0Uk9QS3dFNGN0WHpSMlVmTm9GKzNqT0pHeXpsYnlw?=
 =?utf-8?B?VEhKNkdUYS80TS9SQ2F1MnZGYjlXb2xKN2MzZHRRMVM2THEyTmZFWC9KeHNM?=
 =?utf-8?B?WXhVTFBWNWd4eGdNRDdZQUJRNlhTcGxaQWMrc09iYlNMN2hwU3RsNGFYUmNt?=
 =?utf-8?B?ZnR3MC9SVXU4elZKalh1MTVVV3A0bmZMcnY2aENhcGZTK1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 20:08:45.2216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8430e926-85de-4260-c26b-08dceee7813e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978

On 2024-10-17 13:02, Daniel P. Smith wrote:
> Transition the incoming boot loader name to be held in struct boot_info.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

