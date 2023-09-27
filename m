Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256D7B04AD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 14:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608924.947738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlTyy-0000Nd-SA; Wed, 27 Sep 2023 12:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608924.947738; Wed, 27 Sep 2023 12:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlTyy-0000Lm-PO; Wed, 27 Sep 2023 12:49:36 +0000
Received: by outflank-mailman (input) for mailman id 608924;
 Wed, 27 Sep 2023 12:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eJCl=FL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qlTyw-0000Lg-GR
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 12:49:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4fc220-5d34-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 14:49:32 +0200 (CEST)
Received: from DS7PR03CA0311.namprd03.prod.outlook.com (2603:10b6:8:2b::23) by
 SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 12:49:27 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::2c) by DS7PR03CA0311.outlook.office365.com
 (2603:10b6:8:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Wed, 27 Sep 2023 12:49:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 12:49:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 07:49:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 07:49:25 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 27 Sep 2023 07:49:24 -0500
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
X-Inumbo-ID: 4d4fc220-5d34-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHjnPgu3NZNR30spJ9vuBjUs8w0FYxXSWwLtlGdLJM2Pi5XdkLBIwO9GhhkQPPgcPs2f6wTWt9gOBQkp8BFfD2uo17skIPJtdrFIfEGdfH/ZIs+z68iHGq1rOakFlvqCGUNhXpPHZJ5ivg8ELllvZAgvY3QKBhJvS2naoK2zuDnsrem18FdBzXoyjza/XeBw7+6WhhNd2g6uU2XijpuS2Ss6oEVaMO1IGN8MpdvqO6AptZe2rRKmZ9iHwOfnRqB5Vo3dvucFUL4BfB99KSfyC337mkYfNBxGMYaUm1oQTv3jrro+zSE4I2o1S1txoU5Oon1+x6T/a62avu1v0bRJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krWSpJxCG15kfLt9wnpPwPMoHEqbTjBN/EwRJsLeLiQ=;
 b=QCZ1mw+2JNMu3IL6T8+ypbnz/kXuiImaINgzzarndRDh98tDm3Gufr6b3tuB/iXc5aFKfWW+0O9BD3GcYFwu8F5KoHeQb2NoPgQ3Ue0/NVyQHY3bKVJGbx2Omkznpk9QcXDch26aVTww+O+BOWoibgIQzhLCDiVpjX7IG8lnJ4m/JTVtAAVHqcjLP9p1eNDLH6TMbYaYAqArIEm9OoHj07D4XlcJXYQ98A7HitvKwHm+1LOmsVxhdHJ4X7D5+RhTruGmMEVqTeWMY2UbUt/hybpBK/cpNfSHE4zrulm2serGyJP6a+pM3cwhqZFXqlcLBr79bI0UvsIFFEsRDr2Mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krWSpJxCG15kfLt9wnpPwPMoHEqbTjBN/EwRJsLeLiQ=;
 b=JgZEemHLrIO61i/gCNJugwPhqF7k4Qwsy3W5fQY7isV4ZDxlXLAj2YLyRC1cxf1PmmbFK+3X1zs8L+aKm4UBOqhR2Z7XzTNU9eMuL7FmrmR3bRq6yx5uFbOi5SMqv9GMgza0DYxuazIocZHWmNqpunJhtJsbhDtkctQ13bHgoC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3964a12c-b808-2ee4-9651-68c21ead817b@amd.com>
Date: Wed, 27 Sep 2023 14:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Leo Yan <leo.yan@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
 <36d8f5ce-ef87-40cc-9515-12a2007bfa6d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <36d8f5ce-ef87-40cc-9515-12a2007bfa6d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SA3PR12MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: b214813a-2598-4114-4a82-08dbbf582ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GImvHBPMIQf37XkM3U6TFVL1RqxzhbA8Y85Kd61TC7qaao+QVYXzRQQIBzzlUhOgMxa0O4I2LKRaRSWgEnUp9AojB+dWi3rVyu3WSZwSS7xZIfXoBH84xJNOpolD+mMCaRhtacGr8VAMpdRQJoItQL/8AhoGdByjIgREnqm0Gr0yr4JPSv18kzk1LnZlHiS44dW9A8EfxfNi4iaXfOTCWrp3IK0ODgWLUnZoMg2//i8Om1GUutyFXN0H/yeYjNyZQoyVbY5N1c63KkGgxnbaSw8gIWCxTZ6qk29ARXrUN9gPHx/AnXMIr3akBSehNSawbLo6MwNA+eCHhvxOz0FcM5q2I/P+CXLklpgDoIiMtKGJhd/nJg8h9Uu4gK+rtQZHstavkrutaqmq5LNImv+6ig0/MxRF434NPUwZtJVyDAB5zUknUnaElx7vlw9qCSmOtJhhte/jrdwNMnD4YlEVDT7t9giZEtnkBPbm3AZrfB9JdJZQUshTWefuPuhUVFVnxnGEyt8yAzoklfYXjteNSTjMAsfkVI6Lxqvi/+rK/6bKYNCi/BoC3g+o1UJOVpkAmGTYXgudVC75/23WhRfjGS+ahBbPrP+KwCPk55uYmNw+hfczp6yrlAI2rkWnmySTyIOHMF/IxA/W2eUBJJ5RjjIwiCaH8feA+BkXOIqZjvkWei3UHSbnIJmF9ZO71j9bS11JjAJK4MUdqSYd7wx2FlUvxe4xXGTCjD4EnypbAuoeGI8wLgS8Lfzmjde42RQYS8Usf7uARS25cCDHcz+6f2zxZpIylAsyvA7lfMcsmkRg6ZBqwkPlhs2NzHTCpCE3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(2906002)(47076005)(83380400001)(478600001)(4326008)(5660300002)(8676002)(70586007)(70206006)(336012)(426003)(44832011)(26005)(8936002)(36860700001)(41300700001)(110136005)(54906003)(316002)(16576012)(2616005)(31686004)(82740400003)(53546011)(81166007)(356005)(31696002)(86362001)(36756003)(40460700003)(66899024)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:49:26.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b214813a-2598-4114-4a82-08dbbf582ea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000

Hi Julien,

On 27/09/2023 13:01, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 26/09/2023 09:36, Michal Orzel wrote:
>> On 26/09/2023 07:33, Leo Yan wrote:
>>>
>>>
>>> During the Linux kernel booting, an error is reported by the Xen
>>> hypervisor:
>>>
>>>    (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
>>>
>>> The kernel attempts to use an invalid memory frame number, which can be
>>> converted to: 0x1a02dc << PAGE_SHIFT, resulting in 0x1_a02d_c000.
>>>
>>> The invalid memory frame falls into a reserved memory node, which is
>>> defined in the device tree as below:
>>>
>>>    reserved-memory {
>>>            #address-cells = <0x02>;
>>>            #size-cells = <0x02>;
>>>            ranges;
>>>
>>>            ...
>>>
>>>            ethosn_reserved {
>>>                    compatible = "shared-dma-pool";
>>>                    reg = <0x01 0xa0000000 0x00 0x20000000>;
>>>                    status = "disabled";
>>>                    no-map;
>>>            };
>>>
>>>            ...
>>>    };
>>>
>>> Xen excludes all reserved memory regions from the frame management
>>> through the dt_unreserved_regions() function. On the other hand, the
>>> reserved memory nodes are passed to the Linux kernel. However, the Linux
>>> kernel ignores the 'ethosn_reserved' node since its status is
>>> "disabled". This leads to the Linux kernel to allocate pages from the
>>> reserved memory range.
>>>
>>> As a result, when the kernel passes the data structure residing in the
>>> frame 0x1_a02d_c000 in the Xen hypervisor, the hypervisor detects that
>>> it misses to manage the frame and reports the error.
>>>
>>> Essentially, this issue is caused by the Xen hypervisor which misses to
>>> handle the status for the memory nodes (for both the normal memory nodes
>>> and the reserved memory nodes) and transfers them to the Linux kernel.
>>>
>>> This patch introduces a function memory_node_is_available(). If it
>>> detects a memory node is not enabled, the hypervisor will not add the
>>> memory region into the memory lists. In the end, this avoids to generate
>>> the memory nodes from the memory lists sent to the kernel and the kernel
>>> cannot use the disabled memory nodes any longer.
>>
>> Interesting. So FWICS, we have 2 issues that have a common ground:
>> 1) If the reserved memory node has a status "disabled", it implies that this region
>> is no longer reserved and can be used which is not handled today by Xen and leads
>> to the above mentioned problem.
>>
>> 2) If the memory node has a status "disabled" it implies that it should not be used
>> which is not the case in current Xen. This means that at the moment, Xen would try
>> to use such a memory region which is incorrect.
>>
>> I think the commit msg should be more generic and focus on these two issues.
>> Summary:
>> Xen does not handle the status property of memory nodes and ends up using them.
>> Xen does not handle the status property of reserved memory nodes. If status is disabled
>> it means the reserved region shall no longer be treated as reserved. Xen passes the reserved
>> memory nodes untouched to dom0 fdt and creates a memory node to cover reserved regions.
>> Disabled reserved memory nodes are ignored by the guest which leaves us with the exposed
>> memory nodes. Guest can access such a region but it is excluded from the page management in Xen
>> which results in Xen being unable to obtain the corresponding MFN.
>>
>>>
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>> ---
>>>   xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>> index 2673ad17a1..b46dde06a9 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -206,11 +206,27 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>>>       return 0;
>>>   }
>>>
>>> +static bool __init memory_node_is_available(const void *fdt, unsigned long node)
>> This function is not strictly related to memory node so it would be better to call it e.g. device_tree_node_is_available.
> 
> +1.
> 
>>> +{
>>> +    const char *status = fdt_getprop(fdt, node, "status", NULL);
>>> +
>>> +    if (!status)
>> white spaces between brackets and condition
>> if ( !status )
>>
>>> +        return true;
>>> +
>>> +    if (!strcmp(status, "ok") || !strcmp(status, "okay"))
>> white spaces between brackets and condition
>> if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
>>
>>> +        return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   static int __init process_memory_node(const void *fdt, int node,
>>>                                         const char *name, int depth,
>>>                                         u32 address_cells, u32 size_cells,
>>>                                         void *data)
>>>   {
>>> +    if (!memory_node_is_available(fdt, node))
>>> +        return 0;
>> I would move this check to device_tree_get_meminfo()
> 
> I am ok with that. But the commit message would need to gain a paragraph
> explaining that we will now support "status" for static memory/heap.
> 
>>> +
>>>       return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
>>>                                      data, MEMBANK_DEFAULT);
>>>   }
>>> --
>>> 2.39.2
>>>
>>>
>>
>> Also, I think it would be nice to add ASSERT(bootinfo.mem.nr_banks); e.g. in boot_fdt_info().
>> Otherwise the panic from Xen when there is no memory bank:
>> The frametable cannot cover the physical region ...
>> is not really meaningful for normal users.
>>
>> This is just my suggestion (@Julien ?)
> 
> I think a check for the number of banks makes sense. But I would prefer
> if the check also happens in production. So, something like:
> 
> if ( !bootinfo.mem.nr_banks )
>    panic(...);
> 
> We already have one in the setup_mm() for arm32. So we need another one
> for the arm64 version. The other solution is to consolidate it in one
> place you suggested.
> 
> I have a slightly preference for having it in setup_mm() even if this is
> duplicated.
Either way is fine. The advantage of placing the check in boot_fdt_info() is
that we can have a single check instead of duplicated and we do the check before
the "first" use which happens to be the banks sorting. The advantage of setup_mm()
is that it is the one dealing with memory banks and is called after early_print_info()
so user can see some additional info.

@Leo, will you send a patch for that? Don't feel obliged as it is not strictly related
to your patch in which case I can handle it.

~Michal

