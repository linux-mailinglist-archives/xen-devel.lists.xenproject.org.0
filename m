Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE54AAF7CB
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979215.1365895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyWn-0001y3-Ec; Thu, 08 May 2025 10:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979215.1365895; Thu, 08 May 2025 10:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyWn-0001vI-Bw; Thu, 08 May 2025 10:30:57 +0000
Received: by outflank-mailman (input) for mailman id 979215;
 Thu, 08 May 2025 10:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCyWm-0001eT-3W
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:30:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8567a668-2bf7-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:30:54 +0200 (CEST)
Received: from BN9PR03CA0939.namprd03.prod.outlook.com (2603:10b6:408:108::14)
 by DM4PR12MB6613.namprd12.prod.outlook.com (2603:10b6:8:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 10:30:45 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::cd) by BN9PR03CA0939.outlook.office365.com
 (2603:10b6:408:108::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Thu,
 8 May 2025 10:30:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 10:30:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:30:44 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 05:30:43 -0500
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
X-Inumbo-ID: 8567a668-2bf7-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4vfXdsQIfxuq/rshKULyinpA/oo2BGojJvHy+dj2ZRXwrqAoaHrpoYTCSM8Kw+fZXFFr5NRVut42mFTqkI7SSbwzCbzXLHHXkYACwJNYQuHD7ZHSV+QcNrg++ZBRTRXAWks4Zs0oCIqWu61XClJZ2GFZ8b+T37SPaiYA8tyc0VUU90551vfHzEY5E+MPiT8OeaYhqlCDv11nHcAtc8pTsQCwWXFrVW+VMPfj4FrRd4HLlqSAvG534KXSDQ2K3/7gNqZas+CCcyUR8DPWISdPzIF8egZIHyh2QLfv9pRUL2ji7V9wlpsj48u97f0t6xEMqjpNdgVWR+h5OIGBx8vdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MXaUm47bYx3+3m1ziqPITat1wED23CHBObq9T6YqLA=;
 b=ajuv4oaYYEo5G5QanV1ahoXsN9JSSqYTsKQmTuy6+6wNyQ24IfUuYKJ8cCPXEeJemj9hYfzqueF6E9Q0yBh7edObfR20c8Sm/8ob6tTgwAH/WfrsvixOTdsEaKc3xFC5yYQacVOcnPzKja4RXDSYgknnsgiqfQNxlmwTyRnvggBw/t2/+FVNkaS1+On1MZtsSdGZtm/uwwwSDLDOvR/OK1xpjNym2SkxMT5jYonkFoSPwmaGnwTrzKzPMrjqROIbdrQTwMxPnJu+1G6EC2XUzRZkDKGMKf0qTB6H6dspm3X03ac9qT+3VNd5NeuB/JoX/KPLrZ0BpgXDydrATASu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MXaUm47bYx3+3m1ziqPITat1wED23CHBObq9T6YqLA=;
 b=RyNXMMlfxYG1ckNHnPD8Kv8ZLCK+9+5unpljCimtgEM8tB6LAGgvZstj09aCG8+coIXEkmd0fBz34IIZwJ1keVIHHhWSkC9eYfOEHuGk27gx5qoLUCrL4nO6soXBAcR9cVF7PfFYZeKmGJOZlzJfi7fiUDt5t1+aCrO/hozzBKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <309dc9f0-3938-4b84-b772-e0044763f52a@amd.com>
Date: Thu, 8 May 2025 06:30:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: fix math in add_hwdom_free_regions
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-3-stewart.hildebrand@amd.com>
 <fa800ffa-eec3-4496-b157-f89d10b3650b@amd.com>
 <7ad1dde2-0af3-4a8c-a67e-3eafdea5822f@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <7ad1dde2-0af3-4a8c-a67e-3eafdea5822f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|DM4PR12MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 100e0cfd-1353-4dc6-316a-08dd8e1b63e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckp3aGF4WUl3M3RnWG9Ra0FPT1JXaWRCeXpFOXFmRm9SZkJaNHdtMFBNaE10?=
 =?utf-8?B?MWVZZDVITVZlN01VRFhFam1IRHIwdkx3VzJ0OC9QQzJTeDZxUXRXbDFYVFZI?=
 =?utf-8?B?YnRxZi93TzdKZXdqZ0xabDZYbXp3WFRQM1orcERSU3ZxaDM1elFMOTZVOFYx?=
 =?utf-8?B?cWtVWTJaeUZCNXVLT09xWGFGZ1NTSzNzdURjSTM4QVJvVE91aGlIbjBaVmxu?=
 =?utf-8?B?V2l5K01JNkNHbDk2UlRNQVRCdjI4cnlKbGFuSVVoQW5wR1k4MDNrQWNXcnpE?=
 =?utf-8?B?elBXemhuUGRtQUdsZjhzV0pUUm1qVGJ2N1J6VDh1akxFQUF4dkU5SlhYSCtC?=
 =?utf-8?B?RFpJM1hhZTdPQ2gzL3VBaVY4WU1GU0ZWRXI5SDROeGlzNVhZWlNPa1hoYnpl?=
 =?utf-8?B?WFpnenQ0UFhka0YvMnRUTk1ZUURMc1pBaStYQ1hrM2lud1hWNkxZTWxiQVpK?=
 =?utf-8?B?SDZuZUs5bnQ4OVZ2R1JKSHJFckZYZzBlcGpzOFIxL0RzYisvV1AvVWhsNFJR?=
 =?utf-8?B?TEIvSFlkTy9kRnJucEVsSG0yWXc2aVVqWlhodUh4c0t0SXJvbEJwckJXdlgz?=
 =?utf-8?B?VWV2MERoZll3c1hObEVvWnorbW8zM1RtTHBhelliRUppVHpUaHZkMDJBV3hQ?=
 =?utf-8?B?ckljSVlBNk93Rld2R3hVWUJHeVgxcG5BYjQ3Y2NvaWxDU2kwdDdhVHVISlZY?=
 =?utf-8?B?NGJRZ2IxcTNwZzlUM2xidGF5RDRhcnBMVW9OQ3lFTk85U1F6dVhpQ29Ydllj?=
 =?utf-8?B?WHBPK0tDVFNjbnpDTlBYdmFtTEVuckdsU0ZRZGM2Z29ybStjTVFxV0lvWlo2?=
 =?utf-8?B?UzI4ZmFmWm5kUE9JdEpPUU0vNXRUeEJaSXNJSHF5S0FsOGlzSzdJWkUzVHZS?=
 =?utf-8?B?VWpnRE1qZDMwd3drSGZyTnR6Q3JYV3Y5b1dJN2NmR1Z4dFRPQk44SDlYK2lM?=
 =?utf-8?B?NGQzRVJYWm1rZzVRRmlDcnRhL2ZvcFIrNDhJbndyZXBsbkllYys4Nk1CM2Jn?=
 =?utf-8?B?YS9UWTIzYmt1NjlrWWg4QkpsYXJhRm1DeVNRdFFHbWk2RFhDWTNJZlFUaCs1?=
 =?utf-8?B?ZmVhdDNWeHlXT3QwUVowVUNuYkFZR3ZVVTFQL0JyNFRQa3lCYjRHbHY0SE9M?=
 =?utf-8?B?SUxxQjJqVGNkT2k5TUhTdG1GU0VJamF0Z2pjcWtBU05mdFF2N0xzenBjaHhP?=
 =?utf-8?B?YnBDSlRIZkVNbjlHVHI3eWJockhBRkdZdEtndmt4OEVFbFBKeCtFdDByTW1s?=
 =?utf-8?B?TnkrYkVQbXB4cHJJbmlGcUNtNnY2QWtBVWYvQnV6N0lxeFUvRDhaMzA2K3Zl?=
 =?utf-8?B?MEx2S2ZkS2VrSStabE5CdEFwd3prUFBmL1lRK2xjUjBzY25PSXBOek9HaDI2?=
 =?utf-8?B?b1YyUndwNmt0bVRONWFJbDMrMVdkSmhRODRFNG9CQU1rQlp4YS9RUW16NFBN?=
 =?utf-8?B?MDBQUEwremkyL1FuUlJ3UUZJb0hsMVRJd0dyMk12WWd2dlR2MkoybXFwaVRM?=
 =?utf-8?B?c3B5eDFzK0JyOW92bWJwK3dGUzRiR2FKOXVEUldvQkdRQkZDcFl2K0prZWk2?=
 =?utf-8?B?YnBlMnk1NVZ0QWxvd253OXNvNVdxK0ZoWm9WbWxUQXkvNk1Rb1h5RDJpMmM1?=
 =?utf-8?B?VXY4S3NXMExSckhBKzhTbWVOTVlwQXNiWVd5bjRXaGc5ZWUxUXhPejdjYThm?=
 =?utf-8?B?Q1lKYVp0SjRBMlBIY1ZTeWdGMmQ3OGYyUTBtdEJpRE4xY0FxVDlUSEtWOE9u?=
 =?utf-8?B?ZEIrdm5MVGtJY0hpT1phMFBQVUZVaUUyNUdOQ1l5cm1OR2ZtWUlKTERVZ0Fu?=
 =?utf-8?B?cmxNQ0tONWJmU0Vha3Npa0gxNldCOVhZVi9vajJUeno3aUwzQWF3MWZTa0Fn?=
 =?utf-8?B?OUlrMnUxeWZJYWlBcnVOZkFGR242clhlalRiaFkwZTZSYTZaNDJyWHFVV0R1?=
 =?utf-8?B?NFd1MzZLbWVqZTd0NkxVNGpUQlROem9obWQ3a2lybmEvRFVQcWc5QWRkdFFL?=
 =?utf-8?B?RDBlSmQ2SnVWaHpJdjQraFpWUGRZWjA3aGN5RWZIbEV4UlkvaUZ4ZkJxSzMy?=
 =?utf-8?Q?yHCHEJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:30:44.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100e0cfd-1353-4dc6-316a-08dd8e1b63e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6613

On 5/8/25 02:56, Orzel, Michal wrote:
> On 05/05/2025 09:52, Orzel, Michal wrote:
>>
>>
>> On 05/05/2025 04:56, Stewart Hildebrand wrote:
>>> Erroneous logic was duplicated from add_ext_regions() into
>>> add_hwdom_free_regions(). Frame numbers are converted to addresses, but
>>> the end address (e) is rounded down to page size alignment. The logic to
>>> calculate the size assumes e points to the last address, not page,
>>> effectively leading to the region size being erroneously calculated to
>>> be 2M smaller than the actual size of the region.
>>>
>>> Fix by adding 1 to the frame number before converting back to address.
>>>
>>> Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
> I wanted to commit your fixes but rebase is required after recent dom0less code
> movement. Please do.

Yes, I have already rebased locally. I'll send later today. Is it okay
to keep your A-b tag?

