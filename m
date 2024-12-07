Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3279D9E8058
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 16:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850727.1265094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJwMo-0002MU-Ek; Sat, 07 Dec 2024 15:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850727.1265094; Sat, 07 Dec 2024 15:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJwMo-0002KH-Bm; Sat, 07 Dec 2024 15:05:10 +0000
Received: by outflank-mailman (input) for mailman id 850727;
 Sat, 07 Dec 2024 15:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7LW=TA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tJwMn-0002KB-09
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 15:05:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a452d76a-b4ac-11ef-a0d5-8be0dac302b0;
 Sat, 07 Dec 2024 16:05:07 +0100 (CET)
Received: from BL0PR0102CA0023.prod.exchangelabs.com (2603:10b6:207:18::36) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Sat, 7 Dec 2024 15:05:00 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::9d) by BL0PR0102CA0023.outlook.office365.com
 (2603:10b6:207:18::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Sat,
 7 Dec 2024 15:04:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Sat, 7 Dec 2024 15:04:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 09:04:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 09:04:59 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 7 Dec 2024 09:04:57 -0600
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
X-Inumbo-ID: a452d76a-b4ac-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+xV5UCkagxsqwrsK//7NBd9QQfoR1cdZ/75Iou2SlGhTenxlneqF7vkYepM0C7QU/zQSyCpsG31JlyN8MXv6fnSbpSYAoL9v2i+aomS8PpWMzb7eirORHwAM7TKiMFziBTxhPPOw7FwI7Sg6mzEhbdQwnfKciwUeyo7bb29WDg2Qm1vtXKrC79kgWM01hsxQZZn++4fy742dFMfacYqHmIg1kPSjJ4cbo+gEUSORAeAsxqqIkcfESA2bL7oin9hmCl6qjzIIUljHJJAKZVD5cufUuFKsrKblwF9XXRhcJB53501cat8/loUAl5aUIhHlbjvI71Xkfstpfm1XNl/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Goaf2cLRAl/AL80zw5mgkKLWyhL9ZglY54NrZBl+zd4=;
 b=CfaxSvdkxQa5DN1if0WV3ZAp4FbO+77Xt6caIpqd3JTQJp7B2fPW7BzUXOdcAIHiVdjE820iQtvrZSiblH7NEpyomj+cpyqC86JZpPx7ONLAwgOq9HGGfyjcgAetPJSHrtWUBR3D/RlCdZGZpBOcGdW7wcdmVFL7cmYMujc1IRXr7DWtYH9uqziu1+olgJq+/EYeo+XusuQZdkcuCIKm91sgSJeVAqqf0wJjZybAAZuzcbKlNBo7ks7kYjJrzEuuZKVRCFvXgtYmXgd/p5Qg/kLE3pkjDLCWfENNaW2dp+wKyakGFE7tOETwWw3RvkKKBEB8G1RhDs+mwZqpPOgYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Goaf2cLRAl/AL80zw5mgkKLWyhL9ZglY54NrZBl+zd4=;
 b=fHGsLO1hoXNyqriMOBcgETF03JA7FkQBGbLrvjK0z5l9/0+dDdCz6q68HLf3wT1hEHuAhRJVdvW+7QMjb9Z206KS8hbzAlXsrgjqreVCjWVqkfv73zVI1s2lcp5SNFBTQYIzRznUX5UJxJcrN3p82l4jWKx7MbwHlraEoFkoSjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
Date: Sat, 7 Dec 2024 16:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Julien Grall <julien@xen.org>, Carlo Nonato
	<carlo.nonato@minervasys.tech>, <xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7debb1-de9a-462e-d190-08dd16d08531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3ZNWVI1QmFtTjlHZ1JPWnZwV2ZMZ2NIc0Y3dTRTazNudEw1aUFad20xMGxn?=
 =?utf-8?B?S0FrQm1nRE1aL2RuVkxxdEFYU2QzbHd0dDFIcUY5ZjJoeXVjTmJRdmdFZWJJ?=
 =?utf-8?B?aWNaUUJOWkNzUE5CQmYyZGU1NlVsY2ZmTzhrZVhRbTVoWHV6V1VzNnZXV0Ns?=
 =?utf-8?B?RWkvNyt0dHJmL2E1a1lId0hITzFQUDVqc2thd2hSdzE4Tk5vdTNWVE51UUor?=
 =?utf-8?B?eVRsMjQrVUFnc05rRFVxSEdBd0JFNEsyQVJlRjArSG81dys3WGhoQXBZS2F2?=
 =?utf-8?B?QUJnU3NmZ1pJOXRNUFkwSmZvT0RhMFpsdmF2aWpOK3M3NUlkcWo4Qk9HN1U1?=
 =?utf-8?B?ZGhYeUwwZ2lEdzF2eHhVM1FUbXNRWUJ5bDZpblBOb09tV2Z6V2ZLNmt3blVz?=
 =?utf-8?B?UlZINVBING4waG9uR0cyS2l3QTRHSkxkblJGSWxvUnJPQWNHS0tyRTFETGk0?=
 =?utf-8?B?NERVb0Vmb2ZpWW5KU3FWR0I4eUtRMFFvRmI2ckVEdDJpY09JcDZ5ekNzNWpv?=
 =?utf-8?B?RmwvYS9VQTZOLzlKSXphdnZScFAvS2U5ZUx4T3R0T2xub2pCbHdpdVdLSnF3?=
 =?utf-8?B?bExveUlZbVVxWnU4UEpTdHQrT1FzSFlUU1p4NzF1c3VZQ29iQVY1TVNpTHk3?=
 =?utf-8?B?K3M2TnZSY09MVkV5QmRwZnF5V0dNZjFhZjdIaUc1eHpjRkd3WUtHOHVCdGtk?=
 =?utf-8?B?NlhVdTh2eVdsYzh5TTBLOTJuWmZEcEZQNi9NblVPY1ROVTZXUXkraUVlb1V3?=
 =?utf-8?B?Sk1NTmJ4Yy9rUk5Oc1dTNVNZYThBcldIU0twYU9SaW91R3kvdTVNNU4zeWJN?=
 =?utf-8?B?clRFOUNuYjJxU1RIaFZaNGQxQkZhQlVuUVdlenp3Q1ZaRlJMOW1tNjhSZGY5?=
 =?utf-8?B?TFJvMnJMYnQ1bS84TW1SMU83ZmZlVWRHdFBERHcvOG5lNnF0OVNRUnhYelU4?=
 =?utf-8?B?RVlpQ3E2L3o5ZkV6bi9KcERCRWFNRStlb1doT2VseDBOQ3pDYWZucnc5REdn?=
 =?utf-8?B?S3pIOEVXZTEyUld4ZTBRKzZNMDZKSklPY2FaWEo3ZHFBbXZWL0ordEx0QXkr?=
 =?utf-8?B?cnd6dDRkRm1UNTlRRkxOcFNwWHZBM3BPeHYxdDg2UFdNNDNZN2wybDVjNHov?=
 =?utf-8?B?UDRKRVBRODRDM09zQTFEYmtRM2NSY28xMnNVU1Y2ODd1M0kreXhOb2hKS2pG?=
 =?utf-8?B?Q0JYNnVJWUFiVStnRWhuVWZIdERld1VoYm5mT09GZW9LSEJ1NHE3dURNNGpP?=
 =?utf-8?B?cmhZNlFaRWowSWsxcXlxR2d4QVNYWFkxZk5JR0s4b1BYVU9oalVUM3UvY3Ni?=
 =?utf-8?B?Sm9NV1hpKzRidDZwNi9rdE9pNS9XZDBOZ2g0bHlJVFNsbTAya0RmR3FrcmJH?=
 =?utf-8?B?YlZHU0NUa0NhL3dIVXZtYnpwcFc2UHFZREVVcDR6T0NIeFFVTWJkMFZySzBi?=
 =?utf-8?B?OFp6VjVjL1VFRGcrN1FYVzZ2SEE1WnFaOWhUVXJrYlVRT1h3bExIb0VreUdO?=
 =?utf-8?B?Vmc0RzVpbmlqL2ZrVnFaQlJxT1plam1QYk9Fa2RFakxCallMck1KSURhK1Aw?=
 =?utf-8?B?aUNmMXE2WWdRU3I2UG5LRHlsVm9YdmVDSlJFVFhvR0NwNGRHekQ2VUJxeGJK?=
 =?utf-8?B?VzFsVFB0c2l6STUrRXBUYytZTUNPbTloSWRkZzh1K2QzSStjdSsxSzJiMVhX?=
 =?utf-8?B?OVBQZG1ld0FYeUJXU0FyY1J4WWNBaUlEc2Z5MVZRR2FZd2JRSmZVTTU2Ly8r?=
 =?utf-8?B?cEdZQ3hhZWdNUmUwenFMbFJmc0dkY205SVNHa2E1V2lJUDlkOURIUUp6N0hM?=
 =?utf-8?B?NnJpajRDYmhLWFVZTWhsa2hOeWVqVFFYdE9PcldvTzdNMGQyMW9MKzNFNFlo?=
 =?utf-8?B?NUMrRjk3ZkVxV2NTZWRkTnpZMmgzaEsrZFd3U3NvTkQrcmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 15:04:59.9496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7debb1-de9a-462e-d190-08dd16d08531
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287



On 06/12/2024 19:37, Julien Grall wrote:
> 
> 
> Hi,
> 
> Sorry for the late answer.
> 
> On 05/12/2024 09:40, Michal Orzel wrote:
>>
>>
>> On 02/12/2024 17:59, Carlo Nonato wrote:
>>>
>>>
>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>> domain_build.h.
>>>
>>> Take the opportunity to adapt the implementation of allocate_memory() so
>>> that it uses the host layout when called on the hwdom, via
>>> find_unallocated_memory().
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> ---
>>> v11:
>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
>>> - added a comment in allocate_memory() when skipping small banks
>>> v10:
>>> - fixed a compilation bug that happened when dom0less support was disabled
>>> v9:
>>> - no changes
>>> v8:
>>> - patch adapted to new changes to allocate_memory()
>>> v7:
>>> - allocate_memory() now uses the host layout when called on the hwdom
>>> v6:
>>> - new patch
>>> ---
>>>   xen/arch/arm/dom0less-build.c           | 44 -----------
>>>   xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>>>   xen/arch/arm/include/asm/domain_build.h |  1 +
>>>   3 files changed, 94 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>> index d93a85434e..67b1503647 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>>>       return ( !dom0found && domUfound );
>>>   }
>>>
>>> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>> -{
>>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>>> -    unsigned int i;
>>> -    paddr_t bank_size;
>>> -
>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>> -
>>> -    mem->nr_banks = 0;
>>> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>>> -                               bank_size) )
>>> -        goto fail;
>>> -
>>> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>> -                               bank_size) )
>>> -        goto fail;
>>> -
>>> -    if ( kinfo->unassigned_mem )
>>> -        goto fail;
>>> -
>>> -    for( i = 0; i < mem->nr_banks; i++ )
>>> -    {
>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>>> -               d,
>>> -               i,
>>> -               mem->bank[i].start,
>>> -               mem->bank[i].start + mem->bank[i].size,
>>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>>> -               (unsigned long)(mem->bank[i].size >> 20));
>>> -    }
>>> -
>>> -    return;
>>> -
>>> -fail:
>>> -    panic("Failed to allocate requested domain memory."
>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>>> -}
>>> -
>>>   #ifdef CONFIG_VGICV2
>>>   static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>>   {
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 2c30792de8..2b8cba9b2f 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>>>       }
>>>   }
>>>
>>> -#ifdef CONFIG_DOM0LESS_BOOT
>>>   bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>>                                       alloc_domheap_mem_cb cb, void *extra)
>>>   {
>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>>
>>>       return true;
>>>   }
>>> -#endif
>>>
>>>   /*
>>>    * When PCI passthrough is available we want to keep the
>>> @@ -1003,6 +1001,94 @@ out:
>>>       return res;
>>>   }
>>>
>>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>> +{
>>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>>> +    paddr_t bank_start, bank_size;
>> Limit the scope
>>
>>> +    struct membanks *hwdom_free_mem = NULL;
>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> Limit the scope
>>
>>> +
>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>> +
>>> +    mem->nr_banks = 0;
>>> +    /*
>>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>>> +     * is enabled.
>>> +     */
>>> +    if ( is_hardware_domain(d) )
>>> +    {
>>> +        ASSERT(llc_coloring_enabled);
>> This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.
> 
> Piggying back on this comment. AFAICT, the code below would work also in
> the non cache coloring case. So what's the assert is for?
> 
>>
>>> +
>>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>> +                                             NR_MEM_BANKS);
>>> +        if ( !hwdom_free_mem )
>>> +            goto fail;
>>> +
>>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>> +
>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
>> My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
>> change the comments inside the function. The problem is that the function is specifically designed
>> for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
>> region allocated, etc.
> 
> So I agree that the function should be updated if we plan to use it for
> other purpose.
> 
> My opinion is that we should attempt to make the function generic so
> that in your
>> case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
>> add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.
>>
>> My very short attempt to make the function as generic as possible in the first iteration:
>> https://paste.debian.net/1338334/
> 
> This looks better, but I wonder why we need still need to exclude the
> static regions? Wouldn't it be sufficient to exclude just reserved regions?
Static shared memory banks are not part of reserved memory (i.e. bootinfo.reserved_mem) if that's what you're asking.
They are stored in bootinfo.shmem, hence we need to take them into account when searching for unused address space.

If you and Carlo are ok with my proposed solution for making the function generic, I can send a patch as a prerequisite
patch for Carlo series.

~Michal


