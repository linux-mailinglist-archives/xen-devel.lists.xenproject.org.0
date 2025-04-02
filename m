Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD8A79240
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 17:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935947.1337307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u007w-0006E2-Gd; Wed, 02 Apr 2025 15:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935947.1337307; Wed, 02 Apr 2025 15:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u007w-0006Au-DY; Wed, 02 Apr 2025 15:35:40 +0000
Received: by outflank-mailman (input) for mailman id 935947;
 Wed, 02 Apr 2025 15:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MBi7=WU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u007u-0006Ao-NE
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 15:35:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e8b2530-0fd8-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 17:35:36 +0200 (CEST)
Received: from BN9PR03CA0201.namprd03.prod.outlook.com (2603:10b6:408:f9::26)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 15:35:31 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::93) by BN9PR03CA0201.outlook.office365.com
 (2603:10b6:408:f9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 15:35:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 15:35:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 10:35:30 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Apr 2025 10:35:29 -0500
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
X-Inumbo-ID: 1e8b2530-0fd8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf2qh6UPsgoMlTWhftBEZ33exZPzDFLcBl5DnfIx9s31txNo1o35+2PnfHUtj6SHuN1XQxKCyxI8sNyh5V38gv50LYuFEFLUiLUz5HDTSqmskLaHgNWixCf69yDP3GG83R96lnGi3ZNZ5BqUSWlUjjdKbNoOF7BfFSCbXEGaU8OlW2V3FEBK5aPNUIxJzSmRTPyd98p05anCA/Dq+xnjIiTyij452MuZy9efavTPg5VL8NnMPMR2dm/BEqjWkFMkWH1OJaMpaEZYZmAoi7KB8ihZitxOcHebA4ZZVZODEofJKW7kDZcLsrqR7mBo5BYcxjwEIkEBBMwXTnNDeBhhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG6CIx2DDe8kfe6fYcgM7yJYGTgsvNPGe0+TfyQj3dU=;
 b=DDyK76fv5QqpB+4pvBEzkS/Z2/nHdVLtdOvwFM1hEqD4AJ8u2vqr/hOA+4alLQ6wNH1OB47quvv5UVhxCY5JbbzkwpT2/MabcL6B6GVXT9PUgs2rCFuybQaM32A2kvPq0esWZoO/oGoLoggqmPbe/ufyBhCThGvTuLZaMlItWGgdoMRo5r0cWn2pDdOZl4wLo0SJtRlJVsAFqfYrB5urgYG+Cp4A/q/QdI14hXRlT43RAr0ju1DCmy1SHAGdd7RCJJbrvUcHI6415QrpQ0aoY5yK36QwbGgJbZpwddEtZu9z4qt273ln8RwWLwcXX2AH83J8aV1TKXdeJ/8Ci2X5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG6CIx2DDe8kfe6fYcgM7yJYGTgsvNPGe0+TfyQj3dU=;
 b=HdOevBj27gplEVAq7tFW1WRk0vrgpyCS1UHyhnuBQkobjyk0+ugzaERmoMwR6SPXiN9wH5QXNJMF3cNqB/V4SVUhmiCTo5myp09T0IiSSdKJehihen3PYvJFgSujMFonSCxcpLqkAjfVLlqp9HA4wOLH0iwbCvJphU4YIWhLK9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0d36750a-34d2-460b-a021-5afb7c2e7039@amd.com>
Date: Wed, 2 Apr 2025 11:35:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] xen/arm: Add capabilities to dom0less
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-7-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2504011654320.3098208@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2504011654320.3098208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 254c8433-8121-441c-7e01-08dd71fc008f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3lxZFRVMURBa095cWZFTnR3a0F3Wk5oZyt0clJWcmxudGIvMTBnNEZPU0ds?=
 =?utf-8?B?Ty9JYUZCT0VJamRaV0doOFh0YWorN1IyZjV2ZmRMbUZjRzJseXdMUXZ2NXBM?=
 =?utf-8?B?dHNLamszalFGOG1LZUl2cU5aNmI1STJRUCtXWStsMnlja1kwekU1ZUI5ZS8v?=
 =?utf-8?B?Y2VXTzg5MVRBRkVYb3lJNU5lRzZURThicFYvQ092UnFNd0g4UTk5NnFOMXBo?=
 =?utf-8?B?TFBwcHJ2Y012bG9Namc4cDBRVlA5UGFaWHEzajFOa0FkYU90WnVpZGZITTl6?=
 =?utf-8?B?bC9KdmhvNFpHbC9LRFN6SkRHRStUZ1pyUXJmaDlydEhNU21NT2J1RE1PUEtY?=
 =?utf-8?B?SE5YYlBBV3dnNmpucFppU0FBZ2pqQU4zNSs3a2trN0FDaFFLeHNidDdhRlNC?=
 =?utf-8?B?Vm0wclBRTndzYzVjTXZ5SWQwZjVXZU1VRDN2V1pwODUvTThHZlM0aFhDSUlD?=
 =?utf-8?B?ME5qalRkYisyTFdlYmNubEd0UVdReVNicWVjQTdWaWtHaFpuR1lFSXJqYkFX?=
 =?utf-8?B?QTF4SEdhOGFQZ1RkR1hSSDY4c0pVZGpyZmEwaEFEcjBzTVB5STFkYnF3Q1Iz?=
 =?utf-8?B?MDUxUGc4ODFidzROVTczbHQ4Q1Z3RlZLMGh2cElsbVQvNFNPMnp1UUw0STFn?=
 =?utf-8?B?TlV5MEx5cjJzSkxBT3p3WlRKQVNGb0lkU1A3elErZXBEblQ5VGdTbjJoWjJ4?=
 =?utf-8?B?cVdrSzF3ZlZQWjhrRXhEek1mMEZ1bXpmeFgwOTNlMDJLVlF6dlpwMjN5Mm82?=
 =?utf-8?B?NVcxRzZMOHdOKzJPdUErMTl0dG5UdGJ3cmxVUlBhejRCcXFUYTNubkFxbmFE?=
 =?utf-8?B?UUFZNnB3TmQ5VCtWREIxVGFhSDJCYnRLNEZ4emkwZ0hibGU4dXZkTWY1dFZy?=
 =?utf-8?B?RlpvKzI4eGVXM3hVcHplTkJCRzhLdVMvb2VaMGwzRWlMREQ1YUt4L3Z3OHJN?=
 =?utf-8?B?eWdySnJEZlZJU3lKN25MVTFCaXpwSlk4dlc1d20rRjYyZXEvMk9GMHB0OFVv?=
 =?utf-8?B?V3MzWDVua0xKajNDRzR0VEpxV1ZUOTlFWkZZK2tEa0tQcVgxYXJPWUpDbVRI?=
 =?utf-8?B?UkpGRWlza1FpVEdBdDMwRW85amp6QWhZQVJmV21JZlVUa2J3MjFEVFpJazZT?=
 =?utf-8?B?NjExcU1BMGtRalc0Vy9JWE9FTW5JQVRodG0vZTh1djVWa2tBemlOb2d3OVI5?=
 =?utf-8?B?SFhCVCtBTFNwcWR6ZlZmK3pGUncxSnc4bjQweHVLUVVENTh1NERjb0RZT3hC?=
 =?utf-8?B?b2hCWWZQZlVqSXEzWCtWSnQyL1lUNHhTUTNiSWxkamlZYVRPZm81ZGRrdTFL?=
 =?utf-8?B?dVJGdTFLWk53QlJPK29YRWtEVTZkZ3VMOW16QWVsTTVFNnMyK3hyK25HTXpZ?=
 =?utf-8?B?ZTJObHBlRVlIZ1lpMUVqWmZqWFRFY1RFc1cvUVNjYWNKckIxU1VoSDhjVEZ5?=
 =?utf-8?B?amlhb2V2ZmMzbG5zeU9UMzhKNmZkZkZkaVRnaUZkVDlJR05DNGROaGxTYXQr?=
 =?utf-8?B?Zys5N0JRUlZ5VUNoQ2p6NWR6V2d5ZDN4TW5RVkFlU2pEdXlmQ1ZVK1QvL1lX?=
 =?utf-8?B?L1MrU1Niajl1V3ZCR2NyamlwS0FHTnU0T1dhMjlZanQxcUhMNzJ6L1cybUFO?=
 =?utf-8?B?SkVmdEJuTWRia2lXNnNUeldJZDFidGJqUEtPSjVHSzNHQ0U4YzZzdEdzdUFF?=
 =?utf-8?B?QnE2SVBoSXVjeGNQNzdGMlZNWXgxQmxXMXZtTStsUnNXa2p4Z1paUkJWSEJl?=
 =?utf-8?B?ZElRZHV5TzlUYzUxdkxPanNmZjFhczJya01mYnpmekRTckd0UTJYUlNXUHVh?=
 =?utf-8?B?WDg4SDlMRUh5MEpGd2gxbmowS0luNnlVRVlhZDhzY3FUbS9UbFVLa3lndHJv?=
 =?utf-8?B?eWpxbHI3SGVaU3VoL045SkxqN3g1Mlk2K212R0xnUS93R1FHVCtDemFHVVVZ?=
 =?utf-8?B?MkFvdXptVzBWWStkZjk5a3NRbXVaY0NUbmpDNzVVKzRvRUJZRzdRS0xISkQ4?=
 =?utf-8?B?ajMwN1JVMzRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 15:35:31.1110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254c8433-8121-441c-7e01-08dd71fc008f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429

On 2025-04-01 20:03, Stefano Stabellini wrote:
> On Mon, 31 Mar 2025, Jason Andryuk wrote:
>> Add capabilities property to dom0less to allow building a
>> disaggregated system.  Only a single hardware domain and single xenstore
>> domain can be specified.  Multiple control domains are possible.
>>
>> Introduce bootfdt.h to contain these constants.
>>
>> When using the hardware or xenstore capabilities, adjust the grant and
>> event channel limits similar to dom0.
>>
>> For a hardware domain, require an IOMMU and disallow specifying a vpl011
>> console or nr_spis.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> v2:
>> Fix comment style
>> Make DOMAIN_CAPS_* unsigned
>> Remove forced directmap & iommu
>> Require iommu with use of hardware domain
>> Limit to a single xenstore domain
>>
>> There is overlap with hyperlaunch.  The numeric values are the same.
>> Hyperlaunch doesn't expose the values in a public header as done here.
>> Is this to be expected for dom0less?  It seems most of dom0less isn't in
>> a header, but just in docs.
>>
>> Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
>> domain-level capabilities.
>>
>> Only a single xenstore and hardware domain make sense.  Hardware domain
>> receiving all hardware can only have a single domain.
>>
>> For Xenstore, the logic latches the single xs_domid and uses that for
>> all domains.  Also, only a single domain can register for VIRQ_DOM_EXC.
>> ---

>> @@ -1020,6 +1023,40 @@ void __init create_domUs(void)
>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>               panic("No more domain IDs available\n");
>>   
>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>> +        {
>> +            if ( val & ~DOMAIN_CAPS_MASK )
>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>> +
>> +            if ( val & DOMAIN_CAPS_CONTROL )
>> +                flags |= CDF_privileged;
>> +
>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>> +            {
>> +                if ( hardware_domain )
>> +                    panic("Only 1 hardware domain can be specified! (%pd)\n",
>> +                           hardware_domain);
>> +
>> +                if ( !iommu_enabled )
>> +                    panic("iommu required for dom0less hardware domain\n");
> 
> The panic is OK if "direct-map" is not specified. We need to check for
> direct-map before panic'ing.

Ok, I guess I misunderstood Julien's comment - I thought he wanted to 
require an iommu.  I can re-work it.

!direct-map && !iommu will panic.  Any other combination of direct-map 
and iommu will be allowed.

Hmmm, "passthrough" and "multiboot,device-tree" are essentially ignored 
for hwdom right now.  I'll require them to be unset for hwdom.

Regards,
Jason

