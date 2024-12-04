Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2C9E4439
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 20:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848728.1263555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIun9-0003qR-56; Wed, 04 Dec 2024 19:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848728.1263555; Wed, 04 Dec 2024 19:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIun9-0003nd-2R; Wed, 04 Dec 2024 19:12:07 +0000
Received: by outflank-mailman (input) for mailman id 848728;
 Wed, 04 Dec 2024 19:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zk2W=S5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIun7-0003nV-ID
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 19:12:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a42ad816-b273-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 20:12:02 +0100 (CET)
Received: from BL1PR13CA0134.namprd13.prod.outlook.com (2603:10b6:208:2bb::19)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 19:11:55 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::a3) by BL1PR13CA0134.outlook.office365.com
 (2603:10b6:208:2bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Wed, 4
 Dec 2024 19:11:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 19:11:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 13:11:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 13:11:54 -0600
Received: from [172.25.146.163] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 13:11:53 -0600
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
X-Inumbo-ID: a42ad816-b273-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky3LKFWY0uzH/WpOBrkV5pkSE60EVx/UKmHby8UJaAh4BGyr+fa75BMqSZLRuwawzL8EXxgKIYZGhG0TW1NNeWpmZUHoW/EZ0wXY19uZIpL5kIgxXpv0L2FE5NfLuxm1/EAZFfxUbEk08N+EkRBX/6z+iZBXjHuT62iNCFpvVUbroBwOiABnqWvHdbt/xEiw8Teid7F8/InzLfrVf3YgLIqq3GMj8RNEXpkAbaTqvPp4+7k/64JHFYPXFFyTFDsj3liRaJkKhGR4q34ey5yCpSXo1osCVeK5OhP83B2LUu8U5iFIBVoFfYu2MazdYI3iwchVTgpjkkVTURW5huXn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIvU9Z5ByWuz4UFhN3A/jP8+K+nyO8vRzw/nm2mnmWM=;
 b=Jy2mW2s1ojAuYbgQxS7zxf/rIaNofAKUhe8+wT+07WZFFtEQ5nz367U48rcr9V7G4Xr/NWtvC0dlI+X/I9T2Z4cq7Y1Eq0MbmdSzqYD8Jubz2FuUEx4FToBX8kaCpT6RX2h+AbFPoMA7YPwmRbSrXKn6R/Xjcrf51PktuyuiVZBP9UZq4Y212LpQ3QGhv2ZnZJTJANnPBzyhH9GbSY/xa3jIwdjDWh2x9Zb2XX4+ZrgJdEcEpKOCljeiwY6xhXSpYuJnrDgPgdcFqhMzDrb97tRXg22AryBOUbYDSMFzGa5PazhJMRDANV5TwFBUHw34TwmLbJYeFzZ3rFjAVkYq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIvU9Z5ByWuz4UFhN3A/jP8+K+nyO8vRzw/nm2mnmWM=;
 b=yOYbqjVGz7u/ff2m1kuOpb0OIY6ZXOXld3EUk4U8Ezo/2plrXQOzeG4I2p2MR6zwzh55kslgz/tzuuWhxIOXyaL0I9N8dF/3Yg8jd8nFFA+XyQzhE3KTVt9CiMTTpYIrSSm+97CFAHCjuDAs3UfyDfRAnjwWO2dtpGDkRTjlyuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <89ab9108-aa40-4da4-8e9f-dfa3bd49e2f4@amd.com>
Date: Wed, 4 Dec 2024 14:11:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/acpi: upload power and performance related
 data from a PVH dom0
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241204082430.469092-1-Penny.Zheng@amd.com>
 <20241204082430.469092-2-Penny.Zheng@amd.com>
 <fc2ef8da-62e8-431a-8a1b-508b3f9d5ef4@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fc2ef8da-62e8-431a-8a1b-508b3f9d5ef4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c04954-d3a4-4f88-626f-08dd149784a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk9UMHRwTFRCbGlSc0kzaytZdVJyR3VKVHp6aE9JV0ZKWjBYVzhYZmJTUCta?=
 =?utf-8?B?enJjclIrMVNuWFpZMGsvcnFEa2VnZnRrV3Y4bjc5VXgwaWkwajl3TEJTR3M1?=
 =?utf-8?B?ZGhVQ0xYRjVFc2dlZmwxaHprU3BPNlpBYStzZVlOcERudkFqRVBSQlVlRUt0?=
 =?utf-8?B?d1cwaWlHeEhCbGRNMUhTT0ZkdFBEWXVNemRZWTU3ZWJOdGpUWk5paVduaUoy?=
 =?utf-8?B?K3AxYmU4VzdpMk5oOFJ4T00zY3IzMzNhd21jWVdHMDZBa2dyRzZEZmprdS9Q?=
 =?utf-8?B?bHVVb3FkSTFTLzZhUjFSU2JINFd3dEE3Z3Q2T2FxemtSczhkaXZBNm1wWjhL?=
 =?utf-8?B?Y3BtNTM3TWRpeFUrR3pkSlFsL1hLbC9KSlZtY1pmeU1kMWpBS3lTN2JnRU5m?=
 =?utf-8?B?ZXl1dmZwMkJNL3JiUU10TkorWndnbW1iTjZObXhLRnhXcmw0WEJvNTBpS21C?=
 =?utf-8?B?YldWYzJIb1dIQ3FSa0NoL0Mya20rV3J1Y2w5MC9DOHFpdllHeXFPTFJCVWFX?=
 =?utf-8?B?NjhEcUFOQmpVQWVGYXdDTndydEV4TmJtOVhJb1UvU1gyYVk4UCs3SGFVVUpx?=
 =?utf-8?B?TkNieXlBYjhOOTFxNnFtT2phM0owOHdGMzV1SzM5UVhiaENKQUtFVE9WUWw4?=
 =?utf-8?B?UENVaTRCOUNJblNERWU5UE14VXYxUzQ4Z3JNZDN2S2RmQU8yT3lNWjd5SlZS?=
 =?utf-8?B?d21EOEhaUy9qY2ZJeERMdjhwV3ZvSEtNZ1Y1WEZVLzlaL1NNaWNMMjBYSVBE?=
 =?utf-8?B?NTA5NmVDKzU4QWUyTUNseGhGQXMrLzFWdm8wbXRzZkxPTDBibnZRZnVVZGFj?=
 =?utf-8?B?Rm8zb29pVFJGandlbTQ0ZnQ5RFcwWW1UamFiUFZWcTdCTVE5THkydStweXJs?=
 =?utf-8?B?NVhaWWhTdVN3eWduazlxbzUwZlYvVzhkNjE1QWtGcFBnb01lM0J5dHNYNWZ5?=
 =?utf-8?B?bENvTHZ6SnhXbjZFWGEzQmFld1pmc0pJVGRVcmMzYi9tTE9NQ1haZS90d3BR?=
 =?utf-8?B?S0gxdWdHTG9pRnVJazh0bHdCWFh3VitVZG10VVRLa29yWC8xOEFxSFBvZ1A1?=
 =?utf-8?B?cDZHSzYyTnR0eDl6SER4dTNZclFhbXhFZEQxOXhBQmhsY1F3WDNGdm90aFAz?=
 =?utf-8?B?SHdiZFo4Z1RoSXQrZDNzZENUTTFaZktZbUo5VkEwUVlFREpGMTNnQnJha1J6?=
 =?utf-8?B?TXFGMDArdU5pSnIxRnRleEhVOHJ0aW9zVjI5czJSMVd3Ui9BeCtNVUVJYlZS?=
 =?utf-8?B?T05aVUR3OERSNk5vL2d0WlI5L2Q0UTVkUDBFRlJBWDIwc2pZV21FRlBmN241?=
 =?utf-8?B?RFhGb3FDNWNXRDBZcGFoYWZUeVphRENwRU80SDFTVzlzbnZtYnM0a2p4MnEv?=
 =?utf-8?B?bGpWSDlINlVKaExzQXVmN2wzT05XZzhSbUZGWlhFVUU3MVpCbkNUeGp5MHBx?=
 =?utf-8?B?ck53ZUovUzVRTUcwbXFnVWpUWmR4NC9QWEI0UWJ3c056WFB3ZVYwZ3dYTFVt?=
 =?utf-8?B?cmpUT1VJM1NRVDcxcUw4OVRocTZYY2hGb1pneldQV005djlsakExano0SGZW?=
 =?utf-8?B?cDFadm04K2U3dy9kZnJsUXREYXd4bi92YTlmeXFVd2hCRXJhUitCZ2hRMno2?=
 =?utf-8?B?ZnR4U1R6NmdRd0c2QmRONzVMdU1pZEt2YjJvSGRZZmJzZW5nLzhNVVg4QVRP?=
 =?utf-8?B?NEg4eThPVkk5dVJEd3FuRTV5ZW5NQjkxNG84VHBJcllFNHBmSmx1K21OMDVp?=
 =?utf-8?B?NFl0eURSTCtHcFBCMGhpSWNCYkpMbVVjaEJLTmpWUVNDem9oMS91eVlBMllC?=
 =?utf-8?B?cmRsTUVRTHE2SWp6d2lPWmI3VWFVQm0yYTVvVVJBcjdlQUNlUXUrRjBwWlUv?=
 =?utf-8?B?WHdkcVpMNDFVcE1YN2VaU1hsK3JpZjJaVU11K0dFVi9pclE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 19:11:55.3705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c04954-d3a4-4f88-626f-08dd149784a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638

On 2024-12-04 03:29, Jürgen Groß wrote:
> On 04.12.24 09:24, Penny Zheng wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
>> report the correct numbers of vCPUs that dom0 has, so the host MADT is
>> not provided to dom0.  This creates issues when parsing the power and
>> performance related data from ACPI dynamic tables, as the ACPI
>> Processor UIDs found on the dynamic code are likely to not match the
>> ones crafted by Xen in the dom0 MADT.
>>
>> Xen would rely on Linux having filled at least the power and
>> performance related data of the vCPUs on the system, and would clone
>> that information in order to setup the remaining pCPUs on the system
>> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
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
>> other Processors.  This won't work on an heterogeneous system with
>> Processors having different power and performance related data between
>> them.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I think this is the V2 version of Jason's patch, of which he sent V3 just
> yesterday?

Penny's patch has some of the changes I made, but then I made an 
additional change and didn't tell her about it.

> Please sync with him how to proceed: is his patch meant to be a 
> prerequisite
> for your series or a part of it?

Sorry for the confusion.  Penny, I think you should just grab my v3 
(https://lore.kernel.org/xen-devel/20241203225338.1336-1-jason.andryuk@amd.com/T/#u) 
and resubmit with that.  It removes a BUG_ON that checkpatch complained 
about (which is unreachable because of an earlier NULL check).

Thanks,
Jason

