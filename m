Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8E79A7C9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 14:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599361.934749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffcu-0002sZ-KA; Mon, 11 Sep 2023 12:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599361.934749; Mon, 11 Sep 2023 12:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffcu-0002qH-Gx; Mon, 11 Sep 2023 12:02:48 +0000
Received: by outflank-mailman (input) for mailman id 599361;
 Mon, 11 Sep 2023 12:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qffcs-0002qB-9C
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 12:02:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e83::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d630b6e-509b-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 14:02:44 +0200 (CEST)
Received: from BYAPR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:74::20)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 12:02:39 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::e9) by BYAPR05CA0043.outlook.office365.com
 (2603:10b6:a03:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.16 via Frontend
 Transport; Mon, 11 Sep 2023 12:02:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 12:02:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 07:02:35 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 07:02:34 -0500
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
X-Inumbo-ID: 1d630b6e-509b-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NueESfxeMgG4XHkOWCyGVvQiTO859PnePXR0reR2HVDIvWHwTBTrdRZYSs0rDD2ZUR4x7LVyhZm9/AYlGZmu39J7I3O9ti+GdLOBSJUGXvDdyHqKHcDrxu6YHgqi8DgYXumqIHx9ffcsqAfqD4SYYlXvg7s2Di+CzMjxeHs/NWqg4ySApfDDOiVxDDb6b7mQ3QdFfQ/oQGeLCKiX7n+ZMi7GITkvSbHcrRpBjKiwrvzQupdEZwIQ4/CFQ1+xUDDah2kU4O+Z17NUJhlT0Uv0AivACaVHt6uOB1r40gPvSXsUTF+AwkTZET+4oVM6xv4IEI8dMRJtRyHALBE1ky9WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oII/rPm1Gqy4qFZDCTDEaUsd7H27lVYybz811D1Db9o=;
 b=ivl9E8Dk6OoM+KFEHKBJ+BuSvxAbl9+BN2gEwlmKKliten+x/c5OMD3xi2WxjZavL+4Gv1db1wdKdSIdHbKD9AQ3OsT4aD5apzseWVXwLhFnYupkvfn7FAdk8NY87NwsbAB2T2ZLSr0XTeFn6GxETkAIlMyeH0W2Mt59BqQOwISdIHBMw2dIEsaaV9Tv3MYT0GyUUPg1fmlcirMQZF8YhnRjv0R/D+hmAfyqUFvwfI0j5uxckkJAc5NToQpos3cY2o11HYM821yAJQCDcyAbxUMcvxEpjdTMNl6A/thJLiynA6jcwLiv9r/dwM6PhtyDvozrDRK/cc9qu5SDtjILnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oII/rPm1Gqy4qFZDCTDEaUsd7H27lVYybz811D1Db9o=;
 b=mIUFgR6FeUm5hl1Yv7aAcoO1Qi6s5CvlKC/Rzky8pUOaor0K5UTv8AyjcQMCe6s9S8c4TmVqgqpFpDR23v8XDyFzQFeq5gWr3WNqGNcMQfoJSr/l/vytsavgS+7jWx3g/6ITGvdUTzLV3ow/nMlQ8bi99BG4ohC6DkhioWZt1ts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <762c7e90-d33c-9074-1c94-13a1c5db1ca6@amd.com>
Date: Mon, 11 Sep 2023 14:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 09/10] xen/arm: fix duplicate /reserved-memory node in
 Dom0
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <20230911040442.2541398-10-Penny.Zheng@arm.com>
 <5212bdc4-9bce-fc5d-8a47-ae5e5fef37e3@amd.com>
 <61810692-e44d-7548-4734-b96c3b79b437@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <61810692-e44d-7548-4734-b96c3b79b437@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6df5e0-5548-4e5b-7cc2-08dbb2befe3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+WzMuT3R6i9CiD5Hyi+pvIM5yz2C4IRE8tdziNQDK0NBjrZSNSrea3zTk3CGsUMvkpyGQxE2051Rn5COut4Ikzg5+fBFWjn+aEQ0GCR9K8gIXwl/FnFyAjmY78hcPAsOVEbxMMPOaa5sYRARg1A6rj6eZgUcyVUjL6ofMzfmJdQZSSc7vvNvTsQShmjxx44tvrlf5Yj1fjPwSE+XEy10QLAxwEAWfBTzRcGOejREPiQCwou1tC7YgCAa1ZOsCbNXir2r79O/J89Nd8RStQHIDKfl+VcsO9NGNZ95ki7pGwHixV2lq8FpZYZzwYBpaQpScsUzPFP2xpvUkRG279bok8u6Du1eItWnnSFnxnjeLUNHN4+BdIgQOqTqqg7Mg82pvqtAYSJIPozReBxlEC3vkqCSUrlzugO+FRbvmmm0ijIKfMN4l/6wgoZghd1jAw6Cs4QY/NXTbd1MQNRA4Nr2R2feuINqix3+GYQJ38JWAZNnv+Ceq63Oz/PTLmXGIBYJ8lJ4hMkMTJpSiP9Efpv0k6VIsTGlJUGoqRO/eIaVu1Qds/EJKsrhgotb9TF3HorMyZ4ZZziniIu+kmNkmDLfaEUVlYMQw8b2SFL2n+AO9RVS4xVCeD6BIlJnu3+LZfN7yQfHkM3zc8jNFKih8EKgjex1YIqbJHngQ/7tMTrk/DKKpxJFLMWZAHJ40jqhXjwu6sE2eUZTm1p4LQF4+IzPQt6TZNz3HcjKRPD4a37kzBSm2qmzdoi2PmYE+xA+pnx/9fpboH7i32bcsWsHJH2+v+qAmbORtgNLvbGIoo4EdIpS+bWDJ3y5MVUHxnEUeE8g+6eV//CfGepDTwyL2QKJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(36756003)(40480700001)(86362001)(40460700003)(31696002)(478600001)(41300700001)(53546011)(4326008)(8936002)(8676002)(2906002)(54906003)(44832011)(5660300002)(70586007)(16576012)(70206006)(110136005)(31686004)(316002)(36860700001)(47076005)(83380400001)(26005)(426003)(336012)(2616005)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 12:02:38.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6df5e0-5548-4e5b-7cc2-08dbb2befe3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939

Hi Penny,

On 11/09/2023 12:39, Penny Zheng wrote:
> 
> 
> Hi Michal
> 
> On 2023/9/11 17:40, Michal Orzel wrote:
>> Hi Penny,
>>
>> On 11/09/2023 06:04, Penny Zheng wrote:
>>>
>>>
>>> In case there is a /reserved-memory node already present in the host dtb,
>>> current Xen codes would create yet another /reserved-memory node specially
>> s/codes/code/
>>
>>> for the static shm in Dom0 Device Tree.
>>>
>>> Xen will use write_properties() to copy the reserved memory nodes from host dtb
>>> to Dom0 FDT, so we want to insert the shm node along with the copying.
>>> And avoiding duplication, we add a checking before make_resv_memory_node().
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>
>>> ---
>>> v3 -> v4:
>>> new commit
>>> ---
>>>   xen/arch/arm/domain_build.c       | 31 ++++++++++++++++++++++++++++---
>>>   xen/arch/arm/include/asm/kernel.h |  2 ++
>>>   2 files changed, 30 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 02d903be78..dad234e4b5 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1401,6 +1401,10 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>>>       return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
>>>   }
>>>
>>> +static int __init make_shm_memory_node(const struct domain *d,
>>> +                                       void *fdt,
>>> +                                       int addrcells, int sizecells,
>>> +                                       const struct kernel_info *kinfo);
>>>   static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>>                                      const struct dt_device_node *node)
>>>   {
>>> @@ -1549,6 +1553,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>>           }
>>>       }
>>>
>>> +    if ( dt_node_path_is_equal(node, "/reserved-memory") )
>>> +    {
>>> +        kinfo->resv_mem = true;
>> kinfo structure is used to store per-domain parameters and presence of reserved memory in host dtb
>> does not fit into this. Moreover, there is no need to introduce yet another flag for that given
>> that in other parts of the code in Xen we use bootinfo.reserved_mem.nr_banks to check if there are
>> reserved regions.
>>
>>> +
>>> +        /* shared memory provided. */
>>> +        if ( kinfo->shminfo.nr_banks != 0 )
>>> +        {
>>> +            uint32_t addrcells = dt_n_addr_cells(node),
>>> +                     sizecells = dt_n_size_cells(node);
>>> +
>>> +            res = make_shm_memory_node(d, kinfo->fdt,
>>> +                                       addrcells, sizecells, kinfo);
>> I haven't yet looked at previous patches but does it make sense to request passing both kinfo->fdt and kinfo?
>> IMO, the latter would be sufficient. This would apply to other functions you modified.
>>
> 
> yes, the latter would be sufficient. I'll fix it in next version.
> 
> 
>>> +            if ( res )
>>> +                return res;
>>> +        }
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>
>>> @@ -2856,9 +2877,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>>>                   return res;
>>>           }
>>>
>>> -        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>>> -        if ( res )
>>> -            return res;
>>> +        /* Avoid duplicate /reserved-memory nodes in Device Tree */
>>> +        if ( !kinfo->resv_mem )
>> No need for a new flag as mentioned above. Just before this line of code there is a check:
>> if ( bootinfo.reserved_mem.nr_banks > 0 )
>> {
>>      res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
>>                              &bootinfo.reserved_mem);
>>      if ( res )
>>          return res;
>> }
>> so you can just append the following:
>> else
>> {
>>      res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>>      if ( res )
>>          return res;
>> }
>> to achieve the same without a need for a new flag.
> 
> 
> Right now, bootinfo.reserved_mem is not only containing reserved regions
> described in host FDT /reserved-memory, but also the reserved ones for
> domain only, like in xen,static-mem = <xxx>.
> So simply with non-zero bootinfo.reserved_mem.nr_banks, we couldn't tell
> whether we had a /reserved-memory node in host FDT.
> 
> I agree that kinfo is not a good place to store whether host FDT has a
> /reserved-memory node. Maybe bootinfo.has_resv_memory_node?
Yes, I see. So we have 2 options:
1) Introduce flag under bootinfo (just like static_heap)
2) Inside make_resv_memory_node(), do a check e.g.:
for ( i = 0; i < bootinfo.reserved_mem.nr_banks && (bootinfo.reserved_mem.bank[i].type == MEMBANK_DEFAULT); i++ );
to see if there is a /reserved-memory node (i > 0).

~Michal

