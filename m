Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC989972DC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815004.1228719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaIr-00070b-Bs; Wed, 09 Oct 2024 17:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815004.1228719; Wed, 09 Oct 2024 17:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaIr-0006yt-8t; Wed, 09 Oct 2024 17:16:49 +0000
Received: by outflank-mailman (input) for mailman id 815004;
 Wed, 09 Oct 2024 17:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hb5L=RF=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syaIp-0006xM-4C
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:16:47 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2417::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 422a21c6-8662-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 19:16:45 +0200 (CEST)
Received: from CH0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:610:b1::22)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 17:16:41 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::79) by CH0PR13CA0017.outlook.office365.com
 (2603:10b6:610:b1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Wed, 9 Oct 2024 17:16:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 17:16:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 12:16:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 12:16:40 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Oct 2024 12:16:39 -0500
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
X-Inumbo-ID: 422a21c6-8662-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFPnFFF89Mhh24q7QbOIafIQhBbK/oh/N4+fsJjiTGOPlmOsmYe3eSW/0nVQbD040nsJ7XGI4fVXkUGHzPZOCeVgOxbBYm5CBKkjPhDR9Aw2YHaQzeAQfBPNCYuO19CzCOq8+l2mdSbdw+rM4osQstihC3Sfns2ouACC90gEoVt/yMTdCAUCtxxwTTMeyYHM7G29Hn0zTAICrPqOl1ADJTfYO1C8wdl91h5CiZG/xXOlX5EKY9ZBue0qRbLgytF3rxbkbfQ7KZ/qU7EIX/WaRXOyWlnnsZPbmBX5xB5T3QCikeSKAW6UMkK4IwgQDuR9gL2nykpdyIhMwRals64vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYZTUMfT1THjUHLWlC/KI1rYIse6Y3fIVSg54AXOhjA=;
 b=ZVPpDAQewITXU2z9LyHLJR8L8RG8B5MmY7DdtpYJw7mUSDfdRzPnWJGv96GkfAUCg5irq1KtR3GyVged76xjfzcQ7fAQUamwX5nGXjvgm8dVdizDi9Qgudkc9TOSNgKhYCfklFzPqwn5qsiOTa5RYt3BV+aO7HWegOTCHIqQo2OGYdr0jQSnodEaZMRh8AGZeDpk8ACEX4cDPSlPuwj0uLTObn2s+3OOm+LO6oDVnc/td87Wv1jsP03SY/Wghy378mUa/idN5mIyNoTBEJDy14/6q5Zk0WZTJa/jGkYMn/24c7n/yPIj7zo0w05APWgkmsLtsrukTtoe0ezXPBleUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYZTUMfT1THjUHLWlC/KI1rYIse6Y3fIVSg54AXOhjA=;
 b=V/NxOHRjQ9vGFgUF3i3Qc1b1BUrxIKnYybBr9Vev85QS/c5N5nGWO39aTCn9cCe6MhONY5+R44gxY0n5l+iNXcaF5fTVaLGNii8rS/hZAevTk6xaCdh2pe9S8G7IcMYFFe6mVMh7Q8HnR29vn5jk8KHmpYLq6xBZgaiT/dw44o8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03b3647b-49f9-4a9a-be65-3170bde65730@amd.com>
Date: Wed, 9 Oct 2024 13:16:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] x86/xen: Avoid relocatable quantities in Xen ELF
 notes
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20241009160438.3884381-7-ardb+git@google.com>
 <20241009160438.3884381-11-ardb+git@google.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241009160438.3884381-11-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b549d2-1dd0-44fe-1539-08dce8862424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anIrU3hEMWJGMjNDRnQzNDJDMEI3Qk1VekFkRjl0N1AwOUQvb2dHR3NPNnJT?=
 =?utf-8?B?MEpqMUxIRmI5Ulo0YmhNVGxuTjdkaVFqKzkxSFVZN1ZEQUs0bFZGelRpalVj?=
 =?utf-8?B?N1p5VGNaWHJNSTlTU0kvZjJ0c3U2UGxlWHNQVkdsN2p0dE5TQW4vRTVVY1Ni?=
 =?utf-8?B?TkFzRGtOdzVDOVZ4SDRlUFlwZmI2Mm9uRnpJR1AwOVU5YVNkMWUvOThEcmx5?=
 =?utf-8?B?NWlqdXVjQnRDRzE3MmFTNlBxbzRCV25uZzd1Vjdad05FTVlWUkxWN3JGOTFD?=
 =?utf-8?B?SCtGN2FlVzhIRnRITHRDdFFVNlFBcXVQUzBoeEc2cHFwK01hM0dKZUwrOWFa?=
 =?utf-8?B?M2pUZ0MyaldnejBudmtIOGVwM3lpZFFzMXpyWEF1MCtlWmtCSkRtbS9Nb3do?=
 =?utf-8?B?b0Y2K29PY1lGRm1jbUxpTWcwVTBOVTlNWnc1ZC9RVU1uc05jbzhpQTlEVlJa?=
 =?utf-8?B?ZVM3dEFham1qUy9iZnAwUW5pTnFLOXNtc1B3UFcvWDNBeEExRDUyc0NZZlN2?=
 =?utf-8?B?a0VEbjVzQUpUS00weHNBckhjdVV3QkFWblYrUHFFOUZpZ3dHMGhnd3JPNG5C?=
 =?utf-8?B?dklBWEgrczBCdWcxTVZVb3dUeW5uN1hoenA5a2VKeEZCR2MzOVB6NmZwaVU4?=
 =?utf-8?B?a284ektHb3ZlUVBuMDhLSU9oVjZQL1VjMjdxYWZRVVlKWXRGWDNsVHcxU1k3?=
 =?utf-8?B?QXZBb3ZWZXNDKzJzSVVIQitraVJBNmpVTFZ3MWpRNE45d2FFeWR3dzB4bk12?=
 =?utf-8?B?M0tpc3lpdklkbVlteUtSU2lWK0dpZ215bXlROStUMk1SWi9uWnpRMlhRdy9W?=
 =?utf-8?B?MmRLWVk5emc3VVhJaXBiWGlNcU92aGYwaGp5T2htb0ZFTm1xbEdhL1VOeHRx?=
 =?utf-8?B?TzB2b2k1YjBpL2NFWXUyVFI3MnoyMXRabytQZUZxYmFBZmpBaktkYTRiSTRz?=
 =?utf-8?B?clBFbFAzRllTM3ZoZnFhbXMyNWg4cG01OXIrYStnV2t6elpiM0Q4SmpTZDV0?=
 =?utf-8?B?L1ZjUGNhWHlWaFhXanpvU2tFRmdBNUJNaHFDc2N5QkptdVMzS2VnN01uc28z?=
 =?utf-8?B?bXdXbUErK1FXd3JPRVBYMjVFWkwzd0FBYWkxRGUvaDFiY3FlQzMyU2ZkOGlB?=
 =?utf-8?B?S3hweGVCWDFZb1RZNGsyYUxLTW5BS3BqSzNuSEpEWXZONDRxY25QNU9MUEow?=
 =?utf-8?B?KzlqdEJSbGdxK3VlT0ppSzIyS1dRakxGRDJxOWpQVjZkZm90U240bGtzRlBN?=
 =?utf-8?B?bzc5OFZ3QWVBU0hpSlg0OVBnaDYwakc5YTFxZEk5cE1sSk4zOEpjTnJWcnlG?=
 =?utf-8?B?UGh1Sm5MRmIyeEhNb2tzRld4Sk9IR3ZySFNUU2dvK0lMRkozWjU0RWtKYVVW?=
 =?utf-8?B?d1lZNGlRZjV5WWVZTWFWM2ZxODBjeE1iekFDUmlMbFA1a0s0dC9pQXU5TEhD?=
 =?utf-8?B?d2xhVjI2dzF2czViWWh0Nis4WFViYVo1dnE5MVlYQkRjTTIyZUlPZkdQR0k1?=
 =?utf-8?B?L1dZWVJ4czJZU05HY2xqN0p0Q290cXY2UVJLeUF3bkVlNUwxZlQ4SkZDUVcy?=
 =?utf-8?B?WkM2aDg5S20yZUMxNmd2TW1qL2FlcDY5bXVWcis2ZUtTS2FBNW5tanNMWWdq?=
 =?utf-8?B?RjB3Z0x4a1VqdG1UR09tT3lYVTI3dDRXcy9aRTVValpINE96bDRVdzZTcENK?=
 =?utf-8?B?V2c3emk1ck5JeHBsVlBkYTVRSzg1STVsNVF3cWkxWk5BRlovLytmVXZMbU52?=
 =?utf-8?B?SGs5YTZtZk9OMEdFYUdHK2tsN3FQMDZJdGdLR2pDaXBQTjErUjgzVmlRdyt4?=
 =?utf-8?B?V3daUlgvTWNkdWlCaXFrdlowRmM4U1d1Ri84N3pWWityam4rd3JQdFN1Uml0?=
 =?utf-8?Q?JGLMUZc38U0Ei?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 17:16:40.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b549d2-1dd0-44fe-1539-08dce8862424
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483

On 2024-10-09 12:04, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Xen puts virtual and physical addresses into ELF notes that are treated
> by the linker as relocatable by default. Doing so is not only pointless,
> given that the ELF notes are only intended for consumption by Xen before
> the kernel boots. It is also a KASLR leak, given that the kernel's ELF
> notes are exposed via the world readable /sys/kernel/notes.
> 
> So emit these constants in a way that prevents the linker from marking
> them as relocatable. This involves place-relative relocations (which
> subtract their own virtual address from the symbol value) and linker
> provided absolute symbols that add the address of the place to the
> desired value.
> 
> Tested-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

