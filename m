Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA49953DA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813283.1226151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCa7-0001aK-MD; Tue, 08 Oct 2024 15:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813283.1226151; Tue, 08 Oct 2024 15:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCa7-0001X8-IO; Tue, 08 Oct 2024 15:57:03 +0000
Received: by outflank-mailman (input) for mailman id 813283;
 Tue, 08 Oct 2024 15:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syCa6-0001Vf-4M
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:57:02 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [2a01:111:f403:2405::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f311898b-858d-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 17:56:59 +0200 (CEST)
Received: from SA1PR04CA0022.namprd04.prod.outlook.com (2603:10b6:806:2ce::17)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 15:56:55 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::53) by SA1PR04CA0022.outlook.office365.com
 (2603:10b6:806:2ce::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 15:56:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 15:56:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 10:56:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 10:56:54 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 10:56:53 -0500
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
X-Inumbo-ID: f311898b-858d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybON4rfynR8EKOsXiNMhl45lLIFjFqKnhPpkj4vQLDcBplq6DBjfh96TVoemR25YJOEqHw+mhNg+88IUuB/cqLrKZ1Ab0+6wft6/2ykv2/ZXSynqtdqILqidExv7yK9OohVG0nhV7z5/GyNLwzcZqOLWwR5doKSJD5UyY/TfoL0fWsbv0c/1z7JbC41CLda5rd5SaDQpTrLeq1bFJPseU9xsGs0sVn0yxE+MFbuDFEMBeTeoTDnkNC9Pd3cW3AupQ6BXYzlbgVSJUprYTuGTp3j5UU661YqSPXCg6J48BlYZ8Vtep8MkZU4sZWofNJ0ps3Dx3b9SZ3bXkwEiLRrkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WlfGc3hhiPsTYyaOy5XjpupH0pBE9z7x2O0qbdzlCw=;
 b=DyhWLYhCqo6M578aG9gOz1Q6CQgfmZSSRSY0N3Nx2ezZLTMwIp/7ZqVHmDaHH8gN3iqfWlmUzxkfMxWp/49rijIxkYF31QEelE8Qyj2dQkVNQJ4rRNIJvOoopDW1urRRYiDHLcbdKJZngdrGQLawlAYO+j1xAp9HO2D2GEUxRKjz0PEf4AHK2m1aPCnwyDCxoj1izU4bURtmjFauQzOmCVmRWvK5CTXuXSiaIrSBj5KxT+ev1anpzeinuzTMcL79RhQ4Jon2DalbufCQAMXkWmCa9wL1f/Ojf6NOjmtkZrHkj4YzRAke8mg8FJy3txGih7uIYEH3GWooht2sKRSs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WlfGc3hhiPsTYyaOy5XjpupH0pBE9z7x2O0qbdzlCw=;
 b=V3fJ5n9SJqhHLt3NtnnbLBaTEu4oFM2svAj9/K4jr7yWK0kLPszRHxMhBJrPYoeAe9f9UodZwL1hTAceLDZ6z5GwqB3tJeqYRbJEr+YtKPohER3cS0XViCSp19z1XDFGqNI7t2pZdmHGbkk4V+Gwn5qRiPr5LtiTjzwSbCkrXSo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f2711741-5e05-4ad4-af33-6df18b09fb1e@amd.com>
Date: Tue, 8 Oct 2024 11:56:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/44] x86/boot: use consumed boot module flag for
 microcode
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-20-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-20-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c39cb19-d5b8-461c-7285-08dce7b1d517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEk4R1o2Z2RXbHF1YXhWN1Z2TmlrV3AzcFBydTFqdlFVNG43aUhlWnVBTVdF?=
 =?utf-8?B?WXhrc3J0NkZvdUIvM0xWN1RUbkhVWWFoQ3M4Y2s2NjVEN3pZTkFxMDg3U0lO?=
 =?utf-8?B?Wk15dklqVHNyZVIzZ215dEQ0MG8zYU1pVFJ2V1hWYnhyTkFTZHhmYXk0RWhG?=
 =?utf-8?B?UjhWbmtSVU9WQkZ5WWd5dlNtYkJHVzJEb2Y5YXVxL1hkT29US0VjVFhSQWxt?=
 =?utf-8?B?RnZwekRISE9SckI0MGFITmJRbnhuTmllaFM5bXZNSytxQ2dQdnk0UFN6QytM?=
 =?utf-8?B?cUNsQStZL05oQXlQeHg0MUgyQm9FMGdaOWY0REFhK1dTRTZOWDl6b2ZwKzFq?=
 =?utf-8?B?QTJucnU1UUZwMDhJeHhXUyt2S0xITUNzN2MxTG5wOEliMFI5UjUrbjVnUmVK?=
 =?utf-8?B?L1hDclBScUtTNW5HS2lMdG1aZTg3eHJSSTZtVGlkcGtoSURDcGgyQngrOGxh?=
 =?utf-8?B?N3NlRng2cE9rWDYveFViUWltalMwT0FxV082V0o3YUhsUDkrdGtHVmM5citN?=
 =?utf-8?B?bVpJbGtKUXk3bnp2Q2xxOHlWRHBsN0JWTGlJc0lXRXRiWGtJRVE0WDF3ektF?=
 =?utf-8?B?eUU1Y0VReXQ2L3N0Y3ZMOGJ2Z2JHb0pxdGpNeVRsdzNFTnVCRkZldm5Eb1Zv?=
 =?utf-8?B?YjBkbi9zK1pqdUF1dDNwRUVDanNycjExZHdqSE1rdUxTRmFvOEdUTHNCK1Fn?=
 =?utf-8?B?ZUhaQVM3N0xOYVh0VFNZNmJZbllidUpLR2NYNkZsYlU1M001QjRXVGVKRVZY?=
 =?utf-8?B?QjM0c0dScmZyLzU3djJzZ3VKenNWVW0wZnVVMFV2VGF3eTA3T0VSdmJ1bVJo?=
 =?utf-8?B?dzhCbHFXUDhrR2lPQXU3TXVhN09wZE9Yb1prMG9IYlBaN3d1dXd0Mjg1M3gz?=
 =?utf-8?B?a1BFMzdrZjNYeTZUZTdzc3duQkhsUUVoL042RFhBcEZmdjI2UlJ4bGpWSHFB?=
 =?utf-8?B?cEtJdjVOQWJWVHRGQS9nQ05kRVdheWNtcTBSc3lFbDRaQkJ2dVFtUXpFZzlR?=
 =?utf-8?B?Uk5HZERLOVFUU0M0enlOdjNRUEI1bklaNzhGUGtvYXFNLyszdXBPZ2lHZHU2?=
 =?utf-8?B?cjV5dURtV0lYWWE4MHZlWlZiOXptUXJxS0w4V1JUdE0rOEpwVGRWR0txdk9X?=
 =?utf-8?B?Y1VTU2tvWmRDQ1pZUG9ON3BwN0YwSEtnV1pvNkY5OGxwVzN3NHVLWDVFZjQy?=
 =?utf-8?B?MmJtT1laK2NFaGc3Zm9LSzFEblMrbXppa2paZDFiZUI5dm5Wb3l0UFRTUDF1?=
 =?utf-8?B?UlMzVGxjNFFOcHpLZjRQdlBMZHhWUDJLcDVaVWhWQVpHK0hoa05qdk16WDBU?=
 =?utf-8?B?YXRkZmN2bCs0MWhnYVZoYzF5TWtIZlRpbmlDV0MyS2pzdmtKSmdMUXh3RlNn?=
 =?utf-8?B?U1Frdjk4T3VXbk90c1BmMTFicGxnMmN0S0dVVTR6a1ZXTGU4NVBJMGhVakRo?=
 =?utf-8?B?dXV2TVl0QWswUlJ1UDZjU01iUzZ4WVJudjJkS09Qc3JmSS9yd3dhdkJCRlUz?=
 =?utf-8?B?OHowWGdxL2piekIwNHN5dlJGOVJYRU92dFo3TG55VjJJSnJIbHJwUjFFTGUy?=
 =?utf-8?B?clhGdkhaUm5YSGlhVGNxaHdLclVTaHF6QXlvQk4vLzc2SWlLT3F3REpERUk1?=
 =?utf-8?B?OEpqdGZUQkJMN25FeUxYK0E3WVNxdTFUaHBGMDFQdzUwT3hFY2RWUUErQjVC?=
 =?utf-8?B?b2tqOTVBZ1dXY2xJTDdEQ1BoNFdnNmpkQUZ3R3VZQVFjeUxOcmFrcTV1cFdR?=
 =?utf-8?B?ZlBVYUdMZXpvMnFBdWdRREg5cTBCUThEZVh1K0ZRKzNvRFZ5cEhFdTlkWEZy?=
 =?utf-8?B?R3o0cy9MTGNCVlJDYVJyRDhZR1RKM2NvOHh6a3U2Z0lYcTBtZy82aStYdEZG?=
 =?utf-8?Q?cczAJolkShR8M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 15:56:54.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c39cb19-d5b8-461c-7285-08dce7b1d517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245

On 2024-10-06 17:49, Daniel P. Smith wrote:
> To track if the microcode boot module was loaded, a copy of the boot module is
> kept. The size element of this copy is set to zero as the indicator that the
> microcode was loaded. A side effect is that the modules have to be rescanned to
> find the boot module post-relocation, so the cache copy can be created.
> 
> Use the consumed boot module flag to track the loading of the microcode boot
> module. This removes the need to manipulate the boot module size element, no
> longer requiring the copy, thus allowing it to be replaced by a reference. As a
> result it is no longer necessary to rescan the boot modules after relocation
> has occurred.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/cpu/microcode/core.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 7bcc17e0ab2f..5b42aad2fdd0 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c

> @@ -826,14 +826,14 @@ int __init microcode_init_cache(
>       if ( !ucode_ops.apply_microcode )
>           return -ENODEV;
>   
> -    if ( ucode_scan )
> -        /* Need to rescan the modules because they might have been relocated */
> +    /* Scan if microcode was not detected earlier */
> +    if ( !ucode_mod )

ucode_scan is a user-controlled variable (ucode=scan=$bool), so I think 
it still needs to be respected.

>           microcode_scan_module(module_map, bi);
>   
> -    if ( ucode_mod.size )
> -        rc = early_update_cache(bootstrap_map_bm(&ucode_mod),
> -                                ucode_mod.size);
> -    else if ( ucode_blob.size )
> +    if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
> +        rc = early_update_cache(bootstrap_map_bm(ucode_mod),
> +                                ucode_mod->size);
> +    else if ( ucode_mod && ucode_blob.size )

ucode_blob seems independent of ucode_mod, so I don't see why this 
didn't stay `else if ( ucode_blob.size )`

>           rc = early_update_cache(ucode_blob.data, ucode_blob.size);
>   
>       return rc;
> @@ -851,10 +851,10 @@ static int __init early_microcode_update_cpu(void)

Regards,
Jason

