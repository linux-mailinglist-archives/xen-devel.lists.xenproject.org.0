Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2477AD5787
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011771.1390288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLq9-0007im-UP; Wed, 11 Jun 2025 13:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011771.1390288; Wed, 11 Jun 2025 13:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLq9-0007fW-RE; Wed, 11 Jun 2025 13:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1011771;
 Wed, 11 Jun 2025 13:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPLq8-0007Pv-Lr
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:50:04 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62387f4-46ca-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 15:49:59 +0200 (CEST)
Received: from SN7PR04CA0025.namprd04.prod.outlook.com (2603:10b6:806:f2::30)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 11 Jun
 2025 13:49:53 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::3c) by SN7PR04CA0025.outlook.office365.com
 (2603:10b6:806:f2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 13:49:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 13:49:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 08:49:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 08:49:51 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 08:49:51 -0500
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
X-Inumbo-ID: f62387f4-46ca-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuR8gPZdB0hXgGvmicLylt4tfwIXsTqlkVX9sz8ECUdEMw/sgb14zy5cS2DgmKw3ZqZhSk4LxeLXOIB3laZiE959F77EzFhWANwJX1HnYeHCMwn9FTevvW6/e39314Teh7g3vmvlEB0Iw4ge5loN86q9NTbEukNzcIauPIBkQBRTJC0Z2zCrvflAm9rSIJnLMNdizfNDxNJvVfrJnM7jtPksGFaTONbOZRuijnd6ndI0doHrmZGjyX/a+WZMHXt4mPYys0CzQMSIvZ5IE/+reh5AL541oqskA0s7f8AW9pnhI9HaxQXgVk4Uz5bSwSR6kbh1Nb7PzztoVVje0mZKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9m6AtpTqgsU8kmX/B/6Qk+1bXS1ntxwE7nqu5cdQGU=;
 b=oT5kIPdGo9wIumE3dEQpVWb/K8BUxYloCTZ8JLpR3pftbzmBTYtTmmFVoorPXZGKHTggQQIxamK/t7pV1+L0bGl6HyQ8Qv4pxiz1frugmEOBDi8aIakKnsACskugKvsgddPWwV8AdeEMNMma2hGTlAi9HNWFMHa2AiIdDj3csBOqwPvLnZ8qS2zbDi/laVcu6DEWUoHkhTCfzFHOcUIlVcgCQCW9EeY+oskFBLxjxHBRD0GWVlWHscIPjHFSsBb13d2yB22pfYkuGVEFAcDr2O65t7yXoBXKxprc8EZOQmmJvlBV55awTJGMaaPMH2nfxucWY4yCFrmpFnWiQ+TrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9m6AtpTqgsU8kmX/B/6Qk+1bXS1ntxwE7nqu5cdQGU=;
 b=Im8DT8h9zo2T2qMMmBhxAKjRgfr9GWjMHPcmDabGcmn268CREa9Hc5oArXiMJCC7wGfRHDzFHHE1K634YKwZ9FTQTRhgF9qVxEuk1sreF4p6oqFe55R40zBwtoNnfY1UYSkzlRN5CNjE67Pk5diFSJLk1+mHW+NRYaLxUNRAqvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3ea5fec5-0083-4c83-9430-229550911b6b@amd.com>
Date: Wed, 11 Jun 2025 09:49:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
 <20250609183438.178214-2-stewart.hildebrand@amd.com>
 <6a52ad54-cac8-43fc-b396-87b0ac01d1dc@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6a52ad54-cac8-43fc-b396-87b0ac01d1dc@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e807388-65a9-4db0-b5bc-08dda8eed785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2c5VmZSNWtsMVBPdERLTElyZU5DdGZsZ3VxNjBIdU1rVnloZFRWcUFXaTNU?=
 =?utf-8?B?OWk5Y1FHZFlxRHJ3U2tuTmQxaHFHUnhLOERRQ2loNlFJMXdQb3A1ZGo4K1Ru?=
 =?utf-8?B?WjFHNEI3TDRxdjBLUGQ5WW1xbG1tTHFSTHY3TGdJblJXODBWTk5JUTQxcmhX?=
 =?utf-8?B?SjlINlpWNHN3Ukl5UHlKbnJiM1FNbDlwVUZuVkU5YXNHMks2QWlycHQ4Rzg5?=
 =?utf-8?B?RWM5N1p2VUhpVUR5ZkhTUUtDY0QxYVRkMHAxVkNzRG9jVHd5bHA3aC9oYU91?=
 =?utf-8?B?WHJLN3hwWXYveWdKcVhlVzFLRVRCZk1VOHUxMm1TcS9tYnN4VCtOSGt6Ri9p?=
 =?utf-8?B?NmkwN1FyM21yTTNGb3Q0SW92akNuM0lvSWIzZG9pWW85VUxEcCtBM014TDFM?=
 =?utf-8?B?UFJwdzdQTFZkOG9KZXBmSmcyV1lQc3BqaEdDWUx3bkJwTjU0eVplTlZjK0xW?=
 =?utf-8?B?Mjl3Y0pCaGpsY1JNUTRNbVJJR3RnMTB6bllXWjdBUG5KVloxdjVEMjA1SzBv?=
 =?utf-8?B?OGV2UGtlVTRtQXZnYncwd280c1J2VEJ5VnVCOVVmWnkxSC9OdEtwSExsOVA4?=
 =?utf-8?B?dlZiMFdXczhqRVM3cDJlWHNIMDVwelZHanFPVzg1ekN5NXhkbWJCTGlTUVYx?=
 =?utf-8?B?VW9uSUtBUUlDWG1MbHFIR0N3d2lRTUhVZ1FVeGtsVlNTeWI0Ym9aWjNmV3hs?=
 =?utf-8?B?ZGhMcCtCejg4aStwVnJZR2YxWDNvajVzbzNtWkZKeEpUS0h5WnFlZEJqQ2xY?=
 =?utf-8?B?ZHhYT0p6Q1R6cjJDcWt0SGVkRUh4am54SDFsTldUN3lydG4zTzdvQ0dSeENq?=
 =?utf-8?B?VnpaSkZ0bDdRU2NkeGRLM01NQ1lqaDZmWU1HZXVPUG5vOVFTT2MraVJUeU9K?=
 =?utf-8?B?NEhtNDhybEJwRWF3MWJCTDEzMWJ6TnMzQVdRYWV2UEhQT0dLZnpKOGZ5enNx?=
 =?utf-8?B?SmQ0d2lVZVZIMitYSUs1M0tML3VRVVdCTlp5RWlXWWd3ek16V210UVZ6UXZV?=
 =?utf-8?B?SWUxTFEyNm1iTllDL0hVbDRlR0M0dWpXb1pNOHNrT3ZaUWlybDdQcFQwNHRp?=
 =?utf-8?B?SW82cm9Gb0plZ0ZKam9HSk82NHVyNEJUM0tteWVRRXdnb05Zc09HVnhDMTg4?=
 =?utf-8?B?Q2YyWkpJT3VrU1F4S0xqWmNFVncreGpYZDBhUjNWajRkcTdOallMSTRsWHNX?=
 =?utf-8?B?ZTlNSzlXMGZoa2FiYWpWNDdYSmlLcndmYytRYjZvMHB0ek9CdXdpK2d3c3Np?=
 =?utf-8?B?K1VQTXVMWGNjMkNocUpYNVBlWGNOaVFsZ004Zk1KUHg3cDljd0FpeDRtVWFX?=
 =?utf-8?B?UFMwME90RnVPVlpYUXNmU1RKazI1aHVMazZKTTI1ME4wNG9wbGo0alVrbEdO?=
 =?utf-8?B?OU40VjM2RER5eGNBbDRUZWoxczQyNmZNT0hJb1orZXRINHFaZUR4Sm8vdlRP?=
 =?utf-8?B?ZGN3Y3FJZ3VqUmVySTFtK3dPMVVJRVN3eFNmSlI5NzZBNnVBcGt0YnltR2hu?=
 =?utf-8?B?YUJoUE1MbWI3VE5xTnRFeWpsdEcrOEtVeTB1T2oyQnBvUVhkUVIxOHArV3Vx?=
 =?utf-8?B?cGxNMTg5bnRHQjBwYjJlN050aTN3dkVBbVZTaVp6U3ZlSll0c3F2VGpnTUM1?=
 =?utf-8?B?c1BGdDJGOE0xOUUxM1VHcUFxVjZ5VW5odmIwS0tLVUhTSE1vZzZpd0xST0tn?=
 =?utf-8?B?bS9UbmhMK2xmMVJEZ3d6NDlOYVhiQmhOKzE2ZnJXUFdqNm81cDlieHBRSXNk?=
 =?utf-8?B?NHFoKzhOR0NlOFNpZk1reHFkLzBxN3JXdHp5Z3NUalhFQVJ3VmFQTzJqQzhS?=
 =?utf-8?B?blFXM0lzRVdRcncvRTNvVWswN0pjMkhFWk9VT3BpeVlUOXFDZU5nVGsyZWJ1?=
 =?utf-8?B?SVlZKzRRbEgwSjNrVzZTdFdUbXNldVU1dXFkSXRQWHR1dnFVeUN0dFBVY2Jo?=
 =?utf-8?B?WUc0OVorNXpMbGw0RlZmRmw2dnBBODRPbmo2TzVaSzBMeDB2aG9mY2pnWmZw?=
 =?utf-8?B?SFc1RU1GSFBuSUNpVW1PNmc3aGtmU1QwSnNhWVpKY3dTdkFQcXo2aFdPSGhn?=
 =?utf-8?Q?u+BpYR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:49:52.7302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e807388-65a9-4db0-b5bc-08dda8eed785
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340

On 6/10/25 03:27, Orzel, Michal wrote:
> On 09/06/2025 20:34, Stewart Hildebrand wrote:
>> Similarly to fba1b0974dd8, when a device is passed through to a
>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>
>> Take the opportunity to update the comment ahead of find_memory_holes().
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v3->v4:
>> * conditionally allocate xen_reg
>> * use rangeset_report_ranges()
>> * make find_unallocated_memory() cope with NULL entry
>>
>> v2->v3:
>> * new patch
>> ---
>>  xen/arch/arm/domain_build.c           | 77 +++++++++++++++++++++++++--
>>  xen/common/device-tree/domain-build.c |  5 ++
>>  2 files changed, 77 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 590f38e52053..6632191cf602 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>  }
>>  
>>  /*
>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>> - * regions for the special memory mappings. In order to calculate regions
>> - * we exclude every addressable memory region described by "reg" and "ranges"
>> - * properties from the maximum possible addressable physical memory range:
>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>> + * domU as extended regions for the special memory mappings. In order to
>> + * calculate regions we exclude every addressable memory region described by
>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>> + * memory range:
>>   * - MMIO
>>   * - Host RAM
>>   * - PCI aperture
>>   * - Static shared memory regions, which are described by special property
>>   *   "xen,shared-mem"
>> + * - xen,reg mappings
>>   */
>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>                                      struct membanks *ext_regions)
>> @@ -882,6 +884,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>          }
>>      }
>>  
>> +    if ( kinfo->xen_reg_assigned )
>> +    {
>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>> +        if ( res )
>> +            goto out;
>> +    }
>> +
>>      start = 0;
>>      end = (1ULL << p2m_ipa_bits) - 1;
>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>> @@ -962,11 +971,48 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>      return res;
>>  }
>>  
>> +static int __init count(unsigned long s, unsigned long e, void *data)
>> +{
>> +    unsigned int *cnt = data;
>> +
>> +    (*cnt)++;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>> +                                      void *data)
>> +{
>> +    struct membanks *membank = data;
>> +    paddr_t s = pfn_to_paddr(s_gfn);
>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
> Why do you subtract 1 here if ...
> 
>> +
>> +    if ( membank->nr_banks >= membank->max_banks )
>> +        return 0;
>> +
>> +    membank->bank[membank->nr_banks].start = s;
>> +    membank->bank[membank->nr_banks].size = e - s + 1;
> you add it again here.

To be consistent with add_ext_regions() and add_hwdom_free_regions(),
but I suppose there's no need for that. I'll drop the extraneous -1 and
+1.

>> +    membank->nr_banks++;
>> +
>> +    return 0;
>> +}
>> +
>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>                                               struct membanks *ext_regions)
>>  {
>>      int res;
>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>> +    struct membanks *xen_reg =
>> +        kinfo->xen_reg_assigned
>> +        ? ({
>> +            unsigned int xen_reg_cnt = 0;
>> +
>> +            rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
>> +                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
>> +                                   &xen_reg_cnt);
> This does not look really nice with ({. Why can't we create a helper function to
> report the count for xen_reg_assigned and call it here? You could then also open
> code your 'count' function that is not used by anything else and is quite ambiguous.

If I'm reading this right, I think you're suggesting something like this
(in domain_build.c):

static unsigned int __init count_ranges(struct rangeset *r)
{
    unsigned int xen_reg_cnt = 0;

    rangeset_report_ranges(r,
                           0,
                           PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
                           ({
                               int count(unsigned long s, unsigned long e, void *data)
                               {
                                   unsigned int *cnt = data;

                                   (*cnt)++;

                                   return 0;
                               }
                               count;
                           }),
                           &xen_reg_cnt);

    return xen_reg_cnt;
}

...

    struct membanks *xen_reg =
        kinfo->xen_reg_assigned
        ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
        : NULL;


However, the open-coded/anonymous count function, aside from being a
compiler extension, doesn't seem to play well with __init. As written,
this doesn't link:

Error: size of arch/arm/domain_build.o:.text is 0x00000014

Adding __init leads to:

aarch64-none-linux-gnu-ld: prelink.o: in function `count_ranges':
/home/stew/xen/xen/arch/arm/domain_build.c:978: undefined reference to `count.5'

Making it static leads to:

arch/arm/domain_build.c: In function ‘count_ranges’:
arch/arm/domain_build.c:982:43: error: invalid storage class for function ‘count’
  982 |                                static int count(unsigned long s, unsigned long e, void *data)
      |                                           ^~~~~

