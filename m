Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424396979F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788857.1198346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPBa-00045B-54; Tue, 03 Sep 2024 08:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788857.1198346; Tue, 03 Sep 2024 08:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPBa-00042c-1q; Tue, 03 Sep 2024 08:46:50 +0000
Received: by outflank-mailman (input) for mailman id 788857;
 Tue, 03 Sep 2024 08:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slPBZ-0003fP-9v
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:46:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2416::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d965bfc-69d1-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:46:48 +0200 (CEST)
Received: from MN2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:208:1a0::32)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:46:42 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a6) by MN2PR07CA0022.outlook.office365.com
 (2603:10b6:208:1a0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 08:46:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:46:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:46:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:46:41 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 03:46:40 -0500
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
X-Inumbo-ID: 0d965bfc-69d1-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvGG4c21856N2+zP4Keb7Xu/y64c8GXQiUmn9JbrRupbBZNIXHcFKckg7ZevrNSFAUrbzqTuZcakNp64lmMPmuOAty1M8Rm3sxTba2J1hdskvQxUkbIlkoRM+GkiPSpYK2RgnIy7RVbbH6x6ESilBb4zBmbgfKHOStimIXHhOEbtQAImuM9uR7voEygLf9YDSMUeSJvWk7dpW1Nxu2ALmDWzkx2x/eizYhGdmxymGUXOG5IEwGanYOQTZgixJc73tjprHWoFA/9X/gELj9xGi11500r+iwwRQQDUFLAEee067FYXqU4S2VqJVMARkE1Z0y3oEggWQxMuQzyENZmxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJW7NQ4rxlQxihJD9aFpog0dDaOFXGBU6S8kkRgBgxE=;
 b=dYOyUHQupHRyAOeVjEVmTxGTLRDdxj/7XLPi4uq12M1tjJ7hOhpUuxWflaZ/B3vgtntbX4T6vn637GB9p99AxXoYlgp29WjDx8TuRrtaMjgluOpVEPZvyOoIjZ+11jBXMk4IZL3DBo1nvYgQ73fVb8+o0D1vPmAq8Gd5PHMLG49iFGFqyaQI8ntuKaflAs6LM1Zz1Uyg9/WZzwKoSsEmXztDf8/Imhp2Gs+1S09PKimig4adaIqGrG/xW9TC70GfQILwE30thoc3EgWizmnH4YngWh8o3FviVUNWUbAYjuen0ZUs1t/6YlVNjN4t80IjPEi2jGdahYAyPrn3KGLPfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJW7NQ4rxlQxihJD9aFpog0dDaOFXGBU6S8kkRgBgxE=;
 b=eJGWSLFqEbS9W6hiXyW31fH+GaBt7a3DXtuD//SLbHS3XRwlXrfA4mFrejE6XRH2KsuVOCYnvnc1P5fzw72x34wDp7MWIMgrV0INLWFow7RkNzRwJkt0dscM8DupmXvVn3OIxhbIL5PZPQU8drqAEkO38aXTPyxYwMGR7AkxLlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6b0df33c-bf70-4142-9d0f-1d40a5dd861f@amd.com>
Date: Tue, 3 Sep 2024 10:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM/vgic: Use for_each_set_bit() in
 gic_find_unused_lr()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240902100355.3032079-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e5fd6a-1b7b-46f6-6966-08dccbf4eef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0ZDM2dvMERKeUFQVlk4d3pJeWYrZVFFT29acjYzcENQZ1ZzRnhzM3BYS1VS?=
 =?utf-8?B?blg1am02eXhOdGhxNWJkazdORFBuQzEzSkFuQk9pbXBJWXJXTU5Uc1VxTFdm?=
 =?utf-8?B?SUdMNi9uUEM0Z0JEUXRyUUZNWDdXYjdQYUlsUlU2bGluMFpnZmw1ZnRTNnM4?=
 =?utf-8?B?aWNuMU1IcG5FbWlsMjZhb2ZkYWo3Q1hxNzl2VjFpcWJGOFhnaElhbXZ3VHky?=
 =?utf-8?B?Z0VVcXgwRldrWU9zRDIvcFlMY1lManZyTGlwU1ZVUnNhbEkrMVFDS3ZYNWND?=
 =?utf-8?B?SVpyejdORkJFL3pYdWZkYlJrTnJGY0xuZWhQQ1lESjlFL2F1UHd4R1Uzekxo?=
 =?utf-8?B?YUNDUTJsaFNkdEI2SENTOWpYdUtEUm9NZVpDbk0rWkxuZzkrRC9KN3kyRU03?=
 =?utf-8?B?eTR1Mkt0T3lGNXNBemJ1eG53bG5PNmxrQkhYY2NSK1h3NEpBdDcxTTFHSWhD?=
 =?utf-8?B?WmlBSHl0MFhPSnVLYUpqLy8rdzlYTTNBVFJ1TWVjQ1hZTDN1d2hPNU1NaW5n?=
 =?utf-8?B?bG5waFcrMWE0K24rSXN0SEtIbjRSdUlGQ05TNlpha1Y5STN1bTl5WXhLTkN1?=
 =?utf-8?B?MHdibzBjclVoUzRoRGk3OExjdCt3eDJNREN4SDB6QTlRdjJzb3Uvb3Z6TXZJ?=
 =?utf-8?B?MzU2ZmFET0Y0ejkwQmFMU1NFTkNHUC81VVFTaXhBaHNwVUtzUHh5V2wwL25W?=
 =?utf-8?B?OTRxckc4RXQzRk1aQW1WYTNDZ0UzU2VEcVBUNDg4YUJmaDdFYWk2Y0gwcHNr?=
 =?utf-8?B?b0VDdEdBOXdpNmUrU2R3QjF5cUJRWCtvUXMxZWw3WWdIQmd4WFNQOVpWeWE4?=
 =?utf-8?B?KzFlZXo3ang2NnJLcUtyb2pLTzZnb0ZLOEVGZGVna1kyUkI1cXN3VGdLSWVz?=
 =?utf-8?B?NzlGQThvY2R1Tm15eEpHNk9OeXUvVThpaGFmUnhzYyt3Q2taeit6cDk4UFVa?=
 =?utf-8?B?Z2kxcDJhV2F1ME1YWDJRR0laZERhSTlUdGhuVlZwbE4zTDNOWVk5WkRjV0pR?=
 =?utf-8?B?b1pqRTlRcVhWQ1MwSEZkQXp2dVB1QkFzVXo2OUhBMFF4S0tRdjlVOFZxcHdz?=
 =?utf-8?B?ZmdKSXVzQm5obDdFYjlhUEgzaWJkVWlqcmlqeG9OSjQyZExTMVd0SVlxSXFM?=
 =?utf-8?B?M1pQVXp0dG1HWU10V0I1RWZaTHE5QUJPQW1WZE5XcVhlcStHYmVCdjlDMXZp?=
 =?utf-8?B?N2gzYVFHQVFUMUZxbmhpUW81dnplV21GU2QzRmxRT1NZNU5pTXpuNEhObFJo?=
 =?utf-8?B?VFhHRTgrT1FwUUl4VUtBeGUzSDg1a09aWUlkMTd3NElOT1JGdndBWEhEK0Q5?=
 =?utf-8?B?V1NlTFRGRXBIamNSTzY3d3E3alkzYWw5OEIybzR5ZWZYMC8wUGplRVdQOVZH?=
 =?utf-8?B?WVVhTFgycloyUUV4YTRGQUQwcTY3bUVhQzE2OEtveC9MczVTVWtHejI3dVk5?=
 =?utf-8?B?NWdkVzFWdGIzNS84c1lsTmJKZGkxOVdHWjV6OWRDYkxSZ3FZdlBpTll4ZHBu?=
 =?utf-8?B?eTQrenBOWXZzKzRHUVVKL1ZkMVRmcFFmbTlnUDJ3TGl6YVNKT0ZDRGRyLzNt?=
 =?utf-8?B?RTZ1NWFlMGtXTEhTRWN4emd1WUg4WTMxNVZYK1d6d1Vucm01Ym5nOS9xWUxG?=
 =?utf-8?B?VHdTNkdFaXJmRXFJTHNvK1MrWGpCeEg0VTNJZWc1bDM5dDZEL0Q2OVBTMzFs?=
 =?utf-8?B?bU0zNnlKQjlVRzcvdjUrOFlmUlVOWVcyU2NhU2wyV1IzbzEzM1ZVMHdVcm9Z?=
 =?utf-8?B?YjRzaHFGYlovWnJtdGxCVmdScDJ4NjBWL3NsU0xDOFlSZHF4S1V0VmVMYWFq?=
 =?utf-8?B?M1RiaSsvbmt0Z3VTdTgwYktxT3ZXeEc0SVc0NWhrdlJLTnIwa1V1QmRBbEVr?=
 =?utf-8?B?VklaU2puSERZdlcwa3Zad004eGJJdlFDUHVRUjRxeDhmSExGQzVUTVpRQXl1?=
 =?utf-8?Q?biRrCLc3Qu0Gn190cTmVZw4WZtqyn4Kz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:46:42.0374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e5fd6a-1b7b-46f6-6966-08dccbf4eef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932



On 02/09/2024 12:03, Andrew Cooper wrote:
> 
> 
> There are no bits set in lr_mask beyond nr_lrs, so when substituting
> bitmap_for_each() for for_each_set_bit(), we don't need to worry about the
> upper bound.
> 
> However, the type of lr_mask does matter, so switch it to be uint64_t * and
> move unsigned long * override until the find_next_zero_bit() call.
> 
> Move lr_val into a narrower scope and drop used_lr as it's declared by
> for_each_set_bit() itself.
> 
> Drop the nr_lrs variable and use gic_get_nr_lrs() in the one location its now
> used.  It hides a triple pointer defererence, and while it may not be needed
s/defererence/dereference

> in the PRISTINE case, it certainly doesn't need to be live across the rest of
> the function.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

