Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B9CB3901
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 18:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183129.1505905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNjK-0002SP-E0; Wed, 10 Dec 2025 17:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183129.1505905; Wed, 10 Dec 2025 17:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNjK-0002QU-B4; Wed, 10 Dec 2025 17:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1183129;
 Wed, 10 Dec 2025 17:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11gW=6Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTNjJ-0002QO-4X
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 17:11:57 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52fe628b-d5eb-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 18:11:54 +0100 (CET)
Received: from BLAPR03CA0156.namprd03.prod.outlook.com (2603:10b6:208:32f::29)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 17:11:45 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::60) by BLAPR03CA0156.outlook.office365.com
 (2603:10b6:208:32f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 17:11:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 17:11:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 11:11:44 -0600
Received: from [172.17.249.106] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 09:11:42 -0800
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
X-Inumbo-ID: 52fe628b-d5eb-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv7AKninKvnTxiuErrFDMYr8U1SOEUK+6AD+N3tUHTAz7dPh2XO49I2zMZ5qPuIKlmKExa5CJvq1DignzUuouHE6pzh8xoeU0/ar/fp+dLOHOV8NfwNsf8W399y8AmZ4F+j411rLLH5VoIGXjkYvKDLGXyLfl7sZLL61dbD1xBVZxzAlyCnY+DU1HC2Afw2stPMOCfiS5up54mRULdYYKJIy6caVuepR12wWi8Jw25iEh3YQDJAKCZ89q3/yI5fPQF/+QZ++5jvt3G++AFNWfiEyciP4nBlUvRMxkDMXoFjy8B/mzGx8lH+AnihbLcManR4/5UEAM/hMcNm8JJRPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZpftQCiPGy8uMm3Mry9au9dXZwtVHnc8x+qK2TsvI0=;
 b=HxUnIs3Y8exOkCOFJqdngDgI+0ftTue1tXDT+3lLdN7lAcoyx1Lqv00R095vNknVzY9pKLA8BoKLIonOQv3m/szk53IbJqJbDb2nTPpOwu3LyoVdaDONKz9y9pQHAwBvyubYtY3CzA5COdOxPCNodJ5Pm5p3tU6Sdwt0b3IYxb4ZUYW0FfyMPUGvMYd67PKLHw4yP2SVDqMCQ+ogHYpFsRoev55vlicV0Wj4KgqeJoJQ0BfWCZZ2I7aWbAvbi5XYKumyeMGvw9GnhbcGdllzXFGtv4Pgk9v/FG+KWf6ERdZK1QoQ/BT/+nwBpYJmlpaMLN5RQwjZUVhVGSemSifOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZpftQCiPGy8uMm3Mry9au9dXZwtVHnc8x+qK2TsvI0=;
 b=WktIZSLPmUm8qK4P4JElHYDQ43mF3a8wajcYhhtVoj8budcudX4lGlWJ3zDch6Gx4xcMSXGdLLiSIHqHH+DEazcHC+xlFA8pNzpwl/3iAXSqK4ry1XMV1p2qWu3/ssR6nuUaQlOP5iY69tzW1MpMoGBo+hSdlp3/lfKJT47xy50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0949d825-0ae3-4cfe-a1b8-0df176a107e3@amd.com>
Date: Wed, 10 Dec 2025 12:11:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|IA1PR12MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: a1592a96-8d2d-405a-c0fe-08de380f3266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1RvOVdQajliOFd0NnhZdDBCOXZxalYra2dVR1BvTFp3b0dHaWRyTlRGcERS?=
 =?utf-8?B?U01ITWo0ejJ6Y1hGNnphZUxPaFNRdm1hRlRmY3Zab3VLODhnRWtlUEpsU25q?=
 =?utf-8?B?VlJTc0lVNkVTL0V4NWsvRUhUVXhlR2tMWXRBNmJPZFdCZGJOdG5pak1FT0dH?=
 =?utf-8?B?WDlGVGtNTkMxaVVZRlZwZCs2SDdnT1BZZTlqdFZlT1ZQY1BHYUdpSS8yclFl?=
 =?utf-8?B?THFBSDdGSHBNN1orVFBlNU5FSEhUQWJheldmRVBsc0orMSsrYytETTlCbDd2?=
 =?utf-8?B?cEZwek1GMkh6aC9yNmlXclNFOU1sR3pYcm91YWlEZFpUMTFZSnVERG1KaFEw?=
 =?utf-8?B?SGRLYkVvbmM5aW12aStsZWNrK0M3dHZTTlBhQkF6SFQ3RWhkMUxnVmlyaW9w?=
 =?utf-8?B?OUIzRW54RVkrb2l3RnkySGsrb1hlRGY2UGxHcGhhL1hqaUxtTFdQc1FGUVpH?=
 =?utf-8?B?Z3FxU3hFMml0M1JFU0ZaN1V1WUxVWUlNOGpmZ2JiNUVLREVrUUthL0U1Zm4y?=
 =?utf-8?B?TVp1cy8xSWZWV3gycTh0SXhrbmJsZWxIYnU2VndzQ29vSzRIWFd5UkEyend3?=
 =?utf-8?B?ZGVkdUsvTjRqUnRjdUYrTWFoMDFkbUhtL28rZCtlVWlsS2FiL2k5UlNWenE5?=
 =?utf-8?B?ZFBqQlRXa1kyNjd4TXVNK29hRmdUTnBpSFJNeUt0MVE2WTN5VkZsUGJxVjNU?=
 =?utf-8?B?cys5S0RNZVZCYm5tOGIrM0RkNVgrR1ppT3NrYkZ5VzVBSFZUcTI5UUVoZDBY?=
 =?utf-8?B?cCtsaTBtY1A1bWhYZjlrK2xCd2dXQWYrTE5xVmRFL0hOWEhtZlBOUENGL2xy?=
 =?utf-8?B?RTRXdmlCc0FRQThwekV4aTNZaTVKU01EQm0zUkVFRnpZOTZ1bmtOMlBJMmYz?=
 =?utf-8?B?YVo5N0pET2ZyWDZiclgvRzk0KzkwSm55VDkycnp0cGlpS1hjeVVETVdGUUIr?=
 =?utf-8?B?TWRSSGhybnNpRmQwUUJCN1p2WFprQ0xCdURWZVlIeFF6VFh5K0pqRnRKVkRY?=
 =?utf-8?B?Y1VibmpWRHA1VGdWZjNPczdtN2VDTW1HbEwyY3RsbjRmY0E0U1lzeVRxYXJG?=
 =?utf-8?B?TUs3bkJqdTA5dEthbGFadFd4d0ZSK2FCb3hmc0ZkRmxCT3p1UmxCVmMzRnZG?=
 =?utf-8?B?SURjTmxFSzQ2SzJpZ3c1b1hZdHNyMDNsbVZvR2lPVHZmeHJlbWNHTzFHMlNp?=
 =?utf-8?B?M1I4UVhETjZUOUFJY2ZrOTVxTWlCQjl5d1EzL0JwVzl1UXRwREpmVVk4QXRR?=
 =?utf-8?B?M2VFU0lXWFhiQ25QU1ZOdThEc095a2pNcENNZzFOK1RpOGNDemxNbVJScmJC?=
 =?utf-8?B?WlJEZUdaNVNpdkdEbkt4dmlndnJ6Z0dIR2ZiNkM1TWtmc0NCZjM2dC9GRlR4?=
 =?utf-8?B?NnhMTUZFMEU0VlJyQ082VVhPUXYvZ25yOG94aUJVNHdUZnB4TFRvL290b1RM?=
 =?utf-8?B?TW11NGNjVTl2Mi82aVIrZlhrWlVSVVVhZUpZL3FjODNMSWxiS2s0WkgvL0J1?=
 =?utf-8?B?NTJkSlNrUnNlUEhXZUpuRVkzTkRHTjFxTElLc2kvN1hzc2NVb1gwS1lEZVVj?=
 =?utf-8?B?bkNIdmZpNFAvTm5ScVhRalhUQmVZQ0lWSHI5Rkt2dzQyS3RzOEsxOXQydUdD?=
 =?utf-8?B?RWlCL1lZajlXNUQ0eXVvQWl2a1lVNlNzUXR1Um5JclBNV3duK0R2ZnBIbGhY?=
 =?utf-8?B?R0d6MDVtRTd3YXhKcmNVN2xkUkU5WEJIbjJuK2JsM0pqcDN5VlBEMzlDRThT?=
 =?utf-8?B?dmNhY0tHcmQ0QzlWcXF5UE5XTVRkTGxOcWJhcnRvd2QvR0N2clF5QWJvckJa?=
 =?utf-8?B?bVZQZzhDcXFhWVB4dHZnS3JITWV4STJrbkE5WWJIbjcxcmwxSWtCajlmNXZh?=
 =?utf-8?B?T0RvcG95SVFhcEZEQmN0OUJoTlNLR3JCMHJCaDh5SUJUTEVhdWo2a3FvQ2g3?=
 =?utf-8?B?S1NaOVFPMFdQa000enorTk9nR0lhSUEza1FpSTRjUlp2RWo0R0dvd2dxSTUz?=
 =?utf-8?B?Zm10Vk1MK0dtVUxoY2llU0ZZckF2djMvUTBJNSs1MXZDRXRwNnk2aTJ0azRE?=
 =?utf-8?B?TWkzM0dZTjl0KzF0UEJPNWlRdXNyS2E5Z0RFTmI0YTV0cnY0UWhyTjg1M2Ro?=
 =?utf-8?Q?Q1S0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:11:45.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1592a96-8d2d-405a-c0fe-08de380f3266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116

On 2025-12-10 11:55, Andrew Cooper wrote:
> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>          . = ALIGN(4);
>>          __alt_instructions = .;
>> -       *(.altinstructions)
>> +       KEEP(*(.altinstructions))
>>          __alt_instructions_end = .;
> 
> Thinking about this, what we need is for there to be a reference tied to
> the source location, referencing the replacement metadata and
> replacement instructions.
> 
> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
> might be able to do this with .reloc of type none.  In fact,
> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
> 
> This means that if and only if the source function gets included, so
> does the metadata and replacement.

Yes.  Thanks for the reference.  I'll take a look.

Regards,
Jason

