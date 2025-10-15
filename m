Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE90BE045F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 20:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143940.1477513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96cp-0000e2-SK; Wed, 15 Oct 2025 18:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143940.1477513; Wed, 15 Oct 2025 18:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96cp-0000bs-OT; Wed, 15 Oct 2025 18:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1143940;
 Wed, 15 Oct 2025 18:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v96cn-0008V3-TS
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 18:53:25 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 394ed1cc-a9f8-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 20:53:23 +0200 (CEST)
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::612) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 18:53:17 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::8f) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Wed,
 15 Oct 2025 18:53:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 18:53:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 11:53:15 -0700
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 11:53:15 -0700
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
X-Inumbo-ID: 394ed1cc-a9f8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOUEgkhuEYvVGQZkggDRwjt38B0tbUJii0JLfXjGbHaA6xQJtEHFb7kEa1s4Bo174swjeBS/jZiaxPY3lU8iPxXkRy7Fa4cAWire+9E+7KhJDISet4it/UUxUuSUETNZjgLwqm2P0+VryNEsW65fsaFFSLOjgs1kGjIWC5WzIVW/EICjKWpC23PN5fmjDkdjRPOeTMdDwIwhFuGM6F3c4RTk3P9TLTZfg82cfUD/EsLo5+nuvaQotgRD3QCzz9YxPcHgGAoMic0d+Tm5AeqVbm9OGU6oA7VJu6hNHu1tGlP1ON88NQYe93LH5HxOj489NYRiG6x5hG0V9irJsgwRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVS9Ul4zzTnSSr/oEUy3mV/MwN732/dLn+kt5CUVyP8=;
 b=Itmt2ZCcoY34ulgpxcgajgwHl2I6B/f3Zxrj0iGOIc+G+EypyIEhlAXzrpvaMPGex+Bf7a6YUYd4y3rEeQLbe8XWcBWFyKIINKxZXhPwGeCbQnbT+lOOcXq+0B+lExsulB27hYt8Z/KglFqgwkz08cvcOZXiXthkx7kzevA2534SSsAfs/v9yUbWPQ+t9/aiHNudXksigDELXKvhO75hzK8nCxj7uPxel+AljvDH6dhzqjV+MG9zXQ0jrp4moRfrp/XeQtI23BEG+d0aST7Dkn3EmGs8PvE3p8kkNHe5hfW138T0ntsabaGPj7pIZfSZx0icqW152dMssEtUj4ix5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVS9Ul4zzTnSSr/oEUy3mV/MwN732/dLn+kt5CUVyP8=;
 b=4dGIRFEbEEAHjFq7Y127uKSG1cH9Aql8QAhYh5IQMLrwcP68dm0ru5P0/w94fXQrxez60iJ53Hg1VkgtwhaiEnVghhv2oBQGSpEJjEudF3UTDGe/B0BS2EXJjIc8W0jWD8bZOhoKQyA4xFiNzOb8LOwLVapcAojYjX8MUBr2lfE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f4e02755-f903-4639-a0af-9b7b986d0524@amd.com>
Date: Wed, 15 Oct 2025 14:53:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 5/6] tools/xl: fix possible uninitialized usage
 in printf_info()
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-6-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251015134043.72316-6-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: b65740d7-465f-460c-ef95-08de0c1c19ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c29MemhzRTFOSUpVOVlhUXdDTkc2ODhyVEhhMVJZSmxVVUJHM0U5cS94Q2dM?=
 =?utf-8?B?ZlZLSGRjYzMvNG1QbDRSdGtSMk5PWE9qV2l5QlZnU0dTcUdkNzRiZm5RWVJX?=
 =?utf-8?B?QlY5UVZQQzdYajY4b1c1eFkxZ3Y5TExEWW1XYXJVMlhtQUZ0blFRYVl5UEVm?=
 =?utf-8?B?cUpxSXZ5TElsUkVIYVMyalZXUGdRY1BUOGVEZkhVYUtzS1pHTHBjazJWdGpB?=
 =?utf-8?B?b2ppTGpvaEhZek9VV2E3bTlGRkNjRTBSUnBIdFZFSSsvK2plcXhRbzdBRVVN?=
 =?utf-8?B?YmpQZmdtNEc5Vk9SdldPVTVhQVQ5YnFPZkFOVUR5dllNZ0VqdFlDUm5UcEty?=
 =?utf-8?B?L1NyVnZWakJ4cUx6YXplYzhNUG9vRVB1K0RJd0NWZlVzNEJrR0Rhc01OREND?=
 =?utf-8?B?Wk1jazNWVngwOXpkZ083T01lckt4SU9SbnUxcW41eU9LNHBuRlFRcnpGRGlS?=
 =?utf-8?B?WW1lWXgwMUpKRGIwaitjUDhTU08zQXBBTk5HTzRBUittUzh3L284WitHRzFa?=
 =?utf-8?B?SlBNUGlkc1kySWtoMmtSMkNqNVlxendzamJOblF3RFp4ZFk3dG9TZHUrRno5?=
 =?utf-8?B?SHo1cDd5UmZBNWVTUWpwdmhYYmJOTnVRb1lKQmY0NGNLQ2hVSFJMZ210T1pX?=
 =?utf-8?B?T2ZXRXR2Z0x3dWc0YUpyQVc1TWFlaGVybzJDZGJ5bmRvb3M4b1lvQklxSUZr?=
 =?utf-8?B?K1BVTVk4K2JIMVhMdEtLazJGd2NUVkdGTVJ5b0hTcnFoRzhWb2NCSXVhN205?=
 =?utf-8?B?MGtyaUtsNWU5K0oyeU1hN3JMWisxZEVKZEp0TnIyeEpDSWRjakFsOWpmNHRQ?=
 =?utf-8?B?b09WMEs2b1h4KzFrcVJtaXN6MXBoTUxyY2JEYXBVT1lnSGh3Ujd0dzNhT2ND?=
 =?utf-8?B?eGNyUk5zZEZ6aWVBVEl5d1RKWERuSVNYeW01UnA2OE1aMjV4MzA0ZEhHWGNU?=
 =?utf-8?B?M3NWVmNBWlJVb0J3aWM2THdYUzV1V2FySEoyZXdPMEJXWkpKcE5mVStVR3Vo?=
 =?utf-8?B?MEJiQkF6SFROU1lVTDkxR09xaFBXZ3BWamRDN1UzT0o0aFpDUnl3S3BUN0Np?=
 =?utf-8?B?YTVubmlpeWFzVWZiZEwwelBoS29POGpFa29FTDgwS0J2WHYra28yOFpMTE9I?=
 =?utf-8?B?dHFKNGhvV3NTeVZFUE1nRjJIVit0M2xGaHpNQXNIMGF5eFhuNXNldEpBWERI?=
 =?utf-8?B?cDA1U3pKeGNQZ05PN0JCSzNvK2VEL2xNSGVkakpuZEZWK0Zwc1RENUM5b3I2?=
 =?utf-8?B?UnBWTkEvbUFIV1FXMTkyRXQ4V2ZBSFd6N3lDOVZVNzFUdVBCYUpUVTBKbkVs?=
 =?utf-8?B?Z2R5NEF0QlQwMUVSWHRUQldNZFNMRGM3a3cyQlRqbGZCaUthVktTT1RGZVNO?=
 =?utf-8?B?UnJsSzZXUkh4djFjRUs4WkZXWnh5V2kwUDd1UTlYYTA5SVdHaDJ4NlN4cE5P?=
 =?utf-8?B?ZlNxWFFvUkI1aWY1dUliZ3dmR3ZKOGREb1RpdmljTlRWdWUxSE82SHdZRFF4?=
 =?utf-8?B?OGV3cEo4VVU1SVVWYmJKN1p0czNRYk0xQkNjUThrZFRxR3p0bVpRSXA3YWpF?=
 =?utf-8?B?RXNMb1hOMEZiSklNajRtMmQxTlUzNVBJNytlQlY4ZkJVMU9rVTh1WkFoQmY2?=
 =?utf-8?B?dTE1NWtrMUZ3NmkyZ01DMFZXVHh3VXhkK0hNdTNQOWZUclBPYVhaZ1BMSFlx?=
 =?utf-8?B?b2YxdHY4MlF1ckZCWkpaS29pUnpsK1k3NFF4cHkvVHBNTVRvOENxZ1RZWGpP?=
 =?utf-8?B?YjgvdzdNcUUxbnhaWmRrNW9xM254aHA3U3BTYU9KQ1ZWNVd0NnRtbzRQWldz?=
 =?utf-8?B?VFN3NGw5QkNUSkNKL29OaWl2N20xQ0k0THlBYTYrb0FOZWV4ZGVHOURMVjE1?=
 =?utf-8?B?cFZJVC82Z2U4WWNBTFFQcWI1b2RUcWl6aXQzK21hbHp3WlhUUFBDdXBINlRx?=
 =?utf-8?B?Qmw3QWh1aUlidVVRV3loZFBpSG9yVTl6YVZLYnJqUnhzWXpiSUx0dU5LdDZP?=
 =?utf-8?B?eHBvWGdpY2J5bzNyVkhTeWNxbFNwdjZVZTJsRTg5OURJbXE5Rm8zSGJDeEx2?=
 =?utf-8?B?bndqd2tBMDRYc1JwWjdsZ2VNQUs0SHBTUTI2c3ZEMW1XSEVUOXdNQSt6ODVv?=
 =?utf-8?Q?ihw8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:53:16.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b65740d7-465f-460c-ef95-08de0c1c19ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C

On 2025-10-15 09:40, Roger Pau Monne wrote:
> printf_info_one_json() won't initialize the passed jso_r parameter on
> error, and hence the usage in printf_info() needs prior initialization,
> otherwise an uninitialized pointer is passed to json_object_put() on
> failure.
> 
> Reported by the internal XenServer Coverity instance.
> 
> Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

