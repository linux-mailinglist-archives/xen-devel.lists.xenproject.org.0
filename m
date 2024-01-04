Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A455F8246C2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 17:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661860.1031595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLR0Q-00011c-8d; Thu, 04 Jan 2024 16:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661860.1031595; Thu, 04 Jan 2024 16:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLR0Q-0000zD-5m; Thu, 04 Jan 2024 16:55:42 +0000
Received: by outflank-mailman (input) for mailman id 661860;
 Thu, 04 Jan 2024 16:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QvE=IO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rLR0O-0000z7-U5
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 16:55:41 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 141cf65a-ab22-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 17:55:36 +0100 (CET)
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 16:55:32 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::c1) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Thu, 4 Jan 2024 16:55:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 16:55:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 10:55:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 10:55:30 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 4 Jan 2024 10:55:29 -0600
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
X-Inumbo-ID: 141cf65a-ab22-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxM4hv3pqV34ZwYFoh/ZArWw61mKeDxaQLAxSI1qz45vWqg+KEf71OlE20NvfhXYHFXM7rc9O//TZoV27VoADSP9nAwE6fpqrHPRha0GzzGdJB0JeBou7xOMKmKr0qwI/+04rmhHnOsjvjGqNqszCNSQj70T/uoFarRrE3IGi3Trj0xB0Vp68hTc+nD5r74jnodrwFMqsy2whf3pShObIcyIZudyZYuJrBC7X8re2jjcoGMWRQedzgChS5PaB2rM83s6yrrGo+030tzpfff5j/LdpywVFdaY4A2P9RKz10qlXkCK5xuA55Y5BajoKGFGatueBahscE9NWr6KAxfxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phW/kb0bfYa3IB96crxmzLVjxMnbOCt1HAlhULMmXU8=;
 b=KU6XTGhFjD24/x2q/vddBqmAoeicd6v2KpsSnUywxs7ZsFWWHjmM8eeA9eSUDI4kdFyNPif1+LENPIQ78rur1/pHN8HjAqj2dPAmPjPL20Rh1l+30yH+b8vD0y1+ZLLuJSGRz1Ah3Iz1QvDYL6iTbtJ4hgsaU26mgI0Q6FCQNtM2CzW4+bD47qIiEEdb4hXZ4Muz/rSqLyfIgUyzDs6tPYMG240o2gAF2GD+7mIXw5ify1DMD6xagma0hOQQPIapbVppniIZMKBedCrPvFKPXIn9+H70/ojIaSfmxjaAcR8pqZnhGqcnyQMLxNyHcMyrJJlHqjK2I+VOYYdgqM4zDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phW/kb0bfYa3IB96crxmzLVjxMnbOCt1HAlhULMmXU8=;
 b=Hq7w9fOX7fq3vpdIyO5PG7F728rkjDAqRJNUDONExvtSEJpCZd7SRP6Sj9atJMU4OjyG51JzUTqCaJxudUQqQiXDnyALo7HauHV9WaolvCSP75RtyEPnv4H8AQRhn+AGVRYVC+w0w81UP9Hr5zJE4htV+q4YxoiY/USeJpTMm3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bd2bcb2e-fe8a-4b4e-a681-8edca4285821@amd.com>
Date: Thu, 4 Jan 2024 11:55:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/17] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-12-volodymyr_babchuk@epam.com>
 <ZYRg75b6mUWvQyr7@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZYRg75b6mUWvQyr7@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b8e577-5f25-4ea8-51d6-08dc0d45f655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tyIHbxX3JfoNkPNdoA8jIgnMtBE8cRwnJH6w6B+Wm/EZGldi4PTCgVin/H+b2WSGVVD/nQZKORobrngeivfIA/uidciGnxSK4a2/WeNCts4MikM5dJ2a3wNc0KhIVqo4m/QMQkD4tY8uF4V9R5Pp9ziyA83necBGW1RhQdfa06B6Zx3N4BUeK4a2IDmiby15Wagyc0LSlOePXDYfjKFlXHkcVyAv+7z1dnHt/2XGKI8P/EW+mbFrkWYGc2lsUb6jzox8QjUUmTMyBFBgEpAPmxqIwmIxbitrk0729G/G1DGhtEG64ZLqOvfPVFXIESNW32K/X+IDpBwAW3SQ9aBGFShV7uovRrlKLJN/v+aumx7MJUFNXGbP8dVyH6CkZxvbsRTblZCsNHsvAuSaDqPLoCI8r4HJQqQkZ9DqOZzo8fe5TBICdwgUyGoiAL3r4yxRgeWNlDTGaZmiAMlAq7jr1QouDsDybkECJ3YXkbbm8P0xINq6TrPBL9F9geJI0D8cpCVyZqluw+tcNxNRLyYzzxw5tsEWxPRlrVtcc79GgO14GXjEy7XsOWLyiH1v3u8A/LIz0+3uLuFDrKFFa17sd/QfuKdX6Q2IjByu8VGI94JWxZ3ObuCVpwtdQKEdY8oEV+Dje6udKFRBBn7X08+mL1Bjr6s7ijtY9YjeCD8gBWAhCvMmc6mMGWflDk3ZUbWLQjOl4EvxKXqKAD9zwAarUwwwO32dVQryMhpzN5Mpxx/bn28VT7b6utNJutGEykL0Pcbify+YXLbg4bzA0N1688h0Ogl7AGncXpSumkjArDTrI0Idgu72kUh8R3GwWhPcP19zon/nktZmsGnm20PlFv/Q1aHpTYhggIjz7KVG3iw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(426003)(356005)(26005)(2616005)(336012)(36860700001)(83380400001)(81166007)(82740400003)(47076005)(70586007)(70206006)(110136005)(36756003)(54906003)(16576012)(478600001)(31696002)(86362001)(316002)(5660300002)(2906002)(30864003)(31686004)(44832011)(4326008)(8676002)(8936002)(40480700001)(41300700001)(40460700003)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:55:31.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b8e577-5f25-4ea8-51d6-08dc0d45f655
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447

On 12/21/23 10:59, Roger Pau Monné wrote:
> On Sat, Dec 02, 2023 at 01:27:05AM +0000, Volodymyr Babchuk wrote:
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
>> ---
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
>>  xen/drivers/vpci/header.c | 79 +++++++++++++++++++++++++++++----------
>>  xen/include/xen/vpci.h    | 13 +++++++
>>  2 files changed, 73 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 7c84cee5d1..21b3fb5579 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -33,6 +33,7 @@
>>  
>>  struct map_data {
>>      struct domain *d;
>> +    const struct vpci_bar *bar;
>>      bool map;
>>  };
>>  
>> @@ -40,13 +41,24 @@ static int cf_check map_range(
>>      unsigned long s, unsigned long e, void *data, unsigned long *c)
>>  {
>>      const struct map_data *map = data;
>> +    /* Start address of the BAR as seen by the guest. */
>> +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
>> +    /* Physical start address of the BAR. */
>> +    mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
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
>> +        mfn_t map_mfn = mfn_add(start_mfn, s - start_gfn);
>> +        unsigned long m_end = mfn_x(map_mfn) + size - 1;
>>  
>> -        if ( !iomem_access_permitted(map->d, s, e) )
>> +        if ( !iomem_access_permitted(map->d, mfn_x(map_mfn), m_end) )
>>          {
>>              printk(XENLOG_G_WARNING
>>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
>> @@ -54,7 +66,8 @@ static int cf_check map_range(
>>              return -EPERM;
>>          }
>>  
>> -        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
>> +        rc = xsm_iomem_mapping(XSM_HOOK, map->d, mfn_x(map_mfn), m_end,
>> +                               map->map);
>>          if ( rc )
>>          {
>>              printk(XENLOG_G_WARNING
>> @@ -72,8 +85,8 @@ static int cf_check map_range(
>>           * - {un}map_mmio_regions doesn't support preemption.
>>           */
>>  
>> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
>> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
>> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, map_mfn)
>> +                      : unmap_mmio_regions(map->d, _gfn(s), size, map_mfn);
>>          if ( rc == 0 )
>>          {
>>              *c += size;
>> @@ -82,8 +95,9 @@ static int cf_check map_range(
>>          if ( rc < 0 )
>>          {
>>              printk(XENLOG_G_WARNING
>> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
>> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
>> +                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
>> +                   map->map ? "" : "un", s, e, mfn_x(map_mfn),
>> +                   mfn_x(map_mfn) + size, map->d, rc);
> 
> Seeing the amount of mfn_x calls, it might be better to do the
> calculations as unsigned long, and use _mfn() in the
> {,un}map_mmio_regions() calls.

Agreed, I'll change to unsigned long.

> 
>>              break;
>>          }
>>          ASSERT(rc < size);
>> @@ -162,10 +176,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
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
>> @@ -185,6 +195,11 @@ bool vpci_process_pending(struct vcpu *v)
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
>> @@ -235,7 +250,6 @@ bool vpci_process_pending(struct vcpu *v)
>>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>                              uint16_t cmd)
>>  {
>> -    struct map_data data = { .d = d, .map = true };
>>      struct vpci_header *header = &pdev->vpci->header;
>>      int rc = 0;
>>      unsigned int i;
>> @@ -245,6 +259,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>>  
>>          if ( rangeset_is_empty(bar->mem) )
>>              continue;
>> @@ -310,12 +325,16 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
>> @@ -335,11 +354,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>              continue;
>>          }
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
>> +                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
>> +                    PAGE_OFFSET(bar->addr));
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
>> @@ -351,12 +384,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
>> @@ -365,8 +398,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>      /* Remove any MSIX regions if present. */
>>      for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
>>      {
>> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
>> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>> +        unsigned long start = PFN_DOWN(vmsix_guest_table_addr(pdev->vpci, i));
>> +        unsigned long end = PFN_DOWN(vmsix_guest_table_addr(pdev->vpci, i) +
>>                                       vmsix_table_size(pdev->vpci, i) - 1);
>>  
>>          for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>> @@ -424,8 +457,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
>> @@ -512,6 +545,8 @@ static void cf_check bar_write(
>>      struct vpci_bar *bar = data;
>>      bool hi = false;
>>  
>> +    ASSERT(is_hardware_domain(pdev->domain));
>> +
>>      if ( bar->type == VPCI_BAR_MEM64_HI )
>>      {
>>          ASSERT(reg > PCI_BASE_ADDRESS_0);
>> @@ -542,6 +577,10 @@ static void cf_check bar_write(
>>       */
>>      bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
>>      bar->addr |= (uint64_t)val << (hi ? 32 : 0);
>> +    /*
>> +     * Update guest address as well, so hardware domain sees BAR identity mapped
>> +     */
>> +    bar->guest_addr = bar->addr;
>>  
>>      /* Make sure Xen writes back the same value for the BAR RO bits. */
>>      if ( !hi )
>> @@ -793,6 +832,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>          }
>>  
>>          bars[i].addr = addr;
>> +        bars[i].guest_addr = addr;
>>          bars[i].size = size;
>>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>>  
>> @@ -814,6 +854,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>              rom->type = VPCI_BAR_ROM;
>>              rom->size = size;
>>              rom->addr = addr;
>> +            rom->guest_addr = addr;
> 
> I think you are missing updating guest_addr also in rom_write()?

Yep, I'll fix

> 
>>              header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
>>                                    PCI_ROM_ADDRESS_ENABLE;
>>  
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index 18a0eca3da..c39fab4832 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -205,6 +205,19 @@ static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
>>             (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
>>  }
>>  
>> +static inline paddr_t vmsix_guest_table_base(const struct vpci *vpci,
>> +                                             unsigned int nr)
>> +{
>> +    return (vpci->header.bars[vpci->msix->tables[nr] &
>> +           PCI_MSIX_BIRMASK].guest_addr & PCI_BASE_ADDRESS_MEM_MASK);
>> +}
>> +
>> +static inline paddr_t vmsix_guest_table_addr(const struct vpci *vpci,
>> +                                             unsigned int nr)
>> +{
>> +    return vmsix_guest_table_base(vpci, nr) +
>> +           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
>> +}
> 
> Do we really need guest versions of this?  I was expecting that for
> guests those functions should always returns the guest addresses of
> the MSI-X structures, which in the dom0 case matches the host address.
> 
> If we really need guest specific versions, it's worth mentioning in
> the commit message explicitly why.

I don't have any good rationale, no. I'll change vmsix_table_base() to use .guest_addr instead of plain .addr.

> 
> Thanks, Roger.

