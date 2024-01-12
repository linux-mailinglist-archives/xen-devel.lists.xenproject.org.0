Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82382C65F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 21:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666979.1037970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOOC3-0005Ej-VU; Fri, 12 Jan 2024 20:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666979.1037970; Fri, 12 Jan 2024 20:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOOC3-0005Ci-Sh; Fri, 12 Jan 2024 20:31:55 +0000
Received: by outflank-mailman (input) for mailman id 666979;
 Fri, 12 Jan 2024 20:31:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vfvq=IW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rOOC1-0005CY-Fw
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 20:31:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bda05f5-b189-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 21:31:49 +0100 (CET)
Received: from CY8PR02CA0019.namprd02.prod.outlook.com (2603:10b6:930:4d::12)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 20:31:43 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:4d:cafe::b0) by CY8PR02CA0019.outlook.office365.com
 (2603:10b6:930:4d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Fri, 12 Jan 2024 20:31:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 20:31:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 14:31:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 14:31:42 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 14:31:40 -0600
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
X-Inumbo-ID: 9bda05f5-b189-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCIfZgHqNMlqopAvwjVFCJxhVkQ6ltssSjj7Ad54Z4tY3ml/j84N9a/acxR7SkRsZDPVDrhCn1LI0GSe/hAMwDQLGe+os4Mb7EjqCcpDkW6UpKu1gZgprxXbY+sLVdizu+a3PQzNO+20/bz/8OHst2XxpfOKmK3/JQ25lbninoBC8+nN6gfqqoGiX45vLtXTG0db45F4k7WhuueCTB2SIanzOCgj5E9LR1NoyISq0sRPnr2JeS/l8b+NzCk95xPMs1niMl1OaoLKLkINS7H4G3o0fso0biQT2z3I5f4rIqw+uw8N+slQkL5OouJxY8nFLZrIaaC12yhvErruT8aKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s946DDDDbu/PynPrmfVtC7o6tO58Biy8XHhUbwbMOQ=;
 b=kcIs4WcaBIXeaK/lGBW9pmLEhjhXWCwS4T6gCLlhWkms1Cpueoluj6KaXhUGNj+VbmNOd7BLqPa0Bz9H6YPste5UJigWt6D2MPv98x744vvQB11nCCXITFGu/gFULd13JCrqp3Z2YHZpSRfY/81qjgYel/kW6KHeR1Vq4LxDmlzhkeDi06jEJSDrVJ6UyltJ26N/z4nfuRZGg0AG0n4gRmVVPb7OgqYdQsKG5vlWthe+61xnrJIRLVl4m1jXSJ2g9iJ9ofuPcSYyB9g+6GFTQkD4M3xrEkKXQl54+wc7AeN3lJaovRu1Cfp1XhMXdA3gcqPE0TkRirGgltedyp+GYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s946DDDDbu/PynPrmfVtC7o6tO58Biy8XHhUbwbMOQ=;
 b=NNGJdukMmi7+oS5eGX5WIdPnrjQhxrJuN8cunbWwHS4Ynx1UafV7RbljMnV2mqDDljuK1xjCbOKAaJQYLg9s9sBEhhxs/VaEMce5v3TIhxHZ8X0HO8PlmvCF6zaiblzRRuM9K4M/U/3IjFlE26jYojdq4dlqhH5Mbz98+vnLwUM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <009f9287-d4cf-4008-8b47-59825c6510bf@amd.com>
Date: Fri, 12 Jan 2024 15:31:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
 <ZaFVhaVvpDljEgdM@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZaFVhaVvpDljEgdM@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH0PR12MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffe968b-5b52-47f0-3db1-08dc13ad7d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gz4ynDKEAiw5EMbLdAeIXGUS5rSrZbGJul/rkLM/EldFYiD/GkfgcmGQhfW9fzhMM0xF4gYfA/VTS4+CG0RAGH2m0VGytPbiltdH2nh2QWNDdZQ8NlqBEOPm+eW3JevAN+ZY4jaUIUOgp1ZpVqEmumq9USIqNzBe0rgOtlLRGlIxU69/40NK5oQht801FfzzwE3J8GthmhSXPgvhFv5AlhhawRLBcCJJCbFFNf1FPRXbcyNu4r9D9tM4Ck1TSMmigsUelX/Z+kp3PsT0TP/vEkHLa0Sbc4S6sibXgQd5agSNcEo4FAcUqr5M/lKch0czlb8RY+2FoxYEZkWL1FyUnXT3lsGNKBKO/RV80mD1Y7MdWr023te5xUFuIjyXrU/SpMA+BqOoqCSRZN1fwSwxA0YWUb49nYjJol2s9WQfWN9J1v7v3+nzeWW6f1Gfpb4REGrP3YBAcE3NYs6zJ5uJKjgOwZNPvAvS1M7lEnC6Yu4wHQsRwMGbV/bqHWK7f0NPhN2whDi/Evvv5T2Tq1O32CC0jIY2l5p09tCdB5Jcy9354r+tloUm0mnAd9lXetrGyvOx065mT5ArgwC1SLEHxKhj6gtmKHZVHIbcLHLP/3+vRxBAOL1crN2EC/qsMrW6Kc/a8L/hSa9fq2/hYYrxMogjdYnqzgQrSQiSpziO9rM8UeLldxNZgXFyUo+P/tepEjkv4grqebeOghrNXk4EH3GRHCEDL4vHPhmiBhFfnHXU1yF9EvQDtH6Mhrit+uW/17N7dloo897KM0N+LJzDzXexegdC3GGO6lmiyYn8tGtvkdxvj5j1XVtdPSpv6ILAQd1QNlkYDJmDa+lQ0SGMZUqpfTVxcpJ7bVCXz3Lo/mY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(31686004)(40460700003)(40480700001)(26005)(336012)(426003)(83380400001)(86362001)(31696002)(36756003)(81166007)(356005)(5660300002)(30864003)(16576012)(4326008)(47076005)(36860700001)(44832011)(41300700001)(53546011)(2616005)(82740400003)(8936002)(8676002)(6916009)(54906003)(70586007)(316002)(70206006)(2906002)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 20:31:42.8798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffe968b-5b52-47f0-3db1-08dc13ad7d29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073

On 1/12/24 10:06, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 04:51:24PM -0500, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Take into account guest's BAR view and program its p2m accordingly:
>> gfn is guest's view of the BAR and mfn is the physical BAR value.
>> This way hardware domain sees physical BAR values and guest sees
>> emulated ones.
>>
>> Hardware domain continues getting the BARs identity mapped, while for
>> domUs the BARs are mapped at the requested guest address without
>> modifying the BAR address in the device PCI config space.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Some nits and a request to add an extra assert. If you agree:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks! I agree. I'll reply to this with a v12.1 patch.

> 
>> ---
>> In v12:
>> - Update guest_addr in rom_write()
>> - Use unsigned long for start_mfn and map_mfn to reduce mfn_x() calls
>> - Use existing vmsix_table_*() functions
>> - Change vmsix_table_base() to use .guest_addr
>> In v11:
>> - Add vmsix_guest_table_addr() and vmsix_guest_table_base() functions
>>   to access guest's view of the VMSIx tables.
>> - Use MFN (not GFN) to check access permissions
>> - Move page offset check to this patch
>> - Call rangeset_remove_range() with correct parameters
>> In v10:
>> - Moved GFN variable definition outside the loop in map_range()
>> - Updated printk error message in map_range()
>> - Now BAR address is always stored in bar->guest_addr, even for
>>   HW dom, this removes bunch of ugly is_hwdom() checks in modify_bars()
>> - vmsix_table_base() now uses .guest_addr instead of .addr
>> In v9:
>> - Extended the commit message
>> - Use bar->guest_addr in modify_bars
>> - Extended printk error message in map_range
>> - Moved map_data initialization so .bar can be initialized during declaration
>> Since v5:
>> - remove debug print in map_range callback
>> - remove "identity" from the debug print
>> Since v4:
>> - moved start_{gfn|mfn} calculation into map_range
>> - pass vpci_bar in the map_data instead of start_{gfn|mfn}
>> - s/guest_addr/guest_reg
>> Since v3:
>> - updated comment (Roger)
>> - removed gfn_add(map->start_gfn, rc); which is wrong
>> - use v->domain instead of v->vpci.pdev->domain
>> - removed odd e.g. in comment
>> - s/d%d/%pd in altered code
>> - use gdprintk for map/unmap logs
>> Since v2:
>> - improve readability for data.start_gfn and restructure ?: construct
>> Since v1:
>>  - s/MSI/MSI-X in comments
>> ---
>>  xen/drivers/vpci/header.c | 81 +++++++++++++++++++++++++++++++--------
>>  xen/include/xen/vpci.h    |  3 +-
>>  2 files changed, 66 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index feccd070ddd0..f0b0b64b0929 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -34,6 +34,7 @@
>>  
>>  struct map_data {
>>      struct domain *d;
>> +    const struct vpci_bar *bar;
>>      bool map;
>>  };
>>  
>> @@ -41,13 +42,24 @@ static int cf_check map_range(
>>      unsigned long s, unsigned long e, void *data, unsigned long *c)
>>  {
>>      const struct map_data *map = data;
>> +    /* Start address of the BAR as seen by the guest. */
>> +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
>> +    /* Physical start address of the BAR. */
>> +    unsigned long start_mfn = PFN_DOWN(map->bar->addr);
>>      int rc;
>>  
>>      for ( ; ; )
>>      {
>>          unsigned long size = e - s + 1;
>> +        /*
>> +         * Ranges to be mapped don't always start at the BAR start address, as
>> +         * there can be holes or partially consumed ranges. Account for the
>> +         * offset of the current address from the BAR start.
>> +         */
>> +        unsigned long map_mfn = start_mfn + s - start_gfn;
>> +        unsigned long m_end = map_mfn + size - 1;
>>  
>> -        if ( !iomem_access_permitted(map->d, s, e) )
>> +        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
>>          {
>>              printk(XENLOG_G_WARNING
>>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
>> @@ -55,7 +67,8 @@ static int cf_check map_range(
>>              return -EPERM;
>>          }
>>  
>> -        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
>> +        rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end,
>> +                               map->map);
>>          if ( rc )
>>          {
>>              printk(XENLOG_G_WARNING
>> @@ -73,8 +86,8 @@ static int cf_check map_range(
>>           * - {un}map_mmio_regions doesn't support preemption.
>>           */
>>  
>> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
>> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
>> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
>> +                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
>>          if ( rc == 0 )
>>          {
>>              *c += size;
>> @@ -83,8 +96,9 @@ static int cf_check map_range(
>>          if ( rc < 0 )
>>          {
>>              printk(XENLOG_G_WARNING
>> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
>> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
>> +                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
>> +                   map->map ? "" : "un", s, e, map_mfn,
>> +                   map_mfn + size, map->d, rc);
>>              break;
>>          }
>>          ASSERT(rc < size);
>> @@ -163,10 +177,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>  bool vpci_process_pending(struct vcpu *v)
>>  {
>>      struct pci_dev *pdev = v->vpci.pdev;
>> -    struct map_data data = {
>> -        .d = v->domain,
>> -        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>> -    };
>>      struct vpci_header *header = NULL;
>>      unsigned int i;
>>  
>> @@ -186,6 +196,11 @@ bool vpci_process_pending(struct vcpu *v)
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>> +        struct map_data data = {
>> +            .d = v->domain,
>> +            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>> +            .bar = bar,
>> +        };
>>          int rc;
>>  
>>          if ( rangeset_is_empty(bar->mem) )
>> @@ -236,7 +251,6 @@ bool vpci_process_pending(struct vcpu *v)
>>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>                              uint16_t cmd)
>>  {
>> -    struct map_data data = { .d = d, .map = true };
>>      struct vpci_header *header = &pdev->vpci->header;
>>      int rc = 0;
>>      unsigned int i;
>> @@ -246,6 +260,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>>  
>>          if ( rangeset_is_empty(bar->mem) )
>>              continue;
>> @@ -311,12 +326,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>       * First fill the rangesets with the BAR of this device or with the ROM
>>       * BAR only, depending on whether the guest is toggling the memory decode
>>       * bit of the command register, or the enable bit of the ROM BAR register.
>> +     *
>> +     * For non-hardware domain we use guest physical addresses.
>>       */
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>>          unsigned long start = PFN_DOWN(bar->addr);
>>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>> +        unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>> +        unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>>  
>>          if ( !bar->mem )
>>              continue;
>> @@ -336,11 +355,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>              continue;
>>          }
> 
> Should we assert that the BAR rangeset is empty here? To stay on the
> safe side.

Yes, I'll add an ASSERT.

> 
>>  
>> -        rc = rangeset_add_range(bar->mem, start, end);
>> +        /*
>> +         * Make sure that the guest set address has the same page offset
>> +         * as the physical address on the host or otherwise things won't work as
>> +         * expected.
>> +         */
>> +        if ( PAGE_OFFSET(bar->guest_addr) != PAGE_OFFSET(bar->addr) )
>> +        {
>> +            gprintk(XENLOG_G_WARNING,
>> +                    "%pp: Can't map BAR%d because of page offset mismatch: %lx vs %lx\n",
>                                            ^u
> 
> Also when using the x modifier it's better to also use # to print the
> 0x prefix.  You can also reduce the length of the message using
> s/because of/due to/ IMO:
> 
> %pp: Can't map BAR%u due to offset mismatch: %lx vs %lx

Will do

> 
>> +                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
>> +                    PAGE_OFFSET(bar->addr));
> 
> Maybe worth printing the whole address?

Agreed, will do

> 
>> +            return -EINVAL;
>> +        }
>> +
>> +        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
>>          if ( rc )
>>          {
>>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>> -                   start, end, rc);
>> +                   start_guest, end_guest, rc);
>>              return rc;
>>          }
>>  
>> @@ -352,12 +385,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>              if ( rangeset_is_empty(prev_bar->mem) )
>>                  continue;
>>  
>> -            rc = rangeset_remove_range(prev_bar->mem, start, end);
>> +            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
>>              if ( rc )
>>              {
>>                  gprintk(XENLOG_WARNING,
>>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
>> -                        &pdev->sbdf, start, end, rc);
>> +                        &pdev->sbdf, start_guest, end_guest, rc);
>>                  return rc;
>>              }
>>          }
>> @@ -425,8 +458,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>              for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>>              {
>>                  const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
>> -                unsigned long start = PFN_DOWN(remote_bar->addr);
>> -                unsigned long end = PFN_DOWN(remote_bar->addr +
>> +                unsigned long start = PFN_DOWN(remote_bar->guest_addr);
>> +                unsigned long end = PFN_DOWN(remote_bar->guest_addr +
>>                                               remote_bar->size - 1);
>>  
>>                  if ( !remote_bar->enabled )
>> @@ -513,6 +546,8 @@ static void cf_check bar_write(
>>      struct vpci_bar *bar = data;
>>      bool hi = false;
>>  
>> +    ASSERT(is_hardware_domain(pdev->domain));
>> +
>>      if ( bar->type == VPCI_BAR_MEM64_HI )
>>      {
>>          ASSERT(reg > PCI_BASE_ADDRESS_0);
>> @@ -543,6 +578,10 @@ static void cf_check bar_write(
>>       */
>>      bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
>>      bar->addr |= (uint64_t)val << (hi ? 32 : 0);
>> +    /*
>> +     * Update guest address as well, so hardware domain sees BAR identity mapped
>> +     */
> 
> Can you drop the 'as well' and make this a single line comment?
> 
> Otherwise maybe reword to:
> 
> Update guest address, so hardware domain BAR is identity mapped.
> 
> Sorry, I find it wasteful to have the opening and closing comment
> delimiters in separate lines for single line comments.

Yep, I'll make it single line

