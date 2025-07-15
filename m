Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD0B0654D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 19:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044648.1414740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubjdJ-00019L-R4; Tue, 15 Jul 2025 17:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044648.1414740; Tue, 15 Jul 2025 17:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubjdJ-00016n-LS; Tue, 15 Jul 2025 17:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1044648;
 Tue, 15 Jul 2025 17:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akqQ=Z4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubjdI-00016c-5o
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 17:40:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c92e96-61a2-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 19:39:53 +0200 (CEST)
Received: from SN6PR16CA0051.namprd16.prod.outlook.com (2603:10b6:805:ca::28)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 17:39:47 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::fa) by SN6PR16CA0051.outlook.office365.com
 (2603:10b6:805:ca::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Tue,
 15 Jul 2025 17:39:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 17:39:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 12:39:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 12:39:46 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Jul 2025 12:39:46 -0500
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
X-Inumbo-ID: b5c92e96-61a2-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRX3ayniF+/Y/91Qr/SLQSiv6F2PCcGt6yaMYCAahs0xHhwSId6RIQkWHZmEF28I4YU+iCDB36zC/y9r2MVV4lXf75OY1RurU/74bJxSUmcxrXim+zXDqXtnas3nuQGfbhSUs7Lf4I4InSNUsZ5J17z7/GxhxaMuvzDtgOIc622fMM84TYELWiWz8CqBP6BBWdzkKjauMW74Me10UPPCi5lEbYL1jz2OP0biAZ7EFFAqDPgsXmB3fkKqdqaNJnppzXbDmCpr6DmBmWpS/LZFI63mI0g+0kENxaGiLXdcLNYeF7re1u3CdMR1JzekADLCbH/BPMGc8W/F8sEcw5W3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmJ2rJQ2gAQcDz3pPMFEVFWPdve8NkO/SijeXBiqnnc=;
 b=CcyXXIGp0vl98NRFF8NDt9ioh1b5+5Hd7lhbr2SMukhIMDStdwOjRTrm4pDqeLNwKgJgkbxHQRtbuD8X10Q3NoTssvHdoNKDCI7D/eDxw9LVM8dkeg+2t3/qlebgzPr0Xfq6UOg6pYAdnsgAIrntziPDTKcmI78HnLSBZ4vHxVmNtJnE8Es/gKyfCr5m8SIi9RhDuiXmxIVDv7OTMdjakP/3RzmQjDsAFfjSiJHWb26T7bPV9OGdV867RcVTE4AOzmVk9Cab4ovbYDEElD0fPT4X149/MmMJA8m5fXTMO7tqixAy6e1sogxq7hVgEWW6iIWm0iRpx7v3601TrU0PmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmJ2rJQ2gAQcDz3pPMFEVFWPdve8NkO/SijeXBiqnnc=;
 b=XHEjIigRyya74TeFf08TG7MP1hrHEAWYOafSBDherysh2OXKtUJDiKnarE7dmZLutdAhyaeEN8lL8+PYvdZYeHGUFsjDiGADjoarW6PYic2csphZDPTKlBjXKXoO5ILd7PyPOx+2M3DPjtYtZEHcOrOJ0RpdDTdwQ9WMcuA4CBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <58471142-5193-4a44-a2f1-d829604ad962@amd.com>
Date: Tue, 15 Jul 2025 13:39:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 01/14] mm: don't add module pages to free
 memory
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250715132936.2798-1-jgross@suse.com>
 <20250715132936.2798-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250715132936.2798-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9711f2bc-7c42-40c8-7116-08ddc3c697cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE5rZTZ4Q0NhenpjZWV6TUIrVnBGd21JTG1qMXEzWXUxcGIzeVpzblAyWDhK?=
 =?utf-8?B?VHZiRmtpTVdiL2pFeWEyejh4RldES3NBdnM1YU9NREVIK2MxdTEwZXE4TVVx?=
 =?utf-8?B?WVMxVW9aeXJrZ2xUajd6M1JraUFkNVUzUlJwenNxanY3K2tQdndUdDh3bXFV?=
 =?utf-8?B?Q1hRN1d6WUlUejB2UTEwcExsc0RzSWhIUU80THNzbzRMMUNxdXhSVWZvZXU5?=
 =?utf-8?B?Y1dLSzdLRG1xUC8wcEkvQ0hyeVcwb01IZS92WVdFZzYwd204bG9zQ2FJa2ph?=
 =?utf-8?B?bXYybDNxTUVmbDdUZXo2SkRONldUaDJGUitMRHU4MEJHcWRZQURqVklVampX?=
 =?utf-8?B?KzNNK3lOTHlYRHBTa0NrZlkxYXFRdTFndkFGRXhTeGNSbUYxNUtiRFNjRVpV?=
 =?utf-8?B?bTlEeThiZDRXRVpUbkZvK3RQNitIeW9DMVhXMTRLZW82Zm1BUXNCN2dZeGNL?=
 =?utf-8?B?b3FZbDkreFNHdmE4eFhjeDFOTmY4VG9pSy9NQjNDa3lhamJudy9kQ0M4dktH?=
 =?utf-8?B?Z0FUKzMvcWV3bEVyL1VTU09JZUsvTGpjMWxuK25TcVJVUW5aRy9QV3plRTZx?=
 =?utf-8?B?bGJxTEpDQ2xBRlZMRXdzZUNEZnFXMDVsZDFXK2JNUGNWNVdiS1dpT1R3ZmZC?=
 =?utf-8?B?eWEwMVdXU1NGa2J6NUIySWpvdGRab3Z2YnR2Z3o5OEs2Tlh6Uks4MUZ5eFR5?=
 =?utf-8?B?NGNpRlRFeEtySk1XK0ZWNFJZTkY1V3Z2ZDBSdFJUUkhNc2pFWTRabVdlVnNV?=
 =?utf-8?B?SGEzN3NjZFNleUM1eTdSQ1p5akZXZVc5aGk5bVdoeUtEV0l6c0tMcHJ0bTEr?=
 =?utf-8?B?Zk9ucXVlaDJyUy9taCtXQWdoZ2NDRHRsV0ZuR3ZwZ00rcHNyZ0FwdWM4TVZ1?=
 =?utf-8?B?VlBLdnZFak9YcEYzNlFQeFBXaXFacHBINnd1RThobFUzUWlacjdwcEMxanJx?=
 =?utf-8?B?a1dnVjZUb1JicEx1NjIrYkE1UU1vM1NuSk5Jd1dnQTlCRExkSFB1aXNLTHh2?=
 =?utf-8?B?cnR6SHVOemViRFg3RXdLY0IwYzhHMkJwQUsxUWsxMlIrZ2NpQm1lLzd1eTZ4?=
 =?utf-8?B?WWFsM1NhNy9SNnBpOVJ1aEgvaGxDU2FzNnZZUlVuQjF1OE5wWVdvN0ZleHRN?=
 =?utf-8?B?bXVRRUt3VXRrcXlyaXlSMVFkcEk5RVJOL05kUkFlcExDNTAreWE2aFpYYzZp?=
 =?utf-8?B?N0VUNkdlUS83Ny9GTlFOZlFRV2hId281ZG5janJoZ3Q2TnVKaWlZTzhNQW1N?=
 =?utf-8?B?bzdXYmY0RFJzeGd5QlA1cllscUd3YVVXK2lBNVlZdGZXT0wvUWMramoxNFZP?=
 =?utf-8?B?TDlKcWJmdTd5MGFleEdjZ0JkYVlkU09lcThqVVM2dzczWHJRbWpkR0hVTTVn?=
 =?utf-8?B?bGFKT0hEczhBL3pyTVEvNjhPck5ZOVM1WmgzTUpBMk1rZWlZSmtPTVlkb0Fo?=
 =?utf-8?B?NEljY1YrY3FFdlRQMlZsQWpMSHFIY2hmNDVvZHM3azVMVDBod1FJQ2hXaFov?=
 =?utf-8?B?ckZ6Zm9iMzZ2a0hqSjlQeGFWWUZrUWFlQTRIUDR5Tmxlcjlhb2haU3Jsd0d0?=
 =?utf-8?B?b1htSElQVlpmbWN4STExU3VHamc4ZFFZQng2WXVnaTI1c3gzZ3NtZE5GY1NT?=
 =?utf-8?B?TCtyV2dzSHljc3EraVE4a0hIQXNrZzVocmEzaHFmaEpvSjJlYXoxTFJUNGly?=
 =?utf-8?B?QXZ3dUcwYkhyWFZRbXZyeTRjNUxZSzZqUzdUTXJjQUhJVmlMU0lRbHQwaUt6?=
 =?utf-8?B?c0syc3VVZVowTXVSN1FOMmlvb093MVNtMWVVZ2dSdHV2UnpVSVZMSDZmbHRD?=
 =?utf-8?B?MDRvaTFodHAzVmNGVzlEOER1UnZhOU9zVGRmUW5MMTVraW1IdDhiY1hPNUxT?=
 =?utf-8?B?ZnFhL1BoRmdXNmNPQU5XclFPQVhWRkpFb2NHMlJsblFBVXpscllMTTZzK2FU?=
 =?utf-8?B?ZXpaZ3FVNm4yek02UjJLemNvY3pUdnhiMkFMZUlwdllVQVVwMUhXcG5NQjhW?=
 =?utf-8?B?anZrRzlUOThMMDR3S1ZUQkl1THBKZWFPZjJ2NTNPQU16T3NwNG5EYmhLWnAv?=
 =?utf-8?Q?uzkr8t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 17:39:47.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9711f2bc-7c42-40c8-7116-08ddc3c697cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

On 2025-07-15 09:29, Juergen Gross wrote:
> When initializing the memory allocator, don't add memory pages of
> modules and the initial boot info structure to the free memory.
> 
> This is relevant only when running in PVH mode, as in PV mode only
> memory above the initial page tables is added to free memory, and the
> module and start_info pages are below the page tables.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

