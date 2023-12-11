Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B280DAD2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 20:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652507.1018393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClt5-0000Al-6q; Mon, 11 Dec 2023 19:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652507.1018393; Mon, 11 Dec 2023 19:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClt5-00007j-3W; Mon, 11 Dec 2023 19:24:19 +0000
Received: by outflank-mailman (input) for mailman id 652507;
 Mon, 11 Dec 2023 19:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zcs4=HW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rClt4-00007d-7Y
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 19:24:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddec29bf-985a-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 20:24:14 +0100 (CET)
Received: from DM6PR07CA0116.namprd07.prod.outlook.com (2603:10b6:5:330::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:24:10 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::6) by DM6PR07CA0116.outlook.office365.com
 (2603:10b6:5:330::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Mon, 11 Dec 2023 19:24:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 19:24:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 13:24:10 -0600
Received: from [172.27.174.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 11 Dec 2023 13:24:09 -0600
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
X-Inumbo-ID: ddec29bf-985a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNc2CJ6EdKmnjycIWpOw4rGYl1d9KJIXxehYgrIaRf4i4ahpbmiPMraRavAA70N4wxIp7OYERyhQ4CpSB0pnUB8/V05YhI2soM9BDqh/F8BIsx1xsBD/mlAfMq6op7n25IzrQutXaypVm1SOWIjZidiSJwm1MuuFRQXlwdhbMXCJ+xiYuD1gtG/zEaqCyOzr/sbaZ7lP5HDS318ACJPW5rL2C8HVnuAZgZWcq+i+WQTqqwuqKZm0iiAYYRKm/MzGTARz7TyZUIAxXya697vLwq1gEPh3qPHoCACZwoOiF0ExSy8oDoIWLNhyVpR91w0kX1BisfLNjfquQXNK0Ma3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/cKIi6ylbISZGHYXDyEq2YiEkA7ShrGAbD3/GG60vQ=;
 b=EizNXBAxxmeB7FLrXEEUkFtprFbtunIECzHcsHfIkHzkodhc5dN1ZIQ27FroToNjfsztAzMU4amwjghmX5gZIqgmpGG8XyiwVci6yn0pcnYyltrX2evAtdgDN/8AzD/MuDmXA+m+5OBCQVJvPmi2wxurYIqR5Tjtpp08n0+XNN/Qc/JaMo3g7Cn4s26nFbyVABiqFAs0ACCd0RuPVjGQQhTMF/2NknjSAuReIVbHOv9qFYmQzTR5lSMY1V2eTddDSSDNoSAa2/Ucs+NaOz5RpmlCZ3szQg0poxQr1O7cAXN4868psq2T+eE967So51m/H7TMYbbRaZQi4NzLy4Jm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/cKIi6ylbISZGHYXDyEq2YiEkA7ShrGAbD3/GG60vQ=;
 b=V5Cl+lrLxGYsNeD0dvQUA4w6AgBJoBsdxmViJNsiVfPoXXWMPNEdkD3UMocx52xLUD2E06KVJr911Paz51wCUwr+xRHu0iIJ1LHxiPokSqGt+avDqhhxxzJC/VUrebKL2fkJj+E05+ZCLFuwXdIhJmt3SK56LCCCw3oCbhJLKR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7de40956-8240-4e8a-9663-d205efb6c0c4@amd.com>
Date: Mon, 11 Dec 2023 14:24:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pci: fix phantom error path in assign_device()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20231211150520.299768-1-stewart.hildebrand@amd.com>
 <6d39c8d1-36d4-471e-8d12-d7ff11b90a88@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6d39c8d1-36d4-471e-8d12-d7ff11b90a88@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e295e6-6fdc-4dd6-cf84-08dbfa7ec0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BDuMeM6LOLY6p3DIQCljg95+l+JTtlss5AHwiGwqxbJ3rwwKnTwIlMi8e3k4y7FBWGnXeA7VqNL9CLO808IjDMVehud6p6Ki/aXa1aYizZm+GffpyUhlqrEACIVG5jXhhpn57Jc4F74MdT7P6I3OCDWWHnaVLnboobYtbNpLrsJ8NU3jRCJS5xr12VmNW6bLvnmyZQdSNLECqhKcWdJ0R2nqjL0n8+QUIOoVREYSnvRpFjmCN2IJSLUwswpdWxQ9yd2hvRaI/JdSjgmLMlUaEAJFb6I2fhfwKriQeFzQ/4/QKaM9n/heU3XCop2f6a5mcC/ddw0gdKLab3ZefOnxGaGlfv2K19DwVFhdzNrxNBmzH2nF1/OWDMHnk71i7fcw1EUaGwcljAyGaR9QPgkYdIpHUWsZXlxMXx0mdf+yYu1qa3KCLZ1N93tZ7d8nFKqtXOZT6pi8HBMAORWP3Y9BzaFuoOpzIr5zSnQsE4oKIqOK/ABepmDX8Nyv9Z/1tfkWus5d+sIJWD7+3vdSYzTYe2gbufvrAdJbhDJZVgQX5J2TkUAk2LNcl9yiu6Yr9WrCUnqEXFw/9PL8p4sN48JemK4xGyDJNZ94k5M1/FsmR4yJs2/RqCe5Dp1igC12LDzXpK43/IfJw9mtdkR0egx7tioWP8pC5alPczIIyCdPZhKagkRAnNFlEh+P8xNwrfISfWL1zNAIPk4Uo5014ySFQBxHePOKZjpjZn3uZMn9caFqcedqS3blMYWCJ4iJ14jca4Fe1VAIgtR99TlCc6QPZ2vUmwEKzutQfssvmwoqm9wMq6eGk9Tzo3+NrMWbBBk45IIoXws0GsQUiWe91gmCAvy+i/FpRzAEs+mGw2wDXjQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(36756003)(31686004)(40460700003)(53546011)(26005)(70586007)(478600001)(8936002)(4326008)(8676002)(6916009)(16576012)(70206006)(54906003)(316002)(2616005)(2906002)(47076005)(426003)(336012)(36860700001)(41300700001)(5660300002)(44832011)(356005)(83380400001)(82740400003)(81166007)(31696002)(86362001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:24:10.7060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e295e6-6fdc-4dd6-cf84-08dbfa7ec0a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313

On 12/11/23 11:21, Jan Beulich wrote:
> On 11.12.2023 16:05, Stewart Hildebrand wrote:
>> Currently if an iommu_call() for a phantom function fails, there is no
>> indication of the failure. Propagate (but don't return) the error code
>> from the most recently failed iommu_call() and emit a warning. While
>> here, add a comment to clarify that the loop keeps iterating even when
>> failure is encountered.
>>
>> Fixes: cd7dedad8209 ("passthrough: simplify locking and logging")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Unlike assign_device(), deassign_device() breaks out of the phantom loop
>> when a failure is encountered and returns the error code. I'm curious
>> why assign_device() and deassign_device() behave differently? It looks
>> like it's been that way since
>> 4e9950dc1bd2 ("IOMMU: add phantom function support"). I was initially
>> inclined to break out of the loop and return the error code in
>> assign_device(), but adhering to the principle of Chesterton's fence,
>> I'd first like to understand why this is not currently being done.
> 
> It's been a long time, but seeing the same pattern for add/remove I think
> the idea was that a device may still work with its phantom functions not
> properly mapped in the IOMMU, whereas failure to unmap means a domain may
> retain (partial) access to a device.

Thanks for the info. I'll add something about this to the in-code comment (see below).

> 
>> I'm aware that I could have avoided introducing a tmp local variable by
>> using the conditional operator with omitted middle operand:
>>
>>     rc_nonfatal = iommu_call(...) ?: rc_nonfatal;
>>
>> However, I explicitly chose not to do this to avoid relying on a GNU
>> extension in yet another place.
> 
> Introducing a helper variable is certainly okay, if you think that's
> better. However, in cases like ...
> 
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1407,7 +1407,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>  {
>>      const struct domain_iommu *hd = dom_iommu(d);
>>      struct pci_dev *pdev;
>> -    int rc = 0;
>> +    int rc = 0, rc_nonfatal = 0;
>>  
>>      if ( !is_iommu_enabled(d) )
>>          return 0;
>> @@ -1443,21 +1443,28 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>                            pci_to_dev(pdev), flag)) )
>>          goto done;
>>  
>> -    for ( ; pdev->phantom_stride; rc = 0 )
>> +    while ( pdev->phantom_stride )
>>      {
>> +        int tmp;
>> +
>>          devfn += pdev->phantom_stride;
>>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>> +        {
>> +            devfn -= pdev->phantom_stride; /* Adjust for printing */
>>              break;
>> +        }
>> -        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>> -                        pci_to_dev(pdev), flag);
>> +        tmp = iommu_call(hd->platform_ops, assign_device, d, devfn,
>> +                         pci_to_dev(pdev), flag);
>> +        rc_nonfatal = tmp ? tmp : rc_nonfatal;
> 
> ... this, I'm relatively certain most maintainers would agree that using
> the extension will yield easier to read code. Plus there's no reason to
> avoid extensions we use widely anyway, as long as there's no (reasonably
> neat) way to express the same without using extensions.

OK, I'll use the extension.

> 
> Jan
> 
>> +        /* Keep iterating even if the iommu call failed. */

I'll change this in-code comment to:

        /*
         * Keep going in case of iommu_call failure for phantom functions. The
         * device may still be usable without phantom functions mapped in the
         * IOMMU.
         */

>>      }
>>  
>>   done:
>> -    if ( rc )
>> +    if ( rc || rc_nonfatal )
>>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
>> -               d, &PCI_SBDF(seg, bus, devfn), rc);
>> +               d, &PCI_SBDF(seg, bus, devfn), rc ? rc : rc_nonfatal);
>>      /* The device is assigned to dom_io so mark it as quarantined */
>> -    else if ( d == dom_io )
>> +    if ( !rc && d == dom_io )
>>          pdev->quarantine = true;
>>  
>>      return rc;
>>
>> base-commit: 1403131596fa77663708f6baa0fee8bf7b95eb5a
> 

