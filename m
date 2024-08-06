Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82F949162
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 15:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772880.1183317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbKDM-0007ua-Fb; Tue, 06 Aug 2024 13:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772880.1183317; Tue, 06 Aug 2024 13:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbKDM-0007rp-CS; Tue, 06 Aug 2024 13:27:00 +0000
Received: by outflank-mailman (input) for mailman id 772880;
 Tue, 06 Aug 2024 13:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT90=PF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sbKDK-0007ri-IB
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 13:26:58 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2407::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2b2c44-53f7-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 15:26:57 +0200 (CEST)
Received: from DM6PR03CA0013.namprd03.prod.outlook.com (2603:10b6:5:40::26) by
 SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Tue, 6 Aug
 2024 13:26:52 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::f3) by DM6PR03CA0013.outlook.office365.com
 (2603:10b6:5:40::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Tue, 6 Aug 2024 13:26:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 13:26:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 08:26:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 08:26:50 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 08:26:49 -0500
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
X-Inumbo-ID: 8d2b2c44-53f7-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiXmb0VTMK6NQZVNvx779RzU1HFc4tkVy8GHbRaAWfK3cGjq35PFoCov1323lGyWUEgoQfudoGp/BZoiUt2RYCHrq0C0hPpXU99B2JXeppUjUe9ePDKa/j6GNHyIC7kLvgEzLtvwWJ2yHuLdBtZByxApHmWaz2T+uPQSosuT4ZuL19JpZ79e4nS/l4/PZ+uyOVqXqiFU7WCV9E6AM4jIm22+g+TsxULAVsmPGCxz6S+42RVEbZ56+T9Qr7mw2w4SLjQLfiV8VunogYqXQj5hEQTJH3NmfFIssyZat2TDTP7EjseJVCjy44b1UyrqmxUOJUpIgNRkxrOiei/ZNqJ5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qAgu7bbX8Y4bq2KxCRNtu8hDQUJng1HwUV9zC6GnUo=;
 b=Qyu6cKyONpUJPeUPOkXkeWUgM1FJIWlwIHZ4KVeE2fVb0CrpwCJuXgeMNPai15wR8/JkBwXOHrHz0mKgSVxCsnFGdTxdBKTtGQtaPJHC5dbSS3X2N99O3XveqyYFX56RyGmg1gxwEjJk8eubZ4Ajfn6bzFFe8EeQRjDpmbi70ybmXLbNcElSpYnhIPraawOq7VwLtN39pOn3eL3U/eL6+KXeINrm0ArygCtQpSAOZUtNnP0TrzvlztbHTggJ5ZT8IldaLKfukP9MiFYHXK7vxppzVJuan/NaMljl1k79nBdO9M1Oy5z60q1e3gYbppg/n0kFW3B4b4tFH09r4Am5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qAgu7bbX8Y4bq2KxCRNtu8hDQUJng1HwUV9zC6GnUo=;
 b=yf8G8xw4zpkAgRlKq0VCb/LiHGiVDi1LiZ6WjZxB2XmF6hfSWMYZYfAfDwT4YZbBKulM3kcvFNhmDcNQ+a1Hn6OF+XOrarmli0H3wa0UKT7qTCWm5HhKTkf0SMDMzKdNmjscpFRtXoeW/nKGMz1DxeVvA5NxR0jMoIPR0uJDwq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a27a865a-8a23-4185-9b31-d5fc6e362812@amd.com>
Date: Tue, 6 Aug 2024 15:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: entry: Actually skip do_trap_*() when an
 SError is triggered
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240806124815.53492-1-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240806124815.53492-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ef85ca-9020-41eb-7a08-08dcb61b6ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWFiMmFHbmp3aDhoSTNFdmFzN2k1em00cmE1VDlYbWxOcUtvOW1RMmhCNkRz?=
 =?utf-8?B?enpUQlFlaFR4RWZDTDhCQjZoK0F2QVdPZ2xKSTB0Y2psZXB4ek9meEs0MGdr?=
 =?utf-8?B?c3ZhYUNpSHlIM2ZFcGVIdlVqQTIxY1RYdlc2U3RzN0VPa0pQZERuRk5oR3lT?=
 =?utf-8?B?d3JHT0F1Y1ZHaHQ2MGNPSi9Ba1pLU1hVdDVBd0hHU3Z6WHpHT0Rwa1ZpcmRD?=
 =?utf-8?B?TVZNR3dWbURDZWNzSlFwL0o2bGhocW9SaXI0QnBqQi9aa0tvaXY0ZDlWaEZj?=
 =?utf-8?B?TnlZa3JOVnJaZHAzSHhhajlVQ2QxeURSTG9qZVFzUkRId3NOeFlXWHh5d29F?=
 =?utf-8?B?b2RIeVozWlJsa01lUll0ZDM4aGcxSFRrc2x2d3p3M0RlemtrcjZPUzlwQlg5?=
 =?utf-8?B?N0h3Q24yNHcwd2dDNlVOSXd2ZkxUQVZIQmZRZ085bWtZcmlhVDR1dFZsV2Zu?=
 =?utf-8?B?Mk9IZ2RpS3ViMlBIc2lrVnkzSGRweVg3UXdCOFFtRHl2RW5OVTRaRjNncWlJ?=
 =?utf-8?B?eGluaHdxUUI1TE14cjRNNDJsa0szN2dyNEo5WUkrTXM1RjEzUGFWbG9DUWNJ?=
 =?utf-8?B?VWJQWG0zc3kzVi9QN3E2MFU1VjNLeU1HSENlVXVYZTEyTVVUOG13Q2RVRTNk?=
 =?utf-8?B?TXFDUlpJZHNpTW96VmNNM3dhdkNYYVFmZ1RLU293c04yVit4NW4zbVhWUE5D?=
 =?utf-8?B?bGVSRC9IdXk4V2NZei8wcHE2RUdnaDV4aTRya0hsOTM0OWZPMnFDWVRzOVBD?=
 =?utf-8?B?YnJYQytybjR4QWVDaVlyQitMUUIvdTdVTUZtTVA2YkZCNENMczBwWmVGN0xs?=
 =?utf-8?B?dU5lek1CNjBQWFhBUyswU1Z4SFd0KzhNKy9sUVJWQURYclhaajg2dkFMVTQ4?=
 =?utf-8?B?YUEzR1Q5UUJEWjMweGd3TElma1lQQnRzUHpmN2c5c1pGenRPVnJwTHg3bklG?=
 =?utf-8?B?aFRGbE9QWjFYUWp2cTRpTTNoejdMQUVNZnR5T3lYdXhHTUlpT25RY3ZicE5Z?=
 =?utf-8?B?dlFRVldKWWkxNEtnd1NFNUE5ZHRiMFU2ZWNWT3RNaHA3dS9hWFFzdzhKK1d0?=
 =?utf-8?B?WXlEdEVza1BwTWhhQzFtVDR4dXphdkZYSnBUNFNLTHhER29PNVYzdVNteEVD?=
 =?utf-8?B?ZWVuVCtEVU5ZVkJpTmJMbGJNMVV0cDhiUWcrVHovZEV4Qk1OYVJRTjZMTkd4?=
 =?utf-8?B?aDlmdFNGNmhFSUJ2YWQ3WmtpcmNCWlNnMzdqRmRRUFJJT3VNVGRpNjBVYmlU?=
 =?utf-8?B?OHMrdGxaRXF6QjZFZjg4SWtDZ2V1a1RCSkZPTFo3TlB5bW9pSmV2MkZTSzFR?=
 =?utf-8?B?MVFPODRKdkc1OU9KZ0tHTU1KYlNQMFB6cmtBd3pvM01BYkZaVnNpcHZRVFdj?=
 =?utf-8?B?WlduNDFUUTQwMmlvYlVJZDNnSEFVTmNYRmRlZyt1bGJXT2lyVTF6RGlOS3I0?=
 =?utf-8?B?bjEyOU83TU5GR2xqUmdpb3BLS1E5bGwydGpGNVpRcTlYZXQrYklWdTk1b3RT?=
 =?utf-8?B?SmNFRVk1WnI2b2N2SkwxelZWRC9DTHJFY3VKZTIxRGpCVlQ0aTNTd2RqT0sr?=
 =?utf-8?B?UFREVUl0WkdsZ2ZIeUpwRTlKSFZ2Z1pBN0tvUjFMRFJIb0g5bDdwTFE5OHRD?=
 =?utf-8?B?Y3JJV0ZRbGpDemtsVmprVlZHN3dBbElodXU0NXo4TWx5eEl3QUVmMjRUbjVL?=
 =?utf-8?B?ZGlMR1VtZ2IrS0krWGRhMXVHSFZlNDlmd0k4THh1THRRVi9relVIV01EdjVr?=
 =?utf-8?B?T3dmdW5NR1d1VkwzSDhlaytGWU5zWXZsRFdMWS9GVVJMck5xdFFFeW1SRkVy?=
 =?utf-8?B?U3dvWGJKaTVzQkRVRmo2YmhwV0tlQjFzMHZYaHZzMGduUmEyaFk0NllEeUlB?=
 =?utf-8?B?NHM3SCt4cy9mbmhPZjRwY29WTmtBWStuSm1ZaFk2bVVocmF1NFg3Y3JHczE0?=
 =?utf-8?Q?7AYKZddj9/E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 13:26:51.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef85ca-9020-41eb-7a08-08dcb61b6ec3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

Hi Julien,

On 06/08/2024 14:48, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> For SErrors, we support two configurations:
>   * Every SErrors will result to a panic in Xen
>   * We will forward SErrors triggered by a VM back to itself
> 
> For the latter case, we want to skip the call to do_trap_*() because the PC
> was already adjusted.
> 
> However, the alternative used to decide between the two configurations
> is inverted. This would result to the VM corrupting itself if:
>   * x19 is non-zero in the panic case
>   * advance PC too much in the second case
> 
> Solve the issue by switch from alternative_if to alternative_if_not.
> 
> Fixes: a458d3bd0d25 ("xen/arm: entry: Ensure the guest state is synced when receiving a vSError")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

> 
> ----
3 instead of 4 dashes

~Michal

