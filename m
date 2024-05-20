Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6C8C9DCF
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 15:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726090.1130340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92fB-0003Dc-1l; Mon, 20 May 2024 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726090.1130340; Mon, 20 May 2024 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92fA-0003Bc-V9; Mon, 20 May 2024 13:02:48 +0000
Received: by outflank-mailman (input) for mailman id 726090;
 Mon, 20 May 2024 13:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s92f8-0003BW-LB
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 13:02:46 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dfbcbcb-16a9-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 15:02:43 +0200 (CEST)
Received: from MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 13:01:20 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::7f) by MN2PR18CA0014.outlook.office365.com
 (2603:10b6:208:23c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 13:01:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 13:01:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 08:01:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 08:01:10 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 08:01:09 -0500
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
X-Inumbo-ID: 3dfbcbcb-16a9-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0tzbxXwxG1idJr/9pbmsO2xqbrau4AXN0l//jJ240wiV9DaOaAu9PFwpBPiTqcZoF/+oWt8ubcyW5caQEfw8XEfzIFME9lBU9i7bfYdsX9oG5O2hU6UuvtihYhPKH51YzFq6zWQ89aFrgcA2AbQVTwJVtcd22e7bcs8b/rg9ruY8rNBDyzc3xv5gxZ31h7hMC78Sn9RZ4ykh0G7TfsULhpIT/K1KJIvuVVhsF8hFiuTcLDyd8uxIuIg5DXnp6jqyn0H2+XyEqRe/35N3X7IfamrkYVu+KZTqaicnpdAOtGxCzpjhn5krzW+EN6MQ7j0ZcXsY1cxyZVtsWJQeR2QUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXhwJ/lAdqqPpa2P2dJzsd2jdipQVKlLWeMEXgJnyTg=;
 b=akc1NAZYMjWvWUUnaqYaXfe4EI+c0WYaOYgGKSLen6Kch/yB/wJZPZu4K5/Pkfc/lWP+JgN6NiflglG9lGLtT0BAVDXazWpmQVyt5YtEBXht0ekV53okg0pCFbrXyDqctn0xPGu+45wwr7VzwVnsaKTU/omH62ftG9LhQCLu1iQSJ61l33KiUi/v1dMfQ7XyZu1XDNDVlxuNjwORt6Kyby6OFmwZ9V3fISSyKS4ebOpgKoO1+H31TNyIbC3OakqbfunRKfnzSSkdl8miShEkA8N/SwKB0gtaC1UKT4Si2iykYAyUU081DN7190DgZzuXxfLF2jjjZSQ/nn3q3UYLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXhwJ/lAdqqPpa2P2dJzsd2jdipQVKlLWeMEXgJnyTg=;
 b=WIBKCFzZv3PqeaY7MryfP2nrnLyl/5SkR/nptE16Sc0Vvz8n9QAznNqyq35AUb3VkivtMkd+cEONnPr7JdbipxMtGPEKQgBk4fwdt/L6iwxZudnXXzv6L7Bdr8jBkhQJzPQHtGygUH5ivF9wRuT5F3RS6DHvnsf00lwmsdbruhg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e9fe1ee4-15ea-402f-8418-0c308afbf1db@amd.com>
Date: Mon, 20 May 2024 15:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-7-luca.fancellu@arm.com>
 <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
 <03C2DB73-2B91-4E74-9CBE-ACA21CDA0783@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <03C2DB73-2B91-4E74-9CBE-ACA21CDA0783@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 43991d18-db56-4050-a3fe-08dc78ccf1be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTkrZEM5MktnSTd3SnFQYjRZNkJrTWZtL3J2S1lMTjQ2SjJmQStaRFJmbHV1?=
 =?utf-8?B?OXVuY2JTSCsrZDRRRTdTdW9jZGpGRzU0YWZyZVg0M0VmcXg2by9vUXNtZWJo?=
 =?utf-8?B?T0tCWWZxUjdaNzRPREtSY3NMUU0zSUR0RFhWZmxuK2VPM3g4TUxuOUVSMjZ5?=
 =?utf-8?B?cUVGVHVBVEdOS3RqelBxbzdWKzZtcEV0VmptVWxuRWNuTDFtcDBSOTVxK3BB?=
 =?utf-8?B?TGRheTNJeEhvNTA3S3JLMUF5OXFQUmxJT21yU3FyRWQyb0xRM3Ixd3dQbTIv?=
 =?utf-8?B?ZUVhWkt3bTIwcTZKWVBUUWJuU01kL05Ib3dRbE9ocW5pVFg1RnNTSkpjL1c4?=
 =?utf-8?B?QTZtV0hiNkhrV21DMnFtUXozckdQaVJsLy9Sbkk2cDhISmUxTFNEOW9uR25i?=
 =?utf-8?B?aDR5aVgvY3pObWhEb1NqQ3hQUU43YlhSd3ZqczF0UHNwRXpDT0RxclhuS0hE?=
 =?utf-8?B?d3NlSU1NSWZQeVZoZXQ3ejArTU9IbTRFcEd3ejBzSm85VkdYUmFpOEZ5eUFN?=
 =?utf-8?B?NzY4SE1WcW9qa3BwMnkxZ0x4bEJTaHlYNU9kQW5WQWR0MzdvQjFvZFJHeXNW?=
 =?utf-8?B?OURjcnF3cDhYUVJVVlJOU2E4ZnE5ek03OGpaSjFHMm5WNXVyeEJxcUplZUZj?=
 =?utf-8?B?MStMekFrVVNyWXg1RGRVR2NZbmxOSlozUFNwa05VRWMrV1BLck5xQURmeEJG?=
 =?utf-8?B?QXA5Wi94d0xMVWY1Z3BjS2VwZkZSSm1TaW9FWkw0ejNqWUxuaStDTXh5Vjlh?=
 =?utf-8?B?dUVyUGJaUDNwdTZvcjFPNXJYTEpwOVRwUGhXc0U4SlUzQnFVdWpNanVrWERV?=
 =?utf-8?B?dDkvZ3R4UWJqNnNDcFp3UFRXbmVOeGhvNlVLYnYrRy9IQkdNVnc4WDcza0l1?=
 =?utf-8?B?Z2FOUXhPTkNPbEtsN2RpbE45K29KWTZqYlczRDBsd0RjM043RFhXWXhlY3g3?=
 =?utf-8?B?RWdIY3J5bWl4SFBXKzVPdXJLSHk3bDk3VXBjdC9mN3FBOTZBRGphQ2N3SENF?=
 =?utf-8?B?d0NvTEpJa2cyNDNtTFczVjdyb000NGdjcG1OeG5JeW5XZDhrbndzWlNRWFVx?=
 =?utf-8?B?bFVmRTB2cTQ3dHBDaFVlSGV1d3lwbWdXTUZOWEc3WWhvdkN4QnVwcC84L0NZ?=
 =?utf-8?B?VUtUWkZONFFVOXhtT2loVVQyZEQ5SzVsK01SclZBcnVQUDhZWkFEbS8xdUQ2?=
 =?utf-8?B?WEMzWDJSQTRHN2ZDV3VRc0xGYlRrbzNBM2kzYStWdFQvNHhubWZ4Z2FhUlFa?=
 =?utf-8?B?VzNIOE0vS1JRTldVODJhQk5BMnhFV0xpN2Q1MERsbFQvY1I1R2hnODRYNVNM?=
 =?utf-8?B?WTY3RFB3VkZNS0g2bS96RzByTm5oRUc3OW9aQ3RleUhHbVRLQjBIUGVYY1hY?=
 =?utf-8?B?bHhLdlRxMER2NlNiUE5lNXVlVy9Edmxia3o1WG9WVkFpVE1FeTRjTGlieUU3?=
 =?utf-8?B?SjZORlpYb3puNExPdHlPTFZhRFBNK3hEand6bzF6RnUvV0g4cjZUNkM5MjNH?=
 =?utf-8?B?KzEwYzd0dEpkTlZ6R2l1WnUwY3l3Um5WZno4UlFxSzZyT29DK2d5VXhmZDEy?=
 =?utf-8?B?b1JJZWNFT2p5RGRKNEhVSzdwbHhVZlMvTFRLU3Faanl4KzAySmRDM1ZhcWxK?=
 =?utf-8?B?OFNQeFZHaEVYeTFUeDNnbDlRek5rbXNHM3RxQWw0dGdYeWRJUlR4Z3Z1dFV1?=
 =?utf-8?B?UDRNOTI3SU1oWE0zZFJHZjdiRnVrbExkRFJhbkgySWVvZDAzNUV2VFNyQWpL?=
 =?utf-8?B?R1JEcUl5WlN0RHlyemJsV2lQMzNDR0E0R2t5NWNZMWxlZGxFbTlSK1lxKzZu?=
 =?utf-8?B?VkxWcU9JUjZrZkg4aGJwUiswK3YrbHlha0RBeVBINFVvZXNRZUZHSENCYWRm?=
 =?utf-8?Q?wXM4Io3r/y6aj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 13:01:20.3607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43991d18-db56-4050-a3fe-08dc78ccf1be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123



On 20/05/2024 14:44, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 20 May 2024, at 12:16, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 15/05/2024 16:26, Luca Fancellu wrote:
>>>
>>>
>>> This commit implements the logic to have the static shared memory banks
>>> from the Xen heap instead of having the host physical address passed from
>>> the user.
>>>
>>> When the host physical address is not supplied, the physical memory is
>>> taken from the Xen heap using allocate_domheap_memory, the allocation
>>> needs to occur at the first handled DT node and the allocated banks
>>> need to be saved somewhere, so introduce the 'shm_heap_banks' static
>>> global variable of type 'struct meminfo' that will hold the banks
>>> allocated from the heap, its field .shmem_extra will be used to point
>>> to the bootinfo shared memory banks .shmem_extra space, so that there
>>> is not further allocation of memory and every bank in shm_heap_banks
>>> can be safely identified by the shm_id to reconstruct its traceability
>>> and if it was allocated or not.
>> NIT for the future: it's better to split 10 lines long sentence into multiple ones.
>> Otherwise it reads difficult.
> 
> I’ll do,
> 
>>>
>>> xen/arch/arm/static-shmem.c | 186 ++++++++++++++++++++++++++++++------
>>> 1 file changed, 155 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>> index ddaacbc77740..9c3a83042d8b 100644
>>> --- a/xen/arch/arm/static-shmem.c
>>> +++ b/xen/arch/arm/static-shmem.c
>>> @@ -9,6 +9,22 @@
>>> #include <asm/static-memory.h>
>>> #include <asm/static-shmem.h>
>>>
>>> +typedef struct {
>>> +    struct domain *d;
>>> +    paddr_t gbase;
>>> +    const char *role_str;
>> You could swap role_str and gbase to avoid a 4B hole on arm32
> 
> Sure I will,
> 
>>
>>> +    struct shmem_membank_extra *bank_extra_info;
>>> +} alloc_heap_pages_cb_extra;
>>> +
>>> +static struct meminfo __initdata shm_heap_banks = {
>>> +    .common.max_banks = NR_MEM_BANKS
>> Do we expect that many banks?
> 
> Not really, but I was trying to don’t introduce another type, do you think it’s better instead to
> introduce a new type only here, with a lower amount of banks?
I'd be ok with meminfo provided you add a reasoning behind this being meminfo and not shared_meminfo.

> 
> Because if we take struct shared_meminfo, we would waste mem for its ‘extra’ member.
Would it result in a smaller footprint overall?

> 
>>>
>>> static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
>>> +                                       bool bank_from_heap,
>>>                                        const struct membank *shm_bank)
>>> {
>>>     mfn_t smfn;
>>> @@ -109,10 +138,7 @@ static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
>>>     psize = shm_bank->size;
>>>     nr_borrowers = shm_bank->shmem_extra->nr_shm_borrowers;
>>>
>>> -    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
>>> -           d, pbase, pbase + psize);
>>> -
>>> -    smfn = acquire_shared_memory_bank(d, pbase, psize);
>>> +    smfn = acquire_shared_memory_bank(d, pbase, psize, bank_from_heap);
>>>     if ( mfn_eq(smfn, INVALID_MFN) )
>>>         return -EINVAL;
>>>
>>> @@ -183,6 +209,7 @@ append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
>>>
>>> static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>>>                                          const char *role_str,
>>> +                                         bool bank_from_heap,
>>>                                          const struct membank *shm_bank)
>>> {
>>>     bool owner_dom_io = true;
>>> @@ -192,6 +219,9 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
>>>     pbase = shm_bank->start;
>>>     psize = shm_bank->size;
>>>
>>> +    printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys 0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
>>> +           d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);
>> This looks more like a debug print since I don't expect user to want to see a machine address.
> 
> printk(XENLOG_DEBUG ?
Why would you want user to know the machine physical address? It's a heap address.

> 
> 
>>>
>>> int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>                        const struct dt_device_node *node)
>>> {
>>> @@ -265,37 +329,97 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>         pbase = boot_shm_bank->start;
>>>         psize = boot_shm_bank->size;
>>>
>>> -        if ( INVALID_PADDR == pbase )
>>> -        {
>>> -            printk("%pd: host physical address must be chosen by users at the moment", d);
>>> -            return -EINVAL;
>>> -        }
>>> +        /* "role" property is optional */
>>> +        dt_property_read_string(shm_node, "role", &role_str);
>> This function returns a value but you seem to ignore it
> 
> Sure, I’ll handle that
> 
>>>
>>> -        ret = handle_shared_mem_bank(d, gbase, role_str, boot_shm_bank);
>>> -        if ( ret )
>>> -            return ret;
>>> +            if ( !alloc_bank )
>>> +            {
>>> +                alloc_heap_pages_cb_extra cb_arg = { d, gbase, role_str,
>>> +                    boot_shm_bank->shmem_extra };
>>> +
>>> +                /* shm_id identified bank is not yet allocated */
>>> +                if ( !allocate_domheap_memory(NULL, psize, save_map_heap_pages,
>>> +                                              &cb_arg) )
>>> +                {
>>> +                    printk(XENLOG_ERR
>>> +                           "Failed to allocate (%"PRIpaddr"MB) pages as static shared memory from heap\n",
>> Why limiting to MB?
> 
> I think I used it from domain_build.c, do you think it’s better to limit it on KB instead?
User can request static shmem region of as little as 1 page.

> 
>>>
>>> +                for ( ; alloc_bank < end_bank; alloc_bank++ )
>>> +                {
>>> +                    if ( strncmp(shm_id, alloc_bank->shmem_extra->shm_id,
>>> +                                 MAX_SHM_ID_LENGTH) != 0 )
>> shm_id has been already validated above, hence no need for a safe version of strcmp
>>
> 
> I always try to use the safe version, even when redundant, I feel that if someone is copying part of the code,
> at least it would copy a safe version. Anyway I will change it if it’s not desirable.
> 
> Cheers,
> Luca
> 
> 

~Michal

