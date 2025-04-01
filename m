Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD714A781D6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 20:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934734.1336351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzfvz-00086D-Ky; Tue, 01 Apr 2025 18:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934734.1336351; Tue, 01 Apr 2025 18:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzfvz-00083P-Ho; Tue, 01 Apr 2025 18:01:59 +0000
Received: by outflank-mailman (input) for mailman id 934734;
 Tue, 01 Apr 2025 18:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neKF=WT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzfvy-00083J-II
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 18:01:58 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2406::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 653ef51b-0f23-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 20:01:55 +0200 (CEST)
Received: from DS7PR03CA0108.namprd03.prod.outlook.com (2603:10b6:5:3b7::23)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 18:01:51 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::67) by DS7PR03CA0108.outlook.office365.com
 (2603:10b6:5:3b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.52 via Frontend Transport; Tue,
 1 Apr 2025 18:01:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 18:01:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 13:01:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 13:01:49 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 13:01:48 -0500
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
X-Inumbo-ID: 653ef51b-0f23-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCq2gELE980tJ+f0E4LjlYC7neh5rWxDnE5AqcId/oPOjCYWLAreIss5m3jJIK6j7JcprfDMD/oJCqRsQU3E8iFTGpI1hWTub6NhWDS+ARhvi2sTWwQJDD2NaykIuUKOSuJhTjeTHfv1YPt+w8OfI7orUkT7YxWM+Er8B9Mx87PBoMtoRYka5ygAkP878UzEPrPtlUIX5g3PwspbSe4MB8I00hOTFM+a3wKaV9RQAZ6yTS6MsVH19mlsLts90XrgX96XT211UhKeAG4rSV67smv1Wn806REhGjFqRaWTEBkp1xXtnEl8ifzZc2y0dBlZl3gcc3dKokmFdodUGNwuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcUKqZsSMSarP+4zvxYFVt9m2aIJjAWdVhCQvDV839Q=;
 b=rSjJ/7v3RZox32meY0q9UXTz0jOZUkkIV8K9P3gSDIfmLulZMsMXvsRuCOISFXOl3VV3ANKjwBsqeUy28EGRjqgzIXsNy/0EdMvWgY/3/ioVxXf1ObWrcwnqgR/+PHgsTgn6hm9csBhk0heEDwhF29l45tfE9sesq/0qR9dNibdtkam34N4S9c20JfHfDe0eLZOe+jXHCOsZlzJlKKaKC8DBTfIVyEniws55yiG1M9+2THu9QQaiwOA144Fwso2f2PqfKOlDsN9L93sLUj1+H7Nm84HZgOBVTvLUzcMaA+89YlRgHCK8n0P9m14xRGY2k0XsAjRZVbgbB3kJM8G1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcUKqZsSMSarP+4zvxYFVt9m2aIJjAWdVhCQvDV839Q=;
 b=oBxbHo/7gWgBVWEY2SfIJjsGDoxZZzsmEDrSr9jOtINnAoUwP3f9byO4/PQg1u/97DMi2rMc29cdqFYsbmK9Lh13LLn+Y0Wvw8srKImZ+vnXK0Jkk7kdkkrAzYM5NKysmTvj2jlChnOeY9zLD1/6lBVxCXStvY9TfAs6kXkyHGA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <847a0afa-05bd-4f33-b07c-d9d69b9198ae@amd.com>
Date: Tue, 1 Apr 2025 14:01:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
	<Alejandro.GarciaVallejo@amd.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
 <004b066a-b26f-44bd-994f-5c573f6511e6@suse.com>
Content-Language: en-US
In-Reply-To: <004b066a-b26f-44bd-994f-5c573f6511e6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|BL4PR12MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: e97c8388-4dfd-4d09-064b-08dd7147469c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXZySU9uWUtaNHl5M3NWbE5JT2tKNktWWFViRWZCazlzN3ltWXJpLzNRVDhG?=
 =?utf-8?B?RUJ3bXlCTjlVUS9JaVdUTkxuMjh2RUcrMXNyd0VhV3VDSE5BMmliQ2R5V0Y5?=
 =?utf-8?B?Zjg1cXpoM0hRZi9FT0NSMFV3RUdmWFdnemkzUXFrRmNucUZLTGw0QzJHbEUx?=
 =?utf-8?B?QjhScnQrSnhDc0ZDd2xQS3o1ZUFGdjNVSFlYRUQ4SUR1aGgyejg0Vm5JS0Zp?=
 =?utf-8?B?aWZUdkorZmdkVTBrc1hSR09UWUJIcjdwNUVsTkxsaXhSdGozM0RheFZSeStr?=
 =?utf-8?B?cUV3VEk5akZNVnlaa2kycC9mMURWSzZFMCtjTU5xOFhHYWUvOTNCU0d5blk5?=
 =?utf-8?B?am5ETEpQTTBpRWFVVzREV1B5R28xTzZkREZlemJjMnAzYjhNQisxb1gwcUdS?=
 =?utf-8?B?ZHZQQTYyVW9hL3Z1Y2xuL2ZPUVc3aXAxcVR6clVDa2wva21IeGRaZUhkQllP?=
 =?utf-8?B?dHZHckhxcGM2WVVCWFZOc0s4ZDdCVUZsZE5VOHN1WGxNMUgyeU5GZFlGMkRs?=
 =?utf-8?B?S2RxbEhKU1JHQWpyRGQwOStnWnpkRHQydTNkcythbTIxdFplcEZTWmh0MVBX?=
 =?utf-8?B?QUROaVBmTGU0ZDRPWk9YWXdtSXhvNFpMYTRXL3BEYkNjWDR6am5BbDl2am1u?=
 =?utf-8?B?UjNvV0RRd2U0b2dyTkt1Y2hRSlNVblcvOWtncHFkTHRqOGhubDNOdERMZTdH?=
 =?utf-8?B?OWVaeS9BOTliTHVIVnp2akhqTzlvOW9manhEUlRCM0hmalFCa1FlTy9IYTBV?=
 =?utf-8?B?Zys0ZkNtRVJGc0hpbE5URllCejFEM3Joc256VHh6bHpZWUdCdWtleFNGalBD?=
 =?utf-8?B?MWRGeWV1alA5TzR6WHZyYXpva3ZGNmp5T0VuSy81UEFDV0NnaG1ZS3JTbnRq?=
 =?utf-8?B?ZHJ6ZXlrc2tKeHJWd21RalZOYU5hcWVHQ0xlWUQybmxpYXlIeGRsVTBFMVZq?=
 =?utf-8?B?ZkZjRkx3UUVDdnJTc2t5bWNIazRsMkFXRjF5S0NXSGlZRDZpT28zN24rT3BO?=
 =?utf-8?B?THc3M0htQXl4WDZWZkxhM3lrNnlMN3BtRXR3cmI1ZUxHc1kvdVY1M0ticDJQ?=
 =?utf-8?B?T3plSzE5U2dmSElPOGdKOU5sM2ZlS0dWTmJ6MlNNeURDNEVHYWVZckhNOU1z?=
 =?utf-8?B?eEQ0YUl1ZnFtYTZONkJBM2c5YU5rWm9KZW1kaCtnL1RuZkZkQW5kR0lyVHRQ?=
 =?utf-8?B?YytJOUFtVEI0UXExTUN5U2NyZHVZYittWjI3RmRmbGlTdmx5QXNHdDdheHBw?=
 =?utf-8?B?LzRabHVzbEJJT2tCUWJZeEgzRi9qSlFQMGExOCtIVENLak96dzNCaDBENWZF?=
 =?utf-8?B?TlVCZ0txQWxRRlY0YkJsbzVGK3NsYk4rbU8xTUl2WTRqNTU4WFExNmgvVlo2?=
 =?utf-8?B?SUhXQzJtcGo3dXpVeFE4WnpLMTEveWljaisydWp6aGNCRUJyOXAvV2JyM2dn?=
 =?utf-8?B?cWZJRmZmeGN3QnhsTUZuMUtaUXp3NG9rYTdJQ0txcmtQN3k2N1Z1bllrMVly?=
 =?utf-8?B?Mm8vRjR5ZGg2ZTdSa3YzU3lSazI3T2FHSEhQQThOaXVlUmdYNWFvWE9UUVZa?=
 =?utf-8?B?czBubkVqRkJBR3dmcU9wMjhwa25mQUJqZGpZdkt1TVBwa1RTSmdBNkxxeW5R?=
 =?utf-8?B?QmJDU1hJVnJyQm9RNnc1LzZpbEFSUS9BNDgyNFhIMEZ5WFFhc0w4WnVYWUZl?=
 =?utf-8?B?T1dCUDF1ODNEYmQ4dHRkYWFYU1Y5OHQxQlN2OWtQRWxTSEx0Nnk3WWlsQ2hY?=
 =?utf-8?B?UnFIUGRTOFB3NUEvZVlrZUorRi9kdWx3NmJYaDVndXRZdU05ZlhnSWdudHJO?=
 =?utf-8?B?U0x6OGxNNCtJdVg2RGo5MUdMNE80MzNxS2EvNnlzQlg2V2cxT1p2MjU3Mlh2?=
 =?utf-8?B?Sk5MME8xR0RiR1VhUHFXK2Q0a3U2Qk9RUjhjNlR4WVZuUTg5eVJnUms0aU5I?=
 =?utf-8?B?aWpmUzRqWWQzcDRTWUNJcFRrRnZPZ2tONzJhNGo5YktvR3NScE82UEo2d0Fq?=
 =?utf-8?Q?ZwoG9ERCuf0bvVW3aBJ5GlsdEbPaPA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 18:01:49.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97c8388-4dfd-4d09-064b-08dd7147469c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477

On 2025-01-30 09:52, Jan Beulich wrote:
> On 26.12.2024 17:57, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>>   obj-y += sysctl.o
>>   endif
>>   
>> +obj-y += domain-builder/
> 
> The set of subdirs needed in $(obj-y) is specified at the top of the file.
> Also shouldn't this be obj-$(CONFIG_DOMAIN_BUILDER)?

Later, all boot-time domain building is handled by 
domain-builder/core.c.  So some of domain-builder/ is always built, and 
Kconfig disables multidomain support.

>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +#include <xen/err.h>
>> +#include <xen/init.h>
>> +#include <xen/kconfig.h>
>> +#include <xen/lib.h>
>> +
>> +#include <asm/bootinfo.h>
>> +
>> +#include "fdt.h"
>> +
>> +void __init builder_init(struct boot_info *bi)
>> +{
>> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>> +    {
>> +        int ret;
>> +
>> +        switch ( ret = has_hyperlaunch_fdt(bi) )
>> +        {
>> +        case 0:
>> +            printk("Hyperlaunch device tree detected\n");
>> +            bi->hyperlaunch_enabled = true;
>> +            bi->mods[0].type = BOOTMOD_FDT;
>> +            break;
>> +
>> +        case -EINVAL:
>> +            printk("Hyperlaunch device tree was not detected\n");
>> +            bi->hyperlaunch_enabled = false;
>> +            break;
>> +
>> +        case -ENOENT:
>> +        case -ENODATA:
>> +            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
>> +            bi->hyperlaunch_enabled = false;
>> +            bi->mods[0].type = BOOTMOD_FDT;
>> +            break;
>> +
>> +        default:
>> +            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
>> +                   ret);
>> +            bi->hyperlaunch_enabled = false;
>> +            break;
>> +        }
>> +    }
>> +}
> 
> What is it that's x86-specific in here?

Would you prefer xen/common/domain-builder ?

>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/fdt.c

>> +{
>> +    int ret = 0;
>> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>> +
>> +    if ( fdt_check_header(fdt) < 0 )
>> +        ret = -EINVAL;
>> +
>> +    bootstrap_unmap();
>> +
>> +    return ret;
>> +}
> 
> Is this function intended to later be extended? Aiui anything fitting
> the hyperlaunch-agnostic fdt_check_header() will do here, despite the
> name of the function.

Eventually, there will be some checking to ensure that the DT actually 
contains hyperlaunch device nodes.

> And again - what is it that's x86-specific in here?


>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/domainbuilder.h
>> @@ -0,0 +1,8 @@
>> +#ifndef __XEN_X86_DOMBUILDER_H__
>> +#define __XEN_X86_DOMBUILDER_H__
>> +
>> +#include <asm/bootinfo.h>
> 
> ... here, is it? Forward decls of struct boot_info are going to do.

Generally, if you only need a type, just use a forward decl?  Use an 
include when you need function prototypes?

>> @@ -1285,9 +1286,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>                  bi->nr_modules);
>>       }
>>   
>> -    /* Dom0 kernel is always first */
>> -    bi->mods[0].type = BOOTMOD_KERNEL;
>> -    bi->domains[0].kernel = &bi->mods[0];
>> +    builder_init(bi);
>> +
>> +    /* Find first unknown boot module to use as Dom0 kernel */
>> +    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> +    bi->mods[i].type = BOOTMOD_KERNEL;
>> +    bi->domains[0].kernel = &bi->mods[i];
> 
> This is going to change again later? Or else what about there already
> being a module marked BOOTMOD_KERNEL?

Yes, it will change.  There will be two paths, and this is part of the 
non-Hyperlaunch path which needs to implicitly select kernel and initrd 
from the module order, the same as today.  For hyperlaunch, the device 
tree explicitly assigns kernel and initrd.

Regards,
Jason

