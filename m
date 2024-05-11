Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A248C304B
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 11:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720254.1123350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5idD-00014o-Bq; Sat, 11 May 2024 09:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720254.1123350; Sat, 11 May 2024 09:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5idD-00011z-87; Sat, 11 May 2024 09:03:03 +0000
Received: by outflank-mailman (input) for mailman id 720254;
 Sat, 11 May 2024 09:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5idB-00011t-5f
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 09:03:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429dd4bc-0f75-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 11:02:59 +0200 (CEST)
Received: from BLAPR03CA0098.namprd03.prod.outlook.com (2603:10b6:208:32a::13)
 by IA0PR12MB8279.namprd12.prod.outlook.com (2603:10b6:208:40c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54; Sat, 11 May
 2024 09:02:52 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::f8) by BLAPR03CA0098.outlook.office365.com
 (2603:10b6:208:32a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Sat, 11 May 2024 09:02:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 09:02:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 11 May
 2024 04:02:51 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 11 May 2024 04:02:48 -0500
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
X-Inumbo-ID: 429dd4bc-0f75-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wao6OVIL52RH8r4V3L5jZIeYjDMTGLC6H7Eg66E3t2mEMkY0WbmYBHeKS4WeIa7bCd8BPas+8pfoizW1thvHqpwr72RAOfahve/+tWwZwvEJpvp3n4sN9Q1uPvfF13HjYjuja2O95dRZGv8dgQRZ25acv1KQ3PRXZv8DdiQ1uq9mu8t/hWDY8qPs+mgqpNArgYogBxwy3vcDdsmmlEP7ghye2HT/Kls9TUVcHOJzGuSfoNd5usbVhRz7pc7CW+kgYwZ3bQYyyFENZpZtYC8MhPL5npwqZISsCqKHzjG0OmBNgRcRwhFiJIRqSqn/loupv345DMsokypQqkw0M/b3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nZ4TEgqhjZedag6+bEADIVI/j54bFMNXQKxIOp3gcs=;
 b=lNJwp8SgN/bhYCCdi9wDvT2Yoyuk9DzeP1STEONW5Ous8QzabLABNuOVate6qQvjQmPcZ07BWrz/0qNRUDzYew1I/7jbKdwsDQGD9uMG0ymIG81PYGTY2ozNWERkgB/Y/3i+KGdGoNLt4FaGcfzfjoBRxWnnzk7Z+7ay2UQXizLr1SfcM9LwHkIUfEtMyOPYaqjVJxINzSy6DDbUafBLIasm1oNa6HV0Bby7KVsaoJvg2U+FScRh8avdVEsfsuDzbW1n4VH7MZ2zSPalcsWvS2s2Nv8wsoe9LZkTvbd/XIp4iWSdyuiPaNPaFn8En7cPEvbol/R2NfqK23qyJiYLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nZ4TEgqhjZedag6+bEADIVI/j54bFMNXQKxIOp3gcs=;
 b=BLNe0b51ao0YTXs3HzFxmkthQ94Gb0VjokCYKdU0MVtA4SiGTV1LnREMxCjGLeW03E4xTJUMrLFtdF1sRsIEL5csTDuQjzbi2bRhXbA7vmLLVQHwmwVwJTdxbUCFgAi9gYZurf77U9DiJNDB+FD7olH1zHeTIumg+CM9ChpnY6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <448a31b5-db24-4dbb-a159-624676466536@amd.com>
Date: Sat, 11 May 2024 17:02:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: Alloc hypervisor reserved pages as magic
 pages for Dom0less DomUs
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-2-xin.wang2@amd.com>
 <37ee9f1f-0d62-4d88-9507-2906c3149bba@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <37ee9f1f-0d62-4d88-9507-2906c3149bba@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|IA0PR12MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 586c2e65-6e77-4963-6876-08dc71992384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVUxbk9Ob2tNU0VBT3BZSVZWTDQ0NEkrelRMVXhSN3Rlc081Qnd0dWxrb01D?=
 =?utf-8?B?RjlpTStLNmM5d2doYk5XbFc4TWZQTXNlVzhueTBHeVkvMFpsTjRVTExva25T?=
 =?utf-8?B?MFd0UlB5eU1sanVnaGc4Tm1MdHprYU1LU095SWhVMEFzVjJXU1ZEUnB4SVBh?=
 =?utf-8?B?V2tDQ1Q4SFVjamxYRVJyTk8xNThLajRxWG5ueW81ZGs0K2MvbUF6T2VXS0pS?=
 =?utf-8?B?MVF5NmxzRlVGYXBVK0N6OHNYUVlYenM5Q21HYU1nMkhlOXY3UmQ5dkhxVDMx?=
 =?utf-8?B?ZUZRWEN3OWFKSm1rbHNUQ0pEbnEwSWZtblZBSitxd1dCYUNnbkFTRnIycUlT?=
 =?utf-8?B?eDhqT3pvVHBBQ2kycjh0ZWRBeWRrdm1pU3VPcXFBejZvTlI1N3IxRkhMNDM0?=
 =?utf-8?B?M0JGblFWak1lY1dDaEFORE9zY1pNRlgvK0x3akJneWpPdFpqK2lWaElLdVAz?=
 =?utf-8?B?ai96UEM3SENNbWNFSU5kdk5qQllRQXc5bElrRzRjWExWUEI5cU00ckltUWh0?=
 =?utf-8?B?OHFvLzlGc29EbkltbXFmNE1vdnY3bEJ5QnRNVjZZNkJYakoySU9SdXRBYnh0?=
 =?utf-8?B?RkZIbHFxQXNMOXprNUZTZXdmZXBNVFc0MFd1N3l0M3dEUGozUVZBYnhKN3Rt?=
 =?utf-8?B?ZkRDOU5MMHU1ZjFldE1VcDY4Z0JJRjdRbExoSzF1eTI4cUdxVlNhNTJ5NmdS?=
 =?utf-8?B?VWhlZS9YaFNFN1R6OXBFMEdjOFJndjcwaFVwdHAreEZtc1hvRjFpZUlCSUJD?=
 =?utf-8?B?c0VnbHFzTmtydDlraVJMUWcwbUxnRkhBM29mQ1IxZEd3eU9tVHpqOGwvenJO?=
 =?utf-8?B?ejVKTnhUdkYwU2hFZysrUmF5VWNWR2tpRVRqS0lNd1d4bnQvOTRDbDJyTFU1?=
 =?utf-8?B?Ly9MbUc2UWpGZWJ0cUIwYkxlc3MvaDMyWVo5TzIvUmViRm8yVzBKNWptNnd5?=
 =?utf-8?B?SVlXMlNsN0pBcWZJOSt3YndzWmxUb1ppbGlZY2Rwc1FyMVBtUEVxY3R0a1hm?=
 =?utf-8?B?dEpRaGwxRHpxSFQyZENwbkxJcytnNjhraDNQcTYzR2kzU045dDYrcFdiZ2dE?=
 =?utf-8?B?VFB0QUY5N2hFYWp6Zk1OWStxV0pqMGxXcU1MUk50OXRMYm9mWndtU2JmUThH?=
 =?utf-8?B?aE82RW5UOGFINlhkM05QUTNzcWdMRlpMbGptWE9PWHBmTnlybEFtdkN3RGlF?=
 =?utf-8?B?ekp2Q2dqeXErZFRraXRJMU9rS2FKVktHcGtwNXd6MG9ZMWsxZVdxcE9wYVAy?=
 =?utf-8?B?TXJzSFNXODFtVHNsaFl3d04yZk55U2VWa2s5Mk9aT3JtbXpqRmpodU5mMzN3?=
 =?utf-8?B?RTFGazNWbU9mWnBpY3REWkZhUVBCdXJnSWZHUTBlM083Uk11djBpVXVRQnBY?=
 =?utf-8?B?ZUp2aXBYcWEyMDYweTdRTjhiMS9nMW1jeml0L3l4Q2RDRHBuemFISWRiSFhp?=
 =?utf-8?B?elQ5b1NZdCtSK0Jmd2kvVW5MbEpaSC9mdWdvOVp1ZUxlNVVuRHU2OWVyZkVF?=
 =?utf-8?B?bnhwMHhRNGZuS2NORDgvV3duWFE0TVFyOFNMQlo2UUdLbGNwQU14ampJVnF4?=
 =?utf-8?B?NGFsamd4eU9UTVU3cjFIckhWa1NiNkJqVGxQOXJZbjZ0Z0FnL1dtb1pFNVNU?=
 =?utf-8?B?ZU1iTnF2STJsZVp0WDF4cFZwSkJ6Y3p4ekREUWR5bks3OTJXSitKeTIwb3Ez?=
 =?utf-8?B?azMvUkw1Qi9McUpMZ1RweUJGcjZpTkZKbjU5ZHJ3TDE3RVJmMS9NV3Rva0I4?=
 =?utf-8?Q?4Awl4dpJXTdJck8rX0D/j/fATiwKLMtrv0xcEuV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 09:02:51.9114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586c2e65-6e77-4963-6876-08dc71992384
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8279

Hi Julien,

On 5/11/2024 4:46 PM, Julien Grall wrote:
> Hi Henry,
>
> On 11/05/2024 01:56, Henry Wang wrote:
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
>>
>> The "magic page" is a terminology used in the toolstack as reserved
>> pages for the VM to have access to virtual platform capabilities.
>> Currently the magic pages for Dom0less DomUs are populated by the
>> init-dom0less app through populate_physmap(), and populate_physmap()
>> automatically assumes gfn == mfn for 1:1 direct mapped domains. This
>> cannot be true for the magic pages that are allocated later from the
>> init-dom0less application executed in Dom0. For domain using statically
>> allocated memory but not 1:1 direct-mapped, similar error "failed to
>> retrieve a reserved page" can be seen as the reserved memory list is
>> empty at that time.
>>
>> To solve above issue, this commit allocates hypervisor reserved pages
>> (currently used as the magic pages) for Arm Dom0less DomUs at the
>> domain construction time. The base address/PFN of the region will be
>> noted and communicated to the init-dom0less application in Dom0.
>>
>> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
>> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>> v2:
>> - Reword the commit msg to explain what is "magic page" and use generic
>>    terminology "hypervisor reserved pages" in commit msg. (Daniel)
>> - Also move the offset definition of magic pages. (Michal)
>> - Extract the magic page allocation logic to a function. (Michal)
>> ---
>>   tools/libs/guest/xg_dom_arm.c |  6 ------
>>   xen/arch/arm/dom0less-build.c | 32 ++++++++++++++++++++++++++++++++
>>   xen/include/public/arch-arm.h |  6 ++++++
>>   3 files changed, 38 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/libs/guest/xg_dom_arm.c 
>> b/tools/libs/guest/xg_dom_arm.c
>> index 2fd8ee7ad4..8c579d7576 100644
>> --- a/tools/libs/guest/xg_dom_arm.c
>> +++ b/tools/libs/guest/xg_dom_arm.c
>> @@ -25,12 +25,6 @@
>>     #include "xg_private.h"
>>   -#define NR_MAGIC_PAGES 4
>> -#define CONSOLE_PFN_OFFSET 0
>> -#define XENSTORE_PFN_OFFSET 1
>> -#define MEMACCESS_PFN_OFFSET 2
>> -#define VUART_PFN_OFFSET 3
>> -
>>   #define LPAE_SHIFT 9
>>     #define PFN_4K_SHIFT  (0)
>> diff --git a/xen/arch/arm/dom0less-build.c 
>> b/xen/arch/arm/dom0less-build.c
>> index 74f053c242..4b96ddd9ce 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -739,6 +739,34 @@ static int __init alloc_xenstore_evtchn(struct 
>> domain *d)
>>       return 0;
>>   }
>>   +static int __init alloc_magic_pages(struct domain *d)
>> +{
>> +    struct page_info *magic_pg;
>> +    mfn_t mfn;
>> +    gfn_t gfn;
>> +    int rc;
>> +
>> +    d->max_pages += NR_MAGIC_PAGES;
>
> Here you bump d->max_mages by NR_MAGIC_PAGES but...
>
>> +    magic_pg = alloc_domheap_pages(d, 
>> get_order_from_pages(NR_MAGIC_PAGES), 0);
>
> ... here you will allocate using a power-of-two. Which may end up to 
> fail as there is nothing guaranteeing that NR_MAGIC_PAGES is suitably 
> aligned.
>
> For now NR_MAGIC_PAGES seems suitably aligned, so it BUILD_BUG_ON() 
> woudl be ok.

Great catch! I will add BUILD_BUG_ON(NR_MAGIC_PAGES & (NR_MAGIC_PAGES - 1));
Thanks.

>> +    if ( magic_pg == NULL )
>> +        return -ENOMEM;
>> +
>> +    mfn = page_to_mfn(magic_pg);
>> +    if ( !is_domain_direct_mapped(d) )
>> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
>> +    else
>> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
>
> Allocating the magic pages contiguously is only necessary for direct 
> mapped domain. For the other it might be preferable to allocate page 
> by page. That said, NR_MAGIC_PAGES is not big enough. So it would be 
> okay.
>
>> +
>> +    rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
>> +    if ( rc )
>> +    {
>> +        free_domheap_pages(magic_pg, 
>> get_order_from_pages(NR_MAGIC_PAGES));
>> +        return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int __init construct_domU(struct domain *d,
>>                                    const struct dt_device_node *node)
>>   {
>> @@ -840,6 +868,10 @@ static int __init construct_domU(struct domain *d,
>>           if ( rc < 0 )
>>               return rc;
>>           d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
>> +
>> +        rc = alloc_magic_pages(d);
>> +        if ( rc < 0 )
>> +            return rc;
>
> This will only be allocated xenstore is enabled. But I don't think 
> some of the magic pages really require xenstore to work. In the future 
> we may need some more fine graine choice (see my comment in patch #2 
> as well).

Sorry, but it seems that by the time that I am writing this reply, I 
didn't get the email for patch #2 comment. I will reply both together 
when I see it.

>>       }
>>         return rc;
>> diff --git a/xen/include/public/arch-arm.h 
>> b/xen/include/public/arch-arm.h
>> index 289af81bd6..186520d01f 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>   +#define NR_MAGIC_PAGES 4
> This name and the other below are far too generic to be part of the 
> shared header. For NR_MAGIC_PAGES, can you explain why 
> GUEST_MAGIC_SIZE cannot be used? Is it because it is "too" big?

Yes, I don't really want to allocate whole 16MB when we merely need 4 pages.

> For the rest below...
>
>> +#define CONSOLE_PFN_OFFSET 0
>> +#define XENSTORE_PFN_OFFSET 1
>> +#define MEMACCESS_PFN_OFFSET 2
>> +#define VUART_PFN_OFFSET 3
>
> ... the order we allocate the magic pages is purely an internal 
> decision of the toolstack. For the rest of the system, they need to 
> access HVM_PARAM_*. So it doesn't feel like they should be part of the 
> shared headers.
>
> If there is a strong reason to include them, then I think they all 
> should be prefixed with GUEST_MAGIC_*.

One of the benefits as Michal pointed out in comments for v1 [1] would 
be this would also allow init-dom0less.h not to re-define 
XENSTORE_PFN_OFFSET. I will rename them as suggested if both of you are 
ok with moving them to the arch header.

[1] 
https://lore.kernel.org/xen-devel/5d3ead96-5079-4fa3-b5fd-4d9803c251b6@amd.com/

Kind regards,
Henry

