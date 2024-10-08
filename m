Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637319957B3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813463.1226412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFy1-0005DN-Ip; Tue, 08 Oct 2024 19:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813463.1226412; Tue, 08 Oct 2024 19:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFy1-0005Af-G9; Tue, 08 Oct 2024 19:33:57 +0000
Received: by outflank-mailman (input) for mailman id 813463;
 Tue, 08 Oct 2024 19:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syFxz-0005AX-SG
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:33:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df94f5b-85ac-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 21:33:53 +0200 (CEST)
Received: from BL1PR13CA0220.namprd13.prod.outlook.com (2603:10b6:208:2bf::15)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 19:33:45 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::8b) by BL1PR13CA0220.outlook.office365.com
 (2603:10b6:208:2bf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 19:33:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 19:33:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:33:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:33:44 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 14:33:44 -0500
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
X-Inumbo-ID: 3df94f5b-85ac-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol5M3zpS3fSp6xmgLA2vQUhOb44AUYE+JSg0Re5GSqwwt+Mls0E8Uht+xFETrRqPqERAjCMn0tl+oPdPId1L6uALliABg7mETdbRaJrB/cn8WgNVc1o/9Hy35C9WRefBY/y41kE8XqaBMnPK/2AzczZ6u8YKHlhbLYk/Q3X6wOFW8mh22tVewxjKNZzhpnKPPcJIrdts2tILAGeb4zCfyv+uml+kKcOE5Bgv4bd6Wr8iVWhWyfsVBDUPuxBxhYgYSO6stySar+5HQfxm1zhCM4cXOVDAgQYuO2ZHmDoGs2wmD4LpBvf8EDs6gt/hNJXoMRjDOTxolD/DpkWSudewRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okIt+cD0hk+Ewt2+WSScyTrFmX5YmiHnh3+ZNoFavOg=;
 b=f8sW3UyrBGDDOCTZz7NVHsjUgUDGQxlDZL5AUPQ/XhQXha9flJeNZa7ul8y/1mt6g28F05QXXhYJkYh2x14GCETnutdbJyu+vacZDujTyXtBtYKEPRGyOH+y5OPfMOvlGbbCNDyFLCfCQQLPixVrt7eoyEtmUjZIe6c1p9pACNvEyrkzoEuqogdgJjdGkJ9srcQltMusaBbmGTGQjtztXIMueY71OYvFuml9IiTG2CMTd7nEIJ9YEDdKT+GbuljN73ItxTrUseQBgwEV3ndOUn6VCj2XaTF4aY4f+sG3MKH2E08l+QN9IhA3lN80X8MFx0sdk0Df0J9DPlZ5wBUAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okIt+cD0hk+Ewt2+WSScyTrFmX5YmiHnh3+ZNoFavOg=;
 b=KoKForNaqrzqFkx/qKiVJgQF5oYGA5/7DpZl6SRfccmVfyiNGsCxMxdx1CQ8CAzccvBOZSnwg+TJc6Duio5aAlfmVksc+VMgwiGhwDuy0VItB4tE3G2uHWz1VH0L9OqAkhRzYN1APr/Hmev+Ueht8WAdS8j+J3y1TsjApNVA7BI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9d98acd4-004c-474e-9b3b-0e201f5e9862@amd.com>
Date: Tue, 8 Oct 2024 14:33:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/44] x86/boot: convert dom0_construct_pvh to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-32-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-32-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd4388e-00a8-4c63-14f8-08dce7d01ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sjc3Ni9zZUlreCtDd3Q4YUxyekZHMlhyYkdnbHEvcXprcmN4L0krUVJsbXBR?=
 =?utf-8?B?eVVsZjJCdjg2bXR3UjM3SmZQZ1U2V0NIRHQybklKejlEOWJ5TDkzL3k2ZWtu?=
 =?utf-8?B?SjZpc25NSk9aVjhMWlNwVUpNd0xHT0h0WG9sZUUvVGVrLzFnWVlSVHU1bFJF?=
 =?utf-8?B?N01VR2NlS24vTStDaHZINWJxRlFMNDM1OUp4dDRMZ2cvMzkzUjRtYlYwOWZa?=
 =?utf-8?B?b2VSWXlmVW9OcE9Ra2NCWURjaFEzVTBZdnlqeVpEbENLT25LQzJ2RDNDT0Y0?=
 =?utf-8?B?Ry9LbVNOSTFsNXJmSzJoMCswVzJGbG9NQXhDOFA5QlJocEZSZllmT09xbGk5?=
 =?utf-8?B?Wk5FS0hnYWNmcjYrNDUwTmV5dE1BYzJqSGRpZmNHZmhWMnRORm95ZnZibXN0?=
 =?utf-8?B?OVBCV0hadkxFd0FqWVVGS0VxT1JFWXIxN3h5NmI3dGJza0xiQ3ZGNWNmSjhj?=
 =?utf-8?B?bmRkNmprcXJlalFxMzN5ZGlvam1raUpURkV6bW00TUpxQThVUzhnaXBHdTBn?=
 =?utf-8?B?Nkpudk9DTWU2R3VzaVNzZVgxU2R6NzdFMWRzNGpnY0h0MWE1NlhRU2lkMEpo?=
 =?utf-8?B?eHU1dkhkeDN3MWhaYlJDTTVwRmRHT1VuOXppVGgvYjkzS3hoZ0VJSFVTVlla?=
 =?utf-8?B?VmQ1Y2g5aWZnbDNuTWFvakZTTlAzcm1QU0IvZkVjV3h5N05aV1U0alQ2S2lS?=
 =?utf-8?B?dSs4cHBWVmFZcEJ6TVZHOTVPUmx1dVNEVmV0eW9GeXMrZ1VpUld6TVJveUk4?=
 =?utf-8?B?ci90RTlzQ1MxQzY4UEJlNnA4N01YOFlValJTb09tbWllWjhiWmk4ZHQrR0I4?=
 =?utf-8?B?MHpIc0d5OUtYVWh4N1l3TVdpOUJ2Z2dzYlRCeE9yMkxWM2NoakhhU2pZYjJi?=
 =?utf-8?B?dHAvcVRkMTVpM0xZSEpOUkJPQ2pPYkpsVGg1emlxQ0tpYWZ0QzNZVWtDTXE2?=
 =?utf-8?B?Y1ZiT3V5a0MxdThIeSthS1pGYm9QaXVoM0dveWx1OWl6dlNtRXpva0Z3VXR4?=
 =?utf-8?B?bWY1RHF1NFRUTitDMW1Pd0UyNVJkMWxUZitsempCbElISGN5bmhkSVRwNllF?=
 =?utf-8?B?VDYyUDF2QmtZaXE0MmFYUVNzUnJraVVSWVU2WUNyd2tJREpFN2NYYnpYOU1T?=
 =?utf-8?B?NzRVRVExenM3aDF4ZEJlZDNnMndVU1VBMVgyQWVGTEkvWUdSZldMWkYveEFX?=
 =?utf-8?B?QzNLZjNydlI4VDJGZnptcTVXTUJCQzZCQ3FrWDlBZzlYWGhicTczc2wyR1JI?=
 =?utf-8?B?anUxdk5nUGZxOERZTVgzeDVERWZlUGYrNkFQU0czcXhkN1Y4OHZYUmwyYzkx?=
 =?utf-8?B?V01aWVQwNWNmbXpUU3BWeEt4djNJN2xlWjRvRWU0VjdTVzlSNFMvclRxcUZu?=
 =?utf-8?B?a3E1S1AxVEZMM2R0a1hoaHlRRDh0d1hkV1k4OFhoUmNQamFTY213bVVzUkUv?=
 =?utf-8?B?NkhpcnE2TUd2SGhoajlvdnFiS1NTdzlEbjR3dE9HRDY1K215NFpKYU9CMnp0?=
 =?utf-8?B?V2swZ3dqcklnRFE2bFc2OTF3b0ZnQ25CVjdXaUE2aDlmV2ZGRlllelhoelE0?=
 =?utf-8?B?YTh5MXVvVG1QNEJDbzVnelplYndZRGw0QVlBS1FNalp6UmlQWW4yNEttOWhF?=
 =?utf-8?B?cDZ0VHlnaWxXR1g0K01PTklJUE9DRmxiTUZrbzdVYjRQaFVFdnl4SnRlc1ox?=
 =?utf-8?B?WVdHUzlOR1EveFJTUkZlRmFIYjlZUUNQVnEra1QxdVdTb3RCZzFaVkswWktL?=
 =?utf-8?B?ampjd0dBWG9laVUwUk16ZWZDaU9tcFEzV213eVRtQUkzTVNqN3JZbjVxcThz?=
 =?utf-8?B?WHhYeXo3M1o2cGI5LzBMZU9sVUs1dDFMVlA4azAvdWV0b01MYi85VG43elZX?=
 =?utf-8?Q?eRM+bg6ouQC6T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:33:45.4643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd4388e-00a8-4c63-14f8-08dce7d01ff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This changes both the kernel and ramdisk parameters over to struct
> boot_module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

