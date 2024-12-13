Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B09F0A28
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 11:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856565.1269148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3LJ-0001zA-A0; Fri, 13 Dec 2024 10:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856565.1269148; Fri, 13 Dec 2024 10:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3LJ-0001xP-73; Fri, 13 Dec 2024 10:56:21 +0000
Received: by outflank-mailman (input) for mailman id 856565;
 Fri, 13 Dec 2024 10:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzCF=TG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tM3LH-0001xJ-GE
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 10:56:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e07a925f-b940-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 11:56:16 +0100 (CET)
Received: from MN2PR19CA0065.namprd19.prod.outlook.com (2603:10b6:208:19b::42)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 10:56:11 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::91) by MN2PR19CA0065.outlook.office365.com
 (2603:10b6:208:19b::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.16 via Frontend Transport; Fri,
 13 Dec 2024 10:56:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 10:56:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 04:56:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 04:56:10 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 04:56:08 -0600
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
X-Inumbo-ID: e07a925f-b940-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqcb36BAdcEKwrOZNM+mslTtACGwSAB6gDvMVVef0aqeXQzdAXxvkmKDMpZDB8Ve2Pp33aTt38lm52+uXnEHry1TIgoKUr+fSyNVT4gNuwjQYEoHgwl8DC8kxbjp5bn7H7X6uStEoKeMrmvWC9ec2xy+l7hcGMdLgdkc5nh0d5MwdNhNNPtIS07AXsLh+qjyDfeH5XvohqHbr99cGM3HUs6cwpaLVGYJP9i3fbblMAt9/s0x8iLmT1gmhSZmyVk2r4a2APyznrYV5kmkoyXsGeAwxAVmPX3Wuc48qyrgn07WYkJ/CWk1GaiR4QnEf16VkcXRC46l8i/vTpeEVPb3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFTcJje/qsnKaootPSjYtmkLjoDjXis11H3T1nTyEhs=;
 b=H2+H8Rf+UIrYW8TDv4VhW5FfAwyJjHpqz0n9Pedu1jt9qHNxe5bqNZY3VEoTnHsPZNhvhA/TpE6w3VzUlExzzPufgKbqTnLQWfHSmM6UYzDHk8PdQmKpNprT6uXucOLd7dADWFOkueaYPr4KhooYyPL1VW/xluEpHo09CzwI4+u35+kpG4b9EibioqrQ1+9Jb3ljTw11RaPb2l4FCICiNVWOAxPrXeryuzUqwlVFdHYc3CaRWQ2eby52BqK8NKDHtamuntJtWnnq3WqLmGRwH44topw6wHWJZP85f0dDog/53FdgE4Vh9K1+q5E/vGhjmXD7ymTAn7LJOKkYPvrhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFTcJje/qsnKaootPSjYtmkLjoDjXis11H3T1nTyEhs=;
 b=Nxw7l5p6pF5mK0IKfpPXgzWT2WCMryEvaOUdEIyJ1H8xTXuxQC3B41lxm5eEpio4NrOdyJ57EM9vROISTdLGBzl6DJSwilyivbA2yD72DfdCQwm9FQ6OZ4BnTat+eDQu9HGMisg3c7iVG42XiHj1V5bpdmgtXHvLKpLzzlS4nPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com>
Date: Fri, 13 Dec 2024 11:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
 <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
 <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech>
 <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
 <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a8e4ef-a8c0-4fce-4394-08dd1b64c167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkVnS01XUGFSY2VPdG9GNVd6Q2JHazcvRUFHNlFVQjQzR0Ryb2NJZ0tRY1ps?=
 =?utf-8?B?RjFzTjZabEhLdW9VTjdBdHoxcUhISkNaVnk0eGVLOFA0QXRHY2x3SWtaZWhk?=
 =?utf-8?B?M3RjY0NqOStVNDVreWg5a2k0U1dsaSt1WTNLZVF2eEJhMVkydXJrMFlFVnFV?=
 =?utf-8?B?bkpsMmEwcmZhTFpQeGpRSUZmMng1RkczRWlSWnNsVzJRc2hIcEk0S0ozRXZl?=
 =?utf-8?B?cnorTHF6S21sSFppaFV4T2RXbzZoMmQwbFA0RjE1Q3JscjZ5b1VSZzBldFN6?=
 =?utf-8?B?bm91c0NjejFoRUVqdEo2NE1QWmVZQWRCOXJrRldvL3R2dE1GeDNELzIzcS9t?=
 =?utf-8?B?aFVET2tyQTN6MHdMejFQeURURFl0dVZITWdKd25FSzBoWktIdnlISTRCYnpI?=
 =?utf-8?B?TU55RFdMdXUzNFBDMGZ0MUJtNjNVY1RVUU5KejFDNDFiVzdBRW5qalJ5UmJF?=
 =?utf-8?B?eEdkRWUvaUwzYW95ODY3azNBWEZwSmFDSDhkc3UwUmdHTkFYa2VNNGpWM09G?=
 =?utf-8?B?bzhaYmlmNnVWVGgxenkzbW9Sdzd6WmhpczFjTTVucGsvRmlocWJLL0NrSkor?=
 =?utf-8?B?OElMT1RNZmMzOHZwQUJaVmJiaEtwb2pRODh3dlU3S2NqTGZYWmhrKzBKYU1V?=
 =?utf-8?B?clZkM2pyWUo4TU1CNmZWZ280eGEzRElFQ1FQRDJnNDhaNExhbE50bzlhYzIx?=
 =?utf-8?B?bVNZcWFkOUdVTnZkUTQxRG85dTNiOXppNUt4MnU2WStvZ3NNZXFqTEJETmU1?=
 =?utf-8?B?Ulk5REY4Rjh5ZlhBam0vTGhNZVNBdWNSWmhONXdpS3VoRzdwRUhRYUUvR3Rj?=
 =?utf-8?B?RWpyZFcwMWcvMWN1NXowUGJnUDAzc0dQYzhYa2gvc2dyc1I0SklzWWFmVGFN?=
 =?utf-8?B?NU5mY3p6cjlySnluZ2xlb0M2SGg5d0Q1bkpoQm16SmE0emlLcEZzUlNnQnZP?=
 =?utf-8?B?M2M1eElEREhsZzBPbTBRdnJsZk1YZUxtb0lGNU15T1RQUFcwZU9PMDVSd0Zv?=
 =?utf-8?B?OFN6VTVKVlNXWWd2QjdnWmVDYXFTM01jakhDMUlFMGtCR2pyL3VaVm43WExO?=
 =?utf-8?B?aDI4aGtXbnVuaXRLMGhqL21vZTE3NTF6c3VsaEs1cEFHR2JoNVUxTmNjeitS?=
 =?utf-8?B?Qm5BZ1EwdEJiSGtjekh3aWczU0lycmpCSFljT1V2RTRkc3NHN0NxdnZ1VlpJ?=
 =?utf-8?B?OUZHVU5XUWtNQjdUTmhMZTd0ZVpSS01rbEQvTWpsVk5MckM5c0pTOUZVYk1I?=
 =?utf-8?B?RDdnazArQjZCcjZHNmM2M2NuWEFjRmc0YmxCTllVTFNsaXhOT2tPcHluSW1s?=
 =?utf-8?B?MG5PbC9QdGwvMU5YcFZnYVRPRytPT0xQRkZ1Yk1PYlZSSkpjaEtkck5jdlZ1?=
 =?utf-8?B?MllMWG5ZOG1KQzNGQWNKaXdHeUVQLzZaenNSR25qK253NFNFVi9HTDY5b3BV?=
 =?utf-8?B?OHFZT3k5eW1UM1JqbUdMVnFNS2U1M0ZhWSt6MUY2UWhwblorbXU2SUVoeVV3?=
 =?utf-8?B?b2lFNEduaWsxVVcwNHN1ZkIxWmFqSHJxT3FDcnBWTS9yTjFscGNUL3J4S3dV?=
 =?utf-8?B?aHdIa0VhVlNjNzJXWmJrKy9Ma1JtQVA1dlRleDJEZ1FITTlCL0tCT1RvZG5p?=
 =?utf-8?B?M3JIeTg2RWVPenFDaUR1RHdZSndzT3FDNldmcFBkSjhNUElVMXgyQ3A5NWxk?=
 =?utf-8?B?Nk1WRzJUTHhPUEVta3BMNEE0cVQrVENFMFFGT2l6R0k1aXJYYXh6dFJCZSsv?=
 =?utf-8?B?bGNRcWprNm5TQVQ5R25vMWUyMHBjcGVMNHByaGdrZE5CVFpyS1ZySHpwaFdl?=
 =?utf-8?B?QWgvVFo4ZmQrVFFsUmowM0liOHpnZ2p4MTQ0ZU50d3NKMUJVREpCSU0xbWw4?=
 =?utf-8?B?YWROQkgxTkxMekFVbURTa1ZYbjNCNktoSkpmQldnSmVTWXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 10:56:11.1146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a8e4ef-a8c0-4fce-4394-08dd1b64c167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996



On 13/12/2024 11:26, Carlo Nonato wrote:
> 
> 
> Hi Michal,
> 
> On Fri, Dec 13, 2024 at 10:46 AM Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Carlo, Andrea,
>>
>> On 12/12/2024 19:22, Andrea Bastoni wrote:
>>>
>>>
>>> On 12/12/2024 18:48, Carlo Nonato wrote:
>>>> Hi,
>>>>
>>>> On Mon, Dec 9, 2024 at 8:17 PM Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 07/12/2024 15:04, Michal Orzel wrote:
>>>>>>
>>>>>>
>>>>>> On 06/12/2024 19:37, Julien Grall wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Sorry for the late answer.
>>>>>>>
>>>>>>> On 05/12/2024 09:40, Michal Orzel wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 02/12/2024 17:59, Carlo Nonato wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>>>>>>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>>>>>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>>>>>>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>>>>>>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>>>>>>>> domain_build.h.
>>>>>>>>>
>>>>>>>>> Take the opportunity to adapt the implementation of allocate_memory() so
>>>>>>>>> that it uses the host layout when called on the hwdom, via
>>>>>>>>> find_unallocated_memory().
>>>>>>>>>
>>>>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>>>>>> ---
>>>>>>>>> v11:
>>>>>>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
>>>>>>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
>>>>>>>>> - added a comment in allocate_memory() when skipping small banks
>>>>>>>>> v10:
>>>>>>>>> - fixed a compilation bug that happened when dom0less support was disabled
>>>>>>>>> v9:
>>>>>>>>> - no changes
>>>>>>>>> v8:
>>>>>>>>> - patch adapted to new changes to allocate_memory()
>>>>>>>>> v7:
>>>>>>>>> - allocate_memory() now uses the host layout when called on the hwdom
>>>>>>>>> v6:
>>>>>>>>> - new patch
>>>>>>>>> ---
>>>>>>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
>>>>>>>>>    xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>>>>>>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
>>>>>>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>>>>>>> index d93a85434e..67b1503647 100644
>>>>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>>>>>>>>>        return ( !dom0found && domUfound );
>>>>>>>>>    }
>>>>>>>>>
>>>>>>>>> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>>>>> -{
>>>>>>>>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>>>>> -    unsigned int i;
>>>>>>>>> -    paddr_t bank_size;
>>>>>>>>> -
>>>>>>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>>>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>>>>> -
>>>>>>>>> -    mem->nr_banks = 0;
>>>>>>>>> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
>>>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>>>>>>>>> -                               bank_size) )
>>>>>>>>> -        goto fail;
>>>>>>>>> -
>>>>>>>>> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>>>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>>>>>>>> -                               bank_size) )
>>>>>>>>> -        goto fail;
>>>>>>>>> -
>>>>>>>>> -    if ( kinfo->unassigned_mem )
>>>>>>>>> -        goto fail;
>>>>>>>>> -
>>>>>>>>> -    for( i = 0; i < mem->nr_banks; i++ )
>>>>>>>>> -    {
>>>>>>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>>>>>>>>> -               d,
>>>>>>>>> -               i,
>>>>>>>>> -               mem->bank[i].start,
>>>>>>>>> -               mem->bank[i].start + mem->bank[i].size,
>>>>>>>>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>>>> -               (unsigned long)(mem->bank[i].size >> 20));
>>>>>>>>> -    }
>>>>>>>>> -
>>>>>>>>> -    return;
>>>>>>>>> -
>>>>>>>>> -fail:
>>>>>>>>> -    panic("Failed to allocate requested domain memory."
>>>>>>>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>>>>>>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>>>>>>>>> -}
>>>>>>>>> -
>>>>>>>>>    #ifdef CONFIG_VGICV2
>>>>>>>>>    static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>>>>>>>>    {
>>>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>>>>> index 2c30792de8..2b8cba9b2f 100644
>>>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>>>>>>>>>        }
>>>>>>>>>    }
>>>>>>>>>
>>>>>>>>> -#ifdef CONFIG_DOM0LESS_BOOT
>>>>>>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>>>>>>>>                                        alloc_domheap_mem_cb cb, void *extra)
>>>>>>>>>    {
>>>>>>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>>>>>>>>
>>>>>>>>>        return true;
>>>>>>>>>    }
>>>>>>>>> -#endif
>>>>>>>>>
>>>>>>>>>    /*
>>>>>>>>>     * When PCI passthrough is available we want to keep the
>>>>>>>>> @@ -1003,6 +1001,94 @@ out:
>>>>>>>>>        return res;
>>>>>>>>>    }
>>>>>>>>>
>>>>>>>>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>>>>> +{
>>>>>>>>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>>>>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>>>>>>>>> +    paddr_t bank_start, bank_size;
>>>>>>>> Limit the scope
>>>>>>>>
>>>>>>>>> +    struct membanks *hwdom_free_mem = NULL;
>>>>>>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>>>>>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>>>>>>> Limit the scope
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>>>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>>>>> +
>>>>>>>>> +    mem->nr_banks = 0;
>>>>>>>>> +    /*
>>>>>>>>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>>>>>>>>> +     * is enabled.
>>>>>>>>> +     */
>>>>>>>>> +    if ( is_hardware_domain(d) )
>>>>>>>>> +    {
>>>>>>>>> +        ASSERT(llc_coloring_enabled);
>>>>>>>> This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.
>>>>>>>
>>>>>>> Piggying back on this comment. AFAICT, the code below would work also in
>>>>>>> the non cache coloring case. So what's the assert is for?
>>>>>>>
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>>>>>>>> +                                             NR_MEM_BANKS);
>>>>>>>>> +        if ( !hwdom_free_mem )
>>>>>>>>> +            goto fail;
>>>>>>>>> +
>>>>>>>>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>>>>>>>> +
>>>>>>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
>>>>>>>> My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
>>>>>>>> change the comments inside the function. The problem is that the function is specifically designed
>>>>>>>> for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
>>>>>>>> region allocated, etc.
>>>>>>>
>>>>>>> So I agree that the function should be updated if we plan to use it for
>>>>>>> other purpose.
>>>>>>>
>>>>>>> My opinion is that we should attempt to make the function generic so
>>>>>>> that in your
>>>>>>>> case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
>>>>>>>> add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.
>>>>>>>>
>>>>>>>> My very short attempt to make the function as generic as possible in the first iteration:
>>>>>>>> https://paste.debian.net/1338334/
>>>>>>>
>>>>>>> This looks better, but I wonder why we need still need to exclude the
>>>>>>> static regions? Wouldn't it be sufficient to exclude just reserved regions?
>>>>>> Static shared memory banks are not part of reserved memory (i.e. bootinfo.reserved_mem) if that's what you're asking.
>>>>>> They are stored in bootinfo.shmem, hence we need to take them into account when searching for unused address space.
>>>>>
>>>>> Oh I missed the fact you now pass "mem_banks" as a parameter. I thought
>>>>> they would still get excluded for cache coloring case.
>>>>>
>>>>>>
>>>>>> If you and Carlo are ok with my proposed solution for making the function generic, I can send a patch as a prerequisite
>>>>>> patch for Carlo series.
>>>>>
>>>>> I am fine with the approach.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> --
>>>>> Julien Grall
>>>>>
>>>>
>>>>> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain *d)
>>>>>      /* type must be set before allocate_memory */
>>>>>      d->arch.type = kinfo.type;
>>>>>  #endif
>>>>> -    allocate_memory_11(d, &kinfo);
>>>>> +    if ( is_domain_direct_mapped(d) )
>>>>> +        allocate_memory_11(d, &kinfo);
>>>>> +    else
>>>>> +        allocate_memory(d, &kinfo);
>>>>>      find_gnttab_region(d, &kinfo);
>>>>
>>>> Since find_gnttab_region() is called after allocate_memory(), kinfo->gnttab_*
>>>> fields aren't initialized and the call to find_unallocated_memory() with
>>>> gnttab as the region to exclude, fails ending in a crash since memory for
>>>> dom0 can't be allocated.
>>>>
>>>> Can the solution be to call find_gnttab_region() before the above if?
>>>
>>> The function is called find, but currently it only initializes kinfo->gnttab_start
>>> and kinfo->gnttab_size and we tested that moving it before allocate_memory* doesn't
>>> cause fallouts.
>>>
>>> If moving before allocate_memory*, would it be better to rename it e.g., init_gnttab_region()?
>>>
>>> Thanks,
>>> Andrea
>>>
>>>> Or should I just call it before allocate_memory() in one case, but still after
>>>> allocate_memory_11() in the other?
>>>>
>>>> Thanks.
>>>
>>
>> AFAICT there is nothing stopping us from moving find_gnttab_region() before allocate_*. This function initializes
>> gnttab region with PA of Xen. In normal case, because Xen is added as bootmodule, it will never be mapped in dom0 memory map
>> and the placement does not matter. In LLC case, it will point to relocated address of Xen and it needs to be known before
>> calling find_unallocated_memory. Don't rename it, leave as is, just move before allocate_*.
>>
>> @Carlo:
>> My prerequisite patch has been merged, so you're good to respin a series (unless you wait for some feedback in which case do let me know).
>> To prevent too many respins, you're going to call find_unallocated_memory for LLC passing resmem and gnttab to be excluded. If you're going
>> to reuse add_ext_regions, you need to rename it and fix comments to make it more generic. As for the size, the decision is yours. One solution
>> would be to modify add_ext_regions to take min bank size as parameter (64MB for extended regions, X for LLC dom0). In your code, you write that
>> the first bank must contain dom0, dtb, ramdisk and you chose 128MB. However, looking at the code, you seem to discard banks < 128 for all the banks,
>> not only for the first one. This is the part that I don't have a ready solution. Maybe you could define your own add_free_region function and sort
>> the banks, so that you take the largest possible bank first for dom0. This could simplify things.
> 
> For the moment I added a __add_ext_regions() helper that also takes a skip_size
I'm not sure if MISRA and our guidelines are happy with prefixing with function with __.
I don't understand the skip_size parameter. In which scenario do you want to use it? Not for
extended regions and for LLC, even with your current solution, you also want to find banks bigger than
some size.

> parameter. This is called by add_ext_regions() and by a new
> add_hwdom_free_regions() callback used in allocate_memory().
> I still use 128MB for all the banks. Do you think this is acceptable, maybe
> with a FIXME comment cause we should skip only the first bank, or not?
First of all, I'm not convinced with 128MB. This is definitely not a requirement for arm64.
allocate_memory_11 uses it but the algorithm of finding banks is completely different.

AFAICT, with my suggested solution i.e. sorting banks in a helper like add_ext_regions used only
for LLC case, you no longer need to worry about size. You simply start with the biggest possible bank
as the first bank.

~Michal


