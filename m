Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F1AE848D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 15:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024876.1400655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ8R-0002XF-S3; Wed, 25 Jun 2025 13:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024876.1400655; Wed, 25 Jun 2025 13:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ8R-0002UM-Om; Wed, 25 Jun 2025 13:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1024876;
 Wed, 25 Jun 2025 13:25:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrh=ZI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUQ8Q-0002UF-GH
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 13:25:54 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2414::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9cb5695-51c7-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 15:25:52 +0200 (CEST)
Received: from SN1PR12CA0104.namprd12.prod.outlook.com (2603:10b6:802:21::39)
 by PH7PR12MB5655.namprd12.prod.outlook.com (2603:10b6:510:138::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 13:25:48 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:802:21:cafe::1f) by SN1PR12CA0104.outlook.office365.com
 (2603:10b6:802:21::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 13:25:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 13:25:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:25:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:25:47 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Jun 2025 08:25:46 -0500
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
X-Inumbo-ID: e9cb5695-51c7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLnZDTFwgc9a+TdEd2YPIlOkZZbUu3hfkr6KqdMN1Yyr+2B1LnzozAX87O7UQLeFppOea/eQeprsqcp8FILGhYfSSwknkmUQTV1cFyfHwni744snFn88D8oepViIjNYL2rTm6fgagLjdWdpDacaZcu0OLEXy7WCZyUTkF7UA4H87Ux9OMNG8n0+5B2QhUpEAfwy6YcPCFLkqa7SWSTPWXCqT9Qo5l+R9tzWK51dT+Hs85IXNgOdcPQHomS4YBuDYBRA0iVcVD4ftgJS5/Dd6Cr/dhog3czza8zRsseuNz2h7+1Na4MrsSZxLkWRlEEmZA9Oe8erVlqmkb5DLlk4NMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PgfEBNTfs9tlqljiTqfK0ldvGQZopp+kEXzXSsVFMI=;
 b=hwjA95h6z9uCw/nac6YgNOniwV3JE5W+JhgjDWLnPSqcoeulv9mtZc2cvy/ByaWhyHj275NKzxQymdcvNbAOA9WKgEKnsKie5JUTJVbBn4Yvql15zqCLT+rxbzpgn+1G3+H8Wsl+P0Z+rHaNk/+yBIHdzgZ4PVX6eBhdhEqnXvnXz1eTJehErGcgaNZhfqr8XzKfYpwhoFO2MGxck8+zDMisKPaas0BPwYxlLFSZkZk0nd1hPoKe+/Jy5+fO+iZSWreHXLmEeb/VF0PxWKHDlaHHLi3Le1kfJFG5oaTQYNoLZFbnuKLr1AYtMbcRgXQ+zuvPOs/xABWAGGWDgVdRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PgfEBNTfs9tlqljiTqfK0ldvGQZopp+kEXzXSsVFMI=;
 b=g4yVGiCbm2XzXFctSImwjRKMXA37J4++PV2kx1bcaU9C9XiINFMSZ41kyc7R8mI3id7ICX9sCy21D9fEKXUDmodcr+kHxfyRWWyx9V3dkkIsB1ZZbEA9bJG5e5OQl0RukqGMVHROn9okOOycDn1Yguw11ppupBeBWktxzSr0nvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9388a4b6-a936-405c-b691-00f606c07fda@amd.com>
Date: Wed, 25 Jun 2025 09:25:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250625110843.24840-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250625110843.24840-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH7PR12MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7af79d-636b-4e08-ecdf-08ddb3ebcc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmpDNDNRdVFYeVJUMEtjV0pOMFdudTl1V3dER0FYY0QyY3pyRVFFOWhsdVI0?=
 =?utf-8?B?aGRWRFljQVF2WjVrU05iakJHSXhSNWJzaEZML0NHeEJ5UG5iQ1NlR2d5VUdn?=
 =?utf-8?B?dWlHVWRmUWc5SUFMNjhoS0Q2TFp1M1FubC9DRXFhSHB5ZHRpaTlPT0d4cFc3?=
 =?utf-8?B?L2IrYW0xcmxQVUdmeVNHVEdFdFRkQ0hQWFlEc0VrM2ZxdzVaNE5vcnJ6cCts?=
 =?utf-8?B?UE9FQUZmYVNzbFRJaVFNYnc2cnpaQi9CVDcrZ0VWMDFCaU1FR1lVZUR4aHNv?=
 =?utf-8?B?a0VhVWs4S3JBSDgxR2NvNGMxYklIM3JGa0t5NXNIcnJueUk5NHQvQXNjMmVF?=
 =?utf-8?B?TFNzbjBDNUwrWktUejMyWkt3Ymt2Z3BkNFlVd1FIbVB4YW1MYVNLR0QwZXMw?=
 =?utf-8?B?MzJ0bCtwbmV0R1pvakFTM2preEUzbktDcG1BZnRqTFF4UVFmK1BLZExRWURG?=
 =?utf-8?B?YlVqT3ZrUFJTSG1uYTlCUkNRd3JSSGNnSkdvYXhsSmFHWmMxU2krY0lweFNO?=
 =?utf-8?B?U1JlZTF3OFlEWURsSGd2ZjFoREdsU0czWCs1Yi9pa01uU3gvL3ZjVE1kc1F1?=
 =?utf-8?B?RTJHZ3ZEVjVCM1JLdllyY2dMTnk0QjZBb0pIZ1dseDB6OTJVeWlHNHNCYUQ5?=
 =?utf-8?B?bERuY2xZWkh3bm5MMlN6c0xqa1ZmWmJBNWFlbnI1ZnJHWHZnVTh6b0NtTWhx?=
 =?utf-8?B?bkIvNHgrNktoYXVnNGZiN0FRdHVxV3lhQ3VxSU5SdldaaENiRUI5ZXpiSm1p?=
 =?utf-8?B?ZEllQUZvdHBES1pWaUl6ZUtxNi9wYVhmQmlnNlZSUS94Y2FabEhlaDE5a2Fs?=
 =?utf-8?B?WEFqREwzelBRV3dGZG1MMXoyQmc0RmNvYWFHWTRDeHdSMmdhUFdacXY1dUFJ?=
 =?utf-8?B?V0NwNWRMdEdXdHg0N2pJYlMvbzk3dkN3NCtvbHZuZVhtN0tSU3ZzUlkwWmFX?=
 =?utf-8?B?L0lFRG4xdjdmNWdFdG1RWlFCV25xS3NxaFBuU1RsUVl2dFozdXk2RkI5VGVR?=
 =?utf-8?B?YjVWWTArWTJPNWFKUStOaXNKNG9KbFNNVHJva3pIYWh4QWFOeHhMREV1cVpv?=
 =?utf-8?B?NlA2UjNRMjlXUUE4RDBGZllQa001MHRvWjBLNGlZT1BFdEhiVVJvTXB4SVpY?=
 =?utf-8?B?Skw4dTRJbHhYZnZVeEFNc29sTVA0dVc2RUxDMmhaZHh5akNFTE0xTnNaMTdK?=
 =?utf-8?B?b1RGWTQ0NkQzWXRSaTljMlNSL1ZxYUk1cmxLM2VCM0NRbHRmckF1ODhBdXAr?=
 =?utf-8?B?a0VDTHhWdnRIY2VWWlRvc1lVWkR4ZEFaa1AyNmRyeHFySzJ6M2s3cGxRL09P?=
 =?utf-8?B?UFNCZjJ6d2QzSGt0Q0VEQXhiYnJkWnJPNDVkYUdBMitGdTl3QnRjSytBMzBR?=
 =?utf-8?B?SEtWektXcnF2WnJOTUhuUEZzNEVxMkFGM0tWZmlYN3g2dytqSE56Q0VZTSt6?=
 =?utf-8?B?RFJFQUluVXBKQ0hYZnNKcDdmTHhkd2JXaUpKUkg5ZFRNU045cXVrbEF3M2F0?=
 =?utf-8?B?Smw1cjlkQ0tuSG9kZWhzU0RtU0U3WG8zcGIrSDZSeElpcUxaQjQrUWdiSWph?=
 =?utf-8?B?bzZlQWdyR0VoUFErVFVsSnNzaTFBTEdzSlhQQVhmUEx0dFNoZ3MzOEc2cEJv?=
 =?utf-8?B?NWNlZ2hjbml5a055MytiS1YzYTNoSC9NYlFFQlRBZFh2RHhGT2tCcFlidlkr?=
 =?utf-8?B?QnRsaTFnTE45Z0lzRXpHOElRdEl1czhqN3p4eTNnL1RrS3NoWEtpWFlBcE93?=
 =?utf-8?B?QmZDTktObkQzWG5jZ1NXa3c2R29wbloxYzFhNnZLV0Z4MW4yOVQ1NTc3RHhm?=
 =?utf-8?B?My8valoyM1ZNWnZsSVFTbW5LR29EUEl6OHVuUUpuZ3Y0am94OEo2VDFsVVdQ?=
 =?utf-8?B?cGV1YWhmUStUNHVMWURWV0kxeVhUcVFPWlZqbnhmaTFpNTFIeFQyNm9kWmxy?=
 =?utf-8?B?YTdMOC9hSEhTMjcxaGNHeHYrQnBPSFJDYk5PSENDajRCbmg5emkyUUJ4Sjdl?=
 =?utf-8?B?RlcyMHZ5WG1Qc283M3VYbGRXN2hJOXVDT2Q3VUVMMVN0RERUejBabDY5WmdJ?=
 =?utf-8?Q?KIjZ3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:25:47.9741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7af79d-636b-4e08-ecdf-08ddb3ebcc28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5655

On 2025-06-25 07:08, Juergen Gross wrote:
> The kexec() function of grub-pv is relying on the exact definition of
> start_info from Mini-OS by having an "#undef start_info" and a few
> lines later a copy of the Mini-OS definition again.
> 
> This is bad practice by making all attempts of Mini-OS to change that
> definition impossible.
> 
> Avoid that dependency by moving the code fragment in question to the
> very end of the source file, allowing to drop the copy of the
> definition.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

