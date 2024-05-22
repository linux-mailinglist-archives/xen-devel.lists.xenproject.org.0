Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE88CC263
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727680.1132279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJ0-0002nC-Al; Wed, 22 May 2024 13:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727680.1132279; Wed, 22 May 2024 13:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mJ0-0002le-7w; Wed, 22 May 2024 13:46:58 +0000
Received: by outflank-mailman (input) for mailman id 727680;
 Wed, 22 May 2024 13:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RWL=MZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s9mIy-0002lX-IS
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:46:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3732ab-1841-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:46:50 +0200 (CEST)
Received: from PH8PR02CA0052.namprd02.prod.outlook.com (2603:10b6:510:2da::32)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 13:46:47 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::33) by PH8PR02CA0052.outlook.office365.com
 (2603:10b6:510:2da::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 13:46:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 13:46:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:46:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:46:44 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 08:46:44 -0500
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
X-Inumbo-ID: bd3732ab-1841-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azE6+E7+AEx3XdJcDmlPa4PrMr8OJjXMI1gz4KVnEFiTJ+CYMHCnF1pWKoA6I4lv0OXOUjPOPQOxjLzij2lcu7VfCsSiDivsD0Colh+QLvqTxnBAabW427Ls4wBoSkK1dcI8yrcQGYUjLXKFUanSpuA4Kc8ZstwmrCuiAXLyfS7mKoaFyQ2GdAkZvGDzPBb3TMfQJXiZXGnsnKBMZOpC4y2kGKa8An+d5KE1MCO4aTXAgfRVmcg1AMNYft9urU6BV7R/J4UlzDjiNQWtgCcN+7HrcHfY3TLOkp45PwMvrHLaoFGse3WMByzBlQ90BDKo8bSYZOD8N678wECX6xipkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs5X4rkFtjieBtrzO5z+2i3QZv8W7hE5OOmvDjlmVVo=;
 b=Q0cASRYFlnKDqqDTFSfc6I0V8rr7YPI8zauuqAmUc4nW/Om+cRqduhITU7ziZYH16pdYSxvmqOocOBz7/sVrIgztIRjG82C8jWdkjirrYXffUr/TRtgjzFgYDCW84snO3IuBsvu5jb0+jL0RdiZ+Nb8GmrQ/lBdPm8nJkgv/OoE2ZeBd0515Cdxwa68EnIeYfU3uQbOQ+e2b1410KQGoPR/88V4a2BY6mAjiu9cVSO+Pf6Oty9X+N7nKT3PIcfWFxGIM549xOy3QKuJDqOYZkNQK5w3JzP5WUdXINMyZYQzwUhcA9QoyV86QYwfUVzF7uciQ1F4UMThNRN87RO0dBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs5X4rkFtjieBtrzO5z+2i3QZv8W7hE5OOmvDjlmVVo=;
 b=hUUAjFnDaxo2CrvyZsw5U0XFoMyk5tWYldPvLo0Rwpc2ZDP4S0heetnLh/T3YwLcE8S3F0f29eR9FpDdbbukut3SfU2nlNnks1vVTqPqUAi4OXLQXqDXoV+IjP4pA+HdGRMpQTtgxG59iuvupczDuQ+BYKyJ67t2l2iM8Y1J4fw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <883ab811-1cde-406e-8a55-13cc9c0944ef@amd.com>
Date: Wed, 22 May 2024 09:46:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/PIT: supply and use #define-s
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
 <fb87a1db-4d8f-4e33-8858-71de4de6e276@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fb87a1db-4d8f-4e33-8858-71de4de6e276@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 556dac09-c645-46c5-b8a3-08dc7a659ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWJ1NzlZQ2lDY3Zrem16dmg5cXd5SXhJRGNwRmgvS0tXNUpsRE8vdWdMK0FO?=
 =?utf-8?B?WHFFSzVDQWlBdjlSblRSbkRZcUxBSDQyKzUydjFsdmpoR1dDQ2xxUk4yWUtO?=
 =?utf-8?B?VS91aWJ0ODRXTFhvV0tnV0Q4Rm9CTGZMZDIvTUN4aGs5U0pHa01KMVJtOXo1?=
 =?utf-8?B?a08wVFAwRlYzUkppaTg3SDMrQWlUcTBRaDVsK0s3clEyMlRhdTljRW9LNzFX?=
 =?utf-8?B?bTFmOGtWUHpjalJlN0FHaDlFcjNPTWEwbDRmOXMwRzR2YVhMQU5zZWJwaSt4?=
 =?utf-8?B?UGNVdmZlMnNVSGpIOUNub2dXNjR5MUw2T1RQWHJTYU9KeXhqK1JNWXpTWW1U?=
 =?utf-8?B?RXprS2t0SXhBNW0wYjBvMXI3M2NuamZmUVk5VU1ZNGVLWHpGUHdlRDQ1RlJk?=
 =?utf-8?B?L3ArOXRocmRtZ3JEZ0dTbDIrWm5JVW9DcWRWL0hHUVNmRSs0bVBsUGNnbW9y?=
 =?utf-8?B?TFNIYXZJVm0yb3hLQ2xsTUZTN0FJbHVrV3BCb0gzdXpkQmhXQ3pTWmxHRFEw?=
 =?utf-8?B?dUtvV0xneXJKa0E5Nm1zT0ZtTHZReEFhaG90T0M2cnVpQkM3ZmZrMmJwQWQ4?=
 =?utf-8?B?QS9DS3VsaHRZU2dTaFpxVC9lc3V6N0ZUdHZsOFRBL0FaQVAyYm5hSHgwdzZa?=
 =?utf-8?B?VmNuZEdHM09zQWRVM3RDcGQybTlvd3JlUitGN1pLRU05NklOQUNyOGRydWph?=
 =?utf-8?B?d3F0Z0FpcGkrVm5GZ3hjaTh5eDV0NTNCcXB1bGVwRTdENHdiLzMzTHlmU3p4?=
 =?utf-8?B?Z3ZDWUJjTjkrdzY4a2ZpS1VOWFhMUk1KZWxkTllLSnQ4T3U5a3VDUDAzb1dh?=
 =?utf-8?B?SVNOTDUxRjBLZmcrVGVjU05Mek03TExDVTJOUGVFTWl2VTZnM094N2RNVktJ?=
 =?utf-8?B?WjBxeUtoYWtUdU5KTjZWdFlvWERMVzl6WVpteTJLdGRuTm1KZS92bTk1VlJO?=
 =?utf-8?B?bGNVSnI2MEd3WmUzT2FBL3lva1dPeFFPUldZMS85WGVqMHE5UUU5d1pRVEMr?=
 =?utf-8?B?MUFyTFVlaEEzZitRcWZMQ2ZDUzBtNmdrV2k0T0V4MDhWRWlWNU9sRlNHWFZM?=
 =?utf-8?B?ZCtSWWVzY1ZrRndscVVvelgwMVBQdDNrS3k0R1R2dXpPKysxdWVZeUtieUZa?=
 =?utf-8?B?TEp6RERDR2l6dlpEbWRPWWtKeDVMc2ZBR01XTlhZKzhiNnp6QTlDbThSQyti?=
 =?utf-8?B?YkJJaTM3bkYrRFh0K3Q3NEdhczgxYTBZUGR2Z1lHQVFXclc4M3pUTElhZEtx?=
 =?utf-8?B?Ync0V0pYelVxanlOaFRUV05RRFNmeDVhWUp0NjJwajQrZ2hPUlRUNnl4QjRl?=
 =?utf-8?B?N1I2cVU1OG44RWZ4bG5NamJ4Yy9VSm9nendBOEpCRDlMRUhpQ0RqcUx6am1H?=
 =?utf-8?B?OVRsbUY1VExWNG9FRFZzQm84RHQ4Y0FSaGhqNkp6WGh3R25vOU1WVDhkL1BR?=
 =?utf-8?B?ZGVMcFljemVNcUh3Q0EwRUlkS1UrRmRCMWF6RUUzRTgyaG4zTXdxS1EwQ283?=
 =?utf-8?B?dnBsYVpYT2ZYZTBLVDMzTlFTaDNLWHF3dG1jbDdXaUVuRmdkcmlqRm1VSmYw?=
 =?utf-8?B?YUhUb1czWkYxUTBGRU4vVGNuc2ZLNXdTTXJ5bE9JbHgxK0RVRENoejFzRkJm?=
 =?utf-8?B?QnZnMHJ0d2xQL21tUnBqekdGZXZuZ3lxM3ZybjF5WHk5bzdQUzhNN0k4aFhh?=
 =?utf-8?B?cVl3NzV1UXN5dE1MVW1XYlhWNWU3THluRWV0WW1KZTR2WGdxNkVXSHZ5MDls?=
 =?utf-8?B?RGlmTXZPc3B5RFk4OUZZSUxJTDRlb3VGSEZ0c3hPRWh2akJjellLK21ZRVht?=
 =?utf-8?B?SStjUWwxN2ZVY01PYy9GaUtOVGE0Wm5ER3JSSEFUbFJyS0xSbytXSHVRY0pv?=
 =?utf-8?Q?8FsTjoQOxspxX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:46:45.4814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 556dac09-c645-46c5-b8a3-08dc7a659ee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

On 2024-05-22 08:59, Jan Beulich wrote:
> Help reading of code programming the PIT by introducing constants for
> control word, read back and latch commands, as well as status.
> 
> Requested-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks for making the switch.

Regards,
Jason

