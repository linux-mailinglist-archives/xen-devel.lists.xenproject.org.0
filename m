Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAFA1DB15
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878147.1288326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSiN-0003m2-90; Mon, 27 Jan 2025 17:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878147.1288326; Mon, 27 Jan 2025 17:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSiN-0003k2-4p; Mon, 27 Jan 2025 17:15:59 +0000
Received: by outflank-mailman (input) for mailman id 878147;
 Mon, 27 Jan 2025 17:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcSiL-0003jt-OY
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:15:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de0cfd8-dcd2-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:15:55 +0100 (CET)
Received: from CH5PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:1f4::22)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 17:15:50 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::2) by CH5PR04CA0005.outlook.office365.com
 (2603:10b6:610:1f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 17:15:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 17:15:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 11:15:49 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 11:15:48 -0600
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
X-Inumbo-ID: 5de0cfd8-dcd2-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRZ7yu2WchctWAq6/z/2GpqhYtrotjrhOo2n6f+p+uudES7+d6KI9uBUZchp6f8oRh/HpHoW5LbwWqfdGSNxWzNGOVChu4J5quRwLUe4tLJLJU54Q0AMuCOyyPw2kSKs9dgH7TGP6gHjgRFAFvXFX3tn8/zMWXASsnQ6Y2/jCjRZnPzHUqVKjI7riztRm5A2ELUN/VRvQYUbmNvtMCm3vrhaiRrBHvG33bBiOJQ5oHn6L/HFNE9j5xJnO5hY+QePuiFIbKyAdRD3150CE2A1gIu572S7OiK1PJCTojhEai3nakETGR9RuqhRAAuLAtXabVruvVtLLGT6gDToR6F1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2694W2IEQGxBUAVjQpa2LCHnNyhkJXWrTNvmVZV6HDo=;
 b=wStzFALxuVx/7s22RTBtW6r9GFwoeAPE/86xWU+NVglw/OVu2LGuggzcMX4S27kF3twvLbz2vnBC5te0a666bMNww0OBPuuupQ2h9jn6fLHW+2UCvtlEaEPs4deIvSxAJkdaD7L+U5PqfU/LsQPHjl8pazvayluguynTfy1cED+PCh4NOQdTGNRoXRvBsclJV7PbrlgShB2p8Ks6qtkwW83NPyiPfrI0TcMiFCEtN4wuNXKBEprHTSzfnnJlTiUSxDFXtha4B99EHmUJIsIdnfDiY5AY+k0cccjfoRV0xDlQvd7p/3fBKTs/ns8NNP1AAQbwQ19gokl/JnJpLIBwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2694W2IEQGxBUAVjQpa2LCHnNyhkJXWrTNvmVZV6HDo=;
 b=CLrPkDsTzB2HBWQjNSzpewL3XP02kOo3BWo0F/Y8uem5H6tcOOlRPJj4LrGoc5csx8v1z3pWjKHaZNpEGQqt4X/5z7yFtCd4DyCYavakAP6mu+obz9jX5jhjILZT36Gk6yShCaljGMpqKsd9Pt8aA7m6G7yck98PmP06X5BxJRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7fff37b8-9698-44ef-aa42-f1652ea3498c@amd.com>
Date: Mon, 27 Jan 2025 18:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
To: Julien Grall <julien.grall.oss@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<oleksii.kurochko@gmail.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-2-michal.orzel@amd.com>
 <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com>
 <32d42df5-08d9-4670-a571-ef315897514b@amd.com>
 <CAJ=z9a3gN0NyuvVQfEW2v9H9F5ZUhHB9+LvK4viQhSm6A=hauA@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAJ=z9a3gN0NyuvVQfEW2v9H9F5ZUhHB9+LvK4viQhSm6A=hauA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a9b60d-c025-428f-20cc-08dd3ef63f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUNGTVJadCtETTJzMFVrdWVsTVZYb05KUkhmdEY4cnU1VjhvR1NORWgyU3pE?=
 =?utf-8?B?Y3BPMmVKN1pla3lTSUVka3ArbTRJRE5HQ1pBTkdURnAxNjNORnBHTkpYSTdP?=
 =?utf-8?B?ZUFmbnBGVkxnVW5pUUJpVlExbzhwMWlOM3duSlJ6d3R0d2JiQXp4ODFlZVhG?=
 =?utf-8?B?eDVEUFdSdm9IRXp5VDRMeGRxdDFnUFpBWFFQOWIzNWxvTnNiT1NORWdwZDdD?=
 =?utf-8?B?RDMxQ1RkSFpPaFFodU05Q3JuQ2lCYUpMQW5RSUsvckwzMmZmVzNqVTk3V1hI?=
 =?utf-8?B?eFlSV1kyeHJFUS93Q1NFeWQ1THFMaGFBV2hFNTVzZXl4NTlSa1M1U3R6azVN?=
 =?utf-8?B?a0VNMXJYTCsrL01ZcHpqVVZpOEQwVFVVMU85V2Y1VktXejdmZTRwVEtHaHc3?=
 =?utf-8?B?bzUvMnF5SXdoRkVyekdzamxONnNqZDlvZTZBL3ZaNTZSRjkzcTFmUlhyL09R?=
 =?utf-8?B?dUpqZnhlZEI4K3I4WHJkOFh4N2txZ2E0cFNFZ0ZaQnA1a21UMEtqdXh2cUpJ?=
 =?utf-8?B?S3VlT0lmTUhOU1JMR1MrU0xnWlgrOVplQThFQURCMGRKeHVJL3lNcWx3ZXRC?=
 =?utf-8?B?cnBPdElqMFRDclArbEN3c3BzU0NQdks1WHZpQVRZV0JVWldWQWM4OXlGOGVt?=
 =?utf-8?B?UTZuYmRTcU9QQ21OekE0YkF3VnZUZkQrUms0bG9FRVFuam9OUFlZTkw3LzFj?=
 =?utf-8?B?b3BLekNidXVVb0xmZEhmMEZJZzJ5OS8zYmt2NmRxSjZrQjhPdEhhREZKbUJr?=
 =?utf-8?B?eVM2NW1UUk82d1hRcTJuTE1uTWNFdnZWTjhxbjNTNG84enlRYmtIWVZDMmNh?=
 =?utf-8?B?L2pBaEFEc3RpU1BDRGtDTUJsbjMzZDcvdHloWXNpdm1xeko0U1dyS0ozczg1?=
 =?utf-8?B?UXhneG5Fa3c4VVZjd095M1pSOTBFZWJyZ2t5dFlpQU5pSUpiUFdiZzE0d2E4?=
 =?utf-8?B?ZmtTc2FpZEFyMlVHY1Y0ZmRJczVNNnBMelRsVndzZUpVUno0NXhML1d1UUZx?=
 =?utf-8?B?dEtLZ3pZcXY5Zkd2d2ZPRkQrZk1IWG00azR1YndodkkwZk4xbkp6UU9PMXdV?=
 =?utf-8?B?N08wR1VNU2dZaG8rcHc5SkRSQ21NamFvbEVTL3cvd1BXem12TlhuM1NodlRa?=
 =?utf-8?B?aXIwVDJXdjRhMStSVnpsZ2VlamJaWXc5VGV4UjJ3bHRQSkZWelRNS0xRNnZX?=
 =?utf-8?B?RlJ3cmNDTzE0dCt1a0YwbjI5ZjFHK0xvc0lXWTFNMnBMRWtDUlEvNnloU1Vh?=
 =?utf-8?B?ZEdPQjBtOFVGejE2cmJMbUpEalMrcGpGc0xITTNBb1B4Y3M4SkMxWkZqdDRS?=
 =?utf-8?B?MW85Y0lpaG92bGgzbDVyaXlzaTNQZVh6dlFvYzZMVG1Wd0VHRWpVcjdmR3B6?=
 =?utf-8?B?U3k1OHJEejAzdnQ4cGFvVUpPQWEwRzhFczlIR0JWMUVSNWJPei91WDlzYXFM?=
 =?utf-8?B?dzd3U1V2Z3cyV0p6QTlwMEQ2bHhCVlZIdG1LWU5GOW9uVlZXajJXUEplcmFm?=
 =?utf-8?B?bjExemY5WGNIS3NYRjBScjhSVFdXVHNsQmI1N0x2ckhPQlFVSG9oRFNCOHBw?=
 =?utf-8?B?bTdOREpGa3BmamdRbmYrdnFwdjBxcXBKU3pWVitEVEFLT0hwQlNZalJrRnVq?=
 =?utf-8?B?UHI2eG90b0hyZzREWTNjZ1Zha1JTcU9XVTE5SFJrc3h0WGtEM0FwTDhhdWsr?=
 =?utf-8?B?OVoyNnIrc3lQU3FwWmUyUDNkS1c4d01hcFlXbXAyTWl4b0VsY3BUYm9WWXRE?=
 =?utf-8?B?cDErZ3o2aEJ1OVZpdEdzTit2VzNHbkYxano4TTZmN2ZLQ2gxVGlndXU4dlJX?=
 =?utf-8?B?TzR1d3BaS2QzdHYvVmhsalFQRC9mWmxmemN4Q2IvT1FTUlVWR2JXN1VKdlc1?=
 =?utf-8?B?eFBIRWU5MklCY28wQzJLMHF5V1B3VHlZTDNvTjBpR09paldzNGI3Z01QSjUv?=
 =?utf-8?B?UVlUa3VQb2N0MDFyU2hUOGgraGZGeUp2bEFYT2dYdEptM09INzRzeXRNcGJZ?=
 =?utf-8?Q?zbbxN4p/UrUQ7OK8tUajfOnod9wINc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 17:15:50.1223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a9b60d-c025-428f-20cc-08dd3ef63f59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375



On 27/01/2025 17:27, Julien Grall wrote:
> 	
> 
> 
> 
> 
> On Mon, 27 Jan 2025 at 09:52, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> 
> 
> 
>     On 27/01/2025 12:19, Julien Grall wrote:
>     >       
>     >
>     >
>     >
>     >
>     > On Mon, 27 Jan 2025 at 07:46, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>     >
>     >     On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
>     >     common/device-tree/bootfdt.c: In function 'build_assertions':
>     >     ./include/xen/macros.h:47:31: error: static assertion failed: "!(alignof(struct membanks) != 8)"
>     >        47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
>     >           |                               ^~~~~~~~~~~~~~
>     >     common/device-tree/bootfdt.c:31:5: note: in expansion of macro 'BUILD_BUG_ON'
>     >        31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);
>     >
>     >     When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
>     >     therefore the struct membanks alignment is 4B. Fix it.
>     >
>     >
>     > Usually, we add a BUILD_BUG_ON when other parts of the code rely on a specific property (in this case alignment). Can you explain in the commit message why the new check is still ok?
>     Well, the change itself reflects the change in alignment requirement.
>     When paddr_t is 64b (Arm64, Arm32 with PA=40b) the alignment is 8B.
>     On Arm32 with PA=32b, the alignment is 4B because paddr_t is 4B.
> 
>     AFAICT you requested this check back then, because struct membanks contains flexible array member 'bank' of type struct membank.
>     The alignment requirement of struct membanks becomes the requirement of struct membank whose largest type is paddr_t.
> 
> 
> Reading this, it sounds like you want to check against the alignment of « struct membank ». This is because the structure could gain a 64-bit field in the future and this would not be caught by the BUILD_BUG_ON.
> 
> 
>     Let me know how you would like to have this written in commit msg.
> 
> 
> I think it needs to be rephrased to make clear the alignment of  struct membanks should be the same as struct membank.
Shouldn't this check therefore be changed to:
BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));

~Michal

