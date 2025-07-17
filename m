Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDACB09674
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 23:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047542.1418000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWNW-0002Xt-Cs; Thu, 17 Jul 2025 21:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047542.1418000; Thu, 17 Jul 2025 21:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWNW-0002Um-9Z; Thu, 17 Jul 2025 21:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1047542;
 Thu, 17 Jul 2025 21:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucWNV-0002Ug-B0
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 21:42:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:240a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb0c333-6356-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 23:42:52 +0200 (CEST)
Received: from BL1PR13CA0153.namprd13.prod.outlook.com (2603:10b6:208:2bd::8)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 21:42:45 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::77) by BL1PR13CA0153.outlook.office365.com
 (2603:10b6:208:2bd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Thu,
 17 Jul 2025 21:42:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 21:42:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 16:42:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 16:42:43 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 16:42:43 -0500
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
X-Inumbo-ID: fcb0c333-6356-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1C7Nw334TJlvNeVC7k2n70ga9SHvyKNK6OkzoE4BPVS3fuN5hlLj6wkpae27wwajf8MnHUuZoKk8tDDYZLymba5Cb3p6Mb/I+uQHaivIg3InB2ppHq3+nigiKFpN0YNDCyqAGrvNPnoLMBgqHJHoRlc6G3VO3bg3bedS3QaeuqT8llnYAHmdCeBPdeK7hgz3RD9FY5cHTuqc5soi6sla69Cks8+JHOn7ZFPITcBFiPuameqXToLD4zx2KPmp9fFHEueW6O0Vt7y3COfVCAMOoOKl11SWjwCRtkQCZxS+8EdPvy5EztTuPcELRJ/v+ZL2+Kt0aqf18fS89JSNr1cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZmJtOe7PzEq+BDcITPgNiT00pmrSbzlJO/GCKKeqzk=;
 b=F5QSh9JCIkvB+k5iu2EykOixwuJec/LuRKQNDoaW0jv+xltiYdMsm3fRcEUeYQLCWW0dyIfu2WBfOlHV+yTbu+hFWhXhbQSpkj9yEwUr+NP474NXF9PdLf0Z0XIyL+6/NYyDptzoZqVJ3iDeqqPXemgBY5XL2RC8Tqeqs9PA4YHEfXn1PSt+DGL+V4VhKU9dzkRpANan7eiZxZaf0JoZ+gsa5PVVpvcgSt3f09UEzgG1/7E/CxqPiFk5da+X9YvLpdAauGpQZgzV2O1FILsTXxIR6B5JsrQRmXkvrdS5Ogk/LpM73D3u/XsA1EeMxcWvEXClvXYtZwvY39t0FmW/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZmJtOe7PzEq+BDcITPgNiT00pmrSbzlJO/GCKKeqzk=;
 b=YUVvhFhKPNNmeE2VEM62mI7Ja/e5/fpViZnbRx5GUZx4C+eBnDqP4Y+6Yn2ugIovzQS8eSJO4KG6WIIOFDMFWPL53pwnMaKUGpIjMLxapphrjG6E/Zq89BGsWp6qZquFP1Ls3TEsyLAnwuHQKjWgLfNWessmamfE8RTKyPu6C+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <06280914-1441-4e8e-a446-3d81c50a8933@amd.com>
Date: Thu, 17 Jul 2025 17:42:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm: Remove alloc_dom0_vcpu0()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-2-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250717175128.462996-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fecebca-368d-4b92-99c8-08ddc57add2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXR3aEdpK1VRZWNxbmh1UFBiaXZIT2N5aEt1NTQvZWV4TVZwVCtNRHFaZ3NT?=
 =?utf-8?B?enVjcnVhWUsyQ1RwbkRVQ2hsYThISGlMb0U1bU45T21OcGd2eU8vQVpzV2l6?=
 =?utf-8?B?cVBReE52WFJIWUV1RjhERWlPK3B5UHpHbTQySnlxWk4yMXAwQWhZL3lxb1U4?=
 =?utf-8?B?UkE0a1p4V0UxUXgweXlzbktlYmNoSEhraXJQazViZUVvOVdIMmF1U0dWSGFz?=
 =?utf-8?B?ckhwaTNVSXlmaU5tMXJyNlcweDQ2WlhFakdDazNNa1B5QlRUK1hPVTJ5Uzk2?=
 =?utf-8?B?TktPN2NTOHp1cnI1WDRabDlLaGhjbGJ5TGtYbDk4b3hlVE1sQXZJQmdxTkty?=
 =?utf-8?B?SEc3aXQyVVAvMVZSa0pqSzZad1FmdE1acy8vcng1Wm9VemdWNTJ5SDZmWXJq?=
 =?utf-8?B?eFE4c0VDanNBeHpWOU5SY0ZHOG9YRUNjM3d3NUVVeEt0bDJCcHkwWDVxNmhW?=
 =?utf-8?B?aFRUTXFNWlQydzVENkhzalZXZ1VhVUxnY3JLdFFXMlVvVTR6ZHYzckZtWHAz?=
 =?utf-8?B?eDdVNis1MUlDa2x1S2lQWEhCWUlYaEZTRnJNc1g1Q2NOOXEzYjJGa29DM1JR?=
 =?utf-8?B?dkgrWUNuWUVUYWk3Zk5NTVVjTlV3UjRjWHByOGhzQzJrMmY5eEVlenJsbkdz?=
 =?utf-8?B?K3lGYk5pc21uQWlYSFdJZHFyN3lNUzVNTVJ3dU1leEdoV0twbldNbFFhYytN?=
 =?utf-8?B?K3pWUlhmTzlyM1FrTmhuL01INjlkc0xYaGhzRXFKY29JdTVuZCtxc1pxTWJI?=
 =?utf-8?B?UFhNeTNzZUxjNzdCdEIyYVgxVG8vV2diMVc5MXJMbnRYRFNDOTFaYWNxMUln?=
 =?utf-8?B?RkNraEZDcTNWNnp5cTF6b0VwRE1JMjc4R0xYRFhOR3JMcVpyaVd6TWxDd1VB?=
 =?utf-8?B?V1NhWDNMd1NUSkdhUFp0bVhzek5LcGxleDBBTUN1R3djSHZwRnpoYXYybHpV?=
 =?utf-8?B?REhBNGVkZWlDN254TVdJK2o3WDZidGJZZDJKRnVrS0trSHYreEUySEpKcDNI?=
 =?utf-8?B?bUdJWXVGZVBFVDBoZzRzS3k5YW5DUi9MZ1hjVzFmNmVSTHR3L3FKcTBFV1Ur?=
 =?utf-8?B?enFweWtLWTAwdDV6TFNVQngwYmhvanhHV0h1ZWVPajVSd2YyTUNFNEZJUUZw?=
 =?utf-8?B?dnMyZ1l6c00zb1N1UVhZOFIyN0FwdlNRa2ZCMHlONk5KR0lmZFM5bFphYnBO?=
 =?utf-8?B?NHBObFBlOURkV003aHJmV2JycXk2aGcwblVLOUVkYUZ5NENwV0J4ZGx6WGtJ?=
 =?utf-8?B?MWlvV2JWZHYySmxVRjdxRCtpTEptKzhQYXd3TlZVN3U4NkVWQ0J0M2h4TDYz?=
 =?utf-8?B?WFRhcndndXlqQ1VGQUwwcDgzVmQzL1dxRnRCVmZGaEpqY0lkUWdHZDR6WllW?=
 =?utf-8?B?Mkp6bkJDdW9Ta2xKdEVJSGE4UVhLMjdSaXkwaHZ6Ym8yZlY2TjhFVHhQUmxF?=
 =?utf-8?B?OWpHd0Y3MXE4OWZGdmJpNUwxMitqVWhjaG5KYXQ4ZVBEV1I5QmpUMDErMXZH?=
 =?utf-8?B?NktjaWVndkZVNTlGOWV0cHJnZjVhckxUelYwamFlNGxFWWFLV3JyMzJrbFRw?=
 =?utf-8?B?UlhkVnV0RTY4clBETDdCbVVsdTVNRHhBQzFGalFFSXdCNHdqR1JaN3FUWXlI?=
 =?utf-8?B?ZE9uUVhXdE91QXlZaW00Wm9FQXIybTlLSVN6RnlIMFRidCsxVEFLYmNNOGZr?=
 =?utf-8?B?YTJwM2pIUE5aRUJzVFFpRGdPay80WXI2dzJQcVZDS3U2MHpLdTcrRjhnNHd4?=
 =?utf-8?B?b3Q3VDVXRXdpczNpOTZpQjJ0VzBFTnBjbDA0d3daN2J2b1J2K1piU3dCNXBw?=
 =?utf-8?B?bm5FMEF4Tlk1Nml1L2MvQWZNcEdQOHhROXVhOHF1ZXZkNnN3TTBvZ1cxTmtw?=
 =?utf-8?B?bWJNTjVoSUY3anhWM1NCM3JUS2tSVFJyUHFEd3NBNk1pY3Njdm4yLy9BVEJK?=
 =?utf-8?B?M0s3cWNlejNoRFR4d2UyWkZYdlYvbVYvRjdhVW9oRmNQTVlCZ2llMktSeUh2?=
 =?utf-8?B?WjNEZjdwbG51UGE5QUU0cHRTb0xCa09sYU1kbVp4b3lmYXZUMVBQQmo3ZnJP?=
 =?utf-8?Q?nCuCKM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 21:42:44.3499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fecebca-368d-4b92-99c8-08ddc57add2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

On 2025-07-17 13:51, Alejandro Vallejo wrote:
> It's a straight vcpu_create(), so the alloc_dom0_vcpu0() call is
> irrelevant.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

