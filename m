Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC0ACF93B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 23:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007617.1386890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIAK-0002ra-3j; Thu, 05 Jun 2025 21:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007617.1386890; Thu, 05 Jun 2025 21:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIAJ-0002pV-WD; Thu, 05 Jun 2025 21:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1007617;
 Thu, 05 Jun 2025 21:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ueqi=YU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uNIAI-0002p6-7K
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 21:30:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45edf36a-4254-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 23:30:16 +0200 (CEST)
Received: from MN0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:52f::26)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 21:30:10 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::26) by MN0PR03CA0006.outlook.office365.com
 (2603:10b6:208:52f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Thu,
 5 Jun 2025 21:30:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 21:30:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 16:30:08 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 16:30:07 -0500
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
X-Inumbo-ID: 45edf36a-4254-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LltGfoTmcVA8/teRyZ6q5TrFZgFDX9h2q5sRUPQjMCQZwNU2yoUgUOt1NrG71LHiJPZO/4B9mQCDEBr1eS3mqAFRuCiAvWvwnOcqZhiYpQNkMXkxzJsF1L3fVGMtwVurzoKFCxTr/sU8tfrWuK/NKgIZXVRnAFRBKtJ356UyYT67kmFzTSmz+ZsnAqXsf+0j0Nxcl2Zvsa6Rj5eV2lxnXpNL2ruRtndkGThaqv7YthB5R9bl9bIGx3m99Nqkto5msMu1Ins5ZM+qP2s/KEWGpt6YfragxUGrMwM8QZJnAkCPcNpQkyITjSSWSlMFuWeC5sBKrrDSjVZt8zQpreMofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8Ch1cuPlQdbV1+LMksGfTsDEBPpIObOV7gI7mE0jc4=;
 b=QSR9AAAIXWj3ovZ2DDPDYvAM1SKi/F+NXxK+hwvFBnthS9thPdDYGff1huT3ZfdgEbi+F3sMqTZnCHyt34XfPAFSEUxcZ6XC70nUtQo7lit1a8881ehOduWlsn9nXC2jmg9PfvhdeSI/Cc4akzvVNzBXsVc3rJTqgjlk4UNbtbg7k93s1+jzTK7XpPBunF9yV6+8Hdiiiuo0H7i+QacQqymeoLEtoqC546BF45ymthfJsQ7J7QSFwIl5ykNGihUSNFBCpJeJJFfLmaKYDfr2Dggon0MLzRBxRwCeEAgw8evpQNfblZJDKswtFJsakqYxF86mNDb+BpkXMKmt7ZeKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8Ch1cuPlQdbV1+LMksGfTsDEBPpIObOV7gI7mE0jc4=;
 b=UOhbnq4tVayvuZ0fDqZiDT/HuNsrlpMSiGNPwea3YQzn6A32atcK4+DrX53864S1PI6r4GPYiGwXSWX5cZqO0pDdl7mOXyhUTb+QDk1ZE0SF5OesdQA+DP/yibqnWH9EDkdAG0zto9HcLZnXHQHTT/TUJtZcDCRU6vKHA6GsS08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e6f04b63-e345-456e-8a8c-1eec8eb64acc@amd.com>
Date: Thu, 5 Jun 2025 17:30:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-2-stewart.hildebrand@amd.com>
 <54c3d341-1d7f-428d-89a7-ce4fcae8a5db@amd.com>
 <4bd41362-6ee4-44d7-9f9b-0ffd78f1e6f8@amd.com>
 <28b22fa6-c6f9-463e-8e7e-0a00eae88737@amd.com>
 <eba4c308-f563-4f3c-8bc3-b5cfa2484fde@amd.com>
 <861e66c8-c225-4913-b00e-4dfb2c1e0e39@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <861e66c8-c225-4913-b00e-4dfb2c1e0e39@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad4a97e-9b9d-4eba-e760-08dda4782602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2ZyMHhVandnL09tcW1DUFJacjlnRStmK1haQ3kxYmNwM29ZQXBNWHRBL2Y3?=
 =?utf-8?B?SUN4Tzl0U040ODZjQ1lsNkdQMlpxN1VsOGJQdFdFN0FzRjM1OWl4SjNHMWt0?=
 =?utf-8?B?UnVZNldrYUF3ZzltMFdBQ3VpZ1Rwc2JSN0hrcGhIc3hIOXdsbFBqclpqRGdN?=
 =?utf-8?B?T29CL1JoU0JCRVF0TEx0Q1NXVnY1aldOWmduUE5Ya0VBcDZLNThqQWg1b3NV?=
 =?utf-8?B?eVViTHRndkI4MlFmemZWQ0RrTGZIYmJoeG9LcTNuWWV6eVVWcTFEaWpoZFdI?=
 =?utf-8?B?ZVk0T3Bsb0F3TENTMTF0T3R5Wm1qWk9TNUo3SjdLSThBOEk5OU5IQzBIS0tv?=
 =?utf-8?B?RFY4OW1ndHF3cFFGRnlYb1h1Tkhpb1FoQ1RSODdzUGVFbDVxamVoWmQ1eC9a?=
 =?utf-8?B?UUdQdWE5b0RCclpVNzVxRTFlRmg0aU1kU2JXcnpacDJLaGFmZ01WTmFURHQ3?=
 =?utf-8?B?MGdySkZkR1JaSDgwNHJxWlJXaU1EY0Y1cFZYQ0ZqV3JFKzU4OENLWUMrSXht?=
 =?utf-8?B?TU4vSXFVMDYxQ2l3M21ZSWI2SGQrVlJNL1ZKNGIxdlQxTTV2RVo0M25zczlr?=
 =?utf-8?B?YTQ0M0NzZ1A2TVZOa0M3bUxIRGV5OWFLb1ptTWh2aHVwaEJJNGNEVktWTmZJ?=
 =?utf-8?B?OFZPOHVIdThqd0pkNVpWeUx1djg0b3ZSK3dDMW9xQXkyNDUyOUhxeGZTamF2?=
 =?utf-8?B?RDRpV1pxOHpQdUs3RnoxQlZXMFVuWEYrKzZUc1VoalRQUXNibXpiVEUrSlRF?=
 =?utf-8?B?SVRpTnFuTUdLMHhNLzZWT0VWTytVY1dubXJPMmI1dFUwdWFOUGI5MHBVeW1G?=
 =?utf-8?B?a0NheFlQeTFZendHNFV5WC84SVJwV1U1R0JzWFZaS203SGM4OWt0QzNEVGZJ?=
 =?utf-8?B?T0syRjNjejRnM081WUU2RG0zNWZhaUJqTDFqbzQxZmlJL3VNMGRySlk2dzFZ?=
 =?utf-8?B?cDRKSU1HV2ZOazNqVklGWWhqTHJKaWRySUYwRlNwWkxDZ3I5N0RTVGFJZXZG?=
 =?utf-8?B?WXJiS0x4MjNVZCtkQnZOLzd1L0NrU24xSHRwVWJRUkxGMmhBSEZPelA5L29P?=
 =?utf-8?B?a0R6VnZ6Y3J0alF3aC8wUGxRSGw5bGluUHN4OWI3ZEJFeXNSTDFtRjF4ZVFH?=
 =?utf-8?B?eHdIN2pYNzFuYXVMOE1TaGRjL3ZaTkwrWXdtSmE1bUtxaVNuUkpldnpvLzhC?=
 =?utf-8?B?a2VlMm1CVCs2UVNzb2k2aG11ZnRyWmkwWXRybjlQYVkwRHJDZ01VbFFJS2NU?=
 =?utf-8?B?ZmFYbHIzZ0Z1clJrM1cwOW1kWkNaWFhzN1lTMVZRN3pjSHhOT1hnd0NUY3Zp?=
 =?utf-8?B?MmpnM25WZnFNOTZ5aDVlTzdONW9qcC96K1djNmtyK2xxRUp6ZmtUdXZlM1JC?=
 =?utf-8?B?cDU3cENFTEdHaTU4ZnlDSlFQQVZtdHpwSy8xR2Q2WkxGOXBtT2ZhZ3ZUMDF4?=
 =?utf-8?B?eGJZWGpDYXNobTgxUU5TbVhPWFBJR1I4c0Z3YlpFbHBrTVJ5SmswdUN6R2Rl?=
 =?utf-8?B?NUMvc2FXeDZmT2JzQUtPMDVsTWNmc3NJMVh1Z3VqNjM4QXFiS3NmSXZsMVo0?=
 =?utf-8?B?cnJBeVFjOG5iM1FJZTN5MVFDc05HTVRMZjFaZUlTQU00bk50VHV2emVsenly?=
 =?utf-8?B?K0ZDdU5wZUJha0QvWWhtQnF0RWZpVmJ6NU94RWdqUTdRMkpMbTY2L1Qzd1JH?=
 =?utf-8?B?YloxcXJEaldPWmp3WDVQRGFFQTh1bW9iQVUreDhmMlBzSThRSi94VmhCdDBt?=
 =?utf-8?B?d2MrbjVFL2FFSWJTY2NaV3JzWjN6Z2hSdWpEbTdHRnVUMzRHUzdablA2Z0Fv?=
 =?utf-8?B?TEJXZXExbDVJbXdwems4b25nYUROV0pTZGZna1FCSnp1akRiTHRsVEtxRy9k?=
 =?utf-8?B?UzZESWJaRGtxZlVtNzNpRm4xdE9hdFRCeUtaS0M5Sll0Nmk1Q204VXZtNFpa?=
 =?utf-8?B?L3BLSzVEZ0pvWm1oK29iVkxZbDlRbDI0QWpWNHc3a2NYWGRTaS80MHlxVjh2?=
 =?utf-8?B?amI3Q2diZ3krNVJxUnpLdFpWT0UzWnRYUW1TZzk3Qk1pYmpMY3dNWllpWkxU?=
 =?utf-8?Q?4/dfYJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 21:30:09.6755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad4a97e-9b9d-4eba-e760-08dda4782602
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064

On 6/5/25 02:45, Orzel, Michal wrote:
> On 04/06/2025 21:51, Stewart Hildebrand wrote:
>> On 6/4/25 03:00, Orzel, Michal wrote:
>>> On 03/06/2025 23:15, Stewart Hildebrand wrote:
>>>> On 5/14/25 03:31, Orzel, Michal wrote:
>>>>> On 13/05/2025 21:54, Stewart Hildebrand wrote:
>>>>>> Similarly to fba1b0974dd8, when a device is passed through to a
>>>>>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>>>>>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>>>>>
>>>>>> Introduce rangeset_count_ranges().
>>>>>>
>>>>>> Take the opportunity to update the comment ahead of find_memory_holes().
>>>>>>
>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>> ---
>>>>>> v2->v3:
>>>>>> * new patch
>>>>>> ---
>>>>>>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>>>>>>  xen/common/rangeset.c       | 14 +++++++++
>>>>>>  xen/include/xen/rangeset.h  |  2 ++
>>>>>>  3 files changed, 68 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>> index b189a7cfae9f..3cdf5839bc98 100644
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>>>>>  }
>>>>>>  
>>>>>>  /*
>>>>>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>>>>>> - * regions for the special memory mappings. In order to calculate regions
>>>>>> - * we exclude every addressable memory region described by "reg" and "ranges"
>>>>>> - * properties from the maximum possible addressable physical memory range:
>>>>>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>>>>>> + * domU as extended regions for the special memory mappings. In order to
>>>>>> + * calculate regions we exclude every addressable memory region described by
>>>>>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>>>>>> + * memory range:
>>>>>>   * - MMIO
>>>>>>   * - Host RAM
>>>>>>   * - PCI aperture
>>>>>>   * - Static shared memory regions, which are described by special property
>>>>>>   *   "xen,shared-mem"
>>>>>> + * - xen,reg mappings
>>>>>>   */
>>>>>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>>>                                      struct membanks *ext_regions)
>>>>>> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>>>          }
>>>>>>      }
>>>>>>  
>>>>>> +    if ( kinfo->xen_reg_assigned )
>>>>>> +    {
>>>>>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>>>>>> +        if ( res )
>>>>>> +            goto out;
>>>>>> +    }
>>>>>> +
>>>>>>      start = 0;
>>>>>>      end = (1ULL << p2m_ipa_bits) - 1;
>>>>>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>>>>>> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>>>>>      return res;
>>>>>>  }
>>>>>>  
>>>>>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>>>>>> +                                      void *data)
>>>>>> +{
>>>>>> +    struct membanks *membank = data;
>>>>>> +    paddr_t s = pfn_to_paddr(s_gfn);
>>>>>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>>>>>> +
>>>>>> +    if ( membank->nr_banks >= membank->max_banks )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    membank->bank[membank->nr_banks].start = s;
>>>>>> +    membank->bank[membank->nr_banks].size = e - s + 1;
>>>>>> +    membank->nr_banks++;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>>>>                                               struct membanks *ext_regions)
>>>>>>  {
>>>>>>      int res;
>>>>>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>>>>>> +    struct membanks *xen_reg = membanks_xzalloc(
>>>>>> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
>>>>> You allocate at least 1 membank even though xen_reg_assigned may be empty because:
>>>>>  - this function is called for hwdom - no xen,reg
>>>>>  - there may be no xen,reg i.e. no passthrough
>>>>
>>>> Ah, sorry, there's no need to allocate at least 1. This can just be:
>>>>
>>>>     struct membanks *xen_reg = membanks_xzalloc(
>>>>         rangeset_count_ranges(kinfo->arch.xen_reg_assigned), MEMORY);
>>> No, it cannot. membanks_xzalloc() calls xzalloc_flex_struct(). If you pass 0
>>> as size, the latter will calculate offset to FAM[0]. In other words, the
>>> allocation will succeed but only for members up to FAM[0] (i.e. only for struct
>>> membanks_hdr).
>>
>> If we pass 0 as the size, these members (and their ->common.*
>> counterparts) will be allocated:
>> xen_reg->nr_banks
>> xen_reg->max_banks
>> xen_reg->type
>>
>> but there will not be allocated any space for the flexible array member:
>> xen_reg->bank[]
>>
>> Since ->max_banks will be set to 0, and ->nr_banks shouldn't exceed
>> ->max_banks, it should work. At least for the (inner) loop in
>> find_unallocated_memory(), when ->nr_banks is 0, it won't dereference
>> ->bank[]. FWIW, I also tested this with UBSAN enabled.
>>
>> I admit it does give me a weird feeling not allocating any space for a
>> member in a struct, but it's a C standard flexible array member, and the
>> array's size would be 0. We deviated relevant MISRA rule 18.7 in
>> b87697fc1a6f ("automation/eclair: fully deviate MISRA C:2012 Rules 5.7
>> and 18.7").
>>
>> With that said, I'd be happy either way (i.e. either allocating exactly
>> what's returned by rangeset_count_ranges() or max(1,
>> rangeset_count_ranges()), but I just want to ensure we have the same
>> understanding on the technicalities.
> Hmm, why do you want to allocate memory in the first place? If xen_reg_assigned
> is NULL, we should not allocate anything. Instead you suggest to allocate either
> full structure or part of it. That's where I disagree.

Ah, alright, I see now. I'll conditionally allocate xen_reg, and ...

>>
>>> Also, even if you conditionally allocate for xen_reg_assigned or set NULL, in
>>> latter case you will end up with mem_banks containing NULL member. AFAICT that's
>>> not something expected by the users of mem_banks (+ it gives unneeded iteration).
>>
>> Agreed, it would be a bad idea to set xen_reg = NULL (leading to a NULL
>> member in mem_banks), because then find_unallocated_memory() would not
>> be happy.

... I'll adjust find_unallocated_memory() to skip over NULL entries.

