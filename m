Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93858C1F3F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 09:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719546.1122348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Ktz-0004u9-P9; Fri, 10 May 2024 07:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719546.1122348; Fri, 10 May 2024 07:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Ktz-0004rk-Lo; Fri, 10 May 2024 07:42:47 +0000
Received: by outflank-mailman (input) for mailman id 719546;
 Fri, 10 May 2024 07:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVkm=MN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5Kty-0004re-0Y
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 07:42:46 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1fe63a7-0ea0-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 09:42:43 +0200 (CEST)
Received: from CH0PR03CA0409.namprd03.prod.outlook.com (2603:10b6:610:11b::17)
 by SJ1PR12MB6076.namprd12.prod.outlook.com (2603:10b6:a03:45d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 07:42:39 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::31) by CH0PR03CA0409.outlook.office365.com
 (2603:10b6:610:11b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48 via Frontend
 Transport; Fri, 10 May 2024 07:42:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 07:42:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 02:42:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 02:42:35 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 02:42:33 -0500
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
X-Inumbo-ID: e1fe63a7-0ea0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDkTKADkdvAUiTzzWSCT4qHLQFP/jJblZ4fQQgkJ6gsmk9zMtTt3EX9o0LszOM98YguF3JjeiKsL3GOa/Ood+dba0ybMXyXokTKYtNWBnWB7N8UEz4TBCOCznd0Bef4W+RYo8sRb7LE0Lb3mmkMy8v8g+VVytJuwlFq3RCSfTpDYkR2NxCYGISmS8NL9bMAI8Gn/jV6GW983BvI1sjArO/7WrJvVTSlWup4Z9yRBaL8jx4wuWAuYmkJ9yo5wrsDcvn2/O2kSudagxNU5z+UtS7gRcWYFqJ/hDPnhvt7AK4rbGI2njLJTkI4gdEB9Oadatjiwq4idVzA4DBjQB1M+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZeDQT3YDD/Cq5x2elGP1TIeC8Q6qpFMEIdHpnkqlAk=;
 b=YXnWVPSpJDNzb3t/aB/izFrEsIBBYOB3jgNYFYnHt4ud8CJmTyKa1NmL2YOrMFEArsMjtzeuqi+J3KgnKSIbqFTVomi6EMfGTLGwu5nY2eeXVh9L47pDOEakPxTmlGidDUdVWklRs6iJPEKq9Sg8cnZZW/IQePO9IIQi+VCvL9T0Q/xKrW3z9w61VOGxdXra4gXkLdcKcRRfQXDwA2spuj26rpT/OJ8Q1ZJXvsHfEiB4OVrGLd4TjAGLaHJcB+63lNSAcJpRiUUv4B4wwZOIO3nwK5ULM4VVygMW7ZJdVtTmkQz7IEz+U90q/LhC2z2fpoB/ix/Zjg+DtbJFD/7VdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZeDQT3YDD/Cq5x2elGP1TIeC8Q6qpFMEIdHpnkqlAk=;
 b=d34UITI3og7MF5HesAMyLoQSbI01UX21yAVDIEm78naO9oaIN8jputJzqgL/B17Lrv7uthFsVIMFjvHuP+4ZeWNZ8HNLWzLz8fKNd3WhcebEXE6aF6jIyQH1qKy0RycHANxsEUsoIPCZ+7UXTBKA1hlqGGp1oplqZS6UD+0jwkI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d357beeb-6874-4262-8137-8b4145fd64c4@amd.com>
Date: Fri, 10 May 2024 15:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for
 Dom0less DomUs from hypervisor
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-2-xin.wang2@amd.com>
 <5d3ead96-5079-4fa3-b5fd-4d9803c251b6@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <5d3ead96-5079-4fa3-b5fd-4d9803c251b6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SJ1PR12MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: a4127491-8a4e-4148-de40-08dc70c4c471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWxtWVlYMHgxNlROR1BVMi9sRCtRRHRqRDEvb0wyb0c1eUJWbWJyODlmWlhW?=
 =?utf-8?B?Ui9nSU1Gb3pzdkZnWXExNWFtbjBUVjM2c0NjeEdwekZwekFhRllHaDZUelNl?=
 =?utf-8?B?d0JxNHpMaEd6K21STjRrYlBpdVFFeUwwbkZSNHF2OXVBZHJQWlNZQm9VZWc1?=
 =?utf-8?B?TmM4OE5ZYUdieVNTZjNjVkpoSHFtWm9SMWthZGRlUTAwbzRObWp4c28ycmRn?=
 =?utf-8?B?c1Izb01kUGlrNm10dnhUNkx3b1JXMDUwa2ZSUlpIMmZxeGZlTjJSMnJlZDg5?=
 =?utf-8?B?b2FIK2I0dXF2QzdRb0FlRmtDUXp1RE0ycjhHTFcxb0VQdmZEYkxsTTNzcm5m?=
 =?utf-8?B?UUxNTmtBaXRjai93ZlFXSHBmU2R5dDhOVkJvK1pVdTBaYjBPWXVJbFBHbW1W?=
 =?utf-8?B?Uk1BdThqT3hHTkVmS1NySjJ0Wi9RZkFWeFFnTEtMTkdsWlNycUpkd1JmUk1U?=
 =?utf-8?B?QUJqTUhuRjJHMkRCVkNQM0NsWVovZzlpZ0k1aE0xQVdCc25mYWcwQkJoY0Rt?=
 =?utf-8?B?eC9OdDdYQ3BFeDNETWJlOU4zTGxSelVCQXdzcXY0WUN3TEMwVDBjUk9BYkRX?=
 =?utf-8?B?eGZZYWJSc0ExYUZlR2RER01KTXZTdTk3RGhuaFZrckU2V0UyS25sNWZaamQx?=
 =?utf-8?B?MHN1KytmOHZFZEVWRXc2NEx5TjdBYzlIZWJVWUlyVkJkVFhwRS9RazRSMGF2?=
 =?utf-8?B?Z25UdFVSTHE2TURXVXBJTGd2ckFIeng2SXUyekZkYzBhK0ZoZyt5NFVDQVVw?=
 =?utf-8?B?MWNpYVhHcjFzS1ZURFhzd1pLNCtNY2JLLy9XWkMxRmdBM0pSWDRZODRPMGph?=
 =?utf-8?B?R1hObjdYZng3TCtFOStSc1hocHlsbTFoWTJ2UXpmVENCcE1ybmUzTkRqWEY1?=
 =?utf-8?B?SU0rRUV5OGM5aUpRNVNvSXFiWFpUQmVQSFhWSWZaV0QrS253WHc5WEsrc2Nh?=
 =?utf-8?B?dmR4N2NRZTNNMlFoOTNadTRhRFhCOXNBSGtqdnFCLzVCdFM2cHdyRHozYnRu?=
 =?utf-8?B?Qkw2WWpEUHJzOTduYzNyU3ZCU3dHTlgrYURRU3FRUzdNNGwrbTY5MFhCMnBl?=
 =?utf-8?B?Q25TVmlaQWN5VGJvVFJjNFJBcEdTOXV2SlFqMkM3ZzhVN1drcnlScWFnWXRZ?=
 =?utf-8?B?UWVCSGtEa2ZKa0pmRWI3c1d2bkZxRGR4SnNKdDNEWWkrMWhFUWhHa3JVbGEw?=
 =?utf-8?B?OE9VRVN4K1BhRVF4dmJReWJhMm04NkdxeGVMV3BlT3pRRG56UFRvNmFJRDRw?=
 =?utf-8?B?Q0FvVjFEUFhVMnZRMlZYeTRQTmpUTndjTHljZHdZcklOejhPWWtySlIwTHpr?=
 =?utf-8?B?STVoVlR6VlVTZVhiQW9PVUczOWd4eFZaUWhNOFhhdnZxTnF2NEhjY2tLQS9o?=
 =?utf-8?B?cFNsbmJLNHNWd2o3bkdjM292N1dQV0dCalhPQVM4OVYrSW1WYVhjTGpvQkpn?=
 =?utf-8?B?QkpQMGNWSzNDT2NWMVZ2dmlpRy9mbE9Ya294Um43RFVMYU5TNEx5Q1lXNGVD?=
 =?utf-8?B?WGlwbXZ3Z1R3WjJKZFlZbHQyb3U1REIxNWN6SU5hSGp3c0N3cGxlZlV3TThR?=
 =?utf-8?B?YWlOejNHUW90eUdiZEc2NnFkTWtsd3RyMS94akpFZ2ZYTTIxS0FQTXEwVWRL?=
 =?utf-8?B?WjZrWnFJWTkvRS9HVXNGY3Y5NzRUWXIveXBwVXF0RU1nUWdrRkFXYnJYd0FJ?=
 =?utf-8?B?WklNODYzVjhuTnUweWwzVkFUK3FJdFpXVTZCeUZ0dnBOaG5pa0haeUt4aFM4?=
 =?utf-8?B?djQyY2ZFTU4xdU52K25yM2FEL2NLRUZIbU0zeDAvTy96YzdkejRpUEhSK3Y0?=
 =?utf-8?B?eXJsbWJKTDZuN2tKOUp3cTIraW5qOXhXMVNMZjFuYUs5czMveXR1Sjh0aVJ1?=
 =?utf-8?Q?Yj0nHrrHxya59?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 07:42:39.0840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4127491-8a4e-4148-de40-08dc70c4c471
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6076

Hi Michal,

Thanks very much for taking a look!

On 5/10/2024 3:37 PM, Michal Orzel wrote:
> Hi Henry,
>
> On 26/04/2024 05:14, Henry Wang wrote:
>> There are use cases (for example using the PV driver) in Dom0less
>> setup that require Dom0less DomUs start immediately with Dom0, but
>> initialize XenStore later after Dom0's successful boot and call to
>> the init-dom0less application.
>>
>> An error message can seen from the init-dom0less application on
>> 1:1 direct-mapped domains:
>> ```
>> Allocating magic pages
>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>> Error on alloc magic pages
>> ```
>> This is because currently the magic pages for Dom0less DomUs are
>> populated by the init-dom0less app through populate_physmap(), and
>> populate_physmap() automatically assumes gfn == mfn for 1:1 direct
>> mapped domains. This cannot be true for the magic pages that are
>> allocated later from the init-dom0less application executed in Dom0.
>> For domain using statically allocated memory but not 1:1 direct-mapped,
>> similar error "failed to retrieve a reserved page" can be seen as the
>> reserved memory list is empty at that time.
>>
>> To solve above issue, this commit allocates the magic pages for
>> Dom0less DomUs at the domain construction time. The base address/PFN
>> of the magic page region will be noted and communicated to the
>> init-dom0less application in Dom0.
>>
>> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
>> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/libs/guest/xg_dom_arm.c |  1 -
>>   xen/arch/arm/dom0less-build.c | 22 ++++++++++++++++++++++
>>   xen/include/public/arch-arm.h |  1 +
>>   3 files changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
>> index 2fd8ee7ad4..8cc7f27dbb 100644
>> --- a/tools/libs/guest/xg_dom_arm.c
>> +++ b/tools/libs/guest/xg_dom_arm.c
>> @@ -25,7 +25,6 @@
>>   
>>   #include "xg_private.h"
>>   
>> -#define NR_MAGIC_PAGES 4
> Moving only this macro to arch-arm.h while leaving the offsets does not make much sense to me.
> I think they all should be moved. This would also allow init-dom0less.h not to re-define XENSTORE_PFN_OFFSET.

Sounds good. Will do in v2.

>>   #define CONSOLE_PFN_OFFSET 0
>>   #define XENSTORE_PFN_OFFSET 1
>>   #define MEMACCESS_PFN_OFFSET 2
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index fb63ec6fd1..40dc85c759 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -834,11 +834,33 @@ static int __init construct_domU(struct domain *d,
>>   
>>       if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>>       {
>> +        struct page_info *magic_pg;
>> +        mfn_t mfn;
>> +        gfn_t gfn;
>> +
>>           ASSERT(hardware_domain);
>>           rc = alloc_xenstore_evtchn(d);
>>           if ( rc < 0 )
>>               return rc;
>>           d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
>> +
>> +        d->max_pages += NR_MAGIC_PAGES;
>> +        magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);
> 80 char exceeded

Ooops, I am sorry. Will fix in v2.

>> +        if ( magic_pg == NULL )
>> +            return -ENOMEM;
>> +
>> +        mfn = page_to_mfn(magic_pg);
>> +        if ( !is_domain_direct_mapped(d) )
>> +            gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
>> +        else
>> +            gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
>> +
>> +        rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
>> +        if ( rc )
>> +        {
>> +            free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
>> +            return rc;
>> +        }
> Please create a function alloc_magic_pages to encapsulate the above block.

Sure. Will do.

Kind regards,
Henry

