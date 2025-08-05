Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6250B1B77D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070659.1434293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJdF-0007ue-Ng; Tue, 05 Aug 2025 15:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070659.1434293; Tue, 05 Aug 2025 15:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJdF-0007tD-KI; Tue, 05 Aug 2025 15:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1070659;
 Tue, 05 Aug 2025 15:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjfC=2R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujJdD-0007r9-KB
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:31:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2415::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35222c54-7211-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:31:10 +0200 (CEST)
Received: from BN0PR04CA0187.namprd04.prod.outlook.com (2603:10b6:408:e9::12)
 by BN7PPF0D2C72F0D.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 5 Aug
 2025 15:31:04 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::67) by BN0PR04CA0187.outlook.office365.com
 (2603:10b6:408:e9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 15:31:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 15:31:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 10:31:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 10:31:01 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 10:31:01 -0500
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
X-Inumbo-ID: 35222c54-7211-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5nhKKia2GpQfRbCrQr2QbXVkzY7pHsC7NYHCTIMBw6nQOkxXZv8FO4Kxa55d56qyteZNSByv7iEBh5NapqxjKcB9/RLbEprOUAOJyZC3vAWxJYuGKpIrQ1lgmTpl5hn3qZVDbVZxn+Um9jrER70EqWjJqOyWv6QmnQNKad/GhvatYu++ZDZA56S00br9Lt992ou4AlIK2PwcWeONJscmccmxwEvjPYavrmIAaYCIudgvENfUua8mLiX9rGt7X9zWRgJPnYEfSPjNb71rMTFWiex9xpbcemrMMqaPkX3zbdnaEZFvFwGySSoYD0R6QwgZWlneYaOMsS46kk9Vz43Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFEV+eaLF0XRM9fi1aEPR912nYi2HAOu0w8fh8HAiWo=;
 b=nK/uE3JNurqI1vhe5I/lm5R1NkEpGWwo3r1Si31+jdTj+bkNZ8TltAxLx3yietQaYAgp4jNJak8PaT/SVECANWllT7gs8WsVGl7WVjzUpDDD2PASKCgYLR31hI9vUbp6uA/BGUOZx9M/NK1BnUx6HPqMN2dT98GcDolUnTlq6sKxRP5XOHADq8YHNk41PK1fs5kUuneiw+CnAGhENqEEooJaCBlEp9GqsCZqNqfoUsnysjxQ7iTpbxshxe1+3ScPCAKPR4FPYTlgIgKNSueenyjyeCkMWtfpa9hPfxiKsrDeYl+ui+ro+zd8GmPnldm6kkaST3UN+7a3NcmAekF7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFEV+eaLF0XRM9fi1aEPR912nYi2HAOu0w8fh8HAiWo=;
 b=d/y5mSH1bhXuawJPPufs2bhAb7JPTw/mx1b9Kab9+wFJ3x5qL00nlSUT1CXiCCtvpM5ykTcQDRqbyjj3Jj183IdiGX2UZuV7klQBL6kpm18bFjrw6mn/aQQm+AmizaCIYh87ziY4H25NQl46FUjG4sL68oykAwzSqTd967dz894=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b98abcdb-38ba-4176-8d6a-d4bc234b37ca@amd.com>
Date: Tue, 5 Aug 2025 11:30:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: polish hvm_asid_init() a little
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|BN7PPF0D2C72F0D:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf19268-9360-47b3-413e-08ddd43516f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHN1U0lGSmZhall3ckNGN2NjY3VWa1JuM3NKWmhHVVBadlFzY3pIbVg1dVVV?=
 =?utf-8?B?ZzRZZmJQY0dtK2pNSmo5QXdKVm40eEo5bVAzazN0aHA0aW80MkVEUWk1Z0ZI?=
 =?utf-8?B?NjNpcU40aGtqRkRpcW5LUVFNL0ZkSTlmcFhhM0hFTkp2Q0d4QitjRUdEaGdH?=
 =?utf-8?B?ZElQcVlTR3JuZE80ZDE4b3VDUkY5VFEwbVF1VUZlSXpJQXF3L214WThOVFRh?=
 =?utf-8?B?UVRVWkZHSEFoOEhqb3U5VTUzYWhtZU45QW0rR21JK3dpdkVUMk5VRGw3NXdm?=
 =?utf-8?B?emM0a014SW41M3pueVd0SGZXMEsvYjBmVjlUWTVaU3BqaDl1b0ZwMTUwZkFx?=
 =?utf-8?B?R0JiRHBaakNUYUhlVXAvQ0s2RXJVek5CQW5ob0JuNjcyNHVpWDVOS1hlS083?=
 =?utf-8?B?d2VqOCsrWS9DbHVVVkhQZXBiMmlmaUwxajRTamsvTzJxU1N3a210NWFwaERn?=
 =?utf-8?B?S3NWdVJKdE9tS3RTZktkQnp1NTF5WUgyWkgxaVB4aXlraXFNS3loZFcrVzlF?=
 =?utf-8?B?OEhOdzFRUXdpYTg5WGZQTGFZTlQ4bitvbURXM056YU5taHB2OFMyakhaYVdI?=
 =?utf-8?B?SUU4UE1QR3ZBSndNRlRHVVp2ajB6ZUQvcGNPZzduVGpvNDNPaFFlc1UvTGU4?=
 =?utf-8?B?T0pJVmp0SFo0eEJUa1laUUxjejRIQ1Y1SnozT1ZjL28rcmRiMktXR3o0bmlJ?=
 =?utf-8?B?dDRyTEkvT05wTDdFWlJHbXFLUVJYNWpoYjhWK0E5R09UMVZHbHFjazQzU2Z4?=
 =?utf-8?B?Y3RDbm5aM0toZE5ZcUFJV0JtMTZYSUdnRG82WGozOFI2cFkrUmsvdENGNDkr?=
 =?utf-8?B?NEFqdkZKOGY1SkxXQ1VJNjNOUzY2MlpjdFp4NUprclg5YW5hSmYrNTd0Rmpi?=
 =?utf-8?B?b2VETmxOR25pVTNWVkVieFVGUlFQMUJOTGpOeEt3Q3pEYVBjT1crOHJLbHJa?=
 =?utf-8?B?MXVPN1kzdERxV2ExVmd0UUZNY09lVitMRUI1b1ZqQ3NPSmF4MUh5L1htSUpK?=
 =?utf-8?B?M1JlK3BEMXdxTDFVemtycDN1M2d6V21QczZRcTNQYlJnWFZCamxZNVdPQmZK?=
 =?utf-8?B?MlFJaEJuYjJabzFrZ05VZUpsMWJQdk1KL0NJUDd6YlBxVTRSOHRpeDk5cDd1?=
 =?utf-8?B?Mml5a3hubVhyK1JubDNQdmU2anFnUUFsaDFDRnlpanRQeE81VTd3UHJtYUJk?=
 =?utf-8?B?YzVoTFB4Um9ka2hNOHlHNSt6M3JGaHlaSnpJM1FLTE9ZZzREaVIvUXZ2WUw2?=
 =?utf-8?B?ZFRLd0dMQ0pDMDRUN0NkaWw0U1JlTVZvaldqTStrMkIreUZ5aXhmYk1uOEhl?=
 =?utf-8?B?cTdvNEY0bmdLY04vVi9hWkFWdVkwSVFEck1HODN3L1hvQm56K2Y2eUdBVGRT?=
 =?utf-8?B?d29yV0lLY2tqOGJCMVkyRStGRjROK0ZDV1VxeTlNWGIwQ1plL0lYZDc1NUh1?=
 =?utf-8?B?UUg1bTBLSktJYnp1WElLZnQvVDNwNlJjd0FjN1lPaDF1cm04UkorOXgva1R0?=
 =?utf-8?B?d3hnbkJaNko2TG94L0tram9GZHJBYmpiNmxMQ0FyZHIwcTZVK1kxMGhnUnk2?=
 =?utf-8?B?dlV0MkdEK21sKzhrcEJ4cWN6aktjc0ZyanJhUWlLS2dIUTlXdEhVOCtYV0tO?=
 =?utf-8?B?Y0VUUURkQld2RjV3TGYrRFdvUkU4ZnpNS2NrVmNZSDRiaWF0YyswUjQwTFV1?=
 =?utf-8?B?QmF4bzFGRW91RWlNZzZEckR3OUNZOS9lV1dnd3NhLzZlNlk0cWdJcDVseXk4?=
 =?utf-8?B?dWtMRnVoVExDSXhici9QSEYwN2Z1N25hYjJSclFDRmZnM3g2TjJ6N3FPeDZS?=
 =?utf-8?B?V21tNisvVnZBQlNGWHh0TDlFTDVENEp5MDFYWWNlOWNMcGhiRDFwUVVqZ0tu?=
 =?utf-8?B?b2FhWjNVcVJUYlBUdm9jaHJXSi9qSUN0Z2ZVa1J6L29uM0drTVVXSHRoMnRm?=
 =?utf-8?B?Vi84OGx6U0R4M1JycUtmYTlyWW1BWGNnSy9QdEJEajIwMmoyT0dMNWI2Z3pU?=
 =?utf-8?B?NGdwbDN2MXVIWFg1WjZCZitHemcrOFp4U0Yrbnl1ZUhXZWpIZWt2QXluN1Ir?=
 =?utf-8?Q?Mec7Iw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:31:03.9422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf19268-9360-47b3-413e-08ddd43516f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D2C72F0D

On 2025-08-04 11:41, Jan Beulich wrote:
> While the logic there covers asymmetric cases, the resulting log
> messages would likely raise more confusion than clarify anything. Split
> the BSP action from the AP one, indicating the odd CPU in the AP log
> message, thus avoiding the impression that global state would have
> changed.
> 
> While there also
> - move g_disabled into .data.ro_after_init; only the BSP will ever write
>    to it,
> - make the function's parameter unsigned; no negative values may be
>    passed in. Also reflect this in svm_asid_init().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

