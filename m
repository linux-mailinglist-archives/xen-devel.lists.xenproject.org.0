Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CECB39C33
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098585.1452595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbPB-0007B5-AJ; Thu, 28 Aug 2025 12:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098585.1452595; Thu, 28 Aug 2025 12:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbPB-00079a-73; Thu, 28 Aug 2025 12:07:01 +0000
Received: by outflank-mailman (input) for mailman id 1098585;
 Thu, 28 Aug 2025 12:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urbP8-00079T-T5
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:06:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2413::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d03e0f3-8407-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:06:57 +0200 (CEST)
Received: from MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::34)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 12:06:45 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:8b:cafe::43) by MW4P221CA0029.outlook.office365.com
 (2603:10b6:303:8b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Thu,
 28 Aug 2025 12:06:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.0 via Frontend Transport; Thu, 28 Aug 2025 12:06:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 07:06:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 05:06:44 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 07:06:43 -0500
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
X-Inumbo-ID: 7d03e0f3-8407-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwq6WgU26K3xP3DbHKRUKbtzm5BzoaBUYK6rKxVJITZ82nRa/qHdPX5h1exOJw43s73ICoDd6D67ATmipT4nuutQ0mnP9HlHJp7Mr9FbZwKvtM7OttHgDrHMW/dowT0Ll71oBALlfIynq7HFc8tnacd9BR4Vg1bIVcZVC7jeT7X/g3pcf/ilCgf5S/kKfrWzebzcmXSFHDZEaEWgqP53aprcOHhxHltD04SiyURPLZU/8SLIfJvfitf7ON+uZ2ThCmyyB+ZQpUZx0yO4hF0iN6fF6PiVLsG3WK9Wv2BUdTRZix494JWcheZq0UxifMnSbdsvVInsi7eYGL6YbGF70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6uk79BzOFG6ztMhZHyXNzM3hDEv7cxKeUVQLzfQR8o=;
 b=CwGRzZhDCXcwA4Z3Ovx8bKfBbaYRwDTK/ylrX1JxO0g3GxHyt07wYa7pjBZOf/MDfTMz8uAhBvdcPoRw+FC4SxhdD2NPZHpNOifBb4RxGu/tjK3YDRti+sfWPCLG0AY1nGPvew/ua8A+9ORYmk4tE/gqMWnBw70GBvDNrOsdUrwDu63ReKwX2ntdl7a46l7b0PrxiIomWL98jA5MaSUo6fZ20/Yug/AGlA+gbKq0szo7WvhciWc4hKszRupyv5r6z5YWaTgdgazQ0ZviXiUGa1Wy/jnysjOSwYkyhaiZK3BoM2xb0nr2osCFT6vCxW5ptNoizdSJwZ4zdAXhDWw5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6uk79BzOFG6ztMhZHyXNzM3hDEv7cxKeUVQLzfQR8o=;
 b=NTtZy2xX2FDoLCXwBCRwPv/hUNnGAtdarY6D8DauLzlPUTnlxt97elX7jsOD7Yuti0w3RdGQRl9ptzIi0WoB6UfTuG2gNq7i3H06BBkxAx26bPSUudErCmpZmC/otEMKi1/v6AAaXNp2WklKSy1L/7hiWmkCP0ecbP33A0BAVDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d9ff0746-2198-4b08-ad02-a616360c83e1@amd.com>
Date: Thu, 28 Aug 2025 14:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm/mpu: Implement ioremap_attr for MPU
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <53c6aa61bc0cefce369ffc3a9ff5a7060b5f4b20.1756379422.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <53c6aa61bc0cefce369ffc3a9ff5a7060b5f4b20.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c0a247-beed-4a8d-f0f9-08dde62b5bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bksvM0dPNzZTbFZRRXEvQWxIRHBSaURUREh3cjd5b3h0OERpUmpEWElIa3NZ?=
 =?utf-8?B?MWdaT2VFM3ovSUtYWkNwTXdhL0ZCRmdzVDA0dkRqM3Y2SjZ5RmRmcG5ROTRU?=
 =?utf-8?B?UHB6UkRaQTAvWGtna09EZnVvYUo3Z000L2xGWmtCRk53c3hhRTBXcUxyUDJi?=
 =?utf-8?B?VGlPcWRYZ3VRWlk5VGJ0eFF2cHFsR0dnMWtndzk0WGcybFlSR0lnNGVLRHZs?=
 =?utf-8?B?YmQxZlFwMThKbEowUkw4RjUrZGIxWDd2YXg1SVQ1TDIramRxV1VRY29sejFJ?=
 =?utf-8?B?ZkpibCtsMm80ZGU2c3hhb2ZlRVVDaUlMOGJZVjlycFV1a0ZMYVcxVHJ2SVdN?=
 =?utf-8?B?dXJRcHRwb2JWdTltOERoVVpSZjREQ0Q4NW5XTGVWSHRaeisyd0JscGhTdTVp?=
 =?utf-8?B?Q1ZvQ0RMcEVjd2JhZmVqWHpXYXhmbUxRdnl2cys2STJlNGozZmNXSE4vRnNC?=
 =?utf-8?B?Ny80Z2YwSXN1MFFOYTF0STR2cHgrUWlWeHgzMlRjcEErenNOTVB5L25SeUJM?=
 =?utf-8?B?WFUvdFRQSEJnV0x5OCtaSEFORmcyTi96c040Wkh2akZIUTJnMHpGTmFNOU1Q?=
 =?utf-8?B?QzgwSERmUlZYazZON2ZvVE1GQkt4TlRuNHI1T3hKRnVSZEY5OGl6ZVlpcThJ?=
 =?utf-8?B?aVArNmhLcURxRkpzeURpMkZhTi9ZRW02U1ZNZDk2a0RnVXdFakV5RytrOW96?=
 =?utf-8?B?UXJpRjRxTFpFaXQrYjduUUhQWFI4YXIzWE5GejN4WEhCKzZnemNlaVdRdWZD?=
 =?utf-8?B?WVhXNUtLN2lPMG9PZXZCTW1GcVNrbUpoZTNxcFQrOGFGbyszN05rSnhRQk52?=
 =?utf-8?B?SXJZNGFxU1ZVeXRqV3BXWDVuOC9NbElsNndORWx5Q25kOGtBb0I4OFlTUER4?=
 =?utf-8?B?M29qbDJHMDNLWWNkbHp2WkRvL0VpSE1ZVjFzSnpuSEtpdEJMZW8vVXpET0Q4?=
 =?utf-8?B?Tmt5aHFiSXhMOVl0cHpjcGFuazhWMWIzU0o0bGhqamlkcjc3ZkNPWHBIN1JO?=
 =?utf-8?B?djB3MjlyNmY5VWJQU2MvTVNZYmtRVjZiZ2UxWFFHV0xwSlY5NDYvaHdPVXFW?=
 =?utf-8?B?K0pWRmQ0ZFVrV21RRmlqc1dFd01ybDNsS3dDQmVKTXJ6enFVUzJPMmpScUZL?=
 =?utf-8?B?RW9SRUZZRnpuTWpDR0pDWTZoVnRnOUV1eGV4ZkZZRGFZT25MamlpSlNVbG00?=
 =?utf-8?B?aGlXYnpFZHhiZWR6Z3pMSlN6OS9oZ3grNnZlK0grbkhHY04ydUFSWUFEN2hT?=
 =?utf-8?B?TVNweVFoSjBncG5rdGVKcWo2a3p6ZWN2cUNkdUZVNWdZYWZXMFZvbnFSY1dT?=
 =?utf-8?B?M3RTQWVtWEswc2RLMlJSMFdqY05UZ0YyUklVdmRKY3E0Wlh5aUxGK0R4ZE4x?=
 =?utf-8?B?N2h1ZWszc0U2T3Q3V0dGL29YNEZlRnB1MDRqUzN3MkxXN0g1aGNQV090dnRY?=
 =?utf-8?B?azh6RzNrd3hsbGdSS0piOEFKVjJxNEsybnZ3dXZwdGQ3TklOOW5GbVpIQ0hR?=
 =?utf-8?B?TUFvZDJ3VXAwM09xbENSTll0d1djTFI4K2FUV0lBSVlFbkxNaDlMc1AzREJP?=
 =?utf-8?B?bVZEYWZaUUhJSnl1U2lBZUU5THlMbWd0Q1M5aFMyUDNRS05iQ25GVVdXZExI?=
 =?utf-8?B?eUg1VGJRSngxUnUvZWdpUm11dGFTOGp1Um5FYXFpZkpGTFY4cU4ycFRKQXlL?=
 =?utf-8?B?dEZxQXRJQUkzSHNNWXdwRjdkcHpCWEo1Z1lFL3VuUWJibjdYMFBYNytZVDlm?=
 =?utf-8?B?akhMSm1pZlEvLzVCaFc3NEtVM2FyVWVDaXk4YitZazBRS3F2NnJEcXhjOHRD?=
 =?utf-8?B?NWlHL0hyczdJVlZnQXc5UFBrbTR6SS93WEIyUVFzM2dIYlZZcTZNVjZHRFNp?=
 =?utf-8?B?QUR6Syt6Ykx3MWRDazR3ektEMW1EbXdCQ2dDMHlrNmlkSFQyWm1QN3A2UlYw?=
 =?utf-8?B?WkhkTE9mWnRHZlB2R1hsTURteHNGUW02N3Izb2h0a2hPVUhnY2ZxWWZvMHE1?=
 =?utf-8?B?UlVNK0pFRUNsN3F0bWh3cHJaY09lbEphWUJYUGZaTHNSOVFZZmdaTjZYcU9S?=
 =?utf-8?Q?gxmsIm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:06:45.2428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c0a247-beed-4a8d-f0f9-08dde62b5bbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316



On 28/08/2025 13:12, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Introduce helpers (un)map_mm_range() in order to allow the transient
> mapping of a range of memory, and use these to implement the function
> `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


