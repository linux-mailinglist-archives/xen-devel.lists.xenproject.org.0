Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E581C144
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 23:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659173.1028659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGS0R-0002ie-IW; Thu, 21 Dec 2023 22:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659173.1028659; Thu, 21 Dec 2023 22:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGS0R-0002gA-FP; Thu, 21 Dec 2023 22:59:07 +0000
Received: by outflank-mailman (input) for mailman id 659173;
 Thu, 21 Dec 2023 22:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbL5=IA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rGS0Q-0002g4-Bc
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 22:59:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 880efef6-a054-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 23:59:02 +0100 (CET)
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.21; Thu, 21 Dec 2023 22:58:58 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:80:cafe::85) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Thu, 21 Dec 2023 22:58:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 22:58:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 16:58:57 -0600
Received: from [192.168.153.23] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 21 Dec 2023 16:58:57 -0600
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
X-Inumbo-ID: 880efef6-a054-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiY9ToQvV9pUz16F8SmbqfsCKpR+ZOHa5YvkLVn5vDUq8G3e080YQ33y3xA9kCEgyd07ybHXhe+5L0jzrOmH/TNpRXiYBZGNR/I/2Z3gehI/BNj1wbiEEHmjkc+4pVUKQPjY6JefbX4W8ixH3NPiS9bHu+1vhtsD1+NDKjUv1KKuuNf6AehPj+KNEksUSxV3bisvdEMJrFhvNNXt6iu99VjaTEEMSVU+f5Pbt3BrCFMuN3Q+Uj/zuqbREDZY7Gfa0LLetzTKhc60vZBgZw9fTZ/WYwFeM0KnNPlfWa0D6Nq/OcX3TMuKaIQKz/goXVTGScgf9pzyuRTwPDXmAq/sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa4XLFKrR7Aeo/xT9cHfAQPbhTzzYndXoTwui3OKAy0=;
 b=YB6ikMOLTc/iGHz+gliL1LA5QabXSepynBeWKmslySfxqUlREI+CBM6k5vCnfEMtB+2kgkiFsdPhGb0TXz0DiwAO5OXaANT7YHGspSSbKNR3VLu/3CNvasJTzoNNKu1qIO37PYUa7aZC7GAqXtdYXWWqns2IFLGvGl1FgF/6IOFfZMG6pmoW29zHyta+hjPLoDu2L78c6ulqcbLz1CgwFsQNaNxD38bB12ABuIoKCEY8SDwr3N5wh4eiZFeXEYzkDqoPwYOIn0jGpy0zGIjdFS+bPzXBn9IbfDtDGnggWqLAzzU3qg/jowQBMBYQT4aeoxSsdRUUTaM5lCzRWuPDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa4XLFKrR7Aeo/xT9cHfAQPbhTzzYndXoTwui3OKAy0=;
 b=sP4M6mPhQr7iST9+KTNbMRZ5oIbj3vxNg4XUR9EAx3D+HiHtbBTHfKMgu0iaRlJC3sbMFLftpJtx0f/WdqeazkrZljPMorAQ7H87i+fOtYbV98rndb00AIDfyK5Sds0p9s7ez/WPlmf6d0cptHAEIyb/Iy+C9J1V1+dgEgSAt4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1c8de4d7-bce7-4735-baab-e4a1fef3f880@amd.com>
Date: Thu, 21 Dec 2023 17:58:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
 <ZVy73iJ3E8nJHvgf@macbook.local>
Content-Language: en-US
In-Reply-To: <ZVy73iJ3E8nJHvgf@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c82918-2970-4362-f33c-08dc02786a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fooy8ijDAFVBcByWk+cyRzC9ZH8hbWwvIlYqK7+podKFDovi67ewe/sNAWUejcyp9zAbGTfTNlT93cnEPqY3MKUh5mT7hApSvA/7Lrs7L8QCpxtXttES4Lfc5khZEGZWDOttzUQV21oZ7m/+FTT56vDlaIETGtGaepo4/bBttBfFQaFj20pongiBdt0Nxdtu6aeJqMIT/EkIq9p72ZvqbbTr2Hi1ImgcZCK9E+D+G2Ukak1EM39qaRkkUbA6rcrP8Wybq9D0UoX1wX4C9BxKkBA8uDqYMy4c64NRJ3PRfT5NHkgurluN8xTxXPLcZs4wn6NxgNOHkuA1VMnJzLRIxo6djYWmQITymaURTSc50oHCM8ENy/G/ROWeRa0vMIAGIPFMZN5+vOi+ByuW5AYwqzIr1kMKdNVCrF5Zk+JtDyHUfb79vdZTOpYbv0cUc4KTqWKWcEDHoLXOxqGdRHtKOI8f1CJKBlK/FfwZqPwjrlAKoUw9TuRZxKKVF449D8/sgnEzrmuxk1OYkJVQ6vVJbnp4cIS6LKfNlHBDLENDQSQ6PO2T/OjZ2uvr70SgyIhuTvvcCcgkZnPnPZM4hZ8q4aqifrYUs7EgWQxHQ1HS/Q9Jky86pzvVOWJb/mrq8q4jUhyYFu3ZduzLMP9NIJoSe245M1py1ZWkxcUyHf+9eRXxFgm2/s0OrPv0mWCUWQXG7ZHtOi6EgTFlOnyXIeJR+SEdP0qraB3FlsV6yLsAJ0+rQexsn5CJoqXaYEFvYbnoGLKf1RCo+dF3jqyQ8D3H/pUYQxzN2xPQRnBp87H/yEvVLdFG7NkPnM4/sYvbQI30l4tI4zS2AV/Q1r1ZtbPqsy/VGaOIQBR5788OmURzHpY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(336012)(31686004)(426003)(26005)(40460700003)(40480700001)(53546011)(478600001)(2616005)(47076005)(5660300002)(8676002)(4326008)(36860700001)(44832011)(83380400001)(110136005)(8936002)(81166007)(356005)(82740400003)(2906002)(30864003)(16576012)(316002)(54906003)(70206006)(70586007)(86362001)(31696002)(41300700001)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 22:58:58.4498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c82918-2970-4362-f33c-08dc02786a76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313

On 11/21/23 09:17, Roger Pau Monné wrote:
> On Thu, Oct 12, 2023 at 10:09:18PM +0000, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
>> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
>> guest's view of this will want to be zero initially, the host having set
>> it to 1 may not easily be overwritten with 0, or else we'd effectively
>> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
>> proper emulation in order to honor host's settings.
>>
>> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
>> Device Control" the reset state of the command register is typically 0,
>> so when assigning a PCI device use 0 as the initial state for the guest's view
>> of the command register.
>>
>> Here is the full list of command register bits with notes about
>> emulation, along with QEMU behavior in the same situation:
>>
>> PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
>> in real device. Instead it is always set to 1.

As far as I can tell QEMU only sets this bit to 1 (in hardware) if it exposes an I/O BAR to the guest.

>> A guest can write to this
>> register, but writes are ignored.

In Xen, I think we should use rsvdp_mask for domUs for now since we don't (yet) support I/O BARs for domUs in vPCI.

>>
>> PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
>> Xen case, we handle writes to this bit by mapping/unmapping BAR
>> regions. For devices assigned to DomUs, memory decoding will be
>> disabled and the initialization.
>>
>> PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
>> writes to this bit.
>>
>> PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
>> access to host bridge that supports software generation of special
>> cycles. In our case guest has no access to host bridges at all. Value
>> after reset is 0. QEMU passes through writes of this bit, we will do
>> the same.
>>
>> PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
>> to be generated. It requires additional configuration via Cacheline
>> Size register. We are not emulating this register right now and we
>> can't expect guest to properly configure it. QEMU "emulates" access to
>> Cachline Size register by ignoring all writes to it. QEMU passes through
>> writes of PCI_COMMAND_INVALIDATE bit, we will do the same.
>>
>> PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
>> through writes of this bit, we will do the same.
>>
>> PCI_COMMAND_PARITY - Controls how device response to parity
>> errors. QEMU ignores writes to this bit, we will do the same.
>>
>> PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
>> through writes of this bit, so we will do the same.

Actually, PCI_COMMAND_WAIT bit is in qemu's res_mask, meaning it only passes through the writes in permissive mode. By default qemu does not pass through writes. PCI LB 3.0 and PCIe 6.1 specifications say devices should hardwire this bit to 0, but that some devices may have implemented it as RW. So I think we should use rsvdp_mask in Xen for this bit.

>>
>> PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
>> writes to this bit, we will do the same.
>>
>> PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
>> transactions. It is configured by firmware, so we don't want guest to
>> control it. QEMU ignores writes to this bit, we will do the same.
>>
>> PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
>> enabled, device is prohibited from asserting INTx as per
>> specification. Value after reset is 0. In QEMU case, it checks of INTx
>> was mapped for a device. If it is not, then guest can't control
>> PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
>> change value of this bit if MSI(X) is enabled.
> 
> FWIW, bits 11-15 are RsvdP, so we will need to add support for them
> after the series from Stewart that adds support for register masks is
> accepted.

I am working on this.

> 
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>> In v10:
>> - Added cf_check attribute to guest_cmd_read
>> - Removed warning about non-zero cmd
>> - Updated comment MSI code regarding disabling INTX
>> - Used ternary operator in vpci_add_register() call
>> - Disable memory decoding for DomUs in init_bars()
>> In v9:
>> - Reworked guest_cmd_read
>> - Added handling for more bits
>> Since v6:
>> - fold guest's logic into cmd_write
>> - implement cmd_read, so we can report emulated INTx state to guests
>> - introduce header->guest_cmd to hold the emulated state of the
>>   PCI_COMMAND register for guests
>> Since v5:
>> - add additional check for MSI-X enabled while altering INTX bit
>> - make sure INTx disabled while guests enable MSI/MSI-X
>> Since v3:
>> - gate more code on CONFIG_HAS_MSI
>> - removed logic for the case when MSI/MSI-X not enabled
>> ---
>>  xen/drivers/vpci/header.c | 44 +++++++++++++++++++++++++++++++++++----
>>  xen/drivers/vpci/msi.c    |  6 ++++++
>>  xen/drivers/vpci/msix.c   |  4 ++++
>>  xen/include/xen/vpci.h    |  3 +++
>>  4 files changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index efce0bc2ae..e8eed6a674 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -501,14 +501,32 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>      return 0;
>>  }
>>  
>> +/* TODO: Add proper emulation for all bits of the command register. */
>>  static void cf_check cmd_write(
>>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>>  {
>>      struct vpci_header *header = data;
>>  
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        const struct vpci *vpci = pdev->vpci;
>> +        uint16_t excluded = PCI_COMMAND_PARITY | PCI_COMMAND_SERR |
>> +            PCI_COMMAND_FAST_BACK;
> 
> You could implement those bits using the RsvdP mask also.

Will do. The rsvdp_mask (in the write path) has already been applied before reaching this handler, so the guest's write value won't propagate to the header->guest_cmd variable. This is okay as long as ...

> 
> You seem to miss PCI_COMMAND_IO?  In the commit message you note that
> writes are ignored, yet here you seem to pass through writes to the
> underlying device (which might be OK, but needs to be coherent with
> the commit message).
> 
>> +
>> +        header->guest_cmd = cmd;
> 
> I'm kind of unsure whether we want to fake the guest view by returning
> what the guest writes.

... we don't provide an emulated view of the additional bits that we're treating as RsvdP. So let's not provide such an emulated/fake view for these bits (for now, at least).

Side note: qemu does provide such an emulated view, using a combination of emu_mask and emulated register variables. Looking at the qemu history, it looks like there may be other registers where we'd likely want to have such an emulated/fake view. So, regardless of whether we want to emulate certain bits in the command register, having the flexibility of a emulated mask/register in vPCI could (eventually) be beneficial (but not as part of this series). I'll make an in-code comment that we may want to re-visit this in the future.

> 
>> +
>> +        if ( (vpci->msi && vpci->msi->enabled) ||
>> +             (vpci->msix && vpci->msi->enabled) )
> 
> The typo that you mentioned about msi vs msix.
> 
>> +            excluded |= PCI_COMMAND_INTX_DISABLE;
>> +
>> +        cmd &= ~excluded;
>> +        cmd |= pci_conf_read16(pdev->sbdf, reg) & excluded;
>> +    }
>> +
>>      /*
>> -     * Let Dom0 play with all the bits directly except for the memory
>> -     * decoding one.
>> +     * Let guest play with all the bits directly except for the memory
>> +     * decoding one. Bits that are not allowed for DomU are already
>> +     * handled above.
> 
> I think this should be: "Let Dom0 play with all the bits directly ..."
> as you mention both Dom0 and DomU.
> 
>>       */
>>      if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
>>          /*
>> @@ -522,6 +540,14 @@ static void cf_check cmd_write(
>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>  }
>>  
>> +static uint32_t cf_check guest_cmd_read(
>> +    const struct pci_dev *pdev, unsigned int reg, void *data)
>> +{
>> +    const struct vpci_header *header = data;
>> +
>> +    return header->guest_cmd;
>> +}
>> +
>>  static void cf_check bar_write(
>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>  {
>> @@ -737,8 +763,9 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      }
>>  
>>      /* Setup a handler for the command register. */
>> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
>> -                           2, header);
>> +    rc = vpci_add_register(pdev->vpci,
>> +                           is_hwdom ? vpci_hw_read16 : guest_cmd_read,
>> +                           cmd_write, PCI_COMMAND, 2, header);
>>      if ( rc )
>>          return rc;
>>  
>> @@ -750,6 +777,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( cmd & PCI_COMMAND_MEMORY )
>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
>>  
>> +    /*
>> +     * Clear PCI_COMMAND_MEMORY for DomUs, so they will always start with
>> +     * memory decoding disabled and to ensure that we will not call modify_bars()
>> +     * at the end of this function.
>> +     */
>> +    if ( !is_hwdom )
>> +        cmd &= ~PCI_COMMAND_MEMORY;
> 
> Just for symmetry I would also disable PCI_COMMAND_IO.
> 
> I do wonder in which states does SeaBIOS or OVMF expects to find the
> devices.
> 
>> +    header->guest_cmd = cmd;
>> +
>>      for ( i = 0; i < num_bars; i++ )
>>      {
>>          uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>> index 2faa54b7ce..0920bd071f 100644
>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -70,6 +70,12 @@ static void cf_check control_write(
>>  
>>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>>              return;
>> +
>> +        /*
>> +         * Make sure guest doesn't enable INTx while enabling MSI.
>> +         */
>> +        if ( !is_hardware_domain(pdev->domain) )
>> +            pci_intx(pdev, false);
>>      }
>>      else
>>          vpci_msi_arch_disable(msi, pdev);
>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> index b6abab47ef..9d0233d0e3 100644
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -97,6 +97,10 @@ static void cf_check control_write(
>>          for ( i = 0; i < msix->max_entries; i++ )
>>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>>                  update_entry(&msix->entries[i], pdev, i);
>> +
>> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
>> +        if ( !is_hardware_domain(pdev->domain) )
>> +            pci_intx(pdev, false);
> 
> Note that if both new_enabled and new_masked are set, you won't get
> inside of this condition, and that could lead to MSIX being enabled
> with INTx set in the command register (albeit with the maskall bit
> set).
> 
> You might have to add a new check before the pci_conf_write16() that
> disables INTx if `new_enabled && !msix->enabled`.
> 
>>      }
>>      else if ( !new_enabled && msix->enabled )
>>      {
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index c5301e284f..60bdc10c13 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -87,6 +87,9 @@ struct vpci {
>>          } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
>>          /* At most 6 BARS + 1 expansion ROM BAR. */
>>  
>> +        /* Guest view of the PCI_COMMAND register. */
> 
> Maybe we want to add '(domU only)' to the comment.
> 
> Thanks, Roger.

