Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC27ADCD24
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 15:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018240.1395147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRWLs-0002PM-T8; Tue, 17 Jun 2025 13:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018240.1395147; Tue, 17 Jun 2025 13:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRWLs-0002Mt-Q3; Tue, 17 Jun 2025 13:27:48 +0000
Received: by outflank-mailman (input) for mailman id 1018240;
 Tue, 17 Jun 2025 13:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LFW=ZA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uRWLr-000277-BD
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 13:27:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d99fb7af-4b7e-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 15:27:44 +0200 (CEST)
Received: from CH2PR04CA0017.namprd04.prod.outlook.com (2603:10b6:610:52::27)
 by PH0PR12MB7905.namprd12.prod.outlook.com (2603:10b6:510:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 13:27:41 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::da) by CH2PR04CA0017.outlook.office365.com
 (2603:10b6:610:52::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Tue,
 17 Jun 2025 13:27:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 13:27:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 08:27:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 08:27:39 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 08:27:38 -0500
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
X-Inumbo-ID: d99fb7af-4b7e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPlp7GmVwjiEXhS12rtPLAJJ8sUWgFmb7pbh8furcj/GeqXdH3UTFdJtRtP0+cH0qA2yVuV/UcT0WWbEE/IOwFj2Idj13qx3m4gNwtoKVqv8eOxvJb4dg/MMFt9J3wxIfFbm5EY2YCC3oMahnef8b/EVRXxF/eHEOhGNif93M6FsgjPyWNw/EKAsHrMwKb01A/OaApEZXakIYgKkZkMks6m+CTT1QyW5VCoMA0URs6I8RpyAQzG4987eN42TkhiuxhHAm8GpP/6yfmh7t/V18FH37nl+eIwj4ZctZYNR9ZEHgNtlBVlz9qxpzOzmbwEeyiRqs2rh++oRDW3QDIEr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBXBAFzwqtxsbqBHL4ZUIRDK5QRO12IVuEoQld/AAoE=;
 b=EqbjAdfkgo9hY8cLUE2eQghePAgoSMTMQiyG3zg36wYqfIxM9xAyKxSi4c5Dff13wuABGgjTAa38ZtXEn1xabEvO8zKIUvqvZnLJCldX0dbSb6ABNl0qWtB/97jSfrFoV+gy3vf5H9FGdptgdIQKLnhu5uXavx4b7CrABZv3Gsx7ahvl+nGcCOQgaHSkweDLoPpfL+uhPdJhOUTlm7Z4D8hOIRioG/wPPF6RUWlY0gS2qB07p4Fp+w3D9c5MxcrQbYHlHJoQHdqrZWlb0hn2+hww9VtcxkNHJcx0JcI4zYr9qvOm57IzigMzq+m+SoRr2YmlTc+cVcH54XNvIsyhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBXBAFzwqtxsbqBHL4ZUIRDK5QRO12IVuEoQld/AAoE=;
 b=3W9PRHwvepGX08poQpSRMJwj8fuP6PKJNSSoEnQ7GPSI2dMWV0fdyG2GZGgLXAVCbE1qB5y4lBVrx+pZVygLQs2rWXLlffWen/KF67ui13GA2/Ueli2OwtXQ7n3A+CrhspoutGRDYfJ5mQwOGKmqWKMI2hTyhTKIdozdHzQroKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <71689454-3014-473e-bbdb-6c11033c9338@amd.com>
Date: Tue, 17 Jun 2025 09:27:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250611175106.269829-1-stewart.hildebrand@amd.com>
 <20250611175106.269829-2-stewart.hildebrand@amd.com>
 <bb0002f9-4577-4809-8950-95b78ed88142@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <bb0002f9-4577-4809-8950-95b78ed88142@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|PH0PR12MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: cabebd2d-03dc-43b2-0be9-08ddada2bc0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk1WRDRYZFZRWklaNnBMbUl4RC9zWjNDc3FCRlhkUGFJcHRhM1Y1RmV5OVo4?=
 =?utf-8?B?ek5xdGFLeVBXU0FmSzljWTlaY2pKTUpIQmQ3Q01idzZGdE5Yd253a2luNmRY?=
 =?utf-8?B?TW9RVWVjVE92VE15QktEZ2IzWWVwWUJpRHN1NDJSaGJ4QkRUQjdtOGYxR1Rj?=
 =?utf-8?B?SWljeW81NGJtbzB6bWNHTkxRcWYwdmJWTHc5aTBuSkt2RFhNdlBXRUc1M1BR?=
 =?utf-8?B?Y0FhVlV4eWgrNEJOV0x5ZlJXK1pqRnB1Witrd1FKS0RsQXdRUnA0NlJOcDVk?=
 =?utf-8?B?Ym9MYWJmdTZ3Q255aWMxV3RxZFZOY2RFb0kvNUlEZTJwQlNlMUNWSEhoaGp0?=
 =?utf-8?B?SUh6L1diSnFxaHFWakw4TjZiMTErYjd2WjZ5LzhERVJjNUdHWFhxNVBXWVJY?=
 =?utf-8?B?VThHNVo5b3hGVFR1V0NJeUZoRTFUZmczRWhDTEpiWmhBa2FtcGFENmxtb3VS?=
 =?utf-8?B?bUxoUHEzdEpId1pGelZUVjdWL1hycmYyOFdVbEtYSTh3UlppSTVDVFVKY29l?=
 =?utf-8?B?dFdFMkliY1pnd1M5Um0rdHhRYzRUSlc4UzU5ekVLQ09LQkZUZEp4QTJ3MXhl?=
 =?utf-8?B?dGE4YlV3SUswd01qRCt3WnZmeW04ZjRwNlg0YVdOWjRFUXFGdnJvWklDVXhC?=
 =?utf-8?B?Z2t2Njd2blhneS93a2F0K2Y5YWFtMXl4V3pia3ZZL1dHRUlscmNUekIxaHlJ?=
 =?utf-8?B?WUpmVTJ1YnVITVV4M0dYa05Bc3p4V2dZeVQ0M0picXJIK0lFaWhCQ3h1eWxS?=
 =?utf-8?B?Nmt0QnZBUVk1S3E1NEVPMS9OYmcrSGRTbWpodm0vY21FRFoyUmJCU0E0ejEr?=
 =?utf-8?B?STBCMzFpNmtmUUNNMFBzczF2YTNoazFldFgyZkNRUzh3aFUvdkZrYTl0NEww?=
 =?utf-8?B?RnhiOU1LdWhlSUtUM2E4R2ZhN2NRYW1CaTlGMFIxWit2VnlrKzYrc3VwaVNH?=
 =?utf-8?B?dzhMcjJQcElENGRNdnJmZHJ4TlBrSnpIWllwNzNjeTFVTi9PWU1sVUk4QWto?=
 =?utf-8?B?ZnNjbWJOam9jMjR2WFRtM3I2WmZuTlNBZDVEeXBVV1JtNEtVZEMwS0gydDNz?=
 =?utf-8?B?M3BwMWxpNnBHbTVZSWZldXhpRG44VnBqZDN4dHRuQ1pQYVV1TFMzVmpPWG1V?=
 =?utf-8?B?VWxidWhkZXlCTHBQNmh4SFBDU2g1RTQxRmtJT3p2eXVWVE1lWjM2dUhkclhm?=
 =?utf-8?B?THhFUGtvM2xUTzVlaCtJNW01WmZzYXVMTEZlVWRYUjd3MEt5ckw3Uk14RWcr?=
 =?utf-8?B?eDV2dmZpRjRHQlplRkdaeFBLWlFVUnNVcU1tOUN6dUNaVDNIYk1lTVI5TVFk?=
 =?utf-8?B?cGNMak9kWlFlM0hWN3gvZ0VvOTVIek44OTU1RlY4WkhnRU9zSEhya3VtdzNm?=
 =?utf-8?B?VU5mSml5NS9pSmFLN0I3V3dHam5ENW4wT0F0QVhWMDI2Z3QyejI5ZC80MHlX?=
 =?utf-8?B?akpZeWFvbHdWR0RxK0ZHTDl6ekdlQ3pOdHpXNE44Skhkci9FNzdZZlJreXZT?=
 =?utf-8?B?NEh0Ym8veW5PN1ZUcUZZOTQ1R3pXM1NuSTd6bURrVk05dDI1OTdQSksxbG5F?=
 =?utf-8?B?MWl4bmhvTkE3Rm5zNzRwakl3SUU4TXJMaml4b1pDUVR0OHRYY2tzZjFZYXp5?=
 =?utf-8?B?Z2k1VkhRMXIzendScTVXdFpCbkJLQ1hXRHovVlJWQW96Yy9KNmNOL3ZRcmhs?=
 =?utf-8?B?UHBYd1hxdGJ3L05jUmNYZzB3MzIzaVNzMUkxM0VFYzcxak5mS04vSHhJNFBw?=
 =?utf-8?B?UkZ1REJqcmoveHlaNWJKYys1MWo0Q1E3Ukg1QUhQWWlHQWd4cWtsNWVaL2ZC?=
 =?utf-8?B?SHZpKzRXZ2xDVk1ud1d5b0dKWjBIS2xGQmdtSTBmR0QvVUZmbWxSV2ZYSVV5?=
 =?utf-8?B?bXNaYk1Wd3hPWFZzeFFCZEQrcGlPeE4ra2RKcFFkVXpUZGVZRTBtajdFbXZa?=
 =?utf-8?B?T0F3THFsS0VReFFWVGRicGs0M0h2WnpmSjRSbjMzTmUwSE5CSFhJeGIvSDZE?=
 =?utf-8?B?NktyOUx2ekNRTUo2ajZtV2VqeWpJblRkSCt5clcxSVZRMVM5ZG1FZ0JEUnBx?=
 =?utf-8?Q?mfsQpF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:27:40.6929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cabebd2d-03dc-43b2-0be9-08ddada2bc0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7905

On 6/12/25 05:06, Orzel, Michal wrote:
> On 11/06/2025 19:51, Stewart Hildebrand wrote:
>> Similarly to fba1b0974dd8, when a device is passed through to a
>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>
>> Take the opportunity to update the comment ahead of find_memory_holes().
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v4->v5:
>> * remove extranous -1 and +1
>> * create local helper function to count ranges
>>
>> v3->v4:
>> * conditionally allocate xen_reg
>> * use rangeset_report_ranges()
>> * make find_unallocated_memory() cope with NULL entry
>>
>> v2->v3:
>> * new patch
>> ---
>>  xen/arch/arm/domain_build.c           | 80 +++++++++++++++++++++++++--
>>  xen/common/device-tree/domain-build.c |  5 ++
>>  2 files changed, 80 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 590f38e52053..cef6c85e22ec 100644
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
> If you took occasion to improve this comment, then I would replace Dom0 with hwdom.

Will do.

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
>> @@ -962,11 +971,51 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
>> +static unsigned int __init count_ranges(struct rangeset *r)
>> +{
>> +    unsigned int cnt = 0;
>> +
>> +    rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
> I don't think it's ok with MISRA C to not check the return code, even though in
> this case it's always 0. Either we should check or have (void).

I'll add (void).

>> +                           &cnt);
>> +
>> +    return cnt;
>> +}
>> +
>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
> Here you use s_gfn, e_gfn but for count() you used s,e. Even if unused, I would
> prefer consistency.

I'll make it consistent.

>> +                                      void *data)
>> +{
>> +    struct membanks *membank = data;
>> +    paddr_t s = pfn_to_paddr(s_gfn);
>> +    paddr_t e = pfn_to_paddr(e_gfn + 1);
>> +
>> +    if ( membank->nr_banks >= membank->max_banks )
>> +        return 0;
>> +
>> +    membank->bank[membank->nr_banks].start = s;
>> +    membank->bank[membank->nr_banks].size = e - s;
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
>> +        ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
>> +        : NULL;
>>  
>>      /*
>>       * Exclude the following regions:
>> @@ -974,6 +1023,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>       * 2) Remove reserved memory
>>       * 3) Grant table assigned to domain
>>       * 4) Remove static shared memory (when the feature is enabled)
>> +     * 5) Remove xen,reg
>>       */
>>      const struct membanks *mem_banks[] = {
>>          kernel_info_get_mem_const(kinfo),
>> @@ -982,12 +1032,29 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>  #ifdef CONFIG_STATIC_SHM
>>          bootinfo_get_shmem(),
>>  #endif
>> +        xen_reg,
>>      };
>>  
>>      dt_dprintk("Find unallocated memory for extended regions\n");
>>  
>>      if ( !gnttab )
>> -        return -ENOMEM;
>> +    {
>> +        res = -ENOMEM;
>> +        goto out;
>> +    }
>> +
>> +    if ( kinfo->xen_reg_assigned )
>> +    {
>> +        if ( !xen_reg )
>> +        {
>> +            res = -ENOMEM;
>> +            goto out;
>> +        }
>> +
>> +        rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
>> +                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
>> +                               rangeset_to_membank, xen_reg);
>> +    }
>>  
>>      gnttab->nr_banks = 1;
>>      gnttab->bank[0].start = kinfo->gnttab_start;
>> @@ -995,6 +1062,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>  
>>      res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>>                                    ext_regions, add_ext_regions);
>> +
>> + out:
>> +    xfree(xen_reg);
>>      xfree(gnttab);
>>  
>>      return res;
>> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
>> index 6b8b8d7cacb6..99ea81198a76 100644
>> --- a/xen/common/device-tree/domain-build.c
>> +++ b/xen/common/device-tree/domain-build.c
>> @@ -193,6 +193,10 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>  
>>      /* Remove all regions listed in mem_banks */
>>      for ( i = 0; i < nr_mem_banks; i++ )
>> +    {
>> +        if ( !mem_banks[i] )
>> +            continue;
>> +
>>          for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>>          {
>>              start = mem_banks[i]->bank[j].start;
>> @@ -212,6 +216,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>                  goto out;
>>              }
>>          }
>> +    }
>>  
>>      start = 0;
>>      end = (1ULL << p2m_ipa_bits) - 1;
> 
> Other than that, LGTM:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

