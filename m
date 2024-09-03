Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC696977C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788849.1198336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP7V-0002xN-LI; Tue, 03 Sep 2024 08:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788849.1198336; Tue, 03 Sep 2024 08:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slP7V-0002un-I9; Tue, 03 Sep 2024 08:42:37 +0000
Received: by outflank-mailman (input) for mailman id 788849;
 Tue, 03 Sep 2024 08:42:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slP7U-0002uh-OA
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:42:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76106833-69d0-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:42:35 +0200 (CEST)
Received: from BN1PR12CA0020.namprd12.prod.outlook.com (2603:10b6:408:e1::25)
 by MN6PR12MB8513.namprd12.prod.outlook.com (2603:10b6:208:472::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:42:29 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::ca) by BN1PR12CA0020.outlook.office365.com
 (2603:10b6:408:e1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 08:42:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:42:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:42:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 03:42:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 03:42:26 -0500
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
X-Inumbo-ID: 76106833-69d0-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXEyI9Z+9oPh1o3yLva+UZJLun0cX8eS7oyDcGhaC2yT7Kzu0szvJfb+RIG3zuV7oEv/AlYdtSqWyi7N+gdAc3Y93s6F0SeT2BF3BN20gFduUSKZsF+KfZnzDHHoF0Tsj3IM/2BxLVCXNoOs/mUyQ0DJZC12/u5rJQZN1MePnbezi/tFGMOI/zuZ/l8GNrqAYU+rsdZUr6Ti3EIWuHAQKt/ko2GcXTqni4HqkYDHEs/D7hXiomyFK8vr+QY3M0/fZpR3U5JzTiziUljCw9pUjtTrIEwRswrnIXw/kc6NThQxvEJLpqj05DVN+vuM2CNx6N1nYcfk5l1Q+WGEaEKrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OtoUIB3vNakXl0AincEeUFF41hacaC/stvMFeYizaI=;
 b=R42hKEkM1/HAh7o/98laGPs1Hq4R/CSBfqJS4VHIg3WnQ0YLXfEVTduXmYeaClzu4J1CMXJ7Z4WtT3J2dzzE+WLzhF8tfkgTodZtW0OO1ajs+xg2fGyVeOt4XYXdFCaLHeRJucveOxYCChs4LjhbuDVxtsKtNIiRhJ7tOvVwib8ye5ChwiU7Y++rOnoWFvQlopKMxAo+N6SLfTLWP5/EDJerKtD4+k1HhMfs02f0m20f31Ml9mUs4/v6KTrqsI+TGAEd6esKVbkpdZ7NrlXsUSgG9caY6va+p6zdRBks94zFryzLyUYYVBxIHmXrMN/O11Pyk8DizZX3aRIB8L1lFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OtoUIB3vNakXl0AincEeUFF41hacaC/stvMFeYizaI=;
 b=Cr2awZfso++zasleMMNkg4N6g6gS4krOvEt+GlCqGy18qAaiw1WGCCRnFjoT+rN/ElRUY/qMRn9Cu5vZetusXTj4eyH1CKsMZ+42rVQJ5tUHUCMO/fzzNlWOxEajxI9P2zqNYSYiZ4teVAW/23ZP8C+U3OOTNu9WQb+ZjMhhR5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4feb41ff-eecb-4cc0-ab2b-57e8a526da0e@amd.com>
Date: Tue, 3 Sep 2024 10:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM/vgic: Correct the expression for lr_all_full()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240902100355.3032079-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|MN6PR12MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 362bd158-db28-4b95-8cb6-08dccbf4580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHZUbldzM0VBSkhoSVQ1dTdBTGZZa1RadlV4b2V3N0VZcktZYUxnWnZHdEs0?=
 =?utf-8?B?NHE0bVRqSkhYMFVzKzFTMk9ZeXRJNzE0aFFhbGxPMEtUQ0Q5cDZLaVdjQ2Zw?=
 =?utf-8?B?a3M0ME93ZEg1MjZFdlVvMUUwVWhjVlhPVUdQQ0VSQW5JbUltaGUrNXFlZDFs?=
 =?utf-8?B?ZEFyVHVlZzMzVElsa0V5bk9KSHNEWXVDeHhlT25HSUNGTy85aEpvdENkZUdz?=
 =?utf-8?B?WUlON254d0pIcXVybVp4ekdCN3VwUGhtdHdMQnp4Q0RnekllSUtERE53dDlS?=
 =?utf-8?B?ZlpncGY5RWtRRU1IVll2NDBQSVkyYkdnbnVENUZMaXdtclNyWHgyNzd5U09U?=
 =?utf-8?B?R3NvL2l4bC9mZENodGVFUnhNZmcrdmx4WlFmR2JHKzFxRHZtU29tOVJGSzdO?=
 =?utf-8?B?bm9wUzdZWStNRGYwbzRMQlB0UmVQN3J4M29mU0dieEdGTVppb0Flb0dpZEs3?=
 =?utf-8?B?QnNuNXl6TW9iU1BzM2tYOHZabnNZU0lLRktJeUk3dk51THVaSDM5NEVXY1JN?=
 =?utf-8?B?bThNSE1YZkxxR2FhaVRNZjQwR3JlZzdaT2xSRTNndlJZUG00NEFtS2c2RGRW?=
 =?utf-8?B?RjFuU0s2YjhBMTlGbnY4ZFhBRlZaeHZ5Z3paaW0rY0dLN0g1TlVNU0gzZ1VQ?=
 =?utf-8?B?T0VEOWhRc1gxK2ZnalN1WnV0SThGY2RFa09JQ0Y0S25lV2V5WjFDWWdTZE9j?=
 =?utf-8?B?c3pDZzN6MjdQeThiOVlIVCtXRUFsZmFtQ2hhaytFZUpwZFQxMitzS0xmcXBZ?=
 =?utf-8?B?Vm1ZZzY4WndMajRjYkFIWWE0OGoxUkpoRDAzMG0zbFNHWFhpOVlGN3pqT0Vy?=
 =?utf-8?B?a1FodE9maUV0bVZMYUNBdE5TZHU3N29IKzZVSWptQ2dkeEJVejBzREFNZmto?=
 =?utf-8?B?N2N0UXkrV2dXTlZoYmYwUy9DblE2SHV4MUlTMkNheStFdTZCZ3F2WHUxMjVO?=
 =?utf-8?B?VUwwYks4d3QvZ25yblVsOTA2ZE4xa0o4STVTRlZYYkwxTzY5eWFSbEZaRzNY?=
 =?utf-8?B?d0R0blFPeHlsM2FqZkI5VmsxV05yU3V4bzVKQkpVeW1iVXNGYTB6TG84cktZ?=
 =?utf-8?B?ajBuOVFpbWtsSGhhcFFISXVwNUxEVWpuV0ZrQjJHd1JoTW5rNVJ6aERxOXRN?=
 =?utf-8?B?S0k2OTF2cmVmSGxvQndyRkJ0TEM0c0IyV05vdjRLZ2RqaHBXTkszRXpSeFFz?=
 =?utf-8?B?RlhQY05WNkxWNGFGRWZWZndlczZmOW90UE5ON1BKT3A4RHZ3T0xLNkV2K1px?=
 =?utf-8?B?NmNDRUJRWHdrWVFlSGNNVVViMUNTRkNOaFVZMmhFbkRHMkU1Mm1tNHFXTHM3?=
 =?utf-8?B?R3lJdk1LekRZdCtpeS9QT2tBWTg1d3pnaWpqQXN0dGpiYmtlR3JPRUNaM0Zo?=
 =?utf-8?B?NWluck4vNEVlYVZWOExYeEpuMHpSNXR0WHpzT2pQR1hPclVGUkR1M1NpSHJo?=
 =?utf-8?B?V05HRDZnZ2FpbXhFaG4vSEdLY2FGUUFsaDZYZGwxRFhDRk9JRXo0TTlrZXoy?=
 =?utf-8?B?U0xNeUZkMFBkR3F2M1ordUNKQnRxQ0NzVGZ3eHAvQ1FVTXQzOGhhdjErbTFa?=
 =?utf-8?B?RVk4d1pJZHk5TjE0RXovMi9nd0NBdWEvY1lSck5HUnpnTlY5d2ptWXRGc2lI?=
 =?utf-8?B?UkxjRVA2VHRZdk1Sc01ST2FlSm9ucjRHVVhwdnY5S2p0emxpalNhTzBRN05h?=
 =?utf-8?B?RGo2RlQrY3RGRGpUWENsWEtHcG1pVDErUExFU0svUnRoVVJweEhyTVZ1RzlT?=
 =?utf-8?B?M0l2NStCb2pYZ1pVTlBjUVJ0ZE92cmlBTERvUFY5MVkzM2FRUXU3WkFwdUJn?=
 =?utf-8?B?eG5JY2RaeFpWRFFnSGlGM3U2cGRKaFU1S2FHSTd3V3pIWGM2YlE0WWZ1RlN1?=
 =?utf-8?B?NGd3alA2ck80NWluYXBwZVlSbk9ya2lXMTdUZktGRjI2OHRPWkVxaHNpemtY?=
 =?utf-8?Q?amZYsk1sHpnLGR0LknjsIBFaXhQ8UoFM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:42:28.8884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362bd158-db28-4b95-8cb6-08dccbf4580d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8513



On 02/09/2024 12:03, Andrew Cooper wrote:
> 
> 
> The current expression hits UB with 31 LRs (shifting into the sign bit), and
> malfunctions with 32 LRs (shifting beyond the range of int).  Swapping 1 for
> 1ULL fixes some of these, but still malfunctions at 64 LRs which is the
> architectural limit.
> 
> Instead, shift -1ULL right in order to create the mask.
> 
> Fixes: 596f885a3202 ("xen/arm: set GICH_HCR_UIE if all the LRs are in use")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> Found by code inspection while doing bitops work.  I don't even know if
> there's a platform that really has 31 LRs, but the rest of Xen's code is
> written with the expectation that there may be 64.
So, for GICv2 the limit is 64 and for GICv3 the limit is 16. This made me realize we need to
fix the mask for GICv3 (ICH_VTR_NRLRGS) from 0x3f to 0xf. I'll send a patch.

> ---
>  xen/arch/arm/gic-vgic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 9aa245a36d98..3f14aab2efc7 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -16,7 +16,8 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> 
> -#define lr_all_full() (this_cpu(lr_mask) == ((1 << gic_get_nr_lrs()) - 1))
> +#define lr_all_full()                                           \
> +    (this_cpu(lr_mask) == (-1ULL >> (64 - gic_get_nr_lrs())))
> 
>  #undef GIC_DEBUG
> 
> --
> 2.39.2
> 

~Michal

