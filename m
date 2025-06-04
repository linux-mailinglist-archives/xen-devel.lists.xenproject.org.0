Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD216ACE555
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 21:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005890.1385223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMu9Y-00078R-G2; Wed, 04 Jun 2025 19:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005890.1385223; Wed, 04 Jun 2025 19:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMu9Y-00075i-DG; Wed, 04 Jun 2025 19:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1005890;
 Wed, 04 Jun 2025 19:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGE=YT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uMu9W-00075c-Ca
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 19:51:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d790e38-417d-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 21:51:55 +0200 (CEST)
Received: from CH0PR04CA0117.namprd04.prod.outlook.com (2603:10b6:610:75::32)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 19:51:52 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::37) by CH0PR04CA0117.outlook.office365.com
 (2603:10b6:610:75::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Wed,
 4 Jun 2025 19:51:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 19:51:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 14:51:51 -0500
Received: from [172.31.138.29] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 14:51:50 -0500
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
X-Inumbo-ID: 5d790e38-417d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnW8Fah93vzAsppY2h7t2dA0mgPIoWT8IuBQeCWXo+qCNB7WoF1KS3jSqeUJ9Y3nW7BJFmk3tXGQWD1KknQyQaGUHVwQKQMsx9V9vvV+bYB/XcnHO6fmrdxpggkdavL9CGd2BGSkKDw/lItp4aZ5PnZsV3F9+4CeWJ2qAlF72GL/hs9IQfl+lLniiVOYaf9Q8vn0sTGVEw9nsZd7xSvtsQWH4M5bvsHHvXpd3KemGj6ed1R5OuuyA7m/HPvFyQMX/qVGAQENvu3UB4SDKkg9IlxVSSM787Zr8FjGKbMhHrMtgIJnT7vmOJAJionwWTRBzPMtiAFBdom0xhAoE130wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWLtwx3KVfo9VJoKchdXuplTFM20rdP1HjCFSwF2KoI=;
 b=lnTQB+vmkRezvleSZliVXxgAzTDmyyHZJ7Lvo1u/nFqg+wUYNFrYeWHf+Ec50cC5KecGa+TT5SDQfPZp91ba9ZmhtsS9hoI1AGqkr/0p3DD2lbMgxk1ZvRBumP2A4Z68csRJ0ejNAX2vUJHbqLOD69AohfID7OAG4jg5RHEX8mqZOAkD/FUHmt66bCNQil7H77lMJzxgAeNcP6vKcY/GRFgzGjkv2VtgIy3IUnxox/r8bNNBRv+pmdlVpOzctNY74cig5dQfcJj4OnoDeVdeCIO5oAMru/PiPB3TwsNLQv+tWwNIEas++kPs47NXSo8IgHWvjN2nfnERIQUu4qU7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWLtwx3KVfo9VJoKchdXuplTFM20rdP1HjCFSwF2KoI=;
 b=2rA5SsCVYRCBQDCURsKlPDXbgNA3HJ1Dt9zo2ZmsMdV7lcU4/Qwv/6k0XrvX4uE9+5xI3iuUWnftgdKehf4ipZOyhD02TE37idVxdfn43FXl6bejFpP3hFE7ANOcME8P6QlJK9X0EDQuO1oB1fJs11X8JdjUfXFCnuuzybMBBcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eba4c308-f563-4f3c-8bc3-b5cfa2484fde@amd.com>
Date: Wed, 4 Jun 2025 15:51:53 -0400
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
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <28b22fa6-c6f9-463e-8e7e-0a00eae88737@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f7ac66-a926-42eb-7023-08dda3a14024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWRGd2FkVytUYUcvOHdFa1ROQVUwWll0aHFtMVp0Ry9uVVkvTHpVQkJDVnZH?=
 =?utf-8?B?QmtRd0dQVzY0MDRCZnVBeWhpeWJDN1NvYmQ4c1dSRVpjZ3NCYWFDei91SVla?=
 =?utf-8?B?cjhrTVo5Vnk4OHEwdTBWRGJNUGlxVkdNaHdGdHNtTloxYVhuZDlaSy82ZHlX?=
 =?utf-8?B?QTB2V1RPZGNLbExoaU00a1hnUmw3YUw4R0xuVHdZYnV6NmJDSWVidjFPaU95?=
 =?utf-8?B?cHFyQ2MwWXE5RkpTNXpkTUtmR05yWWhvVEVjdkcvdUFpbEw5SU9zaXErZ0ls?=
 =?utf-8?B?MjA2MjNwQVp6YjJ1dUtRZmJMSVRYaDhKWDBGTE1GblN1WlVxWXZVS1BGbTFZ?=
 =?utf-8?B?L3ZORDFVOXdTZEFxZjZ3MExNSzRnWGl4bEVqcCswaW1NeG5janN5bjhRRDNV?=
 =?utf-8?B?Y1NnZ1VDU2tEeElscnBVdXN5R0pBTnZWNEpOUFJWT3FPQS9RN1BseEx6Vm9t?=
 =?utf-8?B?MVUxUTNFd1JQTTI1NkpOS3RpZHE5djFUSE5Da2tDK2Ercnowa0lYUTZBdkFD?=
 =?utf-8?B?cDQ0aHkrSkhHbGpxWUpGaFN3bGRNLytGYWFEYjJyTDJSNTFDU1hXN0tVVXBY?=
 =?utf-8?B?Q1NVQTVkZnhsRmxtUVcrMDFydThROUdOb2JSenV5bnRra1JQbUp0d2ZEVVVk?=
 =?utf-8?B?RWlJemlxVUlhMkNBaWNtanpHRGFLRnJUcWsrZ2N5VFdCMXJLMStDdVJaOWow?=
 =?utf-8?B?TmpkakJudGxzY1JnUng4S0NzaTlaSGtYUjFVclBRRGVhcEppWk1peVpmVHpv?=
 =?utf-8?B?T3ljODk2S2JZMTVCYzF1eDB2ZnU1WHYvNm9ETHdPbW9ZUGlwTHU4VG9KNjZt?=
 =?utf-8?B?c0UxdXlhRldGRjFReFdOdEhJSytLd1U0NDJVa0RaaGI3aS80UzBLaXpIeEw5?=
 =?utf-8?B?bFIrWmxZbWJkdVBlTzhya05oMEx6M1VSSmR1UDlCVTVQalUyTDBSNkJDcGdl?=
 =?utf-8?B?U0swVldpU3FaNXhZM0hwQ3hiMzBKVjkycFU1SlFHY2g2R1crMUEwRzJqUWV1?=
 =?utf-8?B?TW50YnQvRElHK1RjVjJnR2ZKdkhDalZPZzYvMmRUNWovZHh1TGR6U3M0dER3?=
 =?utf-8?B?R2ZwWGc0QjFnU2xlQU12TVlxTjMyU2pIQS93MDhRdTNBNGJpaGRyTEhMSkhD?=
 =?utf-8?B?Rk9qZmtLSEJHWVM1ZUk2WXBpNWlXTG1xdHFPdXJsLzR4K2htMzdiR3dBaitM?=
 =?utf-8?B?MGZLVmx4a2tyZ1lveWlvbkxGTy9uNXE5V0NYOGFlV0xXY29TbW16U0lZeXU2?=
 =?utf-8?B?ajVNU1pzK0djWERCK3dCamxCRnp1WURDMWRTRy9qTnp6akdIVGlqbzZTN3VQ?=
 =?utf-8?B?aktEU3ZmRWcvMjI2YzJ4UVFlclRxS1RSWHVVNkIxcUNjanpqR3hoTDNuY283?=
 =?utf-8?B?L0VyVm1sSXpDNjdmRThNd0laNHY1RFREdjZIaVVYUkVnV0o1Kzg3RnJCbU9q?=
 =?utf-8?B?MHZ2OW5wT3hWM1dvRWkyZ1BobzV5MiswNCswRzlicEI0VHlwdWJzYkZRUXox?=
 =?utf-8?B?eTd6K1RuVjdwR08vZERRTjhRREZXWGFRczJmUnVMRW1YUlRjdWtUZTVad1BE?=
 =?utf-8?B?dEtuZ1ZWTlhiSzFFdzRQWVBaWk96Z09YNmEzNVJGOThhWGJKN0VzR0Z3WUw3?=
 =?utf-8?B?QjNKeVJyMzBZeDFzOFZ0dkFnL05nSldRZ2xUc28wRkRwTVYwazJJR1hxWXB0?=
 =?utf-8?B?Tlh5endaTTVrVERVbktIL3czcXgzUlFmdTZ4VnRna240YzRPdythekcvZE1O?=
 =?utf-8?B?eXZuMkNmWlNUdWs4K1pKMXd5Ujh5YWFwNlVyTFJMWG0zMjlzOFNZUkM5MXFY?=
 =?utf-8?B?VWJrOE1FeWdpb20xUHBFa0dhQm9xK1ZwS2RKcmhwL2F1bWRVUWxycjhWU1Fh?=
 =?utf-8?B?T3RVcS9xTzE5R0JvdFc0ZTF5TUl4dklIVnRYS004VE5kejBKZm1WdHBEQ3pJ?=
 =?utf-8?B?MGd4dzNIT2RKTkpLc2E1R215NmZXWWt4MEVWcDc3d1ZUZS9NakFwZEU3OHI3?=
 =?utf-8?B?VmJ5QThmaDM2eUl4VWNEVHNQakI3eThuL3hRa2E0dURaWU9NSjdKQlFkaHU2?=
 =?utf-8?Q?jywh2U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 19:51:51.7126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f7ac66-a926-42eb-7023-08dda3a14024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336

On 6/4/25 03:00, Orzel, Michal wrote:
> On 03/06/2025 23:15, Stewart Hildebrand wrote:
>> On 5/14/25 03:31, Orzel, Michal wrote:
>>> On 13/05/2025 21:54, Stewart Hildebrand wrote:
>>>> Similarly to fba1b0974dd8, when a device is passed through to a
>>>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>>>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>>>
>>>> Introduce rangeset_count_ranges().
>>>>
>>>> Take the opportunity to update the comment ahead of find_memory_holes().
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>> v2->v3:
>>>> * new patch
>>>> ---
>>>>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>>>>  xen/common/rangeset.c       | 14 +++++++++
>>>>  xen/include/xen/rangeset.h  |  2 ++
>>>>  3 files changed, 68 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index b189a7cfae9f..3cdf5839bc98 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>>>  }
>>>>  
>>>>  /*
>>>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>>>> - * regions for the special memory mappings. In order to calculate regions
>>>> - * we exclude every addressable memory region described by "reg" and "ranges"
>>>> - * properties from the maximum possible addressable physical memory range:
>>>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>>>> + * domU as extended regions for the special memory mappings. In order to
>>>> + * calculate regions we exclude every addressable memory region described by
>>>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>>>> + * memory range:
>>>>   * - MMIO
>>>>   * - Host RAM
>>>>   * - PCI aperture
>>>>   * - Static shared memory regions, which are described by special property
>>>>   *   "xen,shared-mem"
>>>> + * - xen,reg mappings
>>>>   */
>>>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>                                      struct membanks *ext_regions)
>>>> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>          }
>>>>      }
>>>>  
>>>> +    if ( kinfo->xen_reg_assigned )
>>>> +    {
>>>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>>>> +        if ( res )
>>>> +            goto out;
>>>> +    }
>>>> +
>>>>      start = 0;
>>>>      end = (1ULL << p2m_ipa_bits) - 1;
>>>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>>>> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>>>      return res;
>>>>  }
>>>>  
>>>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>>>> +                                      void *data)
>>>> +{
>>>> +    struct membanks *membank = data;
>>>> +    paddr_t s = pfn_to_paddr(s_gfn);
>>>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>>>> +
>>>> +    if ( membank->nr_banks >= membank->max_banks )
>>>> +        return 0;
>>>> +
>>>> +    membank->bank[membank->nr_banks].start = s;
>>>> +    membank->bank[membank->nr_banks].size = e - s + 1;
>>>> +    membank->nr_banks++;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>>                                               struct membanks *ext_regions)
>>>>  {
>>>>      int res;
>>>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>>>> +    struct membanks *xen_reg = membanks_xzalloc(
>>>> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
>>> You allocate at least 1 membank even though xen_reg_assigned may be empty because:
>>>  - this function is called for hwdom - no xen,reg
>>>  - there may be no xen,reg i.e. no passthrough
>>
>> Ah, sorry, there's no need to allocate at least 1. This can just be:
>>
>>     struct membanks *xen_reg = membanks_xzalloc(
>>         rangeset_count_ranges(kinfo->arch.xen_reg_assigned), MEMORY);
> No, it cannot. membanks_xzalloc() calls xzalloc_flex_struct(). If you pass 0
> as size, the latter will calculate offset to FAM[0]. In other words, the
> allocation will succeed but only for members up to FAM[0] (i.e. only for struct
> membanks_hdr).

If we pass 0 as the size, these members (and their ->common.*
counterparts) will be allocated:
xen_reg->nr_banks
xen_reg->max_banks
xen_reg->type

but there will not be allocated any space for the flexible array member:
xen_reg->bank[]

Since ->max_banks will be set to 0, and ->nr_banks shouldn't exceed
->max_banks, it should work. At least for the (inner) loop in
find_unallocated_memory(), when ->nr_banks is 0, it won't dereference
->bank[]. FWIW, I also tested this with UBSAN enabled.

I admit it does give me a weird feeling not allocating any space for a
member in a struct, but it's a C standard flexible array member, and the
array's size would be 0. We deviated relevant MISRA rule 18.7 in
b87697fc1a6f ("automation/eclair: fully deviate MISRA C:2012 Rules 5.7
and 18.7").

With that said, I'd be happy either way (i.e. either allocating exactly
what's returned by rangeset_count_ranges() or max(1,
rangeset_count_ranges()), but I just want to ensure we have the same
understanding on the technicalities.

> Also, even if you conditionally allocate for xen_reg_assigned or set NULL, in
> latter case you will end up with mem_banks containing NULL member. AFAICT that's
> not something expected by the users of mem_banks (+ it gives unneeded iteration).

Agreed, it would be a bad idea to set xen_reg = NULL (leading to a NULL
member in mem_banks), because then find_unallocated_memory() would not
be happy.

