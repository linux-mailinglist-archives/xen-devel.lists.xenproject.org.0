Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47291D8DA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751261.1159149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBN7-0008Dd-W6; Mon, 01 Jul 2024 07:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751261.1159149; Mon, 01 Jul 2024 07:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBN7-0008BD-Sf; Mon, 01 Jul 2024 07:22:45 +0000
Received: by outflank-mailman (input) for mailman id 751261;
 Mon, 01 Jul 2024 07:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Yp2=OB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sOBN6-0008B5-1D
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:22:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3347fe0-377a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 09:22:41 +0200 (CEST)
Received: from MW4PR04CA0387.namprd04.prod.outlook.com (2603:10b6:303:81::32)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 07:22:38 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::92) by MW4PR04CA0387.outlook.office365.com
 (2603:10b6:303:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Mon, 1 Jul 2024 07:22:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 07:22:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 02:22:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 02:22:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 02:22:35 -0500
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
X-Inumbo-ID: b3347fe0-377a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOnhsj/73+JSBq9LU3p5ENHyL0PjxKJPjbHoFCCmfOC0v34pF/mP7ijlQXDuA9P1seUdgP+xFLccxWbzxZE2HpLtY16tRVKyuN37rTdze7zK3avwI2EOJ1VqYMnbUwM8NvIcnC5AIvT+n6zKBR/Ai1FdQzVruxOFwnz+L79U95euWORJqn5UMh2BuU1W76hmhAJoYD05yJJWm5D/P/aVSjDkSMenRz6pajDxTySW1xU4VwyrLZChUyKn58z44wZpriAuYi6aFF+csThrfG91UXryaHDFXsZcsx9TlNKcrxRKbUOm8YdApWlycstgDAyPyHFVhtl2bsc9HJ5oxmqNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYkdXjYaArJWI8mrkdJOkyZpmTVWqrido83lu/309xY=;
 b=bDmwjRcKJSvhUgeM84AlT25Hwx5iYMXjrZqKmpQ+yKpf228hTPb8YdEk9Vs5BTGK/RXVmlJXsAE2YALhRp0vyczZtouOhe6rGyxzddYhjFy6PaIFT0ArpStTE32SDX9QDn3Z38/tg/cHOf/jUiCkOYIw2RYEQmfIw4IDP5euv7w9d2rkCSP2aJf7OpJZKcvvZASeyx0/gvkm6vZMgCZZg5s8//UL2D0bEfdwGGv3QtlmIvso71DILLEIhInlGcXqe7uYr+MVGyK6d3LC7s+Hk2Bt8sVkkmuxx7zBB4tL5IfAGfUYBd+CNZ9Hr4Cyr83g/OqTUf0/KAjHplwLqSYUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYkdXjYaArJWI8mrkdJOkyZpmTVWqrido83lu/309xY=;
 b=rVXdXObTBeZ96G4WrxDaRBnvYPCGT3vmI+ViJjUrroMawgTNnDXMQT05yjNui+t6jfiD22uU8cfvnBroiRdNzJ3wahp/5UlPyfU+Q5zqwASZoKIHThC1t2lTt3mj2z6M9s0Bjp4qWJWCPBCBvcZ+odQ6Wr4ZO7CSV1mDL4Y2ziw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dcc805c6-6d34-4495-a778-3146e56ff319@amd.com>
Date: Mon, 1 Jul 2024 09:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/bitops: Rename for_each_set_bit() to
 bitmap_for_each()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240625190719.788643-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: eec5ee2e-87b1-419f-6f5b-08dc999e9600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTBDWXdhME9zbEFveitHL3FhbkZzRnhPT3lHeEE2RFRuRm0rbjRBTXFvaGQ2?=
 =?utf-8?B?NjlLNHdzRWMxOUJpaGN0WXNkejJBOG9YUEpRdTNvT05ENnNRcTBacENKZlZ0?=
 =?utf-8?B?bUlBdDlFck9CbFRPWFVmUmJPYkVZUTFDQlloZ2hwMXRmOGRWRFllWVEyb0xO?=
 =?utf-8?B?L1Vxd2tTWEFzalYvbjF0eDBNcitMeUthM3ZoSkpXeHJ5WWc4My9IVENvMFdW?=
 =?utf-8?B?STRXejR1azVLQ2hEeVl1ZVFOR2NWWWZRYlJCVTk4QWh0TWU3d0xwRVExV2NZ?=
 =?utf-8?B?TE8wTVVsQjcveE9MWUMxY3VrcVpZN0oyTGxFU09xbEFld2RVOHo1MklHT1Fr?=
 =?utf-8?B?QjNpSjl4cUNkMHlVUEVVSytOalJqdnJYZGx5YUNlU1VPUGIxU3pvZFNMZW5o?=
 =?utf-8?B?R3FBUkFQNDg1Y0pPYWlRZlhyMXZEdG9LUnB0TFE0cEEzM3AwV2F1OFpuWUtz?=
 =?utf-8?B?MWVvRVoyWHlqaUpTY2M0Q2RHbXF5RHBFTE5HUjBKN2oyR0FMc3RvVFpINnBn?=
 =?utf-8?B?ckFKWEFxYWt3NG56Ukhtdk5pZGJicVlvQUZNanJGbUx6MlNaZTBqVDlYbE1L?=
 =?utf-8?B?UGQwNWcvWGdLTC9KMW5reDlLWkdSbzR1OFplenBrRzhqQWMxSFFEUitKandn?=
 =?utf-8?B?VXVvU0hBTDVRczdFU1VYMFplcGJRTlhIT0N3eTlOQmNkNlBhMk1sTDRQUGFv?=
 =?utf-8?B?Z0k1eGJzSUlDQ3VjR0xXaWUzcmtqc012MXFxaXlNYXdZWlFwOU9PclVzdkxz?=
 =?utf-8?B?TDl4aE4xNDR1bzcyTHdmQWpNVzJTT2RPUFRtdE9ScUJwVnJxYkl5MS9lTHNz?=
 =?utf-8?B?SXU0N3AyR0FONDFCQU1zZFpNTkoxSGNxL29ER2NqVDN3bXB2Zm5YcFppZGpl?=
 =?utf-8?B?SDFFWU5EMWZsVnBRcG1KcFdzbk0xM1Z5S09XM3RjeDFZU212SkdUUUNGbnJT?=
 =?utf-8?B?b05LR1NQdmY0WFdZMEpVN1RXVUdjbnJpVi9WQ3VxNjFLcDBvTG1BQXFaZWo0?=
 =?utf-8?B?YTA4NW1lcFplM3RBYVpFMmJSU1pCSjRRSE1tbWs2b0VScU9YQUt0TXVmb1kx?=
 =?utf-8?B?RjcrV1lpVzZFdmhxZkRJNytwMS9lT3BMWU51UzBITXEzYmE5OWRjbERnZmdu?=
 =?utf-8?B?YTZ1T1VLNHlhOXBvVlMrc09KcTFEY3duWVQ4d2l5Yno3Z0RDVDBDMlFaYUlq?=
 =?utf-8?B?MnJtWkFqcnZjM3NkbkxvekdSTFgrU2FqRUJJZ3k0d3NlSE93ckdVcG1vamg0?=
 =?utf-8?B?b1B1THRYR1h3aEZ2RWt2Wm55V2RZdUg3Y2w5RjNlQUVTcEFySFZZVzJ5VFNV?=
 =?utf-8?B?ZHdoTmdOMkh2SkF4NDRZZndEbERCK0Vla2svQklQQkdlTXNwTWtqOTBhbmlw?=
 =?utf-8?B?d1VTT0U0Q0s4QnZaeWNZN0RmSW9CcGtYQm9jUlN0ZDYrOFAyTE4rN0h2ckli?=
 =?utf-8?B?OWdoOVNqNTBNNjZkclNEV09qTEpnUGZEcGxhSXhOMElSOGZEY1ZabjNneHNW?=
 =?utf-8?B?VGU0KzkwMGt3NERFeW1ReFJSMW9Zc0FRdGpCZzZuVlVTT21UM1Zqa3RLM1NG?=
 =?utf-8?B?OHYyK2NFekNKb09WRngyRHozRndDelFxeDBINm0wZkxjU24rR3M0SDJCb3oy?=
 =?utf-8?B?bThBM25qOWlDaGp3U0pzbE40WlZJUnZ0Y0RXRnZBSkdLWGU2RWM5dXI0am5m?=
 =?utf-8?B?VjR2a2kra0dHSEU3R0dYSkY3bGRBcUdyeUtzaCtpRFlSWDFnS3VNaHVNd2JR?=
 =?utf-8?B?U2hHdExZb0k4Q01IdWFuRk5XRzAwRG5TeFl0V2YxaGFDR2RzdHYyMTViVDdS?=
 =?utf-8?B?eDl5U1E5WExxc0FoakxWTG5jdU11aTd6YjIrTDZsTndhYmNoTy9tSTVQM2xl?=
 =?utf-8?B?M0VObC9JOTJsL3NjSTVkbzZCOGpCaEcrRXg5VUhsb1VXSE90U216ZzM4bWpB?=
 =?utf-8?Q?Z3HgtsBrYxYKa8rOaBryRIEIzs3ds5SW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 07:22:37.8542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eec5ee2e-87b1-419f-6f5b-08dc999e9600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025



On 25/06/2024 21:07, Andrew Cooper wrote:
> 
> 
> The current implementation wants to take an in-memory bitmap.  However, all
> ARM callers and all-but-1 x86 callers spill a scalar to the stack in order to
> use the "generic arbitrary bitmap" helpers under the hood.
> 
> This functions, but it's far from ideal.
> 
> Rename the construct and move it into bitmap.h, because having an iterator for
> an arbitrary bitmap is a useful thing.
> 
> This will allow us to re-implement for_each_set_bit() to be more appropriate
> for scalar values.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


