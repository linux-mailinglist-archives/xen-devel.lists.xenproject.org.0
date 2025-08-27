Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1FB38583
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096247.1451004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHYV-0005ts-SY; Wed, 27 Aug 2025 14:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096247.1451004; Wed, 27 Aug 2025 14:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHYV-0005ri-Pn; Wed, 27 Aug 2025 14:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1096247;
 Wed, 27 Aug 2025 14:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urHYU-0005rc-4d
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:55:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2412::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67a2799-8355-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 16:55:16 +0200 (CEST)
Received: from SA1PR03CA0020.namprd03.prod.outlook.com (2603:10b6:806:2d3::17)
 by DS4PR12MB9633.namprd12.prod.outlook.com (2603:10b6:8:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 27 Aug
 2025 14:55:08 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::3) by SA1PR03CA0020.outlook.office365.com
 (2603:10b6:806:2d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 14:55:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 14:55:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:55:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:55:03 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 09:55:03 -0500
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
X-Inumbo-ID: d67a2799-8355-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/fL032FSEvLMbvzC+B5Mphc8EVRWa1lZwhDdYNIjFElhagNEZMJkLvfrZhPSh8+NHlcRSyAzwIaZiVeAuGvAwGExRF9CMEllpKqsnpcNqzpvUnd821DlUtJNDU1ql18EAKripCRsIH0TMHKhzYRDf2eW+GvoRJ4m7o/eUYixF+HwtvJy3f/LH/7gy6EBKtfY5BIuNGI7euVGbua1aZPftQ9R6SnPEpwLGzvYy+Q8Sez14pVT0khJRsufnwpGaUrgfS4BWeWTViAPag6s5eqCLby3D/H2zNvIivEDeWJFye9dMF5bYHaMv5y+29AcrXjYEF1dujAeUN9JyY/j/ew1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADXZcLf9FtXIX2tRMjXLefZLKu9rniHrsyD14pK8KRs=;
 b=vRTQPrxuf+qBC1+a2IivQog5w3KVZ9182lU6yUOVltQqGG+zthMQM8cqOdv5Aal0j9NCed9aUJUdCsqtFszrOpgYmVD0FV9f058N3o3XcXW3j29WbbfKTHtl58Vsakce8IlGr7Obeoc3hCePrrgq4t5C5Le6Top4HO/i42b15SAGXDZaE2hjWTYqyB26L8LIF6eF/4Mf348OQZcPfxKyc9gPhoc9KOlbN5xjosk6vMh14QcoiFg3kAORQs8fd9sGRaWSnoMVHrP4ma2gesSnPI2WmkncwSndKL6gtkwdZfLB7l3sTWbHjwBvmvTZkxlyk46dnHC0hXErlKvSOCS0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADXZcLf9FtXIX2tRMjXLefZLKu9rniHrsyD14pK8KRs=;
 b=cGTQOStP9mb3W6ffUz/cXJUxG6P75EguXU97vMpaWbUc866rvF6QScd/6W2fZTIporOaWscaZnMtpIP07wZeM9I59xSVb5fg4i/HXwkDskzyZg5LbvphQeqCkXLsk4DyFUojxSALfqVF3B52BAwunqqeeNBDVzRA4MtnxFb6FpM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ade097f1-af8e-4869-a894-284d8b741d40@amd.com>
Date: Wed, 27 Aug 2025 10:55:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/11] xl: move printf_info prototype to an header
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-2-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-2-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DS4PR12MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7864be-fbb1-4de3-eefd-08dde579b6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUlhcmRiSm5PcGNVdzhkSE1GR3NLT2pESGxBMzF4Mko0VW5UVS9BSFdnMVVw?=
 =?utf-8?B?WUI1MHpSUEQ2bFRrQlJLYjlBbHFzVEFqQkhXeUc5akNUK21LazhIK1ZOSFJ1?=
 =?utf-8?B?WkFhQ094YmFZalc5aTBPZUU0UEZLRGNyQ2tYaldaKy85VDRKQ2pwRjlhb2JP?=
 =?utf-8?B?WGFGTEFnQlMrMGZYemtVTzJqSkQxY2orWWFjS05QcE90Vm5DS3FDRTR5S1hh?=
 =?utf-8?B?TXFUaEN2UFpMV2xoRXVYeDRlYVNJTzJ3UEtHY0JsZm1Tc0hvWHE0VWRTajly?=
 =?utf-8?B?RjJGTmtnbFpyUE5WZzlZdmdueHlxa25KV1RxWisxNUZRL3VDMVEveTdZZGRn?=
 =?utf-8?B?VlFzQU5aenU1RGxZelZsNEFNSUV3akpSbjZhTXBSQ01YQjNDQmlpY1NaY3RK?=
 =?utf-8?B?ZGFoUE1uQ01mOHI0cEhTSVVjaThIaVE4aktuQzlyZ3lnRFlmcXVQZXZscEtK?=
 =?utf-8?B?U2k1L0UyNUZQWVBlNVZGRE9OWFIwbWhaSGpQRUNPckFCalVrTFo0ODR4eW9m?=
 =?utf-8?B?VGRuYlBsdk8vankyaGI1WlNnRDhKSW5EVElIM0ZjVnF6Z2FoZmY0Yk1Dclc4?=
 =?utf-8?B?bW9yTVNiMC9FdWZWT2F4NnIwenlubzhjWGlHYjlaQU5zaEpIcXlOUndnbHQ3?=
 =?utf-8?B?bzkrc3B5T0E1djFHTkJKRC9lc2l6NDN2MHhlbUdlL1VyRDk4MXprVmdlRUxx?=
 =?utf-8?B?UE5VbTI2OStCNXkyalNmakVuY3hiN2M4L3laUWVjNkExdkFYbTl2YVR4Qndo?=
 =?utf-8?B?cjFZTjJJMm9vNURmSEUxYmZZNjFmWDlLVFRLZTRrcjR5anRtMnhCeFlJeWxx?=
 =?utf-8?B?anpMRko3cWNqMTlDTjNXUTgweWc0QWpKZmhHK3dyZkpHK3E4K3MxRkVFMmpO?=
 =?utf-8?B?eFVRN3QyY1ZMa2FnaUp0aTVuajVGbjlDcmdpTW45VFRhWk9QbW5IdzQ2aTVH?=
 =?utf-8?B?ODlkTDcwUzMzUVJTN0dHbE41MjlPNUZDTXhmRDNzNmo3Yk5tSDA3WWpQbUFB?=
 =?utf-8?B?emJLa2psLzZ6ZTlrTXUzWWtLT3VwRXZYZ0NvOW82Wnd0MEhMUGYxNHRrcHhZ?=
 =?utf-8?B?SWZIa3FCVGdlYmxRdXFpNDdEVWIyMi9oZ0hHelJLdjBkaVkyQkMvUk5PMEpm?=
 =?utf-8?B?V0FCY2paZEkyVVNDWTV4SFY4TmMxcnVLRWFCTlpkenhjSFlna0hiYUxGL3BM?=
 =?utf-8?B?blBUOGk4alppbTZ4S1FJb1Y2ckY4RXlNMHp6ak9ENkY1SG9rUTI0cWRyb09X?=
 =?utf-8?B?YXEwa2ovL2lSSUlZZjd2ZzdEMzN3OVg3VzZFVllLdlBmam1LcTlBdG8zVGdF?=
 =?utf-8?B?cllhWEFqVTJjSGlsckd5dFNGL2djN2N3aDBlSlRMME1wZy90bXFzTko3M2h1?=
 =?utf-8?B?QVpZc3dHMys5NVVYUzBTR05jTy9GaWl2cS9leWcvQUg1WU5KaVZ5bnRPY3JS?=
 =?utf-8?B?dy9MQVlVUzVFZmhZS3UvT2doWlBxakVXSStqaFFocWl0RU1vQTdYQmNzREVE?=
 =?utf-8?B?NHdza29ZaDlIejlkR0I0VVhpVGdVRjEwNEw4VUI5clhIRXFpUGtRZlJaZmQv?=
 =?utf-8?B?aFhML0VHZGsxa3JJQ1BlQUh4UUkra2RONm1XL0UrYzNVc0Ywdy9BU1Z0RXd5?=
 =?utf-8?B?UFQ0aEYwbmhLRDVZSWpMSDlINXFWZW9hek95OHd2YjhSSXVtTjdhZFdBVzRJ?=
 =?utf-8?B?cUNaK3BvNXhMcEZ0YTRlQmNFVlBDdVB0dXdtUTh6d2dIYjJKVXRzVW1HYkZE?=
 =?utf-8?B?emJrZ2VJdGovZGU3Z3BMdGZDbk9LZ05KL0thZys1MTIweFgya1NPZWJBcGcr?=
 =?utf-8?B?c2dBZHRubHExaUtOVUJ3dXRiam9OY1NORmR5RTVpU1hHR2MvdnBTYzc0T2Fp?=
 =?utf-8?B?MU1MQ0xBb2pDNWJVbWJYaTlmT2V0dENiMFZOWmw0a3Vmc3BXVEhOQ2tzNEQr?=
 =?utf-8?B?cDlLMnRoL3VCL1ptSE1TNDNyOThmYnJMZ1UyTHEzRlMyekJBZWxiY0dJc0VR?=
 =?utf-8?B?TTUxaU1nb01ZOFkzcE1GNFdUOFovWFkzZVJBem5OUEhTZWdrUEtkaDhwQXZi?=
 =?utf-8?Q?wWkJUb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:55:07.7939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7864be-fbb1-4de3-eefd-08dde579b6e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9633

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> In a single place.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

