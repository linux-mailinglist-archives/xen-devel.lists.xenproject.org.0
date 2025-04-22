Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAAA977B0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963594.1354558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KLy-0006Lu-AM; Tue, 22 Apr 2025 20:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963594.1354558; Tue, 22 Apr 2025 20:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KLy-0006K4-7H; Tue, 22 Apr 2025 20:36:26 +0000
Received: by outflank-mailman (input) for mailman id 963594;
 Tue, 22 Apr 2025 20:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mlhl=XI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7KLw-0006Ju-5x
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:36:24 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2406::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 733bd911-1fb9-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:36:21 +0200 (CEST)
Received: from MN2PR15CA0058.namprd15.prod.outlook.com (2603:10b6:208:237::27)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 20:36:15 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::dd) by MN2PR15CA0058.outlook.office365.com
 (2603:10b6:208:237::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 20:36:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 20:36:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 15:36:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 15:36:14 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Apr 2025 15:36:13 -0500
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
X-Inumbo-ID: 733bd911-1fb9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHzXARSI4O/Vott8ctBucqHfvJJNzSXzhIwoU5vPWZWlo4/4iEiMqexxhUvbzu5H9FzjyuAi9MBrx3RnqPV6XfKq8lt4InAbY6Z4/k5+BF10gnbvlPpAMmFoqUlz9/Ua5n7Wmo1dbgct3/Dz4tl5nNGMyGMSn4sO3NecMs5BMbn1ewCyUnvKSoRHD/Q0KDjwv7mIo6Y1j6pOPEsiT3Hbb3pYk+OnyeUoklmg6WAjiF5ud+V/RzmlOXiZu1FXSl/NQA2JtAdV4ugZrSKedS2gsFbLAXTZVPLvCUMEdc09K9sWrwYNMi3qsFr95mdiqhVkQPs9lLIXo72HOqdNidu39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oXO5QoTi8r8Dw8E3bAp/gKVmnB2ON8qNU9lNTLxzRQ=;
 b=e8RWv3TWkuwmOhbHFBi4L6XhAF9Wqfd4Gr+jyKH2jZjOEv5ASfgKIJb8PxCYYKXZamSi9MhOtNuuxJSNfmmGhB037xPnNkbLjlZ2+pU+t49+P96XRq77BmOo5igIXwSJnaxO8Ixn2Bwbuhx4OA7jTKd0LsbjVCWrFUIQS0lvCp7UWugGYsM/D9rLCpcV766BM5BgyxMfzCzZPFfwkREg4Ij/ja3RtSSTFXHVTchNcel7hB6/w0LxCVdeLKPR1Qk6zEoX5uK10i//oN+yUhO1dtzzHOpo80S+c97OTAN6me8BFMJWzzq+Y6LWiKYZCulOBmwl8N2Q03yT6X71olB/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oXO5QoTi8r8Dw8E3bAp/gKVmnB2ON8qNU9lNTLxzRQ=;
 b=U4tQmTz9meWh43MTckpVYZo0oYd3dcoR60gZ3bCkdp/zrTrV/i9FALIdCTTeGHvki3XeXt6qMW0ZlEoGEk9N1eLng/128qzbQXhC+JporS3TCVas+d8fTo72TIdkHb1FUDgh511T6mWS4gOHu89r41MpwMQLcFP0fEUBLHZKhg8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b3069950-ac03-4603-866c-27c6166bfecf@amd.com>
Date: Tue, 22 Apr 2025 16:36:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/38] x86/hyperlaunch: convert max vcpu determination to
 domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <agarciav@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250419220820.4234-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a42faa3-c3eb-4b6a-ee9e-08dd81dd53d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFFnbmxuelBkbEdSWHZ2WmlGbnJXVTFyS083a0tkejBxQ0MrWTU0dE1wbkFD?=
 =?utf-8?B?K3pjNUQ2UWtYQkZLaWZaaTFDTVp0ZUVLaGt2Uk83b0tTSGxoKy9XV09Vekdl?=
 =?utf-8?B?eUEySnV3UDFKS1lMZW5Ya0dsazZJZ3FPZ1h2RFdReXY0VFNnUnMxTFBpc3VD?=
 =?utf-8?B?aDlYaWZNb1VDQ0lUOTc4R0NyZVhhQjlMbTgrMDBTU215QXZBbzRBelNGM3dL?=
 =?utf-8?B?RnA3Q2xIcjNONHF6Z3c1dVQrWlFGa29OemVsMDVudytBVjJZRFh4Q3JBRTVo?=
 =?utf-8?B?dXJTdEVXcVg1a0M1cGVueTRFSlIvbWZYeEhoL1VYUzkxSVRZc25tY1h2QlNz?=
 =?utf-8?B?STd0WlcrbFFJaG1LSndVT1FOK3NSSG96d0ZZUE5LbU85QmpIa0FIa1hDQWFj?=
 =?utf-8?B?NHY3NHdrU2ZtQTgybWZDQ1BtcWNhSnZBTWpnanRrOFFLejJiM1h4WmVJVVR6?=
 =?utf-8?B?MER1U3I1dUFtdHpLZGJtNjFKRHlua0dtenkweksraUFtTGtaMjArbG45YXFF?=
 =?utf-8?B?eFFXV2JqVTZBMUJzMEx1dEl4VlF0MTlyQkxxamFMN0NUY0JSYWF1aUhsVXk5?=
 =?utf-8?B?cnl3VkZ0WXRzUjBqMTROYjNEclBDUUd3bzVPS2NSSFVHUmp4cWFoMTIxdEdp?=
 =?utf-8?B?TGFmUnAyQWdOUmpMNXBnUGZGMjZXZlBJUzhPZnd5d0lpRE9kRFN2MTdiNFd4?=
 =?utf-8?B?eGpYVmJIWWI5QkFLVW5NNDM5bXI4Zlk2SlYrcmd3R3dvRm5JQ2hrbVEwRHBV?=
 =?utf-8?B?NSt6NHN6L3pUVTRvQnVRMTFMd1RHOUdQMkpCYnYwMkNCdUlhcWIyYVExRmIx?=
 =?utf-8?B?N00yQ2xVM3ZzVmpkbU9MOCt3c2ptQ0RZTHZFK2kxQW42WDNHL01JNHRSZ3Jn?=
 =?utf-8?B?Uitja0hlclJMRWFhbVRBMGRrYmQzTXhoVTgrVTYvZlBueFFLYVlGcVJLRStS?=
 =?utf-8?B?RmV5aStQMXN2T1pjWUxBVU9ZcVRkeUZDUkd0UTJ5S0JibTl4T0sxdCtJMmpC?=
 =?utf-8?B?eEduZmxEeVRMQmwvRmdGMWIzUk5WbkhFUVJuWGt4T1Fya3pXd1pVOGlIMWZB?=
 =?utf-8?B?NFdEMjVEK1hnNlZ0WVowNXlOelMrV01waXA4RzBDdGFLM2hkajVCbXNJakZG?=
 =?utf-8?B?b2UzeEVnc0NCUkZrazRadzRseGZrZFVtMEpZcWQwWms5UzJnc1FHTkp6ZFB5?=
 =?utf-8?B?MEJPVGZ0TDU3eXNCbVpMRGovTzhvK01LRFlYZGVzNEJKcFc1ZnBkN3k0WDJK?=
 =?utf-8?B?cTN6V214bnQ3dnloSi9EcEFXUHYwWUplZGIxTHhMYmJJQnNPWkErWmdFckZ2?=
 =?utf-8?B?bnoyVmxWNnh4VTB0YXBoNHREZDRid3p1NGdWeWM2N3JCWlorRnBvM2ttZTdr?=
 =?utf-8?B?cEVtaUdpOWQ1SlhHNUtBTGc0L2dUMGxDQXViMzVjWWd1ZGdHdHBxRzdyVytN?=
 =?utf-8?B?MFcvNUZLN1JUM01ZTlJvZVE1ZGlVWkFuUHNNbWgvb0xSdzQ3ZElwMnlOUVhm?=
 =?utf-8?B?eEFhODJhNGF4RmFQamhtWmFTaWRSbTNNUmRkY1ZmNmE0NTdwaWdNRkFvWEhU?=
 =?utf-8?B?N1FNV3FJSHFHUERxZnlCM2xYQzhmSXN1ekcrcmpQZWphOFM5TC8zU3UvSUZS?=
 =?utf-8?B?cHR1WU5UcXZyLzZRV1lpbGZXZ3U1ZEVxUytoNm5FT1ZFOVVCamtTcFNXakNh?=
 =?utf-8?B?dUhKVWd1bW51OXltcHVlSlpleEhiVTIzV1YwOWhacnpIVHlkdTlUdHZMcURm?=
 =?utf-8?B?dGEwTnFtaFZscWhBTllCVTFuMUNScllGNWV2OVJsSGQvUWorTjUwa3d6UDFW?=
 =?utf-8?B?OU5WRitFWWlqekxoaEUyTG51R0tqcVczb3lkM1hDMkh1ZzA3NGFESGMzTllZ?=
 =?utf-8?B?K1VnRTE1b01aZENqbElUYmtWbi9XSTQwVWVnWUYwV0lXdmZGdVdkK1Vwb1JV?=
 =?utf-8?B?L0FIeXU2SEk3czN6WWlCdXI4eHVJbnNCYWNqdDdiYkNZajh0NjhqK2twZlcz?=
 =?utf-8?B?ZWZUQ0Q2ay8zMkhnOGhxaXFVZVA0UGhwN2NPd3ZBM3dETCtDU0lZZXFOYThH?=
 =?utf-8?Q?xrs8qH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 20:36:15.0228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a42faa3-c3eb-4b6a-ee9e-08dd81dd53d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

On 2025-04-19 18:07, Daniel P. Smith wrote:
> The domain configuration may request more vcpus than are present in the system.
> For dom0, the function dom0_max_vcpus() was used to clamp down to physically
> available vcpus. Here we are introducing a generalized version,
> dom_max_vcpus(), that takes a boot domain and sets the max vcpus based on the
> lesser of the requested max and the available vcpus.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
> new file mode 100644
> index 000000000000..f2277b9e3cf3
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/domain.c
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/domain.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <asm/bootinfo.h>
> +
> +unsigned int __init dom_max_vcpus(struct boot_domain *bd)
> +{
> +    unsigned int limit = bd->mode & BUILD_MODE_PARAVIRT ?
> +                                    MAX_VIRT_CPUS : HVM_MAX_VCPUS;
> +
> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )

I added xen/include/public/bootfdt.h with DOMAIN_CAPS_CONTROL and the 
other capabilities to provide common values.

> +        limit = dom0_max_vcpus();

dom0_max_vcpus() applies Xen's dom0_max_vcpus command line option.  That 
is desirable for a traditional dom0.  For a disaggregated, Hyperlaunch 
system, I'm not sure it's appropriate.  Considering there can multiple 
control domains, it's more questionable.

Might it be better to only apply Xen "dom0" command line options to 
non-hyperlaunch dom0?  Or a domain with all of 
BUILD_CAPS_CONTROL/HARDWARE/XENSTORE?

I guess it could stay as-is, but it seems unusual.

Regards,
Jason

