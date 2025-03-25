Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C34A70759
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926736.1329569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7T9-0001xm-62; Tue, 25 Mar 2025 16:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926736.1329569; Tue, 25 Mar 2025 16:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7T9-0001w9-37; Tue, 25 Mar 2025 16:49:39 +0000
Received: by outflank-mailman (input) for mailman id 926736;
 Tue, 25 Mar 2025 16:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gb8l=WM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tx7T8-0001w1-1X
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:49:38 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2407::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2021d7b8-0999-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 17:49:32 +0100 (CET)
Received: from SJ0PR03CA0165.namprd03.prod.outlook.com (2603:10b6:a03:338::20)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:49:29 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::d6) by SJ0PR03CA0165.outlook.office365.com
 (2603:10b6:a03:338::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 16:49:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 16:49:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 11:49:27 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 11:49:27 -0500
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
X-Inumbo-ID: 2021d7b8-0999-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rt6mXzRAx86fIskw1kzGJqweQOwaBfCywK3FjUE8mTi8UJ7JD+PGQxfVgAd1hcUAQHq/0sHzc9VyAlG11D6yVyPA3/HucgbPQyNd/GaLQU/LIG5VYOGZn867hXgR2aId77tT+QRmAdc3eqedjJLTOJen1RdRpScus3EzBzP/3lmazFz6R8rhYox4/a6iaA/MmmiXMw75xCKf/hcZjZKt/GkbgNuDjujClzW/phjNd58hTM5AUTW5wTWRhMoKaM6Q1fD5h7Vz1dewBIMYdfnPwTvGuZLnpMIlB3UQOAuznVtTlT/LHaxgGnaum0kLEXXT0lW948LvReYtjWUgeJboug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HycmxVDEqqZCPf74R2+PCdRep2uYwvSEg3Z9pvxEVqI=;
 b=vQwIXVzNmKLUCAh8sDXs5015NXGBFcuWTFu3oErdNeWO0ZUpWMYKssy/2FTkUYtqQLyCZdLcJFoKA6uIavB/VmwRsFCbh8p1B/HyCiN3p+757SCn0LC9NLal7m/k15pTwdZypizIrX+9x1eSSp0TNEHp+PPjZ6oMMZZu8HiuJh4et3L+I6vzkW8kVtXgVV0q5NrjwEzcQMdVhiQwJjqrpk6aRrs8sEuA/4QVEnHcVYBLAbRD8G5Hndf35PtOCayU/CjUjQVXcu8AAHRZ0wX3E7bnlvtqY4sE+GqEKfxXkOvbYxlCwu/t9G9Cw3QihKdvlUdNMJ6lzTVPjBaTym13ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HycmxVDEqqZCPf74R2+PCdRep2uYwvSEg3Z9pvxEVqI=;
 b=w57yMdihKB9C51SMbd652dZIaTVuIqW1/RC5kX1iAh7FtXYNh4KQVDCJlbZv3EP4m7Pes6LN/uQW1cXSpNDEJbeKNbxCQu950A9TdupOKubvvaHMVvwib21NL/SzwKqC5+MlFsflmP2dVYdyWxgr4ka2HWiITsU9i5I6/k0lUVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <92b5c3ae-716c-4ea1-95f5-65150fccf39f@amd.com>
Date: Tue, 25 Mar 2025 12:49:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/acpi: upload power and performance related
 data from a PVH dom0
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>, "Roger
 Pau Monne" <roger.pau@citrix.com>
CC: Ray Huang <Ray.Huang@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
 <20250306110824.1506699-2-Penny.Zheng@amd.com>
 <45640c36-0b7d-4502-bf4d-df1c1d17d528@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <45640c36-0b7d-4502-bf4d-df1c1d17d528@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 93598dc3-16a6-42e3-6944-08dd6bbd025a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEc0UFBZMWx2RjRuQzV2VFFGMmQ4UFFKZldBc01sNDdDYW94WXNyWGNDUlQ5?=
 =?utf-8?B?TTVGL0toSVBJMHFsNm95NWVmd2d3ZTdwWTFRRFhHcW1NTTVhaW82MDR4TmtK?=
 =?utf-8?B?b3d4eENjbjd6OG9hSXNQdE0wTkdTNVM1RE4rbnpHeVVwcEtyWDNXRks4QVdQ?=
 =?utf-8?B?SnF5NzdneTZQZUFzb3BJWGoyRmovMjR3MldkQmUvZlh0dnErR2RhM1FBbXFE?=
 =?utf-8?B?Zkp5Y1VMTWxIaHF4aytBcFRaU3ZqZytkRTJydHZTWlVPL3BsRmFIbHVuTnBY?=
 =?utf-8?B?Y3h2ZHRnU3QwZ3FYQzgrOTZ4YncvYytHc2dmUXZmdWlzV1dNM040MGNQdEUr?=
 =?utf-8?B?bHBJbkRhK0twWTlGaUpYb0kxNnJDendTNG1VZkl6MFN2TjVUT3N4UHM0VHZT?=
 =?utf-8?B?K256QklSMXhEd3R3THFSWVk5TTBkeGMxZHpwNExEVVhTRnZaUG5EWCtQcXlv?=
 =?utf-8?B?cFNaNVlMUnB5RzRzQXFWV09oQ1h5NkxHL0FQQXpIU1dxTzN3MjQvSk4zaDQy?=
 =?utf-8?B?bjN5aTNyM2Nidkp0b1RRaVZXSUdTUExuYmgvMVpQYUpjV0pTL0tDY01xcDlr?=
 =?utf-8?B?NXMzMWlTY0ZsMkMyaFpJZHg4aktxM2xHR2dIZVE5V2RhSlorUEJ6dGNYM2Zs?=
 =?utf-8?B?aG1MVWF3U045RzJ5L1drMU9hMGNla0p2bEpocm9IYjFQdDl5OXYybi9nTGVP?=
 =?utf-8?B?dTlHbm1rcnFjUjBxQlIrdmJCWHJmQ1c4YUlSMkMxdG1uL2xjYVVub3RoZU5l?=
 =?utf-8?B?OGlZUUM3ZnVXYXRPMTFEajlMMnN4NkJESDZBaXd1QTdTcjNCYWovRTVZSWJs?=
 =?utf-8?B?VER2TWptUjRkSzJnK2Z6TFlHUCs0QXJhdkM0SkRqa2tUV0U2dHAvYWZ6WUpK?=
 =?utf-8?B?YXY1T0dpZDdoU29DVFZqajRYeUdGaGp5dEJNYjhxMGRJcWtBc0V5UGVmZzNK?=
 =?utf-8?B?UFUzaklqUGFTSFNWUDdxNEJVd0pkaGNsSU91dlhEUUUzVSs4OVZCcElaQkdE?=
 =?utf-8?B?Q1BlY080dUVNd1lJeEgydUN0Vzk2TmRNbWN2NytRTFF0eWhDV0xXNnVrdm5Z?=
 =?utf-8?B?dHFzRk5md1FUSVpiMkdwdEJ2bWw5NEtuWEF2MFRyM3lZYXl6cDFWS3BwNThU?=
 =?utf-8?B?Sk05Qmtodjc4cSszdTBycFlhL3lLNEgzbCtyMXdCbXhrcW03NkZQZXNmRXgr?=
 =?utf-8?B?OWJqZytSYzZXWENaMHliTHFKUWdDdXVxWGk2a0tsU0lCUXd2dkxTTXVHajFE?=
 =?utf-8?B?T0hxenB4RUd6ZnNsRk1wcVdXVys4ZkUyZ0o5b0tYMXRyelhuMEtpOFlXYmc0?=
 =?utf-8?B?cHNiR01LSi8rakVUbklkQTIwUk1mYVJLQTkzMy9aejNvaFBsaUJIZU04dzBN?=
 =?utf-8?B?SEVBRm9IWWtLY1VTUXNNTUFJUHJwTjdrR2VmWjB3OFRReSthMC9ReWlQeXZt?=
 =?utf-8?B?aU13U3FpWmMrQlJnNndzajRnNHJEZDk4TVZ1K1Iwd0JaSFpxNWxYZDdocXVM?=
 =?utf-8?B?WmN2ekw4UUJQd2ViUEVBNTZJV3R2c3FKMFdSbEcrck1TVHNtUENuM3M1YktX?=
 =?utf-8?B?QW9RYnFjWU8yVkdFdnJvKzAzTWdndGZhVWR6dUVQTzdNc1QxQTY3eEZEN29w?=
 =?utf-8?B?c2wyU0xybmtONndVbDVIS0ZvSWozTmNyb0NSanhoMnlPWHdRaWJUZEhOOGp3?=
 =?utf-8?B?UE9PQ01BTGJOc0RnZWMwb0tjWnBkbWo2ajh0dUY2L2pCWXJaQTgvWWtPLzRX?=
 =?utf-8?B?aW1vdE1hbVN3d2xMaUszU0FvQ1IzYS9WaFQ4Vm5sMUdUV2xleVdKZCttM2hF?=
 =?utf-8?B?Rm9kbjNtRVJSOEFYbVJuN2ZKSlFVMG5PMHVFNkM4TzZLZUtBN3cxK3c4a1lN?=
 =?utf-8?B?dmg4OFFlNlNGaGRSdldJNk1tdzdqWW10QWUxb2hOTTErK2Zoeng0ZTQxeElX?=
 =?utf-8?B?anROWHlna3hlQjd4bE05Z3NsY1dRUVBqZ1ErRUhXR2wwV1VCaXdDU0tobHBG?=
 =?utf-8?Q?QuYQAbMP2GOf/q0gYY8aoUleAcPjGg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 16:49:28.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93598dc3-16a6-42e3-6944-08dd6bbd025a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541

On 2025-03-25 12:17, Jan Beulich wrote:
> On 06.03.2025 12:08, Penny Zheng wrote:
>> From: Roger Pau Monne <roger.pau@citrix.com>
>>
>> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
>> report the correct numbers of vCPUs that dom0 has, so the host MADT is
>> not provided to dom0.  This creates issues when parsing the power and
>> performance related data from ACPI dynamic tables, as the ACPI
>> Processor UIDs found on the dynamic code are likely to not match the
>> ones crafted by Xen in the dom0 MADT.
>>
>> Xen would rely on Linux having filled at least the power and
>> performance related data of the vCPUs on the system, and would clone
>> that information in order to setup the remaining pCPUs on the system
>> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
>> that none of dom0 CPUs will have the power and performance data
>> filled, and hence the Xen ACPI Processor driver needs to fetch that
>> information by itself.
>>
>> In order to do so correctly, introduce a new helper to fetch the _CST
>> data without taking into account the system capabilities from the
>> CPUID output, as the capabilities reported to dom0 in CPUID might be
>> different from the ones on the host.
>>
>> Note that the newly introduced code will only fetch the _CST, _PSS,
>> _PPC and _PCT from a single CPU, and clone that information for all the
>> other Processors.  This won't work on an heterogeneous system with
>> Processors having different power and performance related data between
>> them.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/pcpu.c               |   3 +-
>>   drivers/xen/xen-acpi-processor.c | 232 ++++++++++++++++++++++++++++---
>>   include/xen/xen.h                |   2 +-
>>   3 files changed, 216 insertions(+), 21 deletions(-)
> 
> No dependency on another patch is mentioned anywhere (the cover letter
> only says the series is based on the very patch here), yet the bulk of
> the changes here (to drivers/xen/xen-acpi-processor.c) are meaningless
> for a PVH Dom0, because of
> 
> config XEN_ACPI_PROCESSOR
> 	tristate "Xen ACPI processor"
> 	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
> 
> (note the XEN_PV_DOM0 in there). Is the patch here perhaps missing an
> adjustment to the above, to use XEN_DOM0 instead?

Wow, I'm surprised you found that :)  Yes, that is a build-time 
dependency, but the runtime dependency is only on xen_initial_domain(). 
Yes, it deserves updating.

Thanks,
Jason

