Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB72AE1B61
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 15:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020954.1397058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSbM2-0006yj-AF; Fri, 20 Jun 2025 13:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020954.1397058; Fri, 20 Jun 2025 13:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSbM2-0006vl-6z; Fri, 20 Jun 2025 13:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1020954;
 Fri, 20 Jun 2025 13:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSbM0-0006vV-OQ
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 13:00:24 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2408::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84128779-4dd6-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 15:00:20 +0200 (CEST)
Received: from MN2PR16CA0043.namprd16.prod.outlook.com (2603:10b6:208:234::12)
 by CH2PR12MB9459.namprd12.prod.outlook.com (2603:10b6:610:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 13:00:14 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::8c) by MN2PR16CA0043.outlook.office365.com
 (2603:10b6:208:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Fri,
 20 Jun 2025 13:00:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 13:00:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 08:00:10 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 08:00:09 -0500
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
X-Inumbo-ID: 84128779-4dd6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERRdO/D6ZDABXMC5oYonkjy12dulvRUNxsyH6JkpxgtipP7TzGpwNXDRy3XoDvS3L4k1p5fGsGTIfLHe0f9+dxNC2g0j7CEj/OMBjdbLOXGyTOvRCnf67sbaGRKpazR9uENcng8UElqERNP4ne2DO/30pniOCA7h9A1IVbOAOQ7Bz5lmi7mVKrIOW9xDLSo2g5R4KmwMZveyN5tiHrnmyA1j1qjLnvUg75OWmWJFHlCzOoH5a6T7odCf5OVMQqylw3ZD2L+Hbtgbyon3V1XmC+svgt+YfcF+tzbECF1XZIi5i4/z/MSVdWP8BBPa7zIEzHGa+DUhSqhDUPrZkR/j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFWo2kARnIabNYCUDf7d1lYOMUzhvQzbPZe1X1Ey7J4=;
 b=h/qgB9LlZZR0rKt2A8FZ5QfIxI/G5AT4xKWv0dV0B3JErWcS1G4Qq6mftxV6rvaqgqCj9Xe7knqpLlLNk09oZm9/CGXSo/UBVa+LKWE5SwI/KIHmKxK8QAG0763hNIdN+qbnkEPU2C1Vz65ag9beKY0HSoisoi62j2qc1c3GIUo4DvEsIIZwjLB3NQMdcaVKnAyuplTjdi5bRjksQMnaHPGWvPyNMzHbPSY76RbAcGg3uiizPd6mlHvBcww9CgHOKxjvA4wEvPB7XSdWXCeC/a3oq7P15IiOGgINsnIahTd49RFLWQ7wyNkZghQg0EqglIoXwvHa07lu9p3uhZlb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFWo2kARnIabNYCUDf7d1lYOMUzhvQzbPZe1X1Ey7J4=;
 b=eyMpiV8HPirRImxzhxOERqQn606D4VvwPyusmnRXl5t2U8re5giJjIkFlIqIxc/nZmovbnfs0UIC0ahIOtoBZcjDvc32sohQqN7D/dvBqS/sDoA+h0ECONvD3Ta7SJ00Jy/VDQn8l2z8nrFLpNMWrrBePtoGynvbSoUpiauBylA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <54316ade-83ad-4a34-8211-13b6947a1423@amd.com>
Date: Fri, 20 Jun 2025 09:00:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 02/12] Mini-OS: add final kexec stage
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250616084619.11112-1-jgross@suse.com>
 <20250616084619.11112-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250616084619.11112-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|CH2PR12MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f16aa3d-3507-4601-588d-08ddaffa6623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEVKTlNtZTNGMjQ4Vk1wNEN1dXRQNTJyUlNZYXNyVnVrU3pZdHpQNjRFSGJX?=
 =?utf-8?B?RzVRNkU3Ly9Pek1qUkpTcGFaTkdkUnRKYk11eEdXRElJekp1ck40NE1KZEM5?=
 =?utf-8?B?UTdHbFVmNk5rNXV1SEFseVlSOVJrWEduNFlQR2VJL1JGN0ZzY3VFNHBCMGFp?=
 =?utf-8?B?M05DVnpBZm4zZVg2VTc2SGw3YzJtbUdHMWJrc0xaczFFazdpUHRvSXY5MFo5?=
 =?utf-8?B?eU5mSS92aDU0R0YvY1Q4NFlYVXZrRDJGZEJuRk5Od0U3M1pNZ0FmeFRkSkU3?=
 =?utf-8?B?b3FCd3B5V29nU2psajVXMW5oSlRwVFlrUHc1TDZkY3N3NGdnTGdUVjFWVk96?=
 =?utf-8?B?Ui9kR1c5MzZ6eFdVNVZFaDBpOXVhUXc2ekdEWUlKazJqTncvbzBqN3NpcTFp?=
 =?utf-8?B?YkdZbnBPZ25iMndCMGE3blEwa2pucUtNaDBPZW5YZ0hhbjdGRzNBWXA5UmU1?=
 =?utf-8?B?RENKTmVyZ3JCbit0S0JDbit4bjBldUJKMS8wWkZ4TUZiNE5tbTVwNit5RkI0?=
 =?utf-8?B?eElZN0JvaFVieVhOdFd2bnNLRVlUVjBBMm5qZlVWWGp2VGRiY3FWREw4OGdE?=
 =?utf-8?B?cnpzaGJJM3pMcEF0L0pkNzBnTGx3VDBhNk4wSHdnQmNFa01tc3gyZEdsNU9z?=
 =?utf-8?B?VGZjN21YM3NTY3VKbmQwa2ZFOWxCVklTWXJzNXBsVEROTlNhYXlDR3FxQVg0?=
 =?utf-8?B?bGJQQUp5WHRzamdvSXY5K3U0dnN4NDFUZUdYR1VQbDNidENITWJhR1FLMzlZ?=
 =?utf-8?B?QTVlQk1TZ3E3cHlpY1BuZEdpQ0lSRHRSb2FoV0hMelRtdmF5ekZQaUJiUDUv?=
 =?utf-8?B?ZkxIMGp4ZUQ3UFJROHo2bVNMcmJUTUlQckZCWXlaMEVkMGpsY3NraXMzckl0?=
 =?utf-8?B?dDZmYmlVK1JsWncxNjRUbHh3VHhNRTVtWDV4aWZlRFJMcGlzNjQ4OStZek81?=
 =?utf-8?B?d0RaZlAzb09EazRTVDFpdmVFUU8zSlYzeVJiV2J2VHVNWkd1L2Z4ZVJaWTZG?=
 =?utf-8?B?U3kxYTFab21RUVdhL05ONlFxZzgxa1VqSFBXeW1RZDNLR04rTlpEcHRpK0JP?=
 =?utf-8?B?ZTNQL2dkd0ZzOU5hTVRKdGNaZTBTZ3hqT0RYUlhkZXIxQnlnN2lUNUNwcXU4?=
 =?utf-8?B?OCs2aERiR2gxQVNFaE83YVdoSXdYS3FaSHM0c1FDVTBPYXNIZUxkL0l5aEd2?=
 =?utf-8?B?L21DUmowTG9yd0g5WmtyNWtZUXRRWlJta3M2QXRqOXpLRFJEOXUzczE3NDRm?=
 =?utf-8?B?SDZsWDJCU1ErcERHTVlUNTJicFg2cDB0QldaMkE3ZDRKUlE4cE5PZ1JnNUh5?=
 =?utf-8?B?OGRqRVJpb08zNjNhRmpEWDZpMUhKZVF4N3ByUmZ2bVpEV0Y1UEpaeEJad29Y?=
 =?utf-8?B?VnJZYjhTNmg1R3lvM0xZdCs5UW5KTFZWeisxUitHWmdpYVRhWjNSY0VheVNF?=
 =?utf-8?B?aFRVZGlyeFhpOXlEM3NJWEphK1pkOVcwRGYvZWNGaXNYelBFNWpwdWk0NkR6?=
 =?utf-8?B?L2EwZlNBNnBtcEpjZVBOWldhV0c2MWdGdldQcGNXWlVHa01tNGlaaHduV2U0?=
 =?utf-8?B?N1A3V2JTR0daVzRGUzlhUVhkSkoxaWtxSjhhS2pMVlBMdXJ6ZE90OTE3QXBa?=
 =?utf-8?B?ZUd2ZDFZSDJjdU5MZWdoYkEycGEwb3pLdE85NjhrZ1NRSm1tbmJXY3MwQU1y?=
 =?utf-8?B?SWp4eTlUWEJPTkk0N0VwVmtUS2VNMjhhWUZJYWxwNVBaQW1VNXNkSGlRajdM?=
 =?utf-8?B?djJ4SHVlcVFabDRuelVVaXlZZDBCWlZ3MjhKREpPZVh3QS82Q2hFRk8yNSsw?=
 =?utf-8?B?NWs4bWFuZzZ4Qkw0RlZlakIvRFEzTDdRSVNzL0REUWlVdWwrNk0zN2UxdVFC?=
 =?utf-8?B?ZXZzVFFpaStOeG01b1M2MnJlVTMyb0FUS0RGNXhnWWJEMTgxMGwvSWZlai9y?=
 =?utf-8?B?YnFuNWRjVlVvODdSeXJwTFJxdEFNWTEyS1VZYStZdll5SlVPSnhwS3kwRDNn?=
 =?utf-8?B?Y0tRbnZzYVJ6cHpIcE5TUWhQS1FtcVptUEVsVDF5M3JkVU41dWhtTWY1dFIw?=
 =?utf-8?Q?yt95UW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:00:14.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f16aa3d-3507-4601-588d-08ddaffa6623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9459

On 2025-06-16 04:46, Juergen Gross wrote:
> Add the code and data definitions of the final kexec stage.
> 
> Put the code and related data into a dedicated section in order to be
> able to copy it to another location. For this reason there must be no
> absolute relocations being used in the code or data.
> 
> Being functionally related, add a function for adding a final kexec
> action.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

