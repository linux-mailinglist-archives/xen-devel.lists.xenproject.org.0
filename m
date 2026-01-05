Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2118CF5A2D
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 22:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195746.1513664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrxN-0002cs-37; Mon, 05 Jan 2026 21:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195746.1513664; Mon, 05 Jan 2026 21:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrxM-0002aT-Vg; Mon, 05 Jan 2026 21:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1195746;
 Mon, 05 Jan 2026 21:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DVIN=7K=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vcrxL-0002aN-Fl
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 21:17:39 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f507e72d-ea7b-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 22:17:36 +0100 (CET)
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by BN3PR12MB9594.namprd12.prod.outlook.com (2603:10b6:408:2cb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 21:17:27 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::5f) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 21:17:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 21:17:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 5 Jan
 2026 15:17:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Jan
 2026 15:17:25 -0600
Received: from [172.27.233.189] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 5 Jan 2026 15:17:24 -0600
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
X-Inumbo-ID: f507e72d-ea7b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dht+kQKcb8WyXN6WjamMrjBxyq2FTfARHhbGZMmN24u6ARYXtzxbkNMFg3fS7DDPvaA9qbabf/NOwWyKGtAyPOX338YCo14i4ppcEItKP7stjv/3tZvA+yExOWLCrMgrP6PoPSKY0abo1f5GfRI3vOiFnPiBS1zq/tNSxT70cy+RGbNXDDpGEGog1RmNUEHtaweZMztXytalIInQ22Aeuq0GgiRZUqK8Zmt/OzKVD+XMW2gDKuOqO6TuSa/Ysj4qYJQ1RYeIZLkXtHTonlsgULiiyayFaQuA44/jnOsrE8qmG2l+3Ic9hKwinzfqv/63r/A0ehUmW0WQXLKtGX1bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrm+IchhvLmLkF2ahuYkeqyLbWWsxlXM4XviXUTTook=;
 b=NCbr1qTiiyNBqGX2RSQozuhv5rd5Jdxe4ksygMQYrKGY6uOQqNkGmmtbkwOtXh+00FZYdsQWgFev+y7CIqvSFwnSiYXWjV5hXuI6AU1t8H10XUicnj7JwF8ao70shpZ7iGAB7569ml/7SH5Icq6tyXb23zbHd3Rja6YLtmgDsH2fS5wOhVN70SzGsahq1jJUzjv1msxYqiPMssBKKWZnOWmGjBj6JROOM2Thd2Ky/5dMPqD5Gm7zjo+iexk+K0Reac1qUEyFRYS6zM9P+3Z5B5tKZRgfOF72y+OozalpNCC9BBEjwkEKhWEHeZtfdBAQa1GXg7iNkvB3uvSsh/lL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrm+IchhvLmLkF2ahuYkeqyLbWWsxlXM4XviXUTTook=;
 b=JvypHkYmHs90oYx7j1MbPtNKrtKyiI2+mHEpoLQ7AtcjUwhLKcLiMyvdlFtWwguZlBPWxIr5K7vdp796qo0sJuzUoqxr57i1LcUbZUvCg5d2TFQjEnKsT+GNcs8RLYl3+qF2LScl0qx1lgBjjoaXx3LI/RAZTiFJxff7IyerGEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <68ebb184-217c-427f-ad4d-381925decf7c@amd.com>
Date: Mon, 5 Jan 2026 16:17:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|BN3PR12MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3935c24e-0df9-47d9-c550-08de4c9fd395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTJxQjFDa3Y1MDBMajl5RHFvamNlTUg0Y3owVVBlNG94M0hKUUZjWG9pNFht?=
 =?utf-8?B?b1daYkZjcXFOb0hVbk93ckVLT2JySmtWZ2NPM3F0ZUg2d2d0ODkwM3NpWVJD?=
 =?utf-8?B?TWpjL2lUWmZLWEhVWU56WVJIaDNuWDhaNTM3Ky9uZmlTU3ZhQStxTlBuWGsx?=
 =?utf-8?B?V09CdmgxbEJTMkliSyt4K0VUaUJRalF4THd3Y1dQMWZrRXhTN3dPRVhldkpy?=
 =?utf-8?B?aVRTa0tDbmdLR0RPQ3drZTFtTnBDMFIyNWFrb2ZOZXJzRm1YVUpZaURLQklx?=
 =?utf-8?B?WmZ1c0tMeUdMWHBPZnFBWUlEbUxCTndQK1lNMGxmQnRtVWpMbWxlaE5mQ29N?=
 =?utf-8?B?eCtpTjlxbndQN01DZlBTQk9LR2tQa25jS3ExU2tqdm5kb3VjbGhlZEY3ck1X?=
 =?utf-8?B?Sm5NY29DTFAxbUwyTHdxejU3blU3RmQ5WWNGK3djTmpIT0VoS2Q4QmhPS3lR?=
 =?utf-8?B?WHFsNGJTNkV0b3ZFRDd1bUgwNjBIZEVvR3VrMUFQeTd5eUZkSkZxR2FlSjEw?=
 =?utf-8?B?TDdNTnczcm1xUXhwNzEyQXNXR1B2UlNwNVhnWktiL3hhTzB4YlA5c3d6RFkz?=
 =?utf-8?B?ZXhjcVF3YTNDTUhPQXZlZlVhRVYyUnRPaVNxRkZyZEpqMjRlVElYWk1rNG9k?=
 =?utf-8?B?dTVpQ1Z5Qi9peUltTWx3S1VDbnBCSEpYMkhsdkdoZXYyZysrT1JzVUFKRTNP?=
 =?utf-8?B?dHRYZWRsZitHY0R2ZU1uZG5KVCtIa0RDL0dhZDdKTUpRTlhGV1hOWFVadUdw?=
 =?utf-8?B?UDNHeEtTb1ZNMm0wQXRuc083Q2hZcUw2UTF3NllsRG9HanFxcyswOFgwQjMz?=
 =?utf-8?B?Kzh3U3hHWnNwNElDUXZ1d1dENGs0NGRrQ3NiaHBtSmZITWV2MjdlU1JSR1pI?=
 =?utf-8?B?NVV6bTB2T2o3bTRlZmlsRVFpRGtGZC9jWitmQTkxdVVHNEsyNmtLOUo4L0M2?=
 =?utf-8?B?UFlCT2FqeFBFbVIzcXdDTkxKR0JMeGhxZit4azU2M0FlK2dlNi9KUnNvYXdC?=
 =?utf-8?B?WHhTeHZvbzdHNml4MlllaXlTNUpaWWZEajl2VUdYRThMdTBGWDlqYzFaSHRN?=
 =?utf-8?B?dU9hMzhRaHovYTgxaHpKZFg1UVVqQlVkUExZT2ROSmUxUjc2T0ZCQmxVM2tK?=
 =?utf-8?B?TDQ5d0t1ai9yeWV3VkN6K0plMUZXVVdUdWc0VTVCR01aWkZISkJJdmQvczMy?=
 =?utf-8?B?Q2xFRGlkRGZOTy8rMXQ1cmJqTGZUeGtjKzlySUxrcVRjSU1pMklKQVFzMjBY?=
 =?utf-8?B?MGRvaWJaVFRCVmNRUGViSG9FQ1U3WHpCR2VNVDFVVFdxcEpIT3ZZTnJoOG5V?=
 =?utf-8?B?dkQvN2NiNnVNbDhRNHd0U0FSdXg2KzZsR255RS9zV3Z4dm8zSjdWN1NXOUVm?=
 =?utf-8?B?eGgyRlc4UERKbXpwVzdJWHFFQTk5WmhWbnkzTzVZR2tzOTVwWkhIZ1RpM1J6?=
 =?utf-8?B?VUI5UGZmL0ZEenlxZzI1cHBNTEw2elp4clc5bWsyMnhaTEdpdlZaT3lxZys1?=
 =?utf-8?B?cytoSzQ3Mlg5VTBTWGRZaXg0U1RMOHNQNXB4THJWeG9VVFZCdEhwRGIxSi9C?=
 =?utf-8?B?WGMxUVdGMUZ6RDVLK3R5OWhVNExZQlFjNEltaElOWDAvWkRmSnVrQ3loN28y?=
 =?utf-8?B?Q2FwcXNBZTdMT3ovekQyVFp4YWV1cy9VWGZFYnI1a0ZNT01wNFZYUDI4akQ4?=
 =?utf-8?B?dXliMUw2b21FL1FEUlBDbnNabnJCWUNHN2twMmh3R0ZKcGh5TEIwM0RETVdX?=
 =?utf-8?B?YUtQOU9xU0RFWm9QVm9yUlNiSTlPN2E1MCtIT1o0WTJ0ZnlmSG14RkJwaWln?=
 =?utf-8?B?QWw5ZWpabHlZdzNteFZYZU1Xb042MDU4SDV2eWdEUDV6Y0hFY2dlVFprcTNz?=
 =?utf-8?B?RUdxM3BKUmVRNERGWmF4RVh3SXVHRkl6cXFpdFl1R05VYUhEVHlaMEZ6OW40?=
 =?utf-8?B?SFA1bnFZVy9HM3p0N2dZbDN5YW1JVGtPWnNwbUpwY3B2dSs5d1kzcGtmeFIw?=
 =?utf-8?B?a2Nhd2s1UWlubXJWWlZkaS96ekVnWWV6RndxT200RDgrYlowMVV0cVEwSGE1?=
 =?utf-8?B?aDhNMjJCUUNqOFJlSXVSOERMSGQvdFRhZlBhMzVPM3FBNjJnaHdFSnkwaFRz?=
 =?utf-8?Q?OTMM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 21:17:26.5853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3935c24e-0df9-47d9-c550-08de4c9fd395
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9594

On 2026-01-05 14:57, Andrew Cooper wrote:
> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
> support for AMD Family16h") in 2013, despite there being 42 changes worth of
> other cleanup/rearranging since then.
> 
> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
> opcontrol and the GUI and processor models dependent on it") in 2014, as part
> of releasing version 1.0 and switching over to using operf based on the Linux
> perf_event subsystem.  Linux's version of this patch was merged in commit
> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
> 
> Drop xenoprof and all supporting infrastructure, including the hypercall, the
> XSM hook and flask vectors which lose their only caller, and even shrinks
> struct domain by one pointer which wasn't properly excluded in
> !CONFIG_XENOPROF builds.
> 
> Retain the public xenoprof.h header as it is ABI, but note that the
> functionality is removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

VPMU_PASSIVE_DOMAIN_ALLOCATED could be dropped as well - maybe in a 
follow up to re-number the remaining VPMU_ flags?

Regards,
Jason

