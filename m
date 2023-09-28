Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0EA7B2542
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 20:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610022.949238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvk8-0000Z1-5a; Thu, 28 Sep 2023 18:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610022.949238; Thu, 28 Sep 2023 18:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvk8-0000WQ-2B; Thu, 28 Sep 2023 18:28:08 +0000
Received: by outflank-mailman (input) for mailman id 610022;
 Thu, 28 Sep 2023 18:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i95c=FM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qlvk6-0000WK-9c
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 18:28:06 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c225bc5a-5e2c-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 20:28:03 +0200 (CEST)
Received: from MW4PR03CA0061.namprd03.prod.outlook.com (2603:10b6:303:b6::6)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 18:27:59 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::c1) by MW4PR03CA0061.outlook.office365.com
 (2603:10b6:303:b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Thu, 28 Sep 2023 18:27:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Thu, 28 Sep 2023 18:27:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 13:27:58 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 13:27:58 -0500
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
X-Inumbo-ID: c225bc5a-5e2c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDgwsMqY5K+bAzHnxMvwAOsPj7M5hgQRJsk+wRAt0FgNsg/2zNBpV0sqWRxThI8CAZ5shZiEZYuJFHSRZVmVX6ezqjoWoflTrl4IMtor7Vgy7ZbfAO1EbqLI0KBoWNxQe+tCpZzDZTPE061mUNLtA/6ISmsVmfi7zSkiH3fAQ4Fa/GOntcuWF1jTlvCM+Tx95Tj4a4g40Q3W5TJ/HwCFN5iAg8V/Q1oMI7/Lr46fJjmiu3EUuUA62nPxeMcHH5XP3rgK5x4zWZ5RDiaX9BnA8C3Gp4lduw8f+7B3hPoVT+vQGNpFH+o/J7D+IVTvoKCvw4dyr97ozeYFyaNKYcJXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbgVN9siqoU0orFJZhdhbTsHBoi/nFYOXk23kfEX5EY=;
 b=bd9fUaRASPZ3/zdorGehgS4ooMEzM1g9j+LvNtfGYuvvSv0HgM1VqXf/GeL+btAtMEL9uXhHmiXDFpmxMsRXVlUNs9GMLkZ75bcaHyUHC1iOF5kO57ac1JCpQAPF0/Tbg/7xVROGBzq4lQlNwT+82L/ZFAs3qeN+lrBf2nQPktbJUsRB3S1ks4+BgEUc5DCxtvCXK69Il/Bt6Glp5xO48TmoENQHW9rqGmi2AL7e/c3cAcwp3oF1j2JmYKXjxai+1IAZKvX7xJYC0mdZMePZC8n+zf59saIXRPAl/yXaURt4wVpe9rTH8Gb8nu1Z4DI4IMn1oeR8W5524sVlPO+Z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbgVN9siqoU0orFJZhdhbTsHBoi/nFYOXk23kfEX5EY=;
 b=dm02h27Eu+jnONu9VsOKu/dBItR2izTtw69fC+0W7V4nVdi0N93GBySOm5VeGy5pDAT7reDYdkOYakIPwQjACvtklybwEgyNgG4kq/PmRun3Wk1JqNAqmSKJhEkdM1pI+xHkQf3Yr7scTa07gkOa43oCKN91uf6Pxa/icT0Te0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <168709e2-0a1d-a474-a9a4-c3c086b7f134@amd.com>
Date: Thu, 28 Sep 2023 14:28:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
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
 <0d4b7115-8cc6-3b11-9a46-0f222bcb864a@amd.com>
 <ZRU5G4Ae8B-A2iWd@MacBookPdeRoger>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZRU5G4Ae8B-A2iWd@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: adc3d894-5de3-4be2-8d8c-08dbc050a4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/teq6XZ/rLFDz1vOe21tApt3H0S1znRlfUYNm5vMKNYTrp5RBXPUPE7vERspbWdAL3ZpiNhyFyxVJDC8f/CRMmVPuVRQl3tpPqhydr97wUxXLuHtzNR4zlsadKcE7P4pbtUbycL3IqJ7eRjTku4Q6dnyyg1Y11BIYlhT9jEuZNlv0S+FKLiXgXfIUXOUFq/5qZvLVaQyBohdCx1i5zCoRH3/fhndmPQYF/ObP5+ncgRyQg7bkeBRNOGkHmbR4URKuGKwCatPsZGX4JRFl3XtigJa50tpk7LkzMTR56/v48LUo5DmYLPKgsEDmtsipJFEu3K/wMB95FduRWDUqpcdZw7gXg4EyWy1sTtOELXV4qLaZDHTEgH0pOwe7NanODX6F6fOGNJRc8kH8cyvFUKF57Aj8MtMus3nFdKSjSH6JFdlLpISvuXmz7yK9kj6yb9esKVRtsvcWS9xKN66TxCZWMfMq8DWolzZ6KEHNlnCwEMDSjTshYppzVe2HsjasbyqS5P2u7y5r9W3qRLX5KvOzikXZr9x+T/EssW6+8YDvHL/89Qr2mefK7C5+E544+h7tkecoCQzTKFz0LCyVBEjxoD66BGviEEwP8hhbn3X6B4BzbevXD7N8MlVNYRHTyaDsasg+jnkvtlR8Vc5MNUSCm9qRShApAfDBREObzVP44g47R0+mCI5h6V2AOEhPkern/Y47n0TDiDK2rmJHpXyMDAnodKGQYc7DrkCJW4lHrbrxxwsE4bRcOkMmHxer2Br/R42BkfI8EqKYHsTtOLphg4SgHsfo2U5A9rL5dxFvs/2yj7sfVPHE8hVDH2fah7V
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(478600001)(2616005)(53546011)(26005)(426003)(336012)(16576012)(47076005)(5660300002)(83380400001)(2906002)(6666004)(70206006)(4326008)(8676002)(70586007)(54906003)(44832011)(316002)(6916009)(41300700001)(8936002)(36756003)(40460700003)(36860700001)(356005)(86362001)(31696002)(81166007)(31686004)(40480700001)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 18:27:59.7303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc3d894-5de3-4be2-8d8c-08dbc050a4de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751



On 9/28/23 04:28, Roger Pau Monné wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, Sep 27, 2023 at 02:03:30PM -0400, Stewart Hildebrand wrote:
>> On 9/26/23 11:48, Roger Pau Monné wrote:
>>> On Tue, Sep 26, 2023 at 11:27:48AM -0400, Stewart Hildebrand wrote:
>>>> On 9/26/23 04:07, Roger Pau Monné wrote:
>>>>> On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
>>>>>> On 9/22/23 04:44, Roger Pau Monné wrote:
>>>>>>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
>>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>>>
>>>>>>>> Skip mapping the BAR if it is not in a valid range.
>>>>>>>>
>>>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>>> ---
>>>>>>>>  xen/drivers/vpci/header.c | 9 +++++++++
>>>>>>>>  1 file changed, 9 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>>>>>> index 1d243eeaf9..dbabdcbed2 100644
>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>>>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>>>>>>>>              continue;
>>>>>>>>
>>>>>>>> +#ifdef CONFIG_ARM
>>>>>>>> +        if ( !is_hardware_domain(pdev->domain) )
>>>>>>>> +        {
>>>>>>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
>>>>>>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
>>>>>>>> +                continue;
>>>>>>>> +        }
>>>>>>>> +#endif
>>>>>>>
>>>>>>> Hm, I think this should be in a hook similar to pci_check_bar() that
>>>>>>> can be implemented per-arch.
>>>>>>>
>>>>>>> IIRC at least on x86 we allow the guest to place the BARs whenever it
>>>>>>> wants, would such placement cause issues to the hypervisor on Arm?
>>>>>>
>>>>>> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
>>>>>>
>>>>>> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
>>>>>>
>>>>>> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
>>>>>
>>>>> It does seem to me we are missing a proper cleanup of the rangeset
>>>>> contents in some paths then.  In the above paragraph you mention "the
>>>>> old invalid address remains in the rangeset to be mapped", how does it
>>>>> get in there in the first place, and why is the rangeset not emptied
>>>>> if the mapping failed?
>>>>
>>>> Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.
>>>>
>>>> +    if ( v->domain != pdev->domain )
>>>> +    {
>>>> +        read_unlock(&v->domain->pci_lock);
>>>> +        return false;
>>>> +    }
>>>>
>>>> I have also reverted this patch ("xen/arm: vpci: check guest range").
>>>>
>>>> The sequence of events leading to the old value remaining in the rangeset are:
>>>>
>>>> # xl pci-assignable-add 01:00.0
>>>> drivers/vpci/vpci.c:vpci_deassign_device()
>>>>     deassign 0000:01:00.0 from d0
>>>> # grep pci domu.cfg
>>>> pci = [ "01:00.0" ]
>>>> # xl create domu.cfg
>>>> drivers/vpci/vpci.c:vpci_deassign_device()
>>>>     deassign 0000:01:00.0 from d[IO]
>>>> drivers/vpci/vpci.c:vpci_assign_device()
>>>>     assign 0000:01:00.0 to d1
>>>>     bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
>>>> drivers/vpci/header.c:init_bars()
>>>> drivers/vpci/header.c:modify_bars()
>>>
>>> I think I've commented this on another patch, but why is the device
>>> added with memory decoding enabled?  I would expect the FLR performed
>>> before assigning would leave the device with memory decoding disabled?
>>
>> It seems the device is indeed being assigned to the domU with memory decoding enabled, but I'm not entirely sure why. The device I'm testing with doesn't support FLR, but it does support pm bus reset:
>> # cat /sys/bus/pci/devices/0000\:01\:00.0/reset_method
>> pm bus
>>
>> As I understand it, libxl__device_pci_reset() should still be able to issue a reset in this case.
> 
> Maybe pciback is somehow restoring part of the previous state?  I
> have no insight in what state we expect the device to be handled by
> pciback, but this needs investigation in order to know what to expect.

Yep, during "xl pci-assignable-add ..." pciback resets the device and restores the state, including whether memory decoding is enabled.

drivers/xen/xen-pciback/pci_stub.c:pcistub_init_device():

	/* We need the device active to save the state. */
	dev_dbg(&dev->dev, "save state of device\n");
	pci_save_state(dev);
	dev_data->pci_saved_state = pci_store_saved_state(dev);
	if (!dev_data->pci_saved_state)
		dev_err(&dev->dev, "Could not store PCI conf saved state!\n");
	else {
		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
		__pci_reset_function_locked(dev);
		pci_restore_state(dev);
	}
	/* Now disable the device (this also ensures some private device
	 * data is setup before we export)
	 */
	dev_dbg(&dev->dev, "reset device\n");
	xen_pcibk_reset_device(dev);

That last function, xen_pcibk_reset_device(), clears the bus master enable bit in the command register for devices with PCI_HEADER_TYPE_NORMAL (not a reset contrary to the function name).

xl create should reset the device again, but, similarly, this also seems to restore the state.

> Can you paste the full contents of the command register for this
> device?
Start of day (PCIe controller and bridge initialized, no device BARs or anything have been programmed yet): 0x0000
After dom0 boot, device is in use: 0x0006
After pci-assignable-add: 0x0002
After echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/reset: 0x0002
After xl create, domU booted: 0x0006

Should mapping bars should be conditional on PCI_COMMAND_MASTER, not PCI_COMMAND_MEMORY? E.g.:

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9cf701b3c464..9ce1793d64b8 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -1162,7 +1162,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
             goto fail;
     }

-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MASTER) ? modify_bars(pdev, cmd, false) : 0;

  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);

