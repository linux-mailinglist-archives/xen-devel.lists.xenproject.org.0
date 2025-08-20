Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1213B2DDE9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 15:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087477.1445518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiyR-0008EE-6J; Wed, 20 Aug 2025 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087477.1445518; Wed, 20 Aug 2025 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiyR-0008BB-2v; Wed, 20 Aug 2025 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1087477;
 Wed, 20 Aug 2025 13:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awzM=3A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uoiyO-0008B5-Ug
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 13:35:29 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:240a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d024fd-7dca-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 15:35:27 +0200 (CEST)
Received: from CH2PR05CA0051.namprd05.prod.outlook.com (2603:10b6:610:38::28)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 13:35:20 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::9b) by CH2PR05CA0051.outlook.office365.com
 (2603:10b6:610:38::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 13:35:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 13:35:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 08:35:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 20 Aug
 2025 06:35:20 -0700
Received: from [172.29.245.54] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 20 Aug 2025 08:35:19 -0500
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
X-Inumbo-ID: 87d024fd-7dca-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKDxDDDwyTvEsTEKR1AbyPkot48nJoLr6cku2e5tt82RFqn7QZH2CZ8wEXGqAx4oL7ZNCu7mmQNzVz8HMFBkRvYlJeo1JChCetSemXIwIbIDI5Qflu8pQrRk75ukD7o3W4UWh4TFZcID1VfQ30CciY35c2IdbLWLqo0Ny5ofL8BDLQv284pzagPdtuC2ntwcUggtTELeU/93wkM1E6azcy1IY9vMuGTcldcKJw88pcmHnU/aR8Qw3bGMB41yxpc2pyvgMn2JH7BRttWMndF3Pm2P4VMpIWXm6srQzb0uyxy2bW6mzVF+/QDWeRUQrjDGW3Sa3ZXjO8yPFd/UOQ7vvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQhdJZ6ooBYsbcX96waI7vkFshAMHCc/zOWAtlG7+yc=;
 b=pXee6YNqZBDvBLxh684RWyhFlyBtT88/Vm6E0WMvcFaf+TG1neiIQt42FZLXg+2p4oVAU6DM+GtpFzTUZXhPPglIxQbO6gJRJPDlJoF9siWqr0DFp6DiZbUQTKBSUTJ/IyrnJyS5ROmzBM0LAVM5cmUKkijSulNv/OIn+9LVQtGQg+ID5HH5AqdxurHxaB/2QQOFvqJJK355iPdEdxGiO3Uzpx9niPd9DpFmrkFLh3rMq7vyTgT0PE0PrWET4T9C9rV/+AVRqT769KJxoqh+GtDGdgClgRbQf1gnewRNwV+MhrJ2ryNGVvY5MgxCpk2NmAugecOJWz4GCMBxBaPzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQhdJZ6ooBYsbcX96waI7vkFshAMHCc/zOWAtlG7+yc=;
 b=3RH1GWfWzEqi9x6Olp2/+jwjqQNQZVoro11e/3q6YvFEI3N2ARO4Wt1xBz7TUwh/y3fq7Vw3rN/TnUMvg4DRpu41F7D9G1rEXmrgnc/LKeYlLhDScav2yrNl9T18HrNZ1/pqVIsy/Mj9e32GEKUHFaucN8yjHi4UIH1+K2CKL9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8c5c8a19-8ac5-4244-8179-964b23cdd9b4@amd.com>
Date: Wed, 20 Aug 2025 09:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] tools/xenstored: fix possible NULL deref
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250820104617.5268-1-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250820104617.5268-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: cd69dfc0-8f8b-47f1-f3d5-08dddfee68a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnhzYTlyV0hvWDkzMndDTVdIYzF3dFRCZDQxRmpsRjhOM0c2WHpHOW5UelN3?=
 =?utf-8?B?NXBlMG5sZGowNVQ5aTVvVGtwQnljeWUzdmRiZnNJSEdFend1VFljdWpWajhZ?=
 =?utf-8?B?M2N6VUd5ZjNMZ3owTDFOYWdtR0lqMFFVb2RNcEtMS3RiQnQ0MERUWlBpK3VH?=
 =?utf-8?B?OFhoVnJPcG1XTlN1K2Rad21iajFINERUR0ZUMGVBYk9XSE56N0c0NEp0QkU1?=
 =?utf-8?B?MU85UUc5cjhSbzNtamZDT2EzMFVEVWlJbHREckFQSU9BZU9PbjVFUkhpWldi?=
 =?utf-8?B?emVWN083M3R4YS9rQ0tJYjlkM1pHSjd5VHdyZWpET3lIZ3duaS9GZ0lkUy8r?=
 =?utf-8?B?TEZldE5XZnJ3UWVpNTVRQzRzaUhiUUtzQW1qVWkrbWFsMGZGeDhNcm1FTm9R?=
 =?utf-8?B?RG9rS2g0eUtacTBudCtNWXVZOTdJNnpDMm9XY3E2Tml0UFdZeHVra3V1UVcx?=
 =?utf-8?B?Smo3SEM1QVRvRmdHbS9hZzNIQVZJd0hDdWJKZDRPQVpBVkR0M2JUZGEzNDBv?=
 =?utf-8?B?RFFUTFgySjJvakY1ZkRqeU54S1d5cFF5d1YrZ0tYSVJwaVdneWJCVHdjb0lz?=
 =?utf-8?B?NFVnWjA4R0ViSVRUVFJUM3g1YWo2OUtxNzZVSmIwd1kwdThZNFcxYk1Vak9r?=
 =?utf-8?B?MmtjMUhRZTdodFFhN3RUNXRxUkE1Vk9HRXlpd29oUzFtaEd3elNqQTlUMXNr?=
 =?utf-8?B?NTZpelVjRFB1aDNWUzR1SktJWU1mVHdVWnMwUGxUWUxEY2FVVGRiS2xTQi9K?=
 =?utf-8?B?MXlNUW15MWhsT1RIaUh1ejFYK2krN0txZEVHZ3FpMVhIaTZDVWU2UGlFWlgv?=
 =?utf-8?B?SHg5Q1VDbTgyK08wV09PWjFKYUZGUXNEQ0NRL1hrWU9oUDduM3BXb0llTUJ0?=
 =?utf-8?B?UVdlTkhkWFRwYXlncmcwWUczTzRlVE91aHhvUUQ3RnkyUmJPZ1U0VEN1blBS?=
 =?utf-8?B?YlJPWGx0SGNxcDZyeWFpWlg1RHFJVVRTMzdSWFhTbytOdW5mZ05jdTdndW1a?=
 =?utf-8?B?dGlxbzh1SkVncG8zTyt0WmhObE1tbnJycm5wY3o2K0dNK1ZIdGxSWGI2QlNK?=
 =?utf-8?B?bXFMWXE5Y0laNkJ0MC9KbDhWWkdpY0NIVzdvdkhOaFRTd3NMblBSV3Ftanla?=
 =?utf-8?B?OGZ6bkZnYmdrV3UxUEUxTzBhUm1uSTJPcHg1Y2gyVGRHMDJkWXZ1VGp2SDdj?=
 =?utf-8?B?aGIrN0hjdzQ4cFdwY1J3emxNa2gvOGpVVTZEV01GOFhNZko2b1JhK09Td1BI?=
 =?utf-8?B?MC9iMjhzQ2lGM09rV3dhaTVyQWZCcXc4RkVOZGNjaXBOQkVJOHNETzhMdk9E?=
 =?utf-8?B?R2lNa2kxVDgzSTVRSTFac21zM3FXS29WVGhHRis1R3pxQmJkaGx1dWcvbGpJ?=
 =?utf-8?B?ekVuaGZlRmp1a2pLdWw1QnlQdk1NVVA2UXBubXRQdWcyRjhyQjI4VktIL1Nm?=
 =?utf-8?B?S3QrKzN1QTl6dnNIRGlHWUxLYXNWbDRoYUQycCtZbllyN1YwcGZ3SU1UdUwz?=
 =?utf-8?B?WnlyR2VLNEduckZCVW1UZEVWNzRZZmowblByM2xWN3pWZ0ZmbGxEcEZSUDJo?=
 =?utf-8?B?eVREVHpodEVCaERjM3F5S3lSQmxCeUtiaEFOSVFGaWJYWEpiVXdxQVVjVnZQ?=
 =?utf-8?B?ZG5Qa2pMM1FoUlhXamtPMElpNW5UTUpwRnJXUkNoYVZmOEo4bmkvanlxOUt5?=
 =?utf-8?B?Q3d0eCtHOWNLazlJanJxbklhalVtaFBLTDB0WmRjQUFmcm1taVl1eG9tMVQ2?=
 =?utf-8?B?U0hEZ2pwYmlWRjJ4b05ia1hQTTF5eHJFRDF1SWphQ2VRUzFmdHlVUkIzcXRG?=
 =?utf-8?B?aU9yYjdIbnNlTjlyaFJBQVF1V05EWWllZUwwZWRGaWhDNngvUUQ0em5HRXZH?=
 =?utf-8?B?Z0tIdUpXQ0Q2Q0w1U20rZkR5N1hwWVduRDJZKzAzTFowQ29qc24rMFo5YjhG?=
 =?utf-8?B?STV4UkxMaGZwUjBiS0VYMnFhWmc4a3BzcGw5aXJFSlp5ckxTN1VHdGx0dS94?=
 =?utf-8?B?R2o2RUpVSGl4ZHZRZjhYeFpsVmh3bFVveTVnUDhVT1RKd2IyOGkzUUdOOHFp?=
 =?utf-8?Q?6I235X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:35:20.6510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd69dfc0-8f8b-47f1-f3d5-08dddfee68a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276

On 2025-08-20 06:46, Juergen Gross wrote:
> Avoid dereferencing NULL in introduce_domain() when called during
> live update.
> 
> Coverity ID: 1665111
> Fixes: f78895ad78c9 ("tools/xenstored: Read event channel from xenstored page")
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

