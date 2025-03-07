Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8AA56E07
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905202.1313053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqakp-00073h-9m; Fri, 07 Mar 2025 16:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905202.1313053; Fri, 07 Mar 2025 16:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqakp-00071y-68; Fri, 07 Mar 2025 16:40:55 +0000
Received: by outflank-mailman (input) for mailman id 905202;
 Fri, 07 Mar 2025 16:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqakn-00071s-Rd
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:40:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2418::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed10d559-fb72-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 17:40:51 +0100 (CET)
Received: from SA9PR03CA0011.namprd03.prod.outlook.com (2603:10b6:806:20::16)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 16:40:43 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::57) by SA9PR03CA0011.outlook.office365.com
 (2603:10b6:806:20::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 16:40:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 16:40:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 10:40:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 10:40:41 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 10:40:40 -0600
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
X-Inumbo-ID: ed10d559-fb72-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/QXtssOreN/LRNakkEC7rIpJ0WvbAopa/5qTg4C2HKISyecEut/DY2BBjZRC3vsGK2RmocZHyRraWPjRom2Q9gqod16n86LudAvhbJjSLRXFF4mOgZ0raw0Qcx5kOLhjCMM7uFthwo1UDiQ69VDp1jBHKjCDNzn8vLzPmH7IjuIQg3UmS9zal0TmWWGV3+3Kiyx/9UdRpekMA9Sz/3ko3ts/RkF8EPq6ltgaeJTbDT3bLsrku5J8GzrVypLIG25ID3e0rhLj/I7U+L0k863qK0C7Ng/lZJ/AxsZtk0JX6B3Ku8BG/PRigr2LpULW6YjD6Eiy+UK8fXIO77dcfpVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1Kyp1GjSs0giE7LMIyGsT/22R8Oz254Jiq7SGMmfhc=;
 b=kFe68GwIekL+4gFVgkTpRtFgH9ZcEdjLAacoJvOk48fyxRRudKACNGHfpYfIRZxSVCLsPhakoMOf5PIfazgYwhi+f4D3L2fL17s0T3TJGyBZQti1uf1+7jWLP5nRl9q7bHkReOPol59wOMwaL7+ZFxkfJTbZiIPnsQruOGUlvYdbfYaYhaCZuVITmlCYL5K40mCczUi253H7ap1U/947wLNytWAYEG+RKhknbg18XU67yvWN8rtm10C5o/SGLlcpb+iGebFczhOajdp3l2sXyUPcxCtmGgH7EP7Tc3kc0mYdr69yPW/4hyzffyBw+FsIpo4X9vICH2LbKGn4uwCCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Kyp1GjSs0giE7LMIyGsT/22R8Oz254Jiq7SGMmfhc=;
 b=QYZH1t00Dy9hiTarnTxY158ptdn8KFez1vI2xf2o2mEGpOUHC3Fzmyb8Y29Cr5BiFAoAHm028gKu71xLaRbLoHheltWMQOLDbZt3PIdCoETyFQeFI4rbCtA4iWJ3P1EMWXXVqk4wK9vldPDjjL9NOoBpXHMAncAZjumUOmb/bJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a8cf06d-4e2e-4d42-baa9-21cc6bf1f863@amd.com>
Date: Fri, 7 Mar 2025 11:40:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2503061738430.2600338@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2503061738430.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c01eb73-1a76-4a36-f72a-08dd5d96cd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEtrOXltK3ZYaGpDVStnYTV1QUZ0NVl1RGtWaGp4SFYyV3FMTTE2RHA5MkRY?=
 =?utf-8?B?N1BHaytlZWtsblI5SlBNT09tVFQvZlk3bmxhNldYMzREcEswczFCdTd5Ympu?=
 =?utf-8?B?Q0N5K0pLUkwyN3YzY0w2ZDhVV1RucXNFRk9Wd2RDUVVJNG5PVUplL3E4ZitH?=
 =?utf-8?B?VDR3ZURhbktIZU1MbHV6R2hVYmVPek16ZjM0TlZPNXFDTDVrbVhhdFdIUU15?=
 =?utf-8?B?WlYxbUt0ZGRzZU5ZVHRoOUoxSE92emcwVlVFbkUybWtEa0duSjNubElFWlFS?=
 =?utf-8?B?Q2trVGRvcU4rdzNUZU9jSHZ5L01oeHJsLzMvNUxEV21UcjR3b3NiNkVuSE02?=
 =?utf-8?B?VlBOZXdzOWxDMmIxZFRFLzdMeWpMSlhIN0hxVzVNSjNkMHA4VTFoak9rNCtZ?=
 =?utf-8?B?dytycmdtbm5tODZLaTRxM3ZlYzJDcFExWFlLcmhoeWFpNnlYTUhWb2lPUVAr?=
 =?utf-8?B?bW40MWVHeFNrcjVxVk9vdEx5OHRDZUZoR2ZLRVBTY0Y0U0NVQmYvN0RVOVhD?=
 =?utf-8?B?VmJvcHVSKzhNdHlBSlBGVG10eEh0UkhuTys1bHNoNHRJeU5KdURjMUF2ZmdV?=
 =?utf-8?B?V1k2SkRzVEpZWTY4ZmJTbDcrTGlEMDB1RkJmdlF0Mm5VUnR5RE4weHRmUk9M?=
 =?utf-8?B?ZE1ZRXZLTnROcjFkQ2xtZjBlRFBHQXYxdTFnN0N5Q3Qra1BzZzdUeU5TYU1B?=
 =?utf-8?B?cUQ4Z0ZGM0Myek9ocmRLMW82Y2c0MTVtQlprQm1Ha3Q5OGZQYjY0NExHa1lm?=
 =?utf-8?B?czJJbzdxRzBsNDNmL2o5bmlHQ25oNXU4OUd1ZHdJZkRKTFZXR21ybEJDbG1G?=
 =?utf-8?B?UE9xeWFEL0NObE40SzRnaHpNOVBVUnhOUkZLL3V6bW5xRWtQbDNSQ05mWDIy?=
 =?utf-8?B?ZHZkOWN4UEp6OXI0bWFxN0owWndoMmhYR2psWFVFclVZTytOT0p5M2tGSEwx?=
 =?utf-8?B?VVVIclBteEU2ZnJoQ2pVUmx2UlhQb3ZlK0hnVlZYa1h0aE9NNEhEVzF3dE5n?=
 =?utf-8?B?ZDlqTlQwTnEyNTNxV2hGOXVpcWYxbXNrM2lrL3NGOWRJRDNBZkdVd20xVjBS?=
 =?utf-8?B?eXhXdWxuUFhkWVhUK3Y5OW4vczNnZmwyajY0NDZjaDN2MC9yMlIycjUzakQ3?=
 =?utf-8?B?NzkzZ2FsM0ZGbC9rNVptaWJBMWNqTHV4MWJ1N1VlYi85VGxoWXNGVzdBbEtK?=
 =?utf-8?B?WVoyMmdCZEdqbXdQRDZmSkF6NDJzeEVKTlpJNWRabEN5OEFSTiswV0s1VXR4?=
 =?utf-8?B?UExza3dSYkh3bHJSRmpycTJTUHE3dlBPT2ZtaWNaUHg2d2ZWUUZ3OTZSakVH?=
 =?utf-8?B?M3ZNS0dyQlBIMFIvdWc1aDhwTlU5N2NSS3psWkJ6WVhHYkJsc3JKMUFnaFR1?=
 =?utf-8?B?bERSRjNoYTBtb0RWSHA4cnB4QmNySTJyYXY1cHh0TUQ3MDBLQUZHVkltQ002?=
 =?utf-8?B?QkxNQ01waldLcG5UeE1iQVZWOEovUEdLY2hYWHhhQ2V1Zi9Dby81ZFJIb2lJ?=
 =?utf-8?B?dVpJT1RHaTh0VUZWN3dyajlRQTFBdjZqOUVkblBqKzUzWWs3ekVkUkxnZ0pm?=
 =?utf-8?B?TEV3TzhtRHlBY2UzRWhFRlBWQXhaU0ZKOW1yajljbEE3NVhSK0EzRmlxL1Zt?=
 =?utf-8?B?Y1RWTnYvM094bllyUVF6MFlhMUxmMVhTYlVBK0x4K2h6cXlFMTR4SkdqWHhX?=
 =?utf-8?B?cTBrZ2tsOVJ6TEVMTGJudjJXaCtOS29aQmZyeW5PRnZNOHVRWmdIK1lqLzIx?=
 =?utf-8?B?NUJBRTNuemVMcnB4OFZCOU9lLzRzOXMvMzgyc2VERDh6K2prYXNhdnM1Z3RP?=
 =?utf-8?B?ZGZBRVN6clZRR3dhcTdIS2dqTTcrcFlSQzcvcytid1hmcXg3ZGsvZXRkMzBO?=
 =?utf-8?B?ZXNZSFh0R2M2eHBmYmRLU0RjWnJ3R2xrOHlFUDM4SUJ3RDBZR1NCY0ZWb0dN?=
 =?utf-8?B?dWZLK285TFplb2RGT1VyTXhjV0R0YW1CWEJjM0hBT3lBOFFmR3VUcno2RVNM?=
 =?utf-8?Q?oJcyFEBBo7F3HIS8fg/dJgOohAcN+s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:40:42.9890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c01eb73-1a76-4a36-f72a-08dd5d96cd7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204

On 2025-03-06 20:40, Stefano Stabellini wrote:
> On Thu, 6 Mar 2025, Jason Andryuk wrote:
>> Add capabilities property to dom0less to allow building a
>> disaggregated system.
>>
>> Introduce bootfdt.h to contain these constants.
>>
>> When using the hardware or xenstore capabilities, adjust the grant and
>> event channel limits similar to dom0.
>>
>> Also for the hardware domain, set directmap and iommu.  This brings its
>> configuration in line with a dom0.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> There is overlap with hyperlaunch.  The numeric values are the same.
>> Hyperlaunch doesn't expose the values in a public header as done here.
>> Is this to be expected for dom0less?  It seems most of dom0less isn't in
>> a header, but just in docs.
>>
>> Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
>> domain-level capabilities.
>>
>> Only a single xenstore and hardware domain make sense.  A check to limit
>> to only a single hardware domain is in place - building two breaks.  But
>> nothing prevents the dom0less configuration from only having multiple
>> xenstore domains.  Each xenstore domain would have slightly more
>> permissions, but only the last one would be used.

>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 5a7871939b..068bf99294 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -12,6 +12,7 @@
>>   #include <xen/sizes.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <public/bootfdt.h>
>>   #include <public/io/xs_wire.h>
>>   
>>   #include <asm/arm64/sve.h>
>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>               panic("No more domain IDs available\n");
>>   
>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>> +        {
>> +            if ( val & ~DOMAIN_CAPS_MASK )
>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>> +
>> +            if ( val & DOMAIN_CAPS_CONTROL )
>> +                flags |= CDF_privileged;
>> +
>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>> +            {
>> +                if ( hardware_domain )
>> +                    panic("Only 1 hardware domain can be specified! (%pd)\n",
>> +                           hardware_domain);
>> +
>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>> +                d_cfg.max_evtchn_port = -1;
> 
> max_maptrack_frames = -1 ?

Yes.

> 
>> +                flags |= CDF_hardware;
>> +                flags |= CDF_directmap;
>> +                iommu = true;
>> +            }
>> +
>> +            if ( val & DOMAIN_CAPS_XENSTORE )
>> +            {
>> +                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
> 
> shouldn't we take the opportunity to also set XEN_DOMCTL_CDF_xs_domain
> in xen/arch/arm/domain_build.c:create_dom0 ?

We could.  It isn't normally used except for a standalone xenstore 
domain, which is why I didn't add it.

> 
>> +                d_cfg.max_evtchn_port = -1;
> 
> Why this one?

It mirrors what is done in init-xenstore for a xenstore stubdom.  It's 
to remove the limit so the xenstore domain can create as many as 
necessary for however many domains.

> 
>> +            }
>> +        }
>> +
>>           if ( dt_find_property(node, "xen,static-mem", NULL) )
>>           {
>>               if ( llc_coloring_enabled )

>> diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
>> new file mode 100644
>> index 0000000000..4e87aca8ac
>> --- /dev/null
>> +++ b/xen/include/public/bootfdt.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Xen Device Tree boot information
>> + *
>> + * Information for configuring Xen domains created at boot time.
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_BOOTFDT_H__
>> +#define __XEN_PUBLIC_BOOTFDT_H__
>> +
>> +/* Domain Capabilities specified in the "capabilities" property.  Use of
>> + * this property allows splitting up the monolithic dom0 into separate,
>> + * less privileged components.  A regular domU has no capabilities
>> + * (which is the default if nothing is specified).  A traditional dom0
>> + * has all three capabilities.*/
> 
> The multiline comment coding style is:
> 
> /*
>   * comment
>   * comment
>   */

Ok.

Thanks,
Jason

