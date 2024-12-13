Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD99F085A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 10:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856486.1269088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2Fb-0006Ho-7Y; Fri, 13 Dec 2024 09:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856486.1269088; Fri, 13 Dec 2024 09:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2Fb-0006F8-4S; Fri, 13 Dec 2024 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 856486;
 Fri, 13 Dec 2024 09:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzCF=TG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tM2FZ-0006F2-CC
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 09:46:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2416::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 198d3556-b937-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 10:46:19 +0100 (CET)
Received: from MW4PR04CA0209.namprd04.prod.outlook.com (2603:10b6:303:86::34)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 09:46:10 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::b8) by MW4PR04CA0209.outlook.office365.com
 (2603:10b6:303:86::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Fri,
 13 Dec 2024 09:46:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 09:46:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 03:46:08 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 03:46:06 -0600
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
X-Inumbo-ID: 198d3556-b937-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMhuoftOMIGukJGWoMU8TfIj0+8l9FWrGaqnGQ5GRzEfJtFLWTz8X2kU6dIA31hc9tUMYnRukwlESbchIwuR5qguTQTUSeqIMBuvp3krUs5glWI0lfyV9S+5qncgmodTOtGFAvmV7qbsdMu10aJ7vSBWgFqHpUn+t4LSKULbiTJB5KWACbCkfXCSyComQe6z+7XHI60zEv6b453tvQxh8MtecgbsvSll6pxXH6xZiSONYCdXcng6B19vtomgLHrBjwHwfFF/APvoPyvs/No++MGclRfQRLz5JBvoUWASYyj8Ve6+Pj23rEdNp3u3ot1EhvGN3GW+/y0pC1ZoMD+YsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D9BD01jgMhk+GCEvIWAN/G0tU0XeYCD+AiRCx8+xck=;
 b=gpOnU7xH+iwGkhHHTjVy6ETzzhtyK6gA+mOUO71WRRXZGMB+gbTv1txtPpsOIIjbaxj59OHcKjT4llAlI0bmhRkicP73Acrg+cd9WTrdsywMnHb0brcOOpoMClvJwFdRAYK+5K5/2SX3g8J3Ps+eNSSVfRAkxAymHVu0hIVmwGS3WTp+/eXDjWeuMW8ZZeYNwQeaek/If56coPzX92u8zwST4StL1n0j6SySwUW1glrQS+RMnWs7da0+T9ayHrG6DjEKd0kbNAntqMpmeqvdSybcjpJEGWlB48cdwqOukrcqLtEtB4IpJ2it/4jq0gO7nW33VTbNWipkH/rn+lIGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D9BD01jgMhk+GCEvIWAN/G0tU0XeYCD+AiRCx8+xck=;
 b=EMEHMHoCsdZIJT6eZRwQCDZT4dr99+rNstJIOmwpvVIIt09ZpssvsgxIQ17hFqfNIwRehjZFDR/U10YltoEEuU8Z6JRqFDlQ1i1PojasGPYZqg6ioPEknzAbt4dtW0hIqZDDFXqbv6c8WQvkHYSZRJVkovLjxyyrcjZhBaqRazw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
Date: Fri, 13 Dec 2024 10:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Carlo Nonato
	<carlo.nonato@minervasys.tech>, Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <marco.solieri@minervasys.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
 <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
 <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: f10ee6df-953b-48f7-9c63-08dd1b5af8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDAxMkx3VS9DWXdqeS9naDdnTVpwc1lmMkF2Y2hLQ2txSXpiN09OZVUxZXEz?=
 =?utf-8?B?NzY2a3JlU1R3N0xXb2ZBUE1aanpnOHJVeFF0ZU1wT3lrTi9OODhJWVZNdWkw?=
 =?utf-8?B?SFh0ZWl1aW5hQ1JZZHJWN2ZZcDYyZ3MyMHIyeElldHdNcitZcG1CYzVmZ1Ns?=
 =?utf-8?B?RW9icDh2YkJkSmhVc1JvOUNPOEgzNi90bnZTdjc5SVBOK3dlcWFaeWNpdWRs?=
 =?utf-8?B?VnZYSVVMUDRPd3ZYS01jTWlXaWI4YlVNRmVkUDZoaWl3Z0J5aDFWMStvWDFX?=
 =?utf-8?B?RStHa3MwM3dyQWp6L0RsdDE2V2JObjdHaThhZ0xUcVVGYVBCc2RxV1JUVkFt?=
 =?utf-8?B?SjZVL3BHck5rTlVwZDh2ckJVKzRBWVhKOXFiYTIxZjlLWW5la0hFUXlSR0RT?=
 =?utf-8?B?enNxSU5WM1QwMWhOZ010WitXbTZKdUNlQVczSG56K0ZlVXNBV01TTjVnQXRD?=
 =?utf-8?B?NitDYzFJT0FsTXluK1RyeGlTZXphWHJGTDFQWThzU1JWZ2x6bkk1T3BDb3NH?=
 =?utf-8?B?TU1sLzFUZWpIcHRQZU1VU09uQ3VhTGN3NHNsTDNFUXhBcjhjd01QblQwVEds?=
 =?utf-8?B?dWtUai9IVU5mLzRFSW82ZmVjRlZic0ZPTnh5bi9PWUxhSXZmOWxxc3JOaHlO?=
 =?utf-8?B?cFE3d0Q0TzVCK3lWVjIvWlJSZWJ2cEFITGFIaFFCNXJneVA4THZRTExpT3Zt?=
 =?utf-8?B?aVorU0d6R1BGcVdlejRxdmx0VXd0VnF3Z05Gb2pTdW5RNmx0MHlUdEdXbUls?=
 =?utf-8?B?S1dteTUyVjhyUUovbytBMjVpdktWaHZlbE90Qlk2dGhrTXZjZklIazhsbVA1?=
 =?utf-8?B?VDFEWjdidjFvU2V2Ni83WGhwdW96RGgwVFl2ZmtHNVVENWdNRHpOclpUeXBJ?=
 =?utf-8?B?RTAwS2J4eCs1OVV1QnBUSUFKN0NiVVVRWlFMVVVPNFNCTFdsR3V3bUdYbmZv?=
 =?utf-8?B?TlV1aGl3STRxNGR1WDBXM1dxTUtCejE3VHYweVBZOXQ3cG4xNUFuck1qR3BN?=
 =?utf-8?B?OGJ1cCsvVHRsWTZ1RTZPajcyL3VBbDRpTEs2SWJRb2c2UFVORHJucWJGdUk4?=
 =?utf-8?B?Mk43eTRNdnJZdlZDemx5aGxLUzBmaTFhVFpuTzRPLzI4bFQzcXVHcFRLUHdt?=
 =?utf-8?B?bjg2cWJvdklGaXFwNXY3Z2VvTWdYMW9yVjduay82TnhZdWUvWno3TXpiQnNq?=
 =?utf-8?B?aFV6VkZnRzRDK0lMYlNCRk1MamF4bXNoMEUwQ016NTJvQmI4ZEFJdUhqZTFM?=
 =?utf-8?B?d3ltcXY2aENsTnMvMmw0NHhqTTdxTUVGbTl1UnQ1bXArN1piK0s4MFRTbWtr?=
 =?utf-8?B?U1Fqa3JKSmJUbHFCKzVSbHFZL256cnl3Y3VEanFia1MvQU03cloyL3Eybzdi?=
 =?utf-8?B?dHE3NDRrUnF3bVNXU0lwZEVXSE9PS3BxOUxGMFFVY2JLRTFPZDBoQnZnZXlo?=
 =?utf-8?B?a3JuZjUyUlJGd3VybDc2UGtCdkVoZFpsd0NUNCtvZzFCK2VmVnp6UXphN01G?=
 =?utf-8?B?bVhMNVBCYlNJZUdSaVY3U3hCM1ZMVFE2ZWJSUmRsZU5hcmh6TGhqUktVZklT?=
 =?utf-8?B?SlVLcGxNNEVaS0hGeHdLdHhHRjJqNmdEak1ONEpwVlFBNVBnTlNXSk5zK1l5?=
 =?utf-8?B?cW52YUVyeHRvSHgvNXRkZ2xVVFFwWTVGNUpoUjVUQVNuVjg2RUE3Z2R3ejVO?=
 =?utf-8?B?VkVPVTYrbm9IaHY5cWEybzFLSm5wbFBFSnVWdnhZNnRiazhic2dYZ0I5OUQy?=
 =?utf-8?B?NXFXUlRGTTE1Yzk4dVp0THY0WVlueVNSU2w5T3kwVDJ0L0xpRlJqN1VCRjEr?=
 =?utf-8?B?c1lseFdqcWJTenQzSUdxOTViUW16Y0o4bVdRZ1UxdUNFVTJsVmRtZy9vWUYy?=
 =?utf-8?B?cHg2T3FxbENNMDRzV2o0S2ZQcFlHajc3WWtYQ1NBdmVTeEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:46:09.1064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10ee6df-953b-48f7-9c63-08dd1b5af8db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047

Hi Carlo, Andrea,

On 12/12/2024 19:22, Andrea Bastoni wrote:
> 
> 
> On 12/12/2024 18:48, Carlo Nonato wrote:
>> Hi,
>>
>> On Mon, Dec 9, 2024 at 8:17 PM Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Michal,
>>>
>>> On 07/12/2024 15:04, Michal Orzel wrote:
>>>>
>>>>
>>>> On 06/12/2024 19:37, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> Sorry for the late answer.
>>>>>
>>>>> On 05/12/2024 09:40, Michal Orzel wrote:
>>>>>>
>>>>>>
>>>>>> On 02/12/2024 17:59, Carlo Nonato wrote:
>>>>>>>
>>>>>>>
>>>>>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>>>>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>>>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>>>>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>>>>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>>>>>> domain_build.h.
>>>>>>>
>>>>>>> Take the opportunity to adapt the implementation of allocate_memory() so
>>>>>>> that it uses the host layout when called on the hwdom, via
>>>>>>> find_unallocated_memory().
>>>>>>>
>>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>>>> ---
>>>>>>> v11:
>>>>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
>>>>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
>>>>>>> - added a comment in allocate_memory() when skipping small banks
>>>>>>> v10:
>>>>>>> - fixed a compilation bug that happened when dom0less support was disabled
>>>>>>> v9:
>>>>>>> - no changes
>>>>>>> v8:
>>>>>>> - patch adapted to new changes to allocate_memory()
>>>>>>> v7:
>>>>>>> - allocate_memory() now uses the host layout when called on the hwdom
>>>>>>> v6:
>>>>>>> - new patch
>>>>>>> ---
>>>>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
>>>>>>>    xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>>>>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
>>>>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>>>>> index d93a85434e..67b1503647 100644
>>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>>>>>>>        return ( !dom0found && domUfound );
>>>>>>>    }
>>>>>>>
>>>>>>> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>>> -{
>>>>>>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>>> -    unsigned int i;
>>>>>>> -    paddr_t bank_size;
>>>>>>> -
>>>>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>>> -
>>>>>>> -    mem->nr_banks = 0;
>>>>>>> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>>>>>>> -                               bank_size) )
>>>>>>> -        goto fail;
>>>>>>> -
>>>>>>> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>>>>>> -                               bank_size) )
>>>>>>> -        goto fail;
>>>>>>> -
>>>>>>> -    if ( kinfo->unassigned_mem )
>>>>>>> -        goto fail;
>>>>>>> -
>>>>>>> -    for( i = 0; i < mem->nr_banks; i++ )
>>>>>>> -    {
>>>>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>>>>>>> -               d,
>>>>>>> -               i,
>>>>>>> -               mem->bank[i].start,
>>>>>>> -               mem->bank[i].start + mem->bank[i].size,
>>>>>>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>> -               (unsigned long)(mem->bank[i].size >> 20));
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    return;
>>>>>>> -
>>>>>>> -fail:
>>>>>>> -    panic("Failed to allocate requested domain memory."
>>>>>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>>>>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>>>>>>> -}
>>>>>>> -
>>>>>>>    #ifdef CONFIG_VGICV2
>>>>>>>    static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>>>>>>    {
>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>>> index 2c30792de8..2b8cba9b2f 100644
>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>>>>>>>        }
>>>>>>>    }
>>>>>>>
>>>>>>> -#ifdef CONFIG_DOM0LESS_BOOT
>>>>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>>>>>>                                        alloc_domheap_mem_cb cb, void *extra)
>>>>>>>    {
>>>>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>>>>>>
>>>>>>>        return true;
>>>>>>>    }
>>>>>>> -#endif
>>>>>>>
>>>>>>>    /*
>>>>>>>     * When PCI passthrough is available we want to keep the
>>>>>>> @@ -1003,6 +1001,94 @@ out:
>>>>>>>        return res;
>>>>>>>    }
>>>>>>>
>>>>>>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>>> +{
>>>>>>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>>>>>>> +    paddr_t bank_start, bank_size;
>>>>>> Limit the scope
>>>>>>
>>>>>>> +    struct membanks *hwdom_free_mem = NULL;
>>>>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>>>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>>>>> Limit the scope
>>>>>>
>>>>>>> +
>>>>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>>> +
>>>>>>> +    mem->nr_banks = 0;
>>>>>>> +    /*
>>>>>>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>>>>>>> +     * is enabled.
>>>>>>> +     */
>>>>>>> +    if ( is_hardware_domain(d) )
>>>>>>> +    {
>>>>>>> +        ASSERT(llc_coloring_enabled);
>>>>>> This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.
>>>>>
>>>>> Piggying back on this comment. AFAICT, the code below would work also in
>>>>> the non cache coloring case. So what's the assert is for?
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>>>>>> +                                             NR_MEM_BANKS);
>>>>>>> +        if ( !hwdom_free_mem )
>>>>>>> +            goto fail;
>>>>>>> +
>>>>>>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>>>>>> +
>>>>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
>>>>>> My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
>>>>>> change the comments inside the function. The problem is that the function is specifically designed
>>>>>> for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
>>>>>> region allocated, etc.
>>>>>
>>>>> So I agree that the function should be updated if we plan to use it for
>>>>> other purpose.
>>>>>
>>>>> My opinion is that we should attempt to make the function generic so
>>>>> that in your
>>>>>> case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
>>>>>> add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.
>>>>>>
>>>>>> My very short attempt to make the function as generic as possible in the first iteration:
>>>>>> https://paste.debian.net/1338334/
>>>>>
>>>>> This looks better, but I wonder why we need still need to exclude the
>>>>> static regions? Wouldn't it be sufficient to exclude just reserved regions?
>>>> Static shared memory banks are not part of reserved memory (i.e. bootinfo.reserved_mem) if that's what you're asking.
>>>> They are stored in bootinfo.shmem, hence we need to take them into account when searching for unused address space.
>>>
>>> Oh I missed the fact you now pass "mem_banks" as a parameter. I thought
>>> they would still get excluded for cache coloring case.
>>>
>>>>
>>>> If you and Carlo are ok with my proposed solution for making the function generic, I can send a patch as a prerequisite
>>>> patch for Carlo series.
>>>
>>> I am fine with the approach.
>>>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
>>>
>>
>>> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain *d)
>>>      /* type must be set before allocate_memory */
>>>      d->arch.type = kinfo.type;
>>>  #endif
>>> -    allocate_memory_11(d, &kinfo);
>>> +    if ( is_domain_direct_mapped(d) )
>>> +        allocate_memory_11(d, &kinfo);
>>> +    else
>>> +        allocate_memory(d, &kinfo);
>>>      find_gnttab_region(d, &kinfo);
>>
>> Since find_gnttab_region() is called after allocate_memory(), kinfo->gnttab_*
>> fields aren't initialized and the call to find_unallocated_memory() with
>> gnttab as the region to exclude, fails ending in a crash since memory for
>> dom0 can't be allocated.
>>
>> Can the solution be to call find_gnttab_region() before the above if?
> 
> The function is called find, but currently it only initializes kinfo->gnttab_start
> and kinfo->gnttab_size and we tested that moving it before allocate_memory* doesn't
> cause fallouts.
> 
> If moving before allocate_memory*, would it be better to rename it e.g., init_gnttab_region()?
> 
> Thanks,
> Andrea
> 
>> Or should I just call it before allocate_memory() in one case, but still after
>> allocate_memory_11() in the other?
>>
>> Thanks.
> 

AFAICT there is nothing stopping us from moving find_gnttab_region() before allocate_*. This function initializes
gnttab region with PA of Xen. In normal case, because Xen is added as bootmodule, it will never be mapped in dom0 memory map
and the placement does not matter. In LLC case, it will point to relocated address of Xen and it needs to be known before
calling find_unallocated_memory. Don't rename it, leave as is, just move before allocate_*.

@Carlo:
My prerequisite patch has been merged, so you're good to respin a series (unless you wait for some feedback in which case do let me know).
To prevent too many respins, you're going to call find_unallocated_memory for LLC passing resmem and gnttab to be excluded. If you're going
to reuse add_ext_regions, you need to rename it and fix comments to make it more generic. As for the size, the decision is yours. One solution
would be to modify add_ext_regions to take min bank size as parameter (64MB for extended regions, X for LLC dom0). In your code, you write that
the first bank must contain dom0, dtb, ramdisk and you chose 128MB. However, looking at the code, you seem to discard banks < 128 for all the banks,
not only for the first one. This is the part that I don't have a ready solution. Maybe you could define your own add_free_region function and sort
the banks, so that you take the largest possible bank first for dom0. This could simplify things.

You can also ask others for opinion.

We are approaching Dec 20th deadline, and I want this series to be in as it's been on the list for too many years. I'm willing to accept a sub-optimal solution
(so far will be used only for LLC, and LLC as experimental feature will be the only victim of not optimal algorithm) for now, and we can think of a better one
after the release. But still, even the sub-optimal solution must make sense.

~Michal


