Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00917A05494
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866902.1278277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQWQ-0004Ro-UI; Wed, 08 Jan 2025 07:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866902.1278277; Wed, 08 Jan 2025 07:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQWQ-0004QK-RW; Wed, 08 Jan 2025 07:30:34 +0000
Received: by outflank-mailman (input) for mailman id 866902;
 Wed, 08 Jan 2025 07:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kklb=UA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVQWP-0004P2-Bt
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:30:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707f52cd-cd92-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 08:30:31 +0100 (CET)
Received: from SA9PR13CA0048.namprd13.prod.outlook.com (2603:10b6:806:22::23)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 07:30:23 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::51) by SA9PR13CA0048.outlook.office365.com
 (2603:10b6:806:22::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 07:30:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 07:30:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 01:30:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 01:30:22 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 01:30:20 -0600
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
X-Inumbo-ID: 707f52cd-cd92-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psaGKwU/VtTE0ChO7xBhtKGWaRMRAv/KxOJGbmZxcb+N+KZPPP3sEpGe9es11aYBZFpLrCBmbleMOesP16XMEEOoLnaMMff6O5SlgjYmxVQHq97TvtpRrLplgNxwrCfx5TFGaXx3daFy1DhDt1Kvb9I4VDOgl5/zDSgyvAnZBgN/O+lXGl5F43ueV02+MXpFo/3mf3uFAOztuZmbGhnUT8ntgZpFvlu4QTZbup4fSjtKq/b6KYbh4cesK1IUQAX0cwYjxddgXKmBN/xAFplJkFIFonyyefjTuDLfFkf+sUNVH4+6xBfNpmJzQXwYPQ9kDwi0q/TBOeP2ZjufylbGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEB+HjNRmsyXnxqNPeFEYNNNC1Lmpmgus/aOsHMcIOk=;
 b=gia3ydi5Da5uAdiLrU03FKLumc+bxbAUMunlqwGDpon1yppKxHHgqHFV35GUXA+sOjbEltBb2Sfzh0gILoKqrYGcXqOLven8PJqbCT1zUtQMkLdP8R2f78d68z8tvhkKwt12U9WO/4Q+rMcqGWV2hFStaYSWIgJKuWShxVxWobyToCDyTuhpY8VJs8lAJC6w7JOl7T6mdT93vSjtt5iOY57/2nLDOEJEPY4Ih9dTpcJFELiKwe6hN5uz+V4Z+hFQs4wcikB+mC5Hu4PyDY+4Wt7aI7G1umfQp417CuJotJWyjfvRoA3fzPmmpZXW8q0i58swt/eOJ8PNys+3BmTM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEB+HjNRmsyXnxqNPeFEYNNNC1Lmpmgus/aOsHMcIOk=;
 b=ubZWgy5Diuz7u5OLZISEPIJrcEO5ywynWhGPFJnEReXzH0FhCSsC5h4kNecUDBl25jkDktkayEkfBSpM61+I3/xoriPwuzZd+fuUrwzaWOvnnCXOyPkgl0QGGsfjOJjl7zOpkDMM+hJzexYwRZfejnvDM8o765Ou4pwzLIv1HyA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <068a9ab0-c7b8-490f-85fa-6beee8c07917@amd.com>
Date: Wed, 8 Jan 2025 08:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring
 support for Xen image
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrea.bastoni@minervasys.tech>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii <oleksii.kurochko@gmail.com>, Julien Grall
	<julien@xen.org>, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
 <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
 <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
 <6a0a096b-47c2-4568-be9f-9f230bc6df23@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6a0a096b-47c2-4568-be9f-9f230bc6df23@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: d69ff71a-af8d-4564-c5f7-08dd2fb65067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0RScTRDYmpzWTVoWWRLYVd6TFRHdGdiNlRGZFMwZkUydUhDb1c0cUplQVp1?=
 =?utf-8?B?cllORm5yQTRtQkU4cmpocDBzR3RMMnBWQ3Nab3lHRDl6NERsc1Y0WDc0VEpT?=
 =?utf-8?B?YXIyUktmUEVIUTBOQSswNlBTRVBRbzBOZXJUZitaY2pnbExBSUhUM1NmVXlo?=
 =?utf-8?B?ZFhHSkpQbE5menplR1VrTWxHc0JhMnhlYytXVlFKWFdNQ2xQZzBYbUVyWXpY?=
 =?utf-8?B?eGY2blVpUCtaVitOeS9pZllXS00wTkhVcFdXZzc1cjZrSDA5eDhWRUhEZzMz?=
 =?utf-8?B?Y2R2NWdmNGFUWms4VEJOZTJmYUx2ZHl4ZFg0YXkySlZOOGFHdFp6cy9zNnNz?=
 =?utf-8?B?VHdocWZMejQ5N2ZJY21mc24vb0NZS2kxUjZuU245UzRFM0dQKzE1RWhOKzg1?=
 =?utf-8?B?T01KT0J4RWFONGcyZG4rUlkyVk9UeGRNSHZtYlVaV0tONVN0ZElLTE9UaUw1?=
 =?utf-8?B?M3RnY2I2MzRGaUorNUxpNkIxOTdYRDZKWTBTRXhVSWovQXJhYStqWUgwZWR0?=
 =?utf-8?B?eEtKL1hldWRXa05CdTFTS1BRRDNVTTNkVFVlaWMyckNpbVJsSWZ3QmpTMUp2?=
 =?utf-8?B?VEVEblBlY3Bhbm1mL0xLVzZZYUFoRDBBNFlneW1Ma1NSVHNMd1hWdHdWUjJh?=
 =?utf-8?B?L1d2MThNR1BRVlVHOHJRcVJXSndreXhwTlVuUGJ6V3JVOUx1MXo5c2E1TG1L?=
 =?utf-8?B?KzhwYWdqSUJIaU9qdzVBTkwxWGFsdWVtWEp3UFNNUXBNSmV1VXNUUVFZNFZ4?=
 =?utf-8?B?N2JDdlJsd3B2VFZRMkNrclliejg0RTdvVG8xWGZkY09NYVpoZFIxQ3RVUEgr?=
 =?utf-8?B?cXhwSGd3NjNtSDEwZWtZc2x5RlhVN3o3UHRTb2xPMGtSSy9sWm5OM1pFd0JQ?=
 =?utf-8?B?RlZSV0s3MmdlSUp0V0piRTlhT2JqUmMwd1FYVGJ4aXhOcGhsVmk4ODVkVEZs?=
 =?utf-8?B?MXdUSWxkRlduZG01SU5Eb201TmtlTS9UKzZlYlcvRy9kOEt6NVZTcXVhOGNY?=
 =?utf-8?B?ckdiOHlDN0VlQXNaSUJVQklmcXNma3ZkWnFCclViemw2L1VzOFdxd3pzOGN3?=
 =?utf-8?B?bDI4TVpmc0RuOThycHhaMWlzL0dmbEtwb0Z1ZnJVa1dOZkR1ZjZKT3EwK0oy?=
 =?utf-8?B?SHpjdmE2Zzg3M0ZEOWlKRXhNQlJ2eUgvRi9OTERmQ2FXeDB0a3N6NzVFTkk4?=
 =?utf-8?B?NHNsVmJ1d1hua2N6cTUzVXhIYUl1SnJ3NVF4eFBmR0JvNERnc1h1UlN3SnRy?=
 =?utf-8?B?V3pwR0gwTFNGeGVzWC9WZjJ0RWRtV2ptUk4yWHRycVRuYnpGR202T0hCK2Vo?=
 =?utf-8?B?bFJrbXZIZGpLck9xWUQyZlhhQ2Vid3grNWFuQXNoK0tWd1BoRTRSUUkzYmV4?=
 =?utf-8?B?QjlvanFPOFpVWDVOQjcyQUpVc0laaTBvT1B6R2VOeEVKS3J1ck9iYmVGdjdS?=
 =?utf-8?B?bG9sZ3luUGd5SytiVjJVOUM3aFFBWnhYM1E1TEhsOXRDQTlWSG9DM3JYYmJ4?=
 =?utf-8?B?RXhEb3kyWmVUK3MrbkhqUEVPSlVDZTRENGpZWFZkZWd0S0l6dWFKOGp6bTY1?=
 =?utf-8?B?d250YkkyTno5eHNLTkNQTFRIdTViMFA2R2hkaWtYdktpUm9oMXpvSXRENWdM?=
 =?utf-8?B?dmhEdStZOThKYnlTYW5BcGtwYUFDVWN4dmJUanJRcGdFWUxPcUxac0lZSk8z?=
 =?utf-8?B?c2tvTnFoQVllK3pITWlyczg0bTVCVDN4WDM2d1hoVjlzTWJSL05GTjJxbnZJ?=
 =?utf-8?B?b1A4S2FKTUowRm1HVzl0YlRLOHdteDhRWkovQk1UTzg3UXVSYmJBK0QzOTJM?=
 =?utf-8?B?ZjZlelFFOSt0M081ZkR4MzM5UEMzM2pwTDhLb1I3UjhlK2ZFYmRWZHJPR2E3?=
 =?utf-8?B?V2I1V0ZqRWZkVXJuSlZqclA0V1Y1MWk2OGttQm9OUnMrRXNFenJDVk1TaWg4?=
 =?utf-8?B?eXNLRlV3eGpLSUZQT2E5a3YzZ3hoZzdlcCtQSlBIZENvQkFTOGc0T3UvY1NG?=
 =?utf-8?Q?acMu3oZXbhRayg16xq5zkQIZBNC60s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 07:30:23.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ff71a-af8d-4564-c5f7-08dd2fb65067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247



On 07/01/2025 18:01, Jan Beulich wrote:
> 
> 
> On 07.01.2025 17:51, Michal Orzel wrote:
>>
>>
>> On 07/01/2025 17:42, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 16/12/2024 14:36, Jan Beulich wrote:
>>>> On 16.12.2024 15:28, Carlo Nonato wrote:
>>>>> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>>>>> @@ -1,6 +1,7 @@
>>>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>>
>>>>>>>   #include <xen/init.h>
>>>>>>> +#include <xen/llc-coloring.h>
>>>>>>>   #include <xen/mm.h>
>>>>>>>   #include <xen/pfn.h>
>>>>>>>
>>>>>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>>>>>   }
>>>>>>>
>>>>>>>   extern void switch_ttbr_id(uint64_t ttbr);
>>>>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>>>
>>>>>>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>>> +
>>>>>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>>>>>> CODING_STYLE: { needs to be on its own line
>>>>>>
>>>>>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>>>>>> be #ifdef protected.
>>>>>
>>>>> Here and in other places (patch #8) I'm relying on DCE to remove functions
>>>>> that are not called. This was a suggestion from Jan in that patch. Can we
>>>>> adopt the same here?
>>>>
>>>> Yet how would the compiler spot that the function is unused? That would only
>>>> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
>>>> in question to be static (allowing the compiler to see enough of the whole
>>>> picture).
>>>
>>> Sorry for the late answer. I was away with limited e-mail access. While
>>> looking what was committing recently, I noticed that a dummy function
>>> was introduced:
>>>
>>> void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
>>>
>>> If a function is not supposed to be called, then it should contain a
>>> BUG_ON() to catch any misusage. Otherwise, this is a recipe for
>>> disaster. In this case, it would not be trivial to notice the TTBR was
>>> not switched...
>>>
>>> That said I would have actually considered to remove the empty stub. I
>>> am a bit surprised that DCE wouldn't work in this case because the call
>>> is protected with "if ( llc_coloring_enabled )". When cache coloring is
>>> not enabled, this would turn to an "if ( false )" and therefore all the
>>> code should be removed. What did I miss?
>>>
>>> Note that this is what we already rely on for arm32 because there is no
>>> stub... So if this is problem then we definitely need to fix it on arm32
>>> as well...
>>>
>>> IOW, we either introduce a stub (including the BUG_ON) for both arm32
>>> and arm64 in the header or we remove the stub completely.
>>>
>>> Marco, Michal, can you have a look? Ideally, this should be fixed for 4.20.
>> I did a test with GCC 13.2 and I can compile it fine with stub removed. That said,
>> I'm not a compiler expert and I'm not sure if this behavior stays the same with different
>> compiler options/optimizations. So it's more like a question to Jan. I'm happy either way.
> 
> We use the same (if(...) func();) in various places, relying on said DCEing
> of the call when the condition is compile-time-false. I see no reason why
> it couldn't be used here as well.
Well, in original patch you wrote:
"Yet how would the compiler spot that the function is unused? That would only work
with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions in question
to be static (allowing the compiler to see enough of the whole picture)."

That's why I wanted to confirm with you before sending a patch to remove the stub.
At first place I thought we rely on DCE only for:
a) static functions
b) in construct like if ( false && foo() ), not if ( false ) { foo () }

That said, relocate_and_switch_ttbr() is exactly the same as domain_set_llc_colors() for which
we don't have a stub and rely on DCE.

~Michal


