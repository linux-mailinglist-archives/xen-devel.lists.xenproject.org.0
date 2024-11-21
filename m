Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28F9D4AF6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841311.1256799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4Wh-00049V-Ls; Thu, 21 Nov 2024 10:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841311.1256799; Thu, 21 Nov 2024 10:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4Wh-000482-Iv; Thu, 21 Nov 2024 10:35:07 +0000
Received: by outflank-mailman (input) for mailman id 841311;
 Thu, 21 Nov 2024 10:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7dD=SQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tE4Wf-00047u-ND
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:35:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43f4f40e-a7f4-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 11:35:02 +0100 (CET)
Received: from MN2PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:c0::35)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 10:34:58 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:208:c0:cafe::6e) by MN2PR05CA0022.outlook.office365.com
 (2603:10b6:208:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 10:34:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 10:34:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 04:34:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 04:34:56 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 04:34:55 -0600
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
X-Inumbo-ID: 43f4f40e-a7f4-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjA5IiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQzZjRmNDBlLWE3ZjQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg1MzAyLjc5NTE3Nywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPMRTSV1EoRy4ib3mwRtmXJJ+n62S4yVl9MyCPajiJwneBJuTHgDIOkjUUMLaPAI8gG+MaJwhqUT+YlHUsoZmsIq9w4MP7v4TScmIVPsfiwxpBWpGE02OEqkh8wj2bNiEDtN07I6FmN8V1I/9AyHymX2/jMGMVCj8SSj7MgPQQ0UKd1qC+E0kpoXATLiGUMjY1e/W7pP50GcpUoCbrf7cG2g9QYmI8bNJ7GWtduyY/kaF+2Va5yc+SoPFTOluqILclcLMWy6jX9XADQOhYmS2tp6TQKdyfqeHHltRgMNz1ivGcVxBwMjrQMmDbyEf1CXbqsfzKnzVZ5+Cv6ElrVc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nyye7zCAIduZ2SNXx/CiL7pvut+dZo7ljCt3hKJ/hHA=;
 b=YrQHhoNHEGwF9lEzvfV+9EeQp2N6WACKZOWhvkx+9ZstBdwhT3Iqmh0UPjTT/RNOoQTNUoiO/3O8tDajcdlyS9n3g1qpguzDXtSb2XFVdFduYmLUbOtplmTbRjBfOT9IRtJWvOBnyXMHDwGxm3lp20viCVoM9jm05VS18KB7sEsHRjSJcTGbTXb+nWFzLAZjMla3B+5zI0QIpOfKxVAvfCCUEIKB4ce+tIwF7sJmAiLpKVtO5/Thz0YE9sZEOyqanNvmFKCM0X/UG9iXoFqnBbv4BpRddIsxoFRC8or5h0TcZe/n9llCIPzFDFWu8T5gexRtLjDGMBVnws6ZeuVXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=amazon.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nyye7zCAIduZ2SNXx/CiL7pvut+dZo7ljCt3hKJ/hHA=;
 b=QiKj0+8POAjaHig3ZTY7AsgzSQirZZ1ZOQAzBgE/7vaaz4nIok3UGkF7L71Xzy024mXUZJBxmOKlpAaS0W1j+f5ASK0Ie5Q8ROzjIzrm7hr4cDGwSAL2iuevg7AxkjvfoM1xQVecBK1vLRPiDNEC2ceRljxD2o91o8nxdpa8xo0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <def0e1b7-69a3-4158-a8f8-cb5de82b83bc@amd.com>
Date: Thu, 21 Nov 2024 11:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 12/15] xen/arm32: mm: Rename 'first' to 'root' in
 init_secondary_pagetables()
To: Elias El Yandouzi <eliasely@amazon.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-13-eliasely@amazon.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241111131148.52568-13-eliasely@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a57a13-78ca-459b-6995-08dd0a182543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEh6c1QvTW0xVHVEMzdIUjhhNDFZcG1hUEg1eUdwYXhTVjdPQjgzbFdoZnEv?=
 =?utf-8?B?SFdwVzZRWTYvdHBLUEx6Vk14T2FvUVo5Z0REazZ4Y3lpSFBnZyt5VmNOSnhx?=
 =?utf-8?B?VjBUdjJPa1JoT3l1d1FnaTlrNkZJTXltM0t2dVJsYUpUVCsxVmIwV3FRdXZJ?=
 =?utf-8?B?LzlCdG1YYUI5OUcwSTlFK1FvczdnV3RIV2NLbTNpcHdKMmpjeWowSmluYlNV?=
 =?utf-8?B?Y3VuTHpaN0cyL045NGhPSHpmVzRJMks0dG84czVEMFdzWFVjanIvbXQxWDRo?=
 =?utf-8?B?ZGlZZG9yQ2FKSG5DQVNyMDJId09uN0JWbnBwN2VtSXQrK0d5b0huZkNjbFZj?=
 =?utf-8?B?YWpXVmxLbFBoMHd0N1RJWktRdTRRamVVRVk0UlJZMEVpSm1ZTURuWkVMRkVL?=
 =?utf-8?B?N1I5WVZCbDRPbHprZHpSOUZPU3FtQitnekRpRVIreFdvUUowME5vSnBPOU03?=
 =?utf-8?B?QmZFcFpHYUhQWUtoUEMvNGRST0JkRkIyV0g1WklINVVEcEd0TVMyWG9mam5a?=
 =?utf-8?B?VjRnYVFOYVpsRktRY1huL2ZQeUlaSGthTjJqbDRUOFZkZ0h0Yk1rbEdSdjlO?=
 =?utf-8?B?VGR5NWZDV2x3UFRLL1lFRlo2UnU3S2pBZFFlaDFWc2NmSDNVZ3Z5UEd1bDlR?=
 =?utf-8?B?TjBPWDNma1dQVG5kaWNNSkwrb2VXT0pjZXR4VXo2MzgyRzRiMk45bUt3Rlc4?=
 =?utf-8?B?T2hnWVFxTXlmaUJ0R2JoSStpYVBJbzVDcEZCK2N6SXJrT0FVdVJwUlhJZkRi?=
 =?utf-8?B?UWRUaFhXcmFBSXFuK1MvVXRiMjh2ZmRac1c1TVpGWU1jaWgwOHhxR3VnMzJr?=
 =?utf-8?B?K2h0VmpDZWdzek9GRGhLV1BrbjNGQi9vdVM3czd3aVRoeDZlNWhzT2dEUTNv?=
 =?utf-8?B?RzJKOTV1NjlOK0hZbERGZ3VHSTF2b25HY2c3MnM5b1JyOUZDbTRqZDlKQjhI?=
 =?utf-8?B?SkFQZ1BSR01qeVpNcnV0a05BZHUxVXZhekNHMlFzTGFreUROeldESWZ3QTNC?=
 =?utf-8?B?eFdTYTYwY3BrU1ZIOHRhK3dUVVJubDRLZmZvMXhGWW4wcXJpV3FzYXU0Nmxw?=
 =?utf-8?B?dGwxYWRxcCt4ZExCSlhaN0tYdXk1YWtnem01a1VzckNLNHJpd3BJc2NINGtS?=
 =?utf-8?B?L1QxcGErZXdDWTBWY1lndUY3d2ZRbEQ3V3BJTDZrNHk5QS9yTEZWZzRyODdv?=
 =?utf-8?B?dkxjblZ1dU05Y3F5UWlvSjdNWjlCdVArTXRuRUJSRnpGbklMc2ZROXVyMlFT?=
 =?utf-8?B?K3B6RFhBczIvSFZqYXBWQWlUbU9PWnhQTkRjVFRBbXpZeGsweDh0NWQ1UXNR?=
 =?utf-8?B?Tkpla1I0cnNaWWJBV1FRa0tuOWxDQjJ2TVJjcUZSOWk0YStLME5mWlR4VUZo?=
 =?utf-8?B?YUFjWXdDb1JiWlEyVlgwNTZQemtIWlRHcy8waUFpSU5qMWxvdGN1SU1hUnRt?=
 =?utf-8?B?ZVJmSG1iWjR3YjR0SXlIQ3V2d2p5NnB2UmRTUFBVK0xtT1hmclJEalFFR2Fh?=
 =?utf-8?B?N25CV1diMlF2YzRuVlQ4NTQvdHBwRUU1aHNMTmxkc1hkbXZHbFdla2Q1TFlQ?=
 =?utf-8?B?aFBXSTZhTDF0bTlIQysxN3owWEFKV1ZSczliaFFYcU1CRW85Qmg3bWV1UTB4?=
 =?utf-8?B?OEdicDJYVCtwZS9MVHpMYVZCZGlpMEJwMlZuakgxa3dVRkNxNC9ob0dqRTZ2?=
 =?utf-8?B?anRIZEVDRUE2d202TCsvYWx5TzdCMktuVU1rdXJtWHl1NGgyYlZ0NDRvbnFE?=
 =?utf-8?B?ZE9DVzBIeFVjUkJKSmNMdi9tcmwrQUxUb2RpL0FlT2JZSWh2TzNTNG5WU1pG?=
 =?utf-8?B?R2JLN2JsOUdEV0ZnbXBmRmgzcHlWVFpkSHU2U0VCT2hBOC9HZ0tLTWVpSTRD?=
 =?utf-8?B?VlMxRHBoR0s4VWRyOFpJWDA4MHRGaGw4L0dVNG5LeVltOHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:34:57.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a57a13-78ca-459b-6995-08dd0a182543
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976



On 11/11/2024 14:11, Elias El Yandouzi wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The arm32 version of init_secondary_pagetables() will soon be re-used
> for arm64 as well where the root table starts at level 0 rather than level 1.
> 
> So rename 'first' to 'root'.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
NIT: 3 dashes instead of 4. Otherwise this will end up in a commit msg.

This patch can be merged right away as it's not dependent on other patches.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

