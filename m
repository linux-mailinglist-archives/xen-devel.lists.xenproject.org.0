Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7502B45F82
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 19:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112221.1460598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZpP-0003Kf-DD; Fri, 05 Sep 2025 17:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112221.1460598; Fri, 05 Sep 2025 17:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZpP-0003HY-9Y; Fri, 05 Sep 2025 17:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1112221;
 Fri, 05 Sep 2025 17:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2T6=3Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uuZpO-0003HS-3z
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 17:02:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1452846f-8a7a-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 19:02:19 +0200 (CEST)
Received: from BN1PR12CA0022.namprd12.prod.outlook.com (2603:10b6:408:e1::27)
 by DS0PR12MB8478.namprd12.prod.outlook.com (2603:10b6:8:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 17:02:16 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::1a) by BN1PR12CA0022.outlook.office365.com
 (2603:10b6:408:e1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 17:02:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.0 via Frontend Transport; Fri, 5 Sep 2025 17:02:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 12:02:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 5 Sep
 2025 10:02:14 -0700
Received: from [172.31.134.167] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 12:02:14 -0500
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
X-Inumbo-ID: 1452846f-8a7a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lgp0f5NTj/clHJ/iDK9xGIstouy1suiZl1L41kWcB9smXn7tlKPH+EBr0+a7ykcxrOjpkCU65sh/4+S3B+vDsCW/ZU61dBSS+C+sfEbAjlRA3UHN6WpagAsWHk0hDR/FNGvVPA43HQMWdR1LtqIJRAW35NKQeUmjLJ+7jwIeIEp3YyI1PPDCEbmYrd65YfXyJLAkk8ToyAZydF6N8UUU+YaEUSNfqx0LmutV8kqgYD97Asg81W0wH0hnLuRuLK2cjJdKSdTVREGWnrjFHbsqIPl5SlGAouzlOhWAwIXPRtxQ82jhUn760D00wXm2Ys7O0a5PcBWAL3vRdvxCV5vFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49cIEEYcoroeeY4iXCoKC2U9YVC/+LfllgFiGaDkGBY=;
 b=iAnqUNe9pBytNoJqn7NdodrsgY86dy5NHM3FTGjDoiYIZK16SWdBw7eSVA7v85MGmOPbgcBk2uZozunBeTGoCtSdZXV4s//FHDbIZg0c3zHo6YPsu0YNMy9WfX+zvAU81Fpxzu4lmPrqClOS1Cwu4e0MnNpWe/7Onpqy5oSxqs6GJ09gbTib22mwSWleeAO21GXwkF+gV4IGTGTYSmafJGuinu+IT/1iAn/LUYDNryDD0CYgDjAMdT7hvTbEcdcT0FWKxPxX0ESwjLzDTL0JiTX80R7GILFly9BqMgGZduGVZBOCir9uK4oSu4nIUC5EziIJ9G08AQcuDHlge/Hg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49cIEEYcoroeeY4iXCoKC2U9YVC/+LfllgFiGaDkGBY=;
 b=aFf0EqFem0PQbKIBlPsjfrTXMltUUKpdQOKDX0dTi/tc4u9lCR/vbbrfsEDnmCuAjXiun+BmJRcLG3ikSimg7Ow3DxjQp9pBzlJDM6pJEr0JVFW41v9RzMxcFMMddFQtrrrHJpCXMsl8uCRW3gBWQ4SAhJp1JGmkgDtLbf/k2aU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <32f89ab8-9742-4bc8-a5ef-848b66e788b2@amd.com>
Date: Fri, 5 Sep 2025 13:02:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mcheck: allow varying bank counts per CPU
To: Soham Dandapat <Soham.Dandapat@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250905165212.96843-1-Soham.Dandapat@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250905165212.96843-1-Soham.Dandapat@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DS0PR12MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 779b2aec-0cbd-4941-2dd3-08ddec9df6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2lHaDBITThnOVNuM29iRktKZUh1TEl0SlJGNVJXNVR4Y1dwVUEyd3BIbXRo?=
 =?utf-8?B?bEZTY2VCaCtQVlhFekpSRmNac1VBZDFtSUUrQnNLcitJSmx5SkE0d3hpelpH?=
 =?utf-8?B?Qkl4TmNzYVd3VFk3ZEhzM0lUd294Y0ZrcytEVmVOWmhHYWRzaVFVby9aT2k4?=
 =?utf-8?B?U3RWNUxsaXFyQTBudkhaUURwckQrVlgyVERheStzRFovQjk0YjYwZU41VHM2?=
 =?utf-8?B?MFJpOU9Pc2VFNnBnVWtoeW1QOGU0RmFwV2R6YUY4a244cnkraG5XMTVTcWRn?=
 =?utf-8?B?RzU3d0VTWFByOFhZbGV6UDRITTRpVjVTOHIva1kxS0Q1R2ZKbjRKZWhYN3Vw?=
 =?utf-8?B?WEs0elZIWGxVL1BrbDlmL2lWVy9GVjRhOGx2UkFTT2xwb3Rmc09wZWZPdmJV?=
 =?utf-8?B?RlB1cXV4djI4MjBYNVo1Qnp5eGZITFZzTVd0NTB4a1hBWk5Uc0YyN3RKWGp4?=
 =?utf-8?B?SGo0RXpIN0xQUHdRUXk5RTlwSTl4Q1FncEthcWZWRjlLUVczajg0VEVmblJQ?=
 =?utf-8?B?S3laZytsRVhndEV2MFNzWXVZR05NUmIyRzVzcTEzODFoYTVNZiszSTdkT0tV?=
 =?utf-8?B?TWV6U2lyUnFWcTFrblZhUkJBanV2a2ErQ0s2NFp5K2tFVEtHcTZVUGJERFJx?=
 =?utf-8?B?Ykp0Wi82dW94V1cvbXRaZk1qWGFIZ3JsOVRNQTloWkNXS2tOL3FheXBsWW5M?=
 =?utf-8?B?SWs0bjJYOTFLYkMzdlRzeDVqaXpIQUhZMHZ5dVQzSnoreiswSUc0LzJXVW54?=
 =?utf-8?B?a1IxdWZYWC9XYUFidmJJTCtXaHJiWHFMbm8zY3dzWWxiakVyNERWWnFBTThM?=
 =?utf-8?B?RkhneFBwVzVWeGZtME5QOHpoQVNlK1gzWlo3WDhSVWt5bkpSNXdXazVnQ3l5?=
 =?utf-8?B?OHcxeDdiaFpZWSthUVVGMjRWd2tjb0I2TjRWdkR1OVlRREZraHVPUTc5cllO?=
 =?utf-8?B?YloyY2JRelNjdm9vZkVKQ3RsUGMxRmJhZzRqb3Q5WmdRdjMyRUdySVlDS2ts?=
 =?utf-8?B?RzFuaTlMU3E3ZFBmbEVrVGFpZlliU3ZqMldBK2tYb3NyaCtwK2NYSHpveDBU?=
 =?utf-8?B?djJWK1VRcGhNNW04WUFSem1CZmtYZmJqWHVPeDhKaHF6WjJISTcvc3VwY0Ro?=
 =?utf-8?B?dmVEVHQ1T3JSN2ZlUXU1ODRIb1Y4OTRUZXc3UTc1OG9XZFhDREVVakpDQlgx?=
 =?utf-8?B?L1U1QSt1K0RKOUFaSW1menZZdXQ2eWJyR3FMMlhUYW52WVpPWEF0MmhsRzVo?=
 =?utf-8?B?VWhCVXd2YWJUT3Q3anIyQkpaR3o2T0U0cGhYVUxoczlWU0F2cUUzYkMyYVl0?=
 =?utf-8?B?Rk1DeFNOTm9oaExFU3dLeXJxdW4xRFRZdDZkM2hJZFhsRnlETDVMY0d5SFpJ?=
 =?utf-8?B?Y0xRczl0dzFLUEhoYy80b2sxcDhESitNSkFKQUE4V1RhdTlsNE5GVW03dVZZ?=
 =?utf-8?B?ckNqUU1JbWtIQmRuRkhWdDJQUmRTb3VUSnhwRlRqNWVLcVp2a3U4REdNc09r?=
 =?utf-8?B?UUp3TGU2KzFVWWdVYjEyMjBDcWVMQ2Q4NFQ0a3pjZTFVYlJTUVZZR3V6eFk5?=
 =?utf-8?B?akZhaUdxVTF6WVp5NTZCOU9aVWEzcFg5Nm9CSUJpdkFlWGxraGtMQnRqS21T?=
 =?utf-8?B?bUZCUk1LSk54Qjd1d1VWL0ExMkt2RFBUYm5qdjg0WDd5VEJIdm9zOGIyMGhs?=
 =?utf-8?B?enBJVC8yVngvbEw2WlB2L1ZLeGp5anpGcDlVTTFYci9WSUhSamgxczg4MlBj?=
 =?utf-8?B?Ym5ENU03MjEzSVMwOGo0NTZ4LzhxMG5vREFrYWNIaWYxQUNpMmEwTFNvYWhV?=
 =?utf-8?B?V3diVGJKbXFaZlhmSU9uVzVjczEvb3F4T25ldTdKdlFTejd4dm5vZFBYcnZG?=
 =?utf-8?B?YlcydldXMi9zazNPY3lrQmdhK1dvUTNLWi90VG02c1pzemNHWmpJZ1NGUm1r?=
 =?utf-8?B?OUMxR1k5bUJWOURXUGpGWUJPWmI0eDNoU3E2NkZoWm4yY0t3UGVpSlZHbXpE?=
 =?utf-8?Q?3jmKzz7m5Q8lhX/nCBPrMfTR7mfM+w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:02:15.0986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779b2aec-0cbd-4941-2dd3-08ddec9df6d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8478



On 2025-09-05 12:52, Soham Dandapat wrote:
> In mca_cap_init function,the mcabanks_alloc allocates and
> initializes an mca_banks structure for managing MCA banks,
> setting up a bank map and storing the specified or default number
> of banks.
> 
> After this we will call mcabanks_set(i, mca_allbanks);
> The mcabanks_set function sets a specific bit in the bank_map of
> an mca_banks structure, provided the structure, its bank_map, and
> the bit index are valid.
> 
> At the end, we will call
> mcabanks_free(xchg(&mca_allbanks, all));
> This function is thread safe and does below:
>     1. Atomically exchanges the value of "mca_allbanks" with "all"
>     2. Returns the old value that was previously in "mca_allbanks"
> So, when we will call mcabanks_free , that will free the memory.
> 
> The problem is that mcabanks_set(i, mca_allbanks) function is updating
> mca_allbanks which will be freed via mcabanks_free later. This means
> new mca_allbanks instance("all") will never get chance to update
> it's bank_map.
> 
> Due to this when we will collect log from mcheck_mca_logout function ,
> the condition "if ( !mcabanks_test(i, bankmask) )" will always fails
> and MCA logs will not be collected for any bank.
> 
> The fix is to solve this problem.
> 
> Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
> Signed-off-by: Soham Dandapat <soham.dandapat@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Maybe the patch subject should be "x86/mcheck: Fix mca bank 
initialization" to differentiate from the Fixes commit?

Thanks,
Jason

