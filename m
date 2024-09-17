Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37B97AC5E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 09:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799861.1209850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqSvO-0007p8-Ci; Tue, 17 Sep 2024 07:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799861.1209850; Tue, 17 Sep 2024 07:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqSvO-0007mt-A5; Tue, 17 Sep 2024 07:47:02 +0000
Received: by outflank-mailman (input) for mailman id 799861;
 Tue, 17 Sep 2024 07:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfA6=QP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sqSvM-0007mm-VF
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 07:47:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2416::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 039d6292-74c9-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 09:46:58 +0200 (CEST)
Received: from SA0PR11CA0189.namprd11.prod.outlook.com (2603:10b6:806:1bc::14)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 07:46:53 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::fc) by SA0PR11CA0189.outlook.office365.com
 (2603:10b6:806:1bc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Tue, 17 Sep 2024 07:46:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 17 Sep 2024 07:46:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Sep
 2024 02:46:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Sep
 2024 02:46:52 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Sep 2024 02:46:50 -0500
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
X-Inumbo-ID: 039d6292-74c9-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ0Vn9lqpA9mcM7x2QgcZfiH5bJic+yu5N51nts5me0j7QN8g/OdnZ0iKFDWEkPII4HXb3FoeMkYs6mXkPeE5zP41KFzQlhGf3T1lo7UHF4gawmkD3BlrlS8lpVNIXLdT1wE52GUcRPt62E+PZ+vAWhsxpGTl4XUUfZcpHmxyP9zjN73xDAtfzqvX3/qYVL59Li8s+Wha5k5/koL1qzNNlgi/NL3bSSruHWA03XEQUp8Gu7YeX5asvnNEGhrlJWKrmevo6Ma4gqGLrP7bh4d3kSu8L1H53OQXytMMz3HlqeZEhdfdh6saASCQd34MIH8B8E2x2mD3S/tl4O8pqkLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfMjepAr20TL4fC2BXKyDs+vJ/PLOqlSGGgES8qV0Qs=;
 b=JlCe/4pmjkVAK5p+0n5DYLhc7dom8cSzyvgxa26/4lWCbTov0n5cPIm4K9fLF1WRotx3YCOQOWEur06qwNwBGtfR98fBniWuTUAmE1nwL0M6PMu5RlZpt9h/SMA55bzas+1+Ec810LOMvW3uZAFhsDZZOf1RvwJnEtuAHBUpFmtq0Zj+jolEXmoXqzrgS8mj2PI2C/Nvkk7qKoz/p3k50dGJicVQUtQ50OfDVVMOSXlMN6CCNzax2yaQqGrcQyy2f+f9hdEzbHOCrABcKCLQETGy6wJXci0h9Qy0KvqXIlBdjSDhh/0guU7nnMga1MLDJMt3iQLXs8NtXISn34xxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfMjepAr20TL4fC2BXKyDs+vJ/PLOqlSGGgES8qV0Qs=;
 b=HJGItmwZ7C2JblKyrKjY7kEJSh7ots/+pclJ4t+zhS3bk6f2jYAWqeBbkwTNYsX9xS0yYWznzQEgIJ4IwkL5MOVogDtvXhWpWJpMKrra3/06aBq+SO6Pg/DK8dfzPH+Byha2fkTRmVByc+TZ4wxX/xq/yADdKeassfcvVRP0nD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <12509b06-46b9-41ca-85e5-2d328309d8d0@amd.com>
Date: Tue, 17 Sep 2024 09:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/smmu: Complete SMR masking support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240904124349.2058947-1-michal.orzel@amd.com>
 <0d83595d-9044-4f83-b1ee-03275c2ddc51@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0d83595d-9044-4f83-b1ee-03275c2ddc51@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de4efac-e620-45c6-1d26-08dcd6ece565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDZ0RXdlcFFSS3lHZTRETzBqSmFwOXFtWUxQbEhkYTNRaVM0ZlE3NWY0eldB?=
 =?utf-8?B?T3RtQUxDWFFLd1BhV1BUeFd1QlczMkZZYnNKQnhMb0E1MUVZUGhhakRiS0Ja?=
 =?utf-8?B?ZXhZcE04MHR2bmZoM0UyeHdGc0FORDZCYWluaHA2NlREOFdTYW9zSW9aMDZT?=
 =?utf-8?B?eVIxdGNFdUxkR1l0dlN3RmhjdE9La29VZ3BZL0w0OThDSHBMcTI5aTFnT0Fs?=
 =?utf-8?B?VjNwNkgySU9EVS83UTl5a2dGdnNEK1hhSXF5RExadVRPWTRDV0lTWk95dTIz?=
 =?utf-8?B?S3pzbEtuUGdnT1pjSTUxV1A5dVdmSXhRcFNVZUZqUEVPV0xXZ29VM1BnYm5T?=
 =?utf-8?B?UE1JRitxOTVFQ2V6TjM2dEpka0x3RWpMUlFnSzRwa2o0cGhwSG5GQkxPcmd1?=
 =?utf-8?B?dStPV042YlM4MWJYZWhDRjREd1JLcGlJRHdKdzdRS2s4ZlhyMUsrbTlwckJ0?=
 =?utf-8?B?RVM0ckQ4SnZvd0ZwbUpqdkt0N09QemhEWTAralhVRWFjeml4bk9EY0JqUzFD?=
 =?utf-8?B?OWRPMGx2NndqQzk5ckxOUUdmVjl4bWZvaDhVUzFtcXhkSCs4bitSbU9rVzdN?=
 =?utf-8?B?eWRIaFJ5QTZoTTVMMFl2eG9PclltK3ppc091MXZvaHd2RkJ6UUtVS3Y5VlJQ?=
 =?utf-8?B?WDlNUm5uZzd6d1NDTDJXVVpxTjVQZjZ2WDRRZWZEMGZZZDJkSW0rcUhJeEda?=
 =?utf-8?B?MHgwdkNjclhoMFQ1UXY1bDFZMzc0aWdlSjE1K0gvRkgveEIyZnVPK0ZwZDZH?=
 =?utf-8?B?V2xVWStuN0R3QkY2Wmp0QXF4SktCcitBWXBwNTlzQkI5MjRud0krRWlBdlJC?=
 =?utf-8?B?dVF5dG5xY2FtRW5iRGxJems5aTNNemxVdE9CSVJzTUNWUXErbVNOWC9kbXRy?=
 =?utf-8?B?SzFDVFNvKzRPSHFRUGQyNWN3SnYvSUxkZ0RKMU9MQStkZTdlZGtOZjgyTTRz?=
 =?utf-8?B?a1c0SHY1VmxqWWplb3RBSitSNW11Rjcyb3Q1bS9EM3pOc3l0K3hOOGtOWnp5?=
 =?utf-8?B?TW45dVFTL3lSL0xQQ2xsOEp0b2RlZmRYNm5pT0lINm8vV011dWNjTHRCejNY?=
 =?utf-8?B?bWdPVHlLU0JYUlI4QmVrbXZ3c2haU2lEM1JoYmFDYnM0cTVEV3hsWHdlbVg0?=
 =?utf-8?B?M2dhczE0Qys1RDQybTMxMmRVOHVEWHU5U25nczlkUUNYeWxnS04xTm9sT01Z?=
 =?utf-8?B?UGFlQ1NHMElkS083TEVZcnNhZXJBNTlVYXQyYWhEajlxQzh1dHBGZ0lSY3Yx?=
 =?utf-8?B?V2pSRWtvYUw5ekc5VEMxU2JiTjMxRElWSUVPMENJSzdxTTVOYWxOK1RKSS9i?=
 =?utf-8?B?TDZURW9lMzhHejlKRWllelZOVFVjWEJ0QytvaUtIN1NNM1lDWDJYYVJuZFcr?=
 =?utf-8?B?d0RWd0hCRUVWZWZ6WGE0MFFVT1hqMEU4RUFzVlYxRGQ4engvVS9EMG4zU0Q5?=
 =?utf-8?B?L3hMZkQwam1SRGlvWnkrRzhqWTFhZW01Nk5KR1JDUmlnYXU2Y3FGeW1tRUtP?=
 =?utf-8?B?cnA5S1J2QzRHbFc5UUlwMWxDVnF3cjIxaU1BNmFZdnZvcUhLMFY2K1RWa251?=
 =?utf-8?B?VnJKRmtUbUY2eHN1UWdjZ091VGxZeUl1SUJ0RDlLakpwQ1Fyck4zRlJqcWVO?=
 =?utf-8?B?bWtxVzFiR1lOMVhhL0lxS2lIVHlpcHBJSndlODhuSDVOOG9RdHJLcEZFZkJC?=
 =?utf-8?B?T3RaS1ZNSU5YMEtOekhpOU5ZeCt4cTJLdTFiTkpRUEN2eXkybDV0eWNValpv?=
 =?utf-8?B?Q0Z1R0dta21QWkZKZ0MwYStCbzUvOFdmTFV4YVFqdUlnbjJzN0gzVzBrYUlt?=
 =?utf-8?B?ZzRsUVdTbkFldVI0QUtqSEpreThJLzVNcTAvV0tRUmVmajlqdjdxdE1pM2gr?=
 =?utf-8?B?bWNuUWdvUjAwVXQxTy9aRUxxSjBSbXJ0bHVGdlFObXlnODdweWhhaExPOVNK?=
 =?utf-8?Q?PCJoSVr2kPXGJQ1sLoIQUmLJBtifReBH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 07:46:52.8221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de4efac-e620-45c6-1d26-08dcd6ece565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882



On 04/09/2024 14:50, Andrew Cooper wrote:
> 
> 
> On 04/09/2024 1:43 pm, Michal Orzel wrote:
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index f2cee82f553a..4c8a446754cc 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -1619,19 +1619,21 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
>>       spin_lock(&smmu->stream_map_lock);
>>       /* Figure out a viable stream map entry allocation */
>>       for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
>> +             uint16_t mask = (fwspec->ids[i] >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
> 
> Not related to the change itself, but consider using MASK_EXTR() ?
> 
> It reduces code volume for the reader, and removes a class of errors by
> accidentally mismatching the mask/shift constants.
> 
> In x86 in particular, we're trying to remove the SHIFT constants and
> only have the MASKs.
> 
> Although it looks like this is an abnormal pair to begin with, being
> shift then mask, rather than the more usual mask then shift.
Thanks for reminding about MASK_EXTR. However this won't apply here. SMR_MASK_MASK is defined
as 0x7FFF and used elsewhere in the code together with shift. It would need to be defined as
0x7FFF0000 (and thus reflect the actual mask field of the register) to work with MASK_EXTR.

~Michal

