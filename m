Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277A64514B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 02:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455747.713306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2jN4-0005wt-Af; Wed, 07 Dec 2022 01:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455747.713306; Wed, 07 Dec 2022 01:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2jN4-0005uq-6T; Wed, 07 Dec 2022 01:37:14 +0000
Received: by outflank-mailman (input) for mailman id 455747;
 Wed, 07 Dec 2022 01:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2jN2-0005uj-JB
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 01:37:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9adcb09-75cf-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 02:37:09 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 01:37:05 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%5]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 01:37:05 +0000
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
X-Inumbo-ID: a9adcb09-75cf-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YokgNHXX1dx8ZQscRevoZ6SHT9DPoulXwKfwQe3RI83y5Oz1fXugouG20FQsQUtIgdZzAzea4EX2H61JhdMgVQ3XbaSsCJ9blm24kfkrYI120nPII5bE14FkJnwAbKm44OwlUx8JJTMs3ffE+tuiUAixbpTsiO9CwDq9ZEeWaa2aFCpmTX0UQnsyn6fGZ6YruVaXdI3938WZ2GIMX0AOcUPh4XFKFPEU0bHPxuehwFkGNIM81cPJW7pKh/nFJPGe7WHz5wgidtgql/KJ3bqfi3dzr08MNsZTsfIMnOD01DwtDGJKQ6jnW0luCPgEAXau5vRRGPls+25NqqwxeJlfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ14V4JqXCjsGSC/COVZ/z+YxdNMJgLT7pqs5qR/zoM=;
 b=Bcs+sG6yECtaDQJjgc0JIJTMg54Fl2CorRIY4Y5QtIxCOfqVLmdIuggRSerK9ciJiHS8/nsT4/dQU3wCrDSO4tn23wKO9/zjCC3xqZN7Mupn2FWKpx/UP/PuOw65tDt79kLR6w1ySLf7q8bZV7+1J/3wWubszHkbAyvJ14p3XV0EHrROy6UAYFssOCBCnEebkJbpTVOEVPIpuoqdnl6CAmozYorFVGJiM2dfgMbXNiN0GYh4oJooZ9U5dPRCoPUWMFxoT3Vm9xdGrIbXywWNdVsaiA4fzhQiyXa4Xxy8kOBL74FsOgjDBgz2wlBwafwkVMsdBZdYIP8vpN0MyBRl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ14V4JqXCjsGSC/COVZ/z+YxdNMJgLT7pqs5qR/zoM=;
 b=lSa2sQuN8r7Obk8syrvTstOmTD+E+1IJEXQwbdfmh/zRXecwRI1UkwKEOEllFc2EWL5PueFOV1jpCFiI33O+QukFMg8Rjzmf8SBaqBYy3IMAMCZYv2kQ92AWk7LKU8tM0W/CKE37DGE33yTpjq/baph+odFE4Qsh2gwsRWa6jfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e5876e70-740c-74ad-f6ef-c6afe955199d@amd.com>
Date: Tue, 6 Dec 2022 17:37:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
From: Vikram Garhwal <vikram.garhwal@amd.com>
Subject: Re: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
To: Julien Grall <julien@xen.org>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-11-fnu.vikram@xilinx.com>
 <f00fa29e-d59a-471a-ef05-4f72787ad8e8@xen.org>
Content-Language: en-US
In-Reply-To: <f00fa29e-d59a-471a-ef05-4f72787ad8e8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 75570588-ce85-4a5f-d98e-08dad7f38c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/L4X1mGckU8jWakkEqxTF5eMdJWxUTXACVwPNUXYtCv117QTNHtOMlV7qUcQ47/knktQcGYc4mGK79t8XO8iTIRoj27vYI6niUwbXT5D78VrDXZJXcTIHOIkKv+mZmsXqkjT4J6k5dKJuVFtHh9D+JSqhoCKwSP7EcSvFAP8zAju6KSNmnH3sSRb4JUBAE7xBbQWIiAASR41V+JgUMp6wjq10OmqSqIzr0yyGuBaMz7r6sv/wcZO37TUBL6Pf7AuUKgMqvo+H99C9pBQllebUtxWWw0290NApkzggFuTVuZ9lxddF6jH+6eIPH510whiA7r4husNxssmY0G0hAJt60w9EMznVaf6AO5bfvgLnObhwKqFQAzHaACQsl8UTAX1Db4Jry+lIYpbDM1Aasf6g6OgT1y3W/ERVScZ5T0stXxwjyN4r5OxoiHmPBwsLvx4TxZw8J2BWwahnB3QRN4qusQM0gTx09O9tuNCqHO6vRcXJ2QSHfkSyKLTXJy7fhHH/T84C+YX/Hxh1JZ/2vmHAEFm2DSmPnVgPpxYLoXvZ20qq8xJc9X+dqMGW+pFJ8dhcwCIQmvTtFNdvxHrAvr5BE97kGqVSTTrGThCoIrzarjal4gsQqm+MmdTDWNB14H1KrbvZTZG5HJ0Ubh+fK8sKXX9oEaj9omxmPdX/L+kyObVwk35YR09M+XLpZ1nL144WZpWT97zdYTUquUGsjogpCENw96KGmKZTZe1JPdcCYI53Tm9LsS+deucnsV42Sau7a6TmPiemXGFyrsyCjFxPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(83380400001)(36756003)(86362001)(31696002)(53546011)(6506007)(6486002)(478600001)(66946007)(26005)(44832011)(316002)(54906003)(8936002)(5660300002)(41300700001)(6666004)(4326008)(2906002)(6512007)(8676002)(110136005)(30864003)(66556008)(66476007)(38100700002)(2616005)(186003)(31686004)(403724002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2l5eHQ0V2s5aEFGR0ptUFRPaDNuYWFvUzNSdFZMZlRJV1Y4WEUrQ24zazBL?=
 =?utf-8?B?QzRScGxMdXhaaVhSY0tSRmk0QzVqYTl4VWY2RDBvbWV6d0lqUGVUV0Nwc0Vj?=
 =?utf-8?B?aUJSWXVCcHdyOUp3dmdEZk5IU3VQd3Z0S0tqY2FqWjRqbkdaOUpBaHk5UFY4?=
 =?utf-8?B?aUQzbjV3Vmlxb0l5OXI4czNkbDkrQmdzc2VQdTc4RmlScXliK1JyLzBQejlQ?=
 =?utf-8?B?OXZlOTZsOHI3NVlrQlBwYXRONXF5ZE8zSjRLbE10Qlo5VGhvRnFCUmc0MDVE?=
 =?utf-8?B?WHVnd0krckN0QnBRclNRMVpCSGJMWFB6bUN4TDVYdU1vZDIvMnRRUmtjdHRI?=
 =?utf-8?B?KzloSjk4bmp2L3B6dklSd1lIelliM0hMYXJyakZYTWszeElNelVNMVFtV2RJ?=
 =?utf-8?B?d2ttQ3AxeW9LMUJoK3NuTnJpTUxraThhYXpvQzNXWVA0UnBheloyNXNqaGJj?=
 =?utf-8?B?M0cvQk9WUUFFdGwrS0dVTllUbVJmeE43OXhrN0tNcHk3VkMxR1B5UDB4a2po?=
 =?utf-8?B?Tzh0S0wrN2V5V2ZNU0dUa3dQUk9SWnFEOE5lUUt3VVV0QlJmWFp4b2gyeHZ4?=
 =?utf-8?B?L1JWQW1CZjB6NVc5Q3NPM3FmVG5iQ2RhMzFxRm96Z2VwbEgzZ3pnMmp3T1Z3?=
 =?utf-8?B?Z3FZZkFBTEliR0RGVjVpQXBabWZSUURzWFBGTmFPQk9URjV6MjhHMWcyOVlU?=
 =?utf-8?B?QUFFRHFrampCT0p1MWE4VkpnSXpNT1RXaFV4WTFGT2g2VDIreWNYU3FQYlhQ?=
 =?utf-8?B?Zk5TeVhRaStPaTdaaWJqNVlNSC9tdjFZdzRXeDUzcXYvNDFDUDEyYjNneXl5?=
 =?utf-8?B?bWZzNDJQeVhDWUZ3TVdkRytCV09nM2wyalBRRnhwaWxoOHpYcnlBRW5YaHRl?=
 =?utf-8?B?cldqSWlndnF4Q0lKdzNUT2NWYlBweFM0QzlDVWFINnBrR1o4QkNOOFdnV090?=
 =?utf-8?B?SkFGdVIzeEFHRVZ6bUhDSEV6MXFaWURQNnR5Y201TlFQRGxCYk1IeUpVdjEr?=
 =?utf-8?B?SkxQN08vS3ZoYllhR1hnM0tibU5JUG9EYSs1bXIwaEE3ajdmQlhrYll1VlpH?=
 =?utf-8?B?SzFWdVR2QzM3UHl2QWdDdCtUYzRvZTdQOXFzdVgrd25MWDVuU1hTczFTR3J5?=
 =?utf-8?B?bHFnMFY2MXdjbGt0ZWNQcTQvYzZQMERWSlFmeDZuOXVJU1BUdlVvOTFoQ1Yr?=
 =?utf-8?B?SWhuc2J1dUd6NXg4RkdtQjArNEFxR3ppbnlYY3ExOGFCc3VOT1krMWVKM2pk?=
 =?utf-8?B?NmR0elMxR3ArTDBtbTlWNTVLVjRhYjkvRm9EdjR1OGFlRjBkcnQrV25GK1Na?=
 =?utf-8?B?cS9RNTlFS1dLZUI5ZDN6UmRWNDhjaXJmOG84TzNLZllpakoxVXVNVWpyd24z?=
 =?utf-8?B?M05CYWM4VXlkTXIyUGNKSEwzQUxUa1U1dVBvKzFJemlMNzR4MFNVNDIvQThU?=
 =?utf-8?B?c25UUU9PMFp2OE94OE9PdFJhcmN6eTgxVEo2b3RJcCt4eC9FZE5Jb2ErR2cx?=
 =?utf-8?B?UjJQVk5MQkY2eWRRZGlVRFo2bmlzcG9KYytrK1c3TnBlOE94Q05KekUwQk5L?=
 =?utf-8?B?a1Urb0M4M2x4YVJVZXFsNnJqZjg0ZWowSXoyWlpCLzJMdE5oUkN3U0JPTVdS?=
 =?utf-8?B?eWdZL2V1eS9OSVQ0aXN5R3dNNk9reVN1cVNaMnhhSE5kWmRMZVZ3Z054Q01Y?=
 =?utf-8?B?QUtaTGJQRkNlOVZWMjdQNkY5SGtHZjhIbkF4RUplMUk2TVVya0dpSTNEMXcz?=
 =?utf-8?B?L0h3RC9qVzNENWw1a1l5ZmNBU1VsMzBPQ1lFa3VNUlBYMGhwYWpXZ25vL1o0?=
 =?utf-8?B?dVFDVG1xcHVqeUpOY015L3l5bHNCdkVzQllENXZrVk9XcVZ3alZPUHlDYkRu?=
 =?utf-8?B?eklNQW5salZnMEFKTFNQSHVwUVREY2tuNVpwWDBBZmhnQmYxOUhiUHdPZVpX?=
 =?utf-8?B?OTczVUszSGlQTXF0L0JQUzZ2RHBRVElCWFVYMGtoUk5UeDRqRWJ1T2NvSk1s?=
 =?utf-8?B?aTYyZHZod1hCTnpHTEdEVnByTnQrR3BDeXFuQUg1ZVJJc1FMMUFZR2VBQ1RC?=
 =?utf-8?B?VFV1Mk1JUHBOSExpS0FJVDhlbjBycXVpMWpOMS90L3A5M3lwMWNNRytIVTI1?=
 =?utf-8?Q?RKhpxRYC1oivX/VCUnYbpvRB3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75570588-ce85-4a5f-d98e-08dad7f38c04
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 01:37:05.3905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYR6MmceWC+/F4i29AyGU8qJhEpiAs4vS2zWeMPgr+3HjBfaCtA4+dff7o9WtMNF3n03OUq1bhOMnLrf+aJyRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011

Hi Julien & Luca,

Sorry for so long delay on the this patch series. I was stuck with 
internal work and then had to go on a long leave.

I prepared v4 and will send it shortly. Addressed all the feedback. I 
have few comments. Please see them inline below.

On 5/18/22 11:31 AM, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
>
> Hi Vikram,
>
> On 08/03/2022 19:47, Vikram Garhwal wrote:
>> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes 
>> added using
>> device tree overlay.
>>
>> xl overlay remove file.dtbo:
>>      Removes all the nodes in a given dtbo.
>>      First, removes IRQ permissions and MMIO accesses. Next, it finds 
>> the nodes
>>      in dt_host and delete the device node entries from dt_host.
>>
>>      The nodes get removed only if it is not used by any of dom0 or 
>> domio.
>>
>> Also, added overlay_track struct to keep the track of added node 
>> through device
>> tree overlay. overlay_track has dt_host_new which is unflattened form 
>> of updated
>> fdt and name of overlay nodes. When a node is removed, we also free 
>> the memory
>> used by overlay_track for the particular overlay node.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> ---
>>   xen/common/Makefile          |   1 +
>>   xen/common/dt_overlay.c      | 447 +++++++++++++++++++++++++++++++++++
>>   xen/common/sysctl.c          |  10 +
>>   xen/include/public/sysctl.h  |  18 ++
>>   xen/include/xen/dt_overlay.h |  47 ++++
>>   5 files changed, 523 insertions(+)
>>   create mode 100644 xen/common/dt_overlay.c
>>   create mode 100644 xen/include/xen/dt_overlay.h
>>
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index dc8d3a13f5..2eb5734f8e 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -54,6 +54,7 @@ obj-y += wait.o
>>   obj-bin-y += warning.init.o
>>   obj-$(CONFIG_XENOPROF) += xenoprof.o
>>   obj-y += xmalloc_tlsf.o
>> +obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
>>
>>   obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma 
>> lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>>
>> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
>> new file mode 100644
>> index 0000000000..fcb31de495
>> --- /dev/null
>> +++ b/xen/common/dt_overlay.c
>> @@ -0,0 +1,447 @@
>> +/*
>> + * xen/common/dt_overlay.c
>> + *
>> + * Device tree overlay support in Xen.
>> + *
>> + * Copyright (c) 2021 Xilinx Inc.
>> + * Written by Vikram Garhwal <fnu.vikram@xilinx.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms and conditions of the GNU General Public
>> + * License, version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <xen/iocap.h>
>> +#include <xen/xmalloc.h>
>> +#include <asm/domain_build.h>
>> +#include <xen/dt_overlay.h>
>> +#include <xen/guest_access.h>
>> +
>> +static LIST_HEAD(overlay_tracker);
>> +static DEFINE_SPINLOCK(overlay_lock);
>> +
>> +static int dt_overlay_remove_node(struct dt_device_node *device_node)
>> +{
>> +    struct dt_device_node *np;
>> +    struct dt_device_node *parent_node;
>> +    struct dt_device_node *current_node;
>> +
>> +    parent_node = device_node->parent;
>> +
>> +    current_node = parent_node;
>> +
>> +    if ( parent_node == NULL )
>> +    {
>> +        dt_dprintk("%s's parent node not found\n", device_node->name);
>> +        return -EFAULT;
>> +    }
>> +
>> +    np = parent_node->child;
>> +
>> +    if ( np == NULL )
>> +    {
>> +        dt_dprintk("parent node %s's not found\n", parent_node->name);
>> +        return -EFAULT;
>> +    }
>> +
>> +    /* If node to be removed is only child node or first child. */
>> +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
>> +    {
>> +        current_node->allnext = np->allnext;
>
> While reviewing the previous patches, I realized that we have nothing to
> prevent someone to browse the device-tree while it is modified.
>
> I am not sure this can be solved with just refcounting (like Linux
> does). So maybe we need a read-write-lock. I am open to other
> suggestions here.
Added read_locks for all dt_host access funtions.
>> +
>> +        /* If node is first child but not the only child. */
>> +        if ( np->sibling != NULL )
>> +            current_node->child = np->sibling;
>> +        else
>> +            /* If node is only child. */
>> +            current_node->child = NULL;
>
> Those 4 lines can be replaced with one line:
>
> current_node->child = np->sibling;
>
>> +        return 0;
>> +    }
>> +
>> +    for ( np = parent_node->child; np->sibling != NULL; np = 
>> np->sibling )
>> +    {
>> +        current_node = np;
>> +        if ( !dt_node_cmp(np->sibling->full_name, 
>> device_node->full_name) )
>> +        {
>> +            /* Found the node. Now we remove it. */
>> +            current_node->allnext = np->allnext->allnext;
>
> I find this code quite confusing to read. AFAICT, 'np' and
> 'current_node' are exactly the same here. Why do you use different name
> to access it?
>
>> +
>> +            if ( np->sibling->sibling )
>> +                current_node->sibling = np->sibling->sibling;
>> +            else
>> +                current_node->sibling = NULL;
>
> Same here. This could be replaced with:
>
> current_node->child = nb->sibling->sibling;
>
>> +
>> +            break;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Basic sanity check for the dtbo tool stack provided to Xen. */
>> +static int check_overlay_fdt(const void *overlay_fdt, uint32_t 
>> overlay_fdt_size)
>> +{
>> +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
>> +          fdt_check_header(overlay_fdt) )
>> +    {
>> +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat 
>> Device Tree\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static unsigned int overlay_node_count(void *fdto)
>> +{
>> +    unsigned int num_overlay_nodes = 0;
>> +    int fragment;
>> +
>> +    fdt_for_each_subnode(fragment, fdto, 0)
>> +    {
>> +
>> +        int subnode;
>> +        int overlay;
>> +
>> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
>> +
>> +        /*
>> +         * Overlay value can be < 0. But fdt_for_each_subnode() loop 
>> checks for
>> +         * overlay >= 0. So, no need for a overlay>=0 check here.
>> +         */
>> +
>> +        fdt_for_each_subnode(subnode, fdto, overlay)
>> +        {
>> +            num_overlay_nodes++;
>> +        }
>> +    }
>> +
>> +    return num_overlay_nodes;
>> +}
>> +
>> +/*
>> + * overlay_get_nodes_info will get the all node's full name with 
>> path. This is
>> + * useful when checking node for duplication i.e. dtbo tries to add 
>> nodes which
>> + * already exists in device tree.
>> + */
>
> AFAIU the code below will only retrieve one level of nodes. So if you 
> have
>
> foo {
>   bar {
>   }
> }
>
> Only foo will be part of the nodes_full_path. Is it correct?

Added support for adding children nodes too.

>
>
>> +static int overlay_get_nodes_info(const void *fdto, char 
>> ***nodes_full_path,
>> +                                  unsigned int num_overlay_nodes)
>> +{
>> +    int fragment;
>> +    unsigned int node_num = 0;
>> +
>> +    *nodes_full_path = xmalloc_bytes(num_overlay_nodes * sizeof(char 
>> *));
>> +
>> +    if ( *nodes_full_path == NULL )
>> +        return -ENOMEM;
>> +    memset(*nodes_full_path, 0x0, num_overlay_nodes * sizeof(char *));
>> +
>> +    fdt_for_each_subnode(fragment, fdto, 0)
>> +    {
>> +        int target;
>> +        int overlay;
>> +        int subnode;
>> +        const char *target_path;
>> +
>> +        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
>> +                                           fragment, &target_path);
>> +        if ( target < 0 )
>> +            return target;
>> +
>> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
>> +
>> +        /*
>> +         * Overlay value can be < 0. But fdt_for_each_subnode() loop 
>> checks for
>> +         * overlay >= 0. So, no need for a overlay>=0 check here.
>> +         */
>> +        fdt_for_each_subnode(subnode, fdto, overlay)
>> +        {
>> +            const char *node_name = NULL;
>> +            unsigned int node_name_len = 0;
>> +            unsigned int target_path_len = strlen(target_path);
>> +            unsigned int node_full_name_len = 0;
>> +
>> +            node_name = fdt_get_name(fdto, subnode, &node_name_len);
>> +
>> +            if ( node_name == NULL )
>> +                return -EINVAL;
>> +
>> +            /*
>> +             * Magic number 2 is for adding '/'. This is done to 
>> keep the
>> +             * node_full_name in the correct full node name format.
>> +             */
>> +            node_full_name_len = target_path_len + node_name_len + 2;
>> +
>> +            (*nodes_full_path)[node_num] = 
>> xmalloc_bytes(node_full_name_len);
>> +
>> +            if ( (*nodes_full_path)[node_num] == NULL )
>> +                return -ENOMEM;
>> +
>> +            memcpy((*nodes_full_path)[node_num], target_path, 
>> target_path_len);
>> +
>> +            (*nodes_full_path)[node_num][target_path_len] = '/';
>> +
>> +            memcpy((*nodes_full_path)[node_num] + target_path_len + 
>> 1, node_name,
>> +                   node_name_len);
>> +
>> +            (*nodes_full_path)[node_num][node_full_name_len - 1] = 
>> '\0';
>> +
>> +            node_num++;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Remove nodes from dt_host. */
>> +static int remove_nodes(char **full_dt_node_path, int **nodes_irq,
>> +                        int *node_num_irq, unsigned int num_nodes)
>
> Most of the information above are stored in overlay_track. So can we
> pass a pointer to the overlay_track?
>
> Also, I think most of the parameter (include overlay track) should not
> be modified here. So please use const.
>
>> +{
>> +    struct domain *d = hardware_domain;
>> +    int rc = 0;
>> +    struct dt_device_node *overlay_node;
>> +    unsigned int naddr;
>> +    unsigned int i, j, nirq;
>> +    u64 addr, size;
>> +    domid_t domid = 0;
>> +
>> +    for ( j = 0; j < num_nodes; j++ )
>> +    {
>> +        dt_dprintk("Finding node %s in the dt_host\n", 
>> full_dt_node_path[j]);
>> +
>> +        overlay_node = dt_find_node_by_path(full_dt_node_path[j]);
>> +
>> +        if ( overlay_node == NULL )
>
> This error (and some below) may happen because we partially removed the
> DTBO but stopped because on error. So on the next run, it is possible
> that "overlay_node" will be NULL and therefore you will not be able to
> remove the node.
>
> In your use-case, are you planning to ask the admin to reboot if you
> can't remove a node?
Yeah. What is error case where it may happen?

We are checking if dtbo is same as it was added and also expect user to 
remove the nodes only iff the nodes aren't

used by any domain.

>
>> +        {
>> +            printk(XENLOG_ERR "Device %s is not present in the tree. 
>> Removing nodes failed\n",
>> +                   full_dt_node_path[j]);
>> +            return -EINVAL;
>> +        }
>> +
>> +        domid = dt_device_used_by(overlay_node);
>> +
>> +        dt_dprintk("Checking if node %s is used by any domain\n",
>> +                   full_dt_node_path[j]);
>> +
>> +        /* Remove the node iff it's assigned to domain 0 or domain 
>> io. */
>> +        if ( domid != 0 && domid != DOMID_IO )
>
> I think I asked before, but I have seen no answer on that. What will
> prevent the device to not be assigned after this check?

So, here for removal we assume that user removed all on-going ops on the 
dtbo nodes which they wants to remove.

>
>
> Also, in general, I think it would be helpful if you answer on the ML
> questions. This would at least confirm that you have seen them and we
> agree on what to do.
Will keep this in mind and reply.
>
>> +        {
>> +            printk(XENLOG_ERR "Device %s as it is being used by 
>> domain %d. Removing nodes failed\n",
>> +                   full_dt_node_path[j], domid);
>> +            return -EINVAL;
>> +        }
>> +
>> +        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
>> +
>> +        nirq = node_num_irq[j];
>> +
>> +        /* Remove IRQ permission */
>> +        for ( i = 0; i < nirq; i++ )
>> +        {
>> +            rc = nodes_irq[j][i];
>> +            /*
>> +             * TODO: We don't handle shared IRQs for now. So, it is 
>> assumed that
>> +             * the IRQs was not shared with another domain.
>> +             */
>
> This is not what I meant in v2. Interrupts cannot be shared between
> domain on Arm. However, interrupts can be shared between devices.
>
> This is the latter part that needs a TODO.
>
> In addition to that, as I wrote, an IRQ can be assigned to a *single*
> domain without the device been assigned to that domain. So I think this
> needs to be checked possibly by using the information stored in "desc"
> to know where the IRQ was routed to.
>
>> +            rc = irq_deny_access(d, rc);
>> +            if ( rc )
>> +            {
>> +                printk(XENLOG_ERR "unable to revoke access for irq 
>> %u for %s\n",
>> +                       i, dt_node_full_name(overlay_node));
>> +                return rc;
>> +            }
>> +        }
>> +
>> +        rc = iommu_remove_dt_device(overlay_node);
>> +        if ( rc != 0 && rc != -ENXIO )
>> +            return rc;
>> +
>> +        naddr = dt_number_of_address(overlay_node);
>> +
>> +        /* Remove mmio access. */
>> +        for ( i = 0; i < naddr; i++ )
>> +        {
>> +            rc = dt_device_get_address(overlay_node, i, &addr, &size);
>> +            if ( rc )
>> +            {
>> +                printk(XENLOG_ERR "Unable to retrieve address %u for 
>> %s\n",
>> +                       i, dt_node_full_name(overlay_node));
>> +                return rc;
>> +            }
>> +
>> +            rc = iomem_deny_access(d, paddr_to_pfn(addr),
>> +                                   paddr_to_pfn(PAGE_ALIGN(addr + 
>> size - 1)));
>
> I think you missed my comment here. Similar to the IRQs, you are asking
> for trouble to parse the device-tree again. It would be better to store
> the information using a rangeset (see include/xen/rangeset.h).
>
> I also think the double array for the IRQs should be converted to a
> rangeset as this would simplify the code.
>
Keeping rangeset will work if we only parse one-level nodes. But if 
there are descendant nodes, then its looking complicated to get info 
using rangeset. While adding, we have to add parent first and then it's 
descendant. But while remove, we will need to remove descendants first 
and the parent node lastly.

I am unable to comeup with easy way to use rangeset to store information 
in this way for add and remove.

> Furthemore, you are removing the permission but not the mapping in the
> P2M. Can you clarify why?
We are not actually mapping the nodes here.
>
>
>> +            if ( rc )
>> +            {
>> +                printk(XENLOG_ERR "Unable to remove dom%d access to"
>> +                        " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> +                        d->domain_id,
>> +                        addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
>> +                return rc;
>> +            }
>> +        }
>> +
>> +        rc = dt_overlay_remove_node(overlay_node);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    return rc;
>> +}
>
> [...]
>
>> + * overlay_node_track describes information about added nodes 
>> through dtbo.
>> + * @entry: List pointer.
>> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 
>> 'updated fdt'.
>> + * @fdt: Stores the fdt.
>> + * @nodes_fullname: Stores the full name of nodes.
>> + * @nodes_irq: Stores the IRQ added from overlay dtb.
>> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
>> + * @num_nodes: Stores total number of nodes in overlay dtb.
>> + */
>> +struct overlay_track {
>> +    struct list_head entry;
>> +    struct dt_device_node *dt_host_new;
>> +    void *fdt;
>> +    char **nodes_fullname;
>
> Looking at the code, the main use for the fullname are to check the FDT
> match and looking up in the DT.
>
> In order to check the DT, you could use memcmp() to confirm both the
> stored FDT and the one provided by the user match.
>
> For the lookup, you could avoid it by storing a pointer to the root of
> the new subtrees.
>
> Please let me know if you disagree with this approach.
>
If I understood correctly: just keeping the root of new overlay subtree 
will not work for all case. It will work only if the nodes added are 
adjacent to each other i.e. have the same parent then it will work as we 
add all overlay nodes as the last child of their parent. But If two 
subnodes have different parents, they may or may not be 
nearby(node->allnext won't work) then we will issues removing the node 
from this approach.

I did following small modification to your suggestion:
Keep FDT( do memcmp) for match and also keep address for all added nodes 
at one-level( we can find children info if we know the top one-level 
nodes. Please check overlay_node_count()). This will take 8bytes * num 
of nodes in one-level space which is lot less space than keeping 
nodes_fullname.


I will send v4 this week.

>> +    int **nodes_irq;
>> +    int *node_num_irq;
>> +    unsigned int num_nodes;
>> +};
>> +
>> +long dt_sysctl(struct xen_sysctl *op);
>> +#endif
>
> Cheers,
>
> -- 
> Julien Grall

