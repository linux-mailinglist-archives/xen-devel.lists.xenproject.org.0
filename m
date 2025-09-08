Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CFB48FEA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 15:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115259.1461955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvc6G-0006yX-PD; Mon, 08 Sep 2025 13:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115259.1461955; Mon, 08 Sep 2025 13:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvc6G-0006ux-L0; Mon, 08 Sep 2025 13:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1115259;
 Mon, 08 Sep 2025 13:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuLA=3T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uvc6E-0006Nv-KD
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 13:40:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a0df8ef-8cb9-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 15:39:50 +0200 (CEST)
Received: from CH0PR03CA0399.namprd03.prod.outlook.com (2603:10b6:610:11b::18)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:39:45 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::18) by CH0PR03CA0399.outlook.office365.com
 (2603:10b6:610:11b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 13:39:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 13:39:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 06:39:43 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 06:39:43 -0700
Received: from [192.168.29.198] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 06:39:42 -0700
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
X-Inumbo-ID: 4a0df8ef-8cb9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc0/sOH8Mqt7iBi8p3JGK521OAWo/21FS0rMkrIkJ6ohdcIFC12ck379bOAi/EgcYT7QjmC+2ByZpIsyrk8MXzdYvFcqAaSlqEwIhdR4DbEUmO5cDQmH7xQHYSyr+nVV2sPI74PX2n1f08gwyHo1yrPxdMECbFTaEVMZpVTe8+vRBgVuXQmC9SyiUJxdj6jDyvtiGGJPgCgzoih+JBrMCTHWJ+UZ5B1h9iSBGBy866fPAQegCYWl9/2cJrELOn8TpRuvwGSQ+U9NjI7mH6BvzRQ8YPRGGTdyHsTI6kASq2r0rVxODfH0jqcYsxpdUNPOb/TTUdduN9McvaP0JqfT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u03ZaRyk2iNmWtEBJ5W6eTxBCizcl+7Kw5AqzdepHzA=;
 b=eaxU99lyiedyFlutxm014HnoqSHglqD2xaeW7fI5R1hZX/Fz1Qv9qHyMFcoBx7bSNQVlILzaTb4Mh4q6A8mgERTBX7YDwXtgdwJIw3VeXTwp72qVoGXBxEWby0s9wu9WrvgzH0zOhgTowNoBcjv3Y1uHlmhSFzRLn+WFLPzvOFbkDf6wEQ9MtHgwDAiEKlEYKfYB7oDNujlSdPOF5R2OXbexPnrn015FUapm9/4iA825CPlGoU89d0yAEuaM+npJX5in5LZ0XE1CSTau4GWQH8bNBVaGwoRjsXCulrsw0ygBwhi6nQBHN+mXh+xb3aZ7vfZQSK7tiRglyCuyahktaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u03ZaRyk2iNmWtEBJ5W6eTxBCizcl+7Kw5AqzdepHzA=;
 b=kpNw24vbC1roY96sMDrYSQLn0YLyXXbeOSrJ9hQbYzZdwo/AKOO2yTWrrJVzKrhBxmxxO6w/r9lJxCLTKrFpKcY5TBjAL+6eSGQVUVD4t8VEOiK3fcAJrJGmdu86DDScwYsMHSTJCrGM001RrG6FvzzafjUTOgQFDKIEdmrHA7Y=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <b4a86a0c-0e4d-4aea-aac4-1c12f7062ca1@amd.com>
Date: Mon, 8 Sep 2025 09:39:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mcheck: allow varying bank counts per CPU
To: Jan Beulich <jbeulich@suse.com>, Soham Dandapat <Soham.Dandapat@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250905165212.96843-1-Soham.Dandapat@amd.com>
 <32f89ab8-9742-4bc8-a5ef-848b66e788b2@amd.com>
 <89d0b668-537b-4ee4-8cda-e0d95d9eed90@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <89d0b668-537b-4ee4-8cda-e0d95d9eed90@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: b2434193-8241-4790-5408-08ddeedd2b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnZjK3pWRkVBdDduS3hrSmRwajgyQ1V3dndVSWNBYW04czZMQjBXVlJhL3c3?=
 =?utf-8?B?eWJNYmFWMWZpbmlrY1FxQVVXaU16a2FSSmhpQ1hxcWlib0pQU3ppTXV4Y0FP?=
 =?utf-8?B?UllvNnY0dWpDd01MeTZtNnQxSDZIN3JHc0dPMzBVYWNVUGdONjB2TEo1MGtx?=
 =?utf-8?B?eHk4ZU9ZY1g5TUxML3YvQ2E3Sk1Rb1dMVUh5SDNQZks2bE5UeHQvK2hDWHlF?=
 =?utf-8?B?bk9VZzJZRllUdWJnLzJVd0pxdzBGRUh2dTE4a0I0K2NtZW5TTjBIbENjTkpF?=
 =?utf-8?B?bjZPVFNMRzl5MjdTK0gxdHlEZ1hCSUdMbmNWUjNRUytmNW5leFBxVkNvWjA5?=
 =?utf-8?B?emdqWS9jeVA3a2NMUm1EWGw0dHp4Yi8vUndERVIycjZPRk1NbHlyc0o5cW5x?=
 =?utf-8?B?ZjE1NmQ3Y1hrNzdzcytxUGNQT2pscGprdkZrQmxrMHZHTWdjVEhnT0M1MFMx?=
 =?utf-8?B?MnphbTRJUHYycGlQYmVMNFF0cEZUWW1MQzNvQkl4MkFpajZ1dnVOVjVIdmlh?=
 =?utf-8?B?aXBwdDBQSW5pemZydEZTem9SV29vOVdSa2hvZEJRR3NMaFZIVnZucXJsRCsv?=
 =?utf-8?B?MW93KzVERGMyd1pUS0Z4NWpBV0E1c3AzcjZXUkpUam96U1pCR3VNaUN2NEM3?=
 =?utf-8?B?aUxiZURnc2p6RUxlVFVlaXVFdzFSVnVxYTlYR084WmxTNjg1Sm14TEdhVldw?=
 =?utf-8?B?NWtNa1dGRFlTUXN6eS9YQWZxS3hVZlZwdW04enZ1QWQxMXN1dnE1bkhSdDlr?=
 =?utf-8?B?SUtzTEdGQmdseGI1cmt1L3BkbkNCbkJsVnptdU9iS0pvRzRYeFd3NzRLei8w?=
 =?utf-8?B?K0RmbExiZnBXTVdmTFhKMzZTMEFRajNHQ0VOZVdjZjhwS0k4Zzk4dkNvSzVG?=
 =?utf-8?B?MkhTZmNnTkZEcUpTTnRCVEk3cnQwQzRoY0pUcGJ2dDVSd3NUL3pxQ3RLVHRa?=
 =?utf-8?B?eVQ5YU1DV3BpK2taM09MNjlQdE1sV1NoOXhMb0dSMVhaMk41ZDRNOHBLR0Zw?=
 =?utf-8?B?UzBhRWttSm5vd2hjL3lyTGdGYWpFa0cvdS82UTJQekFMY0RSTXdwckZEbFR1?=
 =?utf-8?B?N1IrajFxalR1L29NZG1ZMjh0VDhJOVdVeUFDc0xkOEJUTVhqdHErK0FNSnNY?=
 =?utf-8?B?eU9Vem1ZMVBsR29xS05ncXJjTTNqM3pIek5ZMHVWRVViN2JOL1Y1SFdKTENx?=
 =?utf-8?B?QnZCTUNxTGlubnZsc0dnRHZ0cVNXbzE0VXBFb3VsY2JVMGlKOCtYN2d5ZEh3?=
 =?utf-8?B?WTVtU1pUK0lBZm9NN290Skk3OVUzVnN2eUpVS3BtMGFKNlVNWmdwOUt3QjZ1?=
 =?utf-8?B?Y2twZ1hJQTRiTE9DazVlYkJLSWNZTjFUMlpYaHFzUnBqZVhNVzZsdVNUVXBS?=
 =?utf-8?B?MnJqNXh1aFNvOXlzUkQvV3FYeW1aSXRUQlhnUXljaXdGSW5KWkxoWGRXYk96?=
 =?utf-8?B?Z2RRNE43OG1Ub3dVdG01VGVMcTRZU29WcDJWV0ZkaGIwUmtub3I1a1NrNktq?=
 =?utf-8?B?UmQxeWRCeFBMVkpHMDlZRFRUdEVsakdibjg1ekxHUVRYSWh5QlB3T3lJSjNk?=
 =?utf-8?B?Z01ya0lpNTNSLzhnZ2Y3QWVvenZWK09zSUNzVGpZalJBeGlsNGlTckxHMC9x?=
 =?utf-8?B?NU9GRTFIcmdqdVRZUjBkSWpNR3pVOWdYY1dzc0xGeVkyTTh6VnBFaDZRK0lY?=
 =?utf-8?B?RTN0UEVEMlRpaFRKTWIrUTEydjVjdEdDVTR4ZnZhTHJuNnI4cGFKUzVTWkRk?=
 =?utf-8?B?by9TRmVXTjlhK2k3SUM1YzlZbFl4bUNJZGV5V1c1WVRKcHR6aXljUndKTENK?=
 =?utf-8?B?NVRqTGZpY1JiL1Vqd0VFQzFkNVdyOC9iYjdPb3hoT2d0OFdMWFVySDQ3OHU2?=
 =?utf-8?B?NmZOOTBrUDZlTjIrTWtCaDd5dlYrUEd3WmZWSkRpL3BnTkFGOXVrSVJQcWJj?=
 =?utf-8?B?M3dRa29tUnZtUElVaHBSRnEwZlJuM1dnbDg0WmNBUnN1MUU3eHpJUC9yY21H?=
 =?utf-8?B?dCsxQVVVSkNnQlNlTng1aHhQeUpua0Rpc0Z0alF0bGN5L1VxaTA1RDNsSEl1?=
 =?utf-8?Q?zkK0mS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:39:44.1200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2434193-8241-4790-5408-08ddeedd2b85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558

On 2025-09-08 05:08, Jan Beulich wrote:
> On 05.09.2025 19:02, Jason Andryuk wrote:
>>
>>
>> On 2025-09-05 12:52, Soham Dandapat wrote:
>>> In mca_cap_init function,the mcabanks_alloc allocates and
>>> initializes an mca_banks structure for managing MCA banks,
>>> setting up a bank map and storing the specified or default number
>>> of banks.
>>>
>>> After this we will call mcabanks_set(i, mca_allbanks);
>>> The mcabanks_set function sets a specific bit in the bank_map of
>>> an mca_banks structure, provided the structure, its bank_map, and
>>> the bit index are valid.
>>>
>>> At the end, we will call
>>> mcabanks_free(xchg(&mca_allbanks, all));
>>> This function is thread safe and does below:
>>>      1. Atomically exchanges the value of "mca_allbanks" with "all"
>>>      2. Returns the old value that was previously in "mca_allbanks"
>>> So, when we will call mcabanks_free , that will free the memory.
>>>
>>> The problem is that mcabanks_set(i, mca_allbanks) function is updating
>>> mca_allbanks which will be freed via mcabanks_free later. This means
>>> new mca_allbanks instance("all") will never get chance to update
>>> it's bank_map.
>>>
>>> Due to this when we will collect log from mcheck_mca_logout function ,
>>> the condition "if ( !mcabanks_test(i, bankmask) )" will always fails
>>> and MCA logs will not be collected for any bank.
>>>
>>> The fix is to solve this problem.
>>>
>>> Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
>>> Signed-off-by: Soham Dandapat <soham.dandapat@amd.com>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Maybe the patch subject should be "x86/mcheck: Fix mca bank
>> initialization" to differentiate from the Fixes commit?
> 
> That's still more generic than wanted. How about "x86/mcheck: fix
> mca_allbanks updating"? With a more concise title (which can be
> adjusted while committing, so long as there's agreement):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Your suggestion sounds good to me.

Thanks,
Jason

