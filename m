Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D0B38433
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096140.1450934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGfe-0002WC-D1; Wed, 27 Aug 2025 13:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096140.1450934; Wed, 27 Aug 2025 13:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGfe-0002TI-8q; Wed, 27 Aug 2025 13:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1096140;
 Wed, 27 Aug 2025 13:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urGfc-0002CA-Up
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:58:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec447a0e-834d-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:58:35 +0200 (CEST)
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by SJ2PR12MB9238.namprd12.prod.outlook.com (2603:10b6:a03:55d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 13:58:30 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::f8) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.5 via Frontend Transport; Wed,
 27 Aug 2025 13:58:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 13:58:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 08:58:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 06:58:30 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 08:58:29 -0500
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
X-Inumbo-ID: ec447a0e-834d-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH8spdrE3erGTd8Njk66mnISHky2DCZZkEceK6Zihke2OQYKWo0Er4QJw1xaeXINssfAsmDOJesKXZIKppg7giHHyKlNqKYV3ijZuengg6ySd6+z9c1cnS0XvgpU5hUibxSymW8qUmebXJM77N0US8gi2gg4C2LXp36+3Imth+sKznMaiAR1Me7YxUIZ7aX1GC8hO9B6aM79lrujCM1yyopwajDX9cgm6UFcaW8YCz07wRXzpceEdRXfzogdx+2qp0jRQvGLi2bkDuV5LhQSwBGSKTeW6exBSjuHNc2rvuOYMemNQrA3HHiKmAuG3bMCjBGvfLX9X2hSp6Wr6DWPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O94bgVEIti/iD7TO9AcUNGXlXChxMCiTY0vxoPt7OKw=;
 b=xwbC8T9Fb3cB4v42hwWt+u0qipkwEWy3iWj+4scAGaAkWh/wN4xMAjZkbJnAzZ2dYHfq6i3QxZRFZtEdZ8FNujDSGyO0Ali5nahINdGyfQB1YbF3mpoEOaDNaFlIpTSAggGC362N/617NyuCv/CWFo/UG8x8d2OQh6FGwuLGWowuXN/uOroT/KXMRA0h7BYL5A5O5Qgxca6K1jyUKOPE+K/+L5uuDJKcYJv0x0S9YUeYI6CauObArL2o5eyqBjvL4GNzB3PU0KG5IsMBfqUAXxkPmvpTnhefIhkf2zFppp+zWOaKDgQtwdfq21+eLGxso/9A40nxxu25+rPTX/Qb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O94bgVEIti/iD7TO9AcUNGXlXChxMCiTY0vxoPt7OKw=;
 b=ZwR5UJKgU7ma6TNq1Cx6TojVkXKaa0dvSuFgDdy2DXozzekeTUuwcz8+blIp+58e0Y0qaMffGh6j3sQEri4+COoPVXTTOnaiaEgEiGQZZYOLbJCgbyPrC5sG48lWTjizmbUXH3oAJJ/THcQlSi4hh8Adk1bZyPebp3/GhIBzJpQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c6bb835a-40dc-44b6-8f95-4254f10db98a@amd.com>
Date: Wed, 27 Aug 2025 09:59:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: rework xen_pv_domain()
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20250826145608.10352-1-jgross@suse.com>
 <20250826145608.10352-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250826145608.10352-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SJ2PR12MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: ceabcf71-b094-4b2c-13ac-08dde571cdfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bC9PMG9kUXllMExxK1ErekZvcVVmdmIrZXFQWXNYR2JhR2RqdnEyT2lpb1V2?=
 =?utf-8?B?MUR2MXZzbTl2dnZidEpjSzhPMWtLNDFjYTZvbnQ4aVlnQitYU2xRNzBSc1h3?=
 =?utf-8?B?VHBkU01EMTBmeEhKRENtYU1BbC9wcXlKSnFzT0FkSHVRUEtwcW1SM09JOG9S?=
 =?utf-8?B?MjA4bjA5a0V0NzlXMHI3OEFsZWVvVWpHeW1zcXBkRzlpNGJpU05uQWcxVUZC?=
 =?utf-8?B?aFJ2K2IxOXcwQ3JETkdobDhxVGVkT2hvT0Q4ck5wVm9VV0R0eTEvUzc5WnVC?=
 =?utf-8?B?UVlXQ2N0VXUrbnlZQ3l4L08rZ0RCQ2o3TjdVd0xvLyt6ckM2elRuZ2ZBbUM0?=
 =?utf-8?B?WEl3NFR2TUVzM2JDWUZWTE91b1p5aTJYK1Y0Y3g4N04vRUU1UGpCQytLbzZu?=
 =?utf-8?B?MzN5ZHN1UWZaSjlNWk5Oa1dEUmFtblBYN1NqcmUvcmkrSWd5bjJHN251R2p5?=
 =?utf-8?B?QjFLSmJDTDNpQ3htVmFoV0tOWGM2Y0ttdktVK0FDTllJcmYzcGFFMzhTYUlm?=
 =?utf-8?B?SFZWZVdLYlFBcnlhcmx3bHRXcTVqRzJISjNKb3JBNC9UeGVMcll0MUlVRFRt?=
 =?utf-8?B?RVBqNjBHV1VSY0ZCa3BuYnhsZ0NOUEhIb0lwY015T1BHdFlJc3RKZ1MreEx5?=
 =?utf-8?B?L0taUnB4SVVyc1ZiWXZhSStSVThMUGsyV09UNjN6YlRTK3dGUENpRTlmKzR6?=
 =?utf-8?B?cTA2SHdPNmE3ZmFGRkNaVnBValN0TE9oT3p6SllZbDRKSHFmNllaaXVUek5L?=
 =?utf-8?B?d0NCaFFFanB5WUlKNXlrNGRndE1udWtCQVRZU0JJNnBJd2xBWTZIVUFBUnZo?=
 =?utf-8?B?d0s3c3pRRWwzRXUwSEtIQ0FvZTVZOTZzRWVwY25ETlFjamdyelE5dDBsQnhZ?=
 =?utf-8?B?YTc2emk4VWlvN2RSemtqZHUvZUUyenE4RHZjMENmRzdnVTZjNkFhSldmVk5M?=
 =?utf-8?B?RkQ4U1JRVmEzTWl5Z0N5eDUyeFhDNFFMZlR0WlpGYVFTU2o3OVNncXpiQ1NI?=
 =?utf-8?B?UUFRMFh0bXZHZkdMdUNMVlB1R2JlZlVRT3BGbGNmd3JVejRTL3F4SkU2Q2ZH?=
 =?utf-8?B?aEJxZ3JiSkhjUVZHOTBvNjhnR1VpQTlSMkpSL1lzZy9lZlFPNGdwMnk0czJL?=
 =?utf-8?B?ZGdjYzNsUzFZZEtoNm1YZyt2U0V2TDNEbERJckFoS1RqY0ZVc2ROQ1RwemMy?=
 =?utf-8?B?L1BDQ09EVGVKek92ZjE5ZnlFMlJjazJ4RkREb1R5OUt4VVRWYndib3dHVW1z?=
 =?utf-8?B?WWZ6TGo2RTVra3JSK1Jrb3N5MFVhWUs2NDdGYUJud1VkNmxaaGtpWDhJM2ZC?=
 =?utf-8?B?bWo3NlI0eUoxbWoxVkpHMUxuV0cvSXdoOW5YOGEvWXFtM1RQK3lodjg4STg3?=
 =?utf-8?B?dEdTY0luZWhvOXBMNlVqY29FSGNBeTlQMTVINmlFNEl6MmJGTmY3ZFRxc2hs?=
 =?utf-8?B?eTBLaXpzdyttK2psZDFxdU5BbTBzY29pTnZZTVNlbTA1SUc5a1NhU1F6aUZ2?=
 =?utf-8?B?QzBUbW1KUm9hZ0RkOEwyTDRMY0xKd2dVcEwwSXpneXhUbTNEMkIxOW9VZEVi?=
 =?utf-8?B?d1JrZ3MydUhNWUFpQnh6Z3ZMRFZ6aDVSQmEyeEJVQXJGUVNzVDQvRzBURG91?=
 =?utf-8?B?VnpkdDZ1eWpaaUMvazlwNG1abHo2dWg1MVpTWTdXdWN6ZTRqc09qbXBsQlhZ?=
 =?utf-8?B?N3Bic3FVMjZTT2gwWUhGbTYxckIrRWFNbENBR2hEb2FyN0ptZ2M4cjZDenlM?=
 =?utf-8?B?UTFyYUx0dUhtay9ib2xZeDN4T3RZM05ZdHgvZENibFFuc0dEOHlvV0JnVlhR?=
 =?utf-8?B?OEtNVTJNcjhGeE05dFM3bzM5aVM3anBTdWZlSEU3aTJkZ1lOakFyUE5PVTg4?=
 =?utf-8?B?ZTBQZXAxeDVmdDU4eW0wVEFGelp1THdXNW16ZUphTnVuWmtBZloyaENkVEl3?=
 =?utf-8?B?UlVVTmdhS3BicHI2TFkvWmdPR0FkR05YMCtUeFJFN2NzSGgxTThEL2xGSFdr?=
 =?utf-8?B?cVNKNm5teHVUSHlGdElkSkk2RUFWdUJIRzE3SjI5S0RKTHp1VkNpdTVJY1FO?=
 =?utf-8?Q?dPB1zL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:58:30.5853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceabcf71-b094-4b2c-13ac-08dde571cdfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9238

On 2025-08-26 10:56, Juergen Gross wrote:
> Rework xen_pv_domain() to no longer use the xen_domain_type variable,
> but the artificial X86_FEATURE_XENPV cpu feature.
> 
> On non-x86 architectures xen_pv_domain() can be defined as "0".
> 
> This has the advantage that a kernel not built with CONFIG_XEN_PV
> will be smaller due to dead code elimination.
> 
> Set the X86_FEATURE_XENPV feature very early, as xen_pv_domain() is
> used rather early, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

