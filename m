Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40345ACCECB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 23:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004876.1384551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMYzB-0001pQ-Hk; Tue, 03 Jun 2025 21:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004876.1384551; Tue, 03 Jun 2025 21:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMYzB-0001nz-Ez; Tue, 03 Jun 2025 21:15:53 +0000
Received: by outflank-mailman (input) for mailman id 1004876;
 Tue, 03 Jun 2025 21:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Dwk=YS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uMYzA-0001nt-Gg
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 21:15:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec25ab8b-40bf-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 23:15:50 +0200 (CEST)
Received: from MN2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:208:236::29)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 21:15:46 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::5d) by MN2PR05CA0060.outlook.office365.com
 (2603:10b6:208:236::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 21:15:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Tue, 3 Jun 2025 21:15:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 16:15:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 16:15:44 -0500
Received: from [172.31.138.29] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 16:15:43 -0500
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
X-Inumbo-ID: ec25ab8b-40bf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muK2pcBZq09aYFDifC8PheJY3nhaaIrneE6lcdJxts251i2Xt8iU5hWl9J9arghHdgvr+u7qF/xWR7ey8f+MDsf8HGO3Co8rAPw/dbuI0OuVMM0Pp+QR/rtwSxif3daHoMW4snbDYU4PciZwWr8g7qgZLh392/WjdqhTwt6Saqvpxf8wi4AvpD7htU0eamRskXhKD2twH9G+gvF1iBGxdIx77G4MAE5d8v54lilvJ2tblU8ddTxNWR/Q1xRnnaXUMtSdXGt633/6lnv4wvnKFLSMal8IZScFjq+/LwphC8nX5MlR5kRI6J1NHITPVfKxGIk0HzWAlcLQQsVssgk4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o2Osna6pU0Zg0E8eP+DfN2HnDAwcfSnKy8HLh5fBaE=;
 b=R7iArKJpHP3FuphU3AS3OHUfDsGGl2IIRZGNDSxv5CRfO9a1oYpzni3PaMmEIY0vZ0o2qGq7BdjfMccoQNcl56aWJi+077+1a2m/I3p4eZFL30V6hf5wTwx8ofqFIc7nvLnV4CfMN2kpQLIWcfQoBYXDkYcX49hB2p6jGxguO3r6X1sIHKy+paXEHVn4yQQDN0xyJXz5E16KMF8q9M5g7MA9F/DHw2SnIZNrvX6H7VXp09Qo9QlFOm/POYW4EqWq+q6W+SFpL3DKk1/exD58yq8N5jg7dxGd9pyoZbY8lEOWrNQhJ2vu2QDauaVb7inArwfuHRDXblEoIJ3SKuVVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o2Osna6pU0Zg0E8eP+DfN2HnDAwcfSnKy8HLh5fBaE=;
 b=ZTk+Mn2jrygl78OpRchmO5yWglDrwRe5GEUHI75xdcbWi7yoHiBSxZsPqxuEvvG6F5G+T/ZAUZq9VBJ44FCCvzI9wzHPRMPqgDU3N/svU+NLKDRmglhB2xEEzjjRinGgJrl+OTemgB3xsSbQmYL4wCe/CMekqmnT0WfxvJ1ZHv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4bd41362-6ee4-44d7-9f9b-0ffd78f1e6f8@amd.com>
Date: Tue, 3 Jun 2025 17:15:45 -0400
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
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <54c3d341-1d7f-428d-89a7-ce4fcae8a5db@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: d554ecf8-2784-4c0a-48e1-08dda2e3ce03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDRPdlVHcDRxZkg2WXpkNjFwcDBTd0dQN2lFRmlpdlpWSzJtbUZQVU1xd093?=
 =?utf-8?B?T2E1RHZaT0p0QnRlcndoVW1CUko3b2RweGtaM1hZYXhUcHp5NnRGZlFUelJF?=
 =?utf-8?B?d1NBcVFuMWY5U2U0ZERMa211bTFvWS9uM2Y5RzJGVnVvdkMxT3hVWThBRXNx?=
 =?utf-8?B?VjJZaDM4NG05UklaTW1pc1IvaGdUUmlsL0hrSFQvaDUwTGNad3Fzck94dkFX?=
 =?utf-8?B?Zkc2ZGRUMmlQa2RmNjdyWnpiTDlvaW9CUjMvZ0szZUFndE1PNndCT25JR0po?=
 =?utf-8?B?LzZ3d1dZUlhXN0pFU3NBZTdhcjBJWXhlK1VoZHZaUEQzL1V0N3lsbGxjRTl6?=
 =?utf-8?B?aWgxSzVsdUpLRnJRbEFjZkN2aGFyVlYvWDZDNS9wUHdIL0h6YnN0V041anAw?=
 =?utf-8?B?MXdvK1B5b2Jra3RweHh2S3F4NEE4NmhNR1lZTFBMSlk0bTNqUG4zR3dPVFd1?=
 =?utf-8?B?a2JlRmxUK01BNi9KbmxvazB2Ly9tcTR3d3FFa29RcHIvZEFKYmNrUmlIeGpW?=
 =?utf-8?B?TWk3RTE0SG52WVM1dDFyUzBvSFlaZWVpNFhZM3FmaVBGU1pwYkNzUGwwOVJI?=
 =?utf-8?B?MmFBVmtidTcvRXM1aGhLS0czT3haN0lZaDZ5dHBpYTNQR1M2eHJVdGRrS2h3?=
 =?utf-8?B?OUo4ZmRwLy9FekVQaXhpT3ByTTgxZ1BVTEo3ays0MTk4RGYzZGM1SytYZWxs?=
 =?utf-8?B?YVMyQndGemxOaFFVRDh1emd6L1lmbm9rTE5SK1lCQkhuK1ZhVjIzNFJxa3pW?=
 =?utf-8?B?N1F2Y2g1aDZFTENnV1lOSnduYVRSNk1hV0xUdm9kNkhqU3p5d3RFeXRzVUVi?=
 =?utf-8?B?RDF6MkpBR0dqcU1sZzdjc1dIQmRCMmFNYTRuUDhodVpUWWcxWWhxV0NaMkJx?=
 =?utf-8?B?TWFkN1BQNWM4YndXWWVFdHM5WkdSZE5oQ09aVEI2LzNrQ0hTYzc5RWFyRm1t?=
 =?utf-8?B?NEg2ajZlTXMzb2h2ZVhub2h3N1V4eFg1YkZPTExydXdqS1FwMnBEWDhvMUhm?=
 =?utf-8?B?NXRNVGlPTG9GTWZQMEt3eUdSWUdYRkt5ZE1RWHJiUmUvdzBwdW41SzRieWVE?=
 =?utf-8?B?bnppVERJWEY4VkZUWUF4REk1dWRsbW1DT1k1SkV3aFE1QzBJRUhGVEpZdWdI?=
 =?utf-8?B?TGMrWGJIZy9oYWt3M2Z4QzBnTFJBTTl5eEl5Vmx6QmpJVTNvMHNCZkgrQ2Vx?=
 =?utf-8?B?L2ZFMEJDVWNCVzRkOWNEd1IvVTAza0Q3dEgrME8zVTVIandWR0VQVnBWcVdH?=
 =?utf-8?B?MllUQnhsSjhUMzlKL0VMUWM5cHRmUWI2R2R4d1RNN3dobVVtYVcySXcwRWJG?=
 =?utf-8?B?Znd3Ni8zMndaZEF0SmppeXlBSVZPWExOWXd6d0tFTkNlV09KaEJISklRR20v?=
 =?utf-8?B?MEtxWkVhVFVCUFM2ZzZwN004aFdrYnlSVHZ0ZXNzbm9LU0tzbXMwZ2o4SEYr?=
 =?utf-8?B?cUdQZ3hEdXpvMWtpVDk2WTRLTW9rWUN0M085TGI2RlBDWitubkJxSjBRRzJ2?=
 =?utf-8?B?ZlBnYVVnSEFHNUZSdVJyUFJ2ZGJ2ZEFtYVVGeUdFV1MzdzU4NElzNCtTQTVh?=
 =?utf-8?B?Wm9aY0RpZnlQRnBCcUNrVXhXUStxa2xrV1dYaFFjVXprbzdlalZ3eDRtQzZR?=
 =?utf-8?B?akE5eUZhb3NmdmY3Y2FkaEZXYjZGWHQvckFBOXpDQzIyRW81aVlZWlZIVldC?=
 =?utf-8?B?ZkFGNXFaakNBK2dNaFlaSlJLWkUvRVkwU244eU83bzA5bDFQNHFnTDA1bUk5?=
 =?utf-8?B?TFVlYTZvd3h3S0Ztc1JvQTQ5NmlIN3g5YUhpSCtHUThNNzZwblBlYTRaQXNr?=
 =?utf-8?B?OGJxZ3BHc0oxU3BoR0IwcVdWWWUvVTFDZTVTWUdIMWpibDR2SzdlQ1F2ZGdS?=
 =?utf-8?B?ZThRQjE1VGlrT0cwNXg3TTlEQm0wcndXdEZCM3BKMStRRmtoRXM0WE9ITjZF?=
 =?utf-8?B?TnNEK0s2dGxYSE5vQTRBK0lXbTlLa1lnUzF6YWdHUXlYd1RCd1lueDBYSFZD?=
 =?utf-8?B?VXJCMlp0Uzl3TS9YRllSUmNGOVhsSVZpSmdpcCtSeXhOYWpMcngyZCtWR0VI?=
 =?utf-8?Q?kQUsxI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:15:45.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d554ecf8-2784-4c0a-48e1-08dda2e3ce03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

On 5/14/25 03:31, Orzel, Michal wrote:
> On 13/05/2025 21:54, Stewart Hildebrand wrote:
>> Similarly to fba1b0974dd8, when a device is passed through to a
>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>
>> Introduce rangeset_count_ranges().
>>
>> Take the opportunity to update the comment ahead of find_memory_holes().
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v2->v3:
>> * new patch
>> ---
>>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>>  xen/common/rangeset.c       | 14 +++++++++
>>  xen/include/xen/rangeset.h  |  2 ++
>>  3 files changed, 68 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index b189a7cfae9f..3cdf5839bc98 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
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
>> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
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
>> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>      return res;
>>  }
>>  
>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>> +                                      void *data)
>> +{
>> +    struct membanks *membank = data;
>> +    paddr_t s = pfn_to_paddr(s_gfn);
>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>> +
>> +    if ( membank->nr_banks >= membank->max_banks )
>> +        return 0;
>> +
>> +    membank->bank[membank->nr_banks].start = s;
>> +    membank->bank[membank->nr_banks].size = e - s + 1;
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
>> +    struct membanks *xen_reg = membanks_xzalloc(
>> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
> You allocate at least 1 membank even though xen_reg_assigned may be empty because:
>  - this function is called for hwdom - no xen,reg
>  - there may be no xen,reg i.e. no passthrough

Ah, sorry, there's no need to allocate at least 1. This can just be:

    struct membanks *xen_reg = membanks_xzalloc(
        rangeset_count_ranges(kinfo->arch.xen_reg_assigned), MEMORY);


