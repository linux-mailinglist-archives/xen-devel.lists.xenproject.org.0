Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9088CA4F1
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 01:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726410.1130691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CIR-0007QX-RO; Mon, 20 May 2024 23:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726410.1130691; Mon, 20 May 2024 23:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CIR-0007Oe-OY; Mon, 20 May 2024 23:19:59 +0000
Received: by outflank-mailman (input) for mailman id 726410;
 Mon, 20 May 2024 23:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9CIQ-0007OY-U3
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 23:19:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7915e3e9-16ff-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 01:19:57 +0200 (CEST)
Received: from BN8PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:d4::39)
 by LV3PR12MB9141.namprd12.prod.outlook.com (2603:10b6:408:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 23:19:53 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:d4:cafe::ae) by BN8PR04CA0065.outlook.office365.com
 (2603:10b6:408:d4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 23:19:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 23:19:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 18:19:52 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 18:19:51 -0500
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
X-Inumbo-ID: 7915e3e9-16ff-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMvGLiV16EisY5V/scVTZ6cvRWJmGM8qr6LJF4tu+lgKCXmFTXAy70whLrg/h6PG1qh5f8Y+6fRs+Mp+Y0crAVkftuyi6bQilqyTyB2iTDzqTnhbACcXclm4MDEgNfzRE150b91U4IDETq9awaWZ9wdvfMvO/ySVGls4eJMkpAoPeH6zV1FM/V305c+9XM2hzR7rRmEazdihrZFcVzAubU2G399jHUYFRsW/qcNBD1ATGckS0EuK5gjPdqyWdhaOyCCIhqcroeKaAeB5CnyIhVwqfJs6By3X8Wd0qP6YyRgLLc+PUQ2voyrI5e58E5n3Lm92Vgskeb/Epc+EG0abxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7ZttqjF7bjrJVSr5FUkjnklGVSPmyTjxCFezK3B7A4=;
 b=gUmJzHenHCWXoNkOLB+VFOJkT7bVD9UxdtW5C2HXgSgoPo4EwJkq4JY3yr8zAlncYsk7jENYui1JaSO4hGYKqN/4DgnNPxQm2hBoVnPyksHBZeEwfhTvfyJlM4HRbUx2w8r4tcFMYIvj8Oke4CO3FK4hFnC189HtmvgxcVOajAZ1wSuywzeqa6FQggfmFCUprQXSxG6+GOxDpfD+5hKhmX8iLtTL8gqTUgxGWzGNT1ot6ficrEFQWrEPstkeflGlC2nUQTyRbVvqoBJL5beWxEmkexzPbhO9hLnZ1wa2R2QkqBqknDtBxADMeFILL8IHOkM3+b0W9zipqAp+NKsX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7ZttqjF7bjrJVSr5FUkjnklGVSPmyTjxCFezK3B7A4=;
 b=r1hbhMkoZgF/hINvFRS/7nKOB27snjbUsBt7gd1NQzubZYjravCqI/AuJRYZInT9XCgIiYz2vUFi0VY5oQjzLXjQ41nOryRawFpsQrfMhXs9IEqn6ohn7qzzIvtRvisRlG3E7cSjqXy7E128KJJJut61NGdqRGMJZkCJJSm5Dos=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <db6c9b30-e63b-4979-976c-9171a2942e81@amd.com>
Date: Tue, 21 May 2024 07:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] tools/arm: Introduce the "nr_spis" xl config entry
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-5-xin.wang2@amd.com>
 <0a87ccc8-4262-4122-8142-2f64a174bab2@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <0a87ccc8-4262-4122-8142-2f64a174bab2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|LV3PR12MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: e73761d7-6620-46cc-88d8-08dc79235ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YW1DQ216TU1xRjBDQm5ZZG12MGhjaUhpNk9LV3FDY0NlckxSV1NWUTB0K0Np?=
 =?utf-8?B?TURMM09vcnhMVlYwQjRVSGQySzVxQVJQVDM5T0NqeGRNenR1OEVvM2pnV3Vw?=
 =?utf-8?B?aTRHZDVGM3ZxK3gyb2tZU0RKTFpjRkE4MnlCUzhMVyt3VzV5Y0oyaTZsZXQ3?=
 =?utf-8?B?bXJHdlBVSDZpR0lkN1RrT29MWkYrSHNWalpnT3QwdGJwbEVXeXJiMjJ1eXB4?=
 =?utf-8?B?Uzdac2pia3FTbldmaFhOWlZuVUNKSVVyYmIxUEVBWnlDZmNTVm03Ky8rMUNL?=
 =?utf-8?B?VWZJcTNXNEtDSXl5NW01WnlZRE5HQ2xhWnZsZWMyYTluYytqcjltRFpQaWtH?=
 =?utf-8?B?WjJEYjNMY1BWd3kvaEFROHdiYWNPdHk5Yy8wdFh4cWFDSkNRNHVPVzZaeGRS?=
 =?utf-8?B?bmpZMWJCZlA2TmdpVmlPTEN2amh6UTU1QldPcEtkNlZVVzl0Mld3Sk1JQ1hJ?=
 =?utf-8?B?bHBxWEZmYTcyb0MxUWhUb0xyeS9RRUtRbWRVbXY4M3EvNXQ1U0JsV0lwZ0Nu?=
 =?utf-8?B?UGhDdWZYZGR2RDc5aDlEUSs3dEx0ZlRDUDNaYWhnaFlsbnZMZjEvTHFPL0I3?=
 =?utf-8?B?aDJSZjRWanlLQ1l0UUY1WFo4N2g3QnBaMkhWVksrSUZCSUY2ZnhiTnBvWEoy?=
 =?utf-8?B?REFnWmxOM0lPU2hGK3hCUThiY3o3S0Y0Mjg3d1BET2hYcWV2TTZ1SXFGaC9h?=
 =?utf-8?B?U3kybGFrMml4N1dSekF5RGNWQ0ZoemhoMEU1ZlJ0eUI1V3Iyb2VZaTA1TXVl?=
 =?utf-8?B?ODJtSHNiWDVsR0V6cWJUbXIrazAzcnNTSXhTZUVuc0hHSzduNU9qSlBYaUo4?=
 =?utf-8?B?cXJ4MUx2VVdwN1Rham5WUlRZUm93Z2RiS2R0Z2FhbHpuM0JVWXpMbVV1RVEy?=
 =?utf-8?B?dFVOK3dLK01ENldtOVcwOEYwZlU0TzV4OWlyUGV3ZEhsNk0veWd4QVdIa0Mx?=
 =?utf-8?B?cTR0anM5ZG1QeXlwa1dZaitFWEkrRnB6NkJlYTJSRG5IKzBJNVpUYW1hQk5G?=
 =?utf-8?B?NEZiWStDc25WTUJEaVNmUTB0SVhVTEFtL2daRDJnRHdTWmZRSFpyaVdjTWdR?=
 =?utf-8?B?NlExemxTbkhrNGtXWDFlK3lIVUdGanlvUEszWTFwUjk3YWFIMWFZMUFvUmt5?=
 =?utf-8?B?MnFocUNHZ2p3bzdyeWcrK3hPak9KS0hmZ1ZuT0M0OFJMMThsUDY5emM5bG5R?=
 =?utf-8?B?U2p1TXB5Tkt1RHBLTmRKZWkwNUtsVE5RdUZPc2V0WGNtV3F4TG5EWjRjNC9U?=
 =?utf-8?B?Z0RTS1Nxelo2Zk4vZUlabTZDTE84c2xhbENmZHRHMGRRVS8rY1lkcDNyeDc1?=
 =?utf-8?B?VWVvTzFNSC9lelRyUkdEckEyd0RJQWsya0hHYjkxY0ZwV0hiazdVMDBjQ2FD?=
 =?utf-8?B?RkNycjRiL1liOTEyd1FQWDA4MUtQckNoSThzLzFRZ0lUbkdQM0tpVDN6RU02?=
 =?utf-8?B?R2llK3JhUkJQNEYxU212bnlZR0tGeUdwbW80YmdQM2JSZDdCTjFxbGJPYUxv?=
 =?utf-8?B?c0ovcm1YVm0wLzVNZjhwbVpvYlJsYWZCeGs1bjFFQjVjNk9UTnVFZWhNb05C?=
 =?utf-8?B?bEFkTmxUWUY1WWRXcnBWbGhpanI3eC95NzMzM21NN2kxMTlLMUpVRlVtZUJm?=
 =?utf-8?B?a3huN1JzYUpsdVZLeUpJYmluMUFOVVBSVktnbHJ2dlFKUkpNT0FoUjB0K2c3?=
 =?utf-8?B?d3pKcnU3L1F1SitVMzY5aDVYdmVTUFJtaG4wcnpoOWZvM0o2aWNjZHdTcW0x?=
 =?utf-8?B?TStyN1dpOGM0TXowWFJKc1RGNmN2eU1FK1NaS3p0bWhDSGFsTjJqcjZ0Q3Qy?=
 =?utf-8?B?bUFVS2hjY0dzMGhOMUpDMHRpRFNIU1lUSkxQcUMvYW9vOVVhU09FSmlOeHd6?=
 =?utf-8?Q?CFjudLmAFXzdU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 23:19:53.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e73761d7-6620-46cc-88d8-08dc79235ab6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9141

Hi Jason,

On 5/21/2024 3:13 AM, Jason Andryuk wrote:
>> +
>> +=item B<nr_spis="NR_SPIS">
>> +
>> +A 32-bit optional integer parameter specifying the number of SPIs 
>> (Shared
>
> I'd phrase it "An optional 32-but integer"
>
>> +Peripheral Interrupts) to allocate for the domain. If the `nr_spis` 
>> parameter
>> +is missing, the max number of SPIs calculated by the toolstack based 
>> on the
>> +devices allocated for the domain will be used.
>
> This text says the maximum only applies if xl.cfg nr_spis is not setup.
>
>> +
>> +=back
>> +
>>   =head3 x86
>>     =over 4
>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 1cb89fa584..a4029e3ac8 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -181,8 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>         LOG(DEBUG, "Configure the domain");
>>   -    config->arch.nr_spis = nr_spis;
>> -    LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
>> +    config->arch.nr_spis = max(nr_spis, 
>> d_config->b_info.arch_arm.nr_spis);
>> +    LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>
> But this is always taking the max.  Should it instead be:
>
> config->arch.nr_spis = d_config->b_info.arch_arm.nr_spis ?: nr_spis;
>
> However, I don't know if that makes sense for ARM.  Does the hardware 
> nr_spis need to be a minimum for a domain?
>
> Really, we just want the documentation to match the code.

Before you pointed this out, I didn't realize the ambiguity in the doc 
about the "max". The "max" in the doc have different meanings compared 
to the "max()" in the code. I will drop the "max" in the doc and reword 
the doc to "If the `nr_spis` parameter is missing, the number of SPIs 
calculated by the toolstack based on the  devices allocated for the 
domain will be used.". Thanks for pointing it out.

Kind regards,
Henry

>
> Thanks,
> Jason


