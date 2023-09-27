Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79817B0B97
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 20:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609149.948050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlYso-00071X-V9; Wed, 27 Sep 2023 18:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609149.948050; Wed, 27 Sep 2023 18:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlYso-0006yv-S6; Wed, 27 Sep 2023 18:03:34 +0000
Received: by outflank-mailman (input) for mailman id 609149;
 Wed, 27 Sep 2023 18:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTSH=FL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qlYsn-0006yp-K5
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 18:03:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e89::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2998c0f7-5d60-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 20:03:30 +0200 (CEST)
Received: from MW4PR04CA0089.namprd04.prod.outlook.com (2603:10b6:303:6b::34)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 18:03:21 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::a8) by MW4PR04CA0089.outlook.office365.com
 (2603:10b6:303:6b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 18:03:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 18:03:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 13:03:20 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 27 Sep 2023 13:03:19 -0500
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
X-Inumbo-ID: 2998c0f7-5d60-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHMaiMxAcYTTpZTYWf2xF8qNPCyZmQYb0JN8iMBX/O5Na767FQbo7ixWIwQfjuIynFNcwnViDxe/f6PNacqFz06wH8guOrIEIomuRwXy17qy5z07DwskdDHDlTSJhvVt35lCx4e+eMpssqf7AepzAzby3yAlY3cWIJPwXBKtAc+HIx3EQglfOGvDouV/ysCUbrEomZ+A17ehcbbrgaHsK4ahZB0DeGlLfsqTvygv1nqqlkqKCHO+Ogh3ArTBzWvKysMYZNnLdfebZT1J932+y09NlYK1Z+lFCXAii40Oo1LxZNrFL/rygweOkiF8iRmQXID5Nnpwv5IhONP4YxSFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3KLmic/LTfcaPVTS/B6T8X2vutBB0Fb2n422DwHmqg=;
 b=cZ8NxLZ96Cu+3Z/waeOMUYMh6CDrPJhY3K3sU4Nk+Y9uRcsrxMdh+1eeefxrlphNs4XVc6Z2cPGY6EPBN26mBRfcWGIs1aC73EO1U3sTifNeBWOyWTWjM340kpwn+xzzWI3sjOnZof3vlnFo8eE1rNWMLz2M7iLEs9/BTH1fMu2NOl7a20XTKH5Wj0ABn340EkUfvBVHOYBJHWnbw52kkaN+QY4Cyiu4qHtgVazfnFHbqZNs03xCnF5d/SZGpkmJv/1ZRGL2g/deIMquPmbLzyVguHC56Ep/IHmVid0v9cgohWLSEKjM1tZGqIIz4xZqVlVDxDWfA9C5OpwnpAGWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3KLmic/LTfcaPVTS/B6T8X2vutBB0Fb2n422DwHmqg=;
 b=nw1i7xNLwXfWTr5SV6Qpk1IddbPzV9T77V6lyhBvkAZbAl/kTXQ8sQkaXUpMJSsMQM839WVO1vlU778so8DlRSySN7bVB2TIV6TQdTNohN63uMuFo9tR2V1H2Kl6bkshO4xmG4rg36e/BUajOXbw3KPDyArdCvsaIoYUt4x8XXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0d4b7115-8cc6-3b11-9a46-0f222bcb864a@amd.com>
Date: Wed, 27 Sep 2023 14:03:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
 <ZRKRNcypuvP26luu@MacBookPdeRoger>
 <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
 <ZRL9QalvI4VrDQhF@MacBookPdeRoger>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZRL9QalvI4VrDQhF@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SA1PR12MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 840a8a60-a833-4ce6-4b78-08dbbf840925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ItaETbvOzoKVm2jbwbNoCZmc5eFVDORy3+lwh05yNhyrmW+CvpkC1hHMfS+WmWu8OcNdnJ9ngypq2oY05uwW9S6k35u7+GK8mKIm1jVylv/ATaDCsIkbbc4w2zQamGQ8gBEHn3nsy6YaDhnyjxOqRD+cBt2pcPFWbbGfaIIIXYKfSNk6bB/LSNKHxYQSqiS0QWWnscU64vBTGTbrHTlbFn8Omqx47JetXbocfpHwDgNDrtVTkQlHbyMMXwA7cfeuP9L+wnTbrEz1YgZZZ4cQ+GEMBwU6drHnmjh+xXM4Lys7kEZPPSu18+sl1ifMcZs/E40Yi6jZ3LGOYIiojqJaakVHKrJ9lTeEqVUeIl5Nx46qaehC3PWqII+DxD14p1pK2EbFaHuLBjRIYCIWSdXATBtEfGYkSv8GaMzZVcO/zyDZAHMbGnMJrNf9VongFF2AgKbqlIQ2vEwUdO0ZMfRV5z0WNACFmnS8JNx1outHnht7H8pT++cU6oBGFylciw721FSiUOyFjXSql20D6Ej+wCYpZpi1Akn20SW78kxGMPbHkI0Rin2yZcmZTa4lQni3bf6nbl6rfGuo0wVySE+Z7/62yKyQloVDfp9NLEHpFJ26PK69Yzz2kjGzCVQAijcZCH4CZjRmXxV5DIfsXYx6vyocDTFFWFXnO8kWtHx7+7wR4vTTk7rIkyWSuHVc4B8Gp1SITvika7hDend8pFwYjtrWHgCinnyNlsoLKmlf6dkuA06jl4QbFa3wskC2LLO9JYj341Rgx2oZiPM3ZiHRM+aWCKMZyk31yXGE5/OjjN1gCzspbGw2Z7mkPECOjBbb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(31686004)(44832011)(6666004)(2906002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(47076005)(316002)(70206006)(70586007)(6916009)(16576012)(478600001)(54906003)(53546011)(2616005)(336012)(426003)(26005)(40460700003)(83380400001)(36860700001)(81166007)(31696002)(86362001)(40480700001)(36756003)(82740400003)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:03:21.1678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840a8a60-a833-4ce6-4b78-08dbbf840925
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970

On 9/26/23 11:48, Roger Pau Monné wrote:
> On Tue, Sep 26, 2023 at 11:27:48AM -0400, Stewart Hildebrand wrote:
>> On 9/26/23 04:07, Roger Pau Monné wrote:
>>> On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
>>>> On 9/22/23 04:44, Roger Pau Monné wrote:
>>>>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>
>>>>>> Skip mapping the BAR if it is not in a valid range.
>>>>>>
>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>> ---
>>>>>>  xen/drivers/vpci/header.c | 9 +++++++++
>>>>>>  1 file changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>>>> index 1d243eeaf9..dbabdcbed2 100644
>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>>>>>>              continue;
>>>>>>
>>>>>> +#ifdef CONFIG_ARM
>>>>>> +        if ( !is_hardware_domain(pdev->domain) )
>>>>>> +        {
>>>>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
>>>>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
>>>>>> +                continue;
>>>>>> +        }
>>>>>> +#endif
>>>>>
>>>>> Hm, I think this should be in a hook similar to pci_check_bar() that
>>>>> can be implemented per-arch.
>>>>>
>>>>> IIRC at least on x86 we allow the guest to place the BARs whenever it
>>>>> wants, would such placement cause issues to the hypervisor on Arm?
>>>>
>>>> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
>>>>
>>>> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
>>>>
>>>> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
>>>
>>> It does seem to me we are missing a proper cleanup of the rangeset
>>> contents in some paths then.  In the above paragraph you mention "the
>>> old invalid address remains in the rangeset to be mapped", how does it
>>> get in there in the first place, and why is the rangeset not emptied
>>> if the mapping failed?
>>
>> Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.
>>
>> +    if ( v->domain != pdev->domain )
>> +    {
>> +        read_unlock(&v->domain->pci_lock);
>> +        return false;
>> +    }
>>
>> I have also reverted this patch ("xen/arm: vpci: check guest range").
>>
>> The sequence of events leading to the old value remaining in the rangeset are:
>>
>> # xl pci-assignable-add 01:00.0
>> drivers/vpci/vpci.c:vpci_deassign_device()
>>     deassign 0000:01:00.0 from d0
>> # grep pci domu.cfg
>> pci = [ "01:00.0" ]
>> # xl create domu.cfg
>> drivers/vpci/vpci.c:vpci_deassign_device()
>>     deassign 0000:01:00.0 from d[IO]
>> drivers/vpci/vpci.c:vpci_assign_device()
>>     assign 0000:01:00.0 to d1
>>     bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
>> drivers/vpci/header.c:init_bars()
>> drivers/vpci/header.c:modify_bars()
> 
> I think I've commented this on another patch, but why is the device
> added with memory decoding enabled?  I would expect the FLR performed
> before assigning would leave the device with memory decoding disabled?

It seems the device is indeed being assigned to the domU with memory decoding enabled, but I'm not entirely sure why. The device I'm testing with doesn't support FLR, but it does support pm bus reset:
# cat /sys/bus/pci/devices/0000\:01\:00.0/reset_method
pm bus

As I understand it, libxl__device_pci_reset() should still be able to issue a reset in this case.

> Otherwise we might have to force init_bars() to assume memory decoding
> to be disabled, IOW: memory decoding would be set as disabled in the
> guest cmd view, and leave the physical device cmd as-is.  We might
> also consider switching memory decoding off unconditionally for domUs
> on the physical device.

I did a quick test and it works as expected with my apparently quirky test case:

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index de29e5322d34..0ad0ad947759 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -790,7 +790,12 @@ static int cf_check init_bars(struct pci_dev *pdev)

     /* Disable memory decoding before sizing. */
     if ( cmd & PCI_COMMAND_MEMORY )
+    {
+        if ( !is_hwdom )
+            cmd &= ~PCI_COMMAND_MEMORY;
+
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
+    }

     header->guest_cmd = cmd & ~PCI_COMMAND_MEMORY;

> 
>>     BAR0: start 0xe0000, end 0xe000f, start_guest 0x0, end_guest 0xf
>>     The range { 0-f } is added to the BAR0 rangeset for d1
>> drivers/vpci/header.c:defer_map()
>>     raise_softirq(SCHEDULE_SOFTIRQ);
>> drivers/vpci/header.c:vpci_process_pending()
>>     vpci_process_pending() returns because v->domain != pdev->domain (i.e. d0 != d1)
> 
> I don't think we can easily handle BAR mappings during device
> assignment with vPCI, because that would require adding some kind of
> continuation support which we don't have ATM.  Might be better to just
> switch memory decoding unconditionally off at init_bars() for domUs as
> that's the easier solution right now that would allow us to move
> forward.

+1

