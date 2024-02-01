Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E64845085
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 05:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674221.1049028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVP2Y-0006c3-9M; Thu, 01 Feb 2024 04:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674221.1049028; Thu, 01 Feb 2024 04:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVP2Y-0006Zi-6T; Thu, 01 Feb 2024 04:51:06 +0000
Received: by outflank-mailman (input) for mailman id 674221;
 Thu, 01 Feb 2024 04:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDVG=JK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rVP2X-0006Zb-71
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 04:51:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb4801b-c0bd-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 05:51:01 +0100 (CET)
Received: from PH8PR02CA0020.namprd02.prod.outlook.com (2603:10b6:510:2d0::9)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8; Thu, 1 Feb
 2024 04:50:57 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::22) by PH8PR02CA0020.outlook.office365.com
 (2603:10b6:510:2d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 04:50:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 04:50:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:50:56 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 22:50:55 -0600
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
X-Inumbo-ID: 7eb4801b-c0bd-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIbXHSsvKKbwgnWF8/gmW5lIfPKu8vhpGid9qZlFs+a88X/IieMq8OiwFhHlnelS+PgEnWYum3Qcoa3SzktP2B6GCBxPkhOuRCBo8pfa/GZV9ti+wLQgUSlu0dgtcbw26WTqju04eDz5AB2ePU5bO/8+ubXm86fRGdWiZsqiR9Cj3Eo8LR9klGYQxQIS6zyQoLjUAliQ8JnnGHo7AVUz8kZ8jfGAwwZSAniCXSHmust6uZMWeK1opqFlwB1aAEnN3luD5+C8e80j5ogamundBAnTO+rOI17JN+oZ3pRHRyhtaT501Bb34Rn1YCIiXIRQTvrBAOXlU2EhWorjyVh5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii7bxJk70kAfTZiQJJ3NC2wsY5BfdVr76TAoUdYYDxA=;
 b=QLXRfH3Z/3ZU3Yf9dflSYEd0n5H9XvU/iYzv+YFchIuFcP593y7ExfzxObUSlbiwUsUONEVSXzMMo/md/Ke2VWEEO4UDBCoLkL9DkiTCERB9jk3ewgQnQjIp/OtDBJesT0JO5ZRNYgcn37rfgCL0cwS5N57g8PSCHFcJGCkYsvgW2GN2NHcoCV51ZS6FOHBEv0DsdhjZU555ONqSZ0FGXHcREplpgJDDxbbsdbI/XCrxRiv1ZZOY5sIjkvQ27bB6SByM7Cwevy2UWalMBNkV6v8xnIauTobmL3/kKq+ZeDnMCslXROLXQfDqhsUTuTzlVoGlQSNCxqPnmgdgcP8HDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii7bxJk70kAfTZiQJJ3NC2wsY5BfdVr76TAoUdYYDxA=;
 b=Cj77J2EvHz6DKCZrxppEGXAAK5IHPmptx+4FozOmzTuXWFlc4yuHQcSU904FW2DIckaBVA3Aj8O/6NCsInU+vf6WEFL65SR+RUBTJ04ai1nw9zj+w6GhZUV8UUAHd1v2WwpDuC1GQcQcDppv7u2b1/qnkMiuWRvIpbnlhKbGgbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <48a16cb3-9cb9-4b7d-a950-f190a9a64bc2@amd.com>
Date: Wed, 31 Jan 2024 23:50:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-11-stewart.hildebrand@amd.com>
 <50e79338-b2fd-40e9-b754-4e725e27ceb3@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <50e79338-b2fd-40e9-b754-4e725e27ceb3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: e1056df2-3584-4de1-804f-08dc22e16149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	noopwhAvahLcVlVQN7DyVrhMIWwmcUpbQaEAIZTFLsR4mCgOa/zdZXvq8JcfjW60+rf0wyaQhLqATH6pANyCkMTpYQHVUP69Wsq3ZTiO3+yFbIS6J4Qx2wM1Nka2bfJ7Y/Y0r4Zdv1OdH72zvmzn1T3sYR+mBhoebpIzPT1P44Iyd3lpdpw33p5LUzT6BHn+ecwYaoWKRA7sUmBxvVlC/mRhiCXUjCtS0KSOelhCWiXjC/rvWrICH8/Qqmd3fPYqmtYdWg9RhwJwgwA4m07xjcYii+of6Cvgcfnf/aZ0MHOY74prxNrslcelJHjzHBB2juQZL/i4eRvuQCJsCM0J4RMDd2Nt/bWaj1slWK0icJf0NptURICBSXxPwU34NEW2Z2S6vh0GGBoWbVBvrGDSopSlqr112uyS2SMdmLPBKygWq8fkrCCiFTCnqDM1NrOySqsgyPSq3R0nLs5Sh47UqQAUwZs8Kibm8uK5U2sI7EPFSwNnIPqpgxf/qDTzbPD2yjHAil2QtzEKJPn+1XgfLleepQs5p9UvHg1rlt8IMZto95W11bXouvHqWgAWy/AkfoZ6IHWfWOlBJeXVCtUmufns8/30MeFruxxcBaGM5naYZUA10PxWX2CXiQ51tZ0oWS/rrvTOB46BpLBQcXPr9I7yRKrz5zfSfT9pUv2/JbZcCoiTU3+bKkpwU0CyJwDIMZ/eQif75FdF7c+3ybU7bxM+kEoHamooBtS9mgxJbah4/ftDnm/1ZqoBHFSl7+Fsg25U296dlaiOQ0zTByeEPdOvNObwzOwzT+3ZV3/kdVUOruwkbDP2S+Cc2nnCUI6aWdW51mywp9iRzztWcwKtog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(41300700001)(47076005)(36860700001)(8936002)(44832011)(4326008)(2906002)(8676002)(5660300002)(70206006)(7416002)(31696002)(86362001)(70586007)(36756003)(54906003)(16576012)(81166007)(83380400001)(82740400003)(356005)(6916009)(316002)(53546011)(478600001)(966005)(2616005)(336012)(426003)(40480700001)(40460700003)(26005)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:50:57.4335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1056df2-3584-4de1-804f-08dc22e16149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

On 1/25/24 10:43, Jan Beulich wrote:
> On 09.01.2024 22:51, Stewart Hildebrand wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -168,6 +168,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>      if ( !rom_only )
>>      {
>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>> +        /* Show DomU that we updated P2M */
>> +        header->guest_cmd &= ~PCI_COMMAND_MEMORY;
>> +        header->guest_cmd |= cmd & PCI_COMMAND_MEMORY;
>>          header->bars_mapped = map;
>>      }
> 
> I don't follow what the comment means to say. The bit in question has no
> real connection to the P2M, and the guest also may have no notion of the
> underlying hypervisor's internals. Likely connected to ...

Indeed. If the comment survives to v13, I'll update it to:

        /* Now that we updated P2M, show DomU change to PCI_COMMAND_MEMORY */

> 
>> @@ -524,9 +527,26 @@ static void cf_check cmd_write(
>>  {
>>      struct vpci_header *header = data;
>>  
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        const struct vpci *vpci = pdev->vpci;
>> +
>> +        if ( (vpci->msi && vpci->msi->enabled) ||
>> +             (vpci->msix && vpci->msix->enabled) )
>> +            cmd |= PCI_COMMAND_INTX_DISABLE;
>> +
>> +        /*
>> +         * Do not show change to PCI_COMMAND_MEMORY bit until we finish
>> +         * modifying P2M mappings.
>> +         */
>> +        header->guest_cmd = (cmd & ~PCI_COMMAND_MEMORY) |
>> +                            (header->guest_cmd & PCI_COMMAND_MEMORY);
>> +    }
> 
> ... the comment here, but then shouldn't it be that the guest can't even
> issue a 2nd cfg space access until the present write has been carried out?
> Otherwise I'd be inclined to claim that such a partial update is unlikely
> to be spec-conformant.

Due to the raise_softirq() call added in

  3e568fa9e19c ("vpci: fix deferral of long operations")

my current understanding is: when the guest toggles memory decoding, the guest vcpu doesn't resume execution until vpci_process_pending() and modify_decoding() have finished. So I think the guest should see a consistent state of the register, unless it was trying to read from a different vcpu than the one doing the writing.

Regardless, if the guest did have an opportunity to successfully read the partially updated state of the register, I'm not really spotting what part of the spec that would be a violation of. PCIe 6.1 has this description regarding the bit: "When this bit is Set" and "When this bit is Clear" the device will decode (or not) memory accesses. The spec doesn't seem to distinguish whether the host or the device itself is the one to set/clear the bit. One might even try to argue the opposite: allowing the bit to be toggled before the device reflects the change would be a violation of spec. Since the spec is ambiguous in this regard, I don't think either argument is particularly strong.

Chesterton's fence: the logic for deferring the update of PCI_COMMAND_MEMORY in guest_cmd was added between v10 and v11 of this series. I went back to look at the review comments on v10 [1], but the rationale is still not entirely clear to me. At the end of the day, with the information I have at hand, I suspect it would be fine either way (whether updating guest_cmd is deferred or not). If no other info comes to light, I'm leaning toward not deferring because it would be simpler to update the bit right away in cmd_write().

[1] https://lore.kernel.org/xen-devel/ZVy73iJ3E8nJHvgf@macbook.local/

> 
>> @@ -843,6 +885,15 @@ static int cf_check init_header(struct pci_dev *pdev)
>>      if ( cmd & PCI_COMMAND_MEMORY )
>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
>>  
>> +    /*
>> +     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
>> +     * always start with memory decoding disabled and to ensure that we will not
>> +     * call modify_bars() at the end of this function.
>> +     */
>> +    if ( !is_hwdom )
>> +        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
>> +    header->guest_cmd = cmd;
> 
> With PCI_COMMAND_MEMORY clear, the hw reg won't further be written on the
> success return path. Yet wouldn't we better clear PCI_COMMAND_IO also in
> hardware (until we properly support it)?

Yes, I'll clear PCI_COMMAND_IO in hardware too

> 
> I also think the insertion point for the new code isn't well chosen: The
> comment just out of context indicates that the code in context above is
> connected to the subsequent code. Whereas the addition is not.

I'll rearrange it

> 
>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -70,6 +70,15 @@ static void cf_check control_write(
>>  
>>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>>              return;
>> +
>> +        /*
>> +         * Make sure domU doesn't enable INTx while enabling MSI.
>> +         */
> 
> Nit: This ought to be a single line comment, just like ...

OK, I'll make it a single line

> 
>> +        if ( !is_hardware_domain(pdev->domain) )
>> +        {
>> +            pci_intx(pdev, false);
>> +            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
>> +        }
>>      }
>>      else
>>          vpci_msi_arch_disable(msi, pdev);
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -135,6 +135,13 @@ static void cf_check control_write(
>>          }
>>      }
>>  
>> +    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
>> +    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
>> +    {
>> +        pci_intx(pdev, false);
>> +        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
>> +    }
> 
> ... the similar code here has it.
> 
> In both cases, is it really appropriate to set the bit in guest view?

I added this based on Roger's comment at [2]. Roger, what do you think? I don't believe QEMU updates the guest view in this manner.

[2] https://lore.kernel.org/xen-devel/ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local/

